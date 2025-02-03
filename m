Return-Path: <linux-media+bounces-25576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E33DA258D9
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292CE3A42A9
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46388206F2C;
	Mon,  3 Feb 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUoD26cB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AAE204094
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583774; cv=none; b=h9Eh0uTaJSJsLwe9u06Fkqo53tQaMMhYT46SCLthbazhNuqsWuhd/t2Etsa0f6xFEU/tVOdLztubldMeZcxhqevy0iXjdWlQq3jhIfElhTcOxWNB/jJnFG0pgW/i38/Lob3aGZNbJr2R5qV/72VbZA2eP6C2+an/bK1jQs0rKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583774; c=relaxed/simple;
	bh=6OqJ4t4D9TpNI+/c8tdRJ8rTXZIpervnpprgIzahFh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zi6HORpJ1zy1BGrgV8N4aHNHxjZfiR00M0yXcPkOPRwwcnItRmUANw1ON0pqE2gXamzXPWMg1zrb82LkyNXQ+c6DhCZnNDmveQlO8NLb6/e3hBcVadxdq/7vkDLhXJIyOrwwxWX5K65DHzf1N3xygb8sRESep1nfABpGnshtQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bUoD26cB; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so2504125137.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583772; x=1739188572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIX2uAxqRPBLuXs0GvusMBked4RKndtatnuu6L3lKtc=;
        b=bUoD26cBGAs0PdMdYSqs3E3s7TseZOvqBi57iK7klaZ63m6ZDOfgoog0EIM2oLmUmE
         +GKP7deWY3Yp6Gs+dmIaD/5jM8EsgpwPoyuPWX0yIgykMWxpaao1S7VaZiLgPUVcDszG
         tS+vhNV56/HG6aEOv0YrwSzfrauXXsLaHaP9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583772; x=1739188572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIX2uAxqRPBLuXs0GvusMBked4RKndtatnuu6L3lKtc=;
        b=PqtMarHNjmLSZMsW5PZmIA23hQqsTmrawiHgDx6nv/jXTUHFbSsa1wiUNr7IJhlzwT
         MIVnbR6qT+843L0wReuiDoBxxG7tw9cZeRQ71xzUO7XXUUyy+foF9lzzKNCcL12XSEng
         gmMYG7uKP2zHv+lYoBESSPmpjZouUqveVSjxf3YR8GIjwQCFBH+Ipk9hvzz+VPoE4Nwu
         kXDB2RT+TtgZfyMVt55opCCaKzIx4AQNusElNUEpYECKSxs/KvmUKPqfq0NuNmjeMyFV
         T1LSyT2GL6ViJ/pb01TLGXbstPT1U239fFrqVn1DWuvtPhluD8H4CCeulKw4dOBAC5BK
         /pQA==
X-Forwarded-Encrypted: i=1; AJvYcCXjf7UNHbA8nRO+NI17SGFLRTDEVkt7u+QDfwD76JbjCk/BFhlFOpTlHgJp+nhIYfug4CvRiqSufoPD3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3hKselvM/vit6eDFa9yySzWFeWJgoJ5/o+W4VMA/XOQj5ozB
	h42lnpk91QhwYgstKHUiVgFy1qQTKxKXljLUZW1M3Npr+xRc3etEs42smEMMcg==
X-Gm-Gg: ASbGncvlqgCKa97ZoDtaAHUetYa9U69M5hROhCgdtQk9EZvI6MkmjRv4AHqFft9FRlQ
	cB0RQhf4XYu1DGBUp0bQqPmrOSa7SPiRxCT5T3SojFBmGn8YshR7hiCuXnkYZ6ozyV1B4/QRuEQ
	JX3f4lneu+BsYky8+zsWJQTOgZLSlitOe2y+HHPXWna7ww6f3sHvFKpU2WEn4jl22Cqc8woKpq1
	bXsvwmmsZbkbGMCkMW73hSmUrWd3EgIaFmBgdpUkxENQKh1yYgDGoRdyGqXLGJwKQOWkKtWhMaV
	tbgq7Iewh+ckTxG+8JsQKbAXC6oIE3UQ5qSo+WSwJ86c9iJowB/+eTlFXD/Jwp5uiQ==
X-Google-Smtp-Source: AGHT+IH2ZsZ+lbBQnlfcNNHd5u82CT5JuG2EshCnjTuVYj98ALBGeh6RaE9Vvonn6P/Yd42u1O28Fg==
X-Received: by 2002:a05:6102:94f:b0:4af:f809:5162 with SMTP id ada2fe7eead31-4b9b7077f33mr9674340137.3.1738583771399;
        Mon, 03 Feb 2025 03:56:11 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:50 +0000
Subject: [PATCH v17 14/17] media: uvcvideo: Introduce uvc_mapping_v4l2_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-14-5900a9fed613@chromium.org>
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

Centralize the calculation for the v4l2_size of a mapping.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d50137d19561..17a7ce525f71 100644
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
@@ -2144,7 +2152,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
-	size = DIV_ROUND_UP(mapping->size, 8);
+	size = uvc_mapping_v4l2_size(mapping);
 	if (xctrl->size < size) {
 		xctrl->size = size;
 		return -ENOSPC;
@@ -2327,9 +2335,8 @@ static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
 					  struct v4l2_ext_control *xctrl)
 {
 	u8 *data __free(kfree) = NULL;
-	size_t size;
+	size_t size = uvc_mapping_v4l2_size(mapping);
 
-	size = DIV_ROUND_UP(mapping->size, 8);
 	if (xctrl->size != size)
 		return -EINVAL;
 

-- 
2.48.1.362.g079036d154-goog


