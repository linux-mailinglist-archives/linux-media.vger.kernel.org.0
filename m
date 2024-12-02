Return-Path: <linux-media+bounces-22445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E379E070A
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15CC6B3717E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8E2205E2F;
	Mon,  2 Dec 2024 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GzElPN2V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55733205AC1
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149488; cv=none; b=XWtSqmUQ3UwTBIqpptk10LsHCuU5r18/0so1HThKxUxD5t9ZjZ4paKy5dRCnUuM/dQJTL416x0CokMHlEioPrPYHR0th6CjlZu8LUUfCd0vcgr2p8B+seqyZgDSbfQG3nEZXh7t3MPbH5bN7ha8y/v0MZ32IGbF/JlC4pCahcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149488; c=relaxed/simple;
	bh=s/DB0EW2SPaRTypHFdwKgdfZkbgjDIcSlMWC0VeRtOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drcSgi9e0hUcLzAm7noWL0GJ6tQYmGYpBIho5km/HHQXojWcyuhbn3C/E4f1rs9VMfvI5W8CqrsWk51Xle//tiepQhnpSf+wd5kK6zMpC5KK3TSRUaTDhk0ARmRKj77yQjpJd61w52m25qHc5OQJtVrqjl27/d2C083OjCCRlPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GzElPN2V; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f1e573e65dso1133970eaf.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733149486; x=1733754286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XX9qg9tc+/hZit/CPAJ2FBRiBE/du1gO7Pr4Y7PEr0=;
        b=GzElPN2VoN9x8w20pGzdXMU2jODgG6rkOLXRlXqhScHEpvJkjOi1KeGbSVDJ0VbUUG
         Gmm5PL2HnBmBttt/AUkMYtThZ7TKasrAuavFKRSt7PRJj+mrvOVvW96ah2iGuKOAgsFJ
         Z9oG+y2qOUqEUxxY2VLyMNJuMT/O+7zlCzPFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149486; x=1733754286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XX9qg9tc+/hZit/CPAJ2FBRiBE/du1gO7Pr4Y7PEr0=;
        b=J20eqfDfNA1vCWeiZT2OWXjnVSv7XYFZ9s17osF/TsjUozQ7eM+zz35hcaLOHezJaw
         YRJcTFFx5pUDelXciWj25d2IjELMhcOiBO6V4m8k1z1vfBaOlBF5o2m3Qr1u+HCsdugO
         rou1u5R3Yo0mzuzzHzy7M7HCA6iW9VvZfX7B+v9UuMsNWfHiZ5av24SbDa/zGZpym8jm
         TbwAW7NAo51X9Ux0mgUJF9XIB1E7wN07x2OvDVhhRlI+VqjBRTZ4avoEaDEYtcxkIqUf
         r7UOAzPa+XEI81zHa3FXLMMO2o2O2pheEIEWLcbqNMHEr63oFBCzags8Rnws0culfVVu
         +mmg==
X-Forwarded-Encrypted: i=1; AJvYcCXP1JPxYnSPULERaVRCpolH1LMYH9F/UOu+zLCILqaYwuJ23jVxug1ltFfBiVgYsn1mZK/P8CB/J7PVcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuL3xgonpIPc9yp3odSpFSrNdN5ZZJk/D4deHWE2JgGaA98xrP
	HU02mmOwAqhF3vV98N3qFdwF+wXfpE0nNEskURbm4HlmiKI/Zdq1I5lhta8xJg==
X-Gm-Gg: ASbGncvBvU4DxCGXTeMENnfJwC3dZ50J4voav4643U/yMKFcMvAoM/srzAFN4QSg7p1
	e3qftJEry3faBGKzL8w9j+gAlKZzbRUqwkDwUZWdILR3b42LGlinab6SafTCIqa3AP2t6f1lCNx
	At3EivQjJUS37MNlPDCIjjVVOvPycM5GYrJx4k1LVddUXGN0oyoCTDQr3/iUnZLP+f94YCRZZQQ
	8UGryt1y7tr4Gl0bxIgwF2m3/M3tbe8xi5LcWoKdllbk9ECr/fCwrNbMNRiSG6sUJGnL6HekXJT
	7WYsLyFD53deVmHIXeOUg6b3
X-Google-Smtp-Source: AGHT+IFgO5znn3TOM6ZaburHci+S3FJx/nAZp7WZvG/y937GkzxZ+xTYFExdyNaYVbvBJfDJ07/Zgw==
X-Received: by 2002:a05:6358:5f02:b0:1ca:9c5d:1bf with SMTP id e5c5f4694b2df-1cab158543emr937389255d.4.1733149486483;
        Mon, 02 Dec 2024 06:24:46 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85be9087890sm179710241.25.2024.12.02.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:24:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 14:24:38 +0000
Subject: [PATCH v5 4/5] media: uvcvideo: Remove redundant NULL assignment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-uvc-fix-async-v5-4-6658c1fe312b@chromium.org>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
In-Reply-To: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
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
index 576e3854be91..e90bf2aeb5e4 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1672,10 +1672,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
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


