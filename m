Return-Path: <linux-media+bounces-18548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC74985AF2
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 14:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F1F41C23EE5
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 12:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9004E190463;
	Wed, 25 Sep 2024 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b5ehoGkm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7D18FDC3
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264779; cv=none; b=T68R8Q5TbzHdsIzLMbyNHFSQVjboeA0OUlNzmNqjCakoQfOpWwrgxQALBFgT39R9zC47nVr2oe7nKUtPXBbgWZgn6yG8+vblGpePXaiGNnsfKBNlwG8w+iOg3MLR9vGENfVxsGU+bG1Vuxhj9q6JEb4fZM0NnKZM/krpf5WZCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264779; c=relaxed/simple;
	bh=Btv9yVxbCh8Mf7Bz29iLbh+++DyG0i7un7LqRD/9LXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fu2DsHA9lvbwle62Jv1I+2/ejdPj5iY+2AFz38mckdNr0KxgCsjybQYTafVHnmeGi2Co89JWhaznBo1XLtk4upnH2/mjqjf9SRZpTGhqS00a2XmEEmz1w/kzSi24R0WskGG25hlsvqrltWQOlMbsiIawgNknZmj6lGyIEQ4vso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b5ehoGkm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42e5e758093so58152975e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 04:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727264772; x=1727869572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDN7ObZtoYc1NJGknK9QiP3gCEJaMNVg2h3U11l2Mjo=;
        b=b5ehoGkmQL5ozcOiapTaXxXR1ZKh+WJy8mIUon7C/zTHVVPZ4p3Svuj6RTU46ttqPO
         V1E7rhcq/JFr2/Ra0/HZeeMn8IGyJ7MYsYvkstWqKhhIwROIp3htno0OVb4Zl5Gsne81
         Cd3M6rkFum/VZfCTF3WIDq7OPoLCaA/5zpUQLOtqQD8V0ZVMvazyccfsx9mdFuhe8ne8
         FHtr7WJb0MV+hBqZUeZhfx6rrMhKdtT2pkABke59X+uE8uqT8BqZuRdLilTXiMGvjbXe
         0/vSkEq65Jue6wg9FruGcqNif3jOloaj+cFK1InaXYz3BpYV0pQ3W5wBCioIbz20UQfV
         UmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727264772; x=1727869572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDN7ObZtoYc1NJGknK9QiP3gCEJaMNVg2h3U11l2Mjo=;
        b=kYmGqUdx04jFdo3fJPAOXAvf8iCzK8sSQeQNWDUZIUqvO5YPEdkzG2Kkm8vUisDYmt
         dMVSgNjPTOP5lXDwvvgiuTK05ssUc5RVirgy2X6k+7kBKTMowSdzez5tdaTosQcCKPq+
         ZxcyZ1XwzcVp+q7DMjq2d+8vxKZP9pIbhXfjGpMF0rIsJ+qAi4nIwUZutE77UfE2wY74
         WLykMXV1wx4t/fNv5fXA0f4XqiPSeIDIA27iHus742PmiOwXGGRS6V4uKuZuwnwRrP4l
         w/Wbm5P+zHULmJfJmEBQjVgysAPft88bQsv9CQBaQuR1e5K+TCWL2KH8EFc0Txh2vOvg
         YXjg==
X-Gm-Message-State: AOJu0Yyn0o1R2xDHbwvV4a+K7eUNPjh4qceu7Kxamk62eTf58vvpTxZS
	O0KUU1/1pM5FQspmDO/yv4vBdLiz3qAHFdOpsP5CW2AwFfARyW4k2cx4oGPIppI8kiUD/EoQJPa
	G
X-Google-Smtp-Source: AGHT+IGJPfZMv2Q7vMtyejiXGnofGYnyIKQIUhI72kFPROl85bzZ+OV9rm+qpyn9DViV7VlWH+Uiig==
X-Received: by 2002:a05:600c:1e27:b0:42c:b6db:4270 with SMTP id 5b1f17b1804b1-42e9610c32bmr18532965e9.11.1727264771394;
        Wed, 25 Sep 2024 04:46:11 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a54fdesm15897235e9.41.2024.09.25.04.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:46:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: Switch back to struct platform_driver::remove()
Date: Wed, 25 Sep 2024 13:45:47 +0200
Message-ID: <20240925114548.27405-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=75921; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Btv9yVxbCh8Mf7Bz29iLbh+++DyG0i7un7LqRD/9LXc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm8/fsljltVYdGA0pC2urfJ9mF1WuaPnquUJ5cg 5zMuG3RSOuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZvP37AAKCRCPgPtYfRL+ Tpw3CAC2ywS/ENtX2mrjWg0RwDPWJYu30EDEPOvk+DX/GOphPUToF78MxnVfR50dUJVw9yafLLf g4Hxw3mINnngJlpolBhk9eW54oEDOla0quAFBMF7WoFa1+1te8+7sUwUNUrGYcYIyXA5j9lvj6+ Yp1rMbis7KzzJB9pGl3RNsH4U+xTeXVIMYKZCCWsfa31rMz1JNltbp1Upeqzmaqa8CBariKPHxl xF/kCjoM3r9lSRc9eWUQPEcJU8UAuDfGN1Nl2VnSwUBwkYiqO7D7Hrumu7qZFshDJ8rtRgGjVzE pXO8inyw+2ccfVy9uvDAWeb5QSgxcOs1rknOhJhhr8vnSBbS
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/media to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/media. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split.

