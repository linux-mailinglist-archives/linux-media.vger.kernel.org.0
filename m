Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA5D1B3B0D
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 11:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgDVJT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 05:19:56 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40726 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgDVJTz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 05:19:55 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jRBUu-00Bvjx-0B; Wed, 22 Apr 2020 09:16:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jRBZe-00017r-Uz; Wed, 22 Apr 2020 09:21:43 +0000
Date:   Wed, 22 Apr 2020 09:21:42 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <609133173.15.1587547302950.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3054
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

See <https://builder.linuxtv.org/job/media-build/3054/display/redirect>

Changes:


------------------------------------------
[...truncated 82.75 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-camera.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-input.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-fw.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smssdio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-avc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-ci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-fw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv-rc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gs1662.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-streamer.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-capture.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-debayer.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-scaler.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc-sensor.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-ctrls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vid-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vbi-gen.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vid-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vid-out.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-kthread-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-kthread-out.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-radio-rx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-radio-tx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-radio-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-rds-gen.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-sdr-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vbi-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-vbi-out.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-osd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-meta-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-meta-out.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-kthread-touch.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-touch-cap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vim2m.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vicodec-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/codec-fwht.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/codec-v4l2-fwht.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-maxiradio.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-osd.c>: In function 'vivid_fb_init_vidmode':
<https://builder.linuxtv.org/job/media-build/ws/v4l/vivid-osd.c>:318:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  dev->fb_info.fbops = &vivid_fb_ops;
                     ^
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-h264.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drx39xyj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-vpdma.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-sc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ti-csc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-ttpci.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-pci.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt1.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis_core.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hopper.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ngene.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smipcie.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ddbridge.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dtt200u.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-gp8psk.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-common.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mc-common.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-a800.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dibusb-mc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-umt-010.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-nova-t-usb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-m920x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-cxusb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-digitv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ttusb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dib0700.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-opera.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9005.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9005-remote.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dw2102.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dtv5100.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-pctv452e.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-usb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dvbsky.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stkwebcam.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvcvideo.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_main.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_benq.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_conex.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_cpia1.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_dtcs033.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_etoms.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_finepix.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_jeilinj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_jl2005bcd.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_kinect.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_konica.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_mars.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_mr97310a.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_nw80x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov519.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov534.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_ov534_9.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac207.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac7302.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_pac7311.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_se401.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sn9c2028.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sn9c20x.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sonixb.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sonixj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca501.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca500.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca505.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca506.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca508.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca561.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca1528.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-h264.c>: In function 'v4l2_h264_build_p_ref_list':
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-h264.c>:229:2: error: implicit declaration of function 'sort_r'; did you mean 'sort'? [-Werror=implicit-function-declaration]
  sort_r(reflist, builder->num_valid, sizeof(*reflist),
  ^~~~~~
  sort
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-h264.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_sq905.o>
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
