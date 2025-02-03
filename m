Return-Path: <linux-media+bounces-25567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E9BA258B6
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6FE166C1C
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FEB204F98;
	Mon,  3 Feb 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cfGT06WJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85C204C1F
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583757; cv=none; b=joyZB0PEz28xcfSyaBn+7pCc7O8g4ovf7xsF/mk24c/YdCRBUZtx2jC1HKGfKZvycgGqOXXTVdHXkKKYa3NJhDPQ3feSpIdIkbWp4Tk+9RMePm85prcwXbWHnmQHwXtihfgpL+g0tvV6l5R+bW+qeUXKSgdLQ/x3FnV9G5kejxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583757; c=relaxed/simple;
	bh=Zg6xg2bjGKHfug5JTUUnCYes/lbTc768bBgzHu0UN68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa7qzvxFlAFZSahlMnf7GOgeHaqBTKpbFI/ZT2jwYXQyXf26DCIgisxS+7v916tRAe5ZRoTo15aZdLlXeGuoM+5gV2FXXn8IIwSbpdDpikpVuvUfPDB0LzukdHagl2WPLXwP8f2Zn8HdqrEVM+Dj8C75/ltAWgbmdufV87S2ZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cfGT06WJ; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso2187101241.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583755; x=1739188555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHejU0nDb/GLEs+vRJP6CGozmb1EDd02Hmy/lAClMSU=;
        b=cfGT06WJHCCG0M2Qnx5LECgngXNA8UEqoZTJQ9FqRc1e5KS4Lbc4iVHGfRnCLV4ngX
         RyeQQmGEnXrAhmytQUu9bpi/eSG3XxPCS+MykRPHI+Hsgo+HiUf27iCIQPL0QWysU+jA
         9VnKYeBW8FplKDgk8QYQ98gQLiu1XPVex0Rdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583755; x=1739188555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHejU0nDb/GLEs+vRJP6CGozmb1EDd02Hmy/lAClMSU=;
        b=D7VBNC+fvkSP0AvFJ/paUeDN9fVugNpCX3JSUtm6g4rYaTGX6njBYNDY7NN/pcO1mS
         uhXxlqlvPf406PsK1T7bgpKom2kOFEKZGjSK3QLA1WY9++rYF/9s289bIDQyMKmixBBj
         W2IMjgh1EpvJTab2a/+EOyT5VPfLuetTQKEAetBejeNm1hSw+h5cSCeXLblKi/Sn/7cS
         Qbid5vUUw7gKT+Ebkzs7bq917+WWeC6DGiFy5qAfYmQWVajFkfKaKYxVL5FkoNxRrDZ3
         spTmhNQf+pcemJy+JjgOu5wfl3EWDGvbRIXSsyq1Lv4Xu93hNlYUY6y8TgchLlLmpRA9
         g8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzv2h9/Fd+/vqwU6bBlVfyJ2nE49VDlwQWRDqwjDaBzx0HqR50JBSMFjwBfbNV9Rn+z7hWpweujJ3b2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FevkTn5eYUXFu39WUH+H7CqGXeavttM+FfGVBflZeY3XBJIL
	MGLs74gNb/JWI2iaN6sFMgeOVt3rsY3iJwy5qpDSn85dVx2PumVi+06Fj2U9IA==
X-Gm-Gg: ASbGnct37s9z5SLO8C5hgFmhLJhwIK0GEJV/aS2lNuYWrkSbZFadl3tDg52Ym4GHUVb
	jOi8//ZZ3a/LsIjsYOlZfm/XC44ecz5HTLLJD4w+p/p6flh/v6cm5XciYsklttrtRaZJnB9aiVG
	uLr2BR3XsOT+vZZmYttnwq2EbJl/GYD2UfgIhnDRYob1q+1t0gDfCLxnnR5Zh0VwHw6by2PBCMQ
	uVBZXYIDfSg4rIRIqucQM2YWlpDAfz37QBUhbV1z2OLWVw1mB2nYbGEaafMqcDsqzDwXN2Lbxjh
	8ORbZL7weegP/cJmHkK4rIgRKlRBK+9uRRfjUQq/vdydKLUQoGgNZvKILwdx/b+BiA==
X-Google-Smtp-Source: AGHT+IG+24DLU3b+8tkuvBtbAP1+MMssTqSH/odUoY59YmfIxTIjogQMq0/8sDPBm59TgOJsYIQkTQ==
X-Received: by 2002:a05:6102:6d5:b0:4b4:27dc:ffe3 with SMTP id ada2fe7eead31-4b9a4d23a59mr14862086137.0.1738583754406;
        Mon, 03 Feb 2025 03:55:54 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:42 +0000
Subject: [PATCH v17 06/17] media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-6-5900a9fed613@chromium.org>
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

We want to support fetching the min and max values with g_ext_ctrls,
this patch is a preparation for that.

Instead of abusing uvc_query_v4l2_ctrl(), add an extra parameter to
uvc_ctrl_get, so it can support fetching the default value.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c | 28 +++++++++++-----------------
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3108d2fa1ff9..201af66a874d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1951,8 +1951,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	return ret;
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct v4l2_ext_control *xctrl)
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1964,7 +1964,22 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	switch (which) {
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		if (!ctrl->cached) {
+			int ret = uvc_ctrl_populate_cache(chain, ctrl);
+
+			if (ret < 0)
+				return ret;
+		}
+		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
+					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 int uvc_ctrl_set(struct uvc_fh *handle,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..9493ab375f07 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1027,34 +1027,28 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
+	u32 which;
 	int ret;
 
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		which = ctrls->which;
+		break;
+	default:
+		which = V4L2_CTRL_WHICH_CUR_VAL;
+	}
+
 	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
-			if (ret < 0) {
-				ctrls->error_idx = i;
-				return ret;
-			}
-
-			ctrl->value = qc.default_value;
-		}
-
-		return 0;
-	}
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_get(chain, ctrl);
+		ret = uvc_ctrl_get(chain, which, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
 			ctrls->error_idx = i;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..018613f98f48 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -793,7 +793,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 	return __uvc_ctrl_commit(handle, 1, NULL);
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,

-- 
2.48.1.362.g079036d154-goog


