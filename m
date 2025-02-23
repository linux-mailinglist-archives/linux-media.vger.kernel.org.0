Return-Path: <linux-media+bounces-26730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B8A4113E
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C73481745AA
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07659210F5B;
	Sun, 23 Feb 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AoF3Ah7B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C120F094
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337186; cv=none; b=aw3/WxCmj/2TIXoekgRfs+rWlBKfos36oduj63ebc/za10TncIk9U6Q3ELc2AMB/QPSadM0j7m6816LuLxnMh6ORvVjDYk3g8qTjIAdVDh8MJNk6JVki573+8KJnZidZX2YedNPql66JMrBM86rbS8HOgpvn586yHQc6tHGJoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337186; c=relaxed/simple;
	bh=bGURjosegTH+P+Gw5HjXH9uRa5Uc4pPh6VYCjWY0HAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuAxo/fThJ8jJ0O7tCMoS0UGPbGLL4xq2VyopxdJZSjyGF8hm0GFEbL+9kBudNTgGNvrmEvyI12DvmG0vccbqC9pVXpVZpVFlybXO/AIrcIo9fH51Hh5bT9rVNpZN4NPR5/5TcQo3/7r6PCHjnJUmBbiLGuuTUp49//aAeL8HWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AoF3Ah7B; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c09a30e14dso656314585a.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337183; x=1740941983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXG9+uuGWmSBcxIUkNXdZws6nfJZHCT+9+MDo1/1sYc=;
        b=AoF3Ah7Bd0avw5HDqt/QWWl5DVcCbjnrANUvtWsmleOc11P2RE2/hmqujGDL97LzeA
         WOJoZpIZeX04ArP9AiSPt+PzImZdJfl7fhX5Ubn+AylnmaiofnUvPsybXl1JYr6lX86H
         4nM5t9ox2Zvp7eZCNTqZtnPooYrqdVV7Qg8+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337183; x=1740941983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXG9+uuGWmSBcxIUkNXdZws6nfJZHCT+9+MDo1/1sYc=;
        b=rY0u8Kx88vfde0oDcvRMSioCCYgerIY3CELxHLCT8H1cZBSB8qjhQCu4j1LtmgOYwt
         UCwqgWnc5kK/8qHqRCyxvnYTk61oyvMn6Xya9SQunGBVgDvWWkojbi5bvkV6UwfZ1fSF
         6LutZWQObqdaTg4jNFWrvhOdHoPz5jiKPISMSM9KZy3fO8avp2HDYBpyKHwxxk4slYWu
         kempPwX5IgfdGhmQUvkecmsEUksZiLJymvy1fRh583BSkwuqZsrEwLjs8ELaY60phJQR
         4OGEbY0LFTcI9fiiQKyoGTRBTVORjdmUBlBXet5aMOqLLicQvKmr/O+2ORYbfSe3dd+z
         4fzQ==
X-Gm-Message-State: AOJu0YycVVXiQlCxicBF7KgKVtO1ZPxfIwMllxftHwJGsTfsV4hEwhU5
	BHVhdDdrDTJt0Cfhk0KSxlzVweYUDmqyT2xNC1K4kVfwWdRG1rsVe4/lGeHacQ==
X-Gm-Gg: ASbGncv569hqqQB61O0z8Ro4UMc1jOkzndgXCwr1Ya9psSC01u9jLJ2nBfjBTKdItuO
	v8C8YU4QD+eDxhqioTdt1tQuoTfOo2hOr+zqCFOkBjZLajMwANgkv/d2WkUnqDhG2+Tp5us19ci
	d3wZitpqLZHcLAyaLpvVS+LrFYlnt8/M1e7bK2I3GRXTW8lCpK6pGn8zPje0QmtBuh0zWknr/bx
	tJiu8trLgzQNACjk5bPEvx1fwn7FwAPhaIIl3tXW6KZSB1PAo9Q80YtbORp41HHj2d/ww12yqBV
	1lOmrNhazEQBmbfFVMN7soCoe0bQpjYRE2ds/qm3xo4H7KDgOoF26SZQ4Dof0G4IhG7+qp/XmrL
	g01g=
X-Google-Smtp-Source: AGHT+IGjHh9bP3Z1R0+XLoulszUD7WhUuuTZdPXT1kOhHNmPI8BbzEJMwqu44jAaJET9UyJKRwaG6w==
X-Received: by 2002:a05:620a:450c:b0:7c0:b5bc:a122 with SMTP id af79cd13be357-7c0cef55f43mr1666469185a.35.1740337183095;
        Sun, 23 Feb 2025 10:59:43 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:14 +0000
Subject: [PATCH v3 11/12] media: v4l2-core: Introduce
 v4l2_query_ext_ctrl_to_v4l2_queryctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-11-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
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
index fea53b419351..4e15ef4840b0 100644
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
2.48.1.601.g30ceb7b040-goog


