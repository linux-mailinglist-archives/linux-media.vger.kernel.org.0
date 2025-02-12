Return-Path: <linux-media+bounces-26078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88444A32D10
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708941889CF7
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A508125E443;
	Wed, 12 Feb 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD6eFA+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843E25D538;
	Wed, 12 Feb 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380169; cv=none; b=RIiokPin3n7SKA8mg1LWm3w4lEnlfQfgekPHZOrrwnEAHfTqwbNRNRDOSuz7Moh/lj74pO60l5CI4wrVKwmcFse60XdEU31jLemsi145wYgqMYDX1pRfx3XPs0pITWwIsCj9BIvYv3uLZWM0lNJZRzz8n57tYYV6uZwOP12dt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380169; c=relaxed/simple;
	bh=TE3oEgraRsG6/yVyd1qKvYuB31ewWb6CIHQdaS7to1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oMj3dLQKaC0M/TJJjQcPSqdXHtdbs9upy5/VWzlVewTlf4lfFrOuWHYevrhbvbkjR/F7sKhA/MO5K1ShQXI9G0fVYEgAiurN62d2SsU0tq7O29fEPyDDGajvQBD9hj4GSgGTzQ2uF9Z4T9HzsIMtd9DGjIeWlYnZPYPetXOASl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD6eFA+T; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-471a4f8bf65so701151cf.3;
        Wed, 12 Feb 2025 09:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380166; x=1739984966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgSQtsSRJfTvvGbkYKS1L//GTl5a7DNUmVZ6Swpvw8k=;
        b=gD6eFA+TbhXEtEgtM3kdypeoNUxmXMTpCkn0dceenYSWVB/21luvh8UHdD3HdsaawY
         GQWq5y3291lktGQnODPigQ75J6qQFgzEdwMRr6PxJx9nz1WTj4JzCDOWeVq3Sl9A7jHv
         pFOmKwS1Ak4nZjG5afcjS2eRcDy4eor1H90myEW9GCWfinvG0RSXFtSKnHyvpRaTc14P
         kH77oqboFRCalxbN4it+FBd5M4xu4SRiwtamQzlGr+RmoWy+tS+PWhwrxJDicnCHlPFt
         ZM1brWOirVPJr4mlzOHLfFymSg8CXWlp1Wa2ssHiNtisVnoeU4LRVNS3+g8iYRyTOvxg
         hWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380166; x=1739984966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgSQtsSRJfTvvGbkYKS1L//GTl5a7DNUmVZ6Swpvw8k=;
        b=qOEsXmOMVBIvqoxVh7DHbptJb1Avf2sWwZsy74RH/PfZJc1MdW/FgPd8xGJxD5RUig
         7DZ77vj67tzuhJfVlFHdkrNgGW74632jqERYe9nPoIw9xAHfzMbbUYGPQrpkyOhRwElq
         QbYlVKYGiF3teuDYXidBqp+elxfQ7dyb1zfOkNP+BR6D2iBSgwH+4L5T0Il17Xah48vb
         hf1sstIbPClG0jyx9HUFpT0FAyCKyXkQKZlzH2D/aTSmdXBZiBIT8YcVZd/qF7fNEWNV
         PEY5F5uRGNxY7UJe9zFPbi/SuXM1Cr0P64uE7FLq1+QikOBYunoo157SpPTcyWXQ98bD
         kGhA==
X-Forwarded-Encrypted: i=1; AJvYcCUfeY/qJMSzw1tHNc2HZ4oaC+z1NQUf9k+rQnlxTgK/U54xwiqneXzj/K2FY/dnKFi1HA5Qjf3YP6Xh6KQ=@vger.kernel.org, AJvYcCWgc/T75e5kJWwD3VBiKSfvwzaV3oIhpqMLDSFXtTdLTM9xbe5bTZ+WzPr0E0DzuW0RIGK29rJzqhbNbNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9DPrISta/pIIz6MCOy4amPGtdQjjiwozfVDJGHELHzubPEJc
	0upWB7WhZ7PTiKjLpIP8ue/OaCYfpWAEq/SnuLjd1UHYya3+WU2v
