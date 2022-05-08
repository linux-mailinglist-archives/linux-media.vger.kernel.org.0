Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD5C51EBF0
	for <lists+linux-media@lfdr.de>; Sun,  8 May 2022 07:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiEHGA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 May 2022 02:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiEHGAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 May 2022 02:00:23 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778EF38A6
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 22:56:33 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnZu7-002EM3-CP; Sun, 08 May 2022 05:56:27 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnZu5-008Yar-8Y; Sun, 08 May 2022 05:56:24 +0000
Date:   Sun, 8 May 2022 05:56:24 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <202840870.1.1651989384747@builder.linuxtv.org>
In-Reply-To: <1010274796.0.1651986898906@builder.linuxtv.org>
References: <1010274796.0.1651986898906@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #451
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/451/display/redirect>

Changes:


------------------------------------------
[...truncated 51.16 KB...]
  CC      drivers/media/dvb-frontends/lnbh25.o
  CC      drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.o
  CC      drivers/media/rc/keymaps/rc-tanix-tx3mini.o
  CC      drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.o
  CC      drivers/media/pci/saa7146/hexium_orion.o
  CC      drivers/media/usb/dvb-usb/technisat-usb2.o
  CC      drivers/media/rc/keymaps/rc-tanix-tx5max.o
  CC      drivers/media/i2c/m5mols/m5mols_core.o
  CC      drivers/media/test-drivers/vivid/vivid-vbi-cap.o
  CC      drivers/media/pci/ddbridge/ddbridge-max.o
  CC      drivers/media/dvb-frontends/lnbh29.o
  CC      drivers/media/pci/ddbridge/ddbridge-mci.o
  CC      drivers/media/pci/saa7146/hexium_gemini.o
  CC      drivers/media/rc/keymaps/rc-tbs-nec.o
  CC      drivers/media/test-drivers/vivid/vivid-vbi-out.o
  CC      drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC      drivers/media/dvb-frontends/lnbp21.o
  CC      drivers/media/rc/keymaps/rc-technisat-ts35.o
  CC      drivers/media/usb/s2255/s2255drv.o
  CC      drivers/media/pci/smipcie/smipcie-main.o
  CC      drivers/media/i2c/m5mols/m5mols_controls.o
  CC      drivers/media/pci/ddbridge/ddbridge-sx8.o
  AR      drivers/media/pci/saa7146/built-in.a
  CC      drivers/media/dvb-frontends/lnbp22.o
  CC      drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.o
  CC      drivers/media/test-drivers/vivid/vivid-osd.o
  CC      drivers/media/test-drivers/vivid/vivid-meta-cap.o
  CC      drivers/media/rc/keymaps/rc-technisat-usb2.o
  CC      drivers/media/i2c/m5mols/m5mols_capture.o
  AR      drivers/media/usb/s2255/built-in.a
  CC      drivers/media/usb/siano/smsusb.o
  CC      drivers/media/pci/ddbridge/ddbridge-dummy-fe.o
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.o
  CC      drivers/media/pci/smipcie/smipcie-ir.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  CC      drivers/media/platform/mediatek/mdp/mtk_mdp_core.o
  CC      drivers/media/dvb-frontends/m88ds3103.o
  CC      drivers/media/test-drivers/vivid/vivid-meta-out.o
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.o
  AR      drivers/media/usb/siano/built-in.a
  CC      drivers/media/usb/stkwebcam/stk-webcam.o
  AR      drivers/media/i2c/m5mols/built-in.a
  CC      drivers/media/i2c/max9271.o
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      drivers/media/platform/mediatek/mdp/mtk_mdp_comp.o
  AR      drivers/media/pci/smipcie/built-in.a
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-xs.o
  CC      drivers/media/pci/netup_unidvb/netup_unidvb_core.o
  CC      drivers/media/test-drivers/vivid/vivid-kthread-touch.o
  CC      drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.o
  CC      drivers/media/usb/ttusb-budget/dvb-ttusb-budget.o
  CC      drivers/media/i2c/max9286.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/dvb-frontends/m88rs2000.o
  CC      drivers/media/usb/stkwebcam/stk-sensor.o
  CC      drivers/media/rc/keymaps/rc-terratec-slim-2.o
  CC      drivers/media/pci/netup_unidvb/netup_unidvb_i2c.o
  CC      drivers/media/platform/mediatek/mdp/mtk_mdp_regs.o
  CC      drivers/media/test-drivers/vivid/vivid-touch-cap.o
  AR      drivers/media/usb/stkwebcam/built-in.a
  CC      drivers/media/rc/keymaps/rc-terratec-slim.o
  CC      drivers/media/i2c/ml86v7667.o
  CC      drivers/media/dvb-frontends/mb86a16.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  CC      drivers/media/platform/mediatek/vpu/mtk_vpu.o
  CC      drivers/media/rc/keymaps/rc-tevii-nec.o
  CC      drivers/media/pci/netup_unidvb/netup_unidvb_ci.o
  CC      drivers/media/usb/ttusb-dec/ttusb_dec.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/test-drivers/vivid/vivid-cec.o
  CC      drivers/media/i2c/msp3400-driver.o
  CC      drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      drivers/media/rc/keymaps/rc-tivo.o
  CC      drivers/media/usb/ttusb-dec/ttusbdecfe.o
  CC      drivers/media/pci/netup_unidvb/netup_unidvb_spi.o
  AR      drivers/media/test-drivers/vivid/built-in.a
  AR      drivers/media/test-drivers/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/i2c/msp3400-kthreads.o
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC      drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
  CC      drivers/media/dvb-frontends/mb86a20s.o
  CC      drivers/media/platform/nvidia/tegra-vde/vde.o
  CC      drivers/media/platform/nvidia/tegra-vde/iommu.o
  CC      drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  CC      drivers/media/usb/zr364xx/zr364xx.o
  CC      drivers/media/i2c/mt9m001.o
  CC      drivers/media/rc/keymaps/rc-total-media-in-hand.o
