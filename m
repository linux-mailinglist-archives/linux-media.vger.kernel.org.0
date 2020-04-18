Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB641AEB76
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDRJoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgDRJod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9F61221F4;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=j8s6iCr+zOvvk6S+D4/YTsYl3OdiXirU9bXGlKFhDGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2eSmAWmS9fcdDviY6lpO2fuhuB/96gfdB4pZGLnWG4sHtjtIM9WqLXpHbhMRoVWvx
         NmsIGcGBvOOIASDyITuFBhSjFOTPCQwNFkTRv8s8aTFC9dA5tYkYQcZwRX/DDg+kaj
         F6GEOoEOkXp8NZ+e8Z22spGYKgMsN+sibpOOn5mI=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081OA-8f; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 5/9] media: admin-guide: add a list of platform drivers
Date:   Sat, 18 Apr 2020 11:44:25 +0200
Message-Id: <bf4b516a27cd6ae86ee5adc335c66ae10d265e53.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no reason why to keep platform drivers out of the
card list. Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 86 ++++++++++++++++++--
 1 file changed, 81 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 62375bde4755..f29d103c68d7 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -14,10 +14,8 @@ OpenFirmware or ACPI.
 The PCI and USB drivers, however, are independent of the system's board,
 and may be added/removed by the user.
 
-This section contains a list of supported PCI and USB boards.
-
-Please notice that this list is not exhaustive. You may also take a
-look at https://linuxtv.org/wiki/index.php/Hardware_Device_Information
+You may also take a look at
+https://linuxtv.org/wiki/index.php/Hardware_Device_Information
 for more details about supported cards.
 
 USB drivers
@@ -57,7 +55,6 @@ listed below\ [#]_.
    for cameras not supported by the USB Video Class (UVC) driver,
    as shown at :doc:`gspca card list <gspca-cardlist>`.
 
-
 ======================  =========================================================
 Driver                  Name
 ======================  =========================================================
@@ -253,6 +250,85 @@ lists below:
 	saa7134-cardlist
 	saa7164-cardlist
 
+Platform drivers
+================
+
+There are several drivers that are focused on providing support for
+functionality that are already included at the main board, and don't
+use neither USB nor PCI bus. Those drivers are called platform
+drivers, and are very popular on embedded devices.
+
+The current supported of platform drivers (not including staging drivers) are
+listed below
+
+=================  ============================================================
+Driver             Name
+=================  ============================================================
+am437x-vpfe        TI AM437x VPFE
+aspeed-video       Aspeed AST2400 and AST2500
+atmel-isc          ATMEL Image Sensor Controller (ISC)
+atmel-isi          ATMEL Image Sensor Interface (ISI)
+c8sectpfe          SDR platform devices
+c8sectpfe          SDR platform devices
+cafe_ccic          Marvell 88ALP01 (Cafe) CMOS Camera Controller
+cdns-csi2rx        Cadence MIPI-CSI2 RX Controller
+cdns-csi2tx        Cadence MIPI-CSI2 TX Controller
+coda-vpu           Chips&Media Coda multi-standard codec IP
+dm355_ccdc         TI DM355 CCDC video capture
+dm644x_ccdc        TI DM6446 CCDC video capture
+exynos-fimc-is     EXYNOS4x12 FIMC-IS (Imaging Subsystem)
+exynos-fimc-lite   EXYNOS FIMC-LITE camera interface
+exynos-gsc         Samsung Exynos G-Scaler
+exy                Samsung S5P/EXYNOS4 SoC series Camera Subsystem
+fsl-viu            Freescale VIU
+imx-pxp            i.MX Pixel Pipeline (PXP)
+isdf               TI DM365 ISIF video capture
+mmp_camera         Marvell Armada 610 integrated camera controller
+mtk_jpeg           Mediatek JPEG Codec
+mtk-mdp            Mediatek MDP
+mtk-vcodec-dec     Mediatek Video Codec
+mtk-vpu            Mediatek Video Processor Unit
+mx2_emmaprp        MX2 eMMa-PrP
+omap3-isp          OMAP 3 Camera
+omap-vout          OMAP2/OMAP3 V4L2-Display
+pxa_camera         PXA27x Quick Capture Interface
+qcom-camss         Qualcomm V4L2 Camera Subsystem
+rcar-csi2          R-Car MIPI CSI-2 Receiver
+rcar_drif          Renesas Digital Radio Interface (DRIF)
+rcar-fcp           Renesas Frame Compression Processor
+rcar_fdp1          Renesas Fine Display Processor
+rcar_jpu           Renesas JPEG Processing Unit
+rcar-vin           R-Car Video Input (VIN)
+renesas-ceu        Renesas Capture Engine Unit (CEU)
+rockchip-rga       Rockchip Raster 2d Graphic Acceleration Unit
+s3c-camif          Samsung S3C24XX/S3C64XX SoC Camera Interface
+s5p-csis           S5P/EXYNOS MIPI-CSI2 receiver (MIPI-CSIS)
+s5p-fimc           S5P/EXYNOS4 FIMC/CAMIF camera interface
+s5p-g2d            Samsung S5P and EXYNOS4 G2D 2d graphics accelerator
+s5p-jpeg           Samsung S5P/Exynos3250/Exynos4 JPEG codec
+s5p-mfc            Samsung S5P MFC Video Codec
+sh_veu             SuperH VEU mem2mem video processing
+sh_vou             SuperH VOU video output
+stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
+sun6i-csi          Allwinner V3s Camera Sensor Interface
+sun8i-di           Allwinner Deinterlace
+sun8i-rotate       Allwinner DE2 rotation
+ti-cal             TI Memory-to-memory multimedia devices
+ti-csc             TI DVB platform devices
+ti-vpe             TI VPE (Video Processing Engine)
+venus-enc          Qualcomm Venus V4L2 encoder/decoder
+via-camera         VIAFB camera controller
+video-mux          Video Multiplexer
+vpif_display       TI DaVinci VPIF V4L2-Display
+vpif_capture       TI DaVinci VPIF video capture
+vpss               TI DaVinci VPBE V4L2-Display
+vsp1               Renesas VSP1 Video Processing Engine
+xilinx-tpg         Xilinx Video Test Pattern Generator
+xilinx-video       Xilinx Video IP (EXPERIMENTAL)
+xilinx-vtc         Xilinx Video Timing Controller
+=================  ============================================================
+
 I²C drivers
 ===========
 
-- 
2.25.2

