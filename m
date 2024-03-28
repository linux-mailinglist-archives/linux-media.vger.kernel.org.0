Return-Path: <linux-media+bounces-7783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F177D88ABCB
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BD6E29C322
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC03145351;
	Mon, 25 Mar 2024 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OXYX0vK7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498714430E
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711384301; cv=none; b=gAyCtpdh+luU/5hKxNqsfRdLEMGkn7OY5OHlWvTdFVbM1uVWGh0em3hIZosGGfw8rtVbiKWfgZjTsXgsSnN2f9AC99hzLXwF2RNJC97nbfSXUXOXTqdlE1MQNxerZ4HUbB6ZZ2GC8Rs+flCRGXYFYH/cJlZZeSE7ksQiz3pS950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711384301; c=relaxed/simple;
	bh=aOOKQc0+BjjZOy3Vjv74lXq/IqKybd1rwgZmgeR9ipA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuFSgkbNIlrm27dofo54zWoTQ5LuJMSiMDQQ23LZtdGrn8nUzgUti1lt5dbDZyEsyb0VBLvGimJ/qMDkX0y8z70zsLXeF3rx+a6ynlv7g5qMr+OLvBvDwybCg8HUIRM3E6mm5OF3wz/u1ZlFNb1BV6eCM9l2sOZRb0iBqJG1MD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OXYX0vK7; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-69699fecccdso103016d6.1
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711384298; x=1711989098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVxxZahJvjEwwum0ohe5k7ku49jCEwk4G4aHidn4xg0=;
        b=OXYX0vK7tfQH7jnw4traRHrdXVn5h7uu7+Bgvg76LCeecfwZ+kS3HLO4eCl3oj3JWg
         VDrwaV/1LJkcJNau0Rqwmpq/wEZ2fp906JYMrjLKCtGCBKu1LNXyKAMRNZJ4l3SVSqoD
         PaKb/AQZEZLfgjvFay1pKc0eFBEru+y+ZJnu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711384298; x=1711989098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVxxZahJvjEwwum0ohe5k7ku49jCEwk4G4aHidn4xg0=;
        b=oYm6ZuQ9PVzlcD4PCFoME0/wmZnq8zPKxe9zbaqkTnTjMvKkLZ4j8XrnI4qWm15rud
         wZcUuttqT0qudOfiWtZ2wZK4a3i8ZKhBqZSVEio6TBWSQS+9JZSnV0fYKWMrNAdSn4zN
         lqomZNqedJq04jJhXC77cesPA8BHMMO+Wfkpb/vLHINFxj8lBx8EL930kBIXqh+WWyvS
         NWoEg0Qj9URdIRBRn4cvMSHtYeNjyckpEjwRA7YNgeYJuNFhem6WQzcTnXEnDRRr2KgU
         k/HdfQj7Xuw6iJzkj8TEAeBKSHnDPMUSnH7t7pWy5pkC3+tXQQuYUkEvD24EEwU71ot0
         CVew==
X-Forwarded-Encrypted: i=1; AJvYcCUzQiThD7RN7+KfHsFVnNrFwvsPSQZKgULRxtS6MGARKAuW1S3+nF6raXVdPsPLh7LFl+k34HbllxwKvo/hlDNFphULFAbDfByI9Hs=
X-Gm-Message-State: AOJu0Yz86UQUm2kD2b6c/tl5vbd91ynAHWKTzgi8CL411n15KLYR64ED
	qISO7xew2gIm6f0kcs4XwJIV6tW6az8GkwIz/DqDEzcA22NO1V0LoiY9P0aeoA==
X-Google-Smtp-Source: AGHT+IFaAdbf/X8AXK38Yh+rghPapO/rYthILa86FqkUwUs85GXtW0rd0aFddwLw/d0hBD3qkfuVSw==
X-Received: by 2002:ad4:4303:0:b0:696:8865:3437 with SMTP id c3-20020ad44303000000b0069688653437mr3182212qvs.65.1711384298419;
        Mon, 25 Mar 2024 09:31:38 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jr9-20020a0562142a8900b006905c8b37bbsm376330qvb.133.2024.03.25.09.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:31:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 16:31:35 +0000
Subject: [PATCH v3 3/3] media: uvcvideo: Exit early if there is not int_urb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-guenter-mini-v3-3-c4bc61d84e03@chromium.org>
References: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
In-Reply-To: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.4

If there is no in_urb there is no need to do a clean stop.

Also we avoid calling usb_kill_urb(NULL). It is properly handled by the
usb framework, but it is not polite.

Now that we are at it, fix the code style in uvc_status_start() for
consistency.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index ff66482346dde..f644ac7e67427 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -308,7 +308,7 @@ static int _uvc_status_start(struct uvc_device *dev, gfp_t flags)
 {
 	lockdep_assert_held(&dev->status_lock);
 
-	if (dev->int_urb == NULL)
+	if (!dev->int_urb)
 		return 0;
 
 	return usb_submit_urb(dev->int_urb, flags);
@@ -320,6 +320,9 @@ static void _uvc_status_stop(struct uvc_device *dev)
 
 	lockdep_assert_held(&dev->status_lock);
 
+	if (!dev->int_urb)
+		return;
+
 	/*
 	 * Prevent the asynchronous control handler from requeing the URB. The
 	 * barrier is needed so the flush_status change is visible to other

-- 
2.44.0.396.g6e790dbe36-goog


