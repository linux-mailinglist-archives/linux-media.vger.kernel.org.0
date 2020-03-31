Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6232719950E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbgCaLMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730437AbgCaLMN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:13 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 441E720B1F;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=CDNkKT+WGBE8A+SIyPmXUKUa9zl4UOXgsgFGt7DDGMM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Oe9B9Xa9yEMdBbOiR6v+pVaW6llgxzeMT0SKblwLs1bVgEMoSo0u2smM+w3aJ8E3N
         J7kzvePf6TRYIKVtG8kBrvmnwwni5w9usul54XhG5IgQ4/JHfV7Q2vyFYU01xj4907
         9kHBIhhDr5+QkzH9a8I5ZYWWpbzW33roXTsme+TU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqM-7b; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 07/33] media: Kconfig: move comment to siano include
Date:   Tue, 31 Mar 2020 13:11:43 +0200
Message-Id: <2bff806eab10fcf9fc6f6c865341d92f305f5d92.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Showing this comment without showing the Siano mmc option
is very weird! Place the option together, and make it
visible only when showing Siano configuration.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/mmc/Kconfig       | 1 -
 drivers/media/mmc/siano/Kconfig | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mmc/Kconfig b/drivers/media/mmc/Kconfig
index de0528c6994a..75aa6de08d53 100644
--- a/drivers/media/mmc/Kconfig
+++ b/drivers/media/mmc/Kconfig
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-comment "Supported MMC/SDIO adapters"
 source "drivers/media/mmc/siano/Kconfig"
diff --git a/drivers/media/mmc/siano/Kconfig b/drivers/media/mmc/siano/Kconfig
index 1919f6fea8b1..570696019a9e 100644
--- a/drivers/media/mmc/siano/Kconfig
+++ b/drivers/media/mmc/siano/Kconfig
@@ -2,6 +2,8 @@
 #
 # Siano Mobile Silicon Digital TV device configuration
 #
+comment "MMC/SDIO DVB adapters"
+	depends on DVB_CORE && HAS_DMA && MMC
 
 config SMS_SDIO_DRV
 	tristate "Siano SMS1xxx based MDTV via SDIO interface"
-- 
2.25.1

