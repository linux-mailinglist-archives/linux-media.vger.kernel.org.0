Return-Path: <linux-media+bounces-28286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C42A62D9C
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D331A3BAAEF
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A2E1FCD02;
	Sat, 15 Mar 2025 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8qG25cD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D21FCCEA
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046037; cv=none; b=YOoHaIfkHEcDElyErT6ITWlLRG5jg/kKjYXSetYDXOSgPxY59fN0UHtN0CA7zlOcfTMTgE5jKYb0br/TzYu4Nbg/b/Ogwe+lOc4gxlBXPPpRBORBo8Qr00O+KOdR2vimtye3KRgNzeyzOefGgyFcalMDAHVyBnFn8QdusBijNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046037; c=relaxed/simple;
	bh=6LjldgotJJNlrPKOC6hW99wE+ZsCOEnLmJ5pw/S2NtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUtAxFs1rKBAj8xX9QJxhNu7z41iGhSODR2sj+kWlqMH++ER0n4ijjx9iNboCOLi7Kht7PqP2zjRlEx9nt2KyIFjSCkZ7SGY2U4Z8jGXPdYFyKgEkbpLgCGZn4dRosaYl0k/6saVyC0TcxCi9svoFIUpRloKXUqERgoXeYATrwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8qG25cD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5232466a12.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046034; x=1742650834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDqwhYPsBFyy6vhaJJj0lCmkZup6HPmlAlZHVtXyE6M=;
        b=y8qG25cD/cAnrWzD04ZG577x6Eo9yt4e89Oxqs6zuDf33fT4cnClTmL1t4z1es/Uk9
         r5O7r6Ras/U4ubt6x8id3Qo9PjUEftPFVHQKFtv4jjrb4ZoeWHKldjg6jAjJIQW2cm/5
         yJXj2HOr/Mh4fYMz4J5oi9HL6ic5PYtjsBZPKH2wJdpwjcm2IMHLbqfU7yYU5dIJiTfK
         4SFG5o/hpJq2qhpNEdORJ3hVzdcfqPfx6XgzzfPKlNgcppP7MDIuqAGD/KoLJPxdJwgp
         mL5EEfWyg1TxG8kpjaNJUfqBMuILA/QtJRSveWRenHGUZDFs8qKxANK+TbTRHu0d2Vgv
         6sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046034; x=1742650834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDqwhYPsBFyy6vhaJJj0lCmkZup6HPmlAlZHVtXyE6M=;
        b=gwzKSBSXPYZukd39uCLtLG5RwTEd5IUsgvLGxJcYp7K57CHoot8SNIjWTW618CEf3+
         nieOuilukAATdROtE8oQ/zlXtC2+seOWQW8an7RdMLHwFjYyo87a8NLegqh47sHc+/or
         N8+ehP6tWeLEI00Jz8jlY/XdaBQXzSvXhL6/+RrxAaNnH6/Y7nr3YDh+6YKnwjmQKU85
         pat9GMoUoJ0HH0Z0Gj4oHC2Mz0u31Fud9uuE8ln3KINZDHM0YNq4RuBcUPk3OkMqSP1M
         00lylagWpHLkhRbOI4M7fiLC+yS8tVogV9uN1F42sMiRqkaRPF8RUZzBah6nzWP56AaG
         +wbg==
X-Forwarded-Encrypted: i=1; AJvYcCVNlPCD0yKrVe9Zb16TRswivSiVcIU5rNg7lPTcBfUugF4OXzAM9e5SVceO3o5nVw0A+mjJS8tS/S/Usg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pmGS3/RziC8007JtiKtFw+T/4SSoYgeQjK6SmVP1HRg/SX1T
	K7/BZHF8SqUahQk7Cuc7VfYjwxtszxxbC5sl875DLo089/B6xf3wcQgnczq8JcU=
X-Gm-Gg: ASbGncuAR+xDaqGPkr66xC8u5It9AazT2blI7AYDro1qNAeJqLX0TWdyLLSuB2fZG50
	YHl7bmQ2YwEPpQUjrVPBS2Xucb2WIdrQPIGEzivZe8RQrywfr3oKy2WRusoLcLY5MtDaSSbzJ5b
	tPfo/dQuQ9TkaXuM/AbaUDDoLeL2uJ4gd21Eyd06TvtUABL824y4lghpR9oKwrkFiphnkx5IwNb
	fbMgqvRyEXPQ0hpJ0UScYfTYp5y1u13y8RoAomfBXUuGovc7yoWHRCYYly/Q/4gekkxbJaNgXf+
	JZU57JX8FFc2X//EorjojkGgDJGsjBwrneFcWwvvm26rGcDWytY3sD9ugPoNy1Z9c+jErfYJgzW
	geb7Tcl8IzaU/h5cn3AGPyCqdItIfXJfkWr9j7ylqGeXWmbiuytjMiG8Wxt96xmUkT8/sNM7WWQ
	==
X-Google-Smtp-Source: AGHT+IGU+E3i9PkeNS0G/C6UZWdMxGBZZpyNAF02ok3x29buow9pjUrs52yeB10Liv3HVPxhYHSPjw==
X-Received: by 2002:a05:6402:42c2:b0:5e7:8501:8c86 with SMTP id 4fb4d7f45d1cf-5e8a09fa617mr6135415a12.22.1742046034152;
        Sat, 15 Mar 2025 06:40:34 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b009fsm3378824a12.34.2025.03.15.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 06:40:33 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/4] media: i2c: ov02c10: Make reset gpio logic optional
Date: Sat, 15 Mar 2025 13:40:07 +0000
Message-ID: <20250315134009.157132-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset gpio is optional. Only trigger the reset logic if the reset gpio
pin is valid.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02c10.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index f6542cdf7472..595998e60b22 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -664,7 +664,8 @@ static int ov02c10_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	if (ov02c10->reset)
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
 
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
@@ -694,8 +695,10 @@ static int ov02c10_power_on(struct device *dev)
 		return ret;
 	}
 
-	gpiod_set_value_cansleep(ov02c10->reset, 0);
-	usleep_range(1500, 1800);
+	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 0);
+		usleep_range(1500, 1800);
+	}
 
 	return 0;
 }
-- 
2.48.1


