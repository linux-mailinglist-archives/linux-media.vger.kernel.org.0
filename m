Return-Path: <linux-media+bounces-44536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43EBDD3CE
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6777C4FE6E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4AF315D3D;
	Wed, 15 Oct 2025 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OzzW9odh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4E315D25;
	Wed, 15 Oct 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514874; cv=none; b=FCWZY9rQoSH82yuFK9Hj8dqyHEAa3CLZ62lfLkunARpMCJI9FyGXCX4YSrqrJ91+0WxsTWlDAOixAXaThmRI/qxYt+/M3Tu1p1PYe6EHEpbwViVoH3ebtFL4BDqfnGiKm4ui5iIGhD6ZewDbPVhY9/bYSHykOu3cGFS7wmXu08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514874; c=relaxed/simple;
	bh=g/mevhBqNEK+KjpjOQ155XDW4lh8Q3VRfj9YfUSQgKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx3GOvwsZnTDIgU+oj0p5mMOThkDyXes0pej7epiZ+x7/IwW3LjfQmCzdK3YKi2fYmSOq4LFuSlWQyVHCWtUV7wREIAi1GoW99dkjptis8XDFjk2DHoy6kfngv0o+N9ea0yv6pn2Xf37A8OU7P+PCf7nsECNScx8BlZ56nTzn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OzzW9odh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0014B162B;
	Wed, 15 Oct 2025 09:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514772;
	bh=g/mevhBqNEK+KjpjOQ155XDW4lh8Q3VRfj9YfUSQgKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzzW9odhYrGR8i35UxDZwASVBakqMmIDigp9HsnpSenAW3h3A+EspfTExdthO/ml/
	 NFHHZTD2N8LsrIQhF0OZ4snaanOKyfa0n/7Vj1E2Ksm9tbKwhpaOTT3plGM5ygE2EJ
	 vqvuhusJon/jD4oZZbbBxlzuLTAfw3NOxNX+Kw3o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH v2 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:39 +0300
Message-ID: <20251015075353.22625-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 --
 drivers/media/platform/qcom/venus/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 55c27345b7d8..bb0b4f6639c5 100644
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
index fba07557a399..8a89c01c5dbb 100644
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


