Return-Path: <linux-media+bounces-27421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D3A4CBD7
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9BA18872F7
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED49241107;
	Mon,  3 Mar 2025 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n7kUDY+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641923F296
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741029230; cv=none; b=KCmYrk3sE0zxaw7XFgBVdQao2mOnu16ttqLcWNFiCiDaLQ3jMrHJ0IRjyM5B7je/vYkNih6+13hE86+WMFBKyS4EX0EUe50NkTJB9/uLBa9OpcZhlwDrB3jNPi49FZSwmHNwXB312gklkYPtAxAYd8QaJ+r7KsJrSL/3dSILPBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741029230; c=relaxed/simple;
	bh=lPK79adRklZww3Mk0PpdCX4VtxZROHYG8wz1+NxPpgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l474vsCThNkwdd+kEdbliVLtci0XSacdYkYxLPX/V+he0awGkNGg8u6CjLI77/3fp1gE/g7e39Vts/OGCDIQYt0zeYTaf+kwH+0tVsfVPx6QUO1u1Ir4sCL3Gf8i/zF8DXqnrAphqLRi/THtxivLUwtV27/t7h499zPkvs4G6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n7kUDY+4; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-471f7261f65so47223491cf.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741029227; x=1741634027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ikl6DD5slE5XP2vR++WylhZuHcrlQkez/ZWPWDZyaCY=;
        b=n7kUDY+4yxo4abB6YEk0kxuWQbtWzhcuZvJeRIQ0cHAIG1kiHz0pTEk9e2/bF3dGtA
         kDrSV2qa3Pe1F2Bn/X/Ss36s+g+1yfoBkIooZU23YFhNii/MJaU1oDoM9JIYMzFd1MXg
         BwyPHpCHs9ihnri1i0mucx7SZWxWlF63FgU1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029227; x=1741634027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ikl6DD5slE5XP2vR++WylhZuHcrlQkez/ZWPWDZyaCY=;
        b=KJpUlBQr5DqJIVCgQgsJXQhN/WrLv6mHf7BNKuXHVptRqmDXc34fhOeLK/OhKJLn2U
         Kgr8ChJc8pqFiyGW5zGt8O0BGX4aW5yZrUFVAl0jUB/AVmhgU1gabWJ9x6wHvqsYnAKk
         a+nFxcRMV1N/gEM4JvO/48EJ9rMJSHB/rWhVk4oeexLzD9K+hmHOeQPv4EAmWGTrBW+o
         c5QyIsxZKBJz8+sc4Ot1Qjo/RvVVcLloTG59UNp9WDOlunqf6gNTIxB30jltxJGL7la8
         J22WnV8UE4HIj0Mn6VryQTsg9Ochv+Vwqs8ZzJLZNPQ+5Yi+F+YJ4+xV41qMhXRnDJbH
         DyRA==
X-Gm-Message-State: AOJu0YxxHcp74piTtmF44DFL0JBTd9RxJUNwOWftGPD9fRMHb7WMpbDK
	t5BkxQ4UWCF78S2aTadsqR+tdrZZhU3UJ7U9pfDpUGNN4RHTyYGo8ZfoJdDtPg==
X-Gm-Gg: ASbGncs/SdIzmagyYiSA1iKXv1kKMCn7Q4BaXH6IgLm+IGE0nkxLnqSf8QBs5l+9vyE
	JoW/LLvDLUwXC1lcA9ibGuZuB3MslfpqShh/3cA2Qamr7JaSinyoXNf2fEYt/VwkZIQyH0BznQm
	XtCKUAotv1xSa7Ph9KJbBAFprfEPZKJZnNmajdQsFdaRqkX9E3rCX63snbXSArqtycSAVDv9Tbj
	GqgM8qhihmryvmV84Xq+RtQOfsBoHLEZtEcAxmq0/JSM2Heb+lQ+ilEA8IOJ/nYWVFfWe89+Ppk
	U7rSXjHTn8Ejd1s08hFhlhHYvTp2pFrY1swAfSEbmRbw/oyPHFATXDYDbvi/RpFkIDMHFJWIgI1
	zL6LqwltLrbP8+68ROutAyg==
X-Google-Smtp-Source: AGHT+IFHbTUMUMAOtYe4aIC70aHDkZKC+eDmzTxeiVMALjYKfsCeCsempFPzl8+QoqwoKasS5kDgvQ==
X-Received: by 2002:ac8:5d8c:0:b0:474:fbb4:8f7c with SMTP id d75a77b69052e-474fbcc549bmr6415241cf.11.1741029227080;
        Mon, 03 Mar 2025 11:13:47 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474e0f1e0c1sm19745661cf.47.2025.03.03.11.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:13:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:13:41 +0000
Subject: [PATCH v5 4/5] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-granpower-ng-v5-4-a3dfbe29fe91@chromium.org>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
In-Reply-To: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
Before the "trigger" button would work as long as userspace has opened
/dev/videoX. Now it only works when the camera is actually streaming. We
consider that this the most common (if not the only) usecase and
therefore we do not think of this as a regression.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 1c9ac72be58a..6af93e00b304 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -652,7 +652,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -662,12 +661,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_pm_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -701,7 +694,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_pm_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.711.g2feabab25a-goog


