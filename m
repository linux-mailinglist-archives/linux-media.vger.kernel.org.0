Return-Path: <linux-media+bounces-21428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2449C9240
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364721F234BA
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0871B654E;
	Thu, 14 Nov 2024 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lMEET6M6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A71B392B
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611463; cv=none; b=us8aPAfwIMM2alUkklGrM++nRfRMTj4p2BzaUCGJnoXKyV1A1NzgkdkG2ckDZtN3Zq8hJdNHk11VBBJy6XAmbPUEEy33tFgJPL8CSbXUWHBW4PMx7oCI4SQaJlbTGVwSgmZp5cbMn+zujaH5W0Mugr+19oHGB6SV+NebcjsmbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611463; c=relaxed/simple;
	bh=Z9uDVvItoljuKYfunavqY95I9UqlcIp6s4l6b4f5U+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u69HjTPfKTyKzF8JPV2zEaN2sTQy2aERmUY8oW6suCSI7fDZTQoAR067WX+Fhl6/VXM7SlW+wjsDR2CqI3Q3IKXMnDv+ALIkVx/dwbZGEZUyANONzLxS1jNagrmWx6P/qYKKIQoiu4sqS1XBuGYMLNWjAEVfOKkK/2qzU6/cTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lMEET6M6; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7180cc146d8so511562a34.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611461; x=1732216261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBJrp7mg23fLq0H3uAUw+Zj5QMkIuMcISNIeTGg09NQ=;
        b=lMEET6M6y6+UZil4eqnYPfySGNnG4eIaQM0VKqVp+ea34cbS2IdDtYJp97f1KanE1g
         H2aRW94TK26jf/Soz/uM5L/RE4OqxZGoy1b3L08Qit3WDTFAh6GY22gCZz+0EfFEwg3f
         kJlAFX1EiubEjJfe2cu5xXfyda/nAhB13v3TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611461; x=1732216261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBJrp7mg23fLq0H3uAUw+Zj5QMkIuMcISNIeTGg09NQ=;
        b=puxO3+IGaYXopqa4jxsl4P4EBqG9UKNutR/ybug15gvjqgPpdljhZw2D1MwG38N0SN
         HXoiIKVKLt1SjXsNEcv+pI3P9ce88zrFNapjkoDMG8jiOGzjpblqBXEkalZJ2TjpkeWW
         3t47eJ2G5cZ3nrkE6lYhShRI0V2yc5I6myMlkmz/U6kcPoad5UZHZS6R5f/wRF1Xo/Za
         Fx/CtV++B90h4eSZf2+SQ1LFl6wvR1aJUBnNRtJEjsZLXj+ZEeiTATknrfoD0qttAc0j
         zkE/nvaGv/yTh8mZt0kr43kbIaIA+DbzgnQ9pkUVrohgTjFRYvsLzcK5KZYmwFmCtalY
         +iVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRA67sC99pi8GKdThpwbf25m26Q3REA13uXEmBiSApOPCdoPc5OtV81sySpG+di7R8nGEEuwZEdjHZ8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Vc0tQBSf+9ZdGCg+HMQ/JOgrublRi4H38ngZLw9rnHBn1iuM
	+8SYhwc7OngTZ7wJ29wvKsZDrnV+aoC/e3kJvy7qztFimwZoxRtjjsHzmcWHKw==
X-Google-Smtp-Source: AGHT+IFNVlvDBjAW1cRege8knW5DelZl6pBdMLjl5E5lB/Wc9jyTp/KkdgXqMEneu89a9XWemF/hGg==
X-Received: by 2002:a05:6358:c83:b0:1c3:7157:2868 with SMTP id e5c5f4694b2df-1c6cd108afdmr31228355d.20.1731611460947;
        Thu, 14 Nov 2024 11:11:00 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:11:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:45 +0000
Subject: [PATCH v15 16/19] media: uvcvideo: Introduce uvc_mapping_v4l2_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-16-64cfeb56b6f8@chromium.org>
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

Centralize the calculation for the v4l2_size of a mapping.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 1bc019138995..f262e05ad3a8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1463,6 +1463,14 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
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
@@ -1504,7 +1512,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
-	v4l2_ctrl->elem_size = sizeof(s32);
+	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
 	v4l2_ctrl->elems = 1;
 
 	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
@@ -2093,7 +2101,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
-	size = DIV_ROUND_UP(mapping->size, 8);
+	size = uvc_mapping_v4l2_size(mapping);
 	if (xctrl->size < size) {
 		xctrl->size = size;
 		return -ENOSPC;
@@ -2271,9 +2279,8 @@ static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
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


