Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1203E594D
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 13:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbhHJLnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 07:43:39 -0400
Received: from www.linuxtv.org ([130.149.80.248]:47260 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237365AbhHJLni (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 07:43:38 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mDQA6-009fvy-Hy; Tue, 10 Aug 2021 11:43:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mDQA3-0000eK-Ib; Tue, 10 Aug 2021 11:43:12 +0000
Date:   Tue, 10 Aug 2021 11:43:11 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <748439336.2.1628595791570@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3590
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3590/display/redirect?page=changes>

Changes:

[hverkuil-cisco] Update backports/v5.0_gpio.patch


------------------------------------------
[...truncated 24.81 KB...]
firmware/dvb-usb-terratec-h5-drxk.fw
firmware/dvb-usb-wt220u-02.fw
firmware/v4l-cx23885-enc.fw
firmware/dvb-ttpci-01.fw-2622
firmware/dvb-usb-wt220u-01.fw
firmware/v4l-cx25840.fw
firmware/dvb-fe-drxj-mc-1.0.8.fw
firmware/v4l-cx231xx-avcore-01.fw
firmware/dvb-usb-dtt200u-01.fw
firmware/dvb-usb-dibusb-6.0.0.8.fw
firmware/sms1xxx-nova-b-dvbt-01.fw
firmware/dvb-fe-xc5000-1.6.114.fw
firmware/cmmb_vega_12mhz.inp
firmware/dvb-usb-it9135-01.fw
firmware/isdbt_nova_12mhz_b0.inp
firmware/dvb-ttpci-01.fw-261a
firmware/dvb-ttpci-01.fw-261b
firmware/dvb-ttpci-01.fw-261d
firmware/README
firmware/isdbt_rio.inp
firmware/dvb-usb-umt-010-02.fw
firmware/sms1xxx-hcw-55xxx-dvbt-02.fw
firmware/dvb-usb-terratec-h7-az6007.fw
firmware/v4l-cx23885-avcore-01.fw
******************
* Start building *
******************
make -C /var/lib/jenkins/workspace/media-build/v4l allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/media-build/v4l'
No version yet, using 4.19.0-12-amd64
make[2]: Entering directory '/var/lib/jenkins/workspace/media-build/linux'
Applying patches for kernel 4.19.0-12-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/rc-cec.patch
patch -s -f -N -p1 -i ../backports/v5.12_uvc.patch
patch -s -f -N -p1 -i ../backports/v5.11_isa.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.9_netup_unidvb_devm_revert.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.7_define_seq_attribute.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_vb2_kmap.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.4_async.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v5.0_gpio.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '/var/lib/jenkins/workspace/media-build/linux'
./scripts/make_kconfig.pl /lib/modules/4.19.0-12-amd64/build /lib/modules/4.19.0-12-amd64/source 1
Preparing to compile for kernel version 4.19.0

***WARNING:*** You do not have the full kernel sources installed.
This does not prevent you from building the v4l-dvb tree if you have the
kernel headers, but the full kernel source may be required in order to use
make menuconfig / xconfig / qconfig.

If you are experiencing problems building the v4l-dvb tree, please try
building against a vanilla kernel before reporting a bug.

Vanilla kernels are available at http://kernel.org.
On most distros, this will compile a newly downloaded kernel:

cp /boot/config-`uname -r` <your kernel dir>/.config
cd <your kernel dir>
make all modules_install install

Please see your distro's web site for instructions to build a new kernel.

WARNING: This is the V4L/DVB backport tree, with experimental drivers
	 backported to run on legacy kernels from the development tree at:
		http://git.linuxtv.org/media-tree.git.
	 It is generally safe to use it for testing a new driver or
	 feature, but its usage on production environments is risky.
	 Don't use it in production. You've been warned.
CEC_CROS_EC: Requires at least kernel 9.255.255
V4L2_H264: Requires at least kernel 9.255.255
VIDEO_IPU3_CIO2: Requires at least kernel 9.255.255
VIDEO_OMAP3: Requires at least kernel 9.255.255
VIDEO_IMX258: Requires at least kernel 9.255.255
VIDEO_IMX274: Requires at least kernel 9.255.255
SND_BT87X: Requires at least kernel 9.255.255
INTEL_ATOMISP: Requires at least kernel 9.255.255
VIDEO_HANTRO: Requires at least kernel 9.255.255
VIDEO_ROCKCHIP_VDEC: Requires at least kernel 9.255.255
VIDEO_IPU3_IMGU: Requires at least kernel 9.255.255
Created default (all yes) .config file
./scripts/fix_kconfig.pl
make[1]: Leaving directory '/var/lib/jenkins/workspace/media-build/v4l'
make -C /var/lib/jenkins/workspace/media-build/v4l 
make[1]: Entering directory '/var/lib/jenkins/workspace/media-build/v4l'
scripts/make_makefile.pl
./scripts/make_myconfig.pl
[ ! -f "./config-mycompat.h" ] && echo "/* empty config-mycompat.h */" > "./config-mycompat.h" || true
perl scripts/make_config_compat.pl /lib/modules/4.19.0-12-amd64/source ./.myconfig ./config-compat.h
creating symbolic links...
Kernel build directory is /lib/modules/4.19.0-12-amd64/build
make -C ../linux apply_patches
make[2]: Entering directory '/var/lib/jenkins/workspace/media-build/linux'
Patches for 4.19.0-12-amd64 already applied.
make[2]: Leaving directory '/var/lib/jenkins/workspace/media-build/linux'
make -C /lib/modules/4.19.0-12-amd64/build M=/var/lib/jenkins/workspace/media-build/v4l  modules
make[2]: Entering directory '/usr/src/linux-headers-4.19.0-12-amd64'
FATAL: command execution failed
java.io.IOException
	at hudson.remoting.Channel.close(Channel.java:1499)
	at hudson.remoting.Channel.close(Channel.java:1455)
	at hudson.slaves.SlaveComputer.closeChannel(SlaveComputer.java:884)
	at hudson.slaves.SlaveComputer.kill(SlaveComputer.java:851)
	at hudson.model.AbstractCIBase.killComputer(AbstractCIBase.java:87)
	at jenkins.model.Jenkins.lambda$_cleanUpDisconnectComputers$11(Jenkins.java:3559)
	at hudson.model.Queue._withLock(Queue.java:1398)
	at hudson.model.Queue.withLock(Queue.java:1274)
	at jenkins.model.Jenkins._cleanUpDisconnectComputers(Jenkins.java:3555)
	at jenkins.model.Jenkins.cleanUp(Jenkins.java:3438)
	at hudson.WebAppMain.contextDestroyed(WebAppMain.java:441)
	at org.eclipse.jetty.server.handler.ContextHandler.callContextDestroyed(ContextHandler.java:1075)
	at org.eclipse.jetty.servlet.ServletContextHandler.callContextDestroyed(ServletContextHandler.java:584)
	at org.eclipse.jetty.server.handler.ContextHandler.contextDestroyed(ContextHandler.java:1038)
	at org.eclipse.jetty.servlet.ServletHandler.doStop(ServletHandler.java:319)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.security.SecurityHandler.doStop(SecurityHandler.java:437)
	at org.eclipse.jetty.security.ConstraintSecurityHandler.doStop(ConstraintSecurityHandler.java:423)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.session.SessionHandler.doStop(SessionHandler.java:520)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.handler.ContextHandler.stopContext(ContextHandler.java:1061)
	at org.eclipse.jetty.servlet.ServletContextHandler.stopContext(ServletContextHandler.java:386)
	at org.eclipse.jetty.webapp.WebAppContext.stopWebapp(WebAppContext.java:1454)
	at org.eclipse.jetty.webapp.WebAppContext.stopContext(WebAppContext.java:1420)
	at org.eclipse.jetty.server.handler.ContextHandler.doStop(ContextHandler.java:1115)
	at org.eclipse.jetty.servlet.ServletContextHandler.doStop(ServletContextHandler.java:297)
	at org.eclipse.jetty.webapp.WebAppContext.doStop(WebAppContext.java:547)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.Server.doStop(Server.java:470)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at winstone.Launcher.shutdown(Launcher.java:318)
	at winstone.ShutdownHook.run(ShutdownHook.java:25)
Caused: hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@2c9da422:slave2": Remote call on slave2 failed. The channel is closing down or has closed down
	at hudson.remoting.Channel.call(Channel.java:994)
	at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:286)
	at com.sun.proxy.$Proxy74.isAlive(Unknown Source)
	at hudson.Launcher$RemoteLauncher$ProcImpl.isAlive(Launcher.java:1211)
	at hudson.Launcher$RemoteLauncher$ProcImpl.join(Launcher.java:1203)
	at hudson.tasks.CommandInterpreter.join(CommandInterpreter.java:195)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:145)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:92)
	at hudson.tasks.BuildStepMonitor$1.perform(BuildStepMonitor.java:20)
	at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:803)
	at hudson.model.Build$BuildExecution.build(Build.java:197)
	at hudson.model.Build$BuildExecution.doRun(Build.java:163)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:513)
	at hudson.model.Run.execute(Run.java:1906)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
	at hudson.model.ResourceController.execute(ResourceController.java:97)
	at hudson.model.Executor.run(Executor.java:429)
