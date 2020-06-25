Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36F2209BCB
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 11:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403820AbgFYJRf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 05:17:35 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49378 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390071AbgFYJRe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 05:17:34 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1joNwY-008Z3k-Jd; Thu, 25 Jun 2020 09:13:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1joO2u-00035e-3p; Thu, 25 Jun 2020 09:19:48 +0000
Date:   Thu, 25 Jun 2020 09:19:48 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1271961069.1.1593076788110@builder.linuxtv.org>
In-Reply-To: <224498074.0.1593068742807@builder.linuxtv.org>
References: <224498074.0.1593068742807@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3127
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

See <https://builder.linuxtv.org/job/media-build/3127/display/redirect>

Changes:


------------------------------------------
[...truncated 27.58 KB...]
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-videostrong-kii-pro.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-hub.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-wetek-play2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-winfast-usbii-deluxe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-su3000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-xbox-dvd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-x96max.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-zx-irdec.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/seco-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pulse8-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rainshadow-cec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-kthreads.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-regs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-quirk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-limits.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_mode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-firmware.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_controls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_capture.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5c73m3-ctrls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-maps.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899_algo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd_firm.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd_hard.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900_sw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxk_hard.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvbdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dmxdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_demux.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_ca_en50221.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_frontend.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_net.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_ringbuffer.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_vb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_math.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-main.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rc-ir-raw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lirc_dev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-adap.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-api.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-notifier.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-pin.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-pin-error-inj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-fe-tuner.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/flexcop-sram.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.c>: In function 'cec_allocate_adapter':
<https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.c>:268:15: error: 'struct cec_adapter' has no member named 'phys_addrs'; did you mean 'phys_addr'?
  memset(adap->phys_addrs, 0xff, sizeof(adap->phys_addrs));
               ^~~~~~~~~~
               phys_addr
<https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.c>:268:46: error: 'struct cec_adapter' has no member named 'phys_addrs'; did you mean 'phys_addr'?
  memset(adap->phys_addrs, 0xff, sizeof(adap->phys_addrs));
                                              ^~~~~~~~~~
                                              phys_addr
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:308: <https://builder.linuxtv.org/job/media-build/ws/v4l/cec-core.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
