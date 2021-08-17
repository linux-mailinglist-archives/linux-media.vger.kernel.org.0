Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8FC3EEAB8
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbhHQKOx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Aug 2021 06:14:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35484 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234895AbhHQKOx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:14:53 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFw6s-002f0a-Vn; Tue, 17 Aug 2021 10:14:19 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFw6s-001uTE-0e; Tue, 17 Aug 2021 10:14:17 +0000
Date:   Tue, 17 Aug 2021 10:14:16 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <601168502.10.1629195256937@builder.linuxtv.org>
In-Reply-To: <562588120.9.1629194952502@builder.linuxtv.org>
References: <562588120.9.1629194952502@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv4 #19
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv4
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv4/19/display/redirect>

Changes:


------------------------------------------
[...truncated 4.74 KB...]
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
checking for aa_autoinit in -laa... yes
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

    aalib        : yes
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

+ make verbose=1
gcc -ldl -Wl,-E -ldl -Wl,-E -o console/streamer console/streamer.o common/sound.o common/webcam.o common/tuning.o common/commands.o common/devs.o common/parseconfig.o common/fifo.o common/capture.o common/event.o common/tv-config.o common/dvb-tuning.o structs/struct-dvb.o structs/struct-dump.o libng/libng.a -lpthread -ljpeg -lm
gcc -ldl -Wl,-E -ldl -Wl,-E -o console/webcam console/webcam.o console/ftp.o common/parseconfig.o common/devs.o common/dvb-tuning.o structs/struct-dvb.o structs/struct-dump.o libng/libng.a -lpthread -ljpeg -lm
gcc -ldl -Wl,-E -ldl -Wl,-E -o console/scantv console/scantv.o common/vbi-dvb.o common/vbi-data.o common/sound.o common/webcam.o common/tuning.o common/commands.o common/devs.o common/parseconfig.o common/fifo.o common/capture.o common/event.o common/tv-config.o common/dvb-tuning.o structs/struct-dvb.o structs/struct-dump.o libng/libng.a -lpthread -lzvbi -lm -lpng -lz -ljpeg
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/console_ttv.tmp -c -o console/ttv.o console/ttv.c
/usr/bin/ld: libng/libng.a(grab-ng.o): in function `ng_plugins':
<https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1125: undefined reference to `dlopen'
/usr/bin/ld: <https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1126: undefined reference to `dlerror'
/usr/bin/ld: collect2: error: ld returned 1 exit status
make: *** [mk/Compile.mk:75: console/webcam] Error 1
make: *** Waiting for unfinished jobs....
libng/libng.a(grab-ng.o): in function `ng_plugins':
<https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1125: undefined reference to `dlopen'
/usr/bin/ld: <https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1126: undefined reference to `dlerror'
/usr/bin/ld: libng/libng.a(grab-ng.o): in function `ng_plugins':
<https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1125: undefined reference to `dlopen'
/usr/bin/ld: <https://builder.linuxtv.org/job/xawtv4/ws/libng/grab-ng.c>:1126: undefined reference to `dlerror'
collect2: error: ld returned 1 exit status
make: *** [mk/Compile.mk:75: console/scantv] Error 1
collect2: error: ld returned 1 exit status
make: *** [mk/Compile.mk:75: console/streamer] Error 1
In file included from console/ttv.c:13:
./common/frequencies.h:82:2: warning: #warning obsolete header file [-Wcpp]
   82 | #warning obsolete header file
      |  ^~~~~~~
console/ttv.c: In function ‘grabber_init’:
console/ttv.c:37:5: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |     ^~~
      |     div
console/ttv.c:37:5: note: each undeclared identifier is reported only once for each function it appears in
console/ttv.c:37:11: warning: implicit declaration of function ‘ng_vid_open’; did you mean ‘ng_dev_open’? [-Wimplicit-function-declaration]
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |           ^~~~~~~~~~~
      |           ng_dev_open