FATAL: Unable to delete script file /tmp/jenkins5068048983343736557.sh
java.io.IOException
	at hudson.remoting.Channel.close(Channel.java:1499)
	at hudson.remoting.Channel.close(Channel.java:1455)
	at hudson.slaves.SlaveComputer.closeChannel(SlaveComputer.java:884)
	at hudson.slaves.SlaveComputer.kill(SlaveComputer.java:851)
	at hudson.model.AbstractCIBase.killComputer(AbstractCIBase.java:87)
	at jenkins.model.Jenkins.lambda$_cleanUpDisconnectComputers$11(Jenkins.java:3559)
	at hudson.model.Queue._withLock(Queue.java:1398)
	at hudson.model.Queue.withLock(Queue.java:1274)
	at jenkins.model.Jenkins._cleanUpDisconnectComputers(Jenkins.java:3555)
	at jenkins.model.Jenkins.cleanUp(Jenkins.java:3438)
	at hudson.WebAppMain.contextDestroyed(WebAppMain.java:441)
	at org.eclipse.jetty.server.handler.ContextHandler.callContextDestroyed(ContextHandler.java:1075)
	at org.eclipse.jetty.servlet.ServletContextHandler.callContextDestroyed(ServletContextHandler.java:584)
	at org.eclipse.jetty.server.handler.ContextHandler.contextDestroyed(ContextHandler.java:1038)
	at org.eclipse.jetty.servlet.ServletHandler.doStop(ServletHandler.java:319)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.security.SecurityHandler.doStop(SecurityHandler.java:437)
	at org.eclipse.jetty.security.ConstraintSecurityHandler.doStop(ConstraintSecurityHandler.java:423)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.session.SessionHandler.doStop(SessionHandler.java:520)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.handler.ContextHandler.stopContext(ContextHandler.java:1061)
	at org.eclipse.jetty.servlet.ServletContextHandler.stopContext(ServletContextHandler.java:386)
	at org.eclipse.jetty.webapp.WebAppContext.stopWebapp(WebAppContext.java:1454)
	at org.eclipse.jetty.webapp.WebAppContext.stopContext(WebAppContext.java:1420)
	at org.eclipse.jetty.server.handler.ContextHandler.doStop(ContextHandler.java:1115)
	at org.eclipse.jetty.servlet.ServletContextHandler.doStop(ServletContextHandler.java:297)
	at org.eclipse.jetty.webapp.WebAppContext.doStop(WebAppContext.java:547)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.stop(ContainerLifeCycle.java:180)
	at org.eclipse.jetty.util.component.ContainerLifeCycle.doStop(ContainerLifeCycle.java:201)
	at org.eclipse.jetty.server.handler.AbstractHandler.doStop(AbstractHandler.java:108)
	at org.eclipse.jetty.server.Server.doStop(Server.java:470)
	at org.eclipse.jetty.util.component.AbstractLifeCycle.stop(AbstractLifeCycle.java:94)
	at winstone.Launcher.shutdown(Launcher.java:318)
	at winstone.ShutdownHook.run(ShutdownHook.java:25)
Caused: hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@2c9da422:slave2": Remote call on slave2 failed. The channel is closing down or has closed down
	at hudson.remoting.Channel.call(Channel.java:994)
	at hudson.FilePath.act(FilePath.java:1159)
	at hudson.FilePath.act(FilePath.java:1148)
	at hudson.FilePath.delete(FilePath.java:1671)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:163)
	at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:92)
	at hudson.tasks.BuildStepMonitor$1.perform(BuildStepMonitor.java:20)
	at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:803)
	at hudson.model.Build$BuildExecution.build(Build.java:197)
	at hudson.model.Build$BuildExecution.doRun(Build.java:163)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:513)
	at hudson.model.Run.execute(Run.java:1906)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
	at hudson.model.ResourceController.execute(ResourceController.java:97)
	at hudson.model.Executor.run(Executor.java:429)
Build step 'Execute shell' marked build as failure
