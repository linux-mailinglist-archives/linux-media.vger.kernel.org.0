Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B743A6C6CA3
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjCWPyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjCWPyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BED82279A
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:53:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10A47B8219B
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C502C433EF;
        Thu, 23 Mar 2023 15:53:50 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 05/19] media: common: saa7146: drop 'fmt' from struct saa7146_buf
Date:   Thu, 23 Mar 2023 16:53:29 +0100
Message-Id: <20230323155343.2399473-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the video_fmt in saa7146_vv instead of having a pointer
to it in struct saa7146_buf.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_hlp.c   | 37 +++++++++++---------
 drivers/media/common/saa7146/saa7146_video.c | 12 +++----
 include/media/drv-intf/saa7146_vv.h          |  1 -
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index eab58bfbc8a8..33a952f68de8 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -407,14 +407,14 @@ void saa7146_write_out_dma(struct saa7146_dev* dev, int which, struct saa7146_vi
 static int calculate_video_dma_grab_packed(struct saa7146_dev* dev, struct saa7146_buf *buf)
 {
 	struct saa7146_vv *vv = dev->vv_data;
+	struct v4l2_pix_format *pix = &vv->video_fmt;
 	struct saa7146_video_dma vdma1;
+	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pix->pixelformat);
 
-	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
-
-	int width = buf->fmt->width;
-	int height = buf->fmt->height;
-	int bytesperline = buf->fmt->bytesperline;
-	enum v4l2_field field = buf->fmt->field;
+	int width = pix->width;
+	int height = pix->height;
+	int bytesperline = pix->bytesperline;
+	enum v4l2_field field = pix->field;
 
 	int depth = sfmt->depth;
 
@@ -469,8 +469,9 @@ static int calculate_video_dma_grab_packed(struct saa7146_dev* dev, struct saa71
 
 static int calc_planar_422(struct saa7146_vv *vv, struct saa7146_buf *buf, struct saa7146_video_dma *vdma2, struct saa7146_video_dma *vdma3)
 {
-	int height = buf->fmt->height;
-	int width = buf->fmt->width;
+	struct v4l2_pix_format *pix = &vv->video_fmt;
+	int height = pix->height;
+	int width = pix->width;
 
 	vdma2->pitch	= width;
 	vdma3->pitch	= width;
@@ -500,8 +501,9 @@ static int calc_planar_422(struct saa7146_vv *vv, struct saa7146_buf *buf, struc
 
 static int calc_planar_420(struct saa7146_vv *vv, struct saa7146_buf *buf, struct saa7146_video_dma *vdma2, struct saa7146_video_dma *vdma3)
 {
-	int height = buf->fmt->height;
-	int width = buf->fmt->width;
+	struct v4l2_pix_format *pix = &vv->video_fmt;
+	int height = pix->height;
+	int width = pix->width;
 
 	vdma2->pitch	= width/2;
 	vdma3->pitch	= width/2;
@@ -530,15 +532,15 @@ static int calc_planar_420(struct saa7146_vv *vv, struct saa7146_buf *buf, struc
 static int calculate_video_dma_grab_planar(struct saa7146_dev* dev, struct saa7146_buf *buf)
 {
 	struct saa7146_vv *vv = dev->vv_data;
+	struct v4l2_pix_format *pix = &vv->video_fmt;
 	struct saa7146_video_dma vdma1;
 	struct saa7146_video_dma vdma2;
 	struct saa7146_video_dma vdma3;
+	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pix->pixelformat);
 
-	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
-
-	int width = buf->fmt->width;
-	int height = buf->fmt->height;
-	enum v4l2_field field = buf->fmt->field;
+	int width = pix->width;
+	int height = pix->height;
+	enum v4l2_field field = pix->field;
 
 	BUG_ON(0 == buf->pt[0].dma);
 	BUG_ON(0 == buf->pt[1].dma);
@@ -717,8 +719,9 @@ static void saa7146_disable_clipping(struct saa7146_dev *dev)
 
 void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struct saa7146_buf *next)
 {
-	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
 	struct saa7146_vv *vv = dev->vv_data;
+	struct v4l2_pix_format *pix = &vv->video_fmt;
+	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pix->pixelformat);
 	u32 vdma1_prot_addr;
 
 	DEB_CAP("buf:%p, next:%p\n", buf, next);
@@ -730,7 +733,7 @@ void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struc
 		saa7146_write(dev, MC2, MASK_27 );
 	}
 
-	saa7146_set_window(dev, buf->fmt->width, buf->fmt->height, buf->fmt->field);
+	saa7146_set_window(dev, pix->width, pix->height, pix->field);
 	saa7146_set_output_format(dev, sfmt->trans);
 	saa7146_disable_clipping(dev);
 
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 58f39cf64a1c..dd0d803c38cd 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -93,11 +93,13 @@ struct saa7146_format* saa7146_format_by_fourcc(struct saa7146_dev *dev, int fou
 
 static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *buf)
 {
+	struct saa7146_vv *vv = dev->vv_data;
 	struct pci_dev *pci = dev->pci;
 	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
 	struct scatterlist *list = dma->sglist;
 	int length = dma->sglen;
-	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
+	struct v4l2_pix_format *pix = &vv->video_fmt;
+	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pix->pixelformat);
 
 	DEB_EE("dev:%p, buf:%p, sg_len:%d\n", dev, buf, length);
 
@@ -108,7 +110,7 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 		__le32  *ptr1, *ptr2, *ptr3;
 		__le32 fill;
 
-		int size = buf->fmt->width*buf->fmt->height;
+		int size = pix->width * pix->height;
 		int i,p,m1,m2,m3,o1,o2;
 
 		switch( sfmt->depth ) {
@@ -757,8 +759,7 @@ static int buffer_prepare(struct videobuf_queue *q,
 	    buf->vb.height != vv->video_fmt.height ||
 	    buf->vb.size   != size ||
 	    buf->vb.field  != field      ||
-	    buf->vb.field  != vv->video_fmt.field  ||
-	    buf->fmt       != &vv->video_fmt) {
+	    buf->vb.field  != vv->video_fmt.field) {
 		saa7146_dma_free(dev,q,buf);
 	}
 
@@ -770,10 +771,9 @@ static int buffer_prepare(struct videobuf_queue *q,
 		buf->vb.height = vv->video_fmt.height;
 		buf->vb.size   = size;
 		buf->vb.field  = field;
-		buf->fmt       = &vv->video_fmt;
 		buf->vb.field  = vv->video_fmt.field;
 
-		sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
+		sfmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
 
 		release_all_pagetables(dev, buf);
 		if( 0 != IS_PLANAR(sfmt->trans)) {
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index fee861670ddb..80463fdd30eb 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -60,7 +60,6 @@ struct saa7146_buf {
 	struct videobuf_buffer vb;
 
 	/* saa7146 specific */
-	struct v4l2_pix_format  *fmt;
 	int (*activate)(struct saa7146_dev *dev,
 			struct saa7146_buf *buf,
 			struct saa7146_buf *next);
-- 
2.39.2

