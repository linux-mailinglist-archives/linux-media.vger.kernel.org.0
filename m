Return-Path: <linux-media+bounces-16384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF29548CF
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935A71F24B2C
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FE01BBBD3;
	Fri, 16 Aug 2024 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jzXEh/oC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD81B86EB
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811529; cv=none; b=tODhFjT6CFHeEZ5pPVkclu2jX0psC7okxvSsTGTMR6gQ72PM+9OD6CUDZxCEDV0Ku1g/nqIN+ZutdMT4oIWVgYbb0aLubGB1gMo2cmK3AH72sQwjTSzpBgYbWOrNrjbob3f89am2w0hoGxQ+yBl3uKRclaQAyQFlmNQQ7dePuH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811529; c=relaxed/simple;
	bh=/us7e90fGibDZ7iRi3+d7f5fxC4Ub6dpRW24VMBvk0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSFx+9tb+4JBJHP1SfgwBCDTjrIUEXErejOpuLbEqhTkw/Nb3ccXROcuTFcwaUqUUkqrAIAm/lXkRJX4Sb/Txk/RL5IhESEzL2pXP2IRX1z/LppOGefU66Pz1F577SJPzGCnu42ErrU0YAFdwEN7Y26ivPgmWWLNs8oFN1uF28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jzXEh/oC; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bd777e6623so10256846d6.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=jzXEh/oCCzUXUp2+i/7PzG2iVdVqJP0FXXpnjDK3t3X5gVpccDMF+Gi6ODZHuvtVKj
         6i0vXiFBxeWoOK7jtCEJQmjLxkR4MXWTqNHMbL656EidFKXKIpJxHDirDXtD9wyJzdj0
         iiFMKoYRR31+f44X27hbzdx21b0SZintQjW/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=hRY9UOzOdP2ub1YERLuDMbMWTr1N6pGK6YzShxmyztGuWscDSTd5F3K2X5F+u/IbYM
         MBKbqfrU0j8HbNl51wM/P9DK+JWPAdJZ1jjvVe9DuGD0/fOVXgBKtfZd2LCeFKvvmmJi
         +PeDpMaIhfLwmQhhsmuboX8c5pyh7MtbYoNQMaH34M7urrH5nH6lTBX1jDfANluzuAqy
         a6ETDGJ/FLsoa2c27htT2+VIx7xg18dxBZ4JdXJ5cBSFPE5nZyyop2twEqBYoluCtax/
         0vwwzth1MCrE+iQ0tHVOQm3xGIapOzOiU4zqtB7MfhPz3+JaTGkL4uvYNdTS/2bNZRCd
         l/hw==
X-Forwarded-Encrypted: i=1; AJvYcCVb8zg/K5Zx06IeUyCcT48fQqRAWOtsxMSFR+kROILPprMoN/ieWOrwbRC9j/9FjoPtlsqsRDXr1n/glz3f6qGa0BgNU0gcspO0mp4=
X-Gm-Message-State: AOJu0YzD8PtvHdsQ1umK/rB70AhzC9n6aSdzGy3lVi0lMWmQIGw8ug5/
	Pp1M3nOMsLGvSf5g9OTxiy/45hbw5Ev1/JPEo+cydp62IXVyaPvBeMFsP/z7ew==
X-Google-Smtp-Source: AGHT+IEXSYQZCNIKPB9LFR6rX4AtZ6JNPVrFndATYre1U0wDC52xZRkYWs1UJ+Wy8jMyb2SytEJSUQ==
X-Received: by 2002:a05:6214:a67:b0:6bf:7f5b:1d3 with SMTP id 6a1803df08f44-6bf7f5b0255mr17407566d6.16.1723811526538;
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:02 +0000
Subject: [PATCH v2 4/6] media: tc358746: Move clk_prepare to its own
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-4-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Smatch is very confused by a clk_prepare_enable() being called in an
error-path. Fix this warning by moving the clk_prepare_enable() to its
own function.

drivers/media/i2c/tc358746.c:1631 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1631.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index edf79107adc5..389582420ba7 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1616,6 +1616,16 @@ static void tc358746_remove(struct i2c_client *client)
 	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge it into tc358746_suspend until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void tc358746_clk_enable(struct tc358746 *tc358746)
+{
+	clk_prepare_enable(tc358746->refclk);
+}
+
 static int tc358746_suspend(struct device *dev)
 {
 	struct tc358746 *tc358746 = dev_get_drvdata(dev);
@@ -1626,7 +1636,7 @@ static int tc358746_suspend(struct device *dev)
 	err = regulator_bulk_disable(ARRAY_SIZE(tc358746_supplies),
 				     tc358746->supplies);
 	if (err)
-		clk_prepare_enable(tc358746->refclk);
+		tc358746_clk_enable(tc358746);
 
 	return err;
 }

-- 
2.46.0.184.g6999bdac58-goog


