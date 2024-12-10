Return-Path: <linux-media+bounces-23001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062F9EACBF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D40C188B7A8
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC7E2343DD;
	Tue, 10 Dec 2024 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g0ZcH7lg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF12343AB
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823765; cv=none; b=EqsLh6lSvGWvaHQXsiA1wt95G5u1X3+eocaZ084G5G77lb7DVrhx+6N2yV4+OsZhn9qfx2App+1TdkhhA+fViGNPqyfqags7srEiinc9xVYG3AK/GWYEMtXJLituEOHfrNheeWRAN6BWBjqLqkkQbAZ/xVOj58+D5NBt1EPaOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823765; c=relaxed/simple;
	bh=rmwFzpOA42dIRXNsU2drW2dWyEvkHqz3gtgDji2Och0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDtt0Gi35qpBduRdwtGAI9DsxdojqahX8uLSPZdqgVt9TJhwu0e6b7shV7Znu0rCZZybNk3PIqW06w3Me0hvH7qjEkAdYTxzzAag9wvSWwJaBhlANBzAcpw9+UpCj4GWBoQhyrsUfGWer4fTEK/i4z6KeyH4IlJAn1CiMKY50SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g0ZcH7lg; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d87ab49423so52343806d6.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823762; x=1734428562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgd78hYMarmsibCfxN09wNv5VkU7Kl0GIxvAEFpsb+k=;
        b=g0ZcH7lgdUKw3HuKI6e6x0CocS+EEmi8/0aZiOK6E7N7SuqVCkgmDKlG39cWCCNTiY
         Hs7v7KP3GEXtVOPu8YpXPE+vSazCyN3b8EQJCpU7gDexXouh94cdpiH+qCS2iIDu+sh2
         RFSB1h7BgEI22lGPLYDMEAUL8VOTCC6aiU8T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823762; x=1734428562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgd78hYMarmsibCfxN09wNv5VkU7Kl0GIxvAEFpsb+k=;
        b=OqwpO0UKckZC2GRyCibyS8M8iewKy/zR7U1SAxeV2Apf1p4l2mYKjUnwMA4QQguqo+
         WGH1OK0z75qv2z3RYFut7unUA3+OS/ZbBHr6xbI1XgYGLiNd2AHsrK8yRcRNSFKF2mA/
         VXcO5cEi3CY+X4ByJmJOBXmw5LRJZaemuxFxZUT7tUEP4zXrAFSFleDT03kfQi+n7lUC
         KgNaIFwfW7OMkC9p1BZNEEmN3kRIIHYvvJEO7OOapAHofpAgwFZwOTReJFWpacV58n1D
         2/nTecuDh3hVirPZeuFoPE6I3kl1FGo5+8gVkuLolpCjXtXJnnRHu1AQL9uTJjlfoz25
         QOig==
X-Forwarded-Encrypted: i=1; AJvYcCUTwWxVL2yztYNkJI4Dgt4XmSkNt2qVrHEW6zky3VZ4Pq0fJvaBIuL1W4j2OEi0BITv8OGfoTsi1cpk+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YynN7MikS99OdMagw/grgGRar17LFPoiV36+PjS3ehYkmMgtBm7
	TXJyjE2rRkp+B0s2FIoK7h7iaCdk/KtkNvTJYqxUaFaVoFXc2OZ+yWyowlBT+g==
X-Gm-Gg: ASbGncuc/JnqLwmcxo4R8a/1fwGdCZBCaPLdzNeHB/8dBb6j0iTdRGN+HFXmCdxki39
	wJRHrR5Ld57/zSsrXTI8JcK2FTUYMrQquL6JEjZ/t/giPDtFp7e42ki1ok1RUBZxW69nT5o0c/k
	06AhEqamJbwfVPpABszbTo248XUPTNRni5EwuScVamQD2VDE3OkwZWQG5jAn4MRMBZyEj0OC0d2
	/oquB86PoIu3WCSRE/zbGvzoSR0ib+5nIQGtALvXPG7BF74GJqtamZYHVs5c5mPcOuPLm7NX807
	kjcJNcXxOIRqm+wi+i8aMz5boNza
X-Google-Smtp-Source: AGHT+IEoHdjAOUrtfazsH3n6Y31nFhgn307yyWvBWJlDV472zk6B1DrShdvegUY+dN1ioRJHlGD/zg==
X-Received: by 2002:a05:6214:c25:b0:6d1:7433:3670 with SMTP id 6a1803df08f44-6d91e2d3799mr68330476d6.4.1733823762206;
        Tue, 10 Dec 2024 01:42:42 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:41 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:37 +0000
Subject: [PATCH v16 01/18] media: uvcvideo: Fix event flags in
 uvc_ctrl_send_events
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-1-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

If there is an event that needs the V4L2_EVENT_CTRL_CH_FLAGS flag, all
the following events will have that flag, regardless if they need it or
not.

This is because we keep using the same variable all the time and we do
not reset its original value.

Cc: stable@vger.kernel.org
Fixes: 805e9b4a06bf ("[media] uvcvideo: Send control change events for slave ctrls when the master changes")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..bab9fdac98e6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1673,13 +1673,13 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 {
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
-	u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
 	unsigned int i;
 	unsigned int j;
 
 	for (i = 0; i < xctrls_count; ++i) {
-		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
+		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
 
+		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
 		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 			/* Notification will be sent from an Interrupt event. */
 			continue;

-- 
2.47.0.338.g60cca15819-goog


