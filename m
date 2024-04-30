Return-Path: <linux-media+bounces-10449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB68B7660
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 14:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261561F2381E
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4512E171E45;
	Tue, 30 Apr 2024 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S4CF5NqS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89E17109A
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481748; cv=none; b=ojPjD5EUccoKVB6g3qUamKacoFXPh0r4cIT87EguxTwmQAbaffXu0dnE82lSoNrbNFjHyZKGklGpfFeIflw0TD5o9GM2MeVhRwPvHWg2ljbmpztB3rYIIC88WEKspFHkpclLsZVm8eoiXIzIaKFOXPBNtspKmCnE0U8TaH4vOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481748; c=relaxed/simple;
	bh=oYyX5A2u0qlsJz3Khs22Q9EKJnbR1seZtA56i5V7sUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5f0g6HzXcY71C2DWgQB+uhoNe17l+L2b/whY6hZ4Dm13vP7pMR9ACPpPqO8NAFSpDcmV2P7oiwvoyD5hMjEuyVC6oHaqKK5UwIyOpFqkItynGzN5pfoshCU8mv13NDGhLlQWqg1Jy3sOsLfY0RkN5DxgvFqspDW2CB5gpDjlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S4CF5NqS; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6eb55942409so2686191a34.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714481746; x=1715086546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjV8GfCP2WHHQ01Aqc8mQQXzl2eD7DwGYj59FGy18+c=;
        b=S4CF5NqSV/7sgOb3QnBMrMwTsDvF2yVdSw75bDWzsB7HH/rCZpRYZROh2fl3msiXyh
         vr0teOHwY0GR+uCv2QaZ6kTgSRL9p2Ya7yMzlJvPJBNgUJISeAMlhFk5wlFllXp9ZEHY
         1UQpbe0SRJoTRkYZHcq54R+0JNI+rYZdFpduM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481746; x=1715086546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjV8GfCP2WHHQ01Aqc8mQQXzl2eD7DwGYj59FGy18+c=;
        b=akdAh92DLtXhVE0MPW0seSdMncuua/dY957QRcCMgweWLGNJ59hoceuauWMiKvvAx0
         tx19hax2FuTkvOPyI6i/f1m0j5284aQ5WYNx3kqpyaLAjOH8zkx0gsCfDBMWYIstkgXE
         ajKM8rUwHC54lqkNCx+vj3DofsXnWeqGvVZSAu/GBAwK5nZKOfpqjVNZG3foBcMDbWWu
         1dnaNcDxsNjky9WXJ/xijw32/w8cqehuwo4DY94wHPDYv5Js3e3ttp/EtAFFwU0oyEel
         2RkrG1VXO8rnt/ejNBhlJBg98+EInANzF4Yt3e3bt9Ap6dbJzf/2ZcTVw7kxOlur5UH3
         vSWw==
X-Gm-Message-State: AOJu0Yy2jYhbncKS04zWY6J/oSoRf62KlFUOSk4rsFFns41ksuomdOYo
	Ep8LY9xHYwsfksIEcl9+U55brn84iOQyxPK88HkRm5VppFqI5S18Pt/idSkLgw==
X-Google-Smtp-Source: AGHT+IEgUWZ5sviYRGNJaeAywK807QZ4gEbNChyUYkiHWKS+u2I4svAfqrFMNl4wY8mlmeEBL/dfjQ==
X-Received: by 2002:a9d:7dd5:0:b0:6eb:e0a2:bbb4 with SMTP id k21-20020a9d7dd5000000b006ebe0a2bbb4mr2938580otn.16.1714481746548;
        Tue, 30 Apr 2024 05:55:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a111000b00790f90ffc32sm1553667qkk.22.2024.04.30.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:55:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Apr 2024 12:55:33 +0000
Subject: [PATCH 1/4] media: bcm2835-unicam: Fix build with !PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-fix-ipu6-v1-1-9b31fbbce6e4@chromium.org>
References: <20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org>
In-Reply-To: <20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org>
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
2.44.0.769.g3c40516874-goog


