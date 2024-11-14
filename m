Return-Path: <linux-media+bounces-21427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8B9C923E
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90801F22CA5
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FB51B4F09;
	Thu, 14 Nov 2024 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JSmZXy4k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF771B21A8
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611462; cv=none; b=iPu4bu1JT2PUh4GjzgLufXow3o+omlpZabTfBjtBXPfPmYdmbRpbb25YcTqZqdlwrgSlhnT4U4E5aWaWABphi4qG6gV+sW7qtYlNmeXVbArNh0bXlM4ND9SmXyGeCqbGT2m+l3Z+pclW50PfMYltE7mZUxXasTbaz0UKk3vzajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611462; c=relaxed/simple;
	bh=n/4Gw/F5XfVHHXJLIJrOKVEwWJwN5RkWXSV5JexAt0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXwyYbAWnOTY0YL3H3FwwAPpVWUBamjyZbTgNMh/7KKIDVuaOLPptwqECT5vAzgY9ActAI0+LNDEcBEd5VTZFd5n4zpIrFBesKyFIx8utJvFVwQzklcOlr7qJ3pNIJWQU3YcXEw625Kl74/HFhl3qx37I6Z93kC9DOhbHg5Rfjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JSmZXy4k; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d396a6f6aaso5730856d6.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611460; x=1732216260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZTsTBSX3xSqfbyzm7VG5yBnJ19hpAWauNKzKGES8go=;
        b=JSmZXy4kQh2zencrvQY7/jlz/S/7ZaxKpkQfuaocOeddYHz6+FpY5yiwkk7m0agnYg
         0yOFxOEPVTxWUTrqCwoWcOFRVxyRlU1gLEda6BMLe/nU/HH1GXPwkPCQ9A939scyAwEV
         3A8NmFeNbB+5YpLZe1avkCXCfC07i5qtrinUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611460; x=1732216260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZTsTBSX3xSqfbyzm7VG5yBnJ19hpAWauNKzKGES8go=;
        b=gxCPRUxV/XSqBrziKKjqL6YckFNp2KxZ8OWliM5YfJU+gdIcOZ3nlmf9tFiGkHwvNS
         28jlcJvCVFBWTFsrsVxmGz7S0m6y0T5mBcBeZp+5zqmURbTfG9SBIgOjOjgmyAocmVG2
         Jqv0tLe2OAy3HkrATT1vimZp49c8nSDj6+QWaILHczbyt8VQwXjMaUJBG9LZSvzVx9ys
         BTyBlA0eXfcEkkwJsW838fwTE8PEn4bKQE1rmBg+HYNQ8ZFAeRbaaEd5GIr12yb9MSXe
         HLXA2r1iGDntIGcvjuqoRwEIhwdEcg5owr78DZHPDXBuhusk5WJpMWwSEQrxFE+uoNnJ
         aO2A==
X-Forwarded-Encrypted: i=1; AJvYcCU4G+8ZAlaczOiZZEBP9gTOpwAuRiXupZ54RSemYXJ8KAyz4f+/Z+vhCpAK5YtF+HARLN9I9ap5YQRhjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywia/Nlyx3i2XGIlBDzu31a81kzky4Vy6gFwjQ/PSSlPqmMHrAo
	PZbsWWYT6dlSTD1MbRM96YfznNFqUciWvCVFQCu8wp2P5piV80WoxJxP8Nj48Q==
X-Google-Smtp-Source: AGHT+IFYqBJZtMtZqxRLn7uD+s+ZXDgMbRIudST+4D8WH8SdJFFNexVMkL2sBDlUhnEMyT9YcUtkFQ==
X-Received: by 2002:a05:6214:3bc2:b0:6d3:941a:2274 with SMTP id 6a1803df08f44-6d3edcfbae4mr40292716d6.22.1731611459925;
        Thu, 14 Nov 2024 11:10:59 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:44 +0000
Subject: [PATCH v15 15/19] media: uvcvideo: let v4l2_query_v4l2_ctrl() work
 with v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-15-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

v4l2_query_ext_ctrl contains information that is missing in
v4l2_queryctrl, like elem_size and elems.

With this change we can handle all the element_size information inside
uvc_ctrl.c.

Now that we are at it, remove the memset of the reserved fields, the
v4l2 ioctl handler should do that for us.

