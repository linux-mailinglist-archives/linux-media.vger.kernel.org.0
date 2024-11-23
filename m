Return-Path: <linux-media+bounces-21860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D286A9D6B99
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 22:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F273281A16
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 21:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A9B1A3047;
	Sat, 23 Nov 2024 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLqabWus"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68113B288;
	Sat, 23 Nov 2024 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732397189; cv=none; b=mESxTcVPxtE0KERYiRY3tRxpI7BpA6LJG+zBmGSiXxwYQWBmtdJWG++oGUYcDoq3NtNKpC4ul3f6wdspqvtai79EF5qjaGubvzle4rbig+twoi93xytrvT1Wl8eIr6Z9rPFZUe9JzIijt9SyFlOM8bOa7QkvGwupDj5ct8Wpd8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732397189; c=relaxed/simple;
	bh=E/5sdOL/jkUCbV3WEL3b/0KOfVk/fXbHHdo2d90g7Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SXP9J3hepgoI4YW9FooOWeHs/0HQm1Ovl5jnet+u7ZFmVWjTWt/Ij2FR30ta313S/Kp/dmaoqRi4vLno4LePbdZukO3PemogEQ1TTewyXUr6Ij3siwQyucdBrXgApfFyHMbw5u92JcWVAMQ7CEMIji+Ix4HoRjw0PkCrozlyMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLqabWus; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4613162181dso22370501cf.3;
        Sat, 23 Nov 2024 13:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397187; x=1733001987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=fLqabWusBrfsSCfqc3cWPR/k+ENJbPoS80jK49K+Wi7ROJHtg04MXu2OQmOqm0stOL
         a6k3DDo7qkMZU+YK589mTjpwcnrHAnh7mU1ScVzkbXrP3j+dz1n9R+xmoTDVK4SN631z
         +UA2JNcRmn5s3twb5gygPEQ3k57c0gjNL67q7tnEYmeAYKMTg0kxrccHXCWc5+sOe1x1
         fmVWideJcUNdKeRvadhs/JSlU/jR8EpTo5e1QDeStzDS89bVLC+Yo1b5cZ9VHkUi6r9j
         91jlF5bTRTDf1Jxh6o6dz8SajZyXm3EZtZDXWcY2//h3L/keLGRjY8o2lZWyDxhraXHX
         OMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397187; x=1733001987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=euV5WzK5sMP9356C/bSoBRUkQRpwVMs5VNpy3+G1MgBypDYphC552uOLjZ7BX7MEUz
         vk2OZDOzYDCH/9dtaJTMjxBzPjAb7b0z8GW2bYSRaoq6XmXZ7EmsxDu6UVOrzH9VXMr7
         uFImPXsppCD0llnXhYACe9bo7S/fCJhWjPqMGpg9P+eRiVzETUZZw8oigZqC/9n80gUr
         6tl8BnPo6ALeVHyYuXfXZobHmCt0u+klIgOae/1sV51Xfl52Qgyuzx491XjJIBRG6maz
         7hQL3v2jgKtQPi3hB/tZA/tt6+tZ8hNofYU97kfDAkec+JTd8Q7nXFgVeGSdoVaIb9Zk
         l+hA==
X-Forwarded-Encrypted: i=1; AJvYcCUA8ixNqBtqbSQ6PbOJbHBN3WATRbMWHPHwkTD79ogU81gqhV1SncIgH4ymaV/lMDkDUVqojhvpyuzGlvILD8pj36k=@vger.kernel.org, AJvYcCWqlPc8FqHTft44qWD1fe7syGLkrjVYQml6zlKNkD6JA160N5eVm7bribT3P/6ZfJ8rE1I+3iyJbX+hooU=@vger.kernel.org, AJvYcCXfiOLOsRVX2TSxqSvWTiudD1zzd6pGBd5TJygIIQq7gWApoaxKObEbyR7ESwH2BwKPYw+AfbanXCLjFIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz830nTmZAk6W0ZxlX5/FICEWVenNUoROL9HxIcG4ylcGLqjP9
	Q1hRj8DFpsvGOBZTnf+0fV9clcAWAjXaIwOkjstolQCisHzkNs2c
X-Gm-Gg: ASbGnctTG4F+zSUQK+8gTBq9G4uEX100uq7k2UEA3Yx02drwA6vkxDX38K5ssorL0NN
	WoiiMGzI6G4FF5dEeEP64dV0HUXq7gZE52ytRK2/SkcuBBzTr35v+ehEwuY0xhY2HT29sj6jWYC
	VS5LltPwSg8ren+U2r2v7+CKcb2pNuX0Yp8BiLyrEegydG3LAQw0KuNoCJZoSJ3vyMQ1J2WI8Zm
	nfkmayEHHFIVUzr40sKnNVcT+PQxMPvFk4FweMuv65j83KDZv5EMB8g1CmNi3PG70uys/VC
X-Google-Smtp-Source: AGHT+IG5PKwkaZdfHENRxLK17QUpoYrvU5jJ1tBVCBUSAkJvvZxzWp3amwDBrzNlQ0M668EVPCFsuA==
X-Received: by 2002:a05:622a:13c8:b0:460:ad75:300a with SMTP id d75a77b69052e-4653d620415mr115969591cf.37.1732397186893;
        Sat, 23 Nov 2024 13:26:26 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3d9c14sm27763811cf.15.2024.11.23.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:26:26 -0800 (PST)
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
Date: Sat, 23 Nov 2024 21:26:23 +0000
Message-Id: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
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


