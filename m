Return-Path: <linux-media+bounces-40842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41016B331D3
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 20:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACE1A202078
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 18:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3982E1EE6;
	Sun, 24 Aug 2025 18:08:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357D2E0415;
	Sun, 24 Aug 2025 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058937; cv=none; b=EeNi2MRvR9k+ViogBjjrIyWmpQqJtko4rLM1+ENg/BrCJRxUtG9ybXgJQj+LEC9XC2DggLyJW4tdCbfNzpNGvJDusumqOR0WH6OEKCmhziaUFO8QBlKCPsStF05G/fv0hOpa+qUnlUaLv8y4nYtQnu02dzN4jyvI8n6BNr0RYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058937; c=relaxed/simple;
	bh=8WAk15YNRBFF0kaJsdnClg7BX/nTA1dD94aCXbIvNZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxLWUkn5LcpHSuiOyJ3DO+s2kHWllQpYuFhju+exmfGGcFVL/TWyuPYOhwiPF+DjBC3PrdSY4NNWTZ21s5XVK6+7xsdhPvkRPywKxGB1CaGS6n0k4hj7CU/wboUlTgl1ceSAYAE3VFKTu0D+A6/zQCEO6Bjqy/xI3vdyrtJQPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id CD0011F00060;
	Sun, 24 Aug 2025 18:08:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 39465B01DDA; Sun, 24 Aug 2025 18:08:53 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id D2A15B01DCC;
	Sun, 24 Aug 2025 18:07:36 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 3/4] media: uapi: v4l2-controls: Cleanup codec definitions
Date: Sun, 24 Aug 2025 20:07:34 +0200
Message-ID: <20250824180735.765587-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824180735.765587-1-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some fields closer to where they are used, add missing tabs
and remove an extra newline.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 include/uapi/linux/v4l2-controls.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7aef88465d04..2d30107e047e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1537,15 +1537,6 @@ struct v4l2_ctrl_h264_pred_weights {
 	struct v4l2_h264_weight_factors weight_factors[2];
 };
 
-#define V4L2_H264_SLICE_TYPE_P				0
-#define V4L2_H264_SLICE_TYPE_B				1
-#define V4L2_H264_SLICE_TYPE_I				2
-#define V4L2_H264_SLICE_TYPE_SP				3
-#define V4L2_H264_SLICE_TYPE_SI				4
-
-#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
-#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
-
 #define V4L2_H264_TOP_FIELD_REF				0x1
 #define V4L2_H264_BOTTOM_FIELD_REF			0x2
 #define V4L2_H264_FRAME_REF				0x3
@@ -1566,8 +1557,17 @@ struct v4l2_h264_reference {
  * Maximum DPB size, as specified by section 'A.3.1 Level limits
  * common to the Baseline, Main, and Extended profiles'.
  */
-#define V4L2_H264_NUM_DPB_ENTRIES 16
-#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
+#define V4L2_H264_NUM_DPB_ENTRIES		16
+#define V4L2_H264_REF_LIST_LEN			(2 * V4L2_H264_NUM_DPB_ENTRIES)
+
+#define V4L2_H264_SLICE_TYPE_P				0
+#define V4L2_H264_SLICE_TYPE_B				1
+#define V4L2_H264_SLICE_TYPE_I				2
+#define V4L2_H264_SLICE_TYPE_SP				3
+#define V4L2_H264_SLICE_TYPE_SI				4
+
+#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED		0x01
+#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH			0x02
 
 #define V4L2_CID_STATELESS_H264_SLICE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 6)
 /**
@@ -1707,7 +1707,6 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
-
 /* Stateless FWHT control, used by the vicodec driver */
 
 /* Current FWHT version */
-- 
2.50.1


