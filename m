Return-Path: <linux-media+bounces-21683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD09D4013
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 17:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6AF0B21348
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDA51BD513;
	Wed, 20 Nov 2024 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ENegmwnh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A4A19F10A
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732116390; cv=none; b=Aihd9uYVAREK3Hud+2If80u2DBYIdzZQ+FkiT1pbVk5Wus6AMozUcYhsn07MfhrOUDux1Tl2p78lHEwOqVYC4iKvzCgYZ56CfuV6WPB0P7HT9XLwDkZze8J6p5FZlmYIxA1ubpgHeAmR7tG3RDtug9HhqvINaSZ21e7XM47wPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732116390; c=relaxed/simple;
	bh=0/4FckMiSiHC8QtZcVOi7l51C08TGrth+2RVMZNClRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5atsc4zicZRR2MTSMF8oKYde1ZyK6UUqWYIEutz4udH5hVYxCeDoG0e1VXkQIa29oKSfYJqdldaCCChWS3E6czB0vNm8PImw/mWMnIwoaKPfj1AIgTd1lKjV5q3X9s4zV1uzn67/zbttCgvNd9IRT9sssuxsHrH6h38RkKei1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ENegmwnh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4609967ab7eso14725341cf.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 07:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732116388; x=1732721188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qumhdBhQMcwMSA8xBYQJzlSmgMMJFlVuWwTimH3pwtM=;
        b=ENegmwnh/wxL2CVDXS6NAHLd2aS7So4nyDddeckKu7JzBh+6c7JWu8sGeqtDiPBLot
         awye9PKknV1gcH0fPZCgqWE6L+GFUBg4VZ41MgB6PHZWG2phTmd9nR75BPFWMN1rv/M3
         S54oAk2XyEr1aZb1MoFEvj+adz/232+qkNJfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116388; x=1732721188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qumhdBhQMcwMSA8xBYQJzlSmgMMJFlVuWwTimH3pwtM=;
        b=G9IevUi9qfNjbtwDhCICsHKV0kyAgxgdu/RxawV8byyTara80uytjkbD+1kgowFm7V
         +KAHnY/SXZ61/XVRi2fIVnryJ2EaqDCma7ukFoDD3CZkIyVemmIreDaD/1fkBe4SLKux
         1njW1u7mQIWNZB+74KrD+K8Dy6O/dIFxh2DaGUC0hCz1UjLzEdu/W36AOBlEBZthi6La
         HL4Slw+B58zWxIBA3FH9MHyrTAA7YAg25CBYiytooTKiqCpQvcPbdBbfsOvMP4FS3umE
         t342x6hcmgqYdJYkIj04JibkNO0oPQGmUEiKtlrsGWV5gsFxUo1fxvKCuKHkc9DOrwMq
         AE+Q==
X-Gm-Message-State: AOJu0YyZI/tvR3fg+cZwYhXi2BRMEoBT2skIJABwdka3iBrGeOINT3iN
	vtFuXhYR2KwQV7UO7hjJvRnB4vGTUhOo4f1ZYejeL5j2vfuH3A80crOhSv05/oVOWqLEa7S32In
	Y8g==
X-Gm-Gg: ASbGncvy8E5BEtY3F9WMU0jukGGKEKLk9NWlwvhmO2X9gYAPorzXj3rk631mmWLyno6
	fCLBAAL5d3ouFpMZlry+NclAWNBQLcu1FsZjlxFG+gZll8lqIAQ0E9D/WUvXhXh8B8tjkjTpbWv
	3okFW0i1QzVQ3DYNDr48Hk6hJPrCypR3Vv2aU6lzQaYTw75AMJ3b4TitozgxaVYMmtuiA9hw8uX
	0J3C0Y15CKpk37bREJwtS7PqaiZJj2TfFYxlrCxCtwrEScqQyJ4RTV8T9ekAIrL62xY+IIw+3OQ
	22rH5J4JDN/IhnDpr8qioQUQ
X-Google-Smtp-Source: AGHT+IHPlAn+PtW4S65lZD+sW4FNYiPUzxXoFq72G2Q0cDPAJTNnHqS5O488xNRnPKLEVvl1B5oT8g==
X-Received: by 2002:a05:622a:c7:b0:461:2a3c:c1f with SMTP id d75a77b69052e-46479c353f4mr37026111cf.52.1732116387928;
        Wed, 20 Nov 2024 07:26:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46467fd76e2sm11207321cf.12.2024.11.20.07.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:26:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 15:26:20 +0000
Subject: [PATCH v4 2/2] media: uvcvideo: Add more logging to
 uvc_query_ctrl()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-uvc-readless-v4-2-4672dbef3d46@chromium.org>
References: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
In-Reply-To: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0

If we fail to query the ctrl error code there is no information on dmesg
or in uvc_dbg. This makes difficult to debug the issue.

Print a proper error message when we cannot retrieve the error code from
the device.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 482c4ceceaac..00d9e3420fb6 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -112,8 +112,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	error = *(u8 *)data;
 	*(u8 *)data = tmp;
 
-	if (ret != 1)
+	if (ret != 1) {
+		dev_err_ratelimited(&dev->udev->dev,
+				    "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
+				    uvc_query_name(query), cs, unit, ret);
 		return ret < 0 ? ret : -EPIPE;
+	}
 
 	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
 

-- 
2.47.0.338.g60cca15819-goog


