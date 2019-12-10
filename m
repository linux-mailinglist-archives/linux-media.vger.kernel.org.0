Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D219A118139
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 08:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfLJHS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 02:18:57 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48382 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbfLJHS5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 02:18:57 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ieZn2-006sV2-Nz; Tue, 10 Dec 2019 07:18:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ieZoA-0003AH-Lg; Tue, 10 Dec 2019 07:19:46 +0000
Date:   Tue, 10 Dec 2019 07:19:46 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1911640165.1.1575962386661.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1922857480.0.1575958791377.JavaMail.jenkins@builder.linuxtv.org>
References: <1922857480.0.1575958791377.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #2892
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

See <https://builder.linuxtv.org/job/media-build/2892/display/redirect>

Changes:


------------------------------------------
[...truncated 24.24 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m88ds3103.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88472.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88473.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/isl6423.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ec100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ds3000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ts2020.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mb86a16.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mb86a20s.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ix2505v.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0367.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2841er.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxk_hard.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271c2dd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0910.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv6111.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl5xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si2165.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/a8293.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sp2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10071.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2830.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2832.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2832_sdr.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m88rs2000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9033.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gp8psk-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tc90522.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88443x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/horus3a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ascot2e.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/helene.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zd1301_demod.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2099.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_devio_spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_integ.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_io.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_spi_device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt2_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_top.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-devnode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-entity.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-request.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-fwnode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-dev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-fh.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-event.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ctrls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-subdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-clk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-async.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-trace.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-mc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-dv-timings.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-mem2mem.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-sg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-vmalloc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvbdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dmxdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_demux.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_ca_en50221.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_frontend.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_net.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_ringbuffer.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_vb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_math.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-adstech-dvb-t-pci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-alink-dtu-m.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-anysee.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-apac-viewcomp.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-astrometa-t2hybrid.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-asus-pc39.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-asus-ps3-100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-ati-tv-wonder-hd-600.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-ati-x10.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-a16d.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-cardbus.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-dvbt.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-m135a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-m733a-rm-k6.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avermedia-rm-ks.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-avertv-303.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-azurewave-ad-tu700.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-beelink-gs1.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-behold.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-behold-columbus.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-budget-ci-old.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-cinergy-1400.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-cinergy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-d680-dmb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-delock-61959.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dib0700-nec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dib0700-rc5.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-digitalnow-tinytwin.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-digittrade.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dm1105-nec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dntv-live-dvb-t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dntv-live-dvbt-pro.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dtt200u.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dvbsky.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dvico-mce.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-dvico-portable.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-em-terratec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-encore-enltv2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-encore-enltv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-encore-enltv-fm53.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-evga-indtube.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-eztv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-flydvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-flyvideo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-fusionhdtv-mce.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-gadmei-rm008z.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-geekbox.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-genius-tvgo-a11mce.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-gotview7135.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-hisi-poplar.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-hisi-tv-demo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-imon-mce.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-imon-pad.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-imon-rsc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-iodata-bctv7e.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-it913x-v1.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-it913x-v2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-kaiomy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-khadas.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-kworld-315u.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-kworld-pc150u.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-kworld-plus-tv-analog.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-leadtek-y04g0051.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-lme2510.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-manli.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-medion-x10.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-medion-x10-digitainer.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-medion-x10-or2x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-msi-digivox-ii.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-msi-digivox-iii.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-msi-tvanywhere.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-msi-tvanywhere-plus.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-nebula.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-nec-terratec-cinergy-xs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-norwood.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-npgtech.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-odroid.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pctv-sedna.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pinnacle-color.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pinnacle-grey.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pinnacle-pctv-hd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pixelview.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pixelview-mk12.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pixelview-002t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pixelview-new.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-powercolor-real-angel.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-proteus-2309.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-purpletv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pv951.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-hauppauge.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-rc6-mce.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-real-audio-220-32-keys.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-reddo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-snapstream-firefly.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-streamzap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tango.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tanix-tx3mini.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tanix-tx5max.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tbs-nec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-technisat-ts35.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-technisat-usb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-terratec-cinergy-c-pci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-terratec-cinergy-s2-hd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-terratec-cinergy-xs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-terratec-slim.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-terratec-slim-2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tevii-nec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tivo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-total-media-in-hand.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-total-media-in-hand-02.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-trekstor.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-tt-1500.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-twinhan-dtv-cab-ci.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-twinhan1027.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-vega-s9x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videomate-m1f.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videomate-s350.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videomate-tv-pvr.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-hub.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-play2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast-usbii-deluxe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-su3000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-xbox-dvd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-x96max.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-zx-irdec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-main.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-ir-raw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lirc_dev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-nec-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-rc5-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-rc6-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-jvc-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-sony-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-sanyo-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-sharp-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-mce_kbd-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-xmp-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-imon-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir-rcmm-decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ati_remote.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/imon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/imon_raw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ite-cir.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/lirc_dev.c>:724:18: error: 'compat_ptr_ioctl' undeclared here (not in a function); did you mean 'compat_blkdev_ioctl'?
  .compat_ioctl = compat_ptr_ioctl,
                  ^~~~~~~~~~~~~~~~
                  compat_blkdev_ioctl
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:308: <https://builder.linuxtv.org/job/media-build/ws/v4l/lirc_dev.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 526
Build step 'Execute shell' marked build as failure
