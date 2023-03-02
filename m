Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3D36A8321
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjCBNDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjCBNDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919B5136DA
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F6E0B81205
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71079C433D2;
        Thu,  2 Mar 2023 13:03:38 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/17] media: common: saa7146: use for_each_sg_dma_page
Date:   Thu,  2 Mar 2023 14:03:19 +0100
Message-Id: <20230302130330.1125172-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building the pgtables, use for_each_sg_dma_page.

Also clean up the code a bit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_core.c  | 29 ++------
 drivers/media/common/saa7146/saa7146_video.c | 76 +++++++-------------
 2 files changed, 32 insertions(+), 73 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index f15caf54771b..bcb957883044 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -235,11 +235,12 @@ int saa7146_pgtable_alloc(struct pci_dev *pci, struct saa7146_pgtable *pt)
 }
 
 int saa7146_pgtable_build_single(struct pci_dev *pci, struct saa7146_pgtable *pt,
-	struct scatterlist *list, int sglen  )
+				 struct scatterlist *list, int sglen)
 {
+	struct sg_dma_page_iter dma_iter;
 	__le32 *ptr, fill;
 	int nr_pages = 0;
-	int i,p;
+	int i;
 
 	if (WARN_ON(!sglen) ||
 	    WARN_ON(list->offset > PAGE_SIZE))
@@ -250,32 +251,16 @@ int saa7146_pgtable_build_single(struct pci_dev *pci, struct saa7146_pgtable *pt
 	pt->offset = list->offset;
 
 	ptr = pt->cpu;
-	for (i = 0; i < sglen; i++, list++) {
-/*
-		pr_debug("i:%d, adr:0x%08x, len:%d, offset:%d\n",
-			 i, sg_dma_address(list), sg_dma_len(list),
-			 list->offset);
-*/
-		for (p = 0; p * 4096 < sg_dma_len(list); p++, ptr++) {
-			*ptr = cpu_to_le32(sg_dma_address(list) + p * 4096);
-			nr_pages++;
-		}
+	for_each_sg_dma_page(list, &dma_iter, sglen, 0) {
+		*ptr++ = cpu_to_le32(sg_page_iter_dma_address(&dma_iter));
+		nr_pages++;
 	}
 
 
 	/* safety; fill the page table up with the last valid page */
 	fill = *(ptr-1);
-	for(i=nr_pages;i<1024;i++) {
+	for (i = nr_pages; i < 1024; i++)
 		*ptr++ = fill;
-	}
-
-/*
-	ptr = pt->cpu;
-	pr_debug("offset: %d\n", pt->offset);
-	for(i=0;i<5;i++) {
-		pr_debug("ptr1 %d: 0x%08x\n", i, ptr[i]);
-	}
-*/
 	return 0;
 }
 
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index bc4e8d12873b..6af30fece176 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -107,31 +107,32 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 		struct saa7146_pgtable *pt1 = &buf->pt[0];
 		struct saa7146_pgtable *pt2 = &buf->pt[1];
 		struct saa7146_pgtable *pt3 = &buf->pt[2];
+		struct sg_dma_page_iter dma_iter;
 		__le32  *ptr1, *ptr2, *ptr3;
 		__le32 fill;
 
 		int size = pix->width * pix->height;
-		int i,p,m1,m2,m3,o1,o2;
+		int i, m1, m2, m3, o1, o2;
 
 		switch( sfmt->depth ) {
 			case 12: {
 				/* create some offsets inside the page table */
-				m1 = ((size+PAGE_SIZE)/PAGE_SIZE)-1;
-				m2 = ((size+(size/4)+PAGE_SIZE)/PAGE_SIZE)-1;
-				m3 = ((size+(size/2)+PAGE_SIZE)/PAGE_SIZE)-1;
-				o1 = size%PAGE_SIZE;
-				o2 = (size+(size/4))%PAGE_SIZE;
+				m1 = ((size + PAGE_SIZE) / PAGE_SIZE) - 1;
+				m2 = ((size + (size / 4) + PAGE_SIZE) / PAGE_SIZE) - 1;
+				m3 = ((size + (size / 2) + PAGE_SIZE) / PAGE_SIZE) - 1;
+				o1 = size % PAGE_SIZE;
+				o2 = (size + (size / 4)) % PAGE_SIZE;
 				DEB_CAP("size:%d, m1:%d, m2:%d, m3:%d, o1:%d, o2:%d\n",
 					size, m1, m2, m3, o1, o2);
 				break;
 			}
 			case 16: {
 				/* create some offsets inside the page table */
-				m1 = ((size+PAGE_SIZE)/PAGE_SIZE)-1;
-				m2 = ((size+(size/2)+PAGE_SIZE)/PAGE_SIZE)-1;
-				m3 = ((2*size+PAGE_SIZE)/PAGE_SIZE)-1;
-				o1 = size%PAGE_SIZE;
-				o2 = (size+(size/2))%PAGE_SIZE;
+				m1 = ((size + PAGE_SIZE) / PAGE_SIZE) - 1;
+				m2 = ((size + (size / 2) + PAGE_SIZE) / PAGE_SIZE) - 1;
+				m3 = ((2 * size + PAGE_SIZE) / PAGE_SIZE) - 1;
+				o1 = size % PAGE_SIZE;
+				o2 = (size + (size / 2)) % PAGE_SIZE;
 				DEB_CAP("size:%d, m1:%d, m2:%d, m3:%d, o1:%d, o2:%d\n",
 					size, m1, m2, m3, o1, o2);
 				break;
@@ -145,64 +146,37 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 		ptr2 = pt2->cpu;
 		ptr3 = pt3->cpu;
 
-		/* walk all pages, copy all page addresses to ptr1 */
-		for (i = 0; i < length; i++, list++) {
-			for (p = 0; p * 4096 < sg_dma_len(list); p++, ptr1++)
-				*ptr1 = cpu_to_le32(sg_dma_address(list) - list->offset);
-		}
-/*
-		ptr1 = pt1->cpu;
-		for(j=0;j<40;j++) {
-			printk("ptr1 %d: 0x%08x\n",j,ptr1[j]);
-		}
-*/
+		for_each_sg_dma_page(list, &dma_iter, length, 0)
+			*ptr1++ = cpu_to_le32(sg_page_iter_dma_address(&dma_iter) - list->offset);
 
 		/* if we have a user buffer, the first page may not be
 		   aligned to a page boundary. */
 		pt1->offset = dma->sglist->offset;
-		pt2->offset = pt1->offset+o1;
-		pt3->offset = pt1->offset+o2;
+		pt2->offset = pt1->offset + o1;
+		pt3->offset = pt1->offset + o2;
 
 		/* create video-dma2 page table */
 		ptr1 = pt1->cpu;
-		for(i = m1; i <= m2 ; i++, ptr2++) {
+		for (i = m1; i <= m2; i++, ptr2++)
 			*ptr2 = ptr1[i];
-		}
-		fill = *(ptr2-1);
-		for(;i<1024;i++,ptr2++) {
+		fill = *(ptr2 - 1);
+		for (; i < 1024; i++, ptr2++)
 			*ptr2 = fill;
-		}
 		/* create video-dma3 page table */
 		ptr1 = pt1->cpu;
-		for(i = m2; i <= m3; i++,ptr3++) {
+		for (i = m2; i <= m3; i++, ptr3++)
 			*ptr3 = ptr1[i];
-		}
-		fill = *(ptr3-1);
-		for(;i<1024;i++,ptr3++) {
+		fill = *(ptr3 - 1);
+		for (; i < 1024; i++, ptr3++)
 			*ptr3 = fill;
-		}
 		/* finally: finish up video-dma1 page table */
-		ptr1 = pt1->cpu+m1;
+		ptr1 = pt1->cpu + m1;
 		fill = pt1->cpu[m1];
-		for(i=m1;i<1024;i++,ptr1++) {
+		for (i = m1; i < 1024; i++, ptr1++)
 			*ptr1 = fill;
-		}
-/*
-		ptr1 = pt1->cpu;
-		ptr2 = pt2->cpu;
-		ptr3 = pt3->cpu;
-		for(j=0;j<40;j++) {
-			printk("ptr1 %d: 0x%08x\n",j,ptr1[j]);
-		}
-		for(j=0;j<40;j++) {
-			printk("ptr2 %d: 0x%08x\n",j,ptr2[j]);
-		}
-		for(j=0;j<40;j++) {
-			printk("ptr3 %d: 0x%08x\n",j,ptr3[j]);
-		}
-*/
 	} else {
 		struct saa7146_pgtable *pt = &buf->pt[0];
+
 		return saa7146_pgtable_build_single(pci, pt, list, length);
 	}
 
-- 
2.39.1

