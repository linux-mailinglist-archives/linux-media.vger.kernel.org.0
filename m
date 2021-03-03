Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA6C32BB04
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358573AbhCCMOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:00 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48654 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1842907AbhCCKWX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 05:22:23 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHNbr-00H5c9-DM; Wed, 03 Mar 2021 09:15:59 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHNfc-0006bG-Ko; Wed, 03 Mar 2021 09:19:52 +0000
Date:   Wed, 3 Mar 2021 09:19:52 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <636657990.8.1614763192636@builder.linuxtv.org>
In-Reply-To: <1908005459.7.1614676894927@builder.linuxtv.org>
References: <1908005459.7.1614676894927@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3417
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

See <https://builder.linuxtv.org/job/media-build/3417/display/redirect>

Changes:


------------------------------------------
[...truncated 32.33 KB...]
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-khamsin.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-pine64.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videostrong-kii-pro.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-hub.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-play2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-su3000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast-usbii-deluxe.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mceusb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/fintek-cir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/nuvoton-cir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ene_ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/redrat3.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/streamzap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/winbond-cir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-loopback.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/igorplugusb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/iguanair.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusbir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/serial_ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sir_ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/xbox_remote.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ir_toy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-adap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-api.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-notifier.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-pin.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-pin-error-inj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ch7322.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/seco-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pulse8-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rainshadow-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-fe-tuner.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-sram.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-eeprom.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-misc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-hw-filter.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_fops.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_hlp.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7146_vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smscoreapi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sms-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsendian.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsdvb-main.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsdvb-debugfs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-tpg-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-tpg-colors.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vb2-trace.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-memops.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx2341x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tveeprom.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cypress_firmware.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>: In function 'media_get_vaddr_frames':
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>:52:8: error: implicit declaration of function 'pin_user_pages_fast'; did you mean 'get_user_pages_fast'? [-Werror=implicit-function-declaration]
  ret = pin_user_pages_fast(start, nr_frames,
        ^~~~~~~~~~~~~~~~~~~
        get_user_pages_fast
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>:61:2: error: implicit declaration of function 'mmap_read_lock'; did you mean '_raw_read_lock'? [-Werror=implicit-function-declaration]
  mmap_read_lock(mm);
  ^~~~~~~~~~~~~~
  _raw_read_lock
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>:87:2: error: implicit declaration of function 'mmap_read_unlock'; did you mean '_raw_read_unlock'? [-Werror=implicit-function-declaration]
  mmap_read_unlock(mm);
  ^~~~~~~~~~~~~~~~
  _raw_read_unlock
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>: In function 'media_put_vaddr_frames':
<https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.c>:121:2: error: implicit declaration of function 'unpin_user_pages'; did you mean 'get_user_pages'? [-Werror=implicit-function-declaration]
  unpin_user_pages(pages, vec->nr_frames);
  ^~~~~~~~~~~~~~~~
  get_user_pages
cc1: some warnings being treated as errors
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/aspeed-video.o>
make[5]: *** [/usr/src/linux-headers-4.19.0-12-common/scripts/Makefile.build:315: <https://builder.linuxtv.org/job/media-build/ws/v4l/frame_vector.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/usr/src/linux-headers-4.19.0-12-common/Makefile:1565: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-12-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
