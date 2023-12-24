Return-Path: <linux-media+bounces-2990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BC81DB46
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48AC1F21802
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D0618EC7;
	Sun, 24 Dec 2023 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMgj1Mat"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874418B10
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d514cbba3so12883675e9.1
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432686; x=1704037486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVcN5riSMTARMq06POG7vm/444G+7336L8LSfQaXxBs=;
        b=pMgj1MatdDBS7FaCUwbPlaJSZXY3Yf7XmkbItFF4YdEtyXt1Fale+WRFdTx8foweuk
         1J7RfavkhOIEOnaMHyeP0alXPiygGe3LXPUz4QhiguVq/5q48p95sNlH6JoiFIxh4GAu
         29E5tdL07fcSfajKZCAIvmu+PkqVQ39lnI49pvMvc93KrXDQriHqVcMfMEWoZdsLki0P
         jfam0QmRemHgHzkT3iwBd4e7ZmgosF9Q0VrJVwcqjcFTPM/Wwhi7kx0h6ZDr9POQqBA5
         zeyiF0Js+ubqwhiMc2zbleE5J6LWHMuWcBh06HkyhlYusCC/9NNl4fEUs9yfSbpnsnAh
         G/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432686; x=1704037486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVcN5riSMTARMq06POG7vm/444G+7336L8LSfQaXxBs=;
        b=A+tjSDS3Ywx+XMhQDaJl3b342hJ8cMnYhVV26aYFmPghLJPAH67YPvm6U9+X0sYdCp
         fn/734bE2A+FdiO5JVsmUyMoWQvGZd9FKkCrwb8EkDguG/urlv5tGyZVWVKcILMRXSpG
         XkUIGzZbw8T55nvwfmkE6LqsnUpKzDl8zE4JA+Emd9QX4PIwuCA/QObJiR31UeQq5hB2
         QWCueqsPG/cf85LCW7fEKLisbeDb6O19p6BCzuohMsvtnOcQITJa2X3TnfCDcq8AwDnN
         4vlgASyCTtjDT2emvRZwDJEjVZFlFN/IOiZ3uVKjwJ+IPhCR4QGZEbcZPmJG2gBhri9u
         bCtA==
X-Gm-Message-State: AOJu0YxZbCwIoai12amV3wlTwmmyeW00QO6p4JRkWYNmBbH1jzQWxmih
	F0kBlmv775sY1TM8l+ofN11k9Awuk2JBlw==
X-Google-Smtp-Source: AGHT+IHLlyUYEzbxNQ4mTd/zBBnZyOhyw30NJX23+cnFC3EQip/rLJXvkKrHPjnjCs9rbEopQX0zQA==
X-Received: by 2002:a05:600c:4496:b0:40d:41d4:d29e with SMTP id e22-20020a05600c449600b0040d41d4d29emr2618415wmo.187.1703432686812;
        Sun, 24 Dec 2023 07:44:46 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:12 +0100
Subject: [PATCH 13/15] media: s5p-mfc: drop useless clock refcnt debugging
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-13-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WE1Snd5GEyT+9XFiQa4xPreMZitJzLHNQF3ijMXJQDw=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHZZIG+8mKy9SmVpztKQCav0xncqNdDwVKka
 nqH6E+6DI+JAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR2RAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXNAUP/Rvi+CzJ5xJAn/VinOjXGWkpHX6R9kHn/YesDFHeL9Sp832
 ZzFNQrW2n5n/n8XQ2TqyP+OulqlzA2pBs1Mj+jBJ3VnXIk3QxKh5TF4QcjBmfnVI8RPH/jz6czf
 M6TrGe/nxEZk/IwFRJkJZ7PEkom483qGVgokD6+WJ+TbP0D70NctCxvCcwQeZ3quTPbKJKUm68m
 xHtsrXIpMV6U7KrZCKIwifvHJDxCMh4RaBf9bDcuCE69zVARU7I509pLdPOzCi/mJ7z2ome72a6
 nTgL1nWo9bOVSuzKrqaa3cSOnOYs3mmi55y+YSekj8XrswA3HtEfZGN2qRm8lT0fCpGnx5IHWKg
 vaXEs5huJER3uR9RAmyqchL6G6KGIbCVpSD8QiNt6Zmv3hYuDhnkeiMWiEU+XKE5DZkrXdkfpfn
 ULQtvTd/HOnZ6cHgN1Krw3SYT69G65YHsnHlZ1uvSDO8qhEJBRMTtpIA6TNiggdUI72kyD1OxbA
 D6UQm4D2Mq0e+fSmU3LqSSA8X3SjhYfC03HjofEeMcZbWVj0tmsuQh8WgQUDspvr94N/yNsX1Zt
 f8wSyU6xB6FIxuHPVwIZaN/oTaxYutPFt9UmQq8ShIDLgyemFAXvgZbAUFbcJo6jm/xUypZ0Lio
 +hyuqisZk805huiYqOMV0HtVS04GjKnA2f1kM
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop useless debugging of clock enabl/disable counts, because core
handles this much better.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
index 187849841a28..29b141d4a7a7 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
@@ -16,7 +16,6 @@
 
 static struct s5p_mfc_pm *pm;
 static struct s5p_mfc_dev *p_dev;
-static atomic_t clk_ref;
 
 int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
 {
@@ -49,7 +48,6 @@ int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
 		pm->clock_gate = pm->clocks[0];
 
 	pm_runtime_enable(pm->device);
-	atomic_set(&clk_ref, 0);
 	return 0;
 }
 
@@ -60,17 +58,11 @@ void s5p_mfc_final_pm(struct s5p_mfc_dev *dev)
 
 int s5p_mfc_clock_on(void)
 {
-	atomic_inc(&clk_ref);
-	mfc_debug(3, "+ %d\n", atomic_read(&clk_ref));
-
 	return clk_enable(pm->clock_gate);
 }
 
 void s5p_mfc_clock_off(void)
 {
-	atomic_dec(&clk_ref);
-	mfc_debug(3, "- %d\n", atomic_read(&clk_ref));
-
 	clk_disable(pm->clock_gate);
 }
 

-- 
2.34.1


