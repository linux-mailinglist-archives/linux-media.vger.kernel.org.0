Return-Path: <linux-media+bounces-2127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5A80D487
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C59282022
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CF64F5F6;
	Mon, 11 Dec 2023 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikL22BnH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6700FC7;
	Mon, 11 Dec 2023 09:50:56 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso63332731fa.2;
        Mon, 11 Dec 2023 09:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702317054; x=1702921854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSLorSrmwJkpM8Qw+vtX+TJSDohLzn/aN7e/ge7Qmsg=;
        b=ikL22BnHK4Vla7jiqEVbE/smiIIHLZ3A/hqmCsK+cJyfFWOhctUEqM/wjeYybnoYHP
         dNuCmlnNdd6bD194+Fga/ywjzgWc7qYQP3AHQvDA9Ik2NrbtHllzfQwUTcpw/GvRZxTv
         vK5IqUS6wAbM4VAdgg9znPclUkE1RalM5z8Yecu/Opy/wGgtcwUaDrxGLlHcWOUPg2OH
         kfON1bTySuaJ1DaznrzpTWOiOJXW9jhG3xmvKlM5LSUVUpFfC1hrMVILpZuRiYVDwjQS
         HN9PT2m7FcEi4WwodP2UM5gfZcEOz9A/uD2Dv79vg3/UVD5M1IsiEG23HYlcvaWuWneK
         pKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702317054; x=1702921854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSLorSrmwJkpM8Qw+vtX+TJSDohLzn/aN7e/ge7Qmsg=;
        b=jSF/WLgy47mp5bQPtQu44LhO+ElRgfTvZ2zlQ2Dy1JJa8XnSPu81JKufBx9903ro56
         q7dFYHYE2bodKl2FBK2Im0qPeDFfTaoMuEf9a63bWhSOePkT9icH0XUcknrlJeE3SwE1
         ZJ4e9Ul/2nbC5gGrB6ZiYwj12DUxVvTXKzEMvbB2vudG1q0yHyfYReUnFkQqQFOgSqpW
         JjnlEkAhbrZjxGnIJ46Eqtff/4nmAwp2SUEp/vvTatfvNJH/RjTdQEbD0eznbE1ZUOYA
         SGA6Ijo7w5AW1d2HqjQsbrdfq4tEPrVQZZlohrIz4NUryGJlvocCqTZA/koHmUV7FhCO
         sz5g==
X-Gm-Message-State: AOJu0Yw8ejmhunmZ4c3lUvHSxB0skgTFpXN5soE0Sns82JX6O5XBh68V
	hrVAavrdsdSDntEOWJs3lSLm0Tgl6tcF7sT7
X-Google-Smtp-Source: AGHT+IEjRjqFvVPuCtszQaaZCq9Xh/DE8LO9Gs+FtbYntjTfD6EC2/nB0YQlQEmyQKcszpY80GRmVw==
X-Received: by 2002:a2e:a545:0:b0:2cc:202f:6266 with SMTP id e5-20020a2ea545000000b002cc202f6266mr917704ljn.96.1702317053973;
        Mon, 11 Dec 2023 09:50:53 -0800 (PST)
Received: from localhost ([83.149.246.185])
        by smtp.gmail.com with ESMTPSA id 13-20020a2e154d000000b002ca03d01360sm1360796ljv.23.2023.12.11.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:50:53 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 09/19] media: i2c: ov4689: Remove max_fps field from struct ov4689_mode
Date: Mon, 11 Dec 2023 20:50:12 +0300
Message-ID: <20231211175023.1680247-10-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211175023.1680247-1-mike.rudenko@gmail.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max_fps field of struct ov4689_mode is unused in this driver, so
remove it.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/ov4689.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index ba33b0ced532..9fa06941a0e5 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -60,7 +60,6 @@ struct ov4689_mode {
 	enum ov4689_mode_id id;
 	u32 width;
 	u32 height;
-	u32 max_fps;
 	u32 hts_def;
 	u32 vts_def;
 	u32 exp_def;
@@ -237,7 +236,6 @@ static const struct ov4689_mode supported_modes[] = {
 		.sensor_height = 1536,
 		.crop_top = 8,
 		.crop_left = 16,
-		.max_fps = 30,
 		.exp_def = 1536,
 		.hts_def = 4 * 2574,
 		.vts_def = 1554,
-- 
2.43.0


