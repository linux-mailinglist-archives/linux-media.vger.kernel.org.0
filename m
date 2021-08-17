Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A323EE204
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 03:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhHQBUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 21:20:48 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59072 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233244AbhHQBUr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 21:20:47 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFnm2-0025GF-2o; Tue, 17 Aug 2021 01:20:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFnm0-000FKz-RC; Tue, 17 Aug 2021 01:20:12 +0000
Date:   Tue, 17 Aug 2021 01:20:11 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1583032005.3.1629163211761@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #344
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/344/display/redirect>

Changes:


------------------------------------------
[...truncated 6.01 KB...]
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to x86_64-pc-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for ar... ar
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for sysroot... no
checking for a working dd... /bin/dd
checking how to truncate binary pipes... /bin/dd bs=4096 count=1
checking for mt... mt
checking if mt is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking how to run the C++ preprocessor... g++ -E
checking for ld used by g++... /usr/bin/ld -m elf_x86_64
checking if the linker (/usr/bin/ld -m elf_x86_64) is GNU ld... yes
checking whether the g++ linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether ln -s works... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for doxygen... /usr/bin/doxygen
checking for perl... /usr/bin/perl
checking for dot... /usr/bin/dot
checking for latex... /usr/bin/latex
checking for makeindex... /usr/bin/makeindex
checking for dvips... /usr/bin/dvips
checking for egrep... /bin/egrep
checking for pdflatex... /usr/bin/pdflatex
checking for makeindex... (cached) /usr/bin/makeindex
checking for egrep... (cached) /bin/egrep
checking whether NLS is requested... yes
checking for msgfmt... /usr/bin/msgfmt
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
checking for msgmerge... /usr/bin/msgmerge
checking for ld used by gcc... /usr/bin/ld -m elf_x86_64
checking if the linker (/usr/bin/ld -m elf_x86_64) is GNU ld... yes
checking for shared library run path origin... done
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyPreferredLanguages... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for mode_t... yes
checking for promoted mode_t type... mode_t
./configure: line 20641: gl_VISIBILITY: command not found
checking sys/klog.h usability... yes
checking sys/klog.h presence... yes
checking for sys/klog.h... yes
checking for klogctl... yes
checking for ioctl with POSIX signature... no
checking for __secure_getenv... no
checking for secure_getenv... yes
checking whether sys/types.h defines makedev... no
checking sys/mkdev.h usability... no
checking sys/mkdev.h presence... no
checking for sys/mkdev.h... no
checking sys/sysmacros.h usability... yes
checking sys/sysmacros.h presence... yes
checking for sys/sysmacros.h... yes
checking for x11... yes
checking for libelf... yes
checking for clang... no
checking for gl... yes
checking for glu... yes
checking jpeglib.h usability... yes
checking jpeglib.h presence... yes
checking for jpeglib.h... yes
checking for jpeg_read_header in -ljpeg... yes
checking for Qt5Core >= 5.0 Qt5Gui >= 5.0 Qt5Widgets >= 5.0... yes
checking for Qt5Core >= 5.4 Qt5Gui >= 5.4 Qt5Widgets >= 5.4... yes
checking for moc-qt5... no
checking for moc... moc
checking for uic-qt5... no
checking for uic... uic
checking for rcc-qt5... no
checking for rcc... rcc
checking for Qt5OpenGL >= 5.4 gl... yes
checking for Qt5 Desktop OpenGL... yes
checking for alsa... yes
checking for libudev... yes
checking whether gcc is Clang... no
checking whether pthreads work with -pthread... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking whether more special flags are required for pthreads... no
checking for PTHREAD_PRIO_INHERIT... yes
checking for library containing dlopen... -ldl
checking argp.h usability... yes
checking argp.h presence... yes
checking for argp.h... yes
checking for library containing argp_parse... none required
checking for fork... yes
checking linux/i2c-dev.h usability... yes
checking linux/i2c-dev.h presence... yes
checking for linux/i2c-dev.h... yes
checking for iconv... yes
checking for working iconv... yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking if gcc accepts -m32... yes
checking for sdl2 SDL2_image... yes
checking for library containing backtrace... none required
checking for libbpf... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating lib/Makefile
config.status: creating lib/libv4lconvert/Makefile
config.status: creating lib/libv4l2/Makefile
config.status: creating lib/libv4l1/Makefile
config.status: creating lib/libdvbv5/Makefile
config.status: creating lib/libv4l2rds/Makefile
config.status: creating lib/libv4l-mplane/Makefile
config.status: creating utils/Makefile
config.status: creating utils/libv4l2util/Makefile
config.status: creating utils/libmedia_dev/Makefile
config.status: creating utils/dvb/Makefile
config.status: creating utils/keytable/Makefile
config.status: creating utils/keytable/bpf_protocols/Makefile
config.status: creating utils/ir-ctl/Makefile
config.status: creating utils/cx18-ctl/Makefile
config.status: creating utils/ivtv-ctl/Makefile
config.status: creating utils/media-ctl/Makefile
config.status: creating utils/v4l2-compliance/Makefile
config.status: creating utils/v4l2-ctl/Makefile
config.status: creating utils/v4l2-dbg/Makefile
config.status: creating utils/v4l2-sysfs-path/Makefile
config.status: creating utils/qv4l2/Makefile
config.status: creating utils/libcecutil/Makefile
config.status: creating utils/cec-ctl/Makefile
config.status: creating utils/cec-ctl/cec-ctl.1
config.status: creating utils/cec-compliance/Makefile
config.status: creating utils/cec-compliance/cec-compliance.1
config.status: creating utils/cec-follower/Makefile
config.status: creating utils/cec-follower/cec-follower.1
config.status: creating utils/qvidcap/Makefile
config.status: creating utils/rds-ctl/Makefile
config.status: creating contrib/Makefile
config.status: creating contrib/freebsd/Makefile
config.status: creating contrib/test/Makefile
config.status: creating contrib/gconv/Makefile
config.status: creating contrib/cobalt-ctl/Makefile
config.status: creating contrib/decode_tm6000/Makefile
config.status: creating contrib/xc3028-firmware/Makefile
config.status: creating contrib/rds-saa6588/Makefile
config.status: creating v4l-utils-po/Makefile.in
config.status: creating libdvbv5-po/Makefile.in
config.status: creating v4l-utils.spec
config.status: creating lib/libv4lconvert/libv4lconvert.pc
config.status: creating lib/libv4l1/libv4l1.pc
config.status: creating lib/libv4l2/libv4l2.pc
config.status: creating lib/libdvbv5/libdvbv5.pc
config.status: creating lib/libv4l2rds/libv4l2rds.pc
config.status: creating utils/media-ctl/libmediactl.pc
config.status: creating utils/media-ctl/libv4l2subdev.pc
config.status: creating lib/include/libdvbv5/libdvb-version.h
config.status: creating utils/qv4l2/qv4l2.1
config.status: creating utils/qvidcap/qvidcap.1
config.status: creating utils/v4l2-compliance/v4l2-compliance.1
config.status: creating utils/v4l2-ctl/v4l2-ctl.1
config.status: creating utils/keytable/ir-keytable.1
config.status: creating utils/keytable/rc_keymap.5
config.status: creating utils/ir-ctl/ir-ctl.1
config.status: creating utils/dvb/dvb-fe-tool.1
config.status: creating utils/dvb/dvbv5-scan.1
config.status: creating utils/dvb/dvb-format-convert.1
config.status: creating utils/dvb/dvbv5-zap.1
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating v4l-utils-po/POTFILES
config.status: creating v4l-utils-po/Makefile
config.status: creating libdvbv5-po/POTFILES
config.status: creating libdvbv5-po/Makefile

