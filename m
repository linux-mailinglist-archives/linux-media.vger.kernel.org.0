Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C558E4D895C
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243234AbiCNQgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242565AbiCNQgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602F513D1D;
        Mon, 14 Mar 2022 09:35:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5615861407;
        Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C1BC36B07;
        Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275707;
        bh=l19tbzsY/YOED6q+PCSIvlcX5s2C1xmnk/4eeFjhClw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U4Fm56V7X35xOT5PR/RkPcliQPtUvsExEziAPmecN56BljA1VS/35Ey/IRowq8lvp
         0vUh4U9w67pYNJWDnO0gqMxCN6dq9vZytJo/bQD4P3nmCuHZsu9N+7mPGAR3YwTc+o
         sRc2xa78yt6tgf+CY/2GoIACNNlKdBoAb0VUF2xOTEEiPxZ4yFXi63fgj6fEHqtdEZ
         JG7p3pEyAeTrJvukCML8OBRz4iF+QsIiXDgAfxI4YkvGbhKJhpe7Pjz1n6PSaisAt9
         yzblFoNtxONDnBeYG7FNzP/dyfZdADJ4x3MS5hNrCZtdhdKaNRkhb7Ktc/giLFbE28
         xndiCmc8x1Cgg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTnez-001wxL-6w; Mon, 14 Mar 2022 17:35:05 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ming Qian <ming.qian@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 19/67] media: platform: mtk-vpu: move config to its own file
Date:   Mon, 14 Mar 2022 17:34:14 +0100
Message-Id: <b54a0115b2bea367335601478fc90e0d4a3347fa.1647274406.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to better organize the platform/Kconfig, place
mtk-vpu-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig         | 15 +--------------
 drivers/media/platform/mtk-vpu/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vpu/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ab7c85613625..39bf4c57e044 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -51,6 +51,7 @@ source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
+source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -184,20 +185,6 @@ config VIDEO_TI_CAL_MC
 
 # Mem2mem drivers
 
-config VIDEO_MEDIATEK_VPU
-	tristate "Mediatek Video Processor Unit"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	help
-	    This driver provides downloading VPU firmware and
-	    communicating with VPU. This driver for hw video
-	    codec embedded in Mediatek's MT8173 SOCs. It is able
-	    to handle video decoding/encoding in a range of formats.
-
-	    To compile this driver as a module, choose M here: the
-	    module will be called mtk-vpu.
-
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/mtk-vpu/Kconfig b/drivers/media/platform/mtk-vpu/Kconfig
new file mode 100644
index 000000000000..df679ea79ed0
--- /dev/null
+++ b/drivers/media/platform/mtk-vpu/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_MEDIATEK_VPU
+	tristate "Mediatek Video Processor Unit"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	    This driver provides downloading VPU firmware and
+	    communicating with VPU. This driver for hw video
+	    codec embedded in Mediatek's MT8173 SOCs. It is able
+	    to handle video decoding/encoding in a range of formats.
+
+	    To compile this driver as a module, choose M here: the
+	    module will be called mtk-vpu.
-- 
2.35.1

