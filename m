Return-Path: <linux-media+bounces-25574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2EA258CF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B2918895C9
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C274205E02;
	Mon,  3 Feb 2025 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EL7wCEHR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EB32063DF
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583772; cv=none; b=cXmAxrAKaemT8iuFFtfD2aurXlnu6TbecLIaWIV15vBRcdtTBwnJxUaQuWc03UG4Cbb28ZEP6b2Umtiw4bt6fzY9i3B7SvRmjMmYRFvk9yMMyTDUbECWor5faXCW5c5F1SrA0TyqGMHFl5oWkQyyPga1W8Hn3xvT+FbMmK+crhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583772; c=relaxed/simple;
	bh=XDJx0T33scoarv55Ada/16pLsRQJjIA/CdDzzum4e2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDBhnXq1k38m4A50oW1j2KBP/lojWaIYC7ryKzsWxMjuU4IDWsF+qjGH23wUSkCmEwjDiCy+rPcOBVgGdbJHcCes3QPrC0IDJbL/Uj5ZtzJq9rZOIk0ejjt2qqmByEBy4hKwzN4U1T420F/ogw1a7ZRkiCfgZXvMgvsN8GYas5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EL7wCEHR; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5161d5b8650so1213991e0c.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583769; x=1739188569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCSuaKj/Nx5vcwnNqpNliqFOdiZqLoZIJ7Krw5nQYZo=;
        b=EL7wCEHRDdMtvAMMZN9/cRSoajjzY4EEht2dtVQPMKfmPfGCJ8j27/8nu4G4IMG5Yt
         K/Vuln37L++o7WnbTpihMzxvP+cGzIaYU5Bm6KK/Xt8HYwpdrGreIjrCUGEhqdK2P+rr
         +ZwTAI9B1mcfWL+kciN/u/JjQFHDCjtXRdysY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583769; x=1739188569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCSuaKj/Nx5vcwnNqpNliqFOdiZqLoZIJ7Krw5nQYZo=;
        b=QeK9Lr4id3wb7fFWo7QYfmxTDfQe2C93HqGMJd/eigixO6KX3KCRqJuHWstMVJMG1c
         7kqFkl+S0E7kLuVXSq/z1+PtgplxULOCG+JQVHeOJf+df4djgI4jHxoH38MsYRbiigLg
         t7D/zECcinMuLUBb+YslerEenSnjQPCNQQzaFiP6hNlXXK8AJSxsRMSQNzeLFEXTFpwh
         X1xOboNqVjYGy+Hmo0AusR00rIVXMHh6jKpeWajqVC3QySw+k3RFzooqeq812HFEA5RT
         jtQiXJ9Mtg/BAU6l5yDAk5b+ZN4Vt5DfLQSmr1caqUmRy0UdtjdMp3BVt8TP4TTdCNdA
         Vb/w==
X-Forwarded-Encrypted: i=1; AJvYcCUYQl92zqSovFbDqqzr+EhkTqLHfHEuL+8tXpHD2MWFZ1F+BDd4kHngtlv98elzy/tdhqYsG9n4A7vf/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIGn9zVhJQ3yrNM+IUSuzwVkeXcIW8L3pstPiGTK2XQCqdzCE
	VxWUXzK3YGKHsrB9rcz9RhegdyUsalqqetaLPZnzulb1pCEjW54jMksvyqvVZw==
X-Gm-Gg: ASbGncvHLBtPhBA7D0bbAgtgvfceCfbvJJLJMMlndjkvHAvlC6YqmiEn5CUdF0n3DEe
	b1+uLx5jA8q8dJ4vKOTXE+g4YLYoVTBZ9C8uw/zHjCrilON1yR1maM23qy4H4qGTwi5xbDg9EdJ
	pQI11+5Dg9EfKxbGaonPQaqO9N12yb74YOmt8xlqY5cK6FXd+XbsJ3baRHVuLGm9YDqPy75S/Sr
	7xkUa554cWdGWki7qVF0pihtOn4+EYRW5SL0l0qlk/ri1jBSLgYhRKP1F87Ty2Ze+2EH83nfW7e
	2RnPi3aRhV0Khk1tNwPdtGN2sKdqdoneAiYQ+uCHTGiPGIBAAffKZ/fRynTWvCJrvw==
X-Google-Smtp-Source: AGHT+IGiKPkKkCdl8AzBK7lyBxS49xfhaKnn9hD0wU8c+BzhADHjxPcS/3Jvh90K0/wtUXUuHzQKJQ==
X-Received: by 2002:a05:6102:2926:b0:4b6:35c4:6fcd with SMTP id ada2fe7eead31-4b9a4f1d458mr15145086137.7.1738583769361;
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:49 +0000
Subject: [PATCH v17 13/17] media: uvcvideo: let v4l2_query_v4l2_ctrl() work
 with v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-13-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

v4l2_query_ext_ctrl contains information that is missing in
v4l2_queryctrl, like elem_size and elems.

With this change we can handle all the element_size information inside
uvc_ctrl.c.

Now that we are at it, remove the memset of the reserved fields, the
v4l2 ioctl handler should do that for us.

There is no functional change expected from this change.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 ++++++++++++++----------
 drivers/media/usb/uvc/uvc_v4l2.c | 35 +++++++++++++++--------------------
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e29db334b2d..d50137d19561 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1259,7 +1259,8 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 }
 
 static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
-				u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
+				u32 found_id,
+				struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	int idx;
 
@@ -1407,7 +1408,7 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 				      struct uvc_control *ctrl,
 				      struct uvc_control_mapping *mapping,
-				      struct v4l2_queryctrl *v4l2_ctrl)
+				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
@@ -1473,7 +1474,7 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 				 struct uvc_control *ctrl,
 				 struct uvc_control_mapping *mapping,
-				 struct v4l2_queryctrl *v4l2_ctrl)
+				 struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
@@ -1511,6 +1512,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
+	v4l2_ctrl->elem_size = sizeof(s32);
+	v4l2_ctrl->elems = 1;
+
 	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
 		v4l2_ctrl->default_value = 0;
@@ -1524,7 +1528,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 }
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-	struct v4l2_queryctrl *v4l2_ctrl)
+			struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1650,7 +1654,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *mapping,
 	s32 value, u32 changes)
 {
-	struct v4l2_queryctrl v4l2_ctrl;
+	struct v4l2_query_ext_ctrl v4l2_ctrl;
 
 	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
 
@@ -2175,7 +2179,7 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 				     struct uvc_control_mapping *mapping,
 				     u32 which, struct v4l2_ext_control *xctrl)
 {
-	struct v4l2_queryctrl qc;
+	struct v4l2_query_ext_ctrl qec;
 	int ret;
 
 	switch (which) {
@@ -2189,19 +2193,19 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
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
index ff7d0fd9e458..41430720ed47 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -963,40 +963,35 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
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
index 2f9a1bf8b48a..6fc1cb9e99d1 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -771,7 +771,7 @@ void uvc_status_put(struct uvc_device *dev);
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-			struct v4l2_queryctrl *v4l2_ctrl);
+			struct v4l2_query_ext_ctrl *v4l2_ctrl);
 int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
 			struct v4l2_querymenu *query_menu);
 

-- 
2.48.1.362.g079036d154-goog


