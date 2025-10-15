Return-Path: <linux-media+bounces-44535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E514BDD3B4
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6533B9297
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88324314D2D;
	Wed, 15 Oct 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ax03q2P+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA0314B77;
	Wed, 15 Oct 2025 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514873; cv=none; b=f94J13zjhW6+jeIzBeEzHiBv+RUcA0vsLuYsv3BvZc1Rvxm+iRxhgxO7EUxaM4bGNM8yi0mtCd9ird93ZMdebyOwJiIjBE4BO1s1DweQdFZhJaywWgLU0guVKppN4BJBhWLboSQAz4SMslLMxSeWx3YHvbrIXyu1DtSALh0JdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514873; c=relaxed/simple;
	bh=1Z4OYQHH4emU6uOE1QfvhdpIUfNJotVLhDqY12WscLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXvqGtD8pwTYv2IVEwnIDr8aYKR31by3JmGsxuN84ndPlVI2sBn26NDvVMwvqIXvHykzqavk9Csfh7oGwhPYXS6xphNqBNNtsQ5fqG6KISjy4E77QIpNK6S9ROCY9UKy9cTevPWV6kcf92v8RqHmp0iH8hq4JIXqfcinKZcLtjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ax03q2P+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DAA851E2C;
	Wed, 15 Oct 2025 09:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514770;
	bh=1Z4OYQHH4emU6uOE1QfvhdpIUfNJotVLhDqY12WscLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ax03q2P+W9KEdMRYqckE3K+4R5yTkB6wyKinRFZE07L+/hcWwNk5Mam7XMHQXYTyE
	 OqbewfPwE0Vw9Q6CsXQODVFBvvSa6dkVcbCOaR6Cg79+OxmpqLsvEEgjAMeZ/rAYH7
	 pvArfwF7q6aih7HgjUF0g1A+RAheYAtuLqvxS/fQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH v2 15/25] media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:38 +0300
Message-ID: <20251015075353.22625-16-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Changes since v1:

- Address iris_venc_s_fmt()
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
 drivers/media/platform/qcom/iris/iris_venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426..3926ed513f08 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -190,8 +190,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	u32 codec_align;
 
 	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 
 	if (vb2_is_busy(q))
 		return -EBUSY;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0..8a65c9cc6010 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -269,8 +269,6 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	struct vb2_queue *q;
 
 	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 
 	if (vb2_is_busy(q))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