There is no functional change expected from this change.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 ++++++++++++++----------
 drivers/media/usb/uvc/uvc_v4l2.c | 35 +++++++++++++++--------------------
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 72ed7dc9cfc1..1bc019138995 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1252,7 +1252,8 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 }
 
 static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
-				u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
+				u32 found_id,
+				struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	int idx;
 
@@ -1400,7 +1401,7 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 				      struct uvc_control *ctrl,
 				      struct uvc_control_mapping *mapping,
-				      struct v4l2_queryctrl *v4l2_ctrl)
+				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
@@ -1465,7 +1466,7 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 				 struct uvc_control *ctrl,
 				 struct uvc_control_mapping *mapping,
-				 struct v4l2_queryctrl *v4l2_ctrl)
+				 struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
@@ -1503,6 +1504,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
+	v4l2_ctrl->elem_size = sizeof(s32);
+	v4l2_ctrl->elems = 1;
+
 	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
 		v4l2_ctrl->default_value = 0;
@@ -1516,7 +1520,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 }
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-	struct v4l2_queryctrl *v4l2_ctrl)
+			struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1642,7 +1646,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *mapping,
 	s32 value, u32 changes)
 {
-	struct v4l2_queryctrl v4l2_ctrl;
+	struct v4l2_query_ext_ctrl v4l2_ctrl;
 
 	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
 
@@ -2119,7 +2123,7 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 				     struct uvc_control_mapping *mapping,
 				     u32 which, struct v4l2_ext_control *xctrl)
 {
-	struct v4l2_queryctrl qc;
+	struct v4l2_query_ext_ctrl qec;
 	int ret;
 
 	switch (which) {
@@ -2133,19 +2137,19 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
-	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
+	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qec);
 	if (ret < 0)
 		return ret;
 
 	switch (which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		xctrl->value = qc.default_value;
+		xctrl->value = qec.default_value;
 		break;
 	case V4L2_CTRL_WHICH_MIN_VAL:
-		xctrl->value = qc.minimum;
+		xctrl->value = qec.minimum;
 		break;
 	case V4L2_CTRL_WHICH_MAX_VAL:
-		xctrl->value = qc.maximum;
+		xctrl->value = qec.maximum;
 		break;
 	}
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7e284770149d..5000c74271e0 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1014,40 +1014,35 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_queryctrl(struct file *file, void *fh,
-			       struct v4l2_queryctrl *qc)
+static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
+				    struct v4l2_query_ext_ctrl *qec)
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_video_chain *chain = handle->chain;
 
-	return uvc_query_v4l2_ctrl(chain, qc);
+	return uvc_query_v4l2_ctrl(chain, qec);
 }
 
-static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
-				    struct v4l2_query_ext_ctrl *qec)
+static int uvc_ioctl_queryctrl(struct file *file, void *fh,
+			       struct v4l2_queryctrl *qc)
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_video_chain *chain = handle->chain;
-	struct v4l2_queryctrl qc = { qec->id };
+	struct v4l2_query_ext_ctrl qec = { qc->id };
 	int ret;
 
-	ret = uvc_query_v4l2_ctrl(chain, &qc);
+	ret = uvc_query_v4l2_ctrl(chain, &qec);
 	if (ret)
 		return ret;
 
-	qec->id = qc.id;
-	qec->type = qc.type;
-	strscpy(qec->name, qc.name, sizeof(qec->name));
-	qec->minimum = qc.minimum;
-	qec->maximum = qc.maximum;
-	qec->step = qc.step;
-	qec->default_value = qc.default_value;
-	qec->flags = qc.flags;
-	qec->elem_size = 4;
-	qec->elems = 1;
-	qec->nr_of_dims = 0;
-	memset(qec->dims, 0, sizeof(qec->dims));
-	memset(qec->reserved, 0, sizeof(qec->reserved));
+	qc->id = qec.id;
+	qc->type = qec.type;
+	strscpy(qc->name, qec.name, sizeof(qc->name));
+	qc->minimum = qec.minimum;
+	qc->maximum = qec.maximum;
+	qc->step = qec.step;
+	qc->default_value = qec.default_value;
+	qc->flags = qec.flags;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index f429f325433b..8aca1a2fe587 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -766,7 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-			struct v4l2_queryctrl *v4l2_ctrl);
+			struct v4l2_query_ext_ctrl *v4l2_ctrl);
 int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
 			struct v4l2_querymenu *query_menu);
 

-- 
2.47.0.338.g60cca15819-goog


