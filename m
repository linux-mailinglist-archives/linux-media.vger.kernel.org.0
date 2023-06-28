Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C617410F7
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 14:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjF1MfH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 28 Jun 2023 08:35:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55424 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbjF1MfF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 08:35:05 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qEUNz-009CT9-JD; Wed, 28 Jun 2023 12:35:03 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qEUNy-000kiE-0d;
        Wed, 28 Jun 2023 12:35:01 +0000
Date:   Wed, 28 Jun 2023 12:35:01 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1443427732.7.1687955701487@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv3 #10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv3
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv3/10/display/redirect>

Changes:


------------------------------------------
[...truncated 1.13 KB...]
 > git --version # timeout=10
 > git --version # 'git version 2.39.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/xawtv3.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git://linuxtv.org/xawtv3.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 36dc44e68e5886339b4a0fbe3f404fb1a4fd2292 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 36dc44e68e5886339b4a0fbe3f404fb1a4fd2292 # timeout=10
Commit message: "v4l-conf: simplify stat message"
 > git rev-list --no-walk 36dc44e68e5886339b4a0fbe3f404fb1a4fd2292 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 36dc44e68e5886339b4a0fbe3f404fb1a4fd2292^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/xawtv3.git'
[GitCheckoutListener] Found previous build 'xawtv3 #9' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '36dc44e'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '36dc44e' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@71f7547'
[xawtv3] $ /bin/sh -xe /tmp/jenkins8855287693969766230.sh
+ ./autogen.sh
+ autoconf
configure.ac:5: warning: The macro `AC_CONFIG_HEADER' is obsolete.
configure.ac:5: You should run autoupdate.
./lib/autoconf/status.m4:719: AC_CONFIG_HEADER is expanded from...
configure.ac:5: the top level
configure.ac:362: warning: AC_OUTPUT should be used without arguments.
configure.ac:362: You should run autoupdate.
+ autoheader
+ rm -rf autom4te.cache
+ ./configure
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether gcc accepts -g... yes
checking for gcc option to enable C11 features... none needed
checking for g++... g++
checking whether the compiler supports GNU C++... yes
checking whether g++ accepts -g... yes
checking for g++ option to enable C++11 features... none needed
checking how to run the C preprocessor... gcc -E
checking for a BSD-compatible install... /usr/bin/install -c
checking for gccmakedep... no
checking for makedepend... no
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for sys/mkdev.h... no
checking for sys/sysmacros.h... yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for getopt.h... yes
checking for soundcard.h... no
checking for unistd.h... (cached) yes
checking for sys/select.h... yes
checking for sys/soundcard.h... yes
checking for alsa/asoundlib.h... yes
checking for linux/joystick.h... yes
checking for dev/ic/bt8xx.h... no
checking for machine/ioctl_bt848.h... no
checking for ftello... yes
checking for fseeko... yes
checking for getpt... yes
checking for getnameinfo... yes
checking for getopt_long... yes
checking for strcasestr... yes
checking for dlopen... yes
checking for ELF... yes
checking for pthread_create in -lpthread... yes
checking for main in -lossaudio... no
checking for initscr in -lncursesw... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for Xft... yes
checking for v4l2_fd_open in -lv4l2... yes
checking for explain_open in -lexplain... no
checking for jpeg_start_compress in -ljpeg... yes
checking for snd_seq_open in -lasound... yes
checking for lirc_init in -llirc_client... yes
checking for vbi_capture_fd in -lzvbi... yes
checking for aa_autoinit in -laa... yes
checking for dv_decoder_new in -ldv... yes
checking for lqt_query_registry in -lquicktime... yes
checking for XF86DGAQueryExtension in -lXxf86dga... yes
checking for XF86VidModeQueryExtension in -lXxf86vm... yes
checking for DPMSQueryExtension in -lXdpms... no
checking for DPMSQueryExtension in -lXext... yes
checking for XineramaQueryExtension in -lXinerama... yes
checking for XRenderQueryExtension in -lXrender... yes
checking for XRRConfigCurrentConfiguration in -lXrandr... yes
checking for XvQueryExtension in -lXv... yes
checking for XmStringGenerate in -lXm... yes
checking for glXChooseVisual in -lGL... yes
checking for X11 config directory... /etc/X11
checking for X11 app-defaults directory... /etc/X11/app-defaults
checking if mmx should be used... no
configure: creating ./config.status
config.status: creating Makefile
config.status: WARNING:  'Makefile.in' seems to ignore the --datarootdir setting
config.status: creating xawtv.spec
config.status: creating config.h

compile time options summary
============================

    aalib        : yes
    alsa         : yes
    dv           : yes
    QuickTime    : yes
    OpenMotif    : yes
    X11R6        : yes
    OpenGL       : yes
    zvbi         : yes
    libv4l       : yes
    libexplain   : no
    lirc         : yes

+ ./configure
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether gcc accepts -g... yes
checking for gcc option to enable C11 features... none needed
checking for g++... g++
checking whether the compiler supports GNU C++... yes
checking whether g++ accepts -g... yes
checking for g++ option to enable C++11 features... none needed
checking how to run the C preprocessor... gcc -E
checking for a BSD-compatible install... /usr/bin/install -c
checking for gccmakedep... no
checking for makedepend... no
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for sys/mkdev.h... no
checking for sys/sysmacros.h... yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for getopt.h... yes
checking for soundcard.h... no
checking for unistd.h... (cached) yes
checking for sys/select.h... yes
checking for sys/soundcard.h... yes
checking for alsa/asoundlib.h... yes
checking for linux/joystick.h... yes
checking for dev/ic/bt8xx.h... no
checking for machine/ioctl_bt848.h... no
checking for ftello... yes
checking for fseeko... yes
checking for getpt... yes
checking for getnameinfo... yes
checking for getopt_long... yes
checking for strcasestr... yes
checking for dlopen... yes
checking for ELF... yes
checking for pthread_create in -lpthread... yes
checking for main in -lossaudio... no
checking for initscr in -lncursesw... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for Xft... yes
checking for v4l2_fd_open in -lv4l2... yes
checking for explain_open in -lexplain... no
checking for jpeg_start_compress in -ljpeg... yes
checking for snd_seq_open in -lasound... yes
checking for lirc_init in -llirc_client... yes
checking for vbi_capture_fd in -lzvbi... yes
checking for aa_autoinit in -laa... yes
checking for dv_decoder_new in -ldv... yes
checking for lqt_query_registry in -lquicktime... yes
checking for XF86DGAQueryExtension in -lXxf86dga... yes
checking for XF86VidModeQueryExtension in -lXxf86vm... yes
checking for DPMSQueryExtension in -lXdpms... no
checking for DPMSQueryExtension in -lXext... yes
checking for XineramaQueryExtension in -lXinerama... yes
checking for XRenderQueryExtension in -lXrender... yes
checking for XRRConfigCurrentConfiguration in -lXrandr... yes
checking for XvQueryExtension in -lXv... yes
checking for XmStringGenerate in -lXm... yes
checking for glXChooseVisual in -lGL... yes
checking for X11 config directory... /etc/X11
checking for X11 app-defaults directory... /etc/X11/app-defaults
checking if mmx should be used... no
configure: creating ./config.status
config.status: creating Makefile
config.status: WARNING:  'Makefile.in' seems to ignore the --datarootdir setting
config.status: creating xawtv.spec
config.status: creating config.h
config.status: config.h is unchanged

compile time options summary
============================

    aalib        : yes
    alsa         : yes
    dv           : yes
    QuickTime    : yes
    OpenMotif    : yes
    X11R6        : yes
    OpenGL       : yes
    zvbi         : yes
    libv4l       : yes
    libexplain   : no
    lirc         : yes

+ make
  CC	  console/dump-mixers.o
  LD	  console/dump-mixers
  CC	  console/record.o
console/record.c: In function ‘ctrlc’:
console/record.c:432:17: error: ‘sys_siglist’ undeclared (first use in this function)
  432 |                 sys_siglist[signal]);
      |                 ^~~~~~~~~~~
console/record.c:432:17: note: each undeclared identifier is reported only once for each function it appears in
make: *** [mk/Compile.mk:55: console/record.o] Error 1
Build step 'Execute shell' marked build as failure
