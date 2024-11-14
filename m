Return-Path: <linux-media+bounces-21429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8789C9242
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46A3281D59
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BEE1B6CF3;
	Thu, 14 Nov 2024 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g1TOtMXc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F4E1B3941
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611464; cv=none; b=DCYGcQWzgHqZzG8UTBa5eJEyR2G29cyUxFMCfzfKuGIKm8FDlydQelvVSj1sS8StRZ/EzJmLGSOhMfTtqXP9AAh+IJUp2LhK9cMYKFOFNlHIML/O72ghaqZ9azHiucGnDFOXD9ps0xBHzxtEbBELutlYC7BFbFTa9T5IZwiFT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611464; c=relaxed/simple;
	bh=k4uDTu8QR04JKFyNIWvlkLGzbPquiHwpezPKOuusA5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKBiQVSABMid584vtpzfoqWhAQf6S4oGKIaZ/GTv6dQiRUEQPBC4CyThMlAuskbFvkVlN2KLl6sYu58Mz2jwqLdUCZFEFU2EFtRVA2UU7QsRC3ANxKdTHHMjI61jnRqiOW1x4w75kiuLr6jdS8VUea3QOuu34fa8Rem4xW5gfag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g1TOtMXc; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d382664fadso5471716d6.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611461; x=1732216261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7E0huVHEFwjCBRTjS+ylKmb8Bs68bY9XRKBoQt8QA8=;
        b=g1TOtMXcFxhUxMNeF/MUlcxXweZKbgYCFpexSiqJVvO6n4qcvJ5kdxppqgdu+nE6pt
         b+0FkGloSQ86ZdpbfQOQlR4vLfrUuYOXMso/AGttoV6gnIllxz7es2VL/teRSy3xX45n
         cbi15V/9Z1MjlRopVTgX8EqaX0OhD7v3lRvC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611461; x=1732216261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7E0huVHEFwjCBRTjS+ylKmb8Bs68bY9XRKBoQt8QA8=;
        b=qcwaIQMX7a6yak/o6dh1ctPBTSofWNL/AZDbSds11BLGkoQUxbYEAucsXa9cNCGFJH
         djxI2TEhTT9djJV3VMS1g4xYTS7HZ3pFAKVbp3epsiAKb1QAM+JhkK9E/NAWzmTsuuMr
         Tr3IF4/LipM7aLv45lwbHLY0fuAT0uQyU+PT+aDqnRYbgvtMsIRQ7LcCU9UvrIT8sPUI
         rJgoI2TcccP6GVWYpMmbDlFFbRiiA3zsSFtkcB43iLKqHM3kn2uHZEDGqcnz10XwOsjv
         1sicz+rOH5qLw4aU163mRjPyG3A5JOXHjHsHdxuhbgPgCT747YMwaAdVJ+Bj/NuqFJD0
         HFtw==
X-Forwarded-Encrypted: i=1; AJvYcCUhLXIJTLwI3zDgy3QhjSy/VlrVYIgGDUGicd5nNDhZ+YZtHWWkL6X5yHPy4c5svtbxjbDMs9xLKaBqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx936tSmUlI42QHAzQEptPkmCGuib66STNWx1rIzNzGRMRyPz3c
	r3M8sxhHpLS8J7N3/6kCkXN00CriXdZixnwwTpCAW8uSm560b0QuigjRq9owfg==
X-Google-Smtp-Source: AGHT+IGZMIzlcVDne/EBA7zSnMfQWXO3fs22rn5PFrTiSjbHbo9hkBJ1di5xITi8OVdVSgzseLvdGw==
X-Received: by 2002:a05:6214:4909:b0:6d3:f73c:4430 with SMTP id 6a1803df08f44-6d3f73c6993mr22012796d6.26.1731611461706;
        Thu, 14 Nov 2024 11:11:01 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:11:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:46 +0000
Subject: [PATCH v15 17/19] media: uvcvideo: Add sanity check to
 uvc_ioctl_xu_ctrl_map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Do not process unknown data types.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5000c74271e0..4c88dab15554 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	int ret;
 
+	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
+		uvc_dbg(chain->dev, CONTROL,
+			"Unsupported UVC data type %u\n", xmap->data_type);
+		return -ENOTTY;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;

-- 
2.47.0.338.g60cca15819-goog


