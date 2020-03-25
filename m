Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB771924AA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgCYJty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CE9E208D6;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=R4LeXKJmWoxNGqE9gv1Ffj2oozVctx25bmwjWUMmnuQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sb631vI7YAWFrXqSAUCxxdq2M8RsmuFgcJPgbjLcUr0LMCXBs1WPrqnMkS9MDhaDH
         VWf0biyMIU3CquANztSyHz061Ox8eR/K+42dAn+zjde4MH1LjI3l4xbWiodllbqiVa
         IYst2lDbahV0gf7fZpbB6qflUeHFtIx3KruFls8o=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HTt-Ab; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 11/22] media: Kconfig: move comment to siano include
Date:   Wed, 25 Mar 2020 10:49:25 +0100
Message-Id: <e53e5a630adddbf734f449f528eff550ba9b022e.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
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
index 5217f5bd205e..75aa6de08d53 100644
--- a/drivers/media/mmc/Kconfig
+++ b/drivers/media/mmc/Kconfig
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-comment "MMC/SDIO adapters"
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

