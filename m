Return-Path: <linux-media+bounces-33909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0FACAE8E
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFCA3AED79
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA67A21C19B;
	Mon,  2 Jun 2025 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NFMry7eB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0F21FF50
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869586; cv=none; b=AfPclGPzeoE9s0THeQ/stYHPGLkgDzTEDeXelVdhvqdJzhBn0pk3Iz9olp3nSzktnQSuVQFHSiMfgwPlc1+TgHZEVWrRqslGKUUSvUuuqxcAhxp1Y6O6swyuwAz9UkxT5/S9XdPUwcdsyJ7Eq4vzsC2kwRzwMti7rEeyS/dMnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869586; c=relaxed/simple;
	bh=B0jNGSufNvPJuCam1LbtuPADRfe/FotYKW4NrWm/oXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/wID6o3F2SH0cWnWkPPF3UkyDGgXKaR69DC1d1EJfJtSC2UTWqOrGxDVlqd+LYaHoLyGS3WUWe++ky73T9xaSKlUbeUfsRfKZu5suTaCf6HXg4AWAbwY3ovbo/o5ZqHmrNB9vkpKAW37EAWGd95lIKTNbwNK9oU3Xe334S8IXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NFMry7eB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-552206ac67aso4945659e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869582; x=1749474382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=NFMry7eB4quU+U/sDxCTUOFwUd9gMeCrCsLaSwOt3jDQxkfe1qna/ZEeruxb95TK92
         Q/n57AfXYRka3bOOkGlYEsW5PNHQLLIf+ECF9DRTP+TC9cPDliFT5sF//9MeOFAxsNUm
         E7AHgabTfrlrrUjcyyzoE8xBGT6EBg0WYgX9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869582; x=1749474382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=alhpQLrnDoJDSVA1HBEBCqEUBXImi1jU7t6HwspOXUzNMvtDa+njpkVWcgzbVdDOSr
         oDHcLCtFCAOvIfJg5Jq5TgoUpxZ1Ucd2fn7b6Bt+utrdd5ZDTflNXl7w6AyimJ9IvJy2
         JWURYQyJ/OISIakAG3Dh4Ad0ECixoOMySrApDId7JreozX8R/+AtrvNh6lRJiEtSZwtr
         EOZNrn4Uknd7iE29cL1thr28N0M9ufkwnbtX7v/pfcCYtzTIzQ3wsj/p5r7dE1a6DK0P
         u96Ue6VZ+8rlInWp+3VnkjgjCGIAxDIw8uQy0SPmf5LMHgWutrjuwBM0x2/D7519xbDh
         rP1A==
X-Gm-Message-State: AOJu0YzEFwncSDSRZyZ9C6Ne4wrkIpuNDDaBFr7mbJQcylq9rGFQn1bS
	CUJt1jn1ZFGv55LAi07B68AQEr5Ds0gEUZx9WL4gT7S7JYv9CqVicP0sYKLUZ9WftQ==
X-Gm-Gg: ASbGncuVgngHA/aLJOuPjZZrezg5F8uLtnpZtGzNFMlScjYMudXe8Rrmij5vKJy5AG+
	uAaxaJTYNOLJ8YCi+VRyr9f5wxo+e2rYzKxomaQEi4tYIlXdrMx1Evp85CWth//yORhDeiZNv7Z
	/CIXIBm0l40ZiuW5VIUIMZ6GP1GrWcsZm91CU2nsyXrHaZoMx6o2S4R0dxD+B2MB37w5e9qmPdS
	f1wdo8ypN8OcOpDfnbE9sl6UTH+Qrtr2L54cl1+S5F+3KlfGV1mFZvusK4jdp4kU1+xD0jDvYaa
	Juf0OlSo3vadT0LjAhb+onCO/mm6AffABM+uCd12VPQN+g4kR9frRuT71LDqQFNtcPME3SUzXaW
	RZ4H1cad5RJ+YxBNDyDzq6tmfmg==
X-Google-Smtp-Source: AGHT+IHMoONe8Ln9wE6PiwlQI0iQHuL4cC9FaE/WPx3vc4gsLClIVg9hP9Y5j+IWRY92Ncews+799A==
X-Received: by 2002:ac2:4c46:0:b0:553:3432:33ac with SMTP id 2adb3069b0e04-5533d1b7683mr4006496e87.43.1748869582193;
        Mon, 02 Jun 2025 06:06:22 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:14 +0000
Subject: [PATCH v2 2/9] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-2-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
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


