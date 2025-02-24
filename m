Return-Path: <linux-media+bounces-26758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963DA415EC
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C249F18962C5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95C2241CA2;
	Mon, 24 Feb 2025 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DQvVUuRc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957623A9B7
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740380645; cv=none; b=FwjvPj+Hx5JOk6B4OY6OxAqj7D7vknfP76wn9eaGSAAI5uCsXEx+W23imFoA+WnBtivrprP1gCAiCPrWaWZz82FT6bWvbSY8fTyDhOLRfAafPy6/Pue0/VwAdXIGG6r7bK8h6cd0fDIYN4fsUcIaL4gNtbnIsTO0Qpq6innb8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740380645; c=relaxed/simple;
	bh=8AyV0e0qRbEmKU/uCI50pjnIFt3/6pXpYJ2kgM0yvh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcsRZJhvIIwtQdNVbAwV+q6F/yngnxU78eJInUj044Ze5ckcGuj6+IbqS9LiAO9HN7nUWu18yJCuryN4sbypAre+sYaPTI0/IbNJHlscdGG4ug6r6CFpDA9KvfxLlTDmn8Qo4RVGvI7KNUhgD6f/BBPlRihe0LWrbzRwGJr7nM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DQvVUuRc; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c04df48a5bso420215185a.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380642; x=1740985442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q6OzdDXgwAQxAxBQA745WK29nT03MLnpLkJ+gh1wVI=;
        b=DQvVUuRc07ODeb9F6NLOEkVhpDBAPELeUDxv+/BT3zMQuczi/VtdxMCERZa4NWORux
         I2WC3lDXCpx78wv7fLDoffJLGT+xxOta8dX9OR6Fxf6qi5FjYlU+JUIyJKlspy9hoblF
         dWeVt9pkXzmPifK0T1ZLsqAFBXBNAWGHm5m54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380642; x=1740985442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q6OzdDXgwAQxAxBQA745WK29nT03MLnpLkJ+gh1wVI=;
        b=Xg4wwZuHpY2lCZXfkxguBMSwrpHLCHfXIbYYwmEZadgr/0dATR9Gh54NZrlc+0XTkq
         GofPAeSrSRPi7LSM0wI+eMKuwO09AX3OMbggQWTyopRsBGrQggiMcPTfPX0ARVQIIStY
         QHlVuVVFzbo4YFX800oj1f1RKQdpT0iC7iXmhKjmaAesbag+VawaRwGZBHX9+TBb5TD4
         OqoUnAG5rWMXKpSd+A9iVI89q0oR6876e1ajgkqoWzqE5OMFP+EakZOw7jodeO4QRMMr
         WTpS4OdN+9LwsQ53sFPOB+y/ff8gMuCgPyoR9oEvhHHfXlBEhsAbCimrVGvORbjy+WV7
         K7kA==
X-Forwarded-Encrypted: i=1; AJvYcCUAxIoZua7j7Eqk9JMI5F3y2YwFgZePkWPOiAj7PpHMKwuRPVGy+WBLdSFGz8AYb6yEXr8DMdjwc+1m2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFrO+gBBV4AWyNKh6qm5ZSYNKbYX4o77cahy8T5zomdGAEQjJ
	53xTljMN40TXkbZ8en/K+FARBxZt8wW/z8lKvJhPLUzj4QRjVxxbqbPdO/sC5w==
X-Gm-Gg: ASbGnctsIrGX1pTJchc2DkxtCV/CKHWj32ZG91I3bpiTvfePYdEsP/teSBOH1Stvp0j
	gw2mV6RqxUwdllru008Zb4J03JD4ryg4bMrsfKXq8bImUFiw00TI0+fEnB5jGnnMFQC5ZdjfKsn
	sNaKaPimEmiD0tR9dg4VARLmKw4qNM3Yz8g+5yt3+bews7kyY/84RFFOTvGCZD2Fg/jCkPKbLoL
	7FXxzB8KKM72hmyWt4wwUB8D/oxtkRtSW8z2TVQRmtECXT+9X19MEQBGpSkqeXxf5qDBxj9cfie
	aGQPCYnDZl0u62uVgbk0tjNOYVfVMDzlXuNe1GxWhJHWjwAhLmbPs+CgFdtH4yH+s+yu2D0QrtA
	e7hA=
X-Google-Smtp-Source: AGHT+IHgxFsGJ5AGKD2il9LAdTDxMgGFCz1Kjs7fo9qIU1XdeZFdKJmn66/YwmftLgDLOc15f+yjhQ==
X-Received: by 2002:a05:620a:8006:b0:7c0:8175:3651 with SMTP id af79cd13be357-7c0cef5333fmr1704029285a.43.1740380641946;
        Sun, 23 Feb 2025 23:04:01 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:04:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:03:55 +0000
Subject: [PATCH v2 2/2] media: nuvoton: Fix reference handling of ece_pdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-nuvoton-v2-2-8faaa606be01@chromium.org>
References: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
In-Reply-To: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.1

When we obtain a reference to of a platform_device, we need to release
it via put_device.

Found by cocci:
./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.

Instead of manually calling put_device, use the __free macros.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 0547f119c38f..7a9d8928ae40 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1669,6 +1669,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
+		struct device *ece_dev __free(put_device) = &ece_pdev->dev;
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
@@ -1683,7 +1684,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			return PTR_ERR(video->ece.regmap);
 		}
 
-		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
+		video->ece.reset = devm_reset_control_get(ece_dev, NULL);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.1.601.g30ceb7b040-goog


