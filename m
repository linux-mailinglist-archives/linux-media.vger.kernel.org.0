Return-Path: <linux-media+bounces-16900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779A9606E7
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA39F1C22787
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C521A257C;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlQcVIVt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00291A00FE;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=dM/2JnH0Np2xC7jnW1iWWTyWVok/jCwbubzegSjwhjujYgvDwTACWQibzYsmtmp8PBRODM9Eqmcrrv9wOWNPWOVh/0jdvp1kQEL9EMOvLLXPCAL3RdClXtBxmibVC5FO2iMeHDS4/ULRUcLW4MXHQ6fDi6AP7FC8T48sdnR2bXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=7dmUrVm5MsRpRlIfq+Rg5Fs3RAMtLYqQAfzZ0ymvEvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkRzY+SpcWt/2TZ4kRnrjfiUPliERwXh6NDZzLrwwcl1wQZFxrc612Sw7M7nMxSE4b1d4r0jL2qXCMjscyOTA1UV3cWFmRwFbtZv2psaoGYKG3EetNTr9T3pehKeRxRPuhFOEWDtyyv1Z8vqx6oY6lYzZn6hccP0Ne+L4uL8LeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlQcVIVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF912C4FDF3;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=7dmUrVm5MsRpRlIfq+Rg5Fs3RAMtLYqQAfzZ0ymvEvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hlQcVIVtx+CsfV5ZPYh274vC2RFGDFEecxTtyWvPCsiwDXp1cONSpLtGEE7vKptjA
	 uqMYiqSyLfCyZ7j/qo3+eV5LMuY7I43fkR4V8F6gSPx9W3EWRbICLGVbmJs01pSpu8
	 iwz+1ve3zuh53k2Y8/MN1/d/aj5ZTV6sjRd/aGsge9JTx6MWe+xE9aLDBk9NBTXZOk
	 xsEG4VRqXpu6LYnJPTKKNQRqZBlEvL80GEz6aZAEwVb0zZsIeF40hJ+OgmzQYbZUIz
	 9x5rjXiXr0m6lR3p1lR7eZuCVACNPMg+EUhq7D30iwmcALRRpQFU4ObTpmXApuauJa
	 WQVNO4mPlLmzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52EFC54735;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:42 +0530
Subject: [PATCH v3 17/29] media: iris: implement query_cap, query_ctrl and
 query_menu ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-17-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=3331;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=NYDzrot9plHMXRI9hRDmFqnK2WCrDqJ1PWcxNJaBut8=;
 b=bqp6YfioGmZgpf/dd6qIzyzqTSUxRkhxQCLhw+E/xHqnmBGupWizoKvcCw6xbrjsSS+EkCDm0
 IeRGLAZLuYsD0qwuG1Ki2Z/HzhrYRxD/KSIE+u8NQIFHvtJKTE4vp7u
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement query_cap, query_ctrl and query_menu ioctls in the
driver with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7d5da30cb1d1..1dd612b7cec5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -362,6 +362,92 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	return ret;
 }
 
+static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
+	memset(cap->reserved, 0, sizeof(cap->reserved));
+	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int iris_queryctrl(struct file *filp, void *fh, struct v4l2_queryctrl *q_ctrl)
+{
+	struct v4l2_ctrl *ctrl;
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst || !q_ctrl)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, q_ctrl->id);
+	if (!ctrl) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	q_ctrl->minimum = ctrl->minimum;
+	q_ctrl->maximum = ctrl->maximum;
+	q_ctrl->default_value = ctrl->default_value;
+	q_ctrl->flags = 0;
+	q_ctrl->step = ctrl->step;
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int iris_querymenu(struct file *filp, void *fh, struct v4l2_querymenu *qmenu)
+{
+	struct v4l2_ctrl *ctrl;
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst || !qmenu)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, qmenu->id);
+	if (!ctrl) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (ctrl->type != V4L2_CTRL_TYPE_MENU) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (qmenu->index < ctrl->minimum || qmenu->index > ctrl->maximum) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (ctrl->menu_skip_mask & (1 << qmenu->index)) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
 	struct iris_inst *inst;
@@ -453,6 +539,9 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querycap                = iris_querycap,
+	.vidioc_queryctrl               = iris_queryctrl,
+	.vidioc_querymenu               = iris_querymenu,
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = iris_unsubscribe_event,

-- 
2.34.1



