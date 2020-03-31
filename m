Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892E31994F3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgCaLMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730583AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B45221473;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=9BoXpJzxTlz3bBctiuIoVSUSm+GdyifDMveu9ihvYoU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZPtRFiWGwIgQzNHYQkmYMwm2MO2nfitKRk4vN3PpyYvQ4LDzvi03yIyCkq4fJD8cH
         gC/J87IHjG5V5W9p1Jh9OAchl9rvsAB5lrEts/b8z7U1LbyrcXwEj1fmIRxCAA/EiE
         +XTPQ4FFmisGfxQHWAofpIJHsCFM90uOQ4IuvHXE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqq-EC; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 13/33] media: Kconfig: mark other drivers as test drivers
Date:   Tue, 31 Mar 2020 13:11:49 +0200
Message-Id: <d6b120fe4d77028b5594c0e7914c29669b7741a5.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neither the PCI skeleton nor the DVB dummy driver are real
drivers. They're there just as an example for a driver
writter.

Distros should not enable those drivers. So, hide them if
MEDIA_TEST_SUPPORT is not selected.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/Kconfig | 4 ++++
 drivers/media/pci/Kconfig           | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index a29e9ddf9c82..932fd88fdc12 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -944,8 +944,12 @@ config DVB_SP2
 	  CIMaX SP2/SP2HF Common Interface module.
 
 comment "Tools to develop new frontends"
+	depends on MEDIA_TEST_SUPPORT
 
 config DVB_DUMMY_FE
 	tristate "Dummy frontend driver"
 	depends on DVB_CORE
+	depends on MEDIA_TEST_SUPPORT
+	help
+	  Dummy skeleton frontend driver.
 endmenu
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 9336f8446cf0..e576283ebbf5 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -58,6 +58,7 @@ source "drivers/media/pci/intel/ipu3/Kconfig"
 
 config VIDEO_PCI_SKELETON
 	tristate "Skeleton PCI V4L2 driver"
+	depends on MEDIA_TEST_SUPPORT
 	depends on PCI
 	depends on SAMPLES
 	depends on VIDEO_V4L2 && VIDEOBUF2_CORE
-- 
2.25.1

