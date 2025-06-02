Return-Path: <linux-media+bounces-33942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC23ACB948
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E74A3A19F0
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3417D225760;
	Mon,  2 Jun 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DdTblg0f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB6224256
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880416; cv=none; b=WD6E/XYRB2e/u+Y9u3817JW3uJ7zHvrkFVBeK8D6KgWCc2XU1u2FHQp3VbsBa80bP9iziRRA42dWNneiQa6DTVhH5KBvCG0ND85yQzyz/YFgIZCfPIvrLWNUNk3N2ATzudlkbCe/lZ9q3+zVsrxDFfXoZJDIMrtK/yyStekTEwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880416; c=relaxed/simple;
	bh=pAwYR7oteo3vN3c/HkFqcbWJsyd0dKKMMaP2gKBrNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U12SBth9EhEEb9LjsFIauKeNLBy24lOq7ZfxdEm/u338HWCMmFf+qI6/upFY8KFERZ/5JgMek4IUHefhJUyheawBVJ1oPJYnISVaKPcGg71hAr7p1OTa+TUVGmcx+ISle/UzqgYpFHnOBblMwXP119i/0mD0t+iHXPnO2sl2dnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DdTblg0f; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5533c562608so3333973e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880410; x=1749485210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=DdTblg0fU3pwzPcNeLqzAj7tg1yU9UKx9BkUA+EuKggptE/0NLuOrVNLrA1p2WTCh9
         Tmekuq4lCWCknT2pgp3KRlywD9RMnjlaLmrMgJB3SHdJDdBnGtnJJRuBiFEOq8LpayHu
         18rLYzF7V9oG+r0uCWxyEd0rp40a8AXboe8Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880410; x=1749485210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=Gj/PE+POGaSmOT7N6tX+INNFyFLFxTYAEBwIWfxFT/E7FxUlI9EoBmvB0g4OYWVQtc
         bNUacjRxuSixjnPLkyMs8BRKOcPbm7kojUkXCZ5iPGnwH6Al6NDqX+Up1eWc3ru0/b0f
         2+/BaLa6OFAOibzV28QFlaKgQ+7i2Z7FGB8u0Ly3mJ+4q2hqEe1H28aPAAj31FAEDSOB
         AJ5679wwxUwAoiGNJvIZDVjgRpZpP5KcAQmTdJctTwCboL7WS4HnzOxlE8tyieQThh7c
         z5XNMjf1aPGM4PYt75ShNGexvsqpCgmVTGZsYQRkfIXuOY/bQqsKpI0rDrO9QWMAjqO4
         AVgA==
X-Gm-Message-State: AOJu0YyfANJt1JUY3tsB/o+jEh5uuSh8kqFqLSxum3TIL3tuXdfgteig
	lui15bxu/0jxydhWnrPE2VD5DGfv3Kpb7ljMjtBkn+9kfzbaReEWf3cdLTlPNfP5Vw==
X-Gm-Gg: ASbGncueFrOVDeP7b5z0SQvWuRZvatIj1K8tgBGhBBFRIuokvxAUGdcbavf7Tr5a3PT
	bMEBTtm1Dl1kHDZIYXVFT3WxkfcA5YIg2awcnWqX+mnVlP0zwm+OQ4H56l89NJ/yLumyNmkTC30
	sXWWARpV3qKGeIoNqpQOkTF36zeirpVAgePLUZCCUuKs3xFn4Hzd3UxI1DX073/T4copXZIbpjh
	Lx1Q1kwX7yGuCg3/N+rl52CbrfUTfxYxYzZEuU4T7Xk12aLTkBpR7sd+Aw4SSqo2LFjtq+MBMYl
	DcIuVPNtGj36x3ytMYxlBBODXas2txHGjHK1MKFS0JH9ezZgsiYbxwqlu8245iYr5msIYELy+sw
	JNHv630E/z0HHAWx9pTm3kEQpbw==
X-Google-Smtp-Source: AGHT+IGf8qGyIk7sMvU/JNZkuZUxxkGbZxcH8ZPvBXOi4UVuVYBe6H8zUb+NJG1maSMKMAj/rJEYQw==
X-Received: by 2002:a05:6512:39c1:b0:553:2fec:b149 with SMTP id 2adb3069b0e04-5533d14f162mr3527974e87.10.1748880409806;
        Mon, 02 Jun 2025 09:06:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:44 +0000
Subject: [PATCH v3 1/5] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-1-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is always called after uvc_pm_get,
this change makes the code more resiliant to future changes.

This change also avoids calling streamoff, which is a rather ugly thing
to do.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (handle->is_streaming)
 		return 0;
 
-	ret = uvc_queue_streamon(&stream->queue, type);
+	ret = uvc_pm_get(stream->dev);
 	if (ret)
 		return ret;
 
-	ret = uvc_pm_get(stream->dev);
+	ret = uvc_queue_streamon(&stream->queue, type);
 	if (ret) {
-		uvc_queue_streamoff(&stream->queue, type);
+		uvc_pm_put(stream->dev);
 		return ret;
 	}
+
 	handle->is_streaming = true;
 
 	return 0;

-- 
2.49.0.1266.g31b7d2e469-goog


