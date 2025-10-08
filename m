Return-Path: <linux-media+bounces-43997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD6BC6345
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB03402F28
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5816A2C11F5;
	Wed,  8 Oct 2025 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rPi58B3/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C82C08BD;
	Wed,  8 Oct 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945890; cv=none; b=VLPYkjx+VfaJTxBSNV8dW7Yd6cDY8EX4J0mFSjg8gbyXk0p4K8H5IvjEYrVszJouMFHM6/XIFJLVxu/URMEycnm1qrT01By1rww4WOnGL8KT8ORjp70wh2fFJjEoHJSanjZ0mL/gOJJysqVwvCSuA3qRNKvQlfbsvf/e478o/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945890; c=relaxed/simple;
	bh=Z9/fIYkH6Ay2s+8fnCDkizHFbMrQSUZVH/sRRV+SluM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqJiXKG+i1YEGTfIFymtoEqurVw4JLltsALIqD4fThMN2b7G8S41INGTf3wle+/ub8SJlKbIvVzxfFiL+pGZt1d2T5J/wDUszVOBpYwxshOsY8ggNkHjFyJiQz2gSaoUYY/zE/j0Vl5v7BOpb76xy/B4uPWEknlQ47UDFBOqfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rPi58B3/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94F671E45;
	Wed,  8 Oct 2025 19:49:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945792;
	bh=Z9/fIYkH6Ay2s+8fnCDkizHFbMrQSUZVH/sRRV+SluM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPi58B3/xpNc18ST6fv7MVy88rcAOjYsFKc+niyKd8m4umHNplo66miMJIANGUJGZ
	 txNMDI0lDi1FLqVnhsa05wnRHjRtBZEvRECvgKYI1zYC2MUrdGTQagd/qq8MAJ0gCR
	 4AEvz0dq7VIg79583XunqZMuqBT2TNZAx/FHpp/8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:43 +0300
Message-ID: <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 --
 drivers/media/platform/qcom/venus/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29b0d6a5303d..8c77db0f6e76 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -329,8 +329,6 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	struct vb2_queue *q;
 
 	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 
 	if (vb2_is_busy(q))
 		return -EBUSY;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c0a0ccdded80..0fe4cc37118b 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -241,8 +241,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	struct vb2_queue *q;
 
 	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 
 	if (vb2_is_busy(q))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