FATAL: command execution failed
java.io.IOException
	at hudson.remoting.Channel.close(Channel.java:1470)
	at hudson.remoting.Channel.close(Channel.java:1447)
	at hudson.slaves.SlaveComputer.closeChannel(SlaveComputer.java:902)
	at hudson.slaves.SlaveComputer.kill(SlaveComputer.java:868)
	at hudson.model.AbstractCIBase.killComputer(AbstractCIBase.java:95)
	at jenkins.model.Jenkins.lambda$_cleanUpDisconnectComputers$11(Jenkins.java:3699)
	at hudson.model.Queue._withLock(Queue.java:1395)
	at hudson.model.Queue.withLock(Queue.java:1269)
	at jenkins.model.Jenkins._cleanUpDisconnectComputers(Jenkins.java:3695)
	at jenkins.model.Jenkins.cleanUp(Jenkins.java:3578)
	at hudson.lifecycle.Lifecycle.lambda$new$0(Lifecycle.java:63)
	at java.base/java.lang.Thread.run(Thread.java:829)
Caused: hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@3f7d837a:slave2": Remote call on slave2 failed. The channel is closing down or has closed down
	at hudson.remoting.Channel.call(Channel.java:993)
	at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:285)
	at com.sun.proxy.$Proxy70.isAlive(Unknown Source)
	at hudson.Launcher$RemoteLauncher$ProcImpl.isAlive(Launcher.java:1215)
	at hudson.Launcher$RemoteLauncher$ProcImpl.join(Launcher.java:1207)
	at hudson.tasks.CommandInterpreter.join(CommandInterpreter.java:195)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:145)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:92)
	at hudson.tasks.BuildStepMonitor$1.perform(BuildStepMonitor.java:20)
	at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:814)
	at hudson.model.Build$BuildExecution.build(Build.java:199)
	at hudson.model.Build$BuildExecution.doRun(Build.java:164)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:522)
	at hudson.model.Run.execute(Run.java:1896)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
	at hudson.model.ResourceController.execute(ResourceController.java:101)
	at hudson.model.Executor.run(Executor.java:442)
