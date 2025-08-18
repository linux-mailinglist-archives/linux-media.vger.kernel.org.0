Return-Path: <linux-media+bounces-40188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB961B2B22C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54C8564419
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB1327466D;
	Mon, 18 Aug 2025 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S9zSFeoo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F2202983
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548143; cv=none; b=hTUJ5/p/Ait07ZKTKH32GZxAFbfoyBdcA8KXXpiAw7Ek3s6kLWE/Xa4vkaN3+IxtNGaFK5jndf06PNwGSASm5AnmvDnur0lJ1KugAiimS5EcCtLgGBXLTJwm/IzrJwzJxacSVbc0MlNzGZVBrTZXI9zcfS40TJojUqjtTkKJneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548143; c=relaxed/simple;
	bh=CaUrB4UP/dAbYK1r25EfF08W4CEvtMBYfIS5kCBy6PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/I0b+T4LxbCLaTgoTH71M+H9gqJ9oZceGDNuhntsDweHaMq+Pk6ggFfWm+TMLpA7aFlR6qyj0Boa23EQL/dKfIscFMYue5JQI3HUSHynDY5Ug+E3A7fadnEgxColxd+GSV/poueIp5xnaYDYQ63+MDSY5s5QcRkhgx6YMAqrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S9zSFeoo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce5268cb8so4361786e87.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548140; x=1756152940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7ecUUREqZxH3NQXkzrG8AHXGf+HApsHSTGrw6/8F50=;
        b=S9zSFeoogljdQWelQcjANXDsyyY+48RiE+TLPqFb6qREMI9JHz/jkC29faZnEaVmVI
         KmSk5e8eJWxNfYtI7Cn2T3AzKLvRSO3G/d1Yb2kVkeQ3XdlCBc7yFvto6n0W8qeYRVwl
         e1BaZeQCT3zPFPGPFa5n+p3FMbOyWgj2lL8Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548140; x=1756152940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7ecUUREqZxH3NQXkzrG8AHXGf+HApsHSTGrw6/8F50=;
        b=HgodGhPM0+8fR9qwo+V2Od6iuFGbHLYPCTMDwMRH9N+oyUPFhdTf9d/G8+BGNG2cvr
         SchBc29179mcVFHhtykXNK9rp0+fyLp2rNpXpRd9dB1YnuCOo1otLGZYNSE97SG4BDo7
         BjuHvxnxbOBDlkknOEOOeD6nQWLKpS3ELbdUrwPEpird/IZRzGOs6dcxIJM03R4PZDFw
         V/ycPEAHpuafbb+UCXemkg9CpOYOP1Fp2NavfSYkHWcIXyIxVE/2MsKm1yqJDLZiLmNm
         qU96YaM79vNBKYfKQmZIni/UqruYaqoPXQ+GzCwqgXRrF3xcMGufC2yiblM/cp6F6Jz3
         FMRg==
X-Gm-Message-State: AOJu0YwaRCamkJDUedwMPq20PF+21cvaDowpX42o/tMinUNqdzAo2Eq2
	H4anceeiIJYXyKWIRjdTg8y02oF5YdUDkValFg/kup2tmZGIHVO/ptwP7yLgWchZ0JTGfn1NPED
	9Aow=
X-Gm-Gg: ASbGncsh1s2llU47GMJhn717ZpJn+Z6oidlftbJ/+sbtbbYxLrDayDuk0nCE/k5lRVR
	QZKg7o2i8WlY4bEOSyoRgh9++B6Hxf+IqOp4fK4XEzRXLA6DQBGLXAJzWiZCTxFAgbDMPEeslPR
	SPOqScI8L+0qR8xaH0wTuVzmswJhSv+dLujupA5RyQ2uGvwj7jw+Vwk4jUWnsOEjChfHPTad8k5
	RZk6vjubpWC4kCtPKALQYQfHWRr78P57m/MzeKen9JQAaBPrVZReOCwhgNPvUX4EogiOjOV/F0R
	i9/TBjSU9ekkZDGfKMYJCT0jtWFKIsF1uQvJRRfYeyryl2RMmEWneKnFP7DBSxh/VccdCiGyua6
	BLLFaCRPASejCQ22cNqYOR4fWgEzaj4+ksCXdAP2vOupUfcFEWw9NCg1hIV0mnHOqF2RgPcRgFu
	s=
X-Google-Smtp-Source: AGHT+IFb9FqH/R1wchdlDtJrBvhxMgTs/qFlhYR9eOTJJ/bU3X+4wqPPopUwbCGpty45TkWd2J9jvQ==
X-Received: by 2002:a05:6512:3b13:b0:55b:9045:ec5e with SMTP id 2adb3069b0e04-55e007651f0mr50179e87.18.1755548139615;
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:36 +0000
Subject: [PATCH 1/4] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-1-f7ea5e740ddd@chromium.org>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The comments can be more precise. Let's fix them.

Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250716-uvc-meta-followup-v2-1-d3c2b995af3d@chromium.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 3b0b392895119bb6ac300fc40b89a7ea00e56b40..b0960f0553cfcb30b0036d2ad8877fafa225c6a4 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	if (!data)
 		return -ENOMEM;
 
-	/* Check if the metadata is already enabled. */
+	/*
+	 * Check if the metadata is already enabled, or if the device always
+	 * returns metadata.
+	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
@@ -208,9 +211,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	}
 
 	/*
-	 * We have seen devices that require 1 to enable the metadata, others
-	 * requiring a value != 1 and others requiring a value >1. Luckily for
-	 * us, the value from GET_MAX seems to work all the time.
+	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
+	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
+	 * reports the maximum size of the metadata, if its value is 0 then MSXU
+	 * metadata is not supported. For more information, see
+	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));

-- 
2.51.0.rc1.167.g924127e9c0-goog


