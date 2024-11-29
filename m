Return-Path: <linux-media+bounces-22372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532A9DECF4
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9393163DFF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0014F1AA1FE;
	Fri, 29 Nov 2024 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VlOtASaq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC51A9B4B
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915837; cv=none; b=hgbahnbPHLfHIOOdQm4oC2OiDm9POCRoOrhpK5zvIYPHjCQNFCujZmG9DqZgEDEZh9iJPinHBD1rTV5GP3nsLRPLa1O9aHyEyhLCphz/uZsmPnqZXLg71KsJFIuT+KSZvlYEIW2vAnHrWcDyXKDeJwX8I6X+eIAs19iNERu5nqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915837; c=relaxed/simple;
	bh=v5QezjflINmr1he5MndfMVx+1wL6381Mly0MlSiNytI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLv0qib1586gJ3ybWLjeXmqJdetppK54Jm4YgAIQ0t5BIgTciin8RN82XnL9PNaORDMRWibmFKerObba4bTC7pC701b58KCV4r/sqQ8oUvum+XixEXn0BqGtj5B1qd2uQi4MZlZyoNZznPqp2SF0GkAdBsPIwoYndo2JZy+UG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VlOtASaq; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-515192490c3so598897e0c.3
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915835; x=1733520635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucJjvH6Z5O34BPMy+Kt0AFvVfn1owPFISOzjaTX5B9k=;
        b=VlOtASaqZgGUN69hfmv2Q3C06dVq6HZ0oZ5O9zpr4MoV8hFqszUHXMe2OlKzGIKatA
         1qMmb5mBPkDYA9ueUHWJWUkIiyq4q9rkstP98TXzICFTZACTgPwYiIZtDEAiTkjFh8f3
         kFhI7QEWuFM8VTt3AnA6iB2dXL141oLZcD4Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915835; x=1733520635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucJjvH6Z5O34BPMy+Kt0AFvVfn1owPFISOzjaTX5B9k=;
        b=FFOtjn12vy4P9/A2Av1SZOqnBmjO4C/2OIogHWRTB3syUUyTWFh5BYL9zKqd26dyCS
         SCApUS+i3LTFqJ9gK5q+Q+sBpQLqBo2VYOd8DSEa70/yI/sTpFl3gmJqqzgFUViNwMa0
         XGsB7rcAg6nPlb/Jo1FlaY5ilOGiJct78kt6VP0txXivQ0OOX1IKQDk7EGL2BXHJCw1J
         Xy8KQ6SvO3ORgQkxrVluuOUS4QNzNBCdb/x7HEIyXm5HKmdyxxv6OraLcwHkcAc9TS8v
         5/KqP7YDKCNKA/dm2bDdGX+NyRKwIMB4l9NmIHfdpNLQVwVMmFq8co+eeH+DODvQVxm/
         v03Q==
X-Forwarded-Encrypted: i=1; AJvYcCUID/Pq67NKqQJym55Cbl7aneyMsGwobIVmeaLCmXhgBCYPgm5KCLTiTSsIPsPJTqxWOcltdFfnhK96IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37CEj1toIx0dC35di/9P2WCF0gJHSJtTfUckXZyvSO60THZRK
	TDu/T83Qv1YNP0Jxj1zUcbjeFK3XlvZd+NMFnkOJXqbu6Rn6Hi6wPEFxNCPApQ==
X-Gm-Gg: ASbGncsbGXvProqnSiZx8sK0r282VpaZNqoZffuJz1YhUOTdTH0HeEPxzZvY9RG7aom
	aJRFPLXtu2SQ8hvma/l5YUQaBF9pb40tCdFM++2fE5mxMC4k598bbJlUHQzfMh8ucw/3gxvZgLx
	Ih+RAOSTT3Ch3ZefjldK6J4Fq+v6Mk2KL+jVR2S/BntiopRf7AdRellkKmBMm6e44FWn+Tzl2n5
	AkinJ4sx5pmB36VqacN5RUgpJ5MRHwED8Dmk3i8RTrUe/AkhXkcl5arHuiajox9qHxHxlergZSQ
	SxhtNStrMTOreXDUYVIWyBTm
X-Google-Smtp-Source: AGHT+IH3VfM6LqkrJkK/UlQJJZ22q3iU/5oBBscMFmZZcqik+YSMZUFM/OEX7FkQUFRdN8ccT/KNFg==
X-Received: by 2002:a05:6122:2a11:b0:50d:35d9:ad60 with SMTP id 71dfb90a1353d-5155692de66mr16955127e0c.5.1732915834862;
        Fri, 29 Nov 2024 13:30:34 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0c1b7asm607254e0c.36.2024.11.29.13.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 13:30:33 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 21:30:18 +0000
Subject: [PATCH v4 4/4] media: uvcvideo: Remove redundant NULL assignment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v4-4-f23784dba80f@chromium.org>
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

ctrl->handle will only be different than NULL for controls that have
mappings. This is because that assignment is only done inside
uvc_ctrl_set() for mapped controls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e02540162dd4..8483e6760be2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1667,10 +1667,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
 	struct uvc_device *dev = chain->dev;
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
-	if (list_empty(&ctrl->info.mappings)) {
-		ctrl->handle = NULL;
+	if (list_empty(&ctrl->info.mappings))
 		return false;
-	}
 
 	w->data = data;
 	w->urb = urb;

-- 
2.47.0.338.g60cca15819-goog