console/ttv.c:37:49: error: ‘h_drv’ undeclared (first use in this function)
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |                                                 ^~~~~
console/ttv.c:42:5: error: ‘f_drv’ undeclared (first use in this function)
   42 |     f_drv = drv->capabilities(h_drv);
      |     ^~~~~
console/ttv.c:43:5: warning: implicit declaration of function ‘add_attrs’; did you mean ‘aa_attrs’? [-Wimplicit-function-declaration]
   43 |     add_attrs(drv->list_attrs(h_drv));
      |     ^~~~~~~~~
      |     aa_attrs
console/ttv.c: In function ‘do_capture’:
console/ttv.c:63:10: error: ‘CAPTURE_GRABDISPLAY’ undeclared (first use in this function)
   63 |     case CAPTURE_GRABDISPLAY:
      |          ^~~~~~~~~~~~~~~~~~~
console/ttv.c:64:6: error: ‘f_drv’ undeclared (first use in this function)
   64 |  if (f_drv & CAN_CAPTURE)
      |      ^~~~~
console/ttv.c:65:6: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
   65 |      drv->stopvideo(h_drv);
      |      ^~~
      |      div
console/ttv.c:65:21: error: ‘h_drv’ undeclared (first use in this function)
   65 |      drv->stopvideo(h_drv);
      |                     ^~~~~
console/ttv.c:76:32: warning: passing argument 1 of ‘ng_grabber_setformat’ from incompatible pointer type [-Wincompatible-pointer-types]
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |                                ^~~~
      |                                |
      |                                struct ng_video_fmt *
In file included from console/ttv.c:11:
./common/capture.h:6:46: note: expected ‘struct ng_devstate *’ but argument is of type ‘struct ng_video_fmt *’
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |                          ~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:76:37: warning: passing argument 2 of ‘ng_grabber_setformat’ makes pointer from integer without a cast [-Wint-conversion]
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |                                     ^
      |                                     |
      |                                     int
