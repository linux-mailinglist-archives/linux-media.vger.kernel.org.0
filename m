Return-Path: <linux-media+bounces-33543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B41EAC7040
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7EE13BB4D3
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB2128E5F1;
	Wed, 28 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R4bOeQyY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBED28DF4A
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455097; cv=none; b=tVlODN3nK7uCcrYA+e6o8O20ucc+jeneWndkHRsPwe55LIovz9ci+IjxmfsXR1o56opO8XX7VVgDvBUY7PiAohDfps17RTsroKrRiGh+U5iSbLQ0rsjY8nkHazu6eAspJ47qXL6en0//ita3W+qUf4qi2an9kq9S6vQ7RcQ9Jyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455097; c=relaxed/simple;
	bh=B0jNGSufNvPJuCam1LbtuPADRfe/FotYKW4NrWm/oXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFViTSBEEN7W32nQa7Fnb34EB9lFbG0f0gtqDUNoHiX94lZTITRyW6hu7AXdQ0OFQo89qH5q7UBxCX8pZCp5u4bUA7CdGqNk1M1HPc1F1ZWi36CEETr6Ajj4f5jKcSrPY1VSyBcirr/pBM3/kSbn9Q3pbTCMYr6HdMGGvI6t5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R4bOeQyY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551fb4d153dso5798517e87.3
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455093; x=1749059893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=R4bOeQyYUuNLTp0YCbwEKuNm5OnjTvnhLt1Ql4cgb6qEHX/Ylp4IXy1cnbIZHJg+BE
         MYz+KRHzxTCSi7bwgaux4QrwcQLw4nJ5S8wuaY4d4AYbPDhFVwhjBEWpBcDbwTiJsMIv
         F7s+euQi2VxiwIYzGp21+52LWugrbg31D4gDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455093; x=1749059893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=uZPoeekTJFf7Hnb4j+L6xurxWV4yxTOCwt8rDWMmUzqNzUspzPxfBl/4We33EUHyVe
         m0NMZ75ZDJagpR/jNU8svBRDr9cU3qCGruNdmgmFG+IWUL+rlIpkXp8EQwgw3r7dUBQ5
         hVQAWT6DbsX3sChfYSYnr3xUPUQ7KGM8nmWMp0tfONjfHm1zhkU1Zj38cS05pF2SimCL
         MIzMWlWobU046tfLktQ6U77vOhhkMEsrVZ+fEtfghKfgK7UPECbSRUNmSe1jc2L/GG5a
         xnDBX+SvLoSr+BBb9kJVvaZPUSPHa/pb+qHD7/Nkd2Nim/ZWaT1TBokP47Ny+KOfFIDX
         SzQA==
X-Gm-Message-State: AOJu0YzWP5Iszr1CMPles6fll5Z+KqOdMCp37ekrLfsX+pwftCewl75o
	bAQyVuv/bQc2fMPIhHpLcfPajlp4yQ4LC8l8ZFVCe2V8ZbI4IOAja3c0U7uk9pMrRA==
X-Gm-Gg: ASbGncsGRtr1Ev1etQ5vJTsN9vQRlOMBqys8mQ/irD6u1ND03wjLlwP5UjCeHKtzgX0
	yC8z50RnRE7WnGpz21XhhF5ytybwFqOuh3wzZnjZr7VlNzlkU7Ag69eIKm++IAGX6uHtXOFQdZf
	czWXX5G3SPjAm3KI4Y1hPe27Zhntl7adzH+UbfCNQdZoCyZbwtiR23MIQ64SLkS6qwY9oWnI4Qc
	y7LJmJgrhZIZfYTQUun5U8+1KgbZNel+qsSI03BnhOj+0X7mx7D+Et0jtzkF+J8oM6WufQZid7t
	JrphIkx8cXVc3lmVfFD+/ZiR0WI5l6i0e94ezZGJvBK3loDJqqkmOcrzYZ7twNr9V8JvbJWsB02
	8w1AX5SVQDFjkWYyY//QgzJEqiw==
X-Google-Smtp-Source: AGHT+IGtfA2QUrrwfNGeJ51zXmyU21n4oPCCQEdOZj56bSgqq99gARUJkrRoMcxAFmVr9Wh8ebDDmg==
X-Received: by 2002:a05:6512:3da7:b0:553:2e10:a79e with SMTP id 2adb3069b0e04-5532e10a9ebmr1533023e87.14.1748455093493;
        Wed, 28 May 2025 10:58:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:57:57 +0000
Subject: [PATCH 2/9] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-2-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Declaring a variable for doing automatic cleanup is not a very common
pattern. Replace the cleanup macro with manual cleanup to make the code
simpler.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..1abdf1ea39956bbbadd3f166f37bdac518068648 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1382,11 +1382,9 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
 #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
 
-DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
 static long uvc_v4l2_compat_ioctl32(struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
-	struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
 	struct uvc_fh *handle = file->private_data;
 	union {
 		struct uvc_xu_control_mapping xmap;
@@ -1399,38 +1397,38 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	if (ret)
 		return ret;
 
-	uvc_device = handle->stream->dev;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_ioctl_xu_ctrl_map(handle->chain, &karg.xmap);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_v4l2_put_xu_mapping(&karg.xmap, up);
 		if (ret)
-			return ret;
-
+			break;
 		break;
 
 	case UVCIOC_CTRL_QUERY32:
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
 		if (ret)
-			return ret;
+			break;
 		break;
 
 	default:
-		return -ENOIOCTLCMD;
+		ret = -ENOIOCTLCMD;
+		break;
 	}
 
+	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 #endif

-- 
2.49.0.1266.g31b7d2e469-goog


