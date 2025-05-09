Return-Path: <linux-media+bounces-32167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F17AB1C3F
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A79211C03181
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECAA2417E0;
	Fri,  9 May 2025 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZybcUMqd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA63023ED5A
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815060; cv=none; b=mRfklkfx376K1cuFYfOFSjIs01VEShKgZORZ6W+D53I3kbQBwFxGL/7JNWu2yvkXJusRFhHQM4liEjYv6FlzLjU/bIJs8xthWdVg0FjpRnvBODiBIsfF0CYIWxb6nFul41i+Gd8i00Akh8iuBMwCO5ee6PwGrN8thU3Bg3cBjag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815060; c=relaxed/simple;
	bh=ejqJ/gJ8wJ7SrRsxrwHX2ivbzatZEKONS8zjnjdr7Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zxh2tvRlyesb/Xxq4kKf9Bz9Rq8qUAfuQLXClJlkrYz08x5PG1y7ijafSMvTZMiteEQwz6opMJG3+bRz1WvbjYbIuQnoWOHki58cuB864tqVZYrzpxGt0uLdbluVWb/d63YkkRzJR0sZB/hO5zLotetLJ36HaP0hbnTqBvH9y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZybcUMqd; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b1095625dso2755567e87.0
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815056; x=1747419856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSG2c/BzhlxE+34h/Hi5JjSdjHGQxrAR1NJF6hxkTe4=;
        b=ZybcUMqd7iC0yTCtFQkcC/kiG1bJtzfLbHYbDEoiS13St8idSB5fuGB1rm52qlsnqZ
         7Rgftleong3+lvy26MkUgr/wsLrutP5lNie0Zfq49EsMGZnDJz/B1GyI9IYb+5b9IddP
         aYwEp9e+9Pr5no5gzTiKJr2eWS0Np2PLOrui8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815056; x=1747419856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSG2c/BzhlxE+34h/Hi5JjSdjHGQxrAR1NJF6hxkTe4=;
        b=ntKAaiwrx+UyNzwoS10t1jbSGeH8tw1U2DPxLwjrJs/gqhd5YnuXYOZBLCxXfbwVgo
         gq+un1ct3yEvaFhq6uwIEulUZnzpz8vgMrJ03QumKePJCX0LNusvh8YglwVx+apNzMCi
         nGzD4Psq12Osd2sDV/CRrTzz1eIMdJRJFqyvG8S5s3Zm8WGC6Mm5MamUQm4hbGbY6pcD
         hdIk/2XOEWD7JKxteGVza95Gi6E30ufPnPCSFt9TdLylK7sQI4ZKJahFYrO8a1J8qVej
         GMYvXqNqqk1cNJvLx3Hz4yoipCEq/y6AIfywjU9rKEUQKKgdn8w9G1eLiIeH1KzGzF1d
         O9EA==
X-Gm-Message-State: AOJu0Yz7G3zuAaY+fX04TSL2xvGotNbp5RhAAYCnxR0KGA6xt8U2HAXb
	SrMy/LAk5WpoooBjmwbSK8bc+nrlT/sgeZynEo9vi7P1148WadxTvGmTpjOZzxy1+zL1fk7IM1E
	=
X-Gm-Gg: ASbGncu3STHGjut8Y55OAu5ixdeY7f+GSQA5TH0BfA+qCQGyerv5UE8E3VSa45ZFrU5
	WZAf5Sb1TyZ/gN6RJ64Lovpaj5gfVnTuj0FPT4Cgnb1kIvajUHp5xRJYPKESQcWENn8zTeXoy43
	oTkmNQXBPfiQ9JyCeSit9KQ4PpsocEm6hqBuO9nmedJXqRAzO3DqdmR4Da6PAYVQw3wF6qXsIGo
	6YiGvgVlwmW+RvgQ9+SHtMSqC5toJDpSShUBH7D3ZsPzcatGD4F4yFPt1VQ1q5rWtNQs8qT8qD+
	Lqct+NTwCOZytw8HSaVVAzCKN8o7LZVGlXRAE5r9aF2s7jjdWGKXxlF/QDLWM1qpX/wtsKhfbtf
	A5uWRQC3RoYxG0zONFquH04HSawZ9TAYVckWxHXtWDw==
X-Google-Smtp-Source: AGHT+IFB3hsuHxjg/fmHgXyAyLViUq48ySyQRa/Fx0lUJgNT2+8kLZlrQ1DZIwrh7vFS3Kz9c4FIAw==
X-Received: by 2002:a05:6512:3996:b0:545:1049:eb44 with SMTP id 2adb3069b0e04-54fc67d6211mr1584325e87.36.1746815056100;
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:15 +0000
Subject: [PATCH 3/4] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Declaring a variable for doing automatic cleanup is not a very common
pattern. Replace the cleanup macro with manual cleanup to make the code
simpler.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..fe3db03d7458eeb4b9a846ae4ed141bb60ea46eb 100644
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
@@ -1399,38 +1397,37 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
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
 	}
 
+	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 #endif

-- 
2.49.0.1015.ga840276032-goog


