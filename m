Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E061D595DAD
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 15:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbiHPNtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 09:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbiHPNti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 09:49:38 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D0C6097513
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 06:49:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4649D1063;
        Tue, 16 Aug 2022 06:49:11 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CDBC3F66F;
        Tue, 16 Aug 2022 06:49:09 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        stanimir.varbanov@linaro.org
Cc:     linux-media@vger.kernel.org, iommu@lists.linux.dev
Subject: [PATCH] media: qcom: Clean up Kconfig dependencies
Date:   Tue, 16 Aug 2022 14:49:05 +0100
Message-Id: <edbd6c95873c51853c4f645ee1ed81a3522a5864.1660657745.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Depending on IOMMU_DMA is suspicious, since the low-level DMA ops
internals and MSI helpers is provides are not of interest to general
drivers. In practice it mostly seems to be serving as a dependency on
ARM64 here, so do that properly. The venus driver looks like it won't
actually be useful at runtime without the IOMMU API, so add that too.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/media/platform/qcom/camss/Kconfig | 2 +-
 drivers/media/platform/qcom/venus/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf..575f42377c12 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -2,7 +2,7 @@ config VIDEO_QCOM_CAMSS
 	tristate "Qualcomm V4L2 Camera Subsystem driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
-	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on (ARCH_QCOM && ARM64) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index bfd50e8f3421..f04b45720bca 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -2,7 +2,7 @@ config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && QCOM_SMEM
-	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on (ARCH_QCOM && ARM64 && IOMMU_API) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.36.1.dirty

