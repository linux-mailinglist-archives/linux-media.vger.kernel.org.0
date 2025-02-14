Return-Path: <linux-media+bounces-26172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AAA368FD
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 00:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1A01730B9
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 23:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D8E1FE44A;
	Fri, 14 Feb 2025 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIi5Q3Iu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F11FDE24;
	Fri, 14 Feb 2025 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739575110; cv=none; b=NyYgx+1cubvvc6oeE+ITYNKimAOahLISCaTydWoVRvCbvJmA6VfAG38B7sGCvTxmqzGqtrfCGRezu2KImF4eYurlgxScePfKADmJgFty9k6q9Sw6OQKl0e8NkicjaQ5I1dHifE+vFiUtEyxGpIPaavBf9doRo4Wk8QkCDMrU/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739575110; c=relaxed/simple;
	bh=TE3oEgraRsG6/yVyd1qKvYuB31ewWb6CIHQdaS7to1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kU6KTGt33DUMnwrkXvAmyKVlFXMJCDEjgjf/1WnzngMPTcKsIMJ/Mdr+OSxQo+yuFgX9SUfEz5Aje8gGYTGA7yHiBMr71lIe7zAvw6XNv25T4qvmKT2ya5lUUVPmTlq6rxRDXwFweCFvjCsmw0cJprmb0Ppi40E8hMgtFmSwMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIi5Q3Iu; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c089f89f49so4970785a.2;
        Fri, 14 Feb 2025 15:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739575108; x=1740179908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgSQtsSRJfTvvGbkYKS1L//GTl5a7DNUmVZ6Swpvw8k=;
        b=hIi5Q3IuziAuKZ9B/3cwvjnAOgjED1aN7P2efu7HMpwsTxBO82Sw9hD8nKEclyFDjN
         5DTnajTKSoTXuGKaE2HLdvZUBdzSSxNVysM4LE8AZzBVbJ0Le3Zi4kZhOL1zHNp214dP
         gFxOJcATFXiLvWDdomSYQ84256juuGvLGAchPI0p7A++kYSZ6m6o47/l3gOyWRfHE6HB
         WGp44t3kKQRAQSI5PFI/rJv/Qk52tCpHJ9XUbCRJkWhZTFSTbND5aaf+V9u4bCWOcqSs
         lD+KPDkJwM0uAEeqaNQc0+dmD9U0fB3AyBLbvicu1k4GtZEB8AahwIe+7FZuLcxoKa8y
         w3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739575108; x=1740179908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgSQtsSRJfTvvGbkYKS1L//GTl5a7DNUmVZ6Swpvw8k=;
        b=iw5ylq0QAvdMBQjbtBjkBRRejkJqIZ9rrrFvxEZmWclZ0W/y+wVazvDebCW51r1t7+
         mEM7Kvkqhlm2v/DGhp0U9NFeUG1SpdFduM7XioyW6yedcuaobMb5lddfrRDrz4abVZdd
         3Ai8wmaANAYu2f0cwb6yOs4BSBQWUeeE2byL6KJKgAAONRqTFBYYnYps45B9CUn9Cj8Z
         MERt9cPU19ej2A98xaBW6+ESG9SunnQUj4ZH0X/uqVjL/sm3hhcRGdo4O05MWl+lkByg
         LAJjl38Yd9uzYr5wQxq4oDKBFgyU/na2/pMkB09hs9OhEJUckbEv9oP8V69/13w5x38t
         UKzg==
X-Forwarded-Encrypted: i=1; AJvYcCUraYUtL/La1hBLtBiJH1qY5+qUChgmWgeAP8zhVVuGu2XsuWTyyoNT/tIaH9YPbujTq/VPDYJHKjMoGiI=@vger.kernel.org, AJvYcCVWBd97ZZsq/vZ6POPRYodDP856sIfTO2M27oURcCRXStTonjmMpqhSj0MwaZFhUxPwv57wTa/YIQzjmuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkM6+OV7ZX2elwgUKEJYrj2MYwweYEPsbwylqcamcI4wZ7NMi
	yXad6wWjtI7aJn0O6skT/6nN0inqLWqI60koZZpf+FPUQma8eMAJ
X-Gm-Gg: ASbGncuqWG/SkB2PEJosyiJDhxqolze7dPPlUTg6mEtXKNldPDq56NQPgOuZ2nIBDbn
	Bat69WKrf62CK2AO77L34EItCfGWLrQrCdHFerJw9e3+2kQs1RcqXpOraJaY26zLPkwwqun4PlK
	Ns2vx9QOA9yysOd2OyAZiLDQU/RhbaYymdfFInbXVuRGaxMnKsycFsjmJCzJ4Y1xYw9z542fW29
	oMEv6ljB+X2IhD0TYDPV+IIhg1ygl31SiWhHo88H5SsByNWNINGUPKB5oXXpILnzuGWIOHbAJ7+
	ovG2q8vvhg89H2JAT7Ty00XhMfv9fDObKdWRI0wcvoH+X5BVg8XWb/Ph
X-Google-Smtp-Source: AGHT+IEnA6hPXLEZGg6jZWlbna3sCUjUWGNdicF4gvRZ69+nb1u0v6q0ZeT6O+JCvBCtDhfJdCuVhA==
X-Received: by 2002:a05:620a:384d:b0:7c0:831f:c5ac with SMTP id af79cd13be357-7c08a9d4dfdmr55037585a.9.1739575108022;
        Fri, 14 Feb 2025 15:18:28 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:4db7:5f35:9da:d13a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c861221sm257829785a.85.2025.02.14.15.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:18:26 -0800 (PST)
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
Subject: [PATCH v2 2/2] media: m2m-deinterlace: add device-tree support
Date: Fri, 14 Feb 2025 18:17:59 -0500
Message-Id: <20250214231759.119481-3-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214231759.119481-1-mattwmajewski@gmail.com>
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
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


