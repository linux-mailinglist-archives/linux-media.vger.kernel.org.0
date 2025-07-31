Return-Path: <linux-media+bounces-38704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2CB17638
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 20:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF31A7A876B
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 18:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EFC248F77;
	Thu, 31 Jul 2025 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GNTwdaQP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A901D799D
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987772; cv=none; b=FVez1RQPfh/dujB1OnoOCCk4ezpomtuZd5jumVKPzvyOPxmApGmbf6PeIM2p95MEwDQXpERRa+eETnvuwMK3WXQ+k529NTl7pHMwJuehky5JlSITjxC06ERT9d8k2+pb1x1yWFOt05qTOp6Yosdj6EmZO/BpP6DOVpXMKIkh6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987772; c=relaxed/simple;
	bh=mAKQ5VhM8tfCxgIpwdvIRpS2sPlXXvQA7Zz1T+Cg1qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS5dmC4ekn41G5MTjewswdO/XEgf9L9V3F+OdIOMU8qyBoppYAegvDOhvg3ITir5sPQ6qaJd+fqJyuVJLDk273GzKwosndh5YS1XRnhq1RYIO6SDk82ZGhklSj9ZjL2OFbT+J528VFsB5nYJrTmuqwwxJh9JObWkbGERkLYa9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GNTwdaQP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 055EFC0B;
	Thu, 31 Jul 2025 20:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753987718;
	bh=mAKQ5VhM8tfCxgIpwdvIRpS2sPlXXvQA7Zz1T+Cg1qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GNTwdaQPBdpD4WEahT8UEFf6WNJvpG76sUJO1jSRibdyt6OoANbP0BaG6NuMG1GYr
	 HK30x3yJCh/Tvr369Hs5KyZmUlagL2JT8MWWPIbDgH9TXnWhvaz62NOLIqTvcgVOXD
	 aHFPKjh3LSyQhKB6R0ExrPGBqavWIEhT0QLB4CBU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 1/2] media: amphion: Make some vpu_v4l2 functions static
Date: Thu, 31 Jul 2025 21:49:10 +0300
Message-ID: <20250731184911.4323-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250731184911.4323-1-laurent.pinchart@ideasonboard.com>
References: <20250731184911.4323-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some functions defined in vpu_v4l2.c are never used outside of that
compilation unit. Make them static.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 12 +++++++++---
 drivers/media/platform/amphion/vpu_v4l2.h |  8 --------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 74668fa362e2..306d94e0f8e7 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -24,6 +24,11 @@
 #include "vpu_msgs.h"
 #include "vpu_helpers.h"
 
+static char *vpu_type_name(u32 type)
+{
+	return V4L2_TYPE_IS_OUTPUT(type) ? "output" : "capture";
+}
+
 void vpu_inst_lock(struct vpu_inst *inst)
 {
 	mutex_lock(&inst->lock);
@@ -42,7 +47,7 @@ dma_addr_t vpu_get_vb_phy_addr(struct vb2_buffer *vb, u32 plane_no)
 			vb->planes[plane_no].data_offset;
 }
 
-unsigned int vpu_get_vb_length(struct vb2_buffer *vb, u32 plane_no)
+static unsigned int vpu_get_vb_length(struct vb2_buffer *vb, u32 plane_no)
 {
 	if (plane_no >= vb->num_planes)
 		return 0;
@@ -81,7 +86,7 @@ void vpu_v4l2_set_error(struct vpu_inst *inst)
 	vpu_inst_unlock(inst);
 }
 
-int vpu_notify_eos(struct vpu_inst *inst)
+static int vpu_notify_eos(struct vpu_inst *inst)
 {
 	static const struct v4l2_event ev = {
 		.id = 0,
@@ -573,7 +578,8 @@ static void vpu_vb2_buf_finish(struct vb2_buffer *vb)
 		call_void_vop(inst, on_queue_empty, q->type);
 }
 
-void vpu_vb2_buffers_return(struct vpu_inst *inst, unsigned int type, enum vb2_buffer_state state)
+static void vpu_vb2_buffers_return(struct vpu_inst *inst, unsigned int type,
+				   enum vb2_buffer_state state)
 {
 	struct vb2_v4l2_buffer *buf;
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.h b/drivers/media/platform/amphion/vpu_v4l2.h
index 56f2939fa84d..4a87b06ae520 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.h
+++ b/drivers/media/platform/amphion/vpu_v4l2.h
@@ -26,15 +26,12 @@ void vpu_skip_frame(struct vpu_inst *inst, int count);
 struct vb2_v4l2_buffer *vpu_find_buf_by_sequence(struct vpu_inst *inst, u32 type, u32 sequence);
 struct vb2_v4l2_buffer *vpu_find_buf_by_idx(struct vpu_inst *inst, u32 type, u32 idx);
 void vpu_v4l2_set_error(struct vpu_inst *inst);
-int vpu_notify_eos(struct vpu_inst *inst);
 int vpu_notify_source_change(struct vpu_inst *inst);
 int vpu_set_last_buffer_dequeued(struct vpu_inst *inst, bool eos);
-void vpu_vb2_buffers_return(struct vpu_inst *inst, unsigned int type, enum vb2_buffer_state state);
 int vpu_get_num_buffers(struct vpu_inst *inst, u32 type);
 bool vpu_is_source_empty(struct vpu_inst *inst);
 
 dma_addr_t vpu_get_vb_phy_addr(struct vb2_buffer *vb, u32 plane_no);
-unsigned int vpu_get_vb_length(struct vb2_buffer *vb, u32 plane_no);
 static inline struct vpu_format *vpu_get_format(struct vpu_inst *inst, u32 type)
 {
 	if (V4L2_TYPE_IS_OUTPUT(type))
@@ -43,11 +40,6 @@ static inline struct vpu_format *vpu_get_format(struct vpu_inst *inst, u32 type)
 		return &inst->cap_format;
 }
 
-static inline char *vpu_type_name(u32 type)
-{
-	return V4L2_TYPE_IS_OUTPUT(type) ? "output" : "capture";
-}
-
 static inline int vpu_vb_is_codecconfig(struct vb2_v4l2_buffer *vbuf)
 {
 #ifdef V4L2_BUF_FLAG_CODECCONFIG
-- 
Regards,

Laurent Pinchart


