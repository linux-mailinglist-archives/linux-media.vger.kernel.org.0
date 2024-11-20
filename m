Return-Path: <linux-media+bounces-21676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51739D3E77
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840901F24DB3
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4061D12EA;
	Wed, 20 Nov 2024 14:56:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D161D07AA;
	Wed, 20 Nov 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114565; cv=none; b=AiD5/ku253ycA5C/0jMZ9aEOrpEYIIMNDVj+IW3hZvbEknmKszS6RqY7cwzi1ywsVfUuo1MlPYOprKADxToS+HlufMUo76NSIXFaRUt9Qv/VGl/AXSA0gXLyvWnHuKXb2DqVxmq3SLwsQQ3X3T7/yjo7IRafBLnGHqxCcT0kjsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114565; c=relaxed/simple;
	bh=KsSihiy76LbZ2/MXevnwwuWQZ8IUD22/mICYYrrkre8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8kTj87nQf96NFpegFELBQ2L2c8p0IX9eOQVj7s54Skxs6btJJuppCqKWTNpKFEWIewYSZSovvMKRhkh9tGaF843tcZu+cNjKiX6Ohpq48aeF5pLTw+mVeUZvqRlL2XAOlWtH/s/dE10WLzlDVLyMilocFpjKLwsQzRWTKVAUng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id AA38262BC0;
	Wed, 20 Nov 2024 15:48:54 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/3] media: mgb4: Unify the outputs padding logic with the inputs
Date: Wed, 20 Nov 2024 15:48:44 +0100
Message-ID: <20241120144846.2271-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120144846.2271-1-tumic@gpxsee.org>
References: <20241120144846.2271-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Write the padding to the HW registers at the same place as the input logic
does.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vout.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 6b2791e29de1..600f858918e7 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -180,7 +180,10 @@ static void stop_streaming(struct vb2_queue *vq)
 
 	xdma_disable_user_irq(mgbdev->xdev, irq);
 	cancel_work_sync(&voutdev->dma_work);
+
 	mgb4_mask_reg(&mgbdev->video, voutdev->config->regs.config, 0x2, 0x0);
+	mgb4_write_reg(&mgbdev->video, voutdev->config->regs.padding, 0);
+
 	return_all_buffers(voutdev, VB2_BUF_STATE_ERROR);
 }
 
@@ -196,6 +199,7 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	int rv;
 	u32 addr;
 
+	mgb4_write_reg(video, config->regs.padding, voutdev->padding);
 	mgb4_mask_reg(video, config->regs.config, 0x2, 0x2);
 
 	addr = mgb4_read_reg(video, config->regs.address);
@@ -359,7 +363,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 	voutdev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width
 			    * pixelsize)) / pixelsize;
-	mgb4_write_reg(video, voutdev->config->regs.padding, voutdev->padding);
 
 	return 0;
 }
-- 
2.47.0


