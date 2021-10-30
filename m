Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA06A440800
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 10:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhJ3Ied convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 30 Oct 2021 04:34:33 -0400
Received: from www.linuxtv.org ([130.149.80.248]:46356 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229546AbhJ3Ied (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 04:34:33 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mgjmU-007AfF-7W; Sat, 30 Oct 2021 08:32:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mgjmS-00620S-RV; Sat, 30 Oct 2021 08:32:00 +0000
Date:   Sat, 30 Oct 2021 08:32:00 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1472036654.0.1635582720257@builder.linuxtv.org>
In-Reply-To: <146487819.0.1635535927942@builder.linuxtv.org>
References: <146487819.0.1635535927942@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #366
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/366/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] v4l2grab: optimize conversion routines


------------------------------------------
[...truncated 9.25 KB...]
checking for the common suffixes of directories in the library search path... lib,lib,lib
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyPreferredLanguages... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for mode_t... yes
checking for promoted mode_t type... mode_t
checking whether the -Werror option is usable... yes
checking for simple visibility declarations... yes
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
checking whether pthreads work with "-pthread" and "-lpthread"... yes
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
config.status: config.h is unchanged
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
make[2]: Nothing to be done for 'all'.
Making all in libdvbv5-po
make[2]: Nothing to be done for 'all'.
Making all in lib
Making all in libv4lconvert
make[3]: Nothing to be done for 'all'.
Making all in libv4l2
make[3]: Nothing to be done for 'all'.
Making all in libv4l1
make[3]: Nothing to be done for 'all'.
Making all in libv4l2rds
make[3]: Nothing to be done for 'all'.
Making all in libv4l-mplane
make[3]: Nothing to be done for 'all'.
Making all in libdvbv5
make[3]: Nothing to be done for 'all'.
make[3]: Nothing to be done for 'all-am'.
Making all in utils
Making all in libv4l2util
make[3]: Nothing to be done for 'all'.
Making all in libmedia_dev
make[3]: Nothing to be done for 'all'.
Making all in ivtv-ctl
make[3]: Nothing to be done for 'all'.
Making all in ir-ctl
make[3]: Nothing to be done for 'all'.
Making all in cx18-ctl
make[3]: Nothing to be done for 'all'.
Making all in keytable
make[4]: Nothing to be done for 'all-am'.
Making all in media-ctl
make  all-am
make[4]: Nothing to be done for 'all-am'.
Making all in v4l2-ctl
make  all-am
make[4]: Nothing to be done for 'all-am'.
Making all in v4l2-dbg
make[3]: Nothing to be done for 'all'.
Making all in v4l2-sysfs-path
make[3]: Nothing to be done for 'all'.
Making all in libcecutil
make[3]: Nothing to be done for 'all'.
Making all in cec-ctl
make[3]: Nothing to be done for 'all'.
Making all in cec-compliance
make[3]: Nothing to be done for 'all'.
Making all in cec-follower
make[3]: Nothing to be done for 'all'.
Making all in rds-ctl
make[3]: Nothing to be done for 'all'.
Making all in dvb
make[3]: Nothing to be done for 'all'.
Making all in v4l2-compliance
make[3]: Nothing to be done for 'all'.
Making all in qv4l2
make[3]: Nothing to be done for 'all'.
Making all in qvidcap
make[3]: Nothing to be done for 'all'.
make[3]: Nothing to be done for 'all-am'.
Making all in contrib
Making all in test
  CC       v4l2grab.o
v4l2grab.c: In function ‘copy_two_pixels’:
v4l2grab.c:220:3: error: a label can only be part of a statement and a declaration is not a statement
  220 |   int y_off, u_off, u, v;
      |   ^~~
make[3]: *** [Makefile:632: v4l2grab.o] Error 1
make[2]: *** [Makefile:488: all-recursive] Error 1
make[1]: *** [Makefile:602: all-recursive] Error 1
make: *** [Makefile:529: all] Error 2
Build step 'Execute shell' marked build as failure
