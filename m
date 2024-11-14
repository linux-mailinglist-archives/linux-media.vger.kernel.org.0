Return-Path: <linux-media+bounces-21425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0999C9239
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E451F23A2F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BBC1B21BA;
	Thu, 14 Nov 2024 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ALzoruBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF5A1B0F07
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611460; cv=none; b=ddajz8NtJLODHXpvMIReg6l/vBUHtj7+8Tt74/5MP3/W1/N679O7KgSrq6/rh54qw+YFr5g2sOth49ciIHNEEFwrF9TYOfaMNtV/rNjiiu1NRNAgXleGomhGs+prGhfJfDAEkwtOfawDI8vxdfQSHPstYXg9ay0/6EQVSNxJleQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611460; c=relaxed/simple;
	bh=4aYM1mbytyfhEDw5uHRi4COv7820Z421epIB62xgYEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOspYlBBAIk9CPKrfsYJ4YiJwub6uXyY93LYalbwans/Pkq58FZnH35psknuL9qDdHf5HKSs7vHxi8021+mY4hGU3Jr7HZ0M6wp11Nodj5u0liifv9XP36MWhhrU5dA6xkyxVGlFdhttFwd0mq0DZcTm2KgpKHUDmrjwIXozpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ALzoruBC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b1505ef7e3so55536585a.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611457; x=1732216257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8MY237UnOQ4N6VPhfi4yBpSwxWA8VpuxHQS0Imk3bI=;
        b=ALzoruBCqhIzyK0bOZD085jdLnGIFt9QThX8E1RJ6DGqnD/7dFuMeGmogBdf/TvY7K
         4JkX2v3nx8Dd1Y0flbjE8C4OS284bWzGQfh/5iNsHUcYF6NDrbF/vLAKiX3EhsuySFwl
         0wlldB1YmM6Mwa3PgA0sPDftEthJVMXuLVKic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611457; x=1732216257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8MY237UnOQ4N6VPhfi4yBpSwxWA8VpuxHQS0Imk3bI=;
        b=o0YI8QW+vmlqsi0T17evL1yfZPLarSah6zfLR/rVdA60FBFzRoAfY+Ms2s5WgcCmuW
         Qyce2FKSTGner4wRE4bl7QCrk8GOEiOGV2xJMzf9jyeV4zmCJb65NQJj4iFF45KUqtNP
         1TqeDaVyOV9301Kb2c8in3YcFUQQVPhaOS06LybrDN+1gaQJPZJemyDr2IlIElKSEhW3
         sSfnCfBsjWVQGJanh7qC3d2EfvnHu/kgmMkiqeYCfjZkCSu1rUxC2TkcogPsqcuwgrnK
         GLqzsKiUPzBUtLxWU8dERqJb5o3mtx7RZgVUJ2AHf6dsWpHlaJb6y5b79V/Urx4XWnHL
         1VhA==
X-Forwarded-Encrypted: i=1; AJvYcCVjfTetXeSqs4EcMIu8lEVGKurWD8Tei/B1ibz1eJVSp8BTGZr8CsPaIhAV2gym6Ol+fwm9ZfkKkRbj6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyelbXxYeYrt68pBUfeD4KqhkeFXhyablKVkG+Dfpu4QZueYNZm
	QePQ0coZtk50xPeReUn7eokNwYIC3+wOS3W1fBv2pOq7Qj5fa6Cg9NvKT9jKtA==
X-Google-Smtp-Source: AGHT+IHOpcHqAe4+KizmjW3hadP4zp2qAPzG6XrwFdFi5tBVwuyu9biAEH+KtWKsGqgG0uqhKgvgUA==
X-Received: by 2002:a05:6214:540e:b0:6cb:afe7:1403 with SMTP id 6a1803df08f44-6d39e2006bcmr322753126d6.48.1731611457638;
        Thu, 14 Nov 2024 11:10:57 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:57 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:42 +0000
Subject: [PATCH v15 13/19] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-13-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is needed for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 96 ++++++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 +
 2 files changed, 79 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b591d7fddc37..0dae5e8c3ca0 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1270,6 +1270,37 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping)
+{
+	if (which == V4L2_CTRL_WHICH_CUR_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR);
+
+	if (which == V4L2_CTRL_WHICH_DEF_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF);
+
+	/* Types with implicit boundaries. */
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_BUTTON:
+		return true;
+	case V4L2_CTRL_TYPE_BITMASK:
+		return (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) ||
+			(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
+	default:
+		break;
+	}
+
+	if (which == V4L2_CTRL_WHICH_MIN_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN);
+
+	if (which == V4L2_CTRL_WHICH_MAX_VAL)
+		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
+
+	return false;
+}
+
 /*
  * Check if control @v4l2_id can be accessed by the given control @ioctl
  * (VIDIOC_G_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS or VIDIOC_S_EXT_CTRLS).
@@ -1288,7 +1319,6 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
-	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
 	s32 val;
 	int ret;
 	int i;
@@ -1300,10 +1330,10 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!ctrl)
 		return -EINVAL;
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
-		return -EACCES;
+	if (ioctl == VIDIOC_G_EXT_CTRLS)
+		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
 	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
@@ -1451,6 +1481,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
+	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
@@ -2037,16 +2070,18 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 
 	switch (which) {
 	case V4L2_CTRL_WHICH_CUR_VAL:
-		ret = __uvc_ctrl_load_cur(chain, ctrl);
-		if (ret < 0)
-			return ret;
 		id = UVC_CTRL_DATA_CURRENT;
 		query = UVC_GET_CUR;
 		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		id = UVC_CTRL_DATA_MIN;
+		query = UVC_GET_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		id = UVC_CTRL_DATA_MAX;
+		query = UVC_GET_MAX;
+		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
-			return ret;
 		id = UVC_CTRL_DATA_DEF;
 		query = UVC_GET_DEF;
 		break;
@@ -2064,6 +2099,14 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 	if (!data)
 		return -ENOMEM;
 
+	if (which == V4L2_CTRL_WHICH_CUR_VAL)
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+	else
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+
+	if (ret < 0)
+		return ret;
+
 	ret = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id), size, data);
 	if (ret < 0)
 		return ret;
@@ -2076,22 +2119,37 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
 				     struct uvc_control_mapping *mapping,
 				     u32 which, struct v4l2_ext_control *xctrl)
 {
+	struct v4l2_queryctrl qc;
+	int ret;
+
 	switch (which) {
 	case V4L2_CTRL_WHICH_CUR_VAL:
 		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		if (!ctrl->cached) {
-			int ret = uvc_ctrl_populate_cache(chain, ctrl);
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-			if (ret < 0)
-				return ret;
-		}
-		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
-						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
-		return 0;
+	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
+	if (ret < 0)
+		return ret;
+
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		xctrl->value = qc.default_value;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		xctrl->value = qc.minimum;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		xctrl->value = qc.maximum;
+		break;
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int uvc_mapping_get_xctrl(struct uvc_video_chain *chain,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 65dbb53b1e75..7e284770149d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1087,6 +1087,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
 		which = ctrls->which;
 		break;
 	default:

-- 
2.47.0.338.g60cca15819-goog


