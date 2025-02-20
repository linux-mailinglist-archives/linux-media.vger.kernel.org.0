Return-Path: <linux-media+bounces-26468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853FBA3DC1C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047DC19C13EF
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63461FBC84;
	Thu, 20 Feb 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVjmBTqX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5E1F1312;
	Thu, 20 Feb 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060404; cv=none; b=BkhKEGCF3lHW31DR46U3IZd650KP3qWUPTnQVLJThyfwRiriZZ1WgkAP5Q0AXMZ5jrflIyVoZ0tdQHHuyCqRLLYPKFh1XOiDgOPjoVHriM+564/MXGlaLDJDpjX42yFgcZdgzgL+q4m1bsENMqW5+bNLI+IciKiaVeiBN9OKjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060404; c=relaxed/simple;
	bh=Qh0CSO0P7f3dfwyP8ZX25Z4RxopX1i3rqk3kFVF405Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7FCZeFUqQUts6Otd7VZWrHr7ejc+7d6enYXQtxQSJLsnFT6dIue/RBTdvmfZEY4Mw5HA64rMgNOKEBWKygD2Hs0JtqDdAv8QjygrY4wNG5f6qwlme5AM2YhYf+1Uiec9bBvdp5Wdfko880As3lPzKrksHIGHQoZGrQ836u4/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVjmBTqX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso165642366b.2;
        Thu, 20 Feb 2025 06:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740060401; x=1740665201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqogniICWWslcB/lR7Kybwmnp4T1PxyorgaJfOCjRGw=;
        b=GVjmBTqXiAeCrjNGNXg+K0Ud6Ixcr7cvZw0op1gB/L8VdJq+CsNnbtl4f92sJz+jwJ
         HAMeMg+5h70UxMJmOL1SNId0d46R1brBag1ofuCcE9T/6AJgd7GaZLwJqTWoFukQgctx
         WvDP5j+wi4YMHzwTQWmVM9rdfsP/ZSViIxv3eLa1wSzPiPy5ZeF168CLYY1Sa5+ijiQJ
         WuqnWBk+ppNCOh7d15iLDDy1ocr/S6PXvlS+WGjir8T42hemHEvDE7X/52p/WEzLow6C
         pk+Nxk2GgiT7A937Q1D27GeUO8nzNzEPT9SQ/9R43Ygvd4I1ZH8SKgRej5e5MIVc+Yv8
         bgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740060401; x=1740665201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqogniICWWslcB/lR7Kybwmnp4T1PxyorgaJfOCjRGw=;
        b=uklYJKzJQ6KlyjN2lAF438hvILjRzt5DmS8KBLAh4JPbl7aVPK4MuwIiWDmnFJaqwr
         Ejw3GYZNpt2deg7e69jaW3r3F+JefxUYmqkzjOa+u/l1n6Oy6+H7SS0cUnb2fp8mXL+7
         VEMn3tTMt/c+iw00nsQtJgEEdkpxxzoAtv4TuDO+0ZXbMwNYQ2/cAguRaC1aDF/QTHwl
         mFTSqIxjCC8RGvaEgujyg/FLihWwN7ASUPM/M94XQsLB4qGpsmySMNQsgLDdUfzPfoib
         6LWe2pXBL0N1l0r23e4pg96qER8WNvQwHatKBXMF+mlErNGUuHEgWS4Qxn1g6EZRv0U0
         L0pw==
X-Forwarded-Encrypted: i=1; AJvYcCU1u8fEh3Af8nZsQ0FYd4Kg55Z1oJQH2mY652vc37Dk4PaJ3iCSALFn0LPixwdSwYJJIsOp1sa4CKHGF7g=@vger.kernel.org, AJvYcCUjgjfaXtjAxdBI5aX4VHrztx/cU7HMsk7E7aSGrsZI2uBRXQohFJIK5FcOrDZyQkgTJ8iolYy/vrHDiFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzncd7FGZ7521o9D8bVPJXTU9/egxUDT8mbsNRp6sICEqKLhcsk
	1X/mTqFskfX2goRAkspbztdoe79GJTfLkCtx1rZfj36xvxL7FWKQ
X-Gm-Gg: ASbGncvQ/+E37Mul4M7Gsu2nmwG0sne0biKN08BMAGInWKIfVZKfR12xzMZOJ8Fs8Ce
	ImK36gQKsaL7MYxcM47IWFp744eBkyokkndkvY7xlirwzVU1fR40/u/EUeC5LAPgNhLOUb569pN
	RVY/+LaPeOI+s8uALrFgoj3lMDZ6pvhpYZnsyt9DWMdy5V8LHHuMVUoC/QmPfIypZc0+qfofI8y
	HVUL8Pon+5IeKouDn1FmFqJ5leO3nBa6mP4vjhkXgb6pppiNBAYA7/Rjf2G8Omlrg9AN2uHNDdv
	bYmGGtmCpyszUAVqQ7x9/qIKrmhb
X-Google-Smtp-Source: AGHT+IEes6EGQbeHDM25MJmZZZ1Rri2Qy7vA8nC8vM+sXYJeYgrNYx11MzK1Oz7LzcTP0xUaoruNmQ==
X-Received: by 2002:a17:906:309a:b0:ab7:fbb2:b47c with SMTP id a640c23a62f3a-abbf3cb91dcmr242679666b.35.1740060400381;
        Thu, 20 Feb 2025 06:06:40 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb97dea08fsm827770266b.53.2025.02.20.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:06:39 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: i2c: imx219: remove context around case
Date: Thu, 20 Feb 2025 16:06:35 +0200
Message-ID: <20250220140636.146506-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no longer variable declarations here, the context is useless.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d755114..fcd98ee54768e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -947,10 +947,9 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP: {
+	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(state, 0);
 		return 0;
-	}
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r.top = 0;
-- 
2.48.1


