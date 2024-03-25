Return-Path: <linux-media+bounces-7767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3888A9B1
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8AE341C2A
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E069F152187;
	Mon, 25 Mar 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f90HVDVW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE891422CD
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378229; cv=none; b=czfoVVg1i2HYSoiSt5VJzeTPRzIQje38FyO1lqQDykhIZ3BVPdL8ZDwBzfdDYNzAaKLNK641PMIR7KdCoPGRHpLQGkNsOc/scp4E+Tj3qkaz6t15Ofl+sCgeeuJLAx/tUVnmDlgqBV82Ovg/i7nOPk6b29J/pXJLQvKMrrfd/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378229; c=relaxed/simple;
	bh=2dAG+Jyz81+oh8AF6DeyE+UyRu22SiDEL635nHH+73Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNO7sqdoWjpyCE3CnY3aW83X4yR3mjq6GWCdBiraoIIWldBJbyRQTiP8cn+RMrInWoplMmCP7sBc+rzexxy0V27RpzD+5rv/w/URSTQQYoVVvwvhSPSrsycIxe7XOxHndQufukQRDTwHc+spFyJd9uAmW7jMUYnVLgfmts952Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f90HVDVW; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-430bf84977dso31959261cf.1
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378226; x=1711983026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=f90HVDVWIxhJ7GoJusxCrJ9iTy5AMaJgTUni/n8c/Ks0jIMz1mBBGdoUBs/ohlsoDa
         c+MOFkqHdK9DW+6OA4giAJZpyDSuNwBYd3cNvhoxLloVVwK/KLqIvFL0eZAxyPc2gKt0
         GKCwxL4Nev4UPsS/0phJ5oUeHL7adk+sahEfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378226; x=1711983026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=KDl39WQWO9CeDVVepvOspzqhX7BxnYApT4iXK8ndBfGOlHrH8O1Y3tuk5MX6qtYRDG
         TdNyrH/0muKO9aOcFkR558tMtz1Mhn2nPyfcUXJVnC9gs47bYCC0fuiHe6wGRxZH2/oU
         HtHXJ4bDWpbImCVKP96HLQwLjfn5vPtrl+CWJvs1TxllzMxY/VkLFab0rA/UsqW1lCX1
         aRXgzKBIs0pr48bPth6r2JV24Fj2R7XMF6Epv+GnGsurseyECo8nL0xgbckN8xS/CjcK
         LnjH+d44EU8dthOnDkNHL0dmStWxyCVS2OQDlpti4Daggy3DMu18yA/Rcp1kNaeZCXoz
         93wg==
X-Gm-Message-State: AOJu0YzM6Qu3hUda6Umg+TKhEY0XEag55x2HydzDC+kI7xnL9NpEiBoG
	Heb2V81sEfMkWB3F1QR9laAsLdbOqBZo0jonvJjP8KnS6d7FZ7zZFLI+k8PGfMYzjjdsjD/bHeP
	FbQ==
X-Google-Smtp-Source: AGHT+IEqb/RgrM1Zmsk/Hg4wuXRP1MFf283Gr9y7uqBgTIorav1xkqxxl139xGt4TwsfJtE9o1cPMg==
X-Received: by 2002:ac8:5d10:0:b0:431:38a4:ef47 with SMTP id f16-20020ac85d10000000b0043138a4ef47mr9187432qtx.48.1711378226517;
        Mon, 25 Mar 2024 07:50:26 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:50:24 +0000
Subject: [PATCH v3 2/3] media: radio-shark2: Avoid led_names truncations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v3-2-81b8c10dc18a@chromium.org>
References: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Increase the size of led_names so it can fit any valid v4l2 device name.

Fixes:
drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/radio-shark2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-shark2.c b/drivers/media/radio/radio-shark2.c
index f1c5c0a6a335c..e3e6aa87fe081 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -62,7 +62,7 @@ struct shark_device {
 #ifdef SHARK_USE_LEDS
 	struct work_struct led_work;
 	struct led_classdev leds[NO_LEDS];
-	char led_names[NO_LEDS][32];
+	char led_names[NO_LEDS][64];
 	atomic_t brightness[NO_LEDS];
 	unsigned long brightness_new;
 #endif

-- 
2.44.0.396.g6e790dbe36-goog


