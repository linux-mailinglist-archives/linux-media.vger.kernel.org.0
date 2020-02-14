Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9CF015D35A
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 09:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgBNIEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 03:04:55 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48600 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgBNIEz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 03:04:55 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j2VwX-00EHXf-1w; Fri, 14 Feb 2020 08:03:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j2VzJ-0002ZF-OG; Fri, 14 Feb 2020 08:06:13 +0000
Date:   Fri, 14 Feb 2020 08:06:13 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1033059839.8.1581667573741.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <725822833.7.1581615259891.JavaMail.jenkins@builder.linuxtv.org>
References: <725822833.7.1581615259891.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #2971
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/2971/display/redirect?page=changes>

Changes:

[hverkuil-cisco] Fix missing asm/memtype.h header.

[hverkuil-cisco] Don't build cros-ec-cec for older kernels.

[hverkuil-cisco] Add v5.6_const_fb_ops.patch

[hverkuil-cisco] Patches added to the wrong kernel version


------------------------------------------
[...truncated 85.76 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/snd-go7007.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-usb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-loader.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2250-board.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_fw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd_stream.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_usb_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd_cfg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pulse8-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rainshadow-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smssdio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-avc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-ci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-fw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-rc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gs1662.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-maxiradio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-shark.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-shark2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-tea5777.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dsbr100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-si470x-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-si470x-usb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-si470x-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si4713.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-usb-si4713.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-platform-si4713.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-mr800.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-keene.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-ma901.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-tea5764.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7706h.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tef6862.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-wl1273.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tea575x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-raremono.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-lpt.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-jtag.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-comp.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drx39xyj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxk.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videodev.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-core.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-core.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_vv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsmdtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsdvb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-tpg.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-common.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cafe_ccic.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vicodec.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-vpdma.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-sc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-csc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-pci.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-ttpci.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt1.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis_core.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hopper.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ngene.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ddbridge.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smipcie.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/netup-unidvb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ivtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ivtv-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx18.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx18-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx23885.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25821.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx88xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx8800.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx8802.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bttv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7134.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7164.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw68.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw686x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/solo6x10.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cobalt.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw5864.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-vp7045.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-vp702x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-gp8psk.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dtt200u.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-common.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mc-common.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-a800.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-nova-t-usb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-m920x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-umt-010.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-digitv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-cxusb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ttusb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dib0700.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-opera.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9005.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9005-remote.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-pctv452e.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dw2102.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dtv5100.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-cinergyT2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-az6027.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-technisat-usb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_usb_v2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9015.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9035.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-anysee.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-au6610.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-az6007.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ce6230.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ec168.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-lmedm04.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-gl861.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-mxl111sf.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-rtl28xxu.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dvbsky.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-usb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stkwebcam.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvcvideo.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_main.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_benq.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_cpia1.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_conex.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_dtcs033.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_etoms.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_finepix.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_jl2005bcd.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_jeilinj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_kinect.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_konica.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_mars.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_mr97310a.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_nw80x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov534.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov534_9.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov519.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac207.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac7302.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac7311.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_se401.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sn9c2028.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sn9c20x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sonixb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sonixj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca500.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca501.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca505.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca506.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca508.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca561.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca1528.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sq905.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sq905c.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sq930x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sunplus.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_stk014.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_stk1135.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_stv0680.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_t613.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_topro.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_touptek.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_tv8532.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_vc032x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_vicam.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_xirlink_cit.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_zc3xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_m5602.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_stv06xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_gl860.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbvision.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-v4l.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-rc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2250.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-as102.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/shark2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-stapl.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.c>: In function 'snd_bt87x_pcm':
<https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.c>:695:2: error: implicit declaration of function 'snd_pcm_set_managed_buffer_all'; did you mean 'snd_pcm_set_runtime_buffer'? [-Werror=implicit-function-declaration]
  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  snd_pcm_set_runtime_buffer
<https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.c>: In function 'snd_bt87x_create':
<https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.c>:754:6: error: 'struct snd_card' has no member named 'sync_irq'
  card->sync_irq = chip->irq;
      ^~
<https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.c>:757:55: warning: passing argument 4 of 'snd_device_new' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
                                                       ^~~~
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/compat.h>:332,
                 from <command-line>:
/usr/src/linux-headers-4.19.0-5-common/include/sound/core.h:262:48: note: expected 'struct snd_device_ops *' but argument is of type 'const struct snd_device_ops *'
      void *device_data, struct snd_device_ops *ops);
                         ~~~~~~~~~~~~~~~~~~~~~~~^~~
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:308: <https://builder.linuxtv.org/job/media-build/ws/v4l/bt87x.o]> Error 1
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 526
Build step 'Execute shell' marked build as failure
