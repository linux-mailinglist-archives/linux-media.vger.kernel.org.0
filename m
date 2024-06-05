Return-Path: <linux-media+bounces-12597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C938FD33A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB5D1F2492C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C2B19049E;
	Wed,  5 Jun 2024 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HVuZeGh0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34670188CA8
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606522; cv=none; b=Dvyo/w7ijfm9kX5aLnqtoISbvPHHe+xXuQwdLoZ2XhY8Pw/Uz6BEpMbBDUcUJKkoYQSZTSGZGfCB/LXMk2VrCXhJPpx+XLWz/HoK6X1KcoPH/CO0ZT2Iz6pyQDWo5ryTUdFHnLdue72ZvwJI4vsPgzi6Texck5+JWJaTliurbDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606522; c=relaxed/simple;
	bh=Gcy9/fXc+lfrnNZrX6Y2uiaLBEDB/nrWRgeaEJCzRYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPYu+PYPgAiFHEN9ikx/ew6P12WZoXFxFl8AhhlRo7UhyDlAM9HHD8ZrwzdkeBNbMfONKCdz77GAHmKlWl4NNCGwOiagE25VB9gMqTOta3x46v4ISH/7WEgvmv4qUGfa+EX/leRpkmEO+eWSf4qXo6hYeyO7LeIP2KUhw8q1qos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HVuZeGh0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D71C7704B;
	Wed,  5 Jun 2024 18:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606494;
	bh=Gcy9/fXc+lfrnNZrX6Y2uiaLBEDB/nrWRgeaEJCzRYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVuZeGh0bpEpy15wb0CmDT0ND2aRHGnQa0u7otIObqSMvcsVc+MX1qjhmMXBNcYKa
	 ZKbr7nZbRIAYeaC3xaUrgO/MEHI6u0+LRgjNXPO3oO5qta4kaJ81jA9dEVpgzl0SUF
	 +RB3VI3ZFfPp1BDaDNiGGbqhseVjgNK14jDHkJAs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 7/8] media: rkisp1: Add struct rkisp1_params_buffer
Date: Wed,  5 Jun 2024 18:54:26 +0200
Message-ID: <20240605165434.432230-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create the 'struct rkisp1_params_buffer' type that wraps a
vb2_v4l2_buffer and contain a pointer to an optional copy of
the parameters buffer that will be used to copy the user-provided
configuration buffer in the following patches.

Replace usage of 'struct rkisp1_buffer' with 'struct
rkisp1_params_buffer' in rkisp1-params.c to prepare for that.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  | 16 +++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 21 ++++++++++---------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index f9df5ed96c98..3118f1974246 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -232,7 +232,7 @@ struct rkisp1_vdev_node {
 
 /*
  * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
- *			  params, stats, mainpath, selfpath
+ *			  stats, mainpath, selfpath
  *
  * @vb:		vb2 buffer
  * @queue:	entry of the buffer in the queue
@@ -244,6 +244,20 @@ struct rkisp1_buffer {
 	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
 };
 
+/*
+ * struct rkisp1_params_buffer - A container for the vb2 buffers used by the
+ *				 params video device
+ *
+ * @vb:		vb2 buffer
+ * @queue:	entry of the buffer in the queue
+ * cfg:		scratch buffer used for the extensible parameters format
+ */
+struct rkisp1_params_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	struct rkisp1_ext_params_cfg *cfg;
+};
+
 /*
  * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
  *				there are no vb2 buffers available.
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c081fd490b2b..4adaf084ce6e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2016,20 +2016,21 @@ static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
 }
 
 static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
-				     struct rkisp1_buffer **buf,
+				     struct rkisp1_params_buffer **buf,
 				     void **cfg)
 {
 	if (list_empty(&params->params))
 		return false;
 
-	*buf = list_first_entry(&params->params, struct rkisp1_buffer, queue);
+	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
+				queue);
 	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
 
 	return true;
 }
 
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
-					  struct rkisp1_buffer *buf,
+					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence,
 					  enum vb2_buffer_state state)
 {
@@ -2042,7 +2043,7 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
-	struct rkisp1_buffer *buf;
+	struct rkisp1_params_buffer *buf;
 	int ret = 0;
 	void *cfg;
 
@@ -2129,7 +2130,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
 				enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
-	struct rkisp1_buffer *buf;
+	struct rkisp1_params_buffer *buf;
 	int ret = 0;
 	void *cfg;
 
@@ -2193,7 +2194,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 int rkisp1_params_post_configure(struct rkisp1_params *params)
 {
-	struct rkisp1_buffer *buf;
+	struct rkisp1_params_buffer *buf;
 	int ret = 0;
 	void *cfg;
 
@@ -2409,8 +2410,8 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct rkisp1_buffer *params_buf =
-		container_of(vbuf, struct rkisp1_buffer, vb);
+	struct rkisp1_params_buffer *params_buf =
+		container_of(vbuf, struct rkisp1_params_buffer, vb);
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
 
@@ -2436,7 +2437,7 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 {
 	struct rkisp1_params *params = vq->drv_priv;
-	struct rkisp1_buffer *buf;
+	struct rkisp1_params_buffer *buf;
 	LIST_HEAD(tmp_list);
 
 	/*
@@ -2482,7 +2483,7 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	q->drv_priv = params;
 	q->ops = &rkisp1_params_vb2_ops;
 	q->mem_ops = &vb2_vmalloc_memops;
-	q->buf_struct_size = sizeof(struct rkisp1_buffer);
+	q->buf_struct_size = sizeof(struct rkisp1_params_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 
-- 
2.45.1


