Return-Path: <linux-media+bounces-47411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53786C7106F
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7152344000
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CA332039E;
	Wed, 19 Nov 2025 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hRBlvo3L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C972D8375
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763583461; cv=none; b=HTB90+u35BM5j2tD6Wg808/DhjfrFWDytdJIuZ/2Zs10i1K+p4Na1HPsrlhcfaVaFO4M57ntX/02lVBMFxtCzDCFEznHh0Y6gtvsJd3TDeYjKUJ0yV1gUMZIZBZA3Mty/In5XhZl2mr2Bl0RomZ5dGQdbhxCiM68AcpuGM8Zslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763583461; c=relaxed/simple;
	bh=f9RZO2R4aOCAiD1SjERQgTIa9CRXG/VIbKxc/B9MABU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NaUwPUvxZOPWYOE5fO/STIfOVKCH/md0VsupLDtX25XMiCz6+YH0roAy13a9Ffbes6sC1wFRc/9G+a4mllq78mVyyJjdECSr6aoQivbSR6qZixo81KfIUrf8TPktndMW0EQbOWZXAJgE7k8Ze1aAzCAF7Ea/2Ek1rfObHuM7i5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hRBlvo3L; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b983fbd45so736551fa.3
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 12:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763583458; x=1764188258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SO059kbbw+dKgZc6zoKEA7kA0qHyx10fUv1rvbi+HXA=;
        b=hRBlvo3Ls0Kbd9fzDPkN/LJcvrJ0oR+ZmfuD6wfqOd/06g26EQK7GZSOck2iPGj+nw
         gRewVTJH0SAX56RjL7UNFYPIRTr/IaCAIQMH1e0Q1l6ojGJlrt9Sy6zBxaU9obwR1X/O
         530XlHmrGS+qcNLlEZdSzybw0H3PGBdkMGTZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763583458; x=1764188258;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO059kbbw+dKgZc6zoKEA7kA0qHyx10fUv1rvbi+HXA=;
        b=CMZCV1FjCG+Kqjiyzs+lf+kHB+I9XEzvEUUAnpn59qDG2M9fIesFPTfdTBrBjNcE8N
         jy3Zwg2n3RyjSlWvpKmSNUgKVqPTEX+ycoh5YbaT/2O39NxwN5XzUDfr9FHTbjjfyfap
         ImNdcRM5nWXijBWDmdV1BV/bgJrmCugWv60eNy/8uiBTnL6N2V8c3sTge7JnSIK5lYTm
         9NkamN2uZvNQEwdgKvURA1HicnVCsl+P1cRHK/ZHlMXi54i9j6to/ytAst2O/9sVn/4v
         rxt0GL+M6D0nDaL3yV7l9iBxGmUD+N0Bp7mcJBC5xWKE60RKeacvqAyF7fJTupLOfSkF
         YGRA==
X-Gm-Message-State: AOJu0YyCo4N7RkvwThY09JwtqdN6BoV7jULlcxGUCRMAEmvE8iV0hyy3
	VIfsfJz2hlRRHAiHyhsoGPSrcluFgtNfL+2IomUiyWObnI8r1ETm/Ugs36mRAIIfLA==
X-Gm-Gg: ASbGncuSvIzHeWqs+2Y6TcGZMUIfndl8kmjm68/83l1AQxsGC0rn+7LnWfGMFKaOnq2
	kGxdiEr7T4mAcTVSLGxlLHhd9O9Ga8NIwJOcoTjyobL5U7sFBl8H8TlUFE2EP2C8lu/tmpZigZG
	XgDq6yy9hEbGMa5S5p+CmT/ibSTLa3ye5TbaXf9gYqKQUc2XasAgaiWLkp3YKDrXScjF62EXqqa
	5xyzgS3H5JOxy67wl0UQfygWfnRLASSwTZqe4tOqqqtB+3DZWdjCNxF5IeQgqcyZfXiBSROEDvY
	NSP10up782uGibpjIFJFFca/G2j8ToseQMHT901EAAV+PnDpfCWA6WRCGm3eFM/y7NgrYuuzkYW
	hLXvJnS1DtGlX9Xm6GOVwew68D03K9zx/dQRd7jYdBBLVCxXa9evrsq3/O+Q87671t04eNbjjZw
	OmB1iUEx8zKkk4VzJYrha5fU3y0E8tNENwFL77Svw/uo6frAB029dZYMgVyy+dy1e9wqrKF3mg
