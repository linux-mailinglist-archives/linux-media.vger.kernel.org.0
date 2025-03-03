Return-Path: <linux-media+bounces-27422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A49A4CBD8
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1CB16C35D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9AB241684;
	Mon,  3 Mar 2025 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mMYFchE8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075742356B7
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741029231; cv=none; b=M+BLLuHbxuqn5P/JMQIKirzMpwlECml0Fw2yVkGZpgzwtgNCgVYp6UObz6Yh25I5PfnoP/4A+xRP9xlqhXRijHStXsSO9Kmhn1EI9x8fLZd9W+gT67rNuZOhij4H8ooAqn3nuHx+zEWiSorojrxdk2BYt2DsGmJEVBF3hkD7MV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741029231; c=relaxed/simple;
	bh=HpW9eV+pa9FArjj97V5rJZ74WC3ZIrPxYtpcWzZb9cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0+YEIvytHoGvP8fKIc8pJuELdbYNT6I2BbHO3i+r+gcxdLdpYnPE2YQTRb2mYl4jrhQe6bfLUnOOOP/MZj9FyfYmaQdUKx8DBS/mThaV6dHoXSNietEC1DCuBAwrX8Z+oCkTsTwMeWmP8Svc4HKj/QWB5nSGGfyJWekGq2sxcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mMYFchE8; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-471f4909650so43731571cf.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741029229; x=1741634029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90N1gDxhZVWniJnCXj40uTmKdZp7+inJI9RZU73Ve9c=;
        b=mMYFchE8oRivk/EdkOgYNQW5ZQVaZe+9/F7vCDtPSCScQPUL4DY4ZXzpVk3g9p0nsz
         FdHlsxP1PHrchLPfqWVcAdLJ28+/gw2fEeJSmoiN2PH6/UHN/SwmcScMUurmy8pySk5i
         HYMkF2ZFBpIpWlqsD70ycMycpyVYtz5KR3DAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029229; x=1741634029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90N1gDxhZVWniJnCXj40uTmKdZp7+inJI9RZU73Ve9c=;
        b=I2f1+cwviRuZuf6FuwZXSge07cmOrw4hjk0giABh2Wn6ANkx1DV0qVoj0m45TkyYre
         ctmknEyNEFe5RxMQHmxdqg3AyrtPCoLDDW5/JuDtRz51MfETW8JQhCo+k547JbqaAqWf
         85Fgh+KO0pX2V30qfCv0Wn8HCtW72p5Jqaj/hIk6tdr8CsYmp7CiqfM2hz1WhqBbU++d
         ip/EP7JIDr5YzOQDPE37lCdE5st8Lb3BNlrottvveEo5zOI+n3zKTLY+5dau7x6BeXsf
         jCvTb05M8IvxDrZCYRUiLkBA915juOp8Vp2E8vQf/JhpkBnDPMlT4X1GFEqRPWVNDD+a
         85xg==
X-Gm-Message-State: AOJu0YwQb7wRRSWpVx5rHaJR4JFyaZC+7ce03MwxifnE46EHnXTCFqlq
	oCOXgWjso6O1KdZwJq42mjgHA0x2JqsP1V6oTUpqpsAEbH16EsinInnbN4LZtQ==
X-Gm-Gg: ASbGncsTIzo+RaOIsBI6J8XiURsBpG4SdLijKQYzLOwIJVcxTakJjhdsKF0IAUvd+lF
	tbVDUajzCiVBY4eU5VQm5B81STYHXk0mfOQOFS5T4MApC8l6f++a6oestL/ADs1Q2ApfGP3YYl8
	STLy7X7pDcZ0nLYFvwIqB7EbN2mGlBwLrsRoNSsl+LY7vk7z4Ue5hm5GVBYUqgkq7HqFjLGOjTV
	XSo1gDqMbSfjAocTKyGxP1nernoHtHt1jvCsReXT8zKRy5QPl0PKtdyqbAR874pqY69RbXC2+Xa
	v7TUAiddeByqZ9QJr27BbbOaED38iM5gB6cz3OTsLpfqD0hOMLZxmORtvrVpJKgc+8/TA8BfcQn
	akM4DeIFHgItZwNFvfQcUPg==
X-Google-Smtp-Source: AGHT+IGnGCMPktiCa57p8eXL0WJuUBj1Dg8JEm5nxeKyFL9/82NaQ4hsJTD+GyZW0TE5wsRVB5/k0A==
X-Received: by 2002:ac8:5754:0:b0:474:e756:fd14 with SMTP id d75a77b69052e-474e756fd8fmr65875571cf.42.1741029228978;
        Mon, 03 Mar 2025 11:13:48 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474e0f1e0c1sm19745661cf.47.2025.03.03.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:13:48 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:13:42 +0000
Subject: [PATCH v5 5/5] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-granpower-ng-v5-5-a3dfbe29fe91@chromium.org>
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

There are some ioctls that do not need to turn on the camera. Do not
call uvc_pm_get in those cases.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 6af93e00b304..de8d26164996 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1450,6 +1450,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
 {
 	struct uvc_fh *handle = file->private_data;
 
+	/* The following IOCTLs do not need to turn on the camera. */
+	switch (cmd) {
+	case VIDIOC_CREATE_BUFS:
+	case VIDIOC_DQBUF:
+	case VIDIOC_ENUM_FMT:
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+	case VIDIOC_ENUM_FRAMESIZES:
+	case VIDIOC_ENUMINPUT:
+	case VIDIOC_EXPBUF:
+	case VIDIOC_G_FMT:
+	case VIDIOC_G_PARM:
+	case VIDIOC_G_SELECTION:
+	case VIDIOC_QBUF:
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_REQBUFS:
+	case VIDIOC_SUBSCRIBE_EVENT:
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		return video_ioctl2(file, cmd, arg);
+	}
+
 	guard(uvc_pm)(handle->stream->dev);
 
 	return video_ioctl2(file, cmd, arg);

-- 
2.48.1.711.g2feabab25a-goog


