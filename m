Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966EC4D895E
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243161AbiCNQg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241579AbiCNQgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A7D13CDA;
        Mon, 14 Mar 2022 09:35:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5307B61408;
        Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B332C36AF8;
        Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275707;
        bh=LHNcmeSc3A8U/jLJYft1p8OBLZ8iq+GHKbgMSlSokLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aVJDt1z/7IAtsmP3VVOLEBI9AvsLUgoqCaAbsDuPV+4gJbHPrDZjsnDnmEqhdhVv0
         7xB4J+2sMxwQMlCH53ouX2t/PO+82NKs2/sqZJPRxIPCIt4ivjuhvv0SCVBJAvSoOj
         Zzd86oZtD/6WTjDooUhKrKG4ouJW06BYaTVHz85fJsd9vpO1waaWpnJE8xzwvNaxeo
         VwUC2V1mDxaiOavM4QP0tJ7TH0FpKaoe3kVnAOkWYYbfOgvQUDN3OjD1+JHVeDTM8s
         jHy6OgYzIacrVFv18uECO+4c1Sf/PI0pRQoeLi936TX6BzlqfbUoOXjK+VwYuxl6u/
         WUfvUfrPMfgXA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTney-001wwx-VW; Mon, 14 Mar 2022 17:35:04 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ming Qian <ming.qian@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 13/67] media: platform: coda: move config to its own file
Date:   Mon, 14 Mar 2022 17:34:08 +0100
Message-Id: <d205d312b1bb86956776cd77fc4e7d6fa626f371.1647274406.git.mchehab@kernel.org>
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
coda-specific config stuff on a separate Kconfig file.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig      | 18 +-----------------
 drivers/media/platform/coda/Kconfig | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/platform/coda/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 060d6264dea4..0bf9dd5da845 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -43,6 +43,7 @@ source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 
+source "drivers/media/platform/coda/Kconfig"
 source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
@@ -178,23 +179,6 @@ config VIDEO_TI_CAL_MC
 
 # Mem2mem drivers
 
-config VIDEO_CODA
-	tristate "Chips&Media Coda multi-standard codec IP"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2 && OF && (ARCH_MXC || COMPILE_TEST)
-	select SRAM
-	select VIDEOBUF2_DMA_CONTIG
-	select VIDEOBUF2_VMALLOC
-	select V4L2_JPEG_HELPER
-	select V4L2_MEM2MEM_DEV
-	select GENERIC_ALLOCATOR
-	help
-	   Coda is a range of video codec IPs that supports
-	   H.264, MPEG-4, and other video formats.
-
-config VIDEO_IMX_VDOA
-	def_tristate VIDEO_CODA if SOC_IMX6Q || COMPILE_TEST
-
 config VIDEO_MEDIATEK_JPEG
 	tristate "Mediatek JPEG Codec driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/coda/Kconfig b/drivers/media/platform/coda/Kconfig
new file mode 100644
index 000000000000..ae495fd7b25a
--- /dev/null
+++ b/drivers/media/platform/coda/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_CODA
+	tristate "Chips&Media Coda multi-standard codec IP"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2 && OF && (ARCH_MXC || COMPILE_TEST)
+	select SRAM
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_JPEG_HELPER
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	   Coda is a range of video codec IPs that supports
+	   H.264, MPEG-4, and other video formats.
+
+config VIDEO_IMX_VDOA
+	def_tristate VIDEO_CODA if SOC_IMX6Q || COMPILE_TEST
-- 
2.35.1

