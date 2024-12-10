Return-Path: <linux-media+bounces-22998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FF9EAC23
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3317028FA66
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10107226527;
	Tue, 10 Dec 2024 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vg78lIx0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D2C223300
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822952; cv=none; b=RHoR5r2+7eiYTnWV8qipihrGz/Ng3nmVrL9EcpVittd4itoPjcPAv8StzDeMdAIqD3oQsNqol3cqy+yEMQCtf4bL83GtZtUfsaPZrRdFVsholuizLG1GUwE1bp8INtpx8zeyEvf/qMlF0AQpJ5WyXnG/MD6VxeIxqjtZuqTDPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822952; c=relaxed/simple;
	bh=w7J6GH74FD94qUt1WS+yjzRqg4NaeMgHNEi8UiOgVn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1zC9slSQylE0ZXnIE5uYL9dx/ucqsVsVlG3YNMGgIo9c2gnqZh2YsVojA/WD4WSZv5YCpSNeklpmFqBpgMtJ2bCeo6f+zdaEHhfgQuLAI2GhTtRzLpI6lhbuY0wZXp1xASXosgzVx5m0Cf16fozKC5IvzK2sLD5OEuBc4wIuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vg78lIx0; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46677ef6910so47750281cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822948; x=1734427748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y//l0kib7ot3BmgnrtGvxoIcjefJ0s0WEOD2mlbXDKo=;
        b=Vg78lIx0/RD5K8tXoRwFSDourh3Q6ZGtVxChPDjsTW/MJbzr20L+GUKGYjFlv7J00a
         pkIDktVd3RYDAD+y4BF2FGJezB/LRE9iHi7ew+GbO/UyIGupNBARcyvk7kjY6z7xiPiK
         iKGcPBdfM4TtEf0W9UL3+gVx/ZaWrRCrdqi+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822948; x=1734427748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y//l0kib7ot3BmgnrtGvxoIcjefJ0s0WEOD2mlbXDKo=;
        b=p56ewRef0MnTvbTyzplgU3sa9dG8tTX66qowwcC6lb9SQ5lXnYaUSJx3YMfJT1wd9q
         xme+D16KXUm8RLTHYV4gQMTswLO8d2/WA+VCrGoUzzRoF1AiSTZuh+pTGAjHik7RcULm
         hdp4VyHd84Xrvtdy0rD7QKKiTBhTyRVHA6pfysR6SvtwJAz2Borj3UO8m9MJjRH6U32s
         lDqVwh2meWxxAmf1hydPWKcb2iNMxdy/b5Hos2l13UpzKyllDMcNLhRfKphfeS/Vdh5x
         XE/OmfelXcKRS1K51DfTJmEJZ3TgwVOtfHWJTutemgcCsurCqrIahOSfq+bfdejE84jj
         c/RA==
X-Gm-Message-State: AOJu0YzxDm+bG3i6rTWvO2r8/rrQzdH7vgCsjW2M+dDfEi2c26v9FL/d
	6a2kOjV9HV30/i2KyZNzvlCBc5x8ksdry9O9ssxkcRPuCGScLScFhrAxsUzSJA==
X-Gm-Gg: ASbGncsbwEBdr+TlLJJ0DJLoX5wBSPql5TGQisf0AZEYByRpkNBaBEdHfGnaRzRSqb2
	HQWjmZrEIhMOVJ8kaHyGqFtsP2eN1Ux1/sF8Z+LDUjMZ4ENMVYl0Fkgty5ae+dI564Hdv07aZ4E
	5RRXhqu5IurOXSukYfHA7/Uqh61GIaN+/e09rJrxfcQQW5HzvUUnSwsjM6absF327i4kuu3TyAt
	YAiY58xi9F0OY7ZD67O1gUk35X1kCff4ucwFlsz+QHqsXTGaoENR6OIHbHvZVHp0+J/u1MFf3Q8
	Y+LpYWTXYuk+cKOJsUw2qRzC8xAa
X-Google-Smtp-Source: AGHT+IFf9kYaWa576VrO6wskX+9beQZ8FmZVkS93oM2U3Ri0fbfJz0ugCHR5677iLTfU/+g8oDAzSg==
X-Received: by 2002:a05:622a:110:b0:461:2150:d59c with SMTP id d75a77b69052e-46771eac17fmr59619831cf.9.1733822948169;
        Tue, 10 Dec 2024 01:29:08 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:55 +0000
Subject: [PATCH v2 11/11] media: v4l2-core: Introduce
 v4l2_query_ext_ctrl_to_v4l2_queryctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-11-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We use this logic in a couple of places. Refactor into a function.
