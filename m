Return-Path: <linux-media+bounces-11232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73C8C1366
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 19:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE61282943
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 17:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CD0BE65;
	Thu,  9 May 2024 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tx4+7vB6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002988F44
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274359; cv=none; b=Izocuz2YG+PS6w6CoQ9NJg1xaYKJrZymckcl67rIUQotDZ7mzhPQ6oh+t4IWhotxC7NjERIIYXkY3KMujdOa6Bduht2LY3wx2aJTrtc3RTY94Fw9vcIpvFlmdVC/9oSnDICuZePNRqWzRYu6VDi4r6k8RO+Guf0d80F2zDsrM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274359; c=relaxed/simple;
	bh=Q3sNmdeS94+C7MoS3NvxvgzpS/Bh9LDxSVr4O7edpcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c99tw9C/7p+87VEsWH2qnuL/D5+n8nzUuHKVOEH2ehV/0PlhHrT7i+4H06TGF0/l87jdUwmg4GO1QYYbYRPW2R1xOyr1MEEDukPZ03U2jiP+y+PQYdjm/Zp5MxedCPCeVnPWtn0oLpgfRr2A9lDt/pLhZn19x8ITqMRXCO8Tpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tx4+7vB6; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43d2277d7e1so5559341cf.1
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715274357; x=1715879157; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEqKDH2sBB2nta/Np1zrw7eWT1wxg9AR95my7CM8l+g=;
        b=Tx4+7vB6wQEtC8mkor3dgYA7bIgMzBUFsyzNW6JjheuC7WkXikEXwBteoG3+Y1FEth
         cutjC+1a1nMwIJZDXrT7OB7+SlLkPKx005h7Hdog9Y0HROBYrn3EqTuGVbiLgQhRdXRI
         Xn2P7DAwkW27T9eC3ZfKRoVZs93RtbtxEZwnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715274357; x=1715879157;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEqKDH2sBB2nta/Np1zrw7eWT1wxg9AR95my7CM8l+g=;
        b=qcIOoJioeuujZtI0I9JXjqgG95YBk/2B0ECdSNTWLVfAyFEVO0pmAfyhaUiZO1TRa4
         Ue0OWIoFWXR857o8uJXyIV6i+hFbSPa3ZbuvH0/HhPl5EpDtkSGPIbCIt4jicinxkjs5
         4y6jREc8u5rQL343CfxhWQcQEQnamnXg+1G63Rtgec9S+O+5xC0D5fkHbGdZaQTUlXR0
         5jnoh1PHYAoux7hkwxk1HjOD74gqP46UUtyENsW2jG37UWyQH4ddtwWKyt29e88yTE8l
         EQSG8Xtl517RPUJHJviRAwca7QHFQhw8pFN9OzyEJ6/N1z/5Mr4nwcmq/4b59VpL2HMA
         Eitg==
X-Forwarded-Encrypted: i=1; AJvYcCXrjyZizEGrbCFXoqZ4yaCoGtX954U7yTV1ZS1CfS2QSQMEvf7J5FqVwrFNpkD3HJs34TLyr9CZhqiKGKUgDBUWPfYXZnAAsBdnJsY=
X-Gm-Message-State: AOJu0YymyfqzYERKmDMQxE84S82CYWWjcr86YgXaIyoYm0855+4MXw0i
	KpVlerfuGmT4DMb9iPKwO+THIJUefm9+abcypYMJDFvInpO5uNJph+uLfNUeTA==
X-Google-Smtp-Source: AGHT+IFraMLLw7LB+hj1IfI8BLqLEbAJqDLGf1QYnKNG4T8HpAQjYLPH6QHmahQLENS6zk+QqulHOQ==
X-Received: by 2002:ad4:5aea:0:b0:6a0:d4dd:cb44 with SMTP id 6a1803df08f44-6a1515c7de8mr76797036d6.62.1715274356893;
        Thu, 09 May 2024 10:05:56 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f194945sm8623726d6.61.2024.05.09.10.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 10:05:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 09 May 2024 17:05:55 +0000
Subject: [PATCH] media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY
 get_selection()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-fix-hi846-v1-1-1e19dc517be1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHICPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3bTMCt2MTAsTM91k4xRzc3MzCzMjo1QloPqColSgJNis6NjaWgB
 MN32WWwAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Martin Kepplinger <martink@posteo.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The current code does not return anything to the user.

Although the code looks a bit dangerous (using a pointer without
checking if it is valid), it should be fine. The code validates that
sel->pad has a valid value.

Fix the following smatch error:
drivers/media/i2c/hi846.c:1854 hi846_get_selection() warn: statement has no effect 31

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
While running media-ci on the last patches there was a new sparse
warning:
https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/58524338/artifacts/external_file/junit/test-smatch.log.txt
---
 drivers/media/i2c/hi846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 9c565ec033d4..52d9ca68a86c 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1851,7 +1851,7 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
 		mutex_lock(&hi846->mutex);
 		switch (sel->which) {
 		case V4L2_SUBDEV_FORMAT_TRY:
-			v4l2_subdev_state_get_crop(sd_state, sel->pad);
+			sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 			break;
 		case V4L2_SUBDEV_FORMAT_ACTIVE:
 			sel->r = hi846->cur_mode->crop;

---
base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
change-id: 20240509-fix-hi846-c3d77768622e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


