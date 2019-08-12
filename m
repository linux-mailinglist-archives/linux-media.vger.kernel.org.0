Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BBE89FA3
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfHLN11 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 12 Aug 2019 09:27:27 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40036 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728705AbfHLN10 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:27:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxAM4-0004WA-F7; Mon, 12 Aug 2019 13:27:20 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxAM4-00007R-K3; Mon, 12 Aug 2019 13:27:20 +0000
Date:   Mon, 12 Aug 2019 13:27:20 +0000 (UTC)
From:   mchehab@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <870474744.17.1565616440616.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1045441849.16.1565616341734.JavaMail.jenkins@builder.linuxtv.org>
References: <1045441849.16.1565616341734.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv4 #2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv4
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv4/2/display/redirect>

Changes:

------------------------------------------
[...truncated 4.03 KB...]
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
*** arts disabled
checking for mad_decoder_init in -lmad... no
checking for mpeg2_init in -lmpeg2... no
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
checking for gtk+ 2.4... gtk+-x11-2.0 >= 2.4 not found
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

    aalib        : no
    alsa         : yes
    aRts         : no
    dv           : yes
    QuickTime    : yes
    mad          : no
    mpeg2        : no
    X11R6        : yes
    gtk+         : no
    OpenMotif    : yes
    OpenGL       : yes
    zvbi         : yes
    DVB          : yes

+ make
  CC	  console/dump-mixers.o
  LD	  console/dump-mixers
  CC	  console/record.o
  LD	  console/record
  CC	  console/showriff.o
  LD	  console/showriff
  CC	  console/showqt.o
console/showqt.c: In function ‘handle_classic_atom’:
console/showqt.c:505:19: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 7 [-Wformat-overflow=]
      sprintf(si,"[%d] ",loop);
                   ^~
console/showqt.c:505:17: note: directive argument in the range [0, 2147483647]
      sprintf(si,"[%d] ",loop);
                 ^~~~~~~
console/showqt.c:505:6: note: ‘sprintf’ output between 5 and 14 bytes into a destination of size 8
      sprintf(si,"[%d] ",loop);
      ^~~~~~~~~~~~~~~~~~~~~~~~
console/showqt.c:510:19: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 7 [-Wformat-overflow=]
      sprintf(si,"[%d] ",loop);
                   ^~
console/showqt.c:510:17: note: directive argument in the range [1, 2147483647]
      sprintf(si,"[%d] ",loop);
                 ^~~~~~~
console/showqt.c:510:6: note: ‘sprintf’ output between 5 and 14 bytes into a destination of size 8
      sprintf(si,"[%d] ",loop);
      ^~~~~~~~~~~~~~~~~~~~~~~~
  LD	  console/showqt
  CC	  console/streamer.o
  CC	  common/sound.o
  CC	  common/webcam.o
  CC	  common/tuning.o
  CC	  common/commands.o
common/commands.c: In function ‘keypad_handler’:
common/commands.c:1184:18: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 8 [-Wformat-overflow=]
      sprintf(ch,"%d",n);
                  ^~
common/commands.c:1184:17: note: directive argument in the range [1, 2147483647]
      sprintf(ch,"%d",n);
                 ^~~~
common/commands.c:1184:6: note: ‘sprintf’ output between 2 and 11 bytes into a destination of size 8
      sprintf(ch,"%d",n);
      ^~~~~~~~~~~~~~~~~~
  CC	  common/devs.o
common/devs.c: In function ‘device_probe_video’:
common/devs.c:127:15: warning: variable ‘add’ set but not used [-Wunused-but-set-variable]
     int err,i,add=0;
               ^~~
common/devs.c: In function ‘device_probe_dvb’:
common/devs.c:193:11: warning: variable ‘add’ set but not used [-Wunused-but-set-variable]
     int i,add = 0;
           ^~~
  CC	  common/parseconfig.o
  CC	  common/fifo.o
  CC	  common/capture.o
  CC	  common/event.o
  CC	  common/tv-config.o
  CC	  common/dvb-tuning.o