FATAL: Unable to delete script file /tmp/jenkins11905292353700388175.sh
java.io.IOException
	at hudson.remoting.Channel.close(Channel.java:1470)
	at hudson.remoting.Channel.close(Channel.java:1447)
	at hudson.slaves.SlaveComputer.closeChannel(SlaveComputer.java:902)
	at hudson.slaves.SlaveComputer.kill(SlaveComputer.java:868)
	at hudson.model.AbstractCIBase.killComputer(AbstractCIBase.java:95)
	at jenkins.model.Jenkins.lambda$_cleanUpDisconnectComputers$11(Jenkins.java:3699)
	at hudson.model.Queue._withLock(Queue.java:1395)
	at hudson.model.Queue.withLock(Queue.java:1269)
	at jenkins.model.Jenkins._cleanUpDisconnectComputers(Jenkins.java:3695)
	at jenkins.model.Jenkins.cleanUp(Jenkins.java:3578)
	at hudson.lifecycle.Lifecycle.lambda$new$0(Lifecycle.java:63)
	at java.base/java.lang.Thread.run(Thread.java:829)
Caused: hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@3f7d837a:slave2": Remote call on slave2 failed. The channel is closing down or has closed down
	at hudson.remoting.Channel.call(Channel.java:993)
	at hudson.FilePath.act(FilePath.java:1194)
	at hudson.FilePath.act(FilePath.java:1183)
	at hudson.FilePath.delete(FilePath.java:1730)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:163)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:92)
	at hudson.tasks.BuildStepMonitor$1.perform(BuildStepMonitor.java:20)
	at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:814)
	at hudson.model.Build$BuildExecution.build(Build.java:199)
	at hudson.model.Build$BuildExecution.doRun(Build.java:164)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:522)
	at hudson.model.Run.execute(Run.java:1896)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
	at hudson.model.ResourceController.execute(ResourceController.java:101)
	at hudson.model.Executor.run(Executor.java:442)
