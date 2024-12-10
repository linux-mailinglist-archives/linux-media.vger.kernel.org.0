Return-Path: <linux-media+bounces-23015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3249EACD8
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF69B1884D0E
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEAD225419;
	Tue, 10 Dec 2024 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZmVpE196"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405CE3DABFB
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823787; cv=none; b=dv+3BZdGX7aDl7/4KQwrk4ITHra7IXxfpt7s2mijwLSvNKLpwbH+GmwHYkK8ALcnrfigzExINow174xqRt2Gkuu1keUPvCDO/H6Y2rJx1hM6XhKUIDWbQn+UH99mZCSnT00HpgJL/FBb9YFkZk+UOXoOBF+5KJfw60jDbDK1v+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823787; c=relaxed/simple;
	bh=j6w/ehoFFcMfXU0GvWdVutVl4sbMYNCORCUrUbyVXPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KrcRsVYy0h9i46eTm+EaTaQ90swYEq5V9TRSULcVPVUJYOTr6+cyS2vsU1kQ+4FUqYhVrOkah9EmQM0LhtrV/DZSwOgM4R+BSHQontq99/8PfyAOuj7vMxmTRkbPekllExd6KlbbwlT9LNXKNACYaOJsICVQdIXyStEBjRiOcSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZmVpE196; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d87ab49423so52345926d6.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823784; x=1734428584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teneHbxdymYBZ2TJXTz4C2Fnz+shby6Rz+Rw9UldIMg=;
        b=ZmVpE196GIYFHl4MJlQhv9glMEJv9th6z+yPxbzztGBiJJQkXBOOX1XRzNKireLXKb
         wAM0WZza2M0qYQb7xLfW48t6y0Oux4ZiWFmD787urHOyfsOeIojmPIxsK012jU+vxVVv
         jUd9GlZ1PeqxOCMx1PGg69/Z5M1/JlQPCEkfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823784; x=1734428584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teneHbxdymYBZ2TJXTz4C2Fnz+shby6Rz+Rw9UldIMg=;
        b=Q3giEMlJs0mCtK8+RCshkelZWT/LBXriX6blq2mEABHMPXjuPNU9al8GYIPimoPspE
         y+hznUYVa4sigaK36g5KR/vFUK7Fdn1EoeTGjlmm0oAqbnPZGfvLyHmcVdn1n6146aSh
         TmDPbOG1g+IihxifB7OJTEKyJNOayNlOXycwX0QmhaiMvSMCiOiVzvx2kosUjJqwWh48
         9BY69sV+XmEomxNuLbyv+LRFbI5TJKL+g6fvC8PutKWNcqcbpGDHexFFG+bnrU7u5sSV
         IyvFj8rhzetshnz8uh0Huz+ZtCfW/YSlnguJXHZ+wVDbo3iX1h10IdfVVJ00TpCuT+qG
         pu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTyRxYRAHWi0tU/ZwmVBAjr9fi6XVKW8MOrA6JPL+tz1XzFtfzmBM/MhEeVuyywZjluRo3T/Enm5negQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDC7lo9l1lR956tQ84gb/fJZuHDxRmTWb1M1/vib9H96gNuzP
	phbvbB463wCLqec4BWQecnTmgFBc8GKL2VXGnTZvbYNicP7IwB/jRs5wUs6Ksg==
X-Gm-Gg: ASbGncsTYHeF6DWgSnJdcEu1QL24kwNlkaNNcUv+C0Y8/NeAL7pQyIgq39Z7uQ8AnwP
	OwbeTY0asi857i2KGs5NiqIjKg9yndn9rwZvtDUxI2XPMkQTmUjIhzsQZQdZWuvoLCxAYFglpL6
	7glUBEPU3ddT6RIrJR/DwP5HX+0SSp6SisWoYv5b0x3CyE1gm4odWPOYagf4t0tpi6zoajD4E3t
	qIXhl1K900wH4sKD/maGqQ3uOXK9YNjobFC3bOBgxyBElewtR2GLLB2Fyk4IiHxXcmQq7+x1lek
	7K/gtC+nOFPH8iI4Wl+JjvH3URVk
X-Google-Smtp-Source: AGHT+IHPeSY10FnNmsQEJGreViToMkX+83gWAxGpMBUhrfxnm5Cs2DpKJx49CNRZNU1nYkGjkjlubQ==
X-Received: by 2002:ad4:5c49:0:b0:6cb:99db:bdd5 with SMTP id 6a1803df08f44-6d91e40b5b5mr67741986d6.39.1733823784162;
        Tue, 10 Dec 2024 01:43:04 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:51 +0000
Subject: [PATCH v16 15/18] media: uvcvideo: Introduce uvc_mapping_v4l2_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-15-e8201f7e8e57@chromium.org>
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

Centralize the calculation for the v4l2_size of a mapping.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 58bd42191f3e..dd6129becf58 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1471,6 +1471,14 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
+{
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return DIV_ROUND_UP(mapping->size, 8);
+
+	return sizeof(s32);
+}
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 				 struct uvc_control *ctrl,
 				 struct uvc_control_mapping *mapping,
@@ -1512,7 +1520,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
-	v4l2_ctrl->elem_size = sizeof(s32);
+	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
 	v4l2_ctrl->elems = 1;
 
 	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
@@ -2101,7 +2109,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
-	size = DIV_ROUND_UP(mapping->size, 8);
+	size = uvc_mapping_v4l2_size(mapping);
 	if (xctrl->size < size) {
 		xctrl->size = size;
 		return -ENOSPC;
@@ -2284,9 +2292,8 @@ static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
 					  struct v4l2_ext_control *xctrl)
 {
 	u8 *data __free(kfree) = NULL;
-	size_t size;
+	size_t size = uvc_mapping_v4l2_size(mapping);
 
-	size = DIV_ROUND_UP(mapping->size, 8);
 	if (xctrl->size != size)
 		return -EINVAL;
 

-- 
2.47.0.338.g60cca15819-goog


