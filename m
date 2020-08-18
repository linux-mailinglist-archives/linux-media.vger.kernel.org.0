Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA2024862F
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgHRNgl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:36:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:45532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgHRNgE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:36:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67B5A207DA;
        Tue, 18 Aug 2020 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597757763;
        bh=gL4zAM22UgQE+PipA9UIen3zyMO6OfT4nN9ybOsWnjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FamVaIy9upQcdF+LYSUsfuazAEw2bWBPtJ7jkuSW4Em4QThy3k52gWNCJWmN2G7IT
         TxNOET3ijSpkGAYD/iuKrheSz39SIiQtscfXkYak8I6c0zK1wMCXuhx/J2mT7vM20I
         UthKqD3y+hz4cACLNAqc13/2BIlQnlnuGxOnrJ2g=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] media: sti: no need to check return value of debugfs_create functions
Date:   Tue, 18 Aug 2020 15:36:06 +0200
Message-Id: <20200818133608.462514-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818133608.462514-1-gregkh@linuxfoundation.org>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../media/platform/sti/bdisp/bdisp-debug.c    | 29 ++++---------------
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c |  7 +----
 drivers/media/platform/sti/bdisp/bdisp.h      |  2 +-
 drivers/media/platform/sti/hva/hva-debugfs.c  | 22 +++-----------
 4 files changed, 12 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-debug.c b/drivers/media/platform/sti/bdisp/bdisp-debug.c
index 77ca7517fa3e..2b270093009c 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-debug.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-debug.c
@@ -637,35 +637,18 @@ DEFINE_SHOW_ATTRIBUTE(last_nodes_raw);
 DEFINE_SHOW_ATTRIBUTE(last_request);
 DEFINE_SHOW_ATTRIBUTE(perf);
 
-int bdisp_debugfs_create(struct bdisp_dev *bdisp)
+void bdisp_debugfs_create(struct bdisp_dev *bdisp)
 {
 	char dirname[16];
 
 	snprintf(dirname, sizeof(dirname), "%s%d", BDISP_NAME, bdisp->id);
 	bdisp->dbg.debugfs_entry = debugfs_create_dir(dirname, NULL);
-	if (!bdisp->dbg.debugfs_entry)
-		goto err;
 
-	if (!bdisp_dbg_create_entry(regs))
-		goto err;
-
-	if (!bdisp_dbg_create_entry(last_nodes))
-		goto err;
-
-	if (!bdisp_dbg_create_entry(last_nodes_raw))
-		goto err;
-
-	if (!bdisp_dbg_create_entry(last_request))
-		goto err;
-
-	if (!bdisp_dbg_create_entry(perf))
-		goto err;
-
-	return 0;
-
-err:
-	bdisp_debugfs_remove(bdisp);
-	return -ENOMEM;
+	bdisp_dbg_create_entry(regs);
+	bdisp_dbg_create_entry(last_nodes);
+	bdisp_dbg_create_entry(last_nodes_raw);
+	bdisp_dbg_create_entry(last_request);
+	bdisp_dbg_create_entry(perf);
 }
 
 void bdisp_debugfs_remove(struct bdisp_dev *bdisp)
diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index af2d5eb782ce..7d50d6cd073d 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1360,11 +1360,7 @@ static int bdisp_probe(struct platform_device *pdev)
 	}
 
 	/* Debug */
-	ret = bdisp_debugfs_create(bdisp);
-	if (ret) {
-		dev_err(dev, "failed to create debugfs\n");
-		goto err_v4l2;
-	}
+	bdisp_debugfs_create(bdisp);
 
 	/* Power management */
 	pm_runtime_enable(dev);
@@ -1401,7 +1397,6 @@ static int bdisp_probe(struct platform_device *pdev)
 	pm_runtime_put(dev);
 err_dbg:
 	bdisp_debugfs_remove(bdisp);
-err_v4l2:
 	v4l2_device_unregister(&bdisp->v4l2_dev);
 err_clk:
 	if (!IS_ERR(bdisp->clock))
diff --git a/drivers/media/platform/sti/bdisp/bdisp.h b/drivers/media/platform/sti/bdisp/bdisp.h
index e309cde379ca..3fb009d24791 100644
--- a/drivers/media/platform/sti/bdisp/bdisp.h
+++ b/drivers/media/platform/sti/bdisp/bdisp.h
@@ -209,6 +209,6 @@ int bdisp_hw_get_and_clear_irq(struct bdisp_dev *bdisp);
 int bdisp_hw_update(struct bdisp_ctx *ctx);
 
 void bdisp_debugfs_remove(struct bdisp_dev *bdisp);
-int bdisp_debugfs_create(struct bdisp_dev *bdisp);
+void bdisp_debugfs_create(struct bdisp_dev *bdisp);
 void bdisp_dbg_perf_begin(struct bdisp_dev *bdisp);
 void bdisp_dbg_perf_end(struct bdisp_dev *bdisp);
diff --git a/drivers/media/platform/sti/hva/hva-debugfs.c b/drivers/media/platform/sti/hva/hva-debugfs.c
index 7d12a5b5d914..a86a07b6fbc7 100644
--- a/drivers/media/platform/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/sti/hva/hva-debugfs.c
@@ -337,25 +337,11 @@ DEFINE_SHOW_ATTRIBUTE(regs);
 void hva_debugfs_create(struct hva_dev *hva)
 {
 	hva->dbg.debugfs_entry = debugfs_create_dir(HVA_NAME, NULL);
-	if (!hva->dbg.debugfs_entry)
-		goto err;
 
-	if (!hva_dbg_create_entry(device))
-		goto err;
-
-	if (!hva_dbg_create_entry(encoders))
-		goto err;
-
-	if (!hva_dbg_create_entry(last))
-		goto err;
-
-	if (!hva_dbg_create_entry(regs))
-		goto err;
-
-	return;
-
-err:
-	hva_debugfs_remove(hva);
+	hva_dbg_create_entry(device);
+	hva_dbg_create_entry(encoders);
+	hva_dbg_create_entry(last);
+	hva_dbg_create_entry(regs);
 }
 
 void hva_debugfs_remove(struct hva_dev *hva)
-- 
2.28.0