Build step 'Execute shell' marked build as failure
Not sending mail to unregistered user daniel@iogearbox.net
Not sending mail to unregistered user herbert@gondor.apana.org.au
Not sending mail to unregistered user pmladek@suse.com
Not sending mail to unregistered user rafael.j.wysocki@intel.com
Not sending mail to unregistered user rmk+kernel@armlinux.org.uk
Not sending mail to unregistered user wsa@the-dreams.de
Not sending mail to unregistered user keescook@chromium.org
Not sending mail to unregistered user ast@kernel.org
Not sending mail to unregistered user snitzer@redhat.com
Not sending mail to unregistered user kuba@kernel.org
Not sending mail to unregistered user robh@kernel.org
Not sending mail to unregistered user martin.petersen@oracle.com
Not sending mail to unregistered user sre@kernel.org
Not sending mail to unregistered user mcgrof@kernel.org
Not sending mail to unregistered user axboe@kernel.dk
Not sending mail to unregistered user bcain@codeaurora.org
Not sending mail to unregistered user ebiederm@xmission.com
Not sending mail to unregistered user palmer@rivosinc.com
Not sending mail to unregistered user corbet@lwn.net
Not sending mail to unregistered user mpe@ellerman.id.au
Not sending mail to unregistered user marex@denx.de
Not sending mail to unregistered user daniel.thompson@linaro.org
Not sending mail to unregistered user bhelgaas@google.com
Not sending mail to unregistered user tglx@linutronix.de
Not sending mail to unregistered user torvalds@linux-foundation.org
Not sending mail to unregistered user alex.williamson@redhat.com
Not sending mail to unregistered user dsterba@suse.com
Not sending mail to unregistered user johannes.berg@intel.com
Not sending mail to unregistered user p.zabel@pengutronix.de
Not sending mail to unregistered user linkinjeon@kernel.org
Not sending mail to unregistered user anthony.l.nguyen@intel.com
Not sending mail to unregistered user ulf.hansson@linaro.org
Not sending mail to unregistered user djwong@kernel.org
Not sending mail to unregistered user alexandre.belloni@bootlin.com
Not sending mail to unregistered user jroedel@suse.de
Not sending mail to unregistered user joonas.lahtinen@linux.intel.com
Not sending mail to unregistered user skhan@linuxfoundation.org
Not sending mail to unregistered user linus.walleij@linaro.org
Not sending mail to unregistered user pbonzini@redhat.com
Not sending mail to unregistered user kherbst@redhat.com
Not sending mail to unregistered user sboyd@kernel.org
Not sending mail to unregistered user gor@linux.ibm.com
Not sending mail to unregistered user jgg@ziepe.ca
Not sending mail to unregistered user willy@infradead.org
Not sending mail to unregistered user brgl@bgdev.pl
Not sending mail to unregistered user mkl@pengutronix.de
Not sending mail to unregistered user bleung@chromium.org
Not sending mail to unregistered user maxime@cerno.tech
Not sending mail to unregistered user sudeep.holla@arm.com
Not sending mail to unregistered user peterz@infradead.org
Not sending mail to unregistered user agruenba@redhat.com
Not sending mail to unregistered user hca@linux.ibm.com
Not sending mail to unregistered user wei.liu@kernel.org
Not sending mail to unregistered user gregkh@linuxfoundation.org
Not sending mail to unregistered user masahiroy@kernel.org
Not sending mail to unregistered user airlied@redhat.com
Not sending mail to unregistered user robdclark@chromium.org
Not sending mail to unregistered user pablo@netfilter.org
Not sending mail to unregistered user mingo@kernel.org
Not sending mail to unregistered user kvalo@codeaurora.org
Not sending mail to unregistered user rostedt@goodmis.org
Not sending mail to unregistered user mst@redhat.com
Not sending mail to unregistered user dan.j.williams@intel.com
Not sending mail to unregistered user chuck.lever@oracle.com
Not sending mail to unregistered user andriy.shevchenko@linux.intel.com
Not sending mail to unregistered user boris.ostrovsky@oracle.com
Not sending mail to unregistered user arnd@arndb.de
Not sending mail to unregistered user broonie@kernel.org
Not sending mail to unregistered user wim@linux-watchdog.org
Not sending mail to unregistered user tzimmermann@suse.de
Not sending mail to unregistered user alexander.deucher@amd.com
Not sending mail to unregistered user davem@davemloft.net
Not sending mail to unregistered user dmitry.torokhov@gmail.com
Not sending mail to unregistered user lee.jones@linaro.org
Not sending mail to unregistered user maz@kernel.org
Not sending mail to unregistered user deller@gmx.de
Not sending mail to unregistered user fw@strlen.de
Not sending mail to unregistered user will@kernel.org
Not sending mail to unregistered user dhowells@redhat.com
Not sending mail to unregistered user trond.myklebust@hammerspace.com
Not sending mail to unregistered user jani.nikula@intel.com
Not sending mail to unregistered user anup@brainfault.org
Not sending mail to unregistered user damien.lemoal@wdc.com
Not sending mail to unregistered user bp@suse.de
Not sending mail to unregistered user Jason@zx2c4.com
Not sending mail to unregistered user tsbogend@alpha.franken.de
Not sending mail to unregistered user daniel.vetter@ffwll.ch
Not sending mail to unregistered user stfrench@microsoft.com
Not sending mail to unregistered user pabeni@redhat.com
Not sending mail to unregistered user acme@redhat.com
Not sending mail to unregistered user krzysztof.kozlowski@canonical.com
Not sending mail to unregistered user hch@lst.de
Not sending mail to unregistered user tiwai@suse.de
Not sending mail to unregistered user christian.koenig@amd.com
Not sending mail to unregistered user hdegoede@redhat.com
