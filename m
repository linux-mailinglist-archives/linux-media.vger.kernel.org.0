Return-Path: <linux-media+bounces-12477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B18D85FD
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 17:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEAF1F22E27
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E26130A4D;
	Mon,  3 Jun 2024 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZeZZg2+k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD4130AD7
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717428376; cv=none; b=Lc17mr+w68KH/xX6Ibhu0WseH2gMwFgECpz1PDwRMgATRgjk5bNbX9WA8CIXvGBbPeLZwqXw1ue+qpP4VT75zT9H1KeYL0wOPdEaOmbg7J3EVVnBT/YvIfpRPKoij+qNGj4bzRmQ65MXs3/jUPEaDlcUWoQV4wBtbU9eOKMxKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717428376; c=relaxed/simple;
	bh=9O8t5m1mlX4rkc/5G9S7+wYDmYmy28rOsQ65BjEzKWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODxT2uhW4f8S8u5LwN8jYSFEMRp1hD35LGC4eaI3djDFdv4B5QhpoTBQEMHvHhLnqJjYnMJ24st2MTpCG3szVzGELwJhFSl+Hgghoyz8Dcts3fB3PGCVKTjSSJOS4hd54kV3fj7FhfwlZajs7kvpV48+kDALJV+tX5NBU9/snFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZeZZg2+k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD0F8C67;
	Mon,  3 Jun 2024 17:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717428358;
	bh=9O8t5m1mlX4rkc/5G9S7+wYDmYmy28rOsQ65BjEzKWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZeZZg2+kEw1AHxSoWpVh/9xRVRxOBGSk3r0kU+Jv6yZYFqaXLHdtxqA24tFsgh6Tp
	 eD9F5DlUGke+8TvEsIbTHxUQ0pUOPDBTAFSuGKCfWiPBo2+fBAgXC5YYCZrkGGcT60
	 jN/IJdaSJMbTToFSTGb7+0FaWhyEio/3e6FmsUnY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [RFC 3/3] media: rkisp1-params: Override vb2_queue.buf_ops
Date: Mon,  3 Jun 2024 17:25:47 +0200
Message-ID: <20240603152548.107158-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Override the implementation of vb2_queue.buf_ops to allow a
driver-specific behaviour in the buffer initialization operation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 0290f25a4ab6..4bb92d076e84 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2455,6 +2455,21 @@ static const struct vb2_ops rkisp1_params_vb2_ops = {
 
 };
 
+static void rkisp1_params_vb2_buf_init_buffer(struct vb2_buffer *vb)
+{
+	/* TODO */
+
+	vb2_buf_init_buffer(vb);
+}
+
+static const struct vb2_buf_ops rkisp1_params_vb2_buf_ops = {
+	.verify_planes_array	= vb2_buf_verify_planes_array,
+	.init_buffer		= rkisp1_params_vb2_buf_init_buffer,
+	.fill_user_buffer	= vb2_buf_fill_v4l2_buffer,
+	.fill_vb2_buffer	= vb2_buf_fill_vb2_buffer,
+	.copy_timestamp		= vb2_buf_copy_timestamp,
+};
+
 static const struct v4l2_file_operations rkisp1_params_fops = {
 	.mmap = vb2_fop_mmap,
 	.unlocked_ioctl = video_ioctl2,
@@ -2474,12 +2489,13 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	q->drv_priv = params;
 	q->ops = &rkisp1_params_vb2_ops;
+	q->buf_ops = &rkisp1_params_vb2_buf_ops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->buf_struct_size = sizeof(struct rkisp1_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 
-	return vb2_queue_init(q);
+	return  vb2_queue_init(q);
 }
 
 int rkisp1_params_register(struct rkisp1_device *rkisp1)
-- 
2.45.1