No functional change expected from this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 51 +++++++++++++++++++-------------
 drivers/media/v4l2-core/v4l2-ioctl.c     | 28 ++----------------
 include/media/v4l2-ctrls.h               | 12 ++++++++
 3 files changed, 44 insertions(+), 47 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 95a2202879d8..9dd2bc5893dd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1123,39 +1123,48 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
 }
 EXPORT_SYMBOL(v4l2_query_ext_ctrl);
 
-/* Implement VIDIOC_QUERYCTRL */
-int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc)
+void v4l2_query_ext_ctrl_to_v4l2_queryctrl(struct v4l2_queryctrl *to,
+					   const struct v4l2_query_ext_ctrl *from)
 {
-	struct v4l2_query_ext_ctrl qec = { qc->id };
-	int rc;
+	to->id = from->id;
+	to->type = from->type;
+	to->flags = from->flags;
+	strscpy(to->name, from->name, sizeof(to->name));
 
-	rc = v4l2_query_ext_ctrl(hdl, &qec);
-	if (rc)
-		return rc;
-
-	qc->id = qec.id;
-	qc->type = qec.type;
-	qc->flags = qec.flags;
-	strscpy(qc->name, qec.name, sizeof(qc->name));
-	switch (qc->type) {
+	switch (from->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_BOOLEAN:
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
 	case V4L2_CTRL_TYPE_STRING:
 	case V4L2_CTRL_TYPE_BITMASK:
-		qc->minimum = qec.minimum;
-		qc->maximum = qec.maximum;
-		qc->step = qec.step;
-		qc->default_value = qec.default_value;
+		to->minimum = from->minimum;
+		to->maximum = from->maximum;
+		to->step = from->step;
+		to->default_value = from->default_value;
 		break;
 	default:
-		qc->minimum = 0;
-		qc->maximum = 0;
-		qc->step = 0;
-		qc->default_value = 0;
+		to->minimum = 0;
+		to->maximum = 0;
+		to->step = 0;
+		to->default_value = 0;
 		break;
 	}
+}
+EXPORT_SYMBOL(v4l2_query_ext_ctrl_to_v4l2_queryctrl);
+
+/* Implement VIDIOC_QUERYCTRL */
+int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc)
+{
+	struct v4l2_query_ext_ctrl qec = { qc->id };
+	int rc;
+
+	rc = v4l2_query_ext_ctrl(hdl, &qec);
+	if (rc)
+		return rc;
+
+	v4l2_query_ext_ctrl_to_v4l2_queryctrl(qc, &qec);
+
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_queryctrl);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index aa31678fb91e..ca89880b1359 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2302,32 +2302,8 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
 	if (ret)
 		return ret;
-
-	p->id = qec.id;
-	p->type = qec.type;
-	p->flags = qec.flags;
-	strscpy(p->name, qec.name, sizeof(p->name));
-	switch (p->type) {
-	case V4L2_CTRL_TYPE_INTEGER:
-	case V4L2_CTRL_TYPE_BOOLEAN:
-	case V4L2_CTRL_TYPE_MENU:
-	case V4L2_CTRL_TYPE_INTEGER_MENU:
-	case V4L2_CTRL_TYPE_STRING:
-	case V4L2_CTRL_TYPE_BITMASK:
-		p->minimum = qec.minimum;
-		p->maximum = qec.maximum;
-		p->step = qec.step;
-		p->default_value = qec.default_value;
-		break;
-	default:
-		p->minimum = 0;
-		p->maximum = 0;
-		p->step = 0;
-		p->default_value = 0;
-		break;
-	}
-
-	return 0;
+	v4l2_query_ext_ctrl_to_v4l2_queryctrl(p, &qec);
+	return ret;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..83b84cb5cf06 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1404,6 +1404,18 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id);
  */
 int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc);
 
+/**
+ * v4l2_query_ext_ctrl_to_v4l2_queryctrl - Convert a qec to qe.
+ *
+ * @to: The v4l2_queryctrl to write to.
+ * @from: The v4l2_query_ext_ctrl to read from.
+ *
+ * This function is a helper to convert a v4l2_query_ext_ctrl into a
+ * v4l2_queryctrl.
+ */
+void v4l2_query_ext_ctrl_to_v4l2_queryctrl(struct v4l2_queryctrl *to,
+					   const struct v4l2_query_ext_ctrl *from);
+
 /**
  * v4l2_query_ext_ctrl - Helper function to implement
  *	 :ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl

-- 
2.47.0.338.g60cca15819-goog


