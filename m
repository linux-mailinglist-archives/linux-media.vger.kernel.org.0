Return-Path: <linux-media+bounces-20649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 597BC9B7BFB
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DBBF2818CD
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5D419EED3;
	Thu, 31 Oct 2024 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H7SpPBNg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016871A0730
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382207; cv=none; b=XQQMe33hYsDtssZQ5DxaQVYHUkXsLHzA7tG9oTxMmRmi6z6CystcI6wHo2GeJRyFwmSaCT3JAbFaqmoubvEkQNZIJfeGE96VhGkZMAqG2OdgmJLvqEI5NM/h6sgkdtADUX7ynGQw/dAehMNAPBu9Uw92tMHCn/LBDN3W0ZDS2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382207; c=relaxed/simple;
	bh=kmfBVkJEZgyP7qLVgVd5KbUMONRw5aQJxZxokPMJLFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtGR/KOVmhwNMnTUFVpQ5wEObcACd3Z3Xawwmq4JMkMl99mZ3qiddfTIbGm4Bx0qS/+rgPtEhARqvp22Qtru5lMAF9Zg+RFz+AcnoruLIAvlDEqwjm6Qgih4eD5m8JDHWb3Mm1O+kOOYcTy6S20CWBf7el84Mb5Ie3lspARAKq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H7SpPBNg; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so8450386d6.0
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382204; x=1730987004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GhYJZf/q/jt/6wnYwOt5+9I5pH5dgpUegwqN2iEcvw=;
        b=H7SpPBNgU9TMsu+zXHXWO3Qn+HKDCYZHa+XodK716h2FkncDYixA9DyQxD7W6/oA32
         9A2asQZnYxycd2mj7Jrhmlxfu+6637A3DOs6WpiIWr5YY9+Qrwj2SjGLDJWJxLnT3M1r
         Hm4Puv77K9b2IuHyjmz3uFOT4FqFG9xvgLLmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382204; x=1730987004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GhYJZf/q/jt/6wnYwOt5+9I5pH5dgpUegwqN2iEcvw=;
        b=DIBwb4enWI/Kk/+ozpHPkctpCUATc+2LVMyxSw84GwDGNHb+SFjF5zwBvlFjip0Bww
         Bf50hNVagyGHnm2jpENs80lZ3Od/1tz9Bia/0Bn6POwIASkE3zWTh05WN4CfVN+207sl
         CiSqr3/yxinL46ISksi+dp587qfi4+ZGbynWWflF7/PJ2VmkKJ9cJFkG9eEl1dmjJguT
         u3A7RnUTA/+iSWvPm+rFjkzroJwdFcCaolk47fBzLkPpmB7fC9yeND4Q96RdMuPjETUe
         CWhGwrvl76+x3T+aNk0IuictPqUQiAduh7SKGp5MPzfWQ7voZagr1hwV1VlrMQ5udXZO
         az/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhytG2ZVuplFPLcad2Y4xER5RrvzfIqIjz7p+K1asM/1dd6HbWch5Iap1Pt32GtXc6oyJAs1HxnJ3wUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IPSiFKjAl0slpckohVbHclAs2fvykxWzD/lsWgjAiDQ0JevJ
	PpbDKbUVm7VmE3Y8jJQs1q3ovJbD3H8Zr9exZb0vIrcoSBHvFqNXO1O5VOSGsA==
X-Google-Smtp-Source: AGHT+IEpMT1+deQAzIFiMeh++cnIKQpHIxRIybIRfqhA/h9vWt47DlYMoffk71eSJSfu2319SnPmfQ==
X-Received: by 2002:a05:6214:3f92:b0:6cd:efb4:2efe with SMTP id 6a1803df08f44-6d354318a30mr44058766d6.24.1730382204026;
        Thu, 31 Oct 2024 06:43:24 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:22 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:18 +0000
Subject: [PATCH 5/7] media: v4l2-core: Add new MEDIA_ENT_F_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-5-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Add a new media entity type to define a GPIO entity. This can be used to
represent the privacy switch GPIO associated to a sensor.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 4 ++++
 drivers/media/v4l2-core/v4l2-async.c                       | 3 ++-
 include/uapi/linux/media.h                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..7ede3954a96a 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -24,6 +24,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-ENT-F-CAM-SENSOR:
 .. _MEDIA-ENT-F-FLASH:
 .. _MEDIA-ENT-F-LENS:
+.. _MEDIA-ENT-F-GPIO:
 .. _MEDIA-ENT-F-ATV-DECODER:
 .. _MEDIA-ENT-F-TUNER:
 .. _MEDIA-ENT-F-IF-VID-DECODER:
@@ -100,6 +101,9 @@ Types and flags used to represent the media graph elements
     *  -  ``MEDIA_ENT_F_LENS``
        -  Lens controller entity.
 
+    *  -  ``MEDIA_ENT_F_GPIO``
+       -  GPIO controller entity.
+
     *  -  ``MEDIA_ENT_F_ATV_DECODER``
        -  Analog video decoder, the basic function of the video decoder is
 	  to accept analogue video from a wide variety of sources such as
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fb..8a902fc897d1 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -320,7 +320,8 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 	struct media_link *link;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
-	    sd->entity.function != MEDIA_ENT_F_FLASH)
+	    sd->entity.function != MEDIA_ENT_F_FLASH &&
+	    sd->entity.function != MEDIA_ENT_F_GPIO)
 		return 0;
 
 	if (!n->sd) {
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..62fc4691923b 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -84,6 +84,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_CAM_SENSOR			(MEDIA_ENT_F_OLD_SUBDEV_BASE + 1)
 #define MEDIA_ENT_F_FLASH			(MEDIA_ENT_F_OLD_SUBDEV_BASE + 2)
 #define MEDIA_ENT_F_LENS			(MEDIA_ENT_F_OLD_SUBDEV_BASE + 3)
+#define MEDIA_ENT_F_GPIO			(MEDIA_ENT_F_OLD_SUBDEV_BASE + 4)
 
 /*
  * Digital TV, analog TV, radio and/or software defined radio tuner functions.

-- 
2.47.0.163.g1226f6d8fa-goog


