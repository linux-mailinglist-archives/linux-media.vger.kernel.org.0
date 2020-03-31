Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDD11994E2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730577AbgCaLMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730541AbgCaLMN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:13 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4456D20B80;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=b7F4ManG231nLhGoUOlm5eaq1cStjMJuBexokf885pU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bmbf+yYbl343naSXLoDFZcwrCzcTAJFtFPxHNnHtkB3qG0h1UwyScNesGJVr/HstG
         wtAUEdVXkRhTi8bvVQBT20A6LrhAVVUY1Aj46XfHwTB3H6knsUmzvibdQ9+/2cJl5Y
         pfCeJLNhDbH3n2OtWjMJKThd9tGmlLqdJpIbm1w0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bq4-3R; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 04/33] media: pci: move VIDEO_PCI_SKELETON to a different Kconfig
Date:   Tue, 31 Mar 2020 13:11:40 +0200
Message-Id: <e5b9c09273223b7a9c4b9b94fc4919b216c8e15b.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 PCI skeleton is not part of the V4L2 core. Move it
to appear together with the other PCI drivers, at the end,
as this is something that normal users don't even need to
bother.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/Kconfig       | 10 ++++++++++
 drivers/media/v4l2-core/Kconfig | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index dcb3719f440e..9336f8446cf0 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -56,5 +56,15 @@ endif
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
 
+config VIDEO_PCI_SKELETON
+	tristate "Skeleton PCI V4L2 driver"
+	depends on PCI
+	depends on SAMPLES
+	depends on VIDEO_V4L2 && VIDEOBUF2_CORE
+	depends on VIDEOBUF2_MEMOPS && VIDEOBUF2_DMA_CONTIG
+	help
+	  Enable build of the skeleton PCI driver, used as a reference
+	  when developing new drivers.
+
 endif #MEDIA_PCI_SUPPORT
 endif #PCI
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 39e3fb30ba0b..26276b257eae 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -31,16 +31,6 @@ config VIDEO_FIXED_MINOR_RANGES
 
 	  When in doubt, say N.
 
-config VIDEO_PCI_SKELETON
-	tristate "Skeleton PCI V4L2 driver"
-	depends on PCI
-	depends on SAMPLES
-	depends on VIDEO_V4L2 && VIDEOBUF2_CORE
-	depends on VIDEOBUF2_MEMOPS && VIDEOBUF2_DMA_CONTIG
-	help
-	  Enable build of the skeleton PCI driver, used as a reference
-	  when developing new drivers.
-
 # Used by drivers that need tuner.ko
 config VIDEO_TUNER
 	tristate
-- 
2.25.1