common/dvb-tuning.c: In function ‘fixup_numbers’:
common/dvb-tuning.c:329:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
     switch (h->info.type) {
     ^~~~~~
common/dvb-tuning.c: In function ‘dump_fe_info’:
common/dvb-tuning.c:365:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
     switch (h->info.type) {
     ^~~~~~
common/dvb-tuning.c: In function ‘dvb_frontend_tune’:
common/dvb-tuning.c:433:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
     switch (h->info.type) {
     ^~~~~~
common/dvb-tuning.c: In function ‘parse_vdr_diseqc.constprop’:
common/dvb-tuning.c:1126:26: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
  sprintf(section,"diseqc-%d",i++);
                          ^~
common/dvb-tuning.c:1126:18: note: directive argument in the range [0, 2147483647]
  sprintf(section,"diseqc-%d",i++);
                  ^~~~~~~~~~~
common/dvb-tuning.c:1126:2: note: ‘sprintf’ output between 9 and 18 bytes into a destination of size 16
  sprintf(section,"diseqc-%d",i++);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC	  structs/struct-dvb.o
  CC	  structs/struct-dump.o
  CC	  libng/grab-ng.o
libng/grab-ng.c: In function ‘ng_filter_single’:
libng/grab-ng.c:964:11: warning: variable ‘handle’ set but not used [-Wunused-but-set-variable]
     void *handle;
           ^~~~~~
  CC	  libng/devices.o
  CC	  libng/writefile.o
  CC	  libng/parse-mpeg.o
libng/parse-mpeg.c: In function ‘parse_pmt_desc’:
libng/parse-mpeg.c:680:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
     int i,t,l;
             ^
libng/parse-mpeg.c: In function ‘get_lang_tag’:
libng/parse-mpeg.c:697:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
     int i,t,l;
             ^
  CC	  libng/parse-dvb.o
libng/parse-dvb.c: In function ‘parse_nit_desc_2’:
libng/parse-dvb.c:196:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
     int i,t,l;
             ^
libng/parse-dvb.c: In function ‘parse_sdt_desc’:
libng/parse-dvb.c:239:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
     int i,t,l;
             ^
libng/parse-dvb.c: In function ‘mpeg_parse_psi_nit’:
libng/parse-dvb.c:351:6: warning: the address of ‘network’ will always evaluate as ‘true’ [-Waddress]
  if (network)
      ^~~~~~~
  CC	  libng/color_common.o
  CC	  libng/color_packed.o
  CC	  libng/color_lut.o
  CC	  libng/color_yuv2rgb.o
  CC	  libng/convert.o
  CC	  libng/misc.o
  AR	  libng/libng.a
ar: creating libng/libng.a
  LD	  console/streamer
  CC	  console/webcam.o
  CC	  console/ftp.o
  LD	  console/webcam
  CC	  console/scantv.o
console/scantv.c: In function ‘main’:
console/scantv.c:236:31: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
       sprintf(dummy,"unknown (%s)",fchannel);
                               ^~
  CC	  common/vbi-dvb.o
  CC	  common/vbi-data.o
In file included from common/vbi-data.c:17:
common/vbi-sim.c: In function ‘ttx_sim’:
common/vbi-sim.c:186:13: warning: variable ‘n’ set but not used [-Wunused-but-set-variable]
   int i, j, n;
             ^
  LD	  console/scantv
  CC	  console/radio.o
  LD	  console/radio
  CC	  console/v4l-info.o
  CC	  structs/struct-v4l.o
  CC	  structs/struct-v4l2.o
  LD	  console/v4l-info
  CC	  console/v4l-conf.o
  LD	  console/v4l-conf
  CC	  debug/sysfs.o
debug/sysfs.c: In function ‘sysfs_find_path’:
debug/sysfs.c:63:33: warning: ‘%s’ directive output may be truncated writing up to 255 bytes into a region of size 63 [-Wformat-truncation=]
  snprintf(path,sizeof(path),"%s/%s",sysfs_base,e_class->d_name);
                                 ^~
debug/sysfs.c:63:2: note: ‘snprintf’ output 2 or more bytes (assuming 257) into a destination of size 64
  snprintf(path,sizeof(path),"%s/%s",sysfs_base,e_class->d_name);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  LD	  debug/sysfs
  CC	  debug/xvideo.o
debug/xvideo.c: In function ‘resize_event’:
debug/xvideo.c:96:12: warning: variable ‘wy’ set but not used [-Wunused-but-set-variable]
     int wx,wy,wwidth,wheight;
            ^~
debug/xvideo.c:96:9: warning: variable ‘wx’ set but not used [-Wunused-but-set-variable]
     int wx,wy,wwidth,wheight;
         ^~
  LD	  debug/xvideo
  CC	  debug/dvb-signal.o
  LD	  debug/dvb-signal
  CC	  debug/vbi-rec.o
  LD	  debug/vbi-rec
  CC	  debug/epg.o
debug/epg.c: In function ‘main’:
debug/epg.c:278:9: warning: variable ‘tuned’ set but not used [-Wunused-but-set-variable]
     int tuned = 0;
         ^~~~~
debug/epg.c:67:32: warning: ‘%+ld’ directive output may be truncated writing between 2 and 17 bytes into a region of size 5 [-Wformat-truncation=]
     snprintf(tz,sizeof(tz),"GMT%+ld",-timezone/3600);
                                ^~~~
debug/epg.c:67:28: note: directive argument in the range [-2562047788015215, 2562047788015215]
     snprintf(tz,sizeof(tz),"GMT%+ld",-timezone/3600);
                            ^~~~~~~~~
debug/epg.c:67:5: note: ‘snprintf’ output between 6 and 21 bytes into a destination of size 8
     snprintf(tz,sizeof(tz),"GMT%+ld",-timezone/3600);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC	  common/dvb-monitor.o
common/dvb-monitor.c:14:10: fatal error: glib.h: No such file or directory
 #include <glib.h>
          ^~~~~~~~
compilation terminated.
make: *** [mk/Compile.mk:55: common/dvb-monitor.o] Error 1
Build step 'Execute shell' marked build as failure
