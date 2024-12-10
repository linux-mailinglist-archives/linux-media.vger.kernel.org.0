Return-Path: <linux-media+bounces-23014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E868A9EACD5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4400F16B86D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC64225405;
	Tue, 10 Dec 2024 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bxXFqYYo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB7D23875C
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823786; cv=none; b=OR8CUXJZJQ67m6zmmGQZ0U4faqVGRuuAGda1UACJ9CNkcWp7cJMl8JaINJmAJESI7KBfsdJXCAbV3emUapodB+5KRLt1udARpF8urEP5Q0JbuRhXh7VJt7ayk1U2LP6AF+2f/CpRJm90c8kzn8AWGva24CA4pFdb0IhqlYQhDSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823786; c=relaxed/simple;
	bh=yqji/xzHYuOsoD1S6Hj7O2pucPqwN31k/pN+iJwwrO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJzDQ7xssgDBBfVhuja+fccF7Yb91LOOAspVWJyiDo2OvcLdJE8OKhvJr2Sf4s6kdko7WaUOo0yhiRCOPqgZBIZRbaIHuGClQzDL6elfnHuaXcmymB+TBMXF/w5dy3vFzRVEXLqoc6Mvg3owRjyvW0Ceid0YlLyJAoZwUHloihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bxXFqYYo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6da2d7884so111336185a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823783; x=1734428583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4DLEGpbxISaKGwkcSnN6qP20jbOjfnGAGZ1UU5NuHw=;
        b=bxXFqYYoqvjs5zW7e4ZRCQ/k4PuhewxRGQKvY+oXka+LKcTijAqk4YXRg7VKky9gjb
         3iDRnTuzjl4716iI1vo+HJGFVb6phuQUsuLgbPSdivtp3be9Xd5KJP0bJz4HAWloMXfL
         J91+4uKvkFHvwJSYRC65t2nnQG5via4HM7RXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823783; x=1734428583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4DLEGpbxISaKGwkcSnN6qP20jbOjfnGAGZ1UU5NuHw=;
        b=P9evEGM9thNZt+mOiSfljkNiDrnYt/R+ikHngPJq+PJ0i2wYPN1tDbJMAk1oZrwjhR
         CqCkOjH9o9nsWQ1afCVraBgdQlqyxgzU7RRI9TAvzduNhS8f0YI0FDkyz+fvPCDo/qUu
         cJC4CZD5OnHfdNxYkdpOyfAJrMZ9dPuyEw6Orr54Vt1aujbRAbGN9jbydb46g9VIzTyO
         9whayit0xyAncxRzjt4S6rPZTt1PtN34QFa9ROYm1gDkN1WJVWVS3DE5akbIH+MPB6BG
         C9+Vs82eLbkzVKIW5yegDS0gkDx3XQbG/VfAYyouVkIpWfm0DqSRsJLVuOvt3PIMVJka
         WfYA==
X-Forwarded-Encrypted: i=1; AJvYcCWDCsSjdpWPk//mpN4WvhnbZXEp3vnr3E0PZrOGXyc+8xaDrKh1pZoKNaUQJ9/GRmhf+oeTKLcTtgRKGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX63nz1JvrQ2vymT/QfR0fEEhfDxhqiZ1t6hMBVYHt2UMjz9gP
	PYQmiOfBWr4a6m2hsKzelKAeKznnYL8E4htG40UINGlCTm3G/wl6wLSWmsfsXA==
X-Gm-Gg: ASbGncvufZOf3wL05JFyEZhrNJmM9Z+cA8KXssdakrAAN3TYA3BVLsQfxTxZuC9g4T3
	JnLznN2Dp2zskrWwd7LQ9ZmxYGQKs82fAFddWLh9d/HhnxInaQBcmXWlBdIOM373rRwP3hWoDi+
	fClA3wcOgjVss6V/vC6KunV+p9ot2R/clTns1AslB2SqMVmw/kbluMJdSuBkhELJRO6P8CXVQM+
	E0mS/3MlmkkRHwtTpQ2zra5oi2MpiIdzI7kZ5cUjJaLdU46QQyVjfyy3bqbN7r7g3E6zZsFfgEf
	owCIQmfGSUjzD2mcKo4XOPVS8vfq
X-Google-Smtp-Source: AGHT+IGDLwVPsYRL6IYDVi5Q+ZWF5oyLjYiYvYAuxK4fkpF2rSBiWjqmp7rVZEHZCpZBZUq7IJEJPQ==
X-Received: by 2002:a05:6214:e6b:b0:6d8:848e:76c8 with SMTP id 6a1803df08f44-6d91e442686mr68091406d6.42.1733823783400;
        Tue, 10 Dec 2024 01:43:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:50 +0000
Subject: [PATCH v16 14/18] media: uvcvideo: let v4l2_query_v4l2_ctrl() work
 with v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-14-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
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
index 14aa9619fbf1..58bd42191f3e 100644
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
 
@@ -2132,7 +2136,7 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 				     struct uvc_control_mapping *mapping,
 				     u32 which, struct v4l2_ext_control *xctrl)
 {
-	struct v4l2_queryctrl qc;
+	struct v4l2_query_ext_ctrl qec;
 	int ret;
 
 	switch (which) {
@@ -2146,19 +2150,19 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
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


