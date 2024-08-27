Return-Path: <linux-media+bounces-16899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA99606EA
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C03B20B54
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1217A1A2579;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riNkK4GJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C001419FA86;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=On9omUnY0sdkGXWutXjkUvpkGO/n9GkQNkEhovdYvd32nnVriqnhFdKwoznFx4ZX9G8a6s7iIY7YtJuRK2Gjl1KCsB9OsPWm/imQ1SRkAm7YgymFRTl/qgWkPGU7Th05uH8THOZnJgtUVgFd740H6sNeWGwITF/gqNZT4nLRe74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=r9jUpb5sjdrgtqpcrmScsEF39c7IVq/pH9K5zGUswTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJhMPF7YVQAQuBUgFOVQIHXh2GWuXx7GoQGxUIimf55Ib5CVYz9DvtoG4V7C0Ur+kBQz1FTU9MkqtrVI2zAifUdyc4lF0iF1wN/EBsjnqNVWB5GEFA1JAwEU0Qp/8d4tEUQvwTZvurJkLJnCmjLERdAeX6kyRAAcFcL3GfaU5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riNkK4GJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AFA9C4AF50;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=r9jUpb5sjdrgtqpcrmScsEF39c7IVq/pH9K5zGUswTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=riNkK4GJUB05XV8c5TosTpMpQRg38jrduiyk6N8ROFYGNhH0YrZQbHkxyeMSvizEt
	 jTKQQOD4SlgM3plU2OEliHCNEsNhPNsNyF0oP5NK/59lJ7WM9JnEzDBha9rLugD2Vh
	 R2lyYbnCCpK+0LKuTzCngopC+OWK7Tx8za2v+0Cygp5g0qM4ZJgFAY/dKfYhdqcclb
	 swnyq9tgq7OiyxFH67KtMfZPhbt5Zn8k9ospbCU5Gnu39bJo44Aad/6vqVh/er2Ft6
	 4kOY4j6TEAegArPRpmKidvbAs9JvepY17j3WtXqyarvo4baXKSeCvx6MKOFkjcK/JT
	 E/8c1qbGQ2eXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890D5C52D6F;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:40 +0530
Subject: [PATCH v3 15/29] media: iris: implement subscribe_event and
 unsubscribe_event ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-15-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=5119;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=nP3/atOpfa9eV16b785gciUAZJmLxBjkVrJb7x2W4qI=;
 b=IvsM+jlYsuyNinbW6BiUye8VHSkOT4bXRCXhpVeeSnOIreWTP+MzP6kPM4H85NL20vLZzLy4n
 +T3+8pVKD7pBofEWwQmsgROQpfmcud3oBBd/A0lGt4eE0WVOMTzUmAU
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement subscribe_event and unsubscribe_event ioctls in the
driver with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c     | 26 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h     |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c     | 31 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index bb43119af352..d28b8fd7ec2f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -30,6 +30,7 @@
  * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @subscriptions: variable to hold current events subscriptions
  */
 
 struct iris_inst {
@@ -48,6 +49,7 @@ struct iris_inst {
 	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
+	unsigned int			subscriptions;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index a38903eefa1c..29c7e229c148 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -13,6 +14,7 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 #define DEFAULT_CODEC_ALIGNMENT 16
+#define MAX_EVENTS 30
 
 void iris_vdec_inst_init(struct iris_inst *inst)
 {
@@ -207,3 +209,27 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	return ret;
 }
+
+int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
+{
+	int ret = 0;
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		ret = v4l2_event_subscribe(&inst->fh, sub, MAX_EVENTS, NULL);
+		inst->subscriptions |= V4L2_EVENT_EOS;
+		break;
+	case V4L2_EVENT_SOURCE_CHANGE:
+		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
+		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
+		break;
+	case V4L2_EVENT_CTRL:
+		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
+		inst->subscriptions |= V4L2_EVENT_CTRL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index eb8a1121ae92..707fff34bf4d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -13,5 +13,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 488be6afd999..141704512b3c 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -402,6 +403,34 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 	return ret;
 }
 
+static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
+{
+	struct iris_inst *inst;
+	int ret;
+
+	inst = container_of(fh, struct iris_inst, fh);
+
+	mutex_lock(&inst->lock);
+	ret = iris_vdec_subscribe_event(inst, sub);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int iris_unsubscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
+{
+	struct iris_inst *inst;
+	int ret;
+
+	inst = container_of(fh, struct iris_inst, fh);
+
+	mutex_lock(&inst->lock);
+	ret = v4l2_event_unsubscribe(&inst->fh, sub);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -427,6 +456,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
 	.vidioc_g_selection             = iris_g_selection,
+	.vidioc_subscribe_event         = iris_subscribe_event,
+	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1



