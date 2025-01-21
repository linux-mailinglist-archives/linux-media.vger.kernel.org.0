Return-Path: <linux-media+bounces-25075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C344A18735
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 22:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43CD83A3083
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440F01F9AB4;
	Tue, 21 Jan 2025 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jyDkYt8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35831F91E7
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494103; cv=none; b=VlorNMoIULYpc6TGoUIcusKJuHLjJqLa1TzC0R643xHxNBCkJwIoElnDFCis9ouJyOZcln8sP1AlUoTxlaPifhLD/P4gU/6/U/FKxbmiqtqAyI+6Ko3IcoId0Y2gtodMDoHOwkaERQ4KDBjxHZ9waXId0r2e/xIJe7x1GBkEmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494103; c=relaxed/simple;
	bh=2nI2AcTo5FGfPAE799IDNWIsZ/sUcy0VR17PhcaK6HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flQZfeeGZ15uZcNyDt48Au5oWyhm4vwZCx5W2IDm26OO0BgUA/3qS7Y9BfJtchxNemgkbsnFHy/4+BUSewFDVdLPxLtD02JAy/syEaQjx8sDrWtzxm6ryzJYk7ejrKHOACNDxCSKZVvhuV+udmNB0/QQZp5Cm+f36MVvNTYmPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jyDkYt8s; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8e773ad77so49000536d6.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494101; x=1738098901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWWHKFVC6UKJydJIK/G7foijQRC+Q1BFZCM05TTLGSQ=;
        b=jyDkYt8sFBqwzZjKNUEFVsPSqHABtwDdrpfuUGrw5B3NImQgF6NC6BiefXGf0f8GBn
         oHhtLGZkoQKR8AaKU9clXHqA4XqKv9hPuxw70Lyd7lv5H+GZb3zkfS2QJgsw+EfOV3hX
         580FFpjdLwnGsS1qy39RcPKk2cE0HojpHSdks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494101; x=1738098901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWWHKFVC6UKJydJIK/G7foijQRC+Q1BFZCM05TTLGSQ=;
        b=nqDL90nujkCM/aeOANzebtXWSVKBMtvaK1Mse6u7GLloVAjmrtomTK0BerBsMf7IR2
         1jrK2vwouRskIDE4AvN6JxT4yI8YF+ygzhYmhIVZB7fA8T5P4wNQndxDTkC22o23ldam
         2cBwG8n6X5bey6tsS9zCEkspJkAXOcHMLFNMxUWOPHNxVoy2iKwK3jaVdVTI6BVi6+ZR
         cn0K5xiQdA3rMiAE9GXcJoC5Jx/cA8TcMGTerc2szwQcd39lTyF1Le7/M5j1VebBBWYr
         eiQhnksqieQll9+xfxNBMy7bCmesnTlBiS0a3pKoFczvPaIjM4ppW8qMlJizxp1XFVkB
         RWEA==
X-Forwarded-Encrypted: i=1; AJvYcCUpmdfCnroyQ2Fa4XrJA3icCEK46T4qayrZvFNSwEJfXI9tSsYv5pEgpls9WQnmZatk5NVJAai6RfgoWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwABcb9YiLi15o4ZEw3k8/J1MLx7vRg1Rq/H7UaM1uyxgrp0nkB
	sKYIeALN18Kmk7czGHdkS7H+mYBgUkFIxUy5yMLHZLgQeD5YMuILuM1u8bgqlw==
X-Gm-Gg: ASbGncvgUld0glHq0QQPG2jt6Tz71rn3i9Os3WzO8gizhWDLSLfYV+wGX/q1A3Np9aV
	Oz+I//gONJjThOGhBVaXPRt4jWLgOkkGXhVbkif0/cbY+7WCEfeY//hEMKWD6BWDzG5/fw57X6I
	qb1BGsIFeF0APtWjsAVb3UxYWIXE6d5iZQTbqPhqwICSckn4zVBxz/1YPthnzVaKsNG69/6XtlM
	MyONKVeByBxZg9/wXECzhLtXvE8ApUNGyt47fA+VtkzckZntycdmsmaodTEyUbSxSIxta7QH86a
	q5PcqbgGvP12N7AOF0jv7WHOJzbS9s470SzG7AxZWXb24VHD2A==
X-Google-Smtp-Source: AGHT+IG3DsvcJCCgpRI2aTM0TBQe/diTS5TbE7HiFHeA/ESOV/zRmEEEPnnObFwVwY4g2OGPUbxevg==
X-Received: by 2002:a05:6214:3006:b0:6d8:8aa6:ef27 with SMTP id 6a1803df08f44-6e1b2230914mr317755556d6.38.1737494100811;
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:53 +0000
Subject: [PATCH 4/4] media: nuvoton: Use cleanup.h macros for put_device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-4-1ea4f0cdbda2@chromium.org>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
In-Reply-To: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Instead of manually calling put_device, use the __free macros.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 8e69fa14433a..7a9d8928ae40 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1669,10 +1669,10 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
+		struct device *ece_dev __free(put_device) = &ece_pdev->dev;
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
-			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to parse ECE reg in DTS\n");
 			return PTR_ERR(regs);
 		}
@@ -1680,13 +1680,11 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
 							  &npcm_video_ece_regmap_cfg);
 		if (IS_ERR(video->ece.regmap)) {
-			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to initialize ECE regmap\n");
 			return PTR_ERR(video->ece.regmap);
 		}
 
-		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
-		put_device(&ece_pdev->dev);
+		video->ece.reset = devm_reset_control_get(ece_dev, NULL);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.0.rc2.279.g1de40edade-goog


