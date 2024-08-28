Return-Path: <linux-media+bounces-17055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ABC962F87
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 20:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F441C23A13
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B641C1AB53B;
	Wed, 28 Aug 2024 18:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rew266iW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6D1AAE23;
	Wed, 28 Aug 2024 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868823; cv=none; b=EAmNWc2pEwgheesr027wFMblln6MuqyoPTDoaL30wvGNt1HjFTNM4rqv0R1M+ZeAduL466et/5CR9fUVppuumylRwLO6hXg1TmYoCvCTv0xfF9s0iEwXQH7/DRHeDTTpxS0vxtTYIEBIiMpCs4NZaSDllXKBh4jEXlO8eQoMZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868823; c=relaxed/simple;
	bh=U46e1NPxxmeg/TwG/zcQc/Ykfl2jj1avETnLnIwJbhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqHc9LDJJ6P7osFq3h93cIXdzRMuNbuWlZp13cqA76Nx7YvPyNtblUkB9dD2Ey1Im6fhRY0fuIHmXu2hT0JCTB9Ubfc/Oue3rwskhdvG1ImRKhcN0UOL2esNj473Q8W5ziyor9/LkXqmIFRsQVeK0/Wy6dAXZKTflxArkGbIN5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rew266iW; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso10449931a12.1;
        Wed, 28 Aug 2024 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724868820; x=1725473620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ujNRN889/t6K0n1E+yA+haDN1wdzDXSnITwKdROfLs=;
        b=Rew266iWutUAjNEeqf55B8EPjTX76t6nsAIWmr9Fc3r6RNHfh/HvmdPVSSe3j6Ency
         eqbA+w9Y/QGvOhPQGCCoMRwVRM3xJDOdakreUMfo6UtAndWamEk2NgxbqZu6TKJ5Sgyr
         CtI2Vzxx8N6go4/kppd6tltswpC5wGbkTQIPpKEJYaqhHeCo4CuTOb0ddEO0bzxcUa4y
         4eZQFtIBY7NamuJcclpW7oJ3rGHEX0QLugFt2LlKa7pD9K8QX4273JzgaFhWaQnLxveF
         J6NQq/JdhaPQnyJNg2OQJ5AimzC5rVCoD5+9SufQ7y9yyuKtqYlMDzLy4rGOch4I8YT5
         sT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868820; x=1725473620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ujNRN889/t6K0n1E+yA+haDN1wdzDXSnITwKdROfLs=;
        b=ODNJZEpulyvOsYztmpDEbeWXwTqrWU5wTqRgprxqgmmcTjGby07ApouhEkWJSLXGyv
         5ENHWQ5x0VpQkyMjmWMAK2aWi77ccodoIT9/y/KQIdL8PqccII1MGJtkz4fSEF0vQDY8
         hSOKlf7Ikq1gWBa+gQq0TDtVM4Nuk1b9WKGr5zUkfmHHGXKrggTy1OWda3898FIGMpLM
         jSA+O2mITFJaeTeDYRRU6FF+VvrGtdYiywKA8wisAKgDg97W4I93FdO7GT71TWl/X5Zx
         IOXspWs7bzN7QU2GGiY3gI9kryTgtdH+CrgyuRAJEbc+TdFnp4qSQAvgPrsfWyBhwAQk
         o+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWMk/Bk5NpT3zPpMvYXDl2/Lpwodow8d4HjxPCjqBq613s8Uf2WXmasKDSQ7Fv+1Hx49MvbdtLBtnLD+KI=@vger.kernel.org, AJvYcCXpKDiHPegUr1h0gwhFu6k5qEKxL8YE0CjGcoXpv7IY/RggceMJQpjGKiYF1KIrJr1N0BnqvpcjAgdLkRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxLiD7v+JZoyUn8kqIFZuTotM2wmZxBOzcO+zCkeppBjb+rfY
	KGaPMhIxFimzhJyL2Aw6++KVHnjFuwm+JHE1MYUYlihWTmMlVD0v
X-Google-Smtp-Source: AGHT+IEKcUVpPlL/1BOz67lP6O/BgYV0leAFS9TVJppfpTrc6oZPLrnFVdfOvmRNG+sdkiZNH6HqfQ==
X-Received: by 2002:a05:6402:3705:b0:5c0:aadc:8b51 with SMTP id 4fb4d7f45d1cf-5c21ed5758emr272237a12.22.1724868819711;
        Wed, 28 Aug 2024 11:13:39 -0700 (PDT)
Received: from [127.0.1.1] (77.116.208.33.wireless.dyn.drei.com. [77.116.208.33])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1e51c8sm2525549a12.34.2024.08.28.11.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:13:39 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Date: Wed, 28 Aug 2024 20:13:08 +0200
Subject: [PATCH v2 2/2] media: i2c: imx290: Remove CHIP_ID reg definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-imx290-avail-v2-2-bd320ac8e8fa@skidata.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
In-Reply-To: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

This register is not described in the public available imx290 datasheet.
Additionally, a read returns '0x07d0' for an imx327lqr and also for an
imx462, which means it cannot be used to distinguish between those two
imx290 derivatives.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
introduced in v2
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 2a869576600c..48502ba19cdc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -80,7 +80,6 @@
 #define IMX290_ADBIT2					CCI_REG8(0x317c)
 #define IMX290_ADBIT2_10BIT				0x12
 #define IMX290_ADBIT2_12BIT				0x00
-#define IMX290_CHIP_ID					CCI_REG16_LE(0x319a)
 #define IMX290_ADBIT3					CCI_REG8(0x31ec)
 #define IMX290_ADBIT3_10BIT				0x37
 #define IMX290_ADBIT3_12BIT				0x0e

-- 
2.46.0