X-Gm-Gg: ASbGnct9Ogv49R9EDIRMmopxdsuK6ICw8ciJifaHDSvSOLNjO9lYrL3Z2WggqZeLXuT
	xJYs110dMbxZBZTTwst0VESJZEUFmJSQ4FuBZGdhRyFJQL0DOIfpfik2+Vmwoc/NrXIBoPXXruS
	foe+TpyrL9LShNlmrKt12aaSK8YQJYtNhRFf3AEM7X012vTNRPly+mZqE73NOdgtbHzKqj+5DYn
	hClPZggEe40I3HmFLq8Rz5uyI3Pq45+4g9sZnEXy7gmTpGASZi/vHczB6bb5YqyjikMEpOJ/XSZ
	oFXzQHiAhnw17y5/O8LNCHZDbG5N+cgmZwDv2JJfLGM6sW5/piZzkxiG
X-Google-Smtp-Source: AGHT+IG1LJxLezvshuhqs82k/JmK46r6Q76xu80RrPWUoRkjSzgD8z3+b6AmcCgLy4vaoGBtCmHUmA==
X-Received: by 2002:a05:6214:2b0:b0:6e6:5a25:e10f with SMTP id 6a1803df08f44-6e65a25e2b3mr9254166d6.1.1739380166379;
        Wed, 12 Feb 2025 09:09:26 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:c438:570:6155:5ffc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e52798f66asm12079546d6.37.2025.02.12.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:09:25 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Uwe Kleine-Konig" <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 2/2] media: m2m-deinterlace: add device-tree support
Date: Wed, 12 Feb 2025 12:09:01 -0500
Message-Id: <20250212170901.3881838-3-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212170901.3881838-1-mattwmajewski@gmail.com>
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for loading the m2m-deinterlace driver through the
device-tree.

Prefer to query the dma device through dma_request_chan(), which will
get the dma device information from the device-tree node if
present. Otherwise, fall back to the original dma_request_channel() to
preserve backwards compatibility.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/media/platform/m2m-deinterlace.c | 25 ++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 5188f3189096..ba4e4ee6ad34 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-device.h>
@@ -914,7 +915,6 @@ static int deinterlace_probe(struct platform_device *pdev)
 {
 	struct deinterlace_dev *pcdev;
 	struct video_device *vfd;
-	dma_cap_mask_t mask;
 	int ret = 0;
 
 	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
@@ -923,9 +923,16 @@ static int deinterlace_probe(struct platform_device *pdev)
 
 	spin_lock_init(&pcdev->irqlock);
 
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_INTERLEAVE, mask);
-	pcdev->dma_chan = dma_request_channel(mask, NULL, pcdev);
+	if (pdev->dev.of_node) {
+		pcdev->dma_chan = dma_request_chan(&pdev->dev, "rxtx");
+	} else {
+		dma_cap_mask_t mask;
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_INTERLEAVE, mask);
+		pcdev->dma_chan = dma_request_channel(mask, NULL, pcdev);
+	}
+
 	if (!pcdev->dma_chan)
 		return -ENODEV;
 
@@ -989,12 +996,18 @@ static void deinterlace_remove(struct platform_device *pdev)
 	dma_release_channel(pcdev->dma_chan);
 }
 
+static const struct of_device_id deinterlace_dt_match[] = {
+	{ .compatible = "m2m-deinterlace" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, deinterlace_dt_match);
+
 static struct platform_driver deinterlace_pdrv = {
 	.probe		= deinterlace_probe,
 	.remove		= deinterlace_remove,
 	.driver		= {
-		.name	= MEM2MEM_NAME,
+		.name		= MEM2MEM_NAME,
+		.of_match_table = deinterlace_dt_match,
 	},
 };
 module_platform_driver(deinterlace_pdrv);
-
-- 
2.25.1