In file included from console/ttv.c:11:
./common/capture.h:6:72: note: expected ‘struct ng_video_fmt *’ but argument is of type ‘int’
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |                                                   ~~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:76:11: error: too few arguments to function ‘ng_grabber_setformat’
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |           ^~~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:6:5: note: declared here
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |     ^~~~~~~~~~~~~~~~~~~~
console/ttv.c:78:46: warning: passing argument 1 of ‘ng_grabber_findconv’ from incompatible pointer type [-Wincompatible-pointer-types]
   78 |      if (NULL == (conv = ng_grabber_findconv(&gfmt,0))) {
      |                                              ^~~~~
      |                                              |
      |                                              struct ng_video_fmt *
In file included from console/ttv.c:11:
./common/capture.h:8:63: note: expected ‘struct ng_devstate *’ but argument is of type ‘struct ng_video_fmt *’
    8 | struct ng_video_conv* ng_grabber_findconv(struct ng_devstate *dev,
      |                                           ~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:78:26: error: too few arguments to function ‘ng_grabber_findconv’
   78 |      if (NULL == (conv = ng_grabber_findconv(&gfmt,0))) {
      |                          ^~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:8:23: note: declared here
    8 | struct ng_video_conv* ng_grabber_findconv(struct ng_devstate *dev,
      |                       ^~~~~~~~~~~~~~~~~~~
console/ttv.c:82:11: warning: implicit declaration of function ‘ng_convert_alloc’ [-Wimplicit-function-declaration]
   82 |      ch = ng_convert_alloc(conv,&gfmt,&fmt);
      |           ^~~~~~~~~~~~~~~~
console/ttv.c:82:9: warning: assignment to ‘struct ng_convert_handle *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   82 |      ch = ng_convert_alloc(conv,&gfmt,&fmt);
      |         ^
console/ttv.c:83:6: warning: implicit declaration of function ‘ng_convert_init’; did you mean ‘ng_conv_init’? [-Wimplicit-function-declaration]
   83 |      ng_convert_init(ch);
      |      ^~~~~~~~~~~~~~~
      |      ng_conv_init
console/ttv.c: In function ‘main’:
console/ttv.c:209:5: warning: implicit declaration of function ‘freq_init’ [-Wimplicit-function-declaration]
  209 |     freq_init();
      |     ^~~~~~~~~
console/ttv.c:210:5: warning: implicit declaration of function ‘read_config’ [-Wimplicit-function-declaration]
  210 |     read_config(NULL,NULL,NULL);
      |     ^~~~~~~~~~~
console/ttv.c:217:21: error: ‘mixerdev’ undeclared (first use in this function)
  217 |     if (0 != strlen(mixerdev)) {
      |                     ^~~~~~~~
console/ttv.c:219:43: error: ‘mixerctl’ undeclared (first use in this function)
  219 |  if (NULL != (attr = ng_mix_init(mixerdev,mixerctl)))
      |                                           ^~~~~~~~
console/ttv.c:219:22: error: too few arguments to function ‘ng_mix_init’
  219 |  if (NULL != (attr = ng_mix_init(mixerdev,mixerctl)))
      |                      ^~~~~~~~~~~
In file included from console/ttv.c:10:
./libng/grab-ng.h:603:5: note: declared here
  603 | int ng_mix_init(struct ng_devstate *dev, char *device, char *control);
      |     ^~~~~~~~~~~
console/ttv.c:226:5: error: ‘set_capture_hook’ undeclared (first use in this function)
  226 |     set_capture_hook  = do_capture;
      |     ^~~~~~~~~~~~~~~~
console/ttv.c:229:5: warning: implicit declaration of function ‘parse_config’ [-Wimplicit-function-declaration]
  229 |     parse_config();
      |     ^~~~~~~~~~~~
console/ttv.c:232:5: error: ‘cur_capture’ undeclared (first use in this function); did you mean ‘do_capture’?
  232 |     cur_capture = 0;
      |     ^~~~~~~~~~~
      |     do_capture
console/ttv.c:237:7: error: ‘f_drv’ undeclared (first use in this function)
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |       ^~~~~
console/ttv.c:237:41: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |                                         ^~~
      |                                         div
console/ttv.c:237:54: error: ‘h_drv’ undeclared (first use in this function)
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |                                                      ^~~~~
console/ttv.c:244:12: error: ‘cur_channel’ undeclared (first use in this function)
  244 |  if (-1 == cur_channel) {
      |            ^~~~~~~~~~~
console/ttv.c:245:10: error: ‘count’ undeclared (first use in this function)
  245 |      if (count > 0)
      |          ^~~~~
console/ttv.c:248:3: warning: implicit declaration of function ‘set_defaults’ [-Wimplicit-function-declaration]
  248 |   set_defaults();
      |   ^~~~~~~~~~~~
console/ttv.c:272:21: error: too few arguments to function ‘ng_grabber_grab_image’
  272 |  if (NULL == (buf = ng_grabber_grab_image(0))) {
      |                     ^~~~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:11:22: note: declared here
   11 | struct ng_video_buf* ng_grabber_grab_image(struct ng_devstate *dev,
      |                      ^~~~~~~~~~~~~~~~~~~~~
console/ttv.c:277:12: warning: implicit declaration of function ‘ng_convert_frame’; did you mean ‘ng_convert_thread’? [-Wimplicit-function-declaration]
  277 |      buf = ng_convert_frame(ch,NULL,buf);
      |            ^~~~~~~~~~~~~~~~
      |            ng_convert_thread
console/ttv.c:277:10: warning: assignment to ‘struct ng_video_buf *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  277 |      buf = ng_convert_frame(ch,NULL,buf);
      |          ^
make: *** [mk/Compile.mk:55: console/ttv.o] Error 1
Build step 'Execute shell' marked build as failure
