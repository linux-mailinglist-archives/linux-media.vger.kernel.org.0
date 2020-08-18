Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCB824862E
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHRNf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:35:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:45314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgHRNfv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:35:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B2A6206B5;
        Tue, 18 Aug 2020 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597757750;
        bh=Zn57+X2Pp8OOL5pGLsjIsd2D2F+3QH7pq/MPYL4MiwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IZVM6NneDt5YBevtNAVmNFPIV+cxCCVRj7ZI9gSABnhI1k/3Kqd3HRWVxwGVwtc1v
         uRD6i5yfWx+gM++Hc2A9gWe04KRlVntql6B/5OeZmMAlwYiVeBgoBA+wnQozo5hOn5
         j0yHZux+zDlc+a3QlQIwQj0g9GjOK+Ffrdd+G9lE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] media: coda: no need to check return value of debugfs_create functions
Date:   Tue, 18 Aug 2020 15:36:03 +0200
Message-Id: <20200818133608.462514-2-gregkh@linuxfoundation.org>
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

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/platform/coda/coda-common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 3ab3d976d8ca..9020be29d8f2 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1937,9 +1937,6 @@ int coda_alloc_aux_buf(struct coda_dev *dev, struct coda_aux_buf *buf,
 		buf->blob.size = size;
 		buf->dentry = debugfs_create_blob(name, 0644, parent,
 						  &buf->blob);
-		if (!buf->dentry)
-			dev_warn(dev->dev,
-				 "failed to create debugfs entry %s\n", name);
 	}
 
 	return 0;
@@ -3211,8 +3208,6 @@ static int coda_probe(struct platform_device *pdev)
 	ida_init(&dev->ida);
 
 	dev->debugfs_root = debugfs_create_dir("coda", NULL);
-	if (!dev->debugfs_root)
-		dev_warn(&pdev->dev, "failed to create debugfs root\n");
 
 	/* allocate auxiliary per-device buffers for the BIT processor */
 	if (dev->devtype->product == CODA_DX6) {
-- 
2.28.0

