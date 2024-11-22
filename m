Return-Path: <linux-media+bounces-21852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AE9D64B3
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 20:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE38B22D02
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 19:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D3C1DFE37;
	Fri, 22 Nov 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV/6I1Bz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0402FC23;
	Fri, 22 Nov 2024 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732305210; cv=none; b=p5JLov1eqRjmeRTJSjLStgc1tbMjbNsDdtk/T63nujRvwcIovdd0S7jDnB94c1kJWwnK7ErZldu9zZQJfn9Ygqusb3kuSoSjZFLucem/i1UcyTDd/Q0XkbQDmeJhhC+D4VeFJNP28RZz80+IVK3894uN2JK4qwrfN2ssi4EYeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732305210; c=relaxed/simple;
	bh=E/5sdOL/jkUCbV3WEL3b/0KOfVk/fXbHHdo2d90g7Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dxGyTGK1HqQHHJ/qwiVLAmyvdPDDtKT6YAi/ighixBHBGjDab01UncI8I9Pknl0AkUX42uDOGR541GUicbjL+ODarwJbYI3n+/b26gR4XPiVlW5EXVDCCAE+Nz3DUjYXhqc91HHw3YJii0M9Cs3Slss1uzFdYdSBP0OBuC16z3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV/6I1Bz; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc0e13d25so1027718eaf.1;
        Fri, 22 Nov 2024 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732305205; x=1732910005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=XV/6I1BzwMNqJk+WhlPtMTNM9pPiza1iqOqvHrsxXNm4rIdO1ldhpdrlraAJhO9CD1
         sKO+J+qLh2CcN6RrRvqxau2N9QGioTUjQivYoJWFnzF9+NZtOl7f0aPkcRbbPX4qwCdA
         IsIEkvlwyzs590VNY1NuBaOa4lx4EuUiNCfcadmLd5PPsGdrpFRJtoPmf4DQaGDwCXZM
         V+Q8fGaIDsV2QCgrcIjeAPNotz8Vpd6mgQrGFPAc+BB2boV1Yzv93Mbx0KQDf/qofCad
         i0206LSTQx5lrJz5Rg1mzjcIL9ooX/j0KvxPd9mQqCr4YR+YhqPpgsfX10OhiRxFku0C
         5fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732305205; x=1732910005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=cY19Pebqpk42QgVnOtFRIRh9owQWHSJ4I/D5lfVioGBR6caWlZMDIJGdOqGKpouBSk
         2e+00ZIk9ozb0v8yqxris1PHSCLnJg9k5v8N7561AyDVEBnj7vM5GEkTtOynDBGgi8kD
         ZvbqBVF2lg7vJtKcL9aUl0poGi4AVcduyodglt36pD9HgH+RqBIqGm4cIuqSi1lj0+C+
         wfBH1KgwgQDnXWLU8BMPSkL1rKW2qsOm/UfGo0kXYnrZmk2zH2SjFhog2nSKDd8MFY0L
         ixGT4zRiLCDcfVu7h0Iz+ssllGVSnjR6qjI7QFxM+Rp741n20Jp8yxY+qxV413TEoBPX
         EoAw==
X-Forwarded-Encrypted: i=1; AJvYcCUCSWTwS6/UFEia8857L+mtk1WVxrqH0iAF69kuLqO6i/1ap3193/px1OezzeJ3FdwdcgTbnjvop6zS9vVatKfbRnw=@vger.kernel.org, AJvYcCWeP63/BqScBbRoE+I/b1BKaSRQ+emrJWVjudLn9jNeBli4xD3/G9doUCsuudUwcG22rej9G2wx/ENG/nA=@vger.kernel.org, AJvYcCXTaBgMV/CuvcSO2xNth2ZK6P/ceSbIFG2xzobizz/P8Bmuiu7gwZrBN9k2yhr+o2/7+PXGzdh2JVsxGFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rCLeOFJIXMv4MDg+PzImRUB6309B1HSBNbA+/BWPREIL8GoS
	4ehDbWiq6oNmYX5evJ/9yOCHo0L2ogHNkEm+HXnEBmpwpUhP7TyI
X-Gm-Gg: ASbGncvFUeFKmXhNI7OYqRdomzPJ1Bg1YSi3SslSIgYYrbCA3NWFT5/DjdX/ued1gE5
	MZQHNCnBvhILMizdrvuE8m0xB4RQbFPkyLwPnZATqv5L70ST9DRT6Y4Gn9qUfxSompuIeUyMQLh
	4+5qKT5K8K4CiZlshIwV86JioLXBXq2VzsEh3bYFKZ4aSGt7E+mLPkG7aYPnaGxAUIA4H0fvQsh
	6fFPrGj82nk8PYUD4Kk8NSh2KBAw4xamTaVtrg6Vp8PTBUduiPnzpG2+QUQ+QKv8dErt4SU
X-Google-Smtp-Source: AGHT+IGG9LZL6Q/86WX74N5XZj9qYPlo3OR250a6F4l7/ScFyw2yctiaAwQR6Ax+KIbBRfxQwQ330Q==
X-Received: by 2002:a05:6358:42a0:b0:1c3:7b75:24ec with SMTP id e5c5f4694b2df-1ca7977c9a1mr446366855d.15.1732305205386;
        Fri, 22 Nov 2024 11:53:25 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ee8cesm15535781cf.25.2024.11.22.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:53:25 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Fri, 22 Nov 2024 19:53:21 +0000
Message-Id: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


