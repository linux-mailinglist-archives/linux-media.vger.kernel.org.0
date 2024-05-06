Return-Path: <linux-media+bounces-10924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FBF8BD55F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1355B280EB3
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 19:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737AB15921C;
	Mon,  6 May 2024 19:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1G2koOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61E1591F2
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 19:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023490; cv=none; b=Mkw364pHDwo3d2CHMIVtR5ULLK3A2oOG/nSSnamXt50RGxGKBh5ESSlif3P1HJxy2yCRnXSFwN/DJRAGXJlGusxcmHkPH9v+VttjnADfNRm/WtOPg5LUwj/gbSgCU7NkYmc1cfpJ/XtDrbJOFo3IN4YKU1zq/33wej6GFpPp+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023490; c=relaxed/simple;
	bh=mhhV9C965LonYmohFrFfWzyGr+/LNO+1ZjetyU5xPQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlVJa/owwecfidHOQG4F9ohh6+SEMddNUmD0XDfyRTPq4d92VPRxEXOCqWe9VyIZgfBDKzq3IPJO51c2khfvysWEO8uR349Vj+mOyMhQrS68xuYF6pdwgyoCARBpgQO9gg4QtzoQxakN9PXOvEMI5EY406pwvIncw8SyhPv7i1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1G2koOd; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-434d0a63151so9792631cf.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 12:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715023488; x=1715628288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sERH3AW/jfrsCIvECuFC7tcnEgKRlBvngV0r54MZywU=;
        b=I1G2koOdXT8QZl6rjPb4sNxNUfxuZbL8cdVOw6iqoV3ThGhOm6jv7MmK4wRQO7NziC
         WlslPdhIrRI2kH49jRFyM952zIOMGATPrqU271dh5D8NpZbRysvnVwWTp2zcR8NlQDuN
         K9fgBrkHgeI73tcbL6tpiXU9YHmgEs1mpyFx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715023488; x=1715628288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sERH3AW/jfrsCIvECuFC7tcnEgKRlBvngV0r54MZywU=;
        b=PJiaSCWNs/krQ9/iGH8eBagVEkElWA3Tnp/thcyTI+s3P1i+Q5nt5AkEauj3tvGqXb
         jVVbwkMRyHNYPqvIl6bHEugyFp+eFQmi4cEMNvRHb4qIoxox9lt9KjM37S76GsLYAxMj
         vKyOnnTN5uIK5dsYyxLqjZ1SB8zCwnCcF7wkhq+DNOJi1PnIDgB9+E8a4+RkDTAC9gIF
         I9VlRH9R5g3KXeT7a2/7xc32omSKaZAAQc1gm95TpDfI+04YkSjAHHBpAc2yXwVhGKmT
         F0VOuLe2zHxEynS1RMDVx+i+QESyAPJXmft1XWpKgTwXMLHcN3dBgH8+x4NidgASjVIK
         5Q7Q==
X-Gm-Message-State: AOJu0YxFIJ0SfOU5t0M5dswZpfjc8uRIbd9wD9i29+BvQ9q7sKhIqTS4
	LOEnhUvW3s/qHZBdgW+9jUT+Ij5JkvVwoX4UBJ+hPNVo+BBSzTPcJVlB/CoJkQ==
X-Google-Smtp-Source: AGHT+IE7wQrVOaXIB6u6ahbWEXnIqKIxesTWerqc3J7ZVDikE6i1K0SYZJY5aGJnqDPOw+uBmngdig==
X-Received: by 2002:ac8:7fc2:0:b0:43a:e5b2:8627 with SMTP id b2-20020ac87fc2000000b0043ae5b28627mr13527239qtk.62.1715023488343;
        Mon, 06 May 2024 12:24:48 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id ch9-20020a05622a40c900b00436e193f408sm5439870qtb.28.2024.05.06.12.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:24:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 19:24:46 +0000
Subject: [PATCH v2 1/2] media: bcm2835-unicam: Do not replace IRQ retcode
 during probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-fix-broad-v2-1-e6a2a5c0d609@chromium.org>
References: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
In-Reply-To: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

platform_get_irq() cannot return the value 0. It will either return a non-zero
irq or a errcode.

If a errcode is returned, we need to populate the error code upwards. It will
give a more accurate reason of why it failed to the caller, who might decide
to retry later.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index bd2bbb53070e..60c0fe956c58 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2660,9 +2660,8 @@ static int unicam_probe(struct platform_device *pdev)
 	}
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
+	if (ret < 0) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
-		ret = -EINVAL;
 		goto err_unicam_put;
 	}
 
@@ -2670,7 +2669,6 @@ static int unicam_probe(struct platform_device *pdev)
 			       "unicam_capture0", unicam);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to request interrupt\n");
-		ret = -EINVAL;
 		goto err_unicam_put;
 	}
 

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


