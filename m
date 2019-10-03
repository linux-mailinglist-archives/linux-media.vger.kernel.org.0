Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B817C996B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 10:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfJCIBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 04:01:20 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35987 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfJCIBU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 04:01:20 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFw2z-0007pA-NO; Thu, 03 Oct 2019 08:01:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFw3M-0000Y0-IU; Thu, 03 Oct 2019 08:01:36 +0000
Date:   Thu, 3 Oct 2019 08:01:36 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1358528102.0.1570089696546.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #50
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/50/display/redirect?page=changes>

Changes:

[hverkuil-cisco] utils/libcecutil: add CEC utility library

[hverkuil-cisco] cec-follower: switch to the new CEC utilities library

[hverkuil-cisco] cec-compliance: use the new CEC utilities library

[hverkuil-cisco] cec-ctl: use the new CEC utilities library

[hverkuil-cisco] utils/common/cec*: remove unused cec files

[hverkuil-cisco] cec-htng(-funcs).h: move to libcecutil


------------------------------------------
[...truncated 9.45 KB...]
checking for rcc-qt5... no
checking for rcc... rcc
checking for QT5GL... yes
checking for Qt5 Desktop OpenGL... yes
checking for ALSA... yes
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
checking for SDL2... yes
checking for library containing backtrace... none required
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

    gconv                      : no

    dynamic libv4l             : yes
    v4l_plugins                : yes
    v4l_wrappers               : yes
    libdvbv5                   : yes
    dvbv5-daemon               : yes
    v4lutils                   : yes
    qv4l2                      : yes
    qvidcap                    : yes
    v4l2-ctl uses libv4l       : yes
    v4l2-compliance            : yes
    v4l2-compliance uses libv4l: yes
    BPF IR Decoders:           : yes
+ make
make  all-recursive
make[1]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/'>
Making all in v4l-utils-po
make[2]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/v4l-utils-po'>
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/v4l-utils-po'>
Making all in libdvbv5-po
make[2]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/libdvbv5-po'>
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/libdvbv5-po'>
Making all in lib
make[2]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib'>
Making all in libv4lconvert
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4lconvert'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4lconvert'>
Making all in libv4l2
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l2'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l2'>
Making all in libv4l1
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l1'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l1'>
Making all in libv4l2rds
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l2rds'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l2rds'>
Making all in libv4l-mplane
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l-mplane'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libv4l-mplane'>
Making all in libdvbv5
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libdvbv5'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib/libdvbv5'>
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib'>
make[3]: Nothing to be done for 'all-am'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/lib'>
Making all in utils
make[2]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils'>
Making all in libv4l2util
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libv4l2util'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libv4l2util'>
Making all in libmedia_dev
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libmedia_dev'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libmedia_dev'>
Making all in ivtv-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/ivtv-ctl'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/ivtv-ctl'>
Making all in ir-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/ir-ctl'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/ir-ctl'>
Making all in cx18-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cx18-ctl'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cx18-ctl'>
Making all in keytable
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
Making all in bpf_protocols
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable/bpf_protocols'>
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable/bpf_protocols'>
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
Making all in media-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make  all-am
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
Making all in v4l2-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make  all-am
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
Making all in v4l2-dbg
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-dbg'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-dbg'>
Making all in v4l2-sysfs-path
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-sysfs-path'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-sysfs-path'>
Making all in libcecutil
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libcecutil'>
cec-gen.pl cec-msgs-gen.h ../../include/linux/cec.h ../../utils/libcecutil/cec-htng.h ../../include/linux/cec-funcs.h ../../utils/libcecutil/cec-htng-funcs.h >cec-msgs-gen.h
cec-gen.pl cec-log-gen.h ../../include/linux/cec.h ../../utils/libcecutil/cec-htng.h ../../include/linux/cec-funcs.h ../../utils/libcecutil/cec-htng-funcs.h >cec-log-gen.h
cec-gen.pl cec-parse-gen.h ../../include/linux/cec.h ../../utils/libcecutil/cec-htng.h ../../include/linux/cec-funcs.h ../../utils/libcecutil/cec-htng-funcs.h >cec-parse-gen.h
cec-gen.pl cec-parse-src-gen.h ../../include/linux/cec.h ../../utils/libcecutil/cec-htng.h ../../include/linux/cec-funcs.h ../../utils/libcecutil/cec-htng-funcs.h >cec-parse-src-gen.h
/bin/bash: cec-gen.pl: command not found
/bin/bash: cec-gen.pl: command not found
/bin/bash: cec-gen.pl: command not found
make[3]: *** [Makefile:780: cec-parse-gen.h] Error 127
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [Makefile:780: cec-msgs-gen.h] Error 127
/bin/bash: cec-gen.pl: command not found
make[3]: *** [Makefile:780: cec-log-gen.h] Error 127
make[3]: *** [Makefile:780: cec-parse-src-gen.h] Error 127
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libcecutil'>
make[2]: *** [Makefile:481: all-recursive] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils'>
make[1]: *** [Makefile:590: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/'>
make: *** [Makefile:517: all] Error 2
Build step 'Execute shell' marked build as failure
