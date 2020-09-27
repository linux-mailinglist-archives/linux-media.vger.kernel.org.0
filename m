Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8557227A002
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgI0JRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 05:17:31 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54948 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbgI0JR0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 05:17:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kMShr-008w3G-QA; Sun, 27 Sep 2020 09:10:56 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kMSqr-00015A-4j; Sun, 27 Sep 2020 09:20:13 +0000
Date:   Sun, 27 Sep 2020 09:20:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1049334653.0.1601198413115@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3232
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

See <https://builder.linuxtv.org/job/media-build/3232/display/redirect>

Changes:


------------------------------------------
[...truncated 46.17 KB...]
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videostrong-kii-pro.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-memops.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx2341x.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>: In function 'vb2_vmalloc_dmabuf_ops_attach':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>:233:2: error: implicit declaration of function 'for_each_sgtable_sg'; did you mean 'for_each_set_bit'? [-Werror=implicit-function-declaration]
  for_each_sgtable_sg(sgt, sg, i) {
  ^~~~~~~~~~~~~~~~~~~
  for_each_set_bit
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>:233:33: error: expected ';' before '{' token
  for_each_sgtable_sg(sgt, sg, i) {
                                 ^~
                                 ;
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>:219:8: warning: unused variable 'vaddr' [-Wunused-variable]
  void *vaddr = buf->vaddr;
        ^~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>: In function 'vb2_vmalloc_dmabuf_ops_detach':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>:263:3: error: implicit declaration of function 'dma_unmap_sgtable'; did you mean 'dma_unmap_single'? [-Werror=implicit-function-declaration]
   dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
   ^~~~~~~~~~~~~~~~~
   dma_unmap_single
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>: In function 'vb2_vmalloc_dmabuf_ops_map':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.c>:293:6: error: implicit declaration of function 'dma_map_sgtable'; did you mean 'dma_get_sgtable'? [-Werror=implicit-function-declaration]
  if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
      ^~~~~~~~~~~~~~~
      dma_get_sgtable
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-vmalloc.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>: In function 'vb2_dc_get_contiguous_size':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:61:2: error: implicit declaration of function 'for_each_sgtable_dma_sg'; did you mean 'for_each_node_mask'? [-Werror=implicit-function-declaration]
  for_each_sgtable_dma_sg(sgt, s, i) {
  ^~~~~~~~~~~~~~~~~~~~~~~
  for_each_node_mask
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:61:36: error: expected ';' before '{' token
  for_each_sgtable_dma_sg(sgt, s, i) {
                                    ^~
                                    ;
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:59:16: warning: unused variable 'size' [-Wunused-variable]
  unsigned long size = 0;
                ^~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:57:13: warning: unused variable 'expected' [-Wunused-variable]
  dma_addr_t expected = sg_dma_address(sgt->sgl);
             ^~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:68:1: warning: no return statement in function returning non-void [-Wreturn-type]
 }
 ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>: In function 'vb2_dc_prepare':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:106:2: error: implicit declaration of function 'dma_sync_sgtable_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
  dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  dma_sync_single_for_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>: In function 'vb2_dc_finish':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:117:2: error: implicit declaration of function 'dma_sync_sgtable_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Werror=implicit-function-declaration]
  dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
  ^~~~~~~~~~~~~~~~~~~~~~~~
  dma_sync_single_for_cpu
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>: In function 'vb2_dc_dmabuf_ops_detach':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:283:3: error: implicit declaration of function 'dma_unmap_sgtable'; did you mean 'dma_unmap_single'? [-Werror=implicit-function-declaration]
   dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
   ^~~~~~~~~~~~~~~~~
   dma_unmap_single
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>: In function 'vb2_dc_dmabuf_ops_map':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.c>:318:6: error: implicit declaration of function 'dma_map_sgtable'; did you mean 'dma_get_sgtable'? [-Werror=implicit-function-declaration]
  if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
      ^~~~~~~~~~~~~~~
      dma_get_sgtable
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-contig.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>: In function 'vb2_dma_sg_alloc':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>:151:6: error: implicit declaration of function 'dma_map_sgtable'; did you mean 'dma_get_sgtable'? [-Werror=implicit-function-declaration]
  if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
      ^~~~~~~~~~~~~~~
      dma_get_sgtable
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>: In function 'vb2_dma_sg_put':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>:188:3: error: implicit declaration of function 'dma_unmap_sgtable'; did you mean 'dma_unmap_single'? [-Werror=implicit-function-declaration]
   dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
   ^~~~~~~~~~~~~~~~~
   dma_unmap_single
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>: In function 'vb2_dma_sg_prepare':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>:206:2: error: implicit declaration of function 'dma_sync_sgtable_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
  dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  dma_sync_single_for_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>: In function 'vb2_dma_sg_finish':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.c>:214:2: error: implicit declaration of function 'dma_sync_sgtable_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Werror=implicit-function-declaration]
  dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
  ^~~~~~~~~~~~~~~~~~~~~~~~
  dma_sync_single_for_cpu
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf2-dma-sg.o]> Error 1
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
