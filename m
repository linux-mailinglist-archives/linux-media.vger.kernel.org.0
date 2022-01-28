Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F69349FCC6
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 16:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349518AbiA1P23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 10:28:29 -0500
Received: from www.linuxtv.org ([130.149.80.248]:53676 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349368AbiA1P22 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 10:28:28 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDTAl-00CJvO-Ms; Fri, 28 Jan 2022 15:28:24 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDTAk-004g02-6H; Fri, 28 Jan 2022 15:28:21 +0000
Date:   Fri, 28 Jan 2022 15:28:21 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <826496499.2.1643383701641@builder.linuxtv.org>
In-Reply-To: <1554577671.0.1643382975915@builder.linuxtv.org>
References: <1554577671.0.1643382975915@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #412
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/412/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log

[Mauro Carvalho Chehab] media: aspeed: add more debug log messages

[Mauro Carvalho Chehab] media: aspeed: Fix no complete irq for non-64-aligned width

[Mauro Carvalho Chehab] media: aspeed: Correct value for h-total-pixels

[Mauro Carvalho Chehab] media: aspeed: Use FIELD_GET to improve readability

[Mauro Carvalho Chehab] media: aspeed: Correct values for detected timing

[Mauro Carvalho Chehab] media: lirc: remove unused lirc features

[Mauro Carvalho Chehab] media: rc-core: rename ir_raw_event_reset to ir_raw_event_overflow

[Mauro Carvalho Chehab] media: lirc: report ir receiver overflow


------------------------------------------
[...truncated 6.16 KB...]
drivers/media/platform/atmel/microchip-csi2dc.c:364:23: error: no member named 'flags' in 'struct v4l2_mbus_config'
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
                 ~~~~~~~~~~~ ^
drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_2'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:366:23: error: no member named 'flags' in 'struct v4l2_mbus_config'
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
                 ~~~~~~~~~~~ ^
drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_3'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:371:34: error: no member named 'flags' in 'struct v4l2_mbus_config'
        csi2dc->clk_gated = mbus_config.flags &
                            ~~~~~~~~~~~ ^
9 errors generated.
make[4]: *** [scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
make[3]: *** [scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/media/rc/ir-sony-decoder.o
  CC      drivers/media/rc/ir-sanyo-decoder.o
  CC      drivers/media/rc/keymaps/rc-avermedia-a16d.o
  CC      drivers/media/i2c/adv7842.o
  CC      drivers/media/common/siano/smsdvb-debugfs.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.o
  CC      drivers/media/rc/keymaps/rc-avermedia.o
  CC      drivers/media/cec/core/cec-pin.o
  CC      drivers/media/rc/ir-sharp-decoder.o
  AR      drivers/media/common/siano/built-in.a
  CC      drivers/media/rc/keymaps/rc-avermedia-cardbus.o
  CC      drivers/media/rc/ir-mce_kbd-decoder.o
  AR      drivers/media/common/built-in.a
  CC      drivers/media/rc/ir-xmp-decoder.o
  CC      drivers/media/rc/ir-imon-decoder.o
  CC      drivers/media/rc/keymaps/rc-avermedia-dvbt.o
  CC      drivers/media/rc/keymaps/rc-avermedia-m135a.o
  AR      drivers/media/platform/mtk-jpeg/built-in.a
make[2]: *** [scripts/Makefile.build:550: drivers/media/platform] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      drivers/media/rc/ir-rcmm-decoder.o
  CC      drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.o
  CC      drivers/media/cec/core/cec-pin-error-inj.o
  CC      drivers/media/rc/ati_remote.o
  CC      drivers/media/rc/keymaps/rc-avermedia-rm-ks.o
  CC      drivers/media/rc/ir-hix5hd2.o
  CC      drivers/media/rc/keymaps/rc-avertv-303.o
  CC      drivers/media/i2c/adv7511-v4l2.o
  CC      drivers/media/rc/imon.o
  CC      drivers/media/rc/imon_raw.o
  AR      drivers/media/cec/core/built-in.a
  CC      drivers/media/rc/ite-cir.o
  CC      drivers/media/cec/i2c/ch7322.o
  CC      drivers/media/rc/mceusb.o
  CC      drivers/media/rc/keymaps/rc-azurewave-ad-tu700.o
  CC      drivers/media/rc/fintek-cir.o
  CC      drivers/media/cec/platform/cros-ec/cros-ec-cec.o
  CC      drivers/media/rc/meson-ir.o
  CC      drivers/media/rc/keymaps/rc-beelink-gs1.o
  AR      drivers/media/cec/i2c/built-in.a
  CC      drivers/media/rc/keymaps/rc-behold.o
  CC      drivers/media/cec/platform/cec-gpio/cec-gpio.o
  CC      drivers/media/rc/meson-ir-tx.o
  CC      drivers/media/cec/platform/meson/ao-cec.o
  CC      drivers/media/cec/platform/s5p/s5p_cec.o
  CC      drivers/media/rc/nuvoton-cir.o
  CC      drivers/media/rc/keymaps/rc-behold-columbus.o
  CC      drivers/media/i2c/ir-kbd-i2c.o
  CC      drivers/media/cec/platform/seco/seco-cec.o
  AR      drivers/media/cec/platform/cros-ec/built-in.a
  CC      drivers/media/cec/platform/sti/stih-cec.o
  AR      drivers/media/cec/platform/cec-gpio/built-in.a
  CC      drivers/media/cec/platform/s5p/exynos_hdmi_cecctrl.o
  CC      drivers/media/cec/platform/meson/ao-cec-g12a.o
drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
  CC      drivers/media/rc/keymaps/rc-budget-ci-old.o
  CC      drivers/media/rc/keymaps/rc-cinergy-1400.o
  CC      drivers/media/rc/keymaps/rc-cinergy.o
  AR      drivers/media/cec/platform/sti/built-in.a
  CC      drivers/media/rc/keymaps/rc-ct-90405.o
  CC      drivers/media/i2c/tc358743.o
  AR      drivers/media/cec/platform/seco/built-in.a
  CC      drivers/media/rc/keymaps/rc-d680-dmb.o
  CC      drivers/media/rc/keymaps/rc-delock-61959.o
  CC      drivers/media/cec/platform/stm32/stm32-cec.o
  CC      drivers/media/cec/platform/tegra/tegra_cec.o
  AR      drivers/media/cec/platform/s5p/built-in.a
  CC      drivers/media/rc/ene_ir.o
  CC      drivers/media/cec/usb/pulse8/pulse8-cec.o
  AR      drivers/media/cec/platform/meson/built-in.a
  CC      drivers/media/rc/redrat3.o
  CC      drivers/media/rc/ir-rx51.o
  CC      drivers/media/rc/ir-spi.o
  CC      drivers/media/rc/keymaps/rc-dib0700-nec.o
  AR      drivers/media/cec/platform/stm32/built-in.a
  CC      drivers/media/rc/streamzap.o
  AR      drivers/media/cec/usb/pulse8/built-in.a
  CC      drivers/media/rc/winbond-cir.o
  CC      drivers/media/cec/usb/rainshadow/rainshadow-cec.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/media/rc/rc-loopback.o
  AR      drivers/media/cec/platform/tegra/built-in.a
  AR      drivers/media/cec/platform/built-in.a
  CC      drivers/media/rc/gpio-ir-recv.o
  CC      drivers/media/rc/keymaps/rc-dib0700-rc5.o
  CC      drivers/media/rc/gpio-ir-tx.o
  CC      drivers/media/rc/pwm-ir-tx.o
  CC      drivers/media/rc/igorplugusb.o
  CC      drivers/media/rc/iguanair.o
  AR      drivers/media/cec/usb/rainshadow/built-in.a
  AR      drivers/media/cec/usb/built-in.a
  AR      drivers/media/cec/built-in.a
  CC      drivers/media/rc/keymaps/rc-digitalnow-tinytwin.o
  CC      drivers/media/rc/ttusbir.o
  CC      drivers/media/rc/st_rc.o
  CC      drivers/media/rc/sunxi-cir.o
  CC      drivers/media/rc/img-ir/img-ir-core.o
  CC      drivers/media/rc/serial_ir.o
  CC      drivers/media/rc/img-ir/img-ir-raw.o
  CC      drivers/media/rc/keymaps/rc-digittrade.o
  CC      drivers/media/rc/keymaps/rc-dm1105-nec.o
  CC      drivers/media/rc/mtk-cir.o
  CC      drivers/media/rc/keymaps/rc-dntv-live-dvb-t.o
  CC      drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.o
  CC      drivers/media/rc/keymaps/rc-dtt200u.o
  CC      drivers/media/rc/keymaps/rc-dvbsky.o
  CC      drivers/media/rc/keymaps/rc-dvico-mce.o
  CC      drivers/media/rc/keymaps/rc-dvico-portable.o
  CC      drivers/media/rc/img-ir/img-ir-hw.o
  CC      drivers/media/rc/keymaps/rc-em-terratec.o
  CC      drivers/media/rc/img-ir/img-ir-nec.o
  CC      drivers/media/rc/img-ir/img-ir-jvc.o
  CC      drivers/media/rc/img-ir/img-ir-sony.o
  CC      drivers/media/rc/xbox_remote.o
  CC      drivers/media/rc/keymaps/rc-encore-enltv2.o
  CC      drivers/media/rc/ir_toy.o
  CC      drivers/media/rc/img-ir/img-ir-sharp.o
  CC      drivers/media/rc/img-ir/img-ir-sanyo.o
  CC      drivers/media/rc/img-ir/img-ir-rc5.o
  CC      drivers/media/rc/keymaps/rc-encore-enltv.o
  CC      drivers/media/rc/img-ir/img-ir-rc6.o
  CC      drivers/media/rc/keymaps/rc-encore-enltv-fm53.o
  CC      drivers/media/rc/keymaps/rc-evga-indtube.o
  CC      drivers/media/rc/keymaps/rc-eztv.o
  CC      drivers/media/rc/keymaps/rc-flydvb.o
  CC      drivers/media/rc/keymaps/rc-flyvideo.o
  CC      drivers/media/rc/keymaps/rc-fusionhdtv-mce.o
  CC      drivers/media/rc/keymaps/rc-gadmei-rm008z.o
  CC      drivers/media/rc/keymaps/rc-geekbox.o
  AR      drivers/media/rc/img-ir/built-in.a
  CC      drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.o
  CC      drivers/media/rc/keymaps/rc-gotview7135.o
  CC      drivers/media/rc/keymaps/rc-hisi-poplar.o
  CC      drivers/media/rc/keymaps/rc-hisi-tv-demo.o
  CC      drivers/media/rc/keymaps/rc-imon-mce.o
  CC      drivers/media/rc/keymaps/rc-imon-pad.o
  CC      drivers/media/rc/keymaps/rc-imon-rsc.o
  CC      drivers/media/rc/keymaps/rc-iodata-bctv7e.o
  CC      drivers/media/rc/keymaps/rc-it913x-v1.o
  CC      drivers/media/rc/keymaps/rc-it913x-v2.o
  CC      drivers/media/rc/keymaps/rc-kaiomy.o
  CC      drivers/media/rc/keymaps/rc-khadas.o
  CC      drivers/media/rc/keymaps/rc-khamsin.o
  CC      drivers/media/rc/keymaps/rc-kworld-315u.o
  CC      drivers/media/rc/keymaps/rc-kworld-pc150u.o
  CC      drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.o
  CC      drivers/media/rc/keymaps/rc-leadtek-y04g0051.o
  CC      drivers/media/rc/keymaps/rc-lme2510.o
  CC      drivers/media/rc/keymaps/rc-manli.o
  CC      drivers/media/rc/keymaps/rc-mecool-kii-pro.o
  CC      drivers/media/rc/keymaps/rc-mecool-kiii-pro.o
  CC      drivers/media/rc/keymaps/rc-medion-x10.o
  CC      drivers/media/rc/keymaps/rc-medion-x10-digitainer.o
  CC      drivers/media/rc/keymaps/rc-medion-x10-or2x.o
  CC      drivers/media/rc/keymaps/rc-minix-neo.o
  CC      drivers/media/rc/keymaps/rc-msi-digivox-ii.o
  CC      drivers/media/rc/keymaps/rc-msi-digivox-iii.o
  CC      drivers/media/rc/keymaps/rc-msi-tvanywhere.o
  CC      drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.o
  CC      drivers/media/rc/keymaps/rc-nebula.o
  CC      drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.o
  CC      drivers/media/rc/keymaps/rc-norwood.o
  CC      drivers/media/rc/keymaps/rc-npgtech.o
  CC      drivers/media/rc/keymaps/rc-odroid.o
  CC      drivers/media/rc/keymaps/rc-pctv-sedna.o
  CC      drivers/media/rc/keymaps/rc-pine64.o
  CC      drivers/media/rc/keymaps/rc-pinnacle-color.o
  CC      drivers/media/rc/keymaps/rc-pinnacle-grey.o
  CC      drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.o
  CC      drivers/media/rc/keymaps/rc-pixelview.o
  CC      drivers/media/rc/keymaps/rc-pixelview-mk12.o
  CC      drivers/media/rc/keymaps/rc-pixelview-002t.o
  CC      drivers/media/rc/keymaps/rc-pixelview-new.o
  CC      drivers/media/rc/keymaps/rc-powercolor-real-angel.o
  CC      drivers/media/rc/keymaps/rc-proteus-2309.o
  CC      drivers/media/rc/keymaps/rc-purpletv.o
  CC      drivers/media/rc/keymaps/rc-pv951.o
  CC      drivers/media/rc/keymaps/rc-hauppauge.o
  CC      drivers/media/rc/keymaps/rc-rc6-mce.o
  CC      drivers/media/rc/keymaps/rc-real-audio-220-32-keys.o
  CC      drivers/media/rc/keymaps/rc-reddo.o
  CC      drivers/media/rc/keymaps/rc-snapstream-firefly.o
  CC      drivers/media/rc/keymaps/rc-streamzap.o
  CC      drivers/media/rc/keymaps/rc-tanix-tx3mini.o
  CC      drivers/media/rc/keymaps/rc-tanix-tx5max.o
  CC      drivers/media/rc/keymaps/rc-tbs-nec.o
  CC      drivers/media/rc/keymaps/rc-technisat-ts35.o
  CC      drivers/media/rc/keymaps/rc-technisat-usb2.o
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.o
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.o
  CC      drivers/media/rc/keymaps/rc-terratec-cinergy-xs.o
  CC      drivers/media/rc/keymaps/rc-terratec-slim.o
  CC      drivers/media/rc/keymaps/rc-terratec-slim-2.o
  CC      drivers/media/rc/keymaps/rc-tevii-nec.o
  CC      drivers/media/rc/keymaps/rc-tivo.o
  CC      drivers/media/rc/keymaps/rc-total-media-in-hand.o
  CC      drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
  CC      drivers/media/rc/keymaps/rc-trekstor.o
  CC      drivers/media/rc/keymaps/rc-tt-1500.o
  CC      drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
  CC      drivers/media/rc/keymaps/rc-twinhan1027.o
  CC      drivers/media/rc/keymaps/rc-vega-s9x.o
  CC      drivers/media/rc/keymaps/rc-videomate-m1f.o
  CC      drivers/media/rc/keymaps/rc-videomate-s350.o
  CC      drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
  CC      drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
  CC      drivers/media/rc/keymaps/rc-wetek-hub.o
  CC      drivers/media/rc/keymaps/rc-wetek-play2.o
  CC      drivers/media/rc/keymaps/rc-winfast.o
  CC      drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
  CC      drivers/media/rc/keymaps/rc-su3000.o
  CC      drivers/media/rc/keymaps/rc-xbox-360.o
  CC      drivers/media/rc/keymaps/rc-xbox-dvd.o
  CC      drivers/media/rc/keymaps/rc-x96max.o
  CC      drivers/media/rc/keymaps/rc-zx-irdec.o
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/rc/built-in.a
make[1]: *** [scripts/Makefile.build:550: drivers/media] Error 2
make: *** [Makefile:1831: drivers] Error 2
Build step 'Execute shell' marked build as failure