compile time options summary
============================

    Host OS                    : linux-gnu
    X11                        : yes
    GL                         : yes
    glu                        : yes
    libelf		       : yes
    libjpeg                    : yes
    libudev                    : yes
    pthread                    : yes
    QT version                 : v5.4 with QtGL
    ALSA support               : yes
    SDL support		       : yes

    build dynamic libs         : yes
    build static libs          : yes

    gconv                      : yes

    dynamic libv4l             : yes
    v4l_plugins                : yes
    v4l_wrappers               : yes
    libdvbv5                   : yes
    dvbv5-daemon               : yes
    v4lutils                   : yes
    qv4l2                      : yes
    qvidcap                    : yes
    v4l2-ctl uses libv4l       : yes
    v4l2-ctl-32                : yes
    v4l2-compliance            : yes
    v4l2-compliance uses libv4l: yes
    v4l2-compliance-32         : yes
    BPF IR Decoders:           : no
+ make
make --no-print-directory all-recursive
Making all in v4l-utils-po
*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.20 but the autoconf macros are from gettext version 0.19
make[2]: *** [Makefile:233: stamp-po] Error 1
make[1]: *** [Makefile:597: all-recursive] Error 1
make: *** [Makefile:524: all] Error 2
Build step 'Execute shell' marked build as failure
