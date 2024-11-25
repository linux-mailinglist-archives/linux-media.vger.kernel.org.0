Return-Path: <linux-media+bounces-22039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2139D8CC0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5731286715
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D061BC9E6;
	Mon, 25 Nov 2024 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpHgpsG/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9B2F2D;
	Mon, 25 Nov 2024 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732562304; cv=none; b=TXSjwsuSGFi2NLE6bvfIRPEfxbD506ZJBIEr3/VOB49DSyBBYMYupQikVtIYL7wfzA7pIsMxg6M2Tc6PxEibAT3oWYUpGfKgeRsbOks5wNA/TgG87yPQMeHCDf+Ojt5SYHYvQlohVB3ZjBGipihiXza/8s360rKZsYSBd5GUNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732562304; c=relaxed/simple;
	bh=KqpcSL5ZK9Ifr+2efgOUwaGAxAAr+m2ijMVHHU3Xj3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jYb5mPgETHsLY5LzYKmN8ycNAPHLqAc48T+xt3bzzruQ1qtgv6dVNIgpp+mt7GNH3p8KWWfL05fNZQ8NCmGEgEsVo74qMNQleMuSA07x1Kgn1lv9z+128Tp/LVti9l9QmZ9BVU8Kv9nnzeaBVdzNu0N46ITKWB/xmLR5ylTLsDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpHgpsG/; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-466966d8dbaso7497741cf.3;
        Mon, 25 Nov 2024 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562302; x=1733167102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHMSsIO5ddeQOx4lVtN+I8avLKmTpynXtfS6IHjzgE=;
        b=PpHgpsG/6qkEe20Y6V6lWSANVzTe8O+JDsvJHYz3IfhX1vE872JqgE0oa+OXPqETp5
         vR2fAbEU/ziHu5kZy44WNyH/fYkYFBLVa8rnl1xr13Dnhd9Moud/RsTX+gbFaVFMAS7L
         zvB+igw4ZJX4ecje+1tsfEL/KFPAVwkN7t5fI1vE2VElnHEkUDtVfNGnU2smyz4qIfIH
         Mk6Mz5GVByAiAusmEldcHSPLaeNGASvltwTFfYf3iY3ElNW8llaJuvLv83J9MLHSiIL1
         uROKjZgL9xRfKwM5Tj8d9W8eQwdnb4Hu/+cz3aYFAhKUCRgWWp35hHiuK/9elKd9XC96
         00TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562302; x=1733167102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAHMSsIO5ddeQOx4lVtN+I8avLKmTpynXtfS6IHjzgE=;
        b=t79BC51tV39TQfdfX4vAP+u2xUjfVOWPpn+wenq6qJR6JVrJQlkLMdWZzlwfDf6hnj
         Tf3OMX6ZE0H3QPLthQJdwSrRWx7dL0h7IBDzHDwco8lQd5PtO1pONHQRaSa/usbBNznQ
         4NfUqcqKoFRpfrdD8iqhKjV2zgdBZlEwYwQm6wNKH+42vdDqE76YUROQgDUbws7rUmlE
         t8IrlxRsqMB4PRTWjhR1BGUmz+dfsb0s7DZSmaJCXVJrju75wV/ts20d15a+pWty/MgP
         1nqX4c0Dx5u+zN0LWE/R+y8pgMFoXbRRksiRr6GX69wJ+B7p4W8p3cXIntHBIqKcV8EY
         rUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWlrrvZ4FyPRfgxtnP8w1HCrMjW36vMzylHl4dLsnDQliomPpzvL1sgele9TXnOrynbo0RwDUspTnVk5BVF9LI2K8=@vger.kernel.org, AJvYcCV0wgDyZC6XVZ4/dmwVBeo69znTCzS5r+Jb3PuNT94ysbbrMQlL1A3dJWVFIkfJf6Mixm4iHOWZDGyvEig=@vger.kernel.org, AJvYcCX3vR17ua9BiWU8ocSKw8LoAliJ/BO2C0PsKRxDJemCJI4IQlHwSOVsGrNRSNi9nyx/fAheBpXnlFVqsco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SFqEpNkhZb7ycpr2toqnNw8bDabKAt/IAtMK1SmYePHACWdn
	X1N6wK/jiDRS/zxnMD9Eu4oFx4cCPguZA3kzXMVRmwk3O1ostiVk
X-Gm-Gg: ASbGncs9IxDKvysCAkcA6HRarkx7ebsOgTFVK87FnGPlqw06InoKoSoOcBVQELzehQ0
	uEWesnz6zw4ilvvIAQ+qQ0UlmPD9BHdctikNh0a9a0DRIkh2AcFH4ps/yBgg8dpWBK2aG+TXHhL
	8bmoWN7LE8Y22Gtcwo7tINw+b7+cfc3iXPREz66PY84Wq0XB/OGeWpO3EHcmdC04JaEXa3fSiSG
	jeQSfMIauTGcu3zvNL5SJnyJER4cTjWtMZ1iXfgNtyTyYx87cWQRQxD1TG3lmCFp0l9Hvcp
X-Google-Smtp-Source: AGHT+IGTeVRK8dnEv8pLZMHBWIn9oa+b5th9cKFLAQnuxR7nxKyS8JQjQJzxVPrI1VwR4PTpAiDRDQ==
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id d75a77b69052e-4653d63ec53mr203814251cf.52.1732562301606;
        Mon, 25 Nov 2024 11:18:21 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466a41010dcsm1193741cf.23.2024.11.25.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:18:21 -0800 (PST)
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
Subject: [PATCH RESEND v3 2/2] media: camif-core: Add check for clk_enable()
Date: Mon, 25 Nov 2024 19:18:17 +0000
Message-Id: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
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
Changelog:

v2 -> v3:

1. No change

v1 -> v2:

1. No change
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