X-Google-Smtp-Source: AGHT+IH4kdKLDZMxdGVlT1psfgFV692MD2m38hRhKV/m2rf65Iu485e/0lHTl63za6bUYF8VfvyezA==
X-Received: by 2002:a2e:8019:0:b0:36b:bfd3:13e3 with SMTP id 38308e7fff4ca-37cc6796c2cmr1831761fa.29.1763583457886;
        Wed, 19 Nov 2025 12:17:37 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6baf973sm609191fa.24.2025.11.19.12.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:17:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 20:17:36 +0000
Subject: [PATCH v2] media: uvcvideo: Fix support for
 V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvc-fix-which-v2-1-67d1520d0ee8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAN8lHmkC/3WMQQ6DIBBFr2Jm3WkEI5Kueo/GBeAos1AaUNrGe
 PdS912+//PeDokiU4JbtUOkzInDUkBeKnDeLBMhD4VB1rIVtdS4ZYcjv/Hl2Xl0jTVitErT0EJ
 xnpHKefYefWHPaQ3xc+az+K3/SlmgQNORslqqTprm7nwMM2/zNcQJ+uM4vgTroC+tAAAA
X-Change-ID: 20251028-uvc-fix-which-c3ba1fb68ed5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The VIDIOC_G_EXT_CTRLS with which V4L2_CTRL_WHICH_(MIN|MAX)_VAL can only
work for controls that have previously announced support for it.

This patch fixes the following v4l2-compliance error:

  info: checking extended control 'User Controls' (0x00980001)
  fail: v4l2-test-controls.cpp(980): ret != EINVAL (got 13)
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Fixes: 39d2c891c96e ("media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2, Thanks Laurent:
- Remove redundant ioctl check
- CodeStyle
- Link to v1: https://lore.kernel.org/r/20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org
---
 drivers/media/usb/uvc/uvc_ctrl.c | 14 ++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++++----
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c060e5034ea12d33b59d5702f2e1f..2738ef74c7373b185b67611da57610fd0b442080 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1432,7 +1432,7 @@ static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
  * auto_exposure=1, exposure_time_absolute=251.
  */
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   const struct v4l2_ext_controls *ctrls,
+			   const struct v4l2_ext_controls *ctrls, u32 which,
 			   unsigned long ioctl)
 {
 	struct uvc_control_mapping *master_map = NULL;
@@ -1442,14 +1442,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	s32 val;
 	int ret;
 	int i;
+	/*
+	 * There is no need to check the ioctl, all the ioctls except
+	 * VIDIOC_G_EXT_CTRLS use which=V4L2_CTRL_WHICH_CUR_VAL.
+	 */
+	bool is_which_min_max = which == V4L2_CTRL_WHICH_MIN_VAL ||
+				which == V4L2_CTRL_WHICH_MAX_VAL;
 
 	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
-		return -EACCES;
+		return is_which_min_max ? -EINVAL : -EACCES;
 
 	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
 	if (!ctrl)
 		return -EINVAL;
 
+	if ((!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) ||
+	     !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)) && is_which_min_max)
+		return -EINVAL;
+
 	if (ioctl == VIDIOC_G_EXT_CTRLS)
 		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88085a1b4e0e854370015855be92ee..30c160daed8cb057b31ec00d665107dfdf4be1dc 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -765,14 +765,15 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
 
 static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 				 struct v4l2_ext_controls *ctrls,
-				 unsigned long ioctl)
+				 u32 which, unsigned long ioctl)
 {
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
 	int ret = 0;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, which,
+					     ioctl);
 		if (ret)
 			break;
 	}
@@ -806,7 +807,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
 		which = V4L2_CTRL_WHICH_CUR_VAL;
 	}
 
-	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
+	ret = uvc_ctrl_check_access(chain, ctrls, which, VIDIOC_G_EXT_CTRLS);
 	if (ret < 0)
 		return ret;
 
@@ -840,7 +841,8 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	if (!ctrls->count)
 		return 0;
 
-	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
+	ret = uvc_ctrl_check_access(chain, ctrls, V4L2_CTRL_WHICH_CUR_VAL,
+				    ioctl);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ed7bad31f75ca474c1037d666d5310c78dd764df..d583425893a5f716185153a07aae9bfe20182964 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -786,7 +786,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 		 struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   const struct v4l2_ext_controls *ctrls,
+			   const struct v4l2_ext_controls *ctrls, u32 which,
 			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,

---
base-commit: c218ce4f98eccf5a40de64c559c52d61e9cc78ee
change-id: 20251028-uvc-fix-which-c3ba1fb68ed5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


