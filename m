Return-Path: <linux-media+bounces-33912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8173ACAE8F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CDE1BA0E8A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B6421CC45;
	Mon,  2 Jun 2025 13:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZleF+aVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0519F2192E3
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869593; cv=none; b=XelMfFEBqhO9L5o/Pwx4YAUs5s6rhL9sP+Cd5RYw+SILc6fAzs4uAmcqBa4lQUh5dLVdAuIiGREpNOSo/WrasS/bVt6QyyzXV8UOv1avP3H0C0bdvYdNg1CQkEWoWhNbjA/7lbfq89qicm5cX5LN3Es5UcOaUTPO5Z119uvgMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869593; c=relaxed/simple;
	bh=sSgoKwSCkGSrgSxUaAApWkbAYdHmTLvI5MN0jsMZPOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tl30V9od8lkczQPMsYC5tjVCN3Dpy12i07y6u5MCaKHm7Uxk5iVZe/6Yqe/eOc/sinkC/57um/f51Ydg+tv5NDV+gUvNzVv7QmEffIFgfmdbgNJdL3YYWBSHHU2n3JUMyPipy5OA2/4g5cAiF9uq5/3uJiVOLhJ22ILxH0Lc8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZleF+aVH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55220699ba8so5427166e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869588; x=1749474388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+dcDh3ncyETsHrh6KLOXKd8aIlzxGuGTMucdNvN9Go=;
        b=ZleF+aVHknn+GmYDW6FYAIAOEnJcELmNWmBFp4Ej0XmOWuHHKRHsI4o2MiGir23kMp
         1WBIXERmqWoQKqVBECH6A9oXGN+Qsh1+KC+lzBW2hwefcq2xhfUhJZBCZN9WukuLLHnS
         tbZ5+cAc7rCHUBPqiku9a2cr4exHAyeMsxozg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869588; x=1749474388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+dcDh3ncyETsHrh6KLOXKd8aIlzxGuGTMucdNvN9Go=;
        b=ih1wptwjMZqLKoAQFLus8iT4gqKEI69mU/EsyJU+AYrycfEkoCDWQWudv7DxR2xHYt
         pbMefUPTTBfqIhKLZlvvqmSr5hydQPIXbqigOHIj+PkHkhHnGZZjmI24Wi1MPCiEj+2M
         n5shUZ3eL1B3ZCh5cJa7w2mHh0UcZdrxlF4sldZNqhPAxWsgR5TYWdYM1lo7x2IZ1tU0
         cG9LETseXu0CUTSqAII9nmZsvUaa3SPM01E8CounzhcJnnzAQZ/dUiaC+2O56SDmzIB6
         tYnV3K9QbU0N9dT8GdCvhLz9xb8Xf9azU5UHv80rwg6yYuerOOdffGbODcfhNr3WVkK9
         pHSg==
X-Gm-Message-State: AOJu0YwloojNqabkqF7rXpL9cM85Uq3ylDdquAPpETFviDoA+Lp+Y+b6
	qNaMZJyPlqrUb9ofmuCF5H2LidzkAeJDPg+LWiSqbCPBgVRRIH5RHpzOd8qdM/gTqA==
X-Gm-Gg: ASbGncv+Xzct0PCklsJTyPafkz7FY7kCR/AHQJCeWXYWFVFbN1d9ctYsEmOXgdfTyOn
	WPK6YWZYb8gnM6zxKo+SN4qNV53DYVDHkRHt3iIi9eMcwjqqAGGMfffHcx1r6lb5HNYuYv12GDc
	OZ/DOSRQMj/XM1xLlIU27EulFvWOlp0pE2eDDnxnLFneoPtONwUdQdG9C3TVl8EAF4eRjW1jBrb
	gFVI1IW5NE0NPqCTnLDO4LEKXQ8VbQfJ/5ckRY+GfYPo+xMyC2Ee5zXbRZA64sMcOAucQypOaCx
	wHo2lpq4gtWH6dCRluuq/lOT0UeEJ4VG5AuM75iNXZ4Sw7lVYug3q98aM6KoaSgY0pOZSUQJFgC
	AlnM7mC2gVxILPGfNWir8nhAHCBY7kgoj8SQu
X-Google-Smtp-Source: AGHT+IH2K9PXLBHDUDhCn5sZ3snhKvXMgEsIcjV1/WkDTdHxSDkoR7XVPHxr+I11p3iKRmT+T/XhIQ==
X-Received: by 2002:a05:6512:3d9e:b0:553:341f:12a3 with SMTP id 2adb3069b0e04-5533d1ab162mr3177110e87.39.1748869587880;
        Mon, 02 Jun 2025 06:06:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:17 +0000
Subject: [PATCH v2 5/9] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-5-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

If we subscribe to an event with V4L2_EVENT_SUB_FL_SEND_INITIAL, the
driver needs to report back some values that require the camera to be
powered on. But VIDIOC_SUBSCRIBE_EVENT is not part of the ioctls that
turn on the camera.

We could unconditionally turn on the camera during
VIDIOC_SUBSCRIBE_EVENT, but it is more efficient to turn it on only
during V4L2_EVENT_SUB_FL_SEND_INITIAL, which we believe is not a common
usecase.

To avoid a list_del if uvc_pm_get() fails, we move list_add_tail to the
end of the function.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..ceff17d65c60761703f473f13d87c8f2b5f25129 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2033,18 +2033,23 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		goto done;
 	}
 
-	list_add_tail(&sev->node, &mapping->ev_subs);
 	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
 		struct v4l2_event ev;
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
+		ret = uvc_pm_get(handle->chain->dev);
+		if (ret)
+			goto done;
+
 		if (uvc_ctrl_mapping_is_compound(mapping) ||
 		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
 				    changes);
+
+		uvc_pm_put(handle->chain->dev);
 		/*
 		 * Mark the queue as active, allowing this initial event to be
 		 * accepted.
@@ -2053,6 +2058,7 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.49.0.1266.g31b7d2e469-goog


