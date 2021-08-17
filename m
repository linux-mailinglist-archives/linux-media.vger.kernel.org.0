Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE083EE202
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 03:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbhHQBUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 21:20:30 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59056 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhHQBUa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 21:20:30 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFnll-0025FR-3x; Tue, 17 Aug 2021 01:19:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFnlk-000CJk-1Z; Tue, 17 Aug 2021 01:19:55 +0000
Date:   Tue, 17 Aug 2021 01:19:54 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <306011361.2.1629163194966@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv4 #11
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv4
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv4/11/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/xawtv4/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/xawtv4/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/xawtv4.git # timeout=10
Fetching upstream changes from git://linuxtv.org/xawtv4.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/xawtv4.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision f890bcf135a43772c0fa15d3f539bfe3a029c6e0 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f f890bcf135a43772c0fa15d3f539bfe3a029c6e0 # timeout=10
Commit message: "configure.ac: add glib dependencies to X11 flags"
 > git rev-list --no-walk f890bcf135a43772c0fa15d3f539bfe3a029c6e0 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse f890bcf135a43772c0fa15d3f539bfe3a029c6e0^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/xawtv4.git'
[GitCheckoutListener] Found previous build 'xawtv4 #10' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'f890bcf'
[GitCheckoutListener] -> Using head commit 'f890bcf' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@6bb9b67'
[GitCheckoutListener] -> No new commits found
[xawtv4] $ /bin/sh -xe /tmp/jenkins14796741141389002182.sh
+ ./autogen.sh
+ autoconf
+ autoheader
+ rm -rf autom4te.cache
+ cp /usr/share/automake-1.16/install-sh .
+ ./configure --enable-arts
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking how to run the C preprocessor... gcc -E
checking for a BSD-compatible install... /usr/bin/install -c
checking for gccmakedep... no
checking for makedepend... no
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking soundcard.h usability... no
checking soundcard.h presence... no
checking for soundcard.h... no
checking for unistd.h... (cached) yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking sys/soundcard.h usability... yes
checking sys/soundcard.h presence... yes
checking for sys/soundcard.h... yes
checking alsa/asoundlib.h usability... yes
checking alsa/asoundlib.h presence... yes
checking for alsa/asoundlib.h... yes
checking linux/joystick.h usability... yes
checking linux/joystick.h presence... yes
checking for linux/joystick.h... yes
checking dev/bktr/ioctl_bt848.h usability... no
checking dev/bktr/ioctl_bt848.h presence... no
checking for dev/bktr/ioctl_bt848.h... no
checking dev/ic/bt8xx.h usability... no
checking dev/ic/bt8xx.h presence... no
checking for dev/ic/bt8xx.h... no
checking linux/dvb/dmx.h usability... yes
checking linux/dvb/dmx.h presence... yes
checking for linux/dvb/dmx.h... yes
checking for ftello... yes
checking for fseeko... yes
checking for getpt... yes
checking for getnameinfo... yes
checking for getopt_long... yes
checking for strcasestr... yes
checking for memmem... yes
checking for dlopen... no
checking for iconv_open... yes
checking for dlopen in -ldl... yes
checking for ELF... yes
checking for pthread_create in -lpthread... yes
checking for main in -lossaudio... no
checking for initscr in -lncurses... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for Xft... yes
checking for jpeg_start_compress in -ljpeg... yes
checking for snd_seq_open in -lasound... yes
checking for aRts... no
checking for mad_decoder_init in -lmad... yes
checking for mpeg2_init in -lmpeg2... yes
checking for lirc_init in -llirc_client... yes
checking for vbi_capture_fd in -lzvbi... yes
checking for vbi_capture_proxy_new in -lzvbi... yes
checking for vbi_capture_dvb_new2 in -lzvbi... yes
*** aalib support disabled
checking for dv_decoder_new in -ldv... yes
Package glib was not found in the pkg-config search path.
Perhaps you should add the directory containing `glib.pc'
to the PKG_CONFIG_PATH environment variable
No package 'glib' found
checking for lqt_query_registry in -lquicktime... yes
checking for DPMSQueryExtension in -lXdpms... no
checking for DPMSQueryExtension in -lXext... yes
checking for XineramaQueryExtension in -lXinerama... yes
checking for XRenderQueryExtension in -lXrender... yes
checking for XvQueryExtension in -lXv... yes
checking for XmStringGenerate in -lXm... yes
checking for glXChooseVisual in -lGL... yes
checking for gtk+ 2.4... yes
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

    aalib        : no
    alsa         : yes
    aRts         : no
    dv           : yes
    QuickTime    : yes
    mad          : yes
    mpeg2        : yes
    X11R6        : yes
    gtk+         : yes
    OpenMotif    : yes
    OpenGL       : yes
    zvbi         : yes
    DVB          : yes

+ make
make: *** No rule to make target '/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h', needed by 'console/dump-mixers.o'.  Stop.
Build step 'Execute shell' marked build as failure
