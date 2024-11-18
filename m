Return-Path: <linux-media+bounces-21551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E49D16EA
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 18:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CE131F228EB
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B288D1C302E;
	Mon, 18 Nov 2024 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OE2MIzeM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06ED1C1F37
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731950221; cv=none; b=YT16WYkdd919xhYH9LWlsDrGI/ZInwMGmXAtdCWjjwPDRa7fzeP0tlTJiQ6jDDbynSgLiwdHSmkhKFeTtr2pNsk7c2NZkF434brKMUCoZLIS0XZ9w7SlkeaUQKEg0NVinUJztL/1IUL+pH1kojPrbIpzeVIb1a+hqaPdJbBvv0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731950221; c=relaxed/simple;
	bh=A5tEeWedtG0Y+rutx5jNpOYlvPw69q2OPMca4sA4STQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuQqBJDvIpPbBSrRI93fn1Woa/RkOfOSz6h63nmOes/en7PJ1g+C1nV/AgK2AhWj9TfzQLW9E4THEYuHM0xsaOyr9WRBNTHI+x/ZB6KcetS2sqfrxNSvaYAJnPZMcnGtRfGBKssaFNtJNyshbjoJjA/Uz8rQqUaVUCo3gJ+y9sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OE2MIzeM; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d41c87aec0so13604336d6.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731950218; x=1732555018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZ30sDfZ/stXUDJszdPegRDEKjQSfHFQOt3ymhmzQbY=;
        b=OE2MIzeMPum3EvO3y/9PueYnRDFwE/miApRewgduRymSNzo50c/q7QlpAjqOO9CRSv
         E/Pmef0Rv+sDN351xDbPKNQUR+iYduZL63OIT1PFByi8iM4PaBCXDV3MOfzIlesdB+XM
         3AQWME8ZIUazUnDYKGGUJRgnKuGOy/7wPGVl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950218; x=1732555018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZ30sDfZ/stXUDJszdPegRDEKjQSfHFQOt3ymhmzQbY=;
        b=pqawn70Dv40ExZ7bxsiEUp5nDlnj0cqBodWSclECskfFgAD8JET/IzATvx5Zu3tvZQ
         AM9GQndT9c5jgnQEjhapCN+VVlgDRO2q5yudkl696mY2C4526X/C8akcumq4jBzGpURE
         wLDZ9LCQBwZZbuNtD9CtMJYlxRi8vAyWd6W3emjPQFeuCd7NtfcLusaPhxn4W6Ssv1oG
         ZI1aT12CShvhVu/BKl/sMXUlEGxb37IIdC/25sd52r9VdNtPAzSSQAYLNsHymZs/56T9
         rx/5FosniCsZkYTHVe/eeulYl7XFjnIa8HHTmrzpP2GVEtPvXmh3yHqRoOE/W7SwwyVF
         u6gQ==
X-Gm-Message-State: AOJu0YycSD6SJkCCphqt4gXp7QRwtSKppcROSkcM3r9rYb210Vfll4oq
	g+9eyV64Pc6QmzSOdjqOxQo5UY4RkghGoXLRBUWN9guKY3tio4+RuJOyNDZF0g==
X-Google-Smtp-Source: AGHT+IGaNZV/qqJqHa4tiN/uf1zjGJjsroAU+mlkDujCrCE4+KZVeNFgCEheZGGSpyliMGY3+QOMAA==
X-Received: by 2002:a05:6214:3387:b0:6d3:7f9c:9e51 with SMTP id 6a1803df08f44-6d3fb7ed418mr178431086d6.20.1731950218592;
        Mon, 18 Nov 2024 09:16:58 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dd733c3sm38255246d6.97.2024.11.18.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:16:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Nov 2024 17:16:52 +0000
Subject: [PATCH v3 2/2] media: uvcvideo: Add more logging to
 uvc_query_ctrl()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-uvc-readless-v3-2-d97c1a3084d0@chromium.org>
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
In-Reply-To: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e165850397a0..0195394e10b5 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -110,8 +110,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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


