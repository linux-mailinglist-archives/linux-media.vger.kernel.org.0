Return-Path: <linux-media+bounces-22095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4F9D9B3E
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A00B1679DB
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7771DA0E0;
	Tue, 26 Nov 2024 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cgn8Km/S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFD1D8DE4
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638029; cv=none; b=kR4nC3vAo60O1iCf/BS2nyrT3ffJbLen5CPTwXCDZS3umyuQd4jQ0leepIkZsWw2twT65gUAI3W7thuWx9E1eYoNx/vXwDsJ5i9e6k6gUZ1MJOH1muc2zNbe9C0u7xV2UPhLOUgSogvtQ7H+gW8a42g3nx95HhCKWwrQjZMsrp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638029; c=relaxed/simple;
	bh=P7cJDdqJWrLuL8K2uEZRvjaoWn4MVm6+xAAkGWyiVYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfupTq2t2Z2fYSyx1n73qk4jee3tkjp66ql9A6WP15nqM6hWHPo68p367L8djdYCp1kBMYaMJwk03F3RY0pr6OZwQBicyK/lG+joNiSGf/dLv2KEIy1cKssgY5As08ijdY4G/AoyybkLiqq3ugwTLPZw14ISdpZB0mlCqfAH7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cgn8Km/S; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3ea60f074c3so383959b6e.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638025; x=1733242825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKrUO2mKilVMnb8uGrp8DPUwicBtZJtjKmdkARmt5l4=;
        b=cgn8Km/SwG/fy7Su2kBHmgQdxp4jgrnKQwgxfpOGNl+ypdIaiXrPknhCQbvMIZTfJt
         R/a0qS+xkU7kokODG50CKAm8vWLzvpdd08E7KhjxJu90MNRAOdLwjmZpuMmjCvI6v7Ao
         Ygjfa1A1G1bBqu0wWOTFffn5hwQpFNco8sVeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638025; x=1733242825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKrUO2mKilVMnb8uGrp8DPUwicBtZJtjKmdkARmt5l4=;
        b=HQ07N7JxJYVNYsF2AmYm+aJbHH+bRYW1D/tacUFfqpJ2AAhuwsK8fdWmPzmxIWRRg3
         GDgOTvusB1thTDIWiHQEw830oNbyV3/SKzc6DpGOFkDMdJTZaaDikeixXOkP9CVpze8H
         w83BX4XPwSdfLHJq5PkBqdraDozMW0wZdmNHNCL/UK106qzmOCTPcACVKCkhFEHpgYQ/
         H6hDoZy8lASr1xxQA+csshKcQrUQW5Yw61s0XpvysUGNfh/Hfs0oHdPUdEXUompZ0K2k
         MSRK0elq7IriRPheCbSMH+rF49MRuWEN89dGkt2DTlk2ad4eIl5m0UEfc0QGWC/+1NR/
         5IHw==
X-Gm-Message-State: AOJu0YznQpuOjlJ04QRIdwIz3edlQi7uBK3HFn3rtDQJ12DKbUt+Mref
	wz8YbFLgGG84Jn55iqstr6h/SOJFpimty1awPrtw9pkL0EFZjtBPXe75WKjp/Q==
X-Gm-Gg: ASbGncvlVstQqnrueJPGHQE47eYw2bgki4tJD8veH+HnyYIxon+5rk/F9tbN5OA09VL
	c2OL1FStRJykZ/SMGEj50TFs7TZXnzJBxEWHbsNqShBYyb8fKLpYQqys+xF3GtIcdsb2xqOzCg2
	ZZesVurwum9dbWkoiDTSz7emgchCuGHcDpyDYC1bFQ1XugBbSvKJS/wv/i8fTOcURaq0BCiFe0a
	ulu0QzrnoOYDshgp8K2yuHfBBs8VKMJIqwoNFPz9ki2sH4qjkYpUXOETBlZuDIsRKMzRxuNorHa
	htX/sqmqB/1UP+9gqDGalb7q
X-Google-Smtp-Source: AGHT+IFdNgRDGrF5CTdu4yR9Csg3r8Ps+A7V5ZKG5GFvlDcY4AMEGEJVb3A2Xw6tVAlAoAPaVnBh7Q==
X-Received: by 2002:a05:6358:52c8:b0:1ca:9839:5d09 with SMTP id e5c5f4694b2df-1ca98395ef6mr446689555d.8.1732638024799;
        Tue, 26 Nov 2024 08:20:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:51 +0000
Subject: [PATCH 1/9] media: uvcvideo: Do not set an async control owned by
 other fh
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-1-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

If a file handle is waiting for a response from an async control, avoid
that other file handle operate with it.

Without this patch, the first file handle will never get the event
associated to that operation.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..5d3a28edf7f0 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
+	/* Other file handle is waiting a response from this async control. */
+	if (ctrl->handle && ctrl->handle != handle)
+		return -EBUSY;
+
 	/* Clamp out of range values. */
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_INTEGER:

-- 
2.47.0.338.g60cca15819-goog


