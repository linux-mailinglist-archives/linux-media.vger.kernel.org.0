Return-Path: <linux-media+bounces-22369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B989DECEC
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB0BB282118
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DA61A7044;
	Fri, 29 Nov 2024 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NaYQzduX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B23224
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915830; cv=none; b=TnPK0ijsThyy4JyT97NE6bHNePiIUiMFeumWCFNJwimsKxCXLi+mwP0s4a5LatUNipZicOvNAQWE4G+wY4Mksr1BQNsxS8gx3lAZ0r0GbBUJMIu4d6kL48O/VYVB9ZAstLjF64qO30cYiNZR9lk2EhAxeROou7RyRTNLWKMAW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915830; c=relaxed/simple;
	bh=KDAOGjpXXULpZa75pLl+o8CodfY7IbmICZMYyev2FdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozSKlbrDJNyHnN24HIgllH16yCacEVBlQlCw1k3mFi5Avlc1dR63Tprr3XSqsKqYco7EIaeJ+jGNV0FmrWuuldU1HnXB0hOoAHUcfP27VNlyIdVHkeefE0cuiZcyCCl2K3p/NFqWgoErraQUXwWWGNkj2JMAa4O9mJeRNCwAliw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NaYQzduX; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51533f41ce1so619091e0c.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915828; x=1733520628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsG2Wx3W9iEMxWqh3g5yUw4V+bP3sc1QbSYtLT8mhKI=;
        b=NaYQzduXureuKtm8f+lz5Tvdh8IrdFxPr0YwAuFJoGNwuSH8Ir9lT11NE6ebrCz2Ts
         fiPUI+u6GObFm7qjuU93nToWOIdY0h/XCX5cXLy6aSp5P50Y2lPYeGdOzNlr1+Ele2oO
         CBQh2d6L7tT7z8CASI8UN6BAoIt4cfTHd3tJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915828; x=1733520628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsG2Wx3W9iEMxWqh3g5yUw4V+bP3sc1QbSYtLT8mhKI=;
        b=J+X2abSOCukndu98KGpsLG/tx9xRVq0K5GOL5DoqpjqfKotjzZtXq0vvaZn9fPPqgx
         JEVLANR8RKStda5TB/F8rQGXG5BItKGkS9eeKvyFkjM0YobUI0VwkBvlW8y2IJkhVfCt
         pfSsSoqCgk/Y7i0ACthTFMeaVp7T6+ZXd+EZtG3ZT9/H1H8eJZOJA3pio2iSsv3o2IcA
         0EcbFCkig9wmHNAvynXzs+rmdQFopFW5zNPEleBLtb8ssQDpdacLde/NY/CsnS5nt/b7
         1P9IGu4apjikyMh2lPvsEoruLk5wxLnK3JU6uBn8cA4qyzd/omT1JiZ4TL5ORSDpOCvW
         L/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPFeoHBxCShkVrxXbGPdVCiVGHeBLlffacWS+8yAkTWYRJRz2S2ARqynaI0d6HtSbJV+FaOUOqF9S+Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk1AMoKTbtGbeKNiymoqvjQv99ACKMq7iiPID7dfyqQxm65U1l
	Db6B9KzQqENPb9lD1G7MN8s1P1lU7nDPmXZQnUoJ5NhnVp5D2kXu8vnw47svng==
X-Gm-Gg: ASbGncsqoWLNDJeA7M5+8lcLLjBjCa083XYOPly2aL0SgIJt8ydWcXG06hFaDYQ4qRb
	FA+qbQxwW+A2kemy6qFcXCD8uPPAO0pLUhJErjmtup0ChIqZYZxshUOD+OBJ/Olk8GeokXsXW1W
	txSTlPURA8J2/JsaJTLAK9FInIv6ZgPAZMCDW0NBey1yRxzpAVCJmWvdFfnTAztAHFgfxPqTBbf
	wl4aINy8jB4WZWu++Qf6XQJv5Noh0j6QuA4re6inzBPzAxMQrauSw9DN5eTpYmyVU85WNqB3L/q
	/t0ZYxtFTz0CU9IY9LoaIr00
X-Google-Smtp-Source: AGHT+IH/h19gXrwsr/4Bm2brThGr7h969wtQPyxlHGBXmx03EjgzxndUgkQD4dm85b4dZ4/o0JrBRw==
X-Received: by 2002:a05:6122:208f:b0:515:3bb5:5622 with SMTP id 71dfb90a1353d-51556a15ed7mr15838902e0c.12.1732915828303;
        Fri, 29 Nov 2024 13:30:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0c1b7asm607254e0c.36.2024.11.29.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 13:30:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 21:30:15 +0000
Subject: [PATCH v4 1/4] media: uvcvideo: Do not replace the handler of an
 async ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v4-1-f23784dba80f@chromium.org>
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

ctrl->handle was used to keep a reference to the last fh that changed an
asynchronous control.

But what we need instead, is to keep a reference to the originator of an
uncompleted operation.

We use that handle to filter control events. Under some situations, the
originator of an event shall not be notified.

In the current implementation, we unconditionally replace the handle
pointer, which can result in an invalid notification to the real
originator of the operation.

Lets fix that.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..88ef8fdc2be2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2046,7 +2046,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	mapping->set(mapping, value,
 		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
 		ctrl->handle = handle;
 
 	ctrl->dirty = 1;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..ce688b80e986 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -150,7 +150,10 @@ struct uvc_control {
 
 	u8 *uvc_data;
 
-	struct uvc_fh *handle;	/* File handle that last changed the control. */
+	struct uvc_fh *handle;	/*
+				 * File handle that initially changed the
+				 * async control.
+				 */
 };
 
 /*

-- 
2.47.0.338.g60cca15819-goog