Note I didn't Cc: the maintainers of each driver as this would hit
sending limits.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/media/cec/platform/cec-gpio/cec-gpio.c                  | 2 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c                | 2 +-
 drivers/media/cec/platform/meson/ao-cec-g12a.c                  | 2 +-
 drivers/media/cec/platform/meson/ao-cec.c                       | 2 +-
 drivers/media/cec/platform/s5p/s5p_cec.c                        | 2 +-
 drivers/media/cec/platform/seco/seco-cec.c                      | 2 +-
 drivers/media/cec/platform/sti/stih-cec.c                       | 2 +-
 drivers/media/cec/platform/stm32/stm32-cec.c                    | 2 +-
 drivers/media/cec/platform/tegra/tegra_cec.c                    | 2 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c                       | 2 +-
 drivers/media/dvb-frontends/zd1301_demod.c                      | 2 +-
 drivers/media/platform/allegro-dvt/allegro-core.c               | 2 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c                | 2 +-
 drivers/media/platform/amphion/vpu_core.c                       | 2 +-
 drivers/media/platform/amphion/vpu_drv.c                        | 2 +-
 drivers/media/platform/aspeed/aspeed-video.c                    | 2 +-
 drivers/media/platform/atmel/atmel-isi.c                        | 2 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c                | 2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c                    | 2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c                    | 2 +-
 drivers/media/platform/chips-media/coda/coda-common.c           | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu.c            | 2 +-
 drivers/media/platform/imagination/e5010-jpeg-enc.c             | 2 +-
 drivers/media/platform/intel/pxa_camera.c                       | 2 +-
 drivers/media/platform/m2m-deinterlace.c                        | 2 +-
 drivers/media/platform/marvell/mmp-driver.c                     | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c            | 2 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c              | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c            | 2 +-
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 2 +-
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c | 2 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.c                   | 2 +-
 drivers/media/platform/microchip/microchip-csi2dc.c             | 2 +-
 drivers/media/platform/microchip/microchip-sama5d2-isc.c        | 2 +-
 drivers/media/platform/microchip/microchip-sama7g5-isc.c        | 2 +-
 drivers/media/platform/nuvoton/npcm-video.c                     | 2 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c                   | 2 +-
 drivers/media/platform/nxp/dw100/dw100.c                        | 2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                  | 2 +-
 drivers/media/platform/nxp/imx-mipi-csis.c                      | 2 +-
 drivers/media/platform/nxp/imx-pxp.c                            | 2 +-
 drivers/media/platform/nxp/imx7-media-csi.c                     | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c             | 2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c                   | 2 +-
 drivers/media/platform/nxp/mx2_emmaprp.c                        | 2 +-
 drivers/media/platform/qcom/camss/camss.c                       | 2 +-
 drivers/media/platform/qcom/venus/core.c                        | 2 +-
 drivers/media/platform/qcom/venus/vdec.c                        | 2 +-
 drivers/media/platform/qcom/venus/venc.c                        | 2 +-
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c            | 2 +-
 drivers/media/platform/renesas/rcar-csi2.c                      | 2 +-
 drivers/media/platform/renesas/rcar-fcp.c                       | 2 +-
 drivers/media/platform/renesas/rcar-isp.c                       | 2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c             | 2 +-
 drivers/media/platform/renesas/rcar_drif.c                      | 2 +-
 drivers/media/platform/renesas/rcar_fdp1.c                      | 2 +-
 drivers/media/platform/renesas/rcar_jpu.c                       | 2 +-
 drivers/media/platform/renesas/renesas-ceu.c                    | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c           | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c           | 2 +-
 drivers/media/platform/renesas/sh_vou.c                         | 2 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c                  | 2 +-
 drivers/media/platform/rockchip/rga/rga.c                       | 2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c             | 2 +-
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c            | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-core.c           | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c         | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c             | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c           | 2 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c           | 2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c           | 2 +-
 drivers/media/platform/samsung/s3c-camif/camif-core.c           | 2 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c                    | 2 +-
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c             | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                | 2 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                | 2 +-
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c        | 2 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c                | 2 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c                    | 2 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c                   | 2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c                    | 2 +-
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c      | 2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c              | 2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c              | 2 +-
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c  | 2 +-
 .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  | 2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                | 2 +-
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c        | 2 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c                  | 2 +-
 drivers/media/platform/ti/cal/cal.c                             | 2 +-
 drivers/media/platform/ti/davinci/vpif.c                        | 2 +-
 drivers/media/platform/ti/davinci/vpif_capture.c                | 2 +-
 drivers/media/platform/ti/davinci/vpif_display.c                | 2 +-
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c           | 2 +-
 drivers/media/platform/ti/omap/omap_vout.c                      | 2 +-
 drivers/media/platform/ti/omap3isp/isp.c                        | 2 +-
 drivers/media/platform/ti/vpe/vpe.c                             | 2 +-
 drivers/media/platform/verisilicon/hantro_drv.c                 | 2 +-
 drivers/media/platform/via/via-camera.c                         | 2 +-
 drivers/media/platform/video-mux.c                              | 2 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c                 | 2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c                      | 2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c                     | 2 +-
 drivers/media/platform/xilinx/xilinx-vtc.c                      | 2 +-
 drivers/media/radio/radio-si476x.c                              | 2 +-
 drivers/media/radio/radio-timb.c                                | 2 +-
 drivers/media/radio/radio-wl1273.c                              | 2 +-
 drivers/media/radio/si4713/radio-platform-si4713.c              | 2 +-
 drivers/media/rc/gpio-ir-recv.c                                 | 2 +-
 drivers/media/rc/img-ir/img-ir-core.c                           | 2 +-
 drivers/media/rc/ir-hix5hd2.c                                   | 2 +-
 drivers/media/rc/meson-ir.c                                     | 2 +-
 drivers/media/rc/mtk-cir.c                                      | 2 +-
 drivers/media/rc/st_rc.c                                        | 2 +-
 drivers/media/rc/sunxi-cir.c                                    | 2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c               | 2 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c                 | 2 +-
 drivers/media/test-drivers/vim2m.c                              | 2 +-
 drivers/media/test-drivers/vimc/vimc-core.c                     | 2 +-
 drivers/media/test-drivers/visl/visl-core.c                     | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.c                   | 2 +-
 drivers/media/tuners/it913x.c                                   | 2 +-
 122 files changed, 122 insertions(+), 122 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 98dacb0919b6..69351730ce86 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -279,7 +279,7 @@ MODULE_DEVICE_TABLE(of, cec_gpio_match);
 
 static struct platform_driver cec_gpio_pdrv = {
 	.probe	= cec_gpio_probe,
-	.remove_new = cec_gpio_remove,
+	.remove = cec_gpio_remove,
 	.driver = {
 		.name		= "cec-gpio",
 		.of_match_table	= cec_gpio_match,
diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8fbbb4091455..12b73ea0f31d 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -582,7 +582,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_cec_id);
 
 static struct platform_driver cros_ec_cec_driver = {
 	.probe = cros_ec_cec_probe,
-	.remove_new = cros_ec_cec_remove,
+	.remove = cros_ec_cec_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_cec_pm_ops,
diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 51294b9b6cd5..41f5b8669cb0 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -778,7 +778,7 @@ MODULE_DEVICE_TABLE(of, meson_ao_cec_g12a_of_match);
 
 static struct platform_driver meson_ao_cec_g12a_driver = {
 	.probe   = meson_ao_cec_g12a_probe,
-	.remove_new = meson_ao_cec_g12a_remove,
+	.remove = meson_ao_cec_g12a_remove,
 	.driver  = {
 		.name = "meson-ao-cec-g12a",
 		.of_match_table = of_match_ptr(meson_ao_cec_g12a_of_match),
diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 494738daf09a..145efd9af6ac 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -714,7 +714,7 @@ MODULE_DEVICE_TABLE(of, meson_ao_cec_of_match);
 
 static struct platform_driver meson_ao_cec_driver = {
 	.probe   = meson_ao_cec_probe,
-	.remove_new = meson_ao_cec_remove,
+	.remove = meson_ao_cec_remove,
 	.driver  = {
 		.name = "meson-ao-cec",
 		.of_match_table = meson_ao_cec_of_match,
diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 51ab4a80aafe..4a92d3230f66 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -294,7 +294,7 @@ MODULE_DEVICE_TABLE(of, s5p_cec_match);
 
 static struct platform_driver s5p_cec_pdrv = {
 	.probe	= s5p_cec_probe,
-	.remove_new = s5p_cec_remove,
+	.remove = s5p_cec_remove,
 	.driver	= {
 		.name		= CEC_NAME,
 		.of_match_table	= s5p_cec_match,
diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 5d4c5a2cae09..b7bb49f02395 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -778,7 +778,7 @@ static struct platform_driver secocec_driver = {
 		   .pm = SECOCEC_PM_OPS,
 	},
 	.probe = secocec_probe,
-	.remove_new = secocec_remove,
+	.remove = secocec_remove,
 };
 
 module_platform_driver(secocec_driver);
diff --git a/drivers/media/cec/platform/sti/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
index 99978a7c8d9b..49843d576c7c 100644
--- a/drivers/media/cec/platform/sti/stih-cec.c
+++ b/drivers/media/cec/platform/sti/stih-cec.c
@@ -383,7 +383,7 @@ MODULE_DEVICE_TABLE(of, stih_cec_match);
 
 static struct platform_driver stih_cec_pdrv = {
 	.probe	= stih_cec_probe,
-	.remove_new = stih_cec_remove,
+	.remove = stih_cec_remove,
 	.driver = {
 		.name		= CEC_NAME,
 		.of_match_table	= stih_cec_match,
diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index bda9d254041a..fea2d65acffc 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -361,7 +361,7 @@ MODULE_DEVICE_TABLE(of, stm32_cec_of_match);
 
 static struct platform_driver stm32_cec_driver = {
 	.probe  = stm32_cec_probe,
-	.remove_new = stm32_cec_remove,
+	.remove = stm32_cec_remove,
 	.driver = {
 		.name		= CEC_NAME,
 		.of_match_table = stm32_cec_of_match,
diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 7c1022cee1e8..3ed50097262f 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -465,7 +465,7 @@ static struct platform_driver tegra_cec_driver = {
 		.of_match_table = tegra_cec_of_match,
 	},
 	.probe = tegra_cec_probe,
-	.remove_new = tegra_cec_remove,
+	.remove = tegra_cec_remove,
 
 #ifdef CONFIG_PM
 	.suspend = tegra_cec_suspend,
diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 023db6e793f8..922c1662f1f0 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1487,7 +1487,7 @@ static struct platform_driver rtl2832_sdr_driver = {
 		.name   = "rtl2832_sdr",
 	},
 	.probe          = rtl2832_sdr_probe,
-	.remove_new     = rtl2832_sdr_remove,
+	.remove         = rtl2832_sdr_remove,
 };
 module_platform_driver(rtl2832_sdr_driver);
 
diff --git a/drivers/media/dvb-frontends/zd1301_demod.c b/drivers/media/dvb-frontends/zd1301_demod.c
index 17f6e373c13d..e8b9e67a8717 100644
--- a/drivers/media/dvb-frontends/zd1301_demod.c
+++ b/drivers/media/dvb-frontends/zd1301_demod.c
@@ -531,7 +531,7 @@ static struct platform_driver zd1301_demod_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe          = zd1301_demod_probe,
-	.remove_new     = zd1301_demod_remove,
+	.remove         = zd1301_demod_remove,
 };
 module_platform_driver(zd1301_demod_driver);
 
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 73606cee586e..76b4de1150b2 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -4003,7 +4003,7 @@ static const struct dev_pm_ops allegro_pm_ops = {
 
 static struct platform_driver allegro_driver = {
 	.probe = allegro_probe,
-	.remove_new = allegro_remove,
+	.remove = allegro_remove,
 	.driver = {
 		.name = "allegro",
 		.of_match_table = allegro_dt_ids,
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 09409908ba5d..b05c944d5dc2 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -1045,7 +1045,7 @@ MODULE_DEVICE_TABLE(of, meson_ge2d_match);
 
 static struct platform_driver ge2d_drv = {
 	.probe = ge2d_probe,
-	.remove_new = ge2d_remove,
+	.remove = ge2d_remove,
 	.driver = {
 		.name = "meson-ge2d",
 		.of_match_table = meson_ge2d_match,
diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 3a2030d02e45..8df85c14ab3f 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -864,7 +864,7 @@ MODULE_DEVICE_TABLE(of, vpu_core_dt_match);
 
 static struct platform_driver amphion_vpu_core_driver = {
 	.probe = vpu_core_probe,
-	.remove_new = vpu_core_remove,
+	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
 		.of_match_table = vpu_core_dt_match,
diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 2bf70aafd2ba..c6cbcaf433ee 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -227,7 +227,7 @@ MODULE_DEVICE_TABLE(of, vpu_dt_match);
 
 static struct platform_driver amphion_vpu_driver = {
 	.probe = vpu_probe,
-	.remove_new = vpu_remove,
+	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
 		.of_match_table = vpu_dt_match,
diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..fd5403498115 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2226,7 +2226,7 @@ static struct platform_driver aspeed_video_driver = {
 		.of_match_table = aspeed_video_of_match,
 	},
 	.probe = aspeed_video_probe,
-	.remove_new = aspeed_video_remove,
+	.remove = aspeed_video_remove,
 };
 
 module_platform_driver(aspeed_video_driver);
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 5c823d3f9cc0..049b7faf5790 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1367,7 +1367,7 @@ static struct platform_driver atmel_isi_driver = {
 		.pm	= &atmel_isi_dev_pm_ops,
 	},
 	.probe		= atmel_isi_probe,
-	.remove_new	= atmel_isi_remove,
+	.remove		= atmel_isi_remove,
 };
 
 module_platform_driver(atmel_isi_driver);
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index a1d93c14553d..6dcc6c13a754 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2724,7 +2724,7 @@ MODULE_DEVICE_TABLE(of, unicam_of_match);
 
 static struct platform_driver unicam_driver = {
 	.probe		= unicam_probe,
-	.remove_new	= unicam_remove,
+	.remove		= unicam_remove,
 	.driver = {
 		.name	= UNICAM_MODULE_NAME,
 		.pm	= pm_ptr(&unicam_pm_ops),
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 6f7d27a48eff..4d64df829e75 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -751,7 +751,7 @@ MODULE_DEVICE_TABLE(of, csi2rx_of_table);
 
 static struct platform_driver csi2rx_driver = {
 	.probe	= csi2rx_probe,
-	.remove_new = csi2rx_remove,
+	.remove = csi2rx_remove,
 
 	.driver	= {
 		.name		= "cdns-csi2rx",
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 3d98f91f1bee..e22b133f346d 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -644,7 +644,7 @@ static void csi2tx_remove(struct platform_device *pdev)
 
 static struct platform_driver csi2tx_driver = {
 	.probe	= csi2tx_probe,
-	.remove_new = csi2tx_remove,
+	.remove = csi2tx_remove,
 
 	.driver	= {
 		.name		= "cdns-csi2tx",
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 7da0194ec850..c3afd63edbb2 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3346,7 +3346,7 @@ static const struct dev_pm_ops coda_pm_ops = {
 
 static struct platform_driver coda_driver = {
 	.probe	= coda_probe,
-	.remove_new = coda_remove,
+	.remove = coda_remove,
 	.driver	= {
 		.name	= CODA_NAME,
 		.of_match_table = coda_dt_ids,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 7273254ecb03..5e56b8fac6a3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -339,7 +339,7 @@ static struct platform_driver wave5_vpu_driver = {
 		.of_match_table = of_match_ptr(wave5_dt_ids),
 		},
 	.probe = wave5_vpu_probe,
-	.remove_new = wave5_vpu_remove,
+	.remove = wave5_vpu_remove,
 };
 
 module_platform_driver(wave5_vpu_driver);
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 187f2d8abfbb..25044f15672e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -1619,7 +1619,7 @@ MODULE_DEVICE_TABLE(of, e5010_of_match);
 
 static struct platform_driver e5010_driver = {
 	.probe = e5010_probe,
-	.remove_new = e5010_remove,
+	.remove = e5010_remove,
 	.driver = {
 		.name = E5010_MODULE_NAME,
 		.of_match_table = e5010_of_match,
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index f118aaac0b38..b8b1cf0665ab 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2460,7 +2460,7 @@ static struct platform_driver pxa_camera_driver = {
 		.of_match_table = pxa_camera_of_match,
 	},
 	.probe		= pxa_camera_probe,
-	.remove_new	= pxa_camera_remove,
+	.remove		= pxa_camera_remove,
 };
 
 module_platform_driver(pxa_camera_driver);
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 5adcef80c698..7d331c37525a 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -993,7 +993,7 @@ static void deinterlace_remove(struct platform_device *pdev)
 
 static struct platform_driver deinterlace_pdrv = {
 	.probe		= deinterlace_probe,
-	.remove_new	= deinterlace_remove,
+	.remove		= deinterlace_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index ff9d151121d5..3fd4fc1b9c48 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -359,7 +359,7 @@ MODULE_DEVICE_TABLE(of, mmpcam_of_match);
 
 static struct platform_driver mmpcam_driver = {
 	.probe		= mmpcam_probe,
-	.remove_new	= mmpcam_remove,
+	.remove		= mmpcam_remove,
 	.driver = {
 		.name	= "mmp-camera",
 		.of_match_table = mmpcam_of_match,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index ac48658e2de4..29c1a98d267c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1950,7 +1950,7 @@ MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
-	.remove_new = mtk_jpeg_remove,
+	.remove = mtk_jpeg_remove,
 	.driver = {
 		.name           = MTK_JPEG_NAME,
 		.of_match_table = mtk_jpeg_match,
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 917cdf38f230..80fdc6ff57e0 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -298,7 +298,7 @@ static const struct dev_pm_ops mtk_mdp_pm_ops = {
 
 static struct platform_driver mtk_mdp_driver = {
 	.probe		= mtk_mdp_probe,
-	.remove_new	= mtk_mdp_remove,
+	.remove		= mtk_mdp_remove,
 	.driver = {
 		.name	= MTK_MDP_MODULE_NAME,
 		.pm	= &mtk_mdp_pm_ops,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 37e7b985d52c..5e94ff0d0756 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -413,7 +413,7 @@ static const struct dev_pm_ops mdp_pm_ops = {
 
 static struct platform_driver mdp_driver = {
 	.probe		= mdp_probe,
-	.remove_new	= mdp_remove,
+	.remove		= mdp_remove,
 	.driver = {
 		.name	= MDP_MODULE_NAME,
 		.pm	= &mdp_pm_ops,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 2073781ccadb..9247d92d431d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -591,7 +591,7 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_vcodec_dec_driver = {
 	.probe	= mtk_vcodec_probe,
-	.remove_new = mtk_vcodec_dec_remove,
+	.remove = mtk_vcodec_dec_remove,
 	.driver	= {
 		.name	= MTK_VCODEC_DEC_NAME,
 		.of_match_table = mtk_vcodec_match,
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 3cb8a1622222..a1e4483abcdb 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -473,7 +473,7 @@ static void mtk_vcodec_enc_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_vcodec_enc_driver = {
 	.probe	= mtk_vcodec_probe,
-	.remove_new = mtk_vcodec_enc_remove,
+	.remove = mtk_vcodec_enc_remove,
 	.driver	= {
 		.name	= MTK_VCODEC_ENC_NAME,
 		.of_match_table = mtk_vcodec_enc_match,
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 724ae7c2ab3b..8d8319f0cd22 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -1041,7 +1041,7 @@ static const struct dev_pm_ops mtk_vpu_pm = {
 
 static struct platform_driver mtk_vpu_driver = {
 	.probe	= mtk_vpu_probe,
-	.remove_new = mtk_vpu_remove,
+	.remove = mtk_vpu_remove,
 	.driver	= {
 		.name	= "mtk_vpu",
 		.pm = &mtk_vpu_pm,
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index fee73260bb1e..70303a0b6919 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -782,7 +782,7 @@ MODULE_DEVICE_TABLE(of, csi2dc_of_match);
 
 static struct platform_driver csi2dc_driver = {
 	.probe	= csi2dc_probe,
-	.remove_new = csi2dc_remove,
+	.remove = csi2dc_remove,
 	.driver = {
 		.name =			"microchip-csi2dc",
 		.pm =			&csi2dc_dev_pm_ops,
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 60b6d922d764..66d3d7891991 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -658,7 +658,7 @@ MODULE_DEVICE_TABLE(of, microchip_isc_of_match);
 
 static struct platform_driver microchip_isc_driver = {
 	.probe	= microchip_isc_probe,
-	.remove_new = microchip_isc_remove,
+	.remove = microchip_isc_remove,
 	.driver	= {
 		.name		= "microchip-sama5d2-isc",
 		.pm		= &microchip_isc_dev_pm_ops,
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index e97abe3e35af..b0302dfc3278 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -621,7 +621,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove_new = microchip_xisc_remove,
+	.remove = microchip_xisc_remove,
 	.driver	= {
 		.name		= "microchip-sama7g5-xisc",
 		.pm		= &microchip_xisc_dev_pm_ops,
diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 60fbb9140035..3b527029cbbb 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1814,7 +1814,7 @@ static struct platform_driver npcm_video_driver = {
 		.of_match_table = npcm_video_match,
 	},
 	.probe = npcm_video_probe,
-	.remove_new = npcm_video_remove,
+	.remove = npcm_video_remove,
 };
 
 module_platform_driver(npcm_video_driver);
diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index 81a0d3b76b88..3232392c60e2 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -535,7 +535,7 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
-	.remove_new	= tegra_vde_remove,
+	.remove		= tegra_vde_remove,
 	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 0024d6175ad9..9af42c0bcc0b 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1688,7 +1688,7 @@ MODULE_DEVICE_TABLE(of, dw100_dt_ids);
 
 static struct platform_driver dw100_driver = {
 	.probe		= dw100_probe,
-	.remove_new	= dw100_remove,
+	.remove		= dw100_remove,
 	.driver		= {
 		.name	= DRV_NAME,
 		.pm = &dw100_pm,
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1d8913813037..c88517483441 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2959,7 +2959,7 @@ MODULE_DEVICE_TABLE(of, mxc_jpeg_match);
 
 static struct platform_driver mxc_jpeg_driver = {
 	.probe = mxc_jpeg_probe,
-	.remove_new = mxc_jpeg_remove,
+	.remove = mxc_jpeg_remove,
 	.driver = {
 		.name = "mxc-jpeg",
 		.of_match_table = mxc_jpeg_match,
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 44e1402e8be1..29523bb84d95 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1570,7 +1570,7 @@ MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
 
 static struct platform_driver mipi_csis_driver = {
 	.probe		= mipi_csis_probe,
-	.remove_new	= mipi_csis_remove,
+	.remove		= mipi_csis_remove,
 	.driver		= {
 		.of_match_table = mipi_csis_of_match,
 		.name		= CSIS_DRIVER_NAME,
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index e4427e6487fb..e696d377960f 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1943,7 +1943,7 @@ MODULE_DEVICE_TABLE(of, pxp_dt_ids);
 
 static struct platform_driver pxp_driver = {
 	.probe		= pxp_probe,
-	.remove_new	= pxp_remove,
+	.remove		= pxp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 		.of_match_table = pxp_dt_ids,
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 9566ff738818..08e36b7bab59 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2281,7 +2281,7 @@ MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
 
 static struct platform_driver imx7_csi_driver = {
 	.probe = imx7_csi_probe,
-	.remove_new = imx7_csi_remove,
+	.remove = imx7_csi_remove,
 	.driver = {
 		.of_match_table = imx7_csi_of_match,
 		.name = "imx7-csi",
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c2013995049c..aaf58063677c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -535,7 +535,7 @@ MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
 
 static struct platform_driver mxc_isi_driver = {
 	.probe		= mxc_isi_probe,
-	.remove_new	= mxc_isi_remove,
+	.remove		= mxc_isi_remove,
 	.driver = {
 		.of_match_table = mxc_isi_of_match,
 		.name		= MXC_ISI_DRIVER_NAME,
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index d4a6c5532969..1f2657cf6e82 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -953,7 +953,7 @@ MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
 
 static struct platform_driver imx8mq_mipi_csi_driver = {
 	.probe		= imx8mq_mipi_csi_probe,
-	.remove_new	= imx8mq_mipi_csi_remove,
+	.remove		= imx8mq_mipi_csi_remove,
 	.driver		= {
 		.of_match_table = imx8mq_mipi_csi_of_match,
 		.name		= MIPI_CSI2_DRIVER_NAME,
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 023ed40c6b08..bcad0aed7206 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -902,7 +902,7 @@ static void emmaprp_remove(struct platform_device *pdev)
 
 static struct platform_driver emmaprp_pdrv = {
 	.probe		= emmaprp_probe,
-	.remove_new	= emmaprp_remove,
+	.remove		= emmaprp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d64985ca6e88..151e4c4338f0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2497,7 +2497,7 @@ static const struct dev_pm_ops camss_pm_ops = {
 
 static struct platform_driver qcom_camss_driver = {
 	.probe = camss_probe,
-	.remove_new = camss_remove,
+	.remove = camss_remove,
 	.driver = {
 		.name = "qcom-camss",
 		.of_match_table = camss_dt_match,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 84e95a46dfc9..00eb98f53d47 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,7 +949,7 @@ MODULE_DEVICE_TABLE(of, venus_dt_match);
 
 static struct platform_driver qcom_venus_driver = {
 	.probe = venus_probe,
-	.remove_new = venus_remove,
+	.remove = venus_remove,
 	.driver = {
 		.name = "qcom-venus",
 		.of_match_table = venus_dt_match,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d12089370d91..fd4c4934c910 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1875,7 +1875,7 @@ MODULE_DEVICE_TABLE(of, vdec_dt_match);
 
 static struct platform_driver qcom_venus_dec_driver = {
 	.probe = vdec_probe,
-	.remove_new = vdec_remove,
+	.remove = vdec_remove,
 	.driver = {
 		.name = "qcom-venus-decoder",
 		.of_match_table = vdec_dt_match,
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..b1093683c306 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1643,7 +1643,7 @@ MODULE_DEVICE_TABLE(of, venc_dt_match);
 
 static struct platform_driver qcom_venus_enc_driver = {
 	.probe = venc_probe,
-	.remove_new = venc_remove,
+	.remove = venc_remove,
 	.driver = {
 		.name = "qcom-venus-encoder",
 		.of_match_table = venc_dt_match,
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..7596ae1f7de6 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1781,7 +1781,7 @@ MODULE_DEVICE_TABLE(of, pispbe_of_match);
 
 static struct platform_driver pispbe_pdrv = {
 	.probe		= pispbe_probe,
-	.remove_new	= pispbe_remove,
+	.remove		= pispbe_remove,
 	.driver		= {
 		.name	= PISPBE_NAME,
 		.of_match_table = pispbe_of_match,
diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index c419ddb4c5a2..c9e2862fcaa5 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1974,7 +1974,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver rcar_csi2_pdrv = {
-	.remove_new = rcsi2_remove,
+	.remove = rcsi2_remove,
 	.probe	= rcsi2_probe,
 	.driver	= {
 		.name	= "rcar-csi2",
diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
index bcef7b87da7c..cee9bbce4e3a 100644
--- a/drivers/media/platform/renesas/rcar-fcp.c
+++ b/drivers/media/platform/renesas/rcar-fcp.c
@@ -164,7 +164,7 @@ MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
 
 static struct platform_driver rcar_fcp_platform_driver = {
 	.probe		= rcar_fcp_probe,
-	.remove_new	= rcar_fcp_remove,
+	.remove		= rcar_fcp_remove,
 	.driver		= {
 		.name	= "rcar-fcp",
 		.of_match_table = rcar_fcp_of_match,
diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 4512ac338ca5..8d96b6a2427a 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -522,7 +522,7 @@ static struct platform_driver rcar_isp_driver = {
 		.of_match_table = risp_of_id_table,
 	},
 	.probe = risp_probe,
-	.remove_new = risp_remove,
+	.remove = risp_remove,
 };
 
 module_platform_driver(rcar_isp_driver);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 695d884a22d1..b738b19ed900 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1443,7 +1443,7 @@ static struct platform_driver rcar_vin_driver = {
 		.of_match_table = rvin_of_id_table,
 	},
 	.probe = rcar_vin_probe,
-	.remove_new = rcar_vin_remove,
+	.remove = rcar_vin_remove,
 };
 
 module_platform_driver(rcar_vin_driver);
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index f21d05054341..8db1f726cb33 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1475,7 +1475,7 @@ static struct platform_driver rcar_drif_driver = {
 		.pm = &rcar_drif_pm_ops,
 		},
 	.probe = rcar_drif_probe,
-	.remove_new = rcar_drif_remove,
+	.remove = rcar_drif_remove,
 };
 
 module_platform_driver(rcar_drif_driver);
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index a2565b269f3b..5827cc33ab50 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2444,7 +2444,7 @@ MODULE_DEVICE_TABLE(of, fdp1_dt_ids);
 
 static struct platform_driver fdp1_pdrv = {
 	.probe		= fdp1_probe,
-	.remove_new	= fdp1_remove,
+	.remove		= fdp1_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = fdp1_dt_ids,
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index fff349e45067..881df8a8a1ac 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1736,7 +1736,7 @@ static const struct dev_pm_ops jpu_pm_ops = {
 
 static struct platform_driver jpu_driver = {
 	.probe = jpu_probe,
-	.remove_new = jpu_remove,
+	.remove = jpu_remove,
 	.driver = {
 		.of_match_table = jpu_dt_ids,
 		.name = DRV_NAME,
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 167760276796..cacfa3951c4d 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1723,7 +1723,7 @@ static struct platform_driver ceu_driver = {
 		.of_match_table = of_match_ptr(ceu_of_match),
 	},
 	.probe		= ceu_probe,
-	.remove_new	= ceu_remove,
+	.remove		= ceu_remove,
 };
 
 module_platform_driver(ceu_driver);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 280efd2a8185..873b13ec3772 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -325,7 +325,7 @@ static struct platform_driver rzg2l_cru_driver = {
 		.of_match_table = rzg2l_cru_of_id_table,
 	},
 	.probe = rzg2l_cru_probe,
-	.remove_new = rzg2l_cru_remove,
+	.remove = rzg2l_cru_remove,
 };
 
 module_platform_driver(rzg2l_cru_driver);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index c7fdee347ac8..e725982c4705 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -868,7 +868,7 @@ static const struct of_device_id rzg2l_csi2_of_table[] = {
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
 
 static struct platform_driver rzg2l_csi2_pdrv = {
-	.remove_new = rzg2l_csi2_remove,
+	.remove = rzg2l_csi2_remove,
 	.probe	= rzg2l_csi2_probe,
 	.driver	= {
 		.name = "rzg2l-csi2",
diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index 1e74dd601c2b..d440e5459919 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -1359,7 +1359,7 @@ static void sh_vou_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver sh_vou = {
-	.remove_new = sh_vou_remove,
+	.remove = sh_vou_remove,
 	.driver  = {
 		.name	= "sh-vou",
 	},
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 1aac44d68731..9fc6bf624a52 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -1005,7 +1005,7 @@ MODULE_DEVICE_TABLE(of, vsp1_of_match);
 
 static struct platform_driver vsp1_platform_driver = {
 	.probe		= vsp1_probe,
-	.remove_new	= vsp1_remove,
+	.remove		= vsp1_remove,
 	.driver		= {
 		.name	= "vsp1",
 		.pm	= &vsp1_pm_ops,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0e768f3e9eda..4cf23cbbf0b5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -972,7 +972,7 @@ MODULE_DEVICE_TABLE(of, rockchip_rga_match);
 
 static struct platform_driver rga_pdrv = {
 	.probe = rga_probe,
-	.remove_new = rga_remove,
+	.remove = rga_remove,
 	.driver = {
 		.name = RGA_NAME,
 		.pm = &rga_pm,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..0100b9c3edbe 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -752,7 +752,7 @@ static struct platform_driver rkisp1_drv = {
 		.pm = &rkisp1_pm_ops,
 	},
 	.probe = rkisp1_probe,
-	.remove_new = rkisp1_remove,
+	.remove = rkisp1_remove,
 };
 
 module_platform_driver(rkisp1_drv);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
index f45f5c8612a6..a06d7cace92f 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
@@ -1309,7 +1309,7 @@ static const struct dev_pm_ops gsc_pm_ops = {
 
 static struct platform_driver gsc_driver = {
 	.probe		= gsc_probe,
-	.remove_new	= gsc_remove,
+	.remove		= gsc_remove,
 	.driver = {
 		.name	= GSC_MODULE_NAME,
 		.pm	= &gsc_pm_ops,
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index adfc2d73d04b..2c9edd0a559b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -1157,7 +1157,7 @@ static const struct dev_pm_ops fimc_pm_ops = {
 
 static struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
-	.remove_new	= fimc_remove,
+	.remove		= fimc_remove,
 	.driver = {
 		.of_match_table = fimc_of_match,
 		.name		= FIMC_DRIVER_NAME,
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
index 44363c4241d5..b243cbb1d010 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
@@ -137,7 +137,7 @@ static const struct of_device_id fimc_is_i2c_of_match[] = {
 
 static struct platform_driver fimc_is_i2c_driver = {
 	.probe		= fimc_is_i2c_probe,
-	.remove_new	= fimc_is_i2c_remove,
+	.remove		= fimc_is_i2c_remove,
 	.driver = {
 		.of_match_table = fimc_is_i2c_of_match,
 		.name		= "fimc-isp-i2c",
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0a4b58daf924..2e8fe9e49735 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -963,7 +963,7 @@ static const struct dev_pm_ops fimc_is_pm_ops = {
 
 static struct platform_driver fimc_is_driver = {
 	.probe		= fimc_is_probe,
-	.remove_new	= fimc_is_remove,
+	.remove		= fimc_is_remove,
 	.driver = {
 		.of_match_table	= fimc_is_of_match,
 		.name		= FIMC_IS_DRV_NAME,
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 1a4d75443215..e362719612d2 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1654,7 +1654,7 @@ MODULE_DEVICE_TABLE(of, flite_of_match);
 
 static struct platform_driver fimc_lite_driver = {
 	.probe		= fimc_lite_probe,
-	.remove_new	= fimc_lite_remove,
+	.remove		= fimc_lite_remove,
 	.driver = {
 		.of_match_table = flite_of_match,
 		.name		= FIMC_LITE_DRV_NAME,
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 5f10bb4eb4f7..b5ee3c547789 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1564,7 +1564,7 @@ MODULE_DEVICE_TABLE(of, fimc_md_of_match);
 
 static struct platform_driver fimc_md_driver = {
 	.probe		= fimc_md_probe,
-	.remove_new	= fimc_md_remove,
+	.remove		= fimc_md_remove,
 	.driver = {
 		.of_match_table = of_match_ptr(fimc_md_of_match),
 		.name		= "s5p-fimc-md",
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 4b9b20ba3504..63f3eecdd7e6 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -1020,7 +1020,7 @@ MODULE_DEVICE_TABLE(of, s5pcsis_of_match);
 
 static struct platform_driver s5pcsis_driver = {
 	.probe		= s5pcsis_probe,
-	.remove_new	= s5pcsis_remove,
+	.remove		= s5pcsis_remove,
 	.driver		= {
 		.of_match_table = s5pcsis_of_match,
 		.name		= CSIS_DRIVER_NAME,
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index e4529f666e20..de6e8f151849 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -622,7 +622,7 @@ static const struct dev_pm_ops s3c_camif_pm_ops = {
 
 static struct platform_driver s3c_camif_driver = {
 	.probe		= s3c_camif_probe,
-	.remove_new	= s3c_camif_remove,
+	.remove		= s3c_camif_remove,
 	.id_table	= s3c_camif_driver_ids,
 	.driver = {
 		.name	= S3C_CAMIF_DRIVER_NAME,
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index 89aeba47ed07..e5e55a41bf3e 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -777,7 +777,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
 
 static struct platform_driver g2d_pdrv = {
 	.probe		= g2d_probe,
-	.remove_new	= g2d_remove,
+	.remove		= g2d_remove,
 	.driver		= {
 		.name = G2D_NAME,
 		.of_match_table = exynos_g2d_match,
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index d2c4a0178b3c..30a6144f2c77 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -3160,7 +3160,7 @@ static void *jpeg_get_drv_data(struct device *dev)
 
 static struct platform_driver s5p_jpeg_driver = {
 	.probe = s5p_jpeg_probe,
-	.remove_new = s5p_jpeg_remove,
+	.remove = s5p_jpeg_remove,
 	.driver = {
 		.of_match_table	= samsung_jpeg_match,
 		.name		= S5P_JPEG_M2M_NAME,
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 50451984d59f..2fe3c9228ac5 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1721,7 +1721,7 @@ MODULE_DEVICE_TABLE(of, exynos_mfc_match);
 
 static struct platform_driver s5p_mfc_driver = {
 	.probe		= s5p_mfc_probe,
-	.remove_new	= s5p_mfc_remove,
+	.remove		= s5p_mfc_remove,
 	.driver	= {
 		.name	= S5P_MFC_NAME,
 		.pm	= &s5p_mfc_pm_ops,
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index c7ee6e1a4451..3b0066cf2eb0 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -1411,7 +1411,7 @@ MODULE_DEVICE_TABLE(of, bdisp_match_types);
 
 static struct platform_driver bdisp_driver = {
 	.probe          = bdisp_probe,
-	.remove_new     = bdisp_remove,
+	.remove         = bdisp_remove,
 	.driver         = {
 		.name           = BDISP_NAME,
 		.of_match_table = bdisp_match_types,
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 67d3d6e50d2e..7b3a37957e3a 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -1158,7 +1158,7 @@ static struct platform_driver c8sectpfe_driver = {
 		.of_match_table = c8sectpfe_match,
 	},
 	.probe	= c8sectpfe_probe,
-	.remove_new = c8sectpfe_remove,
+	.remove = c8sectpfe_remove,
 };
 
 module_platform_driver(c8sectpfe_driver);
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index da402d1e9171..fdee7fae3a20 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1954,7 +1954,7 @@ MODULE_DEVICE_TABLE(of, delta_match_types);
 
 static struct platform_driver delta_driver = {
 	.probe = delta_probe,
-	.remove_new = delta_remove,
+	.remove = delta_remove,
 	.driver = {
 		   .name = DELTA_NAME,
 		   .of_match_table = delta_match_types,
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 161a5c0fbc4e..31a94300d645 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1456,7 +1456,7 @@ MODULE_DEVICE_TABLE(of, hva_match_types);
 
 static struct platform_driver hva_driver = {
 	.probe  = hva_probe,
-	.remove_new = hva_remove,
+	.remove = hva_remove,
 	.driver = {
 		.name		= HVA_NAME,
 		.of_match_table	= hva_match_types,
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 92f1edee58f8..643bda7f9f7d 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -717,7 +717,7 @@ MODULE_DEVICE_TABLE(of, stm32_dma2d_match);
 
 static struct platform_driver dma2d_pdrv = {
 	.probe		= dma2d_probe,
-	.remove_new	= dma2d_remove,
+	.remove		= dma2d_remove,
 	.driver		= {
 		.name = DMA2D_NAME,
 		.of_match_table = stm32_dma2d_match,
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index ff3331af9406..a28db89e4b50 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2149,7 +2149,7 @@ static const struct dev_pm_ops dcmi_pm_ops = {
 
 static struct platform_driver stm32_dcmi_driver = {
 	.probe		= dcmi_probe,
-	.remove_new	= dcmi_remove,
+	.remove		= dcmi_remove,
 	.driver		= {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(stm32_dcmi_of_match),
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 7f771ea49b78..3806f7c6e2fe 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -583,7 +583,7 @@ static const struct dev_pm_ops dcmipp_pm_ops = {
 
 static struct platform_driver dcmipp_pdrv = {
 	.probe		= dcmipp_probe,
-	.remove_new	= dcmipp_remove,
+	.remove		= dcmipp_remove,
 	.driver		= {
 		.name	= DCMIPP_PDEV_NAME,
 		.of_match_table = dcmipp_of_match,
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index d07e980aba61..e53a07b770b7 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -340,7 +340,7 @@ static const struct dev_pm_ops sun4i_csi_pm_ops = {
 
 static struct platform_driver sun4i_csi_driver = {
 	.probe	= sun4i_csi_probe,
-	.remove_new = sun4i_csi_remove,
+	.remove = sun4i_csi_remove,
 	.driver	= {
 		.name		= "sun4i-csi",
 		.of_match_table	= sun4i_csi_of_match,
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index c6ba385c0c86..af2a32c226a5 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -423,7 +423,7 @@ MODULE_DEVICE_TABLE(of, sun6i_csi_of_match);
 
 static struct platform_driver sun6i_csi_platform_driver = {
 	.probe	= sun6i_csi_probe,
-	.remove_new = sun6i_csi_remove,
+	.remove = sun6i_csi_remove,
 	.driver	= {
 		.name		= SUN6I_CSI_NAME,
 		.of_match_table	= sun6i_csi_of_match,
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index f9d4dc45b490..b06cb73015cd 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -757,7 +757,7 @@ MODULE_DEVICE_TABLE(of, sun6i_mipi_csi2_of_match);
 
 static struct platform_driver sun6i_mipi_csi2_platform_driver = {
 	.probe	= sun6i_mipi_csi2_probe,
-	.remove_new = sun6i_mipi_csi2_remove,
+	.remove = sun6i_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN6I_MIPI_CSI2_NAME,
 		.of_match_table	= sun6i_mipi_csi2_of_match,
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index 4a5698eb12b7..dbc51daa4fe3 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -824,7 +824,7 @@ MODULE_DEVICE_TABLE(of, sun8i_a83t_mipi_csi2_of_match);
 
 static struct platform_driver sun8i_a83t_mipi_csi2_platform_driver = {
 	.probe	= sun8i_a83t_mipi_csi2_probe,
-	.remove_new = sun8i_a83t_mipi_csi2_remove,
+	.remove = sun8i_a83t_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN8I_A83T_MIPI_CSI2_NAME,
 		.of_match_table	= sun8i_a83t_mipi_csi2_of_match,
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index a1c35a2b68ed..c55b1761b089 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -1001,7 +1001,7 @@ static const struct dev_pm_ops deinterlace_pm_ops = {
 
 static struct platform_driver deinterlace_driver = {
 	.probe		= deinterlace_probe,
-	.remove_new	= deinterlace_remove,
+	.remove		= deinterlace_remove,
 	.driver		= {
 		.name		= DEINTERLACE_NAME,
 		.of_match_table	= deinterlace_dt_match,
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index a12323ca89fa..d60d3496e5b4 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -905,7 +905,7 @@ static const struct dev_pm_ops rotate_pm_ops = {
 
 static struct platform_driver rotate_driver = {
 	.probe		= rotate_probe,
-	.remove_new	= rotate_remove,
+	.remove		= rotate_remove,
 	.driver		= {
 		.name		= ROTATE_NAME,
 		.of_match_table	= rotate_dt_match,
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 009ff68a2b43..edbe0620ecaa 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2617,7 +2617,7 @@ MODULE_DEVICE_TABLE(of, vpfe_of_match);
 
 static struct platform_driver vpfe_driver = {
 	.probe		= vpfe_probe,
-	.remove_new	= vpfe_remove,
+	.remove		= vpfe_remove,
 	.driver = {
 		.name	= VPFE_MODULE_NAME,
 		.pm	= &vpfe_pm_ops,
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 5c2c04142aee..4bd2092e0255 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1332,7 +1332,7 @@ static const struct dev_pm_ops cal_pm_ops = {
 
 static struct platform_driver cal_pdrv = {
 	.probe		= cal_probe,
-	.remove_new	= cal_remove,
+	.remove		= cal_remove,
 	.driver		= {
 		.name	= CAL_MODULE_NAME,
 		.pm	= &cal_pm_ops,
diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index f4e1fa76bf37..a81719702a22 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -589,7 +589,7 @@ static struct platform_driver vpif_driver = {
 		.name	= VPIF_DRIVER_NAME,
 		.pm	= vpif_pm_ops,
 	},
-	.remove_new = vpif_remove,
+	.remove = vpif_remove,
 	.probe = vpif_probe,
 };
 
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 16326437767f..8357450b3f01 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1815,7 +1815,7 @@ static __refdata struct platform_driver vpif_driver = {
 		.pm	= &vpif_pm_ops,
 	},
 	.probe = vpif_probe,
-	.remove_new = vpif_remove,
+	.remove = vpif_remove,
 };
 
 module_platform_driver(vpif_driver);
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index 76d8fa8ad088..bea47e5159de 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1398,7 +1398,7 @@ static __refdata struct platform_driver vpif_driver = {
 			.pm	= &vpif_pm_ops,
 	},
 	.probe	= vpif_probe,
-	.remove_new = vpif_remove,
+	.remove = vpif_remove,
 };
 
 module_platform_driver(vpif_driver);
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 22442fce7607..bd9c9e6ac573 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1163,7 +1163,7 @@ MODULE_DEVICE_TABLE(of, ti_csi2rx_of_match);
 
 static struct platform_driver ti_csi2rx_pdrv = {
 	.probe = ti_csi2rx_probe,
-	.remove_new = ti_csi2rx_remove,
+	.remove = ti_csi2rx_remove,
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 1c56b6a87ced..85dca2190428 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1721,7 +1721,7 @@ static struct platform_driver omap_vout_driver = {
 	.driver = {
 		.name = VOUT_NAME,
 	},
-	.remove_new = omap_vout_remove,
+	.remove = omap_vout_remove,
 };
 
 static int __init omap_vout_init(void)
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 91101ba88ef0..405ca215179d 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2472,7 +2472,7 @@ MODULE_DEVICE_TABLE(of, omap3isp_of_table);
 
 static struct platform_driver omap3isp_driver = {
 	.probe = isp_probe,
-	.remove_new = isp_remove,
+	.remove = isp_remove,
 	.id_table = omap3isp_id_table,
 	.driver = {
 		.name = "omap3isp",
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 6848cbc82f52..bd2e97afd776 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2649,7 +2649,7 @@ MODULE_DEVICE_TABLE(of, vpe_of_match);
 
 static struct platform_driver vpe_pdrv = {
 	.probe		= vpe_probe,
-	.remove_new	= vpe_remove,
+	.remove		= vpe_remove,
 	.driver		= {
 		.name	= VPE_MODULE_NAME,
 		.of_match_table = of_match_ptr(vpe_of_match),
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 05bbac853c4f..8542238e0fb1 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1277,7 +1277,7 @@ static const struct dev_pm_ops hantro_pm_ops = {
 
 static struct platform_driver hantro_driver = {
 	.probe = hantro_probe,
-	.remove_new = hantro_remove,
+	.remove = hantro_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_hantro_match,
diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 4cb8f29e2f14..195e9bf1eedf 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -1307,7 +1307,7 @@ static struct platform_driver viacam_driver = {
 		.name = "viafb-camera",
 	},
 	.probe = viacam_probe,
-	.remove_new = viacam_remove,
+	.remove = viacam_remove,
 };
 
 module_platform_driver(viacam_driver);
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 31e9e92e723e..5748aff8fc40 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -486,7 +486,7 @@ MODULE_DEVICE_TABLE(of, video_mux_dt_ids);
 
 static struct platform_driver video_mux_driver = {
 	.probe		= video_mux_probe,
-	.remove_new	= video_mux_remove,
+	.remove		= video_mux_remove,
 	.driver		= {
 		.of_match_table = video_mux_dt_ids,
 		.name = "video-mux",
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index f953d5474ae0..146131b8f37e 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -1028,7 +1028,7 @@ static struct platform_driver xcsi2rxss_driver = {
 		.of_match_table	= xcsi2rxss_of_id_table,
 	},
 	.probe			= xcsi2rxss_probe,
-	.remove_new		= xcsi2rxss_remove,
+	.remove			= xcsi2rxss_remove,
 };
 
 module_platform_driver(xcsi2rxss_driver);
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..f895a9a6575a 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -920,7 +920,7 @@ static struct platform_driver xtpg_driver = {
 		.of_match_table	= xtpg_of_id_table,
 	},
 	.probe			= xtpg_probe,
-	.remove_new		= xtpg_remove,
+	.remove			= xtpg_remove,
 };
 
 module_platform_driver(xtpg_driver);
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index bfe48cc0ab52..024b439feec9 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -618,7 +618,7 @@ static struct platform_driver xvip_composite_driver = {
 		.of_match_table = xvip_composite_of_id_table,
 	},
 	.probe = xvip_composite_probe,
-	.remove_new = xvip_composite_remove,
+	.remove = xvip_composite_remove,
 };
 
 module_platform_driver(xvip_composite_driver);
diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
index dda70719f004..92fec7bb47da 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.c
+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
@@ -365,7 +365,7 @@ static struct platform_driver xvtc_driver = {
 		.of_match_table = xvtc_of_id_table,
 	},
 	.probe = xvtc_probe,
-	.remove_new = xvtc_remove,
+	.remove = xvtc_remove,
 };
 
 module_platform_driver(xvtc_driver);
diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index b2c5809a8bc7..9980346cb5ea 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -1513,7 +1513,7 @@ static struct platform_driver si476x_radio_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= si476x_radio_probe,
-	.remove_new	= si476x_radio_remove,
+	.remove		= si476x_radio_remove,
 };
 module_platform_driver(si476x_radio_driver);
 
diff --git a/drivers/media/radio/radio-timb.c b/drivers/media/radio/radio-timb.c
index 04daa9c358c2..a6069b106fd3 100644
--- a/drivers/media/radio/radio-timb.c
+++ b/drivers/media/radio/radio-timb.c
@@ -164,7 +164,7 @@ static struct platform_driver timbradio_platform_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= timbradio_probe,
-	.remove_new	= timbradio_remove,
+	.remove		= timbradio_remove,
 };
 
 module_platform_driver(timbradio_platform_driver);
diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index f6b98c304b72..511a8ede05ec 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -2145,7 +2145,7 @@ static int wl1273_fm_radio_probe(struct platform_device *pdev)
 
 static struct platform_driver wl1273_fm_radio_driver = {
 	.probe		= wl1273_fm_radio_probe,
-	.remove_new	= wl1273_fm_radio_remove,
+	.remove		= wl1273_fm_radio_remove,
 	.driver		= {
 		.name	= "wl1273_fm_radio",
 	},
diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index 9fdaed68a962..67b4afadc95a 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -205,7 +205,7 @@ static struct platform_driver radio_si4713_pdriver = {
 		.name	= "radio-si4713",
 	},
 	.probe		= radio_si4713_pdriver_probe,
-	.remove_new     = radio_si4713_pdriver_remove,
+	.remove         = radio_si4713_pdriver_remove,
 };
 
 module_platform_driver(radio_si4713_pdriver);
diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index b29a1a9f381d..bf6d8fa983bf 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -201,7 +201,7 @@ MODULE_DEVICE_TABLE(of, gpio_ir_recv_of_match);
 
 static struct platform_driver gpio_ir_recv_driver = {
 	.probe  = gpio_ir_recv_probe,
-	.remove_new = gpio_ir_recv_remove,
+	.remove = gpio_ir_recv_remove,
 	.driver = {
 		.name   = KBUILD_MODNAME,
 		.of_match_table = gpio_ir_recv_of_match,
diff --git a/drivers/media/rc/img-ir/img-ir-core.c b/drivers/media/rc/img-ir/img-ir-core.c
index d87d8e14c556..067f4bc7fcc3 100644
--- a/drivers/media/rc/img-ir/img-ir-core.c
+++ b/drivers/media/rc/img-ir/img-ir-core.c
@@ -181,7 +181,7 @@ static struct platform_driver img_ir_driver = {
 		.pm = &img_ir_pmops,
 	},
 	.probe = img_ir_probe,
-	.remove_new = img_ir_remove,
+	.remove = img_ir_remove,
 };
 
 module_platform_driver(img_ir_driver);
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index de5bb9a08ea4..afd80d2350c6 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -394,7 +394,7 @@ static struct platform_driver hix5hd2_ir_driver = {
 		.pm     = &hix5hd2_ir_pm_ops,
 	},
 	.probe = hix5hd2_ir_probe,
-	.remove_new = hix5hd2_ir_remove,
+	.remove = hix5hd2_ir_remove,
 };
 
 module_platform_driver(hix5hd2_ir_driver);
diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 9cdb45821ecc..272ebb0d97c8 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -628,7 +628,7 @@ MODULE_DEVICE_TABLE(of, meson_ir_match);
 
 static struct platform_driver meson_ir_driver = {
 	.probe		= meson_ir_probe,
-	.remove_new	= meson_ir_remove,
+	.remove		= meson_ir_remove,
 	.shutdown	= meson_ir_shutdown,
 	.driver = {
 		.name		= DRIVER_NAME,
diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index b2f82b2d1c8d..85c9436b0a20 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -440,7 +440,7 @@ static void mtk_ir_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_ir_driver = {
 	.probe          = mtk_ir_probe,
-	.remove_new     = mtk_ir_remove,
+	.remove         = mtk_ir_remove,
 	.driver = {
 		.name = MTK_IR_DEV,
 		.of_match_table = mtk_ir_match,
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 988b09191c4c..6539fa0a6e79 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -408,7 +408,7 @@ static struct platform_driver st_rc_driver = {
 		.pm     = &st_rc_pm_ops,
 	},
 	.probe = st_rc_probe,
-	.remove_new = st_rc_remove,
+	.remove = st_rc_remove,
 };
 
 module_platform_driver(st_rc_driver);
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index b49df8355e6b..92ef4e7c6f69 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -413,7 +413,7 @@ MODULE_DEVICE_TABLE(of, sunxi_ir_match);
 
 static struct platform_driver sunxi_ir_driver = {
 	.probe          = sunxi_ir_probe,
-	.remove_new     = sunxi_ir_remove,
+	.remove         = sunxi_ir_remove,
 	.shutdown       = sunxi_ir_shutdown,
 	.driver = {
 		.name = SUNXI_IR_DEV,
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 846e90c06291..1e6e3b7140a9 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -2207,7 +2207,7 @@ static void vicodec_remove(struct platform_device *pdev)
 
 static struct platform_driver vicodec_pdrv = {
 	.probe		= vicodec_probe,
-	.remove_new	= vicodec_remove,
+	.remove		= vicodec_remove,
 	.driver		= {
 		.name	= VICODEC_NAME,
 	},
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 613949df897d..e1dd8adeba46 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -572,7 +572,7 @@ static struct platform_driver vidtv_bridge_driver = {
 		.name = VIDTV_PDEV_NAME,
 	},
 	.probe    = vidtv_bridge_probe,
-	.remove_new = vidtv_bridge_remove,
+	.remove = vidtv_bridge_remove,
 };
 
 static void __exit vidtv_bridge_exit(void)
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 3e3b424b4860..d4e27279dd0c 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1394,7 +1394,7 @@ static void vim2m_remove(struct platform_device *pdev)
 
 static struct platform_driver vim2m_pdrv = {
 	.probe		= vim2m_probe,
-	.remove_new	= vim2m_remove,
+	.remove		= vim2m_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 2083c60e34d6..c812fa9f0650 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -410,7 +410,7 @@ static struct platform_device vimc_pdev = {
 
 static struct platform_driver vimc_pdrv = {
 	.probe		= vimc_probe,
-	.remove_new	= vimc_remove,
+	.remove		= vimc_remove,
 	.driver		= {
 		.name	= VIMC_PDEV_NAME,
 	},
diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index c46464bcaf2e..01c964ea6f76 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -523,7 +523,7 @@ static void visl_remove(struct platform_device *pdev)
 
 static struct platform_driver visl_pdrv = {
 	.probe		= visl_probe,
-	.remove_new	= visl_remove,
+	.remove		= visl_remove,
 	.driver		= {
 		.name	= VISL_NAME,
 	},
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 00e0d08af357..8d8f60e15d1d 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2239,7 +2239,7 @@ static struct platform_device vivid_pdev = {
 
 static struct platform_driver vivid_pdrv = {
 	.probe		= vivid_probe,
-	.remove_new	= vivid_remove,
+	.remove		= vivid_remove,
 	.driver		= {
 		.name	= "vivid",
 	},
diff --git a/drivers/media/tuners/it913x.c b/drivers/media/tuners/it913x.c
index 4d5b1c878028..9186174a46fd 100644
--- a/drivers/media/tuners/it913x.c
+++ b/drivers/media/tuners/it913x.c
@@ -444,7 +444,7 @@ static struct platform_driver it913x_driver = {
 		.suppress_bind_attrs	= true,
 	},
 	.probe		= it913x_probe,
-	.remove_new	= it913x_remove,
+	.remove		= it913x_remove,
 	.id_table	= it913x_id_table,
 };
 

base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
-- 
2.45.2

