Return-Path: <linux-media+bounces-16897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2A39606E6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08FCDB232F0
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF33A1A2542;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtqI8xtq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642C19F49A;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=t/gnbCQPu3RkB8ksibtbvvg+GtzfrzxegxxYgOXxwRBmP5qyVqsPX0tCHaOk+Qghlmx2zE6uQaz/oM6DosQjfZV/EigGxbqe/iWWpJQT5fGZPVrxVJ+BMOFqqzvGW2OG5bdlUjmhdpXAvf62LwgM69lK0hZtYbiAWeweLI2QE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=qkHyU9JW9UhkdBZh1qj7g9q6Ks9zEJX5pMeK7C7N1a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcJvTQCtJJ5YQFcVu1Vlv8lBZKoA7ZEgCutn/Hto0lzv77ip2UuJ78etqCPTiHuHdv/2pbeC3QMBJiqW6Vmp6f6rjlZ6qj9OJ5KXtKLsffRH3cHmtQ3Wxqc2hBf+VjR1PNHb20/wbjGGVa372wcNHKxU3QDf9/WeRj531CAK+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtqI8xtq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CD28C4DE1B;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=qkHyU9JW9UhkdBZh1qj7g9q6Ks9zEJX5pMeK7C7N1a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QtqI8xtqPtlrRZAW7bzkKZbU/Gf9wz4J4T9UNTMoFGte0d6uhJeAeETKVGku4+fcn
	 5RiEEm18k/u8LAM4KyDuy12jiYueLwpCYPIfbOy1iAAoDriA5IKcnK/B9M4gKnxDMe
	 spgGC37Vf6ibdZh8OQeq9c0h9gtspn28uZJgZMOEmUTZH+U7wCPhu1TjHKlLGJ0Rxf
	 c2a9XPpeZScJqsLQ1pMrqyTDbmUb4THy2NHk5dS6QrWRJScMWX9GeIHn4brFkLD8BR
	 8SEqhi7hyZBaQsUqmX6Ac/JcbvksUI9sPnysJyDSP99rsW2uEEU0TxBrXMFy3L4Xso
	 uD6xJaj9m30jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D6DC52D6F;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:38 +0530
Subject: [PATCH v3 13/29] media: iris: implement g_selection ioctl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-13-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=2127;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=p8lMxAQLIngNvbWVVTC34P+pqjWzrRVYcTab/Vl0ejY=;
 b=agEiI+HjFJi1eDip1iEXGl/3HSu6vIZykLsuSzjw9QBOLa1sg4rMAsEI+pEHAd72iSHnsCs9l
 +ePdAPDkFIMDIW5M2wLBeFfLeuukTmrsZ1Wxfl0BsGhz8ORg7dd30zS
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement g_selection ioctl in the driver with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7eafbbfd22e4..e09c0a156387 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -309,6 +309,45 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
+static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst || !s)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = inst->crop.left;
+		s->r.top = inst->crop.top;
+		s->r.width = inst->crop.width;
+		s->r.height = inst->crop.height;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -330,6 +369,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_g_selection             = iris_g_selection,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1



