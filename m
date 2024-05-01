Return-Path: <linux-media+bounces-10532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CF8B8AE9
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5381F22B07
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B812E1E2;
	Wed,  1 May 2024 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="akejBctd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948112DDA5
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568897; cv=none; b=hcCSpmoDi9C1bVlhQdyH0ER0TG8jzgds3qJ5VeiTwD/MrxVi3RFySfj8VosnUl6iUoJ+FXZH9NzwCwOvG0Si46vJQWuL6evFi69vQ5bIXoINksHof66I6Y4MngzroQW6NY6cofp/ltmXXkbRohxzhLCtVpQLxt3xtcpCFUYzyRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568897; c=relaxed/simple;
	bh=gc/o9u8NzZx22ClHEHIcXqgu1FhcRGTyvSqOBDjqUBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okBgvqpjUUXDB9ESfOvP39AcykToi8WrGs8j4nMgmQUqGaNEcG+3qCPqFqL+8cGCh0189wwthXR3R8PKIdOHiKsApYSmfDUGfd9KcVXzemjhVgPB1btm0mX7v4yiWEXNJTOn7Pzn6Ci7ooCNczpxmiRkoWBLkL5G8SdmXe+Che8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=akejBctd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-790605809cbso594263285a.3
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714568894; x=1715173694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4YWfk8RHGxp4UPGDejpf4mUjri4mE+IBxPLABnVZ8s=;
        b=akejBctd/CkzebKoqH2XuIVrO5JDVC8MnCdM24KlXWdWRd+yToOTeBxcpTGFanCLxw
         EVCb6R9Ddam/ewiL4VuVWIWC7NQcwJ/8zJxLsQhoY42wHqN8IrR2Zhp4BerIiM+3lhBC
         WfaoBVIWOc04Zu6AzeYI7ueUyKShuskeQdZj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568894; x=1715173694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4YWfk8RHGxp4UPGDejpf4mUjri4mE+IBxPLABnVZ8s=;
        b=kAjzrwFLvFTjD/fGpUHt1mI2hH8ihdo+K5lZwFX5myrycQVcO0JJ57mrgc0xYcQO4C
         r3eQh6gVDkIsRiZWe7DRDLka9a+O7OKBinqbtBePdh1Hh3GpB1TsIbbtAUmEWLLKMIcZ
         6CBkWjZ8Psp0CEtD61cOBaLREEXNpQVtSusqovCheYDH9DfJLiJSW2h5y5xxZS2JWl1+
         AEOsVj/1YHhTguVKeTTw4SsgvjlG1EQ6IUqoylY/jxgO5QyxVEtAOwZM/hKsa3loYrBa
         BFYtyLUaQe8C5ydZ0hK9TR0LICzms1rNH56KJR8/tRjSJ1ClVphPSu8zL41ugDm4ax9X
         jppw==
X-Gm-Message-State: AOJu0YwY6+TLrS5AVST+q/bXLNCNnK7JD8nq38ZS/he3VOOFRVlBiRob
	PaGsqYcvt6/aUkNH/ClmogEhSmWxE2nUtyTir9kfsp5rFkUEIqa/L1z2cLqFIg==
X-Google-Smtp-Source: AGHT+IGq5qL9sa8p5ZZp4PD7t6F2nP9QMolqC/miQC8Zec7V4HBvxkYsOoa5pPf0S1YbJ4PC1AiGEA==
X-Received: by 2002:a05:6214:c8d:b0:6a0:caba:7e36 with SMTP id r13-20020a0562140c8d00b006a0caba7e36mr2957189qvr.29.1714568894525;
        Wed, 01 May 2024 06:08:14 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b10d78445sm12430971qvd.142.2024.05.01.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:08:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 01 May 2024 13:08:09 +0000
Subject: [PATCH v2 1/5] media: bcm2835-unicam: Fix build with !PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-fix-ipu6-v2-1-a5629a37a0fb@chromium.org>
References: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
In-Reply-To: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The driver can only match the device vide the DT table, so the table
should always be used, of_match_ptr does not make sense here.

Fixes:
drivers/media/platform/broadcom/bcm2835-unicam.c:2724:34: warning: ‘unicam_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index bd2bbb53070e..c590e26fe2cf 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2733,7 +2733,7 @@ static struct platform_driver unicam_driver = {
 	.driver = {
 		.name	= UNICAM_MODULE_NAME,
 		.pm	= pm_ptr(&unicam_pm_ops),
-		.of_match_table = of_match_ptr(unicam_of_match),
+		.of_match_table = unicam_of_match,
 	},
 };
 

-- 
2.45.0.rc0.197.gbae5840b3b-goog


