Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B0C6E220D
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjDNL1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjDNL1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:27:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B436E9D
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9751764702
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74668C4339C;
        Fri, 14 Apr 2023 11:27:50 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 06/18] media: common: saa7146: replace BUG_ON by WARN_ON
Date:   Fri, 14 Apr 2023 13:27:30 +0200
Message-Id: <20230414112742.27749-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need for BUG_ON, WARN_ON is a lot friendlier.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_core.c | 11 +++++++----
 drivers/media/common/saa7146/saa7146_fops.c |  6 ++++--
 drivers/media/common/saa7146/saa7146_hlp.c  |  7 ++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index e50fa0ff7c5d..f15caf54771b 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -37,7 +37,8 @@ void saa7146_setgpio(struct saa7146_dev *dev, int port, u32 data)
 {
 	u32 value = 0;
 
-	BUG_ON(port > 3);
+	if (WARN_ON(port > 3))
+		return;
 
 	value = saa7146_read(dev, GPIO_CTRL);
 	value &= ~(0xff << (8*port));
@@ -148,7 +149,8 @@ static struct scatterlist* vmalloc_to_sg(unsigned char *virt, int nr_pages)
 		pg = vmalloc_to_page(virt);
 		if (NULL == pg)
 			goto err;
-		BUG_ON(PageHighMem(pg));
+		if (WARN_ON(PageHighMem(pg)))
+			return NULL;
 		sg_set_page(&sglist[i], pg, PAGE_SIZE, 0);
 	}
 	return sglist;
@@ -239,8 +241,9 @@ int saa7146_pgtable_build_single(struct pci_dev *pci, struct saa7146_pgtable *pt
 	int nr_pages = 0;
 	int i,p;
 
-	BUG_ON(0 == sglen);
-	BUG_ON(list->offset > PAGE_SIZE);
+	if (WARN_ON(!sglen) ||
+	    WARN_ON(list->offset > PAGE_SIZE))
+		return -EIO;
 
 	/* if we have a user buffer, the first page may not be
 	   aligned to a page boundary. */
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index faebe61a9408..2154249a26d5 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -68,7 +68,8 @@ int saa7146_buffer_queue(struct saa7146_dev *dev,
 	assert_spin_locked(&dev->slock);
 	DEB_EE("dev:%p, dmaq:%p, buf:%p\n", dev, q, buf);
 
-	BUG_ON(!q);
+	if (WARN_ON(!q))
+		return -EIO;
 
 	if (NULL == q->curr) {
 		q->curr = buf;
@@ -109,7 +110,8 @@ void saa7146_buffer_next(struct saa7146_dev *dev,
 {
 	struct saa7146_buf *buf,*next = NULL;
 
-	BUG_ON(!q);
+	if (WARN_ON(!q))
+		return;
 
 	DEB_INT("dev:%p, dmaq:%p, vbi:%d\n", dev, q, vbi);
 
diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 98c339c33afa..7569d8cdd4d8 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -542,9 +542,10 @@ static int calculate_video_dma_grab_planar(struct saa7146_dev* dev, struct saa71
 	int height = pix->height;
 	enum v4l2_field field = pix->field;
 
-	BUG_ON(0 == buf->pt[0].dma);
-	BUG_ON(0 == buf->pt[1].dma);
-	BUG_ON(0 == buf->pt[2].dma);
+	if (WARN_ON(!buf->pt[0].dma) ||
+	    WARN_ON(!buf->pt[1].dma) ||
+	    WARN_ON(!buf->pt[2].dma))
+		return -1;
 
 	DEB_CAP("[size=%dx%d,fields=%s]\n",
 		width, height, v4l2_field_names[field]);
-- 
2.39.2

