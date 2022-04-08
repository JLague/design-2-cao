classdef cao < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        FichierMenu                    matlab.ui.container.Menu
        ImportItem                     matlab.ui.container.Menu
        FichierdeconfigurationMenu     matlab.ui.container.Menu
        ImportResSim                   matlab.ui.container.Menu
        ExportItem                     matlab.ui.container.Menu
        ConfigurationcouranteMenu      matlab.ui.container.Menu
        ExportResSim                   matlab.ui.container.Menu
        TabGroup                       matlab.ui.container.TabGroup
        ParamtrescodebarresTab         matlab.ui.container.Tab
        DfinitiondesanglesLabel        matlab.ui.control.Label
        ParamtresPanel                 matlab.ui.container.Panel
        Angleducodebarresautourdey_cdegEditField  matlab.ui.control.NumericEditField
        Angleducodebarresautourdey_cdegEditFieldLabel  matlab.ui.control.Label
        DistancezducodebarrescmEditField  matlab.ui.control.NumericEditField
        DistancezducodebarrescmEditFieldLabel  matlab.ui.control.Label
        DistancexducodebarrescmEditField  matlab.ui.control.NumericEditField
        DistancexducodebarrescmEditFieldLabel  matlab.ui.control.Label
        Angleducodebarresautourdez_cdegEditField  matlab.ui.control.NumericEditField
        AnglehorizontalducodebarresdegrsLabel  matlab.ui.control.Label
        RflectivitdelasurfaceSlider_2  matlab.ui.control.Slider
        RflectivitdelasurfaceSlider_2Label  matlab.ui.control.Label
        Angleducodebarresautourdexphi_cdegEditField  matlab.ui.control.NumericEditField
        Angleverticalducodebarres_cdegLabel  matlab.ui.control.Label
        RayondecourburecmLabel         matlab.ui.control.Label
        RayondecourburecmEditField_2   matlab.ui.control.NumericEditField
        Image_3                        matlab.ui.control.Image
        SimulationTab                  matlab.ui.container.Tab
        CircuittransimpdanceetcomparateurPanel  matlab.ui.container.Panel
        GaindelaphotodiodeAWEditField  matlab.ui.control.NumericEditField
        GaindelaphotodiodeAWEditFieldLabel  matlab.ui.control.Label
        FrquencedecoupurefiltresphotodiodeHzEditField  matlab.ui.control.NumericEditField
        FrquencedecoupurefiltresphotodiodeHzLabel  matlab.ui.control.Label
        LaserPanel                     matlab.ui.container.Panel
        PuissancedufaisceauI_0mWEditField  matlab.ui.control.NumericEditField
        PuissancedufaisceauI_0mWEditFieldLabel  matlab.ui.control.Label
        Tailledufaisceaulaserw_0cmEditField  matlab.ui.control.NumericEditField
        Tailledufaisceaulaserw_0cmEditFieldLabel  matlab.ui.control.Label
        ActiverlanimationButton        matlab.ui.control.StateButton
        TempsdesimulationsSlider       matlab.ui.control.Slider
        TempsdesimulationsSliderLabel  matlab.ui.control.Label
        TempsdelectureEditField        matlab.ui.control.NumericEditField
        TempsdelectureEditFieldLabel   matlab.ui.control.Label
        InsrerlecodebarresvirguleEditField  matlab.ui.control.EditField
        InsrerlecodebarresvirguleEditFieldLabel  matlab.ui.control.Label
        GalvanomtrePanel               matlab.ui.container.Panel
        ConstantedecoupleK_TEditField  matlab.ui.control.NumericEditField
        ConstantedecoupleK_TLabel      matlab.ui.control.Label
        CoeffdinertiedusystmeJ_sEditField  matlab.ui.control.NumericEditField
        CoeffdinertiedusystmeJ_sEditFieldLabel  matlab.ui.control.Label
        AmplitudedelasourceEditField   matlab.ui.control.NumericEditField
        AmplitudedelasourceLabel       matlab.ui.control.Label
        FrquencedelasourceradsEditField  matlab.ui.control.NumericEditField
        FrquencedelasourceLabel        matlab.ui.control.Label
        CoeffdefrottementdusystmeF_sEditField  matlab.ui.control.NumericEditField
        CoeffdefrottementdugalvoLabel  matlab.ui.control.Label
        DmarrerlasimulationButton      matlab.ui.control.Button
        Image                          matlab.ui.control.Image
        VisualisationTab               matlab.ui.container.Tab
        TabGroup2                      matlab.ui.container.TabGroup
        PhotodiodebrutTab              matlab.ui.container.Tab
        Image_4                        matlab.ui.control.Image
        CacherlessignauxPanel          matlab.ui.container.Panel
        AprsbruitdelectureButton       matlab.ui.control.StateButton
        AprsbruitlumineuxButton        matlab.ui.control.StateButton
        PrphotodiodeButton             matlab.ui.control.StateButton
        UIAxesPhotoRaw                 matlab.ui.control.UIAxes
        PhotodiodetraitTab             matlab.ui.container.Tab
        Image_5                        matlab.ui.control.Image
        CacherlessignauxPanel_2        matlab.ui.container.Panel
        SortietransimpdanceButton      matlab.ui.control.StateButton
        PrdiffrentielButton            matlab.ui.control.StateButton
        SortieversArduinoButton        matlab.ui.control.StateButton
        AprsdiffrentielButton          matlab.ui.control.StateButton
        UIAxesPhoto                    matlab.ui.control.UIAxes
        GalvanomtresTab                matlab.ui.container.Tab
        Image_6                        matlab.ui.control.Image
        CacherlessignauxPanel_3        matlab.ui.container.Panel
        CommandeButton                 matlab.ui.control.StateButton
        ConsigneButton                 matlab.ui.control.StateButton
        UIAxesGalvo                    matlab.ui.control.UIAxes
        Image_2                        matlab.ui.control.Image
        FactureTab                     matlab.ui.container.Tab
        ViderlafactureButton           matlab.ui.control.Button
        ImporterunefactureButton       matlab.ui.control.Button
        SauvegarderlafactureButton     matlab.ui.control.Button
        AjoutmanueldarticlesButton     matlab.ui.control.Button
        AjoutmanuelEditField           matlab.ui.control.EditField
        DerniercodebarresluEditField   matlab.ui.control.EditField
        DerniercodebarresluLabel       matlab.ui.control.Label
        TotalEditField                 matlab.ui.control.NumericEditField
        TotalLabel                     matlab.ui.control.Label
        UITable                        matlab.ui.control.Table
    end

    
    properties (Access = private)
        variables = {'dx_c', 'dz_c',"freq","filtre", "amp","phi_c", 'alpha_c',"theta_c","courbure","ref", 'barres', 'J_s',"F_s", "I_0", "w_0", 'photod', 'couple'}
        t % facture de base
        total % coût total
        Clock1
        Clock2
        temps % temps écoulé
        PhotoRawPlot
        PhotoBruitLumPlot
        PhotoBruitLectPlot
        PhotoTransPlot
        PhotoPreDiffPlot
        PhotoDiffPlot
        PhotoSortiePlot
        ConsignePlot
        CommandePlot
        plots = {'PhotoRawPlot', 'PhotoBruitLumPlot', 'PhotoBruitLectPlot', 'PhotoTransPlot', 'PhotoPreDiffPlot', 'PhotoDiffPlot', 'PhotoSortiePlot', 'ConsignePlot', 'CommandePlot'}
        dbtable % DB Table
        bip
        samplerate
    end

    methods (Access = private)
        function WriteVarsToWorkspace(app,ws)
            assignin(ws, "dx_c",app.DistancexducodebarrescmEditField.Value);
            assignin(ws, "dz_c",app.DistancezducodebarrescmEditField.Value);
            assignin(ws, "alpha_c",app.Angleducodebarresautourdey_cdegEditField.Value);
            assignin(ws, "theta_c",app.Angleducodebarresautourdez_cdegEditField.Value);
            assignin(ws, "phi_c",app.Angleducodebarresautourdexphi_cdegEditField.Value);
            assignin(ws, "J_s",app.CoeffdinertiedusystmeJ_sEditField.Value);
            assignin(ws, "F_s",app.CoeffdefrottementdusystmeF_sEditField.Value);
            assignin(ws, "I_0",app.PuissancedufaisceauI_0mWEditField.Value);
            assignin(ws, "w_0", app.Tailledufaisceaulaserw_0cmEditField.Value);
            assignin(ws,"ref", app.RflectivitdelasurfaceSlider_2.Value);
            assignin(ws,"courbure", app.RayondecourburecmEditField_2.Value);
            assignin(ws,"amp", app.AmplitudedelasourceEditField.Value);
            assignin(ws,"freq", app.FrquencedelasourceradsEditField.Value);
            assignin(ws,"barres", app.InsrerlecodebarresvirguleEditField.Value);
            assignin(ws,"filtre", app.FrquencedecoupurefiltresphotodiodeHzEditField.Value);
            assignin(ws,"photod", app.GaindelaphotodiodeAWEditField.Value);
            assignin(ws,"couple", app.ConstantedecoupleK_TEditField.Value);
        end
        
        function ReadVarsFromNamespace(app,ns)
            app.DistancexducodebarrescmEditField.Value = ns.dx_c;
            app.DistancezducodebarrescmEditField.Value = ns.dz_c;
            app.InsrerlecodebarresvirguleEditField.Value = ns.barres;
            app.CoeffdinertiedusystmeJ_sEditField.Value = ns.J_s;
            app.CoeffdefrottementdusystmeF_sEditField.Value = ns.F_s;
            app.PuissancedufaisceauI_0mWEditField.Value = ns.I_0;
            app.Tailledufaisceaulaserw_0cmEditField.Value = ns.w_0;
            app.Angleducodebarresautourdez_cdegEditField.Value = ns.theta_c;
            app.Angleducodebarresautourdey_cdegEditField.Value = ns.alpha_c;
            app.Angleducodebarresautourdexphi_cdegEditField.Value = ns.phi_c;
            app.RayondecourburecmEditField_2.Value = ns.courbure;
            app.RflectivitdelasurfaceSlider_2.Value = ns.ref;
            app.FrquencedelasourceradsEditField.Value = ns.freq;
            app.AmplitudedelasourceEditField.Value = ns.amp;
            app.FrquencedecoupurefiltresphotodiodeHzEditField.Value = ns.filtre;
            app.GaindelaphotodiodeAWEditField.Value = ns.photod;
            app.ConstantedecoupleK_TEditField.Value = ns.couple;
        end
        
        function DisplayGraphs(app,simOut)
            % Get photodiode raw data
            PhotoRaw = simOut.ScopePhotoRaw{1}.Values.Data;
            PhotoBruitLum = simOut.ScopePhotoRaw{2}.Values.Data;
            PhotoBruitLect = simOut.ScopePhotoRaw{3}.Values.Data;
            PhotoRawTime = simOut.ScopePhoto{1}.Values.Time;

            % Get photodiode data
            PhotoTrans = simOut.ScopePhotoRaw{4}.Values.Data;
            PhotoPreDiff = simOut.ScopeDiff{2}.Values.Data;
            PhotoDiff = simOut.ScopeDiff{1}.Values.Data;
            PhotoSortie = simOut.ScopePhoto{1}.Values.Data;
            PhotoDiffTime = simOut.ScopeDiff{1}.Values.Time;
            PhotoSortieTime = simOut.ScopePhoto{1}.Values.Time;

            % Get galvo data
            GalvoConsigne = simOut.ScopeGalvo{2}.Values.Data;
            GalvoCommande = simOut.ScopeGalvo{1}.Values.Data;
            GalvoTime = simOut.ScopeGalvo{1}.Values.Time;
            
            % Plot photodiode raw data
            app.PhotoRawPlot = plot(app.UIAxesPhotoRaw, PhotoRawTime, PhotoRaw);
            hold(app.UIAxesPhotoRaw, 'on')
            app.PhotoBruitLumPlot = plot(app.UIAxesPhotoRaw, PhotoRawTime, PhotoBruitLum);
            app.PhotoBruitLectPlot = plot(app.UIAxesPhotoRaw, PhotoRawTime, PhotoBruitLect);
            legend(app.UIAxesPhotoRaw, 'Pré-photodiode','Après bruit lumineux', 'Après bruit de lecture')
            hold(app.UIAxesPhotoRaw, 'off')

            % Plot photodiode data
            app.PhotoTransPlot = plot(app.UIAxesPhoto, PhotoDiffTime, PhotoTrans);
            hold(app.UIAxesPhoto, 'on')
            app.PhotoPreDiffPlot = plot(app.UIAxesPhoto, PhotoDiffTime, PhotoPreDiff);
            app.PhotoDiffPlot = plot(app.UIAxesPhoto, PhotoDiffTime, PhotoDiff);
            app.PhotoSortiePlot = plot(app.UIAxesPhoto, PhotoSortieTime, PhotoSortie);
            legend(app.UIAxesPhoto, 'Sortie transimpédance', 'Pré-différentiel','Après différentiel','Sortie (vers Arduino)')
            hold(app.UIAxesPhoto, 'off')

            % Plot galvo data
            app.ConsignePlot = plot(app.UIAxesGalvo, GalvoTime, GalvoConsigne);
            hold(app.UIAxesGalvo, 'on')
            app.CommandePlot = plot(app.UIAxesGalvo, GalvoTime, GalvoCommande);
            legend(app.UIAxesGalvo, 'Consigne','Commande')
            hold(app.UIAxesGalvo, 'off')

            % Update visibility
            PrphotodiodeButtonValueChanged(app, 0)
            AprsbruitlumineuxButtonValueChanged(app, 0)
            AprsbruitdelectureButtonValueChanged(app, 0)
            SortietransimpdanceButtonValueChanged(app, 0)
            PrdiffrentielButtonValueChanged(app, 0)
            AprsdiffrentielButtonValueChanged(app, 0)
            SortieversArduinoButtonValueChanged(app, 0)
            ConsigneButtonValueChanged(app, 0)
            CommandeButtonValueChanged(app, 0)
        end
        
        function ReadPlots(app,ns)
            % Clear current axes
            cla(app.UIAxesPhotoRaw)
            cla(app.UIAxesPhoto)
            cla(app.UIAxesGalvo)
            
            % Delete old legends
            legend(app.UIAxesPhotoRaw, 'off')
            legend(app.UIAxesPhoto, 'off')
            legend(app.UIAxesGalvo, 'off')

            % Plot data on axes
            app.PhotoRawPlot = copyobj(ns.PhotoRawPlot, app.UIAxesPhotoRaw);
            app.PhotoBruitLumPlot = copyobj(ns.PhotoBruitLumPlot, app.UIAxesPhotoRaw);
            app.PhotoBruitLectPlot = copyobj(ns.PhotoBruitLectPlot, app.UIAxesPhotoRaw);
            app.PhotoTransPlot = copyobj(ns.PhotoTransPlot, app.UIAxesPhoto);
            app.PhotoPreDiffPlot = copyobj(ns.PhotoPreDiffPlot, app.UIAxesPhoto);
            app.PhotoDiffPlot = copyobj(ns.PhotoDiffPlot, app.UIAxesPhoto);
            app.PhotoSortiePlot = copyobj(ns.PhotoSortiePlot, app.UIAxesPhoto);
            app.ConsignePlot = copyobj(ns.ConsignePlot, app.UIAxesGalvo);
            app.CommandePlot = copyobj(ns.CommandePlot, app.UIAxesGalvo);
            
            % Set new legends
            legend(app.UIAxesPhotoRaw, 'Pré-photodiode','Après bruit lumineux', 'Après bruit de lecture')
            legend(app.UIAxesPhoto, 'Sortie transimpédance', 'Pré-différentiel','Après différentiel','Sortie (vers Arduino)')
            legend(app.UIAxesGalvo, 'Consigne','Commande')
        end
        
        function WritePlots(app,filepath)
            PhotoRawPlot = app.PhotoRawPlot;
            PhotoBruitLumPlot = app.PhotoBruitLumPlot;
            PhotoBruitLectPlot = app.PhotoBruitLectPlot;
            PhotoTransPlot = app.PhotoTransPlot;
            PhotoPreDiffPlot = app.PhotoPreDiffPlot;
            PhotoDiffPlot = app.PhotoDiffPlot;
            PhotoSortiePlot = app.PhotoSortiePlot;
            ConsignePlot = app.ConsignePlot;
            CommandePlot = app.CommandePlot;
            save(filepath, app.plots{:})
        end
        
        function row = GetDBRow(app,code)
            codeNum = str2double(strrep(code, ' ', ''));
            row = app.dbtable(ismember(app.dbtable.upc, codeNum),:);
            row(:,1)=[];
        end

        function LoadData(app)
            [app.bip, app.samplerate] = audioread('data/bip.mp3');
            app.dbtable = readtable('data/upcPrice.csv');
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function: DmarrerlasimulationButton, UITable
        function DmarrerlasimulationButtonPushed(app, ~)
            CODE=str2num(app.InsrerlecodebarresvirguleEditField.Value);
            assignin("base", "AnimActive", app.ActiverlanimationButton.Value)
            assignin("base","CODE",CODE);
            imp=0;
            for i=1:2:11
            val=CODE(i);
            imp=imp+val;
            end
            mult = 3*imp;
            pair=0;
            for i=2:2:10
                val=CODE(i);
               pair = pair+val;
            end
            tot = mult + pair;
            tot = mod(tot,10);
            if tot ~=0
                tot =10-tot;
            end
            if (size(CODE,2) ~= 12) || (tot ~= CODE(12))
                errordlg('Code-barres non valide','Erreur code-barres');
                return
            end
            WriteVarsToWorkspace(app, 'base');
            app.Clock1 = clock;
            simOut=sim("Frame.slx", "StopTime",num2str(app.TempsdesimulationsSlider.Value));
            close(findall(0,'type','figure','name','Animation de la simulation'))
            DisplayGraphs(app,simOut);
            code=simOut.code;

            if isa(code, 'embedded.fi')
                code = storedIntegerToDouble(code);
            end

            code=transpose(code);
            for i=1:length(code)
                if i+8 > length(code)
                    break
                end
                if code(i:i+8)==0
                code(i:i+8)=5;
                end
            end
            for i=1:(100)
                code=[code;code(1,:)];
            end
            for i=210:300:length(code)
                if i+300 > length(code)
                    break
                end
                code1= code(:,i:i+300);
                pas=((i-200)/300)+1;
                   name = ['code' num2str(pas) '.png'];
                    saveas(imshow(code1),name);
                I = imread(name);
                msg = readBarcode(I);
                
                if strlength(msg)==12
                    break
                end
            end

            lecture=strcat("0", msg);
            assignin("base","lecture", lecture)
            
            row = GetDBRow(app,lecture);
            assignin("base","row",row)
    
            app.Clock2 = clock;
            app.temps = etime(app.Clock2,app.Clock1);
            app.TempsdelectureEditField.Value = app.temps;
    
            if strlength(lecture)==13
                sound(app.bip,app.samplerate)
                
                app.UITable.Data = [app.t;row];
                app.t=app.UITable.Data;
                app.DerniercodebarresluEditField.Value = lecture;
        
                app.total = app.TotalEditField.Value;
                app.TotalEditField.Value =app.total + row.prix;
                app.total = app.TotalEditField.Value;
            end
        end

        % Menu selected function: ConfigurationcouranteMenu
        function ExportItemMenuSelected(app, ~)
            [file,path] = uiputfile('*.mat');
            if ~isequal(file,0)
                WriteVarsToWorkspace(app, 'caller');
                filepath = fullfile(path,file);
                save(filepath, app.variables{:});
            end
        end

        % Menu selected function: FichierdeconfigurationMenu
        function ImportItemMenuSelected(app, ~)
            [file,path] = uigetfile('*.mat');
            if ~isequal(file,0)
                filepath = fullfile(path,file);
                ns = load(filepath, app.variables{:});
                ReadVarsFromNamespace(app,ns);
            end
        end

        % Button pushed function: AjoutmanueldarticlesButton
        function AjoutmanueldarticlesButtonPushed(app, ~)
        lecture=app.AjoutmanuelEditField.Value;
        assignin("base","lecture",lecture);
        
        row = GetDBRow(app,lecture);
        assignin("base","row",row)
        app.UITable.Data = [app.t;row];
        app.t=app.UITable.Data;
        app.DerniercodebarresluEditField.Value = lecture;

        app.total = app.TotalEditField.Value;
        app.TotalEditField.Value = app.total + row.prix;
        app.total = app.TotalEditField.Value;
        sound(app.bip,app.samplerate)
        end

        % Value changed function: PrphotodiodeButton
        function PrphotodiodeButtonValueChanged(app, ~)
            value = app.PrphotodiodeButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoRawPlot, 'Visible', visible)
        end

        % Value changed function: AprsbruitlumineuxButton
        function AprsbruitlumineuxButtonValueChanged(app, ~)
            value = app.AprsbruitlumineuxButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoBruitLumPlot, 'Visible', visible)
        end

        % Button pushed function: SauvegarderlafactureButton
        function SauvegarderlafactureButtonPushed(app, ~)
            [file,path] = uiputfile('*.csv');
            if ~isequal(file,0)
                filepath = fullfile(path,file);
                writetable(app.UITable.Data, filepath)
            end
        end

        % Button pushed function: ImporterunefactureButton
        function ImporterunefactureButtonPushed(app, ~)
            [file,path] = uigetfile('*.csv');
            if ~isequal(file,0)
                filepath = fullfile(path,file);
                T = readtable(filepath);
                app.total = 0;
                for row = 1:size(T, 1)
                    app.total = app.total + T{1,3};
                end
                app.TotalEditField.Value = app.total;
                app.UITable.Data = T;
            end
        end

        % Value changed function: AprsbruitdelectureButton
        function AprsbruitdelectureButtonValueChanged(app, ~)
            value = app.AprsbruitdelectureButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoBruitLectPlot, 'Visible', visible)
        end

        % Value changed function: AprsdiffrentielButton
        function AprsdiffrentielButtonValueChanged(app, ~)
            value = app.AprsdiffrentielButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoDiffPlot, 'Visible', visible)
        end

        % Value changed function: SortieversArduinoButton
        function SortieversArduinoButtonValueChanged(app, ~)
            value = app.SortieversArduinoButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoSortiePlot, 'Visible', visible)
        end

        % Value changed function: ConsigneButton
        function ConsigneButtonValueChanged(app, ~)
            value = app.ConsigneButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.ConsignePlot, 'Visible', visible)
        end

        % Value changed function: CommandeButton
        function CommandeButtonValueChanged(app, ~)
            value = app.CommandeButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.CommandePlot, 'Visible', visible)
        end

        % Value changed function: PrdiffrentielButton
        function PrdiffrentielButtonValueChanged(app, ~)
            value = app.PrdiffrentielButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoPreDiffPlot, 'Visible', visible)
        end

        % Menu selected function: ImportResSim
        function ImportResSimSelected(app, ~)
            [file,path] = uigetfile('*.mat');
            if ~isequal(file,0)
                filepath = fullfile(path,file);
                ns = load(filepath, app.plots{:});
                ReadPlots(app,ns)
                app.TabGroup.SelectedTab = app.VisualisationTab;
            end
        end

        % Menu selected function: ExportResSim
        function ExportResSimMenuSelected(app, ~)
            [file,path] = uiputfile('*.mat');
            if ~isequal(file,0)
                filepath = fullfile(path,file);
                WritePlots(app,filepath)
            end
        end

        % Value changed function: SortietransimpdanceButton
        function SortietransimpdanceButtonValueChanged(app, ~)
            value = app.SortietransimpdanceButton.Value;
            visible = 'on';
            if isequal(value, 1)
                visible = 'off';
            end
            set(app.PhotoTransPlot, 'Visible', visible)
        end

        % Button pushed function: ViderlafactureButton
        function ViderlafactureButtonPushed(app, ~)
            app.t = {};
            app.UITable.Data = {};
            app.total = 0;
            app.TotalEditField.Value = 0;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 697 446];
            app.UIFigure.Name = 'MATLAB App';

            % Create FichierMenu
            app.FichierMenu = uimenu(app.UIFigure);
            app.FichierMenu.Text = 'Fichier';

            % Create ImportItem
            app.ImportItem = uimenu(app.FichierMenu);
            app.ImportItem.Text = 'Importer';

            % Create FichierdeconfigurationMenu
            app.FichierdeconfigurationMenu = uimenu(app.ImportItem);
            app.FichierdeconfigurationMenu.MenuSelectedFcn = createCallbackFcn(app, @ImportItemMenuSelected, true);
            app.FichierdeconfigurationMenu.Text = 'Fichier de configuration';

            % Create ImportResSim
            app.ImportResSim = uimenu(app.ImportItem);
            app.ImportResSim.MenuSelectedFcn = createCallbackFcn(app, @ImportResSimSelected, true);
            app.ImportResSim.Text = 'Résultats de simulation';

            % Create ExportItem
            app.ExportItem = uimenu(app.FichierMenu);
            app.ExportItem.Text = 'Exporter';

            % Create ConfigurationcouranteMenu
            app.ConfigurationcouranteMenu = uimenu(app.ExportItem);
            app.ConfigurationcouranteMenu.MenuSelectedFcn = createCallbackFcn(app, @ExportItemMenuSelected, true);
            app.ConfigurationcouranteMenu.Text = 'Configuration courante';

            % Create ExportResSim
            app.ExportResSim = uimenu(app.ExportItem);
            app.ExportResSim.MenuSelectedFcn = createCallbackFcn(app, @ExportResSimMenuSelected, true);
            app.ExportResSim.Text = 'Résultats de simulation';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 698 446];

            % Create ParamtrescodebarresTab
            app.ParamtrescodebarresTab = uitab(app.TabGroup);
            app.ParamtrescodebarresTab.Title = 'Paramètres code-barres';

            % Create Image_3
            app.Image_3 = uiimage(app.ParamtrescodebarresTab);
            app.Image_3.Position = [451 20 233 388];
            app.Image_3.ImageSource = 'data/def_angles.png';

            % Create ParamtresPanel
            app.ParamtresPanel = uipanel(app.ParamtrescodebarresTab);
            app.ParamtresPanel.Title = 'Paramètres';
            app.ParamtresPanel.Position = [13 15 418 393];

            % Create RayondecourburecmEditField_2
            app.RayondecourburecmEditField_2 = uieditfield(app.ParamtresPanel, 'numeric');
            app.RayondecourburecmEditField_2.Position = [285 151 86 22];
            app.RayondecourburecmEditField_2.Value = 9999999;

            % Create RayondecourburecmLabel
            app.RayondecourburecmLabel = uilabel(app.ParamtresPanel);
            app.RayondecourburecmLabel.HorizontalAlignment = 'right';
            app.RayondecourburecmLabel.Position = [122 151 140 22];
            app.RayondecourburecmLabel.Text = 'Rayon de courbure [cm] :';

            % Create Angleverticalducodebarres_cdegLabel
            app.Angleverticalducodebarres_cdegLabel = uilabel(app.ParamtresPanel);
            app.Angleverticalducodebarres_cdegLabel.HorizontalAlignment = 'right';
            app.Angleverticalducodebarres_cdegLabel.Position = [-1 185 267 22];
            app.Angleverticalducodebarres_cdegLabel.Text = 'Angle du code-barres autour de x (phi_c) [deg] : ';

            % Create Angleducodebarresautourdexphi_cdegEditField
            app.Angleducodebarresautourdexphi_cdegEditField = uieditfield(app.ParamtresPanel, 'numeric');
            app.Angleducodebarresautourdexphi_cdegEditField.Position = [286 186 84 22];

            % Create RflectivitdelasurfaceSlider_2Label
            app.RflectivitdelasurfaceSlider_2Label = uilabel(app.ParamtresPanel);
            app.RflectivitdelasurfaceSlider_2Label.HorizontalAlignment = 'right';
            app.RflectivitdelasurfaceSlider_2Label.Position = [34 107 140 22];
            app.RflectivitdelasurfaceSlider_2Label.Text = 'Réflectivité de la surface:';

            % Create RflectivitdelasurfaceSlider_2
            app.RflectivitdelasurfaceSlider_2 = uislider(app.ParamtresPanel);
            app.RflectivitdelasurfaceSlider_2.Limits = [0 1];
            app.RflectivitdelasurfaceSlider_2.Position = [208 117 156 3];
            app.RflectivitdelasurfaceSlider_2.Value = 0.5;

            % Create AnglehorizontalducodebarresdegrsLabel
            app.AnglehorizontalducodebarresdegrsLabel = uilabel(app.ParamtresPanel);
            app.AnglehorizontalducodebarresdegrsLabel.HorizontalAlignment = 'right';
            app.AnglehorizontalducodebarresdegrsLabel.Position = [6 264 256 22];
            app.AnglehorizontalducodebarresdegrsLabel.Text = 'Angle du code-barres autour de z (θ_c) [deg] : ';

            % Create Angleducodebarresautourdez_cdegEditField
            app.Angleducodebarresautourdez_cdegEditField = uieditfield(app.ParamtresPanel, 'numeric');
            app.Angleducodebarresautourdez_cdegEditField.Position = [286 265 84 22];

            % Create DistancexducodebarrescmEditFieldLabel
            app.DistancexducodebarrescmEditFieldLabel = uilabel(app.ParamtresPanel);
            app.DistancexducodebarrescmEditFieldLabel.HorizontalAlignment = 'right';
            app.DistancexducodebarrescmEditFieldLabel.Position = [78 336 184 22];
            app.DistancexducodebarrescmEditFieldLabel.Text = 'Distance x du code-barres [cm] :';

            % Create DistancexducodebarrescmEditField
            app.DistancexducodebarrescmEditField = uieditfield(app.ParamtresPanel, 'numeric');
            app.DistancexducodebarrescmEditField.Position = [285 336 85 22];

            % Create DistancezducodebarrescmEditFieldLabel
            app.DistancezducodebarrescmEditFieldLabel = uilabel(app.ParamtresPanel);
            app.DistancezducodebarrescmEditFieldLabel.HorizontalAlignment = 'right';
            app.DistancezducodebarrescmEditFieldLabel.Position = [78 303 184 22];
            app.DistancezducodebarrescmEditFieldLabel.Text = 'Distance z du code-barres [cm] :';

            % Create DistancezducodebarrescmEditField
            app.DistancezducodebarrescmEditField = uieditfield(app.ParamtresPanel, 'numeric');
            app.DistancezducodebarrescmEditField.Position = [285 303 85 22];
            app.DistancezducodebarrescmEditField.Value = 8;

            % Create Angleducodebarresautourdey_cdegEditFieldLabel
            app.Angleducodebarresautourdey_cdegEditFieldLabel = uilabel(app.ParamtresPanel);
            app.Angleducodebarresautourdey_cdegEditFieldLabel.HorizontalAlignment = 'right';
            app.Angleducodebarresautourdey_cdegEditFieldLabel.Position = [8 224 258 22];
            app.Angleducodebarresautourdey_cdegEditFieldLabel.Text = 'Angle du code-barres autour de y (α_c) [deg] : ';

            % Create Angleducodebarresautourdey_cdegEditField
            app.Angleducodebarresautourdey_cdegEditField = uieditfield(app.ParamtresPanel, 'numeric');
            app.Angleducodebarresautourdey_cdegEditField.Position = [286 225 84 22];

            % Create DfinitiondesanglesLabel
            app.DfinitiondesanglesLabel = uilabel(app.ParamtrescodebarresTab);
            app.DfinitiondesanglesLabel.Position = [504 201 117 22];
            app.DfinitiondesanglesLabel.Text = 'Définition des angles';

            % Create SimulationTab
            app.SimulationTab = uitab(app.TabGroup);
            app.SimulationTab.Title = 'Simulation';

            % Create Image
            app.Image = uiimage(app.SimulationTab);
            app.Image.Position = [600 -19 98 109];
            app.Image.ImageSource = 'data/ULAVAL.png';

            % Create DmarrerlasimulationButton
            app.DmarrerlasimulationButton = uibutton(app.SimulationTab, 'push');
            app.DmarrerlasimulationButton.ButtonPushedFcn = createCallbackFcn(app, @DmarrerlasimulationButtonPushed, true);
            app.DmarrerlasimulationButton.BackgroundColor = [0.4667 0.6745 0.1882];
            app.DmarrerlasimulationButton.FontWeight = 'bold';
            app.DmarrerlasimulationButton.Position = [448 76 146 38];
            app.DmarrerlasimulationButton.Text = 'Démarrer la simulation';

            % Create GalvanomtrePanel
            app.GalvanomtrePanel = uipanel(app.SimulationTab);
            app.GalvanomtrePanel.Title = 'Galvanomètre';
            app.GalvanomtrePanel.Position = [13 177 319 231];

            % Create CoeffdefrottementdugalvoLabel
            app.CoeffdefrottementdugalvoLabel = uilabel(app.GalvanomtrePanel);
            app.CoeffdefrottementdugalvoLabel.HorizontalAlignment = 'right';
            app.CoeffdefrottementdugalvoLabel.Position = [7 81 220 22];
            app.CoeffdefrottementdugalvoLabel.Text = 'Coeff. de frottement du système  (F_s):';

            % Create CoeffdefrottementdusystmeF_sEditField
            app.CoeffdefrottementdusystmeF_sEditField = uieditfield(app.GalvanomtrePanel, 'numeric');
            app.CoeffdefrottementdusystmeF_sEditField.Position = [236 81 71 22];
            app.CoeffdefrottementdusystmeF_sEditField.Value = 0.0264;

            % Create FrquencedelasourceLabel
            app.FrquencedelasourceLabel = uilabel(app.GalvanomtrePanel);
            app.FrquencedelasourceLabel.HorizontalAlignment = 'right';
            app.FrquencedelasourceLabel.Position = [15 162 212 22];
            app.FrquencedelasourceLabel.Text = 'Fréquence de la source [rad/s]:';

            % Create FrquencedelasourceradsEditField
            app.FrquencedelasourceradsEditField = uieditfield(app.GalvanomtrePanel, 'numeric');
            app.FrquencedelasourceradsEditField.Position = [236 162 71 24];
            app.FrquencedelasourceradsEditField.Value = 2;

            % Create AmplitudedelasourceLabel
            app.AmplitudedelasourceLabel = uilabel(app.GalvanomtrePanel);
            app.AmplitudedelasourceLabel.HorizontalAlignment = 'right';
            app.AmplitudedelasourceLabel.Position = [42 122 185 22];
            app.AmplitudedelasourceLabel.Text = 'Amplitude de la source [-]:';

            % Create AmplitudedelasourceEditField
            app.AmplitudedelasourceEditField = uieditfield(app.GalvanomtrePanel, 'numeric');
            app.AmplitudedelasourceEditField.Position = [236 122 71 22];
            app.AmplitudedelasourceEditField.Value = 120;

            % Create CoeffdinertiedusystmeJ_sEditFieldLabel
            app.CoeffdinertiedusystmeJ_sEditFieldLabel = uilabel(app.GalvanomtrePanel);
            app.CoeffdinertiedusystmeJ_sEditFieldLabel.HorizontalAlignment = 'right';
            app.CoeffdinertiedusystmeJ_sEditFieldLabel.Position = [5 45 222 22];
            app.CoeffdinertiedusystmeJ_sEditFieldLabel.Text = 'Coeff. d''inertie du système (J_s) :';

            % Create CoeffdinertiedusystmeJ_sEditField
            app.CoeffdinertiedusystmeJ_sEditField = uieditfield(app.GalvanomtrePanel, 'numeric');
            app.CoeffdinertiedusystmeJ_sEditField.Position = [236 45 73 22];
            app.CoeffdinertiedusystmeJ_sEditField.Value = 0.0001742;

            % Create ConstantedecoupleK_TLabel
            app.ConstantedecoupleK_TLabel = uilabel(app.GalvanomtrePanel);
            app.ConstantedecoupleK_TLabel.HorizontalAlignment = 'right';
            app.ConstantedecoupleK_TLabel.Position = [25 10 202 22];
            app.ConstantedecoupleK_TLabel.Text = 'Constante de couple (K_T):';

            % Create ConstantedecoupleK_TEditField
            app.ConstantedecoupleK_TEditField = uieditfield(app.GalvanomtrePanel, 'numeric');
            app.ConstantedecoupleK_TEditField.Position = [236 10 74 22];
            app.ConstantedecoupleK_TEditField.Value = 4.5;

            % Create InsrerlecodebarresvirguleEditFieldLabel
            app.InsrerlecodebarresvirguleEditFieldLabel = uilabel(app.SimulationTab);
            app.InsrerlecodebarresvirguleEditFieldLabel.HorizontalAlignment = 'right';
            app.InsrerlecodebarresvirguleEditFieldLabel.Position = [38 122 170 22];
            app.InsrerlecodebarresvirguleEditFieldLabel.Text = 'Insérer le code-barres (virgule)';

            % Create InsrerlecodebarresvirguleEditField
            app.InsrerlecodebarresvirguleEditField = uieditfield(app.SimulationTab, 'text');
            app.InsrerlecodebarresvirguleEditField.Position = [223 122 100 22];
            app.InsrerlecodebarresvirguleEditField.Value = '0,0,0,0,0,0,0,0,0,0,0,0';

            % Create TempsdelectureEditFieldLabel
            app.TempsdelectureEditFieldLabel = uilabel(app.SimulationTab);
            app.TempsdelectureEditFieldLabel.HorizontalAlignment = 'right';
            app.TempsdelectureEditFieldLabel.Position = [111 85 97 22];
            app.TempsdelectureEditFieldLabel.Text = 'Temps de lecture';

            % Create TempsdelectureEditField
            app.TempsdelectureEditField = uieditfield(app.SimulationTab, 'numeric');
            app.TempsdelectureEditField.Editable = 'off';
            app.TempsdelectureEditField.Position = [223 85 100 22];

            % Create TempsdesimulationsSliderLabel
            app.TempsdesimulationsSliderLabel = uilabel(app.SimulationTab);
            app.TempsdesimulationsSliderLabel.HorizontalAlignment = 'right';
            app.TempsdesimulationsSliderLabel.Position = [22 35 129 22];
            app.TempsdesimulationsSliderLabel.Text = 'Temps de simulation(s)';

            % Create TempsdesimulationsSlider
            app.TempsdesimulationsSlider = uislider(app.SimulationTab);
            app.TempsdesimulationsSlider.Limits = [1 30];
            app.TempsdesimulationsSlider.Position = [172 44 408 3];
            app.TempsdesimulationsSlider.Value = 5;

            % Create ActiverlanimationButton
            app.ActiverlanimationButton = uibutton(app.SimulationTab, 'state');
            app.ActiverlanimationButton.Text = 'Activer l''animation';
            app.ActiverlanimationButton.Position = [465 132 112 22];

            % Create LaserPanel
            app.LaserPanel = uipanel(app.SimulationTab);
            app.LaserPanel.Title = 'Laser';
            app.LaserPanel.Position = [349 299 335 109];

            % Create Tailledufaisceaulaserw_0cmEditFieldLabel
            app.Tailledufaisceaulaserw_0cmEditFieldLabel = uilabel(app.LaserPanel);
            app.Tailledufaisceaulaserw_0cmEditFieldLabel.HorizontalAlignment = 'right';
            app.Tailledufaisceaulaserw_0cmEditFieldLabel.Position = [24 58 186 22];
            app.Tailledufaisceaulaserw_0cmEditFieldLabel.Text = 'Taille du faisceau laser (w_0)[cm]:';

            % Create Tailledufaisceaulaserw_0cmEditField
            app.Tailledufaisceaulaserw_0cmEditField = uieditfield(app.LaserPanel, 'numeric');
            app.Tailledufaisceaulaserw_0cmEditField.Limits = [0 1];
            app.Tailledufaisceaulaserw_0cmEditField.Position = [262 58 49 22];
            app.Tailledufaisceaulaserw_0cmEditField.Value = 0.04;

            % Create PuissancedufaisceauI_0mWEditFieldLabel
            app.PuissancedufaisceauI_0mWEditFieldLabel = uilabel(app.LaserPanel);
            app.PuissancedufaisceauI_0mWEditFieldLabel.HorizontalAlignment = 'right';
            app.PuissancedufaisceauI_0mWEditFieldLabel.Position = [21 15 193 22];
            app.PuissancedufaisceauI_0mWEditFieldLabel.Text = 'Puissance du faisceau (I_0) [mW] :';

            % Create PuissancedufaisceauI_0mWEditField
            app.PuissancedufaisceauI_0mWEditField = uieditfield(app.LaserPanel, 'numeric');
            app.PuissancedufaisceauI_0mWEditField.Position = [262 15 49 22];
            app.PuissancedufaisceauI_0mWEditField.Value = 1;

            % Create CircuittransimpdanceetcomparateurPanel
            app.CircuittransimpdanceetcomparateurPanel = uipanel(app.SimulationTab);
            app.CircuittransimpdanceetcomparateurPanel.Title = 'Circuit transimpédance et comparateur';
            app.CircuittransimpdanceetcomparateurPanel.Position = [350 177 334 104];

            % Create FrquencedecoupurefiltresphotodiodeHzLabel
            app.FrquencedecoupurefiltresphotodiodeHzLabel = uilabel(app.CircuittransimpdanceetcomparateurPanel);
            app.FrquencedecoupurefiltresphotodiodeHzLabel.HorizontalAlignment = 'right';
            app.FrquencedecoupurefiltresphotodiodeHzLabel.Position = [6 53 251 22];
            app.FrquencedecoupurefiltresphotodiodeHzLabel.Text = 'Fréquence de coupure filtres photodiode [Hz]:';

            % Create FrquencedecoupurefiltresphotodiodeHzEditField
            app.FrquencedecoupurefiltresphotodiodeHzEditField = uieditfield(app.CircuittransimpdanceetcomparateurPanel, 'numeric');
            app.FrquencedecoupurefiltresphotodiodeHzEditField.Position = [262 53 49 22];
            app.FrquencedecoupurefiltresphotodiodeHzEditField.Value = 58.8;

            % Create GaindelaphotodiodeAWEditFieldLabel
            app.GaindelaphotodiodeAWEditFieldLabel = uilabel(app.CircuittransimpdanceetcomparateurPanel);
            app.GaindelaphotodiodeAWEditFieldLabel.HorizontalAlignment = 'right';
            app.GaindelaphotodiodeAWEditFieldLabel.Position = [91 21 165 22];
            app.GaindelaphotodiodeAWEditFieldLabel.Text = 'Gain de la photodiode [A/W]:';

            % Create GaindelaphotodiodeAWEditField
            app.GaindelaphotodiodeAWEditField = uieditfield(app.CircuittransimpdanceetcomparateurPanel, 'numeric');
            app.GaindelaphotodiodeAWEditField.Position = [261 21 50 18];
            app.GaindelaphotodiodeAWEditField.Value = 0.215;

            % Create VisualisationTab
            app.VisualisationTab = uitab(app.TabGroup);
            app.VisualisationTab.Title = 'Visualisation';

            % Create Image_2
            app.Image_2 = uiimage(app.VisualisationTab);
            app.Image_2.Position = [579 1 114 113];
            app.Image_2.ImageSource = 'data/ULAVAL.png';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.VisualisationTab);
            app.TabGroup2.Position = [1 0 696 422];

            % Create PhotodiodebrutTab
            app.PhotodiodebrutTab = uitab(app.TabGroup2);
            app.PhotodiodebrutTab.Title = 'Photodiode brut';

            % Create UIAxesPhotoRaw
            app.UIAxesPhotoRaw = uiaxes(app.PhotodiodebrutTab);
            title(app.UIAxesPhotoRaw, 'Signaux bruts de la photodiode en fonction du temps')
            xlabel(app.UIAxesPhotoRaw, 'Temps [s]')
            ylabel(app.UIAxesPhotoRaw, 'Courant [A]')
            zlabel(app.UIAxesPhotoRaw, 'Z')
            app.UIAxesPhotoRaw.Position = [12 100 672 285];

            % Create CacherlessignauxPanel
            app.CacherlessignauxPanel = uipanel(app.PhotodiodebrutTab);
            app.CacherlessignauxPanel.Title = 'Cacher les signaux';
            app.CacherlessignauxPanel.Position = [1 2 405 88];

            % Create PrphotodiodeButton
            app.PrphotodiodeButton = uibutton(app.CacherlessignauxPanel, 'state');
            app.PrphotodiodeButton.ValueChangedFcn = createCallbackFcn(app, @PrphotodiodeButtonValueChanged, true);
            app.PrphotodiodeButton.Text = 'Pré-photodiode';
            app.PrphotodiodeButton.Position = [11 32 98 22];

            % Create AprsbruitlumineuxButton
            app.AprsbruitlumineuxButton = uibutton(app.CacherlessignauxPanel, 'state');
            app.AprsbruitlumineuxButton.ValueChangedFcn = createCallbackFcn(app, @AprsbruitlumineuxButtonValueChanged, true);
            app.AprsbruitlumineuxButton.Text = 'Après bruit lumineux';
            app.AprsbruitlumineuxButton.Position = [125 32 125 22];

            % Create AprsbruitdelectureButton
            app.AprsbruitdelectureButton = uibutton(app.CacherlessignauxPanel, 'state');
            app.AprsbruitdelectureButton.ValueChangedFcn = createCallbackFcn(app, @AprsbruitdelectureButtonValueChanged, true);
            app.AprsbruitdelectureButton.Text = 'Après bruit de lecture';
            app.AprsbruitdelectureButton.Position = [264 32 130 22];

            % Create Image_4
            app.Image_4 = uiimage(app.PhotodiodebrutTab);
            app.Image_4.Position = [575 4 100 82];
            app.Image_4.ImageSource = 'data/ULAVAL.png';

            % Create PhotodiodetraitTab
            app.PhotodiodetraitTab = uitab(app.TabGroup2);
            app.PhotodiodetraitTab.Title = 'Photodiode traité';

            % Create UIAxesPhoto
            app.UIAxesPhoto = uiaxes(app.PhotodiodetraitTab);
            title(app.UIAxesPhoto, 'Signaux traités de la photodiode en fonction du temps')
            xlabel(app.UIAxesPhoto, 'Temps [s]')
            ylabel(app.UIAxesPhoto, 'Tension [V]')
            zlabel(app.UIAxesPhoto, 'Z')
            app.UIAxesPhoto.Position = [12 100 672 285];

            % Create CacherlessignauxPanel_2
            app.CacherlessignauxPanel_2 = uipanel(app.PhotodiodetraitTab);
            app.CacherlessignauxPanel_2.Title = 'Cacher les signaux';
            app.CacherlessignauxPanel_2.Position = [1 2 539 88];

            % Create AprsdiffrentielButton
            app.AprsdiffrentielButton = uibutton(app.CacherlessignauxPanel_2, 'state');
            app.AprsdiffrentielButton.ValueChangedFcn = createCallbackFcn(app, @AprsdiffrentielButtonValueChanged, true);
            app.AprsdiffrentielButton.Text = 'Après différentiel';
            app.AprsdiffrentielButton.Position = [276 32 105 22];

            % Create SortieversArduinoButton
            app.SortieversArduinoButton = uibutton(app.CacherlessignauxPanel_2, 'state');
            app.SortieversArduinoButton.ValueChangedFcn = createCallbackFcn(app, @SortieversArduinoButtonValueChanged, true);
            app.SortieversArduinoButton.Text = 'Sortie (vers Arduino)';
            app.SortieversArduinoButton.Position = [395 32 125 22];

            % Create PrdiffrentielButton
            app.PrdiffrentielButton = uibutton(app.CacherlessignauxPanel_2, 'state');
            app.PrdiffrentielButton.ValueChangedFcn = createCallbackFcn(app, @PrdiffrentielButtonValueChanged, true);
            app.PrdiffrentielButton.Text = 'Pré-différentiel';
            app.PrdiffrentielButton.Position = [165 32 100 22];

            % Create SortietransimpdanceButton
            app.SortietransimpdanceButton = uibutton(app.CacherlessignauxPanel_2, 'state');
            app.SortietransimpdanceButton.ValueChangedFcn = createCallbackFcn(app, @SortietransimpdanceButtonValueChanged, true);
            app.SortietransimpdanceButton.Text = 'Sortie transimpédance';
            app.SortietransimpdanceButton.Position = [17 32 136 22];

            % Create Image_5
            app.Image_5 = uiimage(app.PhotodiodetraitTab);
            app.Image_5.Position = [575 4 100 82];
            app.Image_5.ImageSource = 'data/ULAVAL.png';

            % Create GalvanomtresTab
            app.GalvanomtresTab = uitab(app.TabGroup2);
            app.GalvanomtresTab.Title = 'Galvanomètres';

            % Create UIAxesGalvo
            app.UIAxesGalvo = uiaxes(app.GalvanomtresTab);
            title(app.UIAxesGalvo, 'Consigne et commande du galvanomètre')
            xlabel(app.UIAxesGalvo, 'Temps [s]')
            ylabel(app.UIAxesGalvo, 'Angle [°]')
            zlabel(app.UIAxesGalvo, 'Z')
            app.UIAxesGalvo.Position = [12 100 672 285];

            % Create CacherlessignauxPanel_3
            app.CacherlessignauxPanel_3 = uipanel(app.GalvanomtresTab);
            app.CacherlessignauxPanel_3.Title = 'Cacher les signaux';
            app.CacherlessignauxPanel_3.Position = [1 2 369 88];

            % Create ConsigneButton
            app.ConsigneButton = uibutton(app.CacherlessignauxPanel_3, 'state');
            app.ConsigneButton.ValueChangedFcn = createCallbackFcn(app, @ConsigneButtonValueChanged, true);
            app.ConsigneButton.Text = 'Consigne';
            app.ConsigneButton.Position = [38 32 100 22];

            % Create CommandeButton
            app.CommandeButton = uibutton(app.CacherlessignauxPanel_3, 'state');
            app.CommandeButton.ValueChangedFcn = createCallbackFcn(app, @CommandeButtonValueChanged, true);
            app.CommandeButton.Text = 'Commande';
            app.CommandeButton.Position = [206 32 100 22];

            % Create Image_6
            app.Image_6 = uiimage(app.GalvanomtresTab);
            app.Image_6.Position = [575 4 100 82];
            app.Image_6.ImageSource = 'data/ULAVAL.png';

            % Create FactureTab
            app.FactureTab = uitab(app.TabGroup);
            app.FactureTab.Title = 'Facture';

            % Create UITable
            app.UITable = uitable(app.FactureTab);
            app.UITable.ColumnName = {'Format'; 'Nom'; 'Prix'};
            app.UITable.RowName = {};
            app.UITable.CellEditCallback = createCallbackFcn(app, @DmarrerlasimulationButtonPushed, true);
            app.UITable.Position = [2 2 429 420];

            % Create TotalLabel
            app.TotalLabel = uilabel(app.FactureTab);
            app.TotalLabel.HorizontalAlignment = 'right';
            app.TotalLabel.Position = [524 121 38 22];
            app.TotalLabel.Text = 'Total :';

            % Create TotalEditField
            app.TotalEditField = uieditfield(app.FactureTab, 'numeric');
            app.TotalEditField.Editable = 'off';
            app.TotalEditField.Position = [577 121 100 22];

            % Create DerniercodebarresluLabel
            app.DerniercodebarresluLabel = uilabel(app.FactureTab);
            app.DerniercodebarresluLabel.HorizontalAlignment = 'right';
            app.DerniercodebarresluLabel.Position = [429 153 132 22];
            app.DerniercodebarresluLabel.Text = 'Dernier code-barres lu :';

            % Create DerniercodebarresluEditField
            app.DerniercodebarresluEditField = uieditfield(app.FactureTab, 'text');
            app.DerniercodebarresluEditField.Editable = 'off';
            app.DerniercodebarresluEditField.Position = [576 153 100 22];

            % Create AjoutmanuelEditField
            app.AjoutmanuelEditField = uieditfield(app.FactureTab, 'text');
            app.AjoutmanuelEditField.Position = [445 335 137 22];

            % Create AjoutmanueldarticlesButton
            app.AjoutmanueldarticlesButton = uibutton(app.FactureTab, 'push');
            app.AjoutmanueldarticlesButton.ButtonPushedFcn = createCallbackFcn(app, @AjoutmanueldarticlesButtonPushed, true);
            app.AjoutmanueldarticlesButton.Position = [447 363 136 22];
            app.AjoutmanueldarticlesButton.Text = 'Ajout manuel d''articles';

            % Create SauvegarderlafactureButton
            app.SauvegarderlafactureButton = uibutton(app.FactureTab, 'push');
            app.SauvegarderlafactureButton.ButtonPushedFcn = createCallbackFcn(app, @SauvegarderlafactureButtonPushed, true);
            app.SauvegarderlafactureButton.Position = [540 14 137 22];
            app.SauvegarderlafactureButton.Text = 'Sauvegarder la facture';

            % Create ImporterunefactureButton
            app.ImporterunefactureButton = uibutton(app.FactureTab, 'push');
            app.ImporterunefactureButton.ButtonPushedFcn = createCallbackFcn(app, @ImporterunefactureButtonPushed, true);
            app.ImporterunefactureButton.Position = [540 44 137 22];
            app.ImporterunefactureButton.Text = 'Importer une facture';

            % Create ViderlafactureButton
            app.ViderlafactureButton = uibutton(app.FactureTab, 'push');
            app.ViderlafactureButton.ButtonPushedFcn = createCallbackFcn(app, @ViderlafactureButtonPushed, true);
            app.ViderlafactureButton.Position = [540 76 137 22];
            app.ViderlafactureButton.Text = 'Vider la facture';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = cao

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            LoadData(app)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end