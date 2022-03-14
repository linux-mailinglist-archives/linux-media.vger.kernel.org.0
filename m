Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF894D7C4C
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 08:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiCNH5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 03:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236738AbiCNH5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 03:57:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC81F41315;
        Mon, 14 Mar 2022 00:56:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E2A761168;
        Mon, 14 Mar 2022 07:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F64C340EE;
        Mon, 14 Mar 2022 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647244560;
        bh=u0SqTDlgpFphqN5PIZ+ohOG5mS7wT/lESZxcUmR9eL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OPJ1WBwHzC81qI4ZmbnklEOnZ/Ak4Cf0J0ximIqpnmURBJ2B+ZmpAUGSfL2Vk49Bm
         35+hoWyuPgtgO6pOklraSEa46wK/jIwuTqef6ry/0Pn8rG7gDVzuENIlDYZhpdw0cm
         Siuok8yNjCjsk0fAckHBrbpJZphpO7rm6f9XKAjzIZJn+BoLv14fcum3TjjPhTUpyd
         RHZQHf1WvOqTxczFyxGt7fgmHXB8M6yPztb9LgBru8XxMhXxnvOg6L1qOVVSi8d+cK
         SbdFKP1EecjdX7qGsFG3FyLaIaVJpyrShgbu/OuzOyVIVKVXaOwvknBtGlswuNnHM9
         IbmfEji1dVpHA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTfYc-001kUR-Fp; Mon, 14 Mar 2022 08:55:58 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 04/64] media: platform: Makefile: reorganize its contents
Date:   Mon, 14 Mar 2022 08:54:56 +0100
Message-Id: <e467901c3505ecf9565608885aa37d89bc508bd1.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are lots of inconsistencies here: some directories are
included as-is, and others included using one (or more) symbols
that are inside it. Also, its entries are not sorted.

That makes it harder to maintain.

Reorganize it by placing everything on alphabetic order and
providing some hints about how patches for such file is expected.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Makefile | 132 ++++++++++++--------------------
 1 file changed, 50 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 4032816f8e8a..e319044c57e9 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -3,94 +3,62 @@
 # Makefile for the video capture/playback device drivers.
 #
 
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT)		+= allegro-dvt/
+# Place here, alphabetically sorted by directory
+# (e. g. LC_ALL=C sort Makefile)
+obj-y += allegro-dvt/
+obj-y += am437x/
+obj-y += amphion/
+obj-y += atmel/
+obj-y += cadence/
+obj-y += coda/
+obj-y += davinci/
+obj-y += exynos-gsc/
+obj-y += exynos4-is/
+obj-y += imx/
+obj-y += imx-jpeg/
+obj-y += marvell-ccic/
+obj-y += meson/ge2d/
+obj-y += mtk-jpeg/
+obj-y += mtk-mdp/
+obj-y += mtk-vcodec/
+obj-y += mtk-vpu/
+obj-y += omap/
+obj-y += omap3isp/
+obj-y += qcom/camss/
+obj-y += qcom/venus/
+obj-y += rcar-vin/
+obj-y += rockchip/rga/
+obj-y += rockchip/rkisp1/
+obj-y += s3c-camif/
+obj-y += s5p-g2d/
+obj-y += s5p-jpeg/
+obj-y += s5p-mfc/
+obj-y += sti/bdisp/
+obj-y += sti/c8sectpfe/
+obj-y += sti/delta/
+obj-y += sti/hva/
+obj-y += stm32/
+obj-y += sunxi/
+obj-y += tegra/vde/
+obj-y += ti-vpe/
+obj-y += vsp1/
+obj-y += xilinx/
+
+# Please place here only ancillary drivers that aren't SoC-specific
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
-obj-$(CONFIG_VIDEO_CADENCE)		+= cadence/
-obj-$(CONFIG_VIDEO_VIA_CAMERA) += via-camera.o
-obj-$(CONFIG_VIDEO_CAFE_CCIC) += marvell-ccic/
-obj-$(CONFIG_VIDEO_MMP_CAMERA) += marvell-ccic/
-
-obj-$(CONFIG_VIDEO_OMAP3)	+= omap3isp/
-obj-$(CONFIG_VIDEO_PXA27x)	+= pxa_camera.o
-
-obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
-
-obj-y	+= ti-vpe/
-
-obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
-obj-$(CONFIG_VIDEO_CODA)		+= coda/
-
-obj-$(CONFIG_VIDEO_IMX)			+= imx/
 obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
-obj-$(CONFIG_VIDEO_IMX8_JPEG)		+= imx-jpeg/
-
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
-
 obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
-
-obj-$(CONFIG_VIDEO_S3C_CAMIF)		+= s3c-camif/
-obj-$(CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS)	+= exynos4-is/
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_JPEG)	+= s5p-jpeg/
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_MFC)	+= s5p-mfc/
-
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_G2D)	+= s5p-g2d/
-obj-$(CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC)	+= exynos-gsc/
-
-obj-$(CONFIG_VIDEO_STI_BDISP)		+= sti/bdisp/
-obj-$(CONFIG_VIDEO_STI_HVA)		+= sti/hva/
-obj-$(CONFIG_DVB_C8SECTPFE)		+= sti/c8sectpfe/
-
-obj-$(CONFIG_VIDEO_STI_DELTA)		+= sti/delta/
-
-obj-y					+= stm32/
-
-obj-y					+= davinci/
-
-obj-$(CONFIG_VIDEO_SH_VOU)		+= sh_vou.o
-
+obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
+obj-$(CONFIG_VIDEO_PXA27x)		+= pxa_camera.o
 obj-$(CONFIG_VIDEO_RCAR_DRIF)		+= rcar_drif.o
+obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
 obj-$(CONFIG_VIDEO_RENESAS_CEU)		+= renesas-ceu.o
 obj-$(CONFIG_VIDEO_RENESAS_FCP)		+= rcar-fcp.o
 obj-$(CONFIG_VIDEO_RENESAS_FDP1)	+= rcar_fdp1.o
 obj-$(CONFIG_VIDEO_RENESAS_JPU)		+= rcar_jpu.o
-obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1/
-
-obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rockchip/rkisp1/
-obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
-
-obj-y	+= omap/
-
-obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
-
-obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
-
-obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
-obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
-
-obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
-obj-$(CONFIG_VIDEO_ATMEL_ISI)		+= atmel/
-obj-$(CONFIG_VIDEO_ATMEL_XISC)		+= atmel/
-obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC)	+= atmel/
-
-obj-$(CONFIG_VIDEO_STM32_DCMI)		+= stm32/
-obj-$(CONFIG_VIDEO_STM32_DMA2D)		+= stm32/
-
-obj-$(CONFIG_VIDEO_MEDIATEK_VPU)	+= mtk-vpu/
-
-obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)	+= mtk-vcodec/
-
-obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
-
-obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
-
-obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
-
-obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
-
-obj-y					+= sunxi/
-
-obj-$(CONFIG_VIDEO_MESON_GE2D)		+= meson/ge2d/
-
-obj-$(CONFIG_VIDEO_TEGRA_VDE)		+= tegra/vde/
-
-obj-$(CONFIG_VIDEO_AMPHION_VPU)		+= amphion/
+obj-$(CONFIG_VIDEO_SH_VOU)		+= sh_vou.o
+obj-$(CONFIG_VIDEO_VIA_CAMERA)		+= via-camera.o
+obj-$(CONFIG_VIDEO_VIU)			+= fsl-viu.o
-- 
2.35.1

