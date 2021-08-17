Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B993EE8C1
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 10:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239320AbhHQImP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 04:42:15 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53324 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239310AbhHQImM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 04:42:12 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFufC-002YjP-4O; Tue, 17 Aug 2021 08:41:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFufB-001jH0-C3; Tue, 17 Aug 2021 08:41:36 +0000
Date:   Tue, 17 Aug 2021 08:41:36 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <860227407.2.1629189696290@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3598
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

See <https://builder.linuxtv.org/job/media-build/3598/display/redirect>

Changes:


------------------------------------------
[...truncated 78.13 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hexium_orion.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hexium_gemini.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ivtvfb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-ci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25821-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx88-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx88-blackbird.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx88-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx88-vp3054-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bt878.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-bt8xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dst.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dst_ca.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7134-empress.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7134-go7007.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7134-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7134-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dt3155.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/meye.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusb_dec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusbdecfe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-ttusb-budget.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-demod.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-tuner.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zd1301.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsusb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zr364xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2255drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/airspy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hackrf.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msi2500.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-usb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-loader.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smssdio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gs1662.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vim2m.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-maxiradio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/radio-shark.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drx39xyj.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxk.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videodev.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-pci.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt1.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/earth-pt3.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis_core.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hopper.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ngene.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mantis.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-umt-010.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-m920x.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-az6027.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-technisat-usb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_usb_v2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9015.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-af9035.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-cinergyT2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-anysee.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-au6610.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-az6007.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ce6230.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-ec168.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-gl861.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-lmedm04.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-mxl111sf.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-rtl28xxu.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dvbsky.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/b2c2-flexcop-usb.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca505.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca506.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_spca500.o>
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
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca_gl860.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-v4l.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-alsa.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-rc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2250.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-as102.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/firedtv.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vimc.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vivid.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vicodec.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-vidtv-tuner.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-vidtv-demod.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/shark2.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/altera-stapl.o>
  LD [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-vidtv-bridge.o>
  MODPOST <https://builder.linuxtv.org/job/media-build/ws/v4l/Module.symvers>
ERROR: modpost: "__devm_regmap_init_sccb" [<https://builder.linuxtv.org/job/media-build/ws/v4l/ov9650.ko]> undefined!
ERROR: modpost: "__devm_regmap_init_sccb" [<https://builder.linuxtv.org/job/media-build/ws/v4l/ov772x.ko]> undefined!
make[4]: *** [/usr/src/linux-headers-5.10.0-8-common/scripts/Makefile.modpost:124: <https://builder.linuxtv.org/job/media-build/ws/v4l/Module.symvers]> Error 1
make[4]: *** Deleting file '<https://builder.linuxtv.org/job/media-build/ws/v4l/Module.symvers'>
make[3]: *** [/usr/src/linux-headers-5.10.0-8-common/Makefile:1749: modules] Error 2
make[2]: *** [/usr/src/linux-headers-5.10.0-8-common/Makefile:185: __sub-make] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-5.10.0-8-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
