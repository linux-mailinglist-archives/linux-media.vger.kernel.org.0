Return-Path: <linux-media+bounces-28329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B61A6390E
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332A016C9FF
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D392215B54A;
	Mon, 17 Mar 2025 00:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwgW4dxD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52914A614
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171992; cv=none; b=coDoO7OQWtnZ02rPU5gD8xZ3ndk0J1oNHMQFF9T8FHIbK2KxCKBOl4Yj7n6g6SUxTQpe/f8WHpF8AAeisrxDucymXm3dujZbdIyPHpcDwMXfmxVuI0j2mLSUOxdrzLAyxSDmuFmnTCudxzS07dIhfIbgS230C71QSRUGVaW3gxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171992; c=relaxed/simple;
	bh=xI8NEGU+/vOVowktJFplHlwmCPwO6Su0nn2Dpzy9ADE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ippUg/2IdYGPG17Ew5v7yY0UhL2WdjyQt7zRZZS75pLWpFOAhXrku+mWP1CbAYkfeF8w484+TBJrY4c2nKHpbDUjW8C4l9PbNEC3kctYmx2+geWfaUorauTxr4KXX42xeXtx6DDnnRuRfttsuqVJImn//Vq1Fegh/IrmYw031SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwgW4dxD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5541795a12.1
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171989; x=1742776789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTwjuKAVPDFwywDGvwuXvBGY8agm/8D4s3lYkbuf/68=;
        b=dwgW4dxDF+giCyGeXOSUDreZyh24J1wwO4BvjZifUPRO9VDJLse7s4ombFqDgswKgb
         8cKLPBvEohcHc9dui1TKnX7wgmHyqkOISp27ts87Ph5JeNBluC7RRWJ477Ty3+romS3G
         L4NMLXkDsTgT4FThjCQdgafoz/zdiEquVycZgNAq2ZI2JRMSRRv7+CeIge+cJSAiOCQ2
         bCSb74Mxulpf5kRVA2xVYxaqshgCGhyGrNHxpV7ZLzLsNZmY79DExvOKv2ot8oBnKc8B
         O18FSpej0eu5UZcNf6KKOlV0jnkdt805dF6bs6gr8YK0eK+hb/24E6TFxfcSnsFyF20E
         DQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171989; x=1742776789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTwjuKAVPDFwywDGvwuXvBGY8agm/8D4s3lYkbuf/68=;
        b=SIBGm7kkGgCE4Co4LGuX57ZwOf9ENi7ejo7LJz0jKNSVrpZ1ag2grPAMC3Dbl/rjXt
         AwqJIT6goJpwZVul4ZquyuAKvrhyhemPT7V5kjtQIuC7D4qOjDRrU0SnPs6YgwLGURJc
         Ia+wzf49EcWEDKrri+1yDKFPlDlAh4pEvZuhncd0A8PG8YbLJIXVl1bAFlr9dYqGNQs8
         XkGaS9kQNFhU9notDb4Dy2j+W1LsgD1pNyQP0ep7XmlO3gpP8Ek0ujU36LtyPjXiHRRM
         AVC7cz4TrXA718u+APhb2gZ5JfWWr1lmXmVFWgOduz03jAbaTFKYI6A1yDjuOB/X/Soj
         TeGg==
X-Forwarded-Encrypted: i=1; AJvYcCVM3Fqjk+A4RnqqjFMMIpZrU2Qi76hs9a8mp+uHkQeeYtlGc5l2gvXSchSfNVlcwld+K+87MSQPMdotDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxadeeKNZNvSo97Ob8j29LNY9tFkHXvzkGdXueCG9DxnOrQc9S9
	zIpx5zOQ6uA7vX4U62lp9S1kO+M1u7FSx0cQmA7RTft0SeJah+DCHYYyW3S2L+o=
X-Gm-Gg: ASbGncuxkZx6B4GmEasuc4Zy6NIJq8ViH/8mTeIJFxU/zuQ1B7EuKXIsVxNWI6Fetrp
	5Kocx/zustc5vBYYvA2XsatPxZoZD1prj0NWeyjT9Y82wU8mbwt2w+zTwt+Tq2QFdjUd7t8KrIe
	IcERsXJ0bSzH3rVWqT8CQcLn7h/EXEPWDJpZk7YA7lYdPnPKDDWcCLEG3+2XrfbY6dUf3pxmKgS
	lwjrD3TyGoWJTkY5qWwQCNO2LrjoUTudkxjK9pWOEDSqScGkGNulF2IB42KfmLQTPcMZ2Z8RFW8
	H5prhzh9xF5D+3OEm/9qNkFdBP6NkgjyY+4y+BEbnwl4Xzbc9UKwGukHGdtsIXxlS1R5mAgu6iu
	xSg+1qU4RFPZAu4AU+PVgMzlysDhAC56UI6EG7Sz3vi6Lw4Q+aI9/EL+JLnxSXXO3ZF2T
X-Google-Smtp-Source: AGHT+IHuPF9RmLSS+cmRMvKhsL6P3ptFy8EeFpnvckAhRdDHOi6nF7p0bB4TaCKF/ZRiT1JFMASrhA==
X-Received: by 2002:a17:907:960f:b0:ac3:1b00:e17d with SMTP id a640c23a62f3a-ac3303dc6dcmr1028421966b.54.1742171988774;
        Sun, 16 Mar 2025 17:39:48 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:38 +0000
Subject: [PATCH 6/8] media: i2c: ov02e10: Implement specification t3 and t5
 delays on power-up
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-6-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

The ov02e10 specification says for power-on:

t3 = the time between dvdd stable and XSHUTDOWN deassert
t5 = the time between XSHUTDOWN deassert and SCCB ready

The power-off path in the spec shows no required delays between XSHUTDONW
and power-rail shut off so power-off is left alone.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02e10.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 9ad70671a718ea0aaf80ad3adcc5738ee57a7ff6..40c4d3ee36e3e2a0bb8be3ff10d016e2bb9bbc9d 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -579,7 +579,11 @@ static int ov02e10_power_on(struct device *dev)
 		goto disable_clk;
 	}
 
-	gpiod_set_value_cansleep(ov02e10->reset, 0);
+	if (ov02e10->reset) {
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(ov02e10->reset, 0);
+		usleep_range(8000, 8100);
+	}
 
 	return 0;
 

-- 
2.48.1


