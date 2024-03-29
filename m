Return-Path: <linux-media+bounces-8228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C972289227A
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 18:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8382E28CE4B
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70999137903;
	Fri, 29 Mar 2024 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2yBLTrw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B63136E28
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711732285; cv=none; b=XGg250qGa9uk+mVSAF2ZkJPZ1y+gLqLzyfJhloQEfSECZv2R5EQbMiPvjmxlNf+TjQD5p+Lu8t3m1gom6FsHqgopWLJITjPe05MVUUqaSoNWizE5A/rRBzNg6eT+i6OB5brMqO7TpfJxcDP8NvAD4q5MiyXg4Wyl/+Rg4IQdVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711732285; c=relaxed/simple;
	bh=BvkCan4CYqT9KahpHLPinkF0Oqsyu4ARVTxo69Ya3OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=khAtV/x1Cd0O2J1uHO7h1/lCQM7XHa4wy1t1eqVCQlIo2muCPm8lKSrp9JLqimLRt0EFSYUx3H3fXjbWaSTbQ4G3XgEiGBIjUENnD+gm4xkVvp6i7g7n1xBg/xmjMSJ9wMWMtpR9BBq0yMENRSxXi9gj9CnHA19vbWOPyK7jzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2yBLTrw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso1618386f8f.2
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732282; x=1712337082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojAEQZDNOooKXWE3jOPqHLahg+qtKGfAOZ8JmZimIqs=;
        b=F2yBLTrwsoGuf6FL2iqke3TmioSLLDxIeF7/jhPwFCYHfnAmnpUxNIDSIILllyA6tF
         k7P68wBrNNAzp0aPSbYUqwJ9fJI0XEUv3gHv3otPRecsSRj6g+f9A+GOLz3Qf+OJPglM
         XiEwcWzkOJFNyxioXH/UyWDE796rnEFwjNwnio+cPfDJTjRIMJRdHQyASAEVjJHcvs4f
         lsI4QSp+J8cdWGw1/72CQAYIkceRNhgLK/Uwz64hWVIYs4CBSAATH3tIlZELs2wjXW0B
         vh7foDWqW5CrpW7Evci+ZbWxS3ZXPyhatT/xS61KtMwKo+6Y9OTgo/7/6kEmNgMDksXE
         XkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732282; x=1712337082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojAEQZDNOooKXWE3jOPqHLahg+qtKGfAOZ8JmZimIqs=;
        b=HPDy2/IHtM7QiLDz+aC68Ynk/uz6txRYvTVEgT4MbF8cbHqzaMR+il0Md5Mx+Ru17A
         Zqub+x0j7/3BI9+7U/GCXl+XHVUs+LeEgeV/09GjGBe05sjQSEMDUQATsuKk8GqkYqmB
         0a2nHxnrGjk0TIIwSTqpkF2BnPLlh2jOXr7z/L35Dd/8ah+CxZ2kCYYPvl3dQTTM1CoC
         YvbZ+l9mFohz9Pt+2RbnUfI9+sMJ4SZzk2fV5iVe1Bt2PVEvU5XrQBUIlQMb7an08+H0
         y9KEhZQ91k0SyuYyZDPXBxYEahWiO+qlh3KrAJDGcudVGKyUf0mQl41nreb/zck6fVLN
         STFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQJHlR2xa0i5Ja0+CdhwedDD6d2JgimwpoKzK5sj+rrKj9tetpnA/lcPbZNutmuEP/wK9w8LJtuv5Bvwp4vD18FpExk6aYdvC0UdM=
X-Gm-Message-State: AOJu0YzKQgeAhMDe+T9TOcp5DUm+hkvk+SE22xK4Am6KgKntwRtnmmJR
	19sMsjrprfXcwALwvRptyQ254nIy9MFtC2CGEI70Qe9pqn4CCv6g3km6hTFB+HE=
X-Google-Smtp-Source: AGHT+IEAy+f4w+/Jzcajbg5rnkuzn9DVcYFe2lv/hmJoucFb8AAoUbo15n3rDzI0YgxpEZXplS0/3w==
X-Received: by 2002:a05:6000:4014:b0:343:2e09:58d1 with SMTP id cp20-20020a056000401400b003432e0958d1mr2500413wrb.44.1711732282727;
        Fri, 29 Mar 2024 10:11:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q13-20020adff78d000000b0033ecb329f15sm4622520wrp.9.2024.03.29.10.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:11:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: mmc: siano: simplify module initialization
Date: Fri, 29 Mar 2024 18:11:19 +0100
Message-Id: <20240329171119.63992-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver's initialization functions do not perform any custom code,
except printing messages.  Printing messages on modules
loading/unloading is discouraged because it pollutes the dmesg
regardless whether user actually has this device.  Core kernel code
already gives tools to investigate whether module was loaded or not.

Drop the printing messages which allows to replace open-coded
module_sdio_driver().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/mmc/siano/smssdio.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/media/mmc/siano/smssdio.c b/drivers/media/mmc/siano/smssdio.c
index 065b572e0272..8199077faf36 100644
--- a/drivers/media/mmc/siano/smssdio.c
+++ b/drivers/media/mmc/siano/smssdio.c
@@ -344,30 +344,7 @@ static struct sdio_driver smssdio_driver = {
 	.probe = smssdio_probe,
 	.remove = smssdio_remove,
 };
-
-/*******************************************************************/
-/* Module functions                                                */
-/*******************************************************************/
-
-static int __init smssdio_module_init(void)
-{
-	int ret = 0;
-
-	printk(KERN_INFO "smssdio: Siano SMS1xxx SDIO driver\n");
-	printk(KERN_INFO "smssdio: Copyright Pierre Ossman\n");
-
-	ret = sdio_register_driver(&smssdio_driver);
-
-	return ret;
-}
-
-static void __exit smssdio_module_exit(void)
-{
-	sdio_unregister_driver(&smssdio_driver);
-}
-
-module_init(smssdio_module_init);
-module_exit(smssdio_module_exit);
+module_sdio_driver(smssdio_driver);
 
 MODULE_DESCRIPTION("Siano SMS1xxx SDIO driver");
 MODULE_AUTHOR("Pierre Ossman");
-- 
2.34.1


