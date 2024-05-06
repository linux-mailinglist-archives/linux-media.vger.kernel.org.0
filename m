Return-Path: <linux-media+bounces-10925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F200A8BD562
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37794B2306B
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 19:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825C7159587;
	Mon,  6 May 2024 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KQaDgD0R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA51591FC
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023491; cv=none; b=qfrDQkqnxaQzKBZSpD8nK+/jRipbURvVzn+uk8HnhmU48YYWdbtBPzC8kPRYaO3UTeX9ZdveI5Cn7OYCAnq7i5Pushth4IPQ9M8I1lYmUJXfcoK6s1DCU7GK9MwiWNCMqSuC8P8Wi+QLMoLoUK4J2BQB+b+qYk/XfF1uusuLUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023491; c=relaxed/simple;
	bh=2UHWC2bxvJRpPIbR8NMDLC+df/QxdRgc5rfe62kBZfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoqPQZ0XRyFqyMO1W5ekNufy8cm1SR1tCNDK8Id3AvSD+7420XLrTmn/nfBDZl1eSVwGQXaYIesXVGDjihkNjwDWZEldxY0BGefToljUnr3EuVWbzjlYl9cuyOT7Uahiz7Lvx/p7qVRKfHm/uX2TFVXe4/e/bTEW8w6Rq0y1yDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KQaDgD0R; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c956282db1so1414057b6e.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715023490; x=1715628290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raDFNcDQUrEtJLVjBh+B3qIrZSUwTfQ8a/Tp6m6/klY=;
        b=KQaDgD0RMrnKCLWYW/tQ40vUmqBXHTxVUikTQ2THRo4LQdbsAVTFw6q4b3VRAm+/h0
         e33fBydjIJC8WLu++VdlUv7PvQFWgi86cUsAQT13hz719D6n8pro4vMGrYLkviy90M4C
         ZHLb9ZqrhE/S863I9aymXEytFU0sKm/j7td8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715023490; x=1715628290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raDFNcDQUrEtJLVjBh+B3qIrZSUwTfQ8a/Tp6m6/klY=;
        b=mWuKY1WG0kvAfVAT8zdlyIHAxEUQk904nWoN9/HnaMOPe4UH75XJuLQJJh565KlYkQ
         w1l70TaorMvoWO0DZ6BPmwy4xbqWbcMWWCsmv/kqa0ojpfL0WoncZMtCUhlZU6mnxQT1
         s0KDZkYwpk9mFyZKskcynJDTzAQMBJgn0y7802tOz72FRz64Jcbpqwti9Bk5xwRkiKiM
         7CFpnaqmH653guNyVsJ/76iZnPTyQWFNi27SZ9GZOcZrFrOZnIOoZyQh1moNyRlnyoZ0
         BeQW1k26G6IsJxo0czPuzuM+smDCHCjTL2t30IZY1AV2cHZDNkr9D+UDcRkFgZ4tW1In
         h5Lw==
X-Gm-Message-State: AOJu0Yw0rtNh9J2cRAXnKbIZk+X1AgH7uarO1mvUnf9P3gM1uISVWDjA
	NYfd7S/v2bkFErjuclIXkfVEE75GKU1+cAFKRio4yRUqpGUiTBJNDWdbjdDcbg==
X-Google-Smtp-Source: AGHT+IFkAi80BKvF8PjygfQV1vvybXcizCZQWAbOTCI4v5z2AeP2XUkBEmlpXEhtlrpvoxrfTZ4Amg==
X-Received: by 2002:a05:6808:258:b0:3c9:6acd:c626 with SMTP id m24-20020a056808025800b003c96acdc626mr4930719oie.46.1715023489673;
        Mon, 06 May 2024 12:24:49 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id ch9-20020a05622a40c900b00436e193f408sm5439870qtb.28.2024.05.06.12.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:24:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 19:24:47 +0000
Subject: [PATCH v2 2/2] media: bcm2835-unicam: Do not print error when irq
 not found
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-fix-broad-v2-2-e6a2a5c0d609@chromium.org>
References: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
In-Reply-To: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.12.4

platform_get_irq() already prints an error for us.

Fix this cocci warning:
drivers/media/platform/broadcom/bcm2835-unicam.c:2664:2-9: line 2664 is redundant because platform_get_irq() already prints an error

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 60c0fe956c58..0b2729bf4a36 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2660,10 +2660,8 @@ static int unicam_probe(struct platform_device *pdev)
 	}
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (ret < 0)
 		goto err_unicam_put;
-	}
 
 	ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
 			       "unicam_capture0", unicam);

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


