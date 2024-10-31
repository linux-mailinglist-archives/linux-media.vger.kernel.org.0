Return-Path: <linux-media+bounces-20650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4269B7BFE
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C18EFB21BA6
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF471A4F01;
	Thu, 31 Oct 2024 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Duepzyif"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74551A254F
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382208; cv=none; b=h2NP2FpOgkUyHtsrouushD7wVhnzqJi1/imnTaKcTKX0ESCPttx6tWBmGP8N6LKv5xKlfAHej28WGuGEsOmo3Hy+poSLQxsCGyToEAHx4fllD7oXnBY7/TeWrnIBbAlOpDc3Sr1cNXlH4cUhFxd5dtzXL4WPSwFildFQIt+DFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382208; c=relaxed/simple;
	bh=blJa50xw0lKvopXaZAiEuV1VgzhB5oNeTs67sGqviXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGnSxcm6fRp9fpsGFy/fBW01wIc4L5ZgAdiZ4e+OKzeEOeTYnivEqR3xveohzl6S+lFXMTnZpjjBDDgAoszrO423sOXqaqGfrcrIfeW79nJtztOUodSrWm2tXIsjFXulLVqbqiblA0WfbOcFN1C+qRq/e5hQAqlwToLc8sG3Kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Duepzyif; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b1467af9dbso64963185a.0
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382205; x=1730987005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daIxjktyxuG2VDq53N9YeRfidBwsAYBDLHTz0c0/NdA=;
        b=DuepzyifCKYIt2owSji5xtsnqHJL8zeESEqtekpBWyqEN1G56Vub10z3rSZi/WkqAX
         4QTzhUTd1ufhJ/Yjp3f5E2cY1UpwYcDJM9EKmXA3KBLyxn47x88wgBSVQNpiWbWh4RSh
         XEsvoMotnO+HNJ2cTMeXuavr2z6lUeH1hE+yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382205; x=1730987005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daIxjktyxuG2VDq53N9YeRfidBwsAYBDLHTz0c0/NdA=;
        b=hd2O9VfWIJosVIv1GdJ4FTky5yttVDaemytYTAMuV3vyj5c9Zgisx0yeE8ufV6qGxe
         PTo6KxagkyOAB68BVKpsxBcAe/VZa/TXgeKiBQHxGXBTbgoHOdkiID+dLBFwzdDoFuz0
         2C4JtTz1Vs/sQsaNn6bLVhicD8a4YF308CCioMLrmLayovC5G+q/rqxFnqj15YMf9ojD
         f2DdRhkRFmsU2wi/b2/SCLchrCIQ3Ak6b64zVpIHDzh60M7gCDzbB33eyFTjoHX9hjwd
         YKlA3Wc9hBy0z01INQ67DUXq1OHwkmcbyeJ8rLq5baH4jMa0XwurkXACvPLCFgsJRopW
         vjWw==
X-Forwarded-Encrypted: i=1; AJvYcCUjvTwtR9pHAbPl/htwl/CoDJh0IrUz1moCYbhaoQPRR0w34TbvnLU0zh2fKKchhtK706y33DUkVrOvbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRloveDFCnJNXx9stIwquBi6/D2IMdN4Ej37V8YsQq8kkz29YG
	WB6OJ2fso09QC077ChGvH5asSVkP02oiUrJtE5tjr37eafZ3y1IenNFMuwICNQ==
X-Google-Smtp-Source: AGHT+IG7Pr+EQGs4svOdqXUCFGOmSkeTMmvCRbqYTY2HIOLnsdesNRsmZ1TW0g4y8DD6bLq9qYnE3A==
X-Received: by 2002:a05:6214:3bc9:b0:6cd:eeb4:4f73 with SMTP id 6a1803df08f44-6d345fc8799mr93692756d6.14.1730382204713;
        Thu, 31 Oct 2024 06:43:24 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:19 +0000
Subject: [PATCH 6/7] media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO
 entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-6-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now we are setting the entity type to unknown for the privacy GPIO
entity. Which results in the following error in dmesg.
uvcvideo 3-6:1.0: Entity type for entity GPIO was not initialized!

Use the newly created type to fix this.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index dad77b96fe16..3cb95df1f670 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -114,6 +114,9 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_ITT_CAMERA:
 			function = MEDIA_ENT_F_CAM_SENSOR;
 			break;
+		case UVC_EXT_GPIO_UNIT:
+			function = MEDIA_ENT_F_GPIO;
+			break;
 		case UVC_TT_VENDOR_SPECIFIC:
 		case UVC_ITT_VENDOR_SPECIFIC:
 		case UVC_ITT_MEDIA_TRANSPORT_INPUT:
@@ -121,7 +124,6 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
-		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;

-- 
2.47.0.163.g1226f6d8fa-goog


