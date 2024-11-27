Return-Path: <linux-media+bounces-22177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B806E9DA78A
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE862855FB
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916E91FBCB2;
	Wed, 27 Nov 2024 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U+p2X9wP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E51FC101
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709705; cv=none; b=Z6wOhmXYZy6bXBfVNnPYJP8nfZUhXUVaBL0NcinqpR6lWFfzA81AC08mLfiwD0AiDnPy45QjJCvbO4C1VwyFbcXfqWXdDHoixnqbBp8yAyGXXIUq0fH53Toh0sbs/wwkIQcZoM/CdQPtek8QkWNiaNe1BWxgxxGhtduH+mKbosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709705; c=relaxed/simple;
	bh=yv3h2vzWiCSkYvOmOVZOnLbH4e+vqdmkttphrGsTdA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0cc/34E0yU9E/OiyjAef+epWPuKn+m5UxbmaIRWLLN9XHwCcUpGiEAGn79Vaw/8I+Gsq5DRYdAxYWhZ2Jl0a+4f1Y4Sb1fK2Bd9CInieUIsIspHQQ9c0yCKsAuEWocUytFLG1/0+RXeuvzh0XVpJ/z/NTeDECWK5xZBUMD+JXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U+p2X9wP; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4668f208f10so27634591cf.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732709702; x=1733314502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6PMrA6yfmsQRKTdt+5BI8/0Y5GUPe75YZrlJGsNn64=;
        b=U+p2X9wPu/UMKCx3VFmxhdXB1oJWwXW2/deneWXnmYZIQkCbLIB31/26g5I7m49Vdd
         UivIN4yzh6Bak0ZPALYFBocZm8+pWe5XM1wATMbuQQ1I67HCA6eu3CINNvoMD/8o+i8/
         ZxQOF+qi0w1t1pQMks7vO3NR3xMColOXr3MzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709702; x=1733314502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6PMrA6yfmsQRKTdt+5BI8/0Y5GUPe75YZrlJGsNn64=;
        b=jXrxkOPM4ajkb7hSRoP57sL0OCUeb2Log4IYs70zGUVmNiabbSqP0D3CiaDyWJzlaC
         FwX/GKUZUHaJd7Le0l8noSshuFhfT2seVfJJ5/GfP5vMiM8n88vdSoY57SjgU222EZD6
         MjLSx3sa5pf2AQhQQCpdJ/StBP98LX+jSN2lxxB8eoofnGVBTrR9MADqksD/IaO75wv5
         DNU37mMk/88X41QtkgQwEuAdbDx8StgwTigWhTSacCel+EdGKU2ySggW9HfI+cYmd9Mc
         raQf8wt/qfDY9tR6lbhIG/eR5XEA5rR55N3+cy5w2Alr0rameZnu/e+qSfzTQPovFFxh
         WU8g==
X-Forwarded-Encrypted: i=1; AJvYcCV/QY/aFYvLFQYlm//fvifc5QAZHWT/N0H3PwIObMv6zrrrUMvVHbltJYOV401ScHApV1McK9unBTzrNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM5eTXdeYnEG5RQyjbDhe2e1AnBG+hWOCra1Zb+FXpVwLvYKyC
	u9FkN+ploWPsG5ksmdfprVQ+UTzsCOk8a2kX/4l63LplN8ULQCySscS8GVYbOwb+HJtlpQKUxqc
	=
X-Gm-Gg: ASbGncspSZm7ZNUbp8XMe+49cCClZkn9hvOFKuL5OWMMhk41ZTQ8qE2CF9QXyoT6zVV
	/w03ziTiL375qd5krAb/YEdkENlhuL46XFLpspzANJ7/VLqcExCENNf4QxOlyplZbJ1rVi/Fs1F
	KTbJFReN8muo0BHtqpp9aToJ8SDoQu5ojrwfxKw3Vz4OKDqvOdWZKbY4NRKueIZl69mbvXIixF2
	B3IAjfesZ+m2Fw49p94i/GJLo+JKiseZbOa6inNVLr60wJcY65Dc+CrrrdHFWMnl2/Isw4ACttA
	Y55Hsngo2iW2nuAbXAY55OgV
X-Google-Smtp-Source: AGHT+IHf6ueSfY60U0HfefcCmnZQ367u8xLsUq+kt1ZVbjF6qn5g8wIQB2Z8/Cf0NEGUz/Jw+SbagQ==
X-Received: by 2002:ac8:594e:0:b0:460:ad52:ab0d with SMTP id d75a77b69052e-466b3516358mr37080091cf.16.1732709702235;
        Wed, 27 Nov 2024 04:15:02 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466be77cf7bsm371171cf.89.2024.11.27.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:15:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 12:14:52 +0000
Subject: [PATCH v2 4/4] media: uvcvideo: Remove redundant NULL assignment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v2-4-510aab9570dd@chromium.org>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

ctrl->handle will only be different than NULL for controls that have
mappings. This is because that assignment is only done inside
uvc_ctrl_set() for mapped controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 99ddc5e9dff8..b9c9ff629ab6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1645,10 +1645,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
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


