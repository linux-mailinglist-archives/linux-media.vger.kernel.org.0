Return-Path: <linux-media+bounces-16197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4A9504AE
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2BB287BDD
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B728F19B5AC;
	Tue, 13 Aug 2024 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kaQqtdws"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3F19AD97
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551238; cv=none; b=hrhwX+rFCtdhWuUJ6nLkIoyzBzkTFW4lGHyCWEmhxvsdI8oc81hxoqZnKZhq4mN0420SGE7VtaPKaTCZL7yPmlO/4AqpYxDQNo3OZHWNt9gAcsK/sQbbqxuNH2XL6z+n3fuOyxrdUAUsAvW9Ly7lvZY2pYGakyb8Nlz6ydBwIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551238; c=relaxed/simple;
	bh=98X2t2WGiLxxCwmlaq0/ko8VmZHn8l1cDrLmrBX7bbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onRJVze87M9kTpNZdq7oMYAY9eAiWot+70LvD669WU0uVyRyl97wgUSGb7Tv2X6pa4+pz2Dkv6c7t6FxILY5tH2e22Sp0YFb04x//wCmk6k0LUes236YqKB9OlC38jqrHVgZ4ZUJALiIx2Hk5PrqOP2AGQ9rLVPgKgTddciMFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kaQqtdws; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a1d5f6c56fso310959285a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551235; x=1724156035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=kaQqtdws1n+9WYWkcqyYKwk96e+SvEU8nQkTp/2R5cZS+HQ/Vs6ezvlTmFuPLKiYVT
         hImULzf7ogwbUUvdGVDmev8VruMSo/L+bmQq6AHCc99i3L+54QFg39cBiOiuSkGgtEcT
         h0g846mjMKq9XPun+I/QbC73br7kVmFxMJdow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551235; x=1724156035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=H1WaowlOWZLK7RbiwqiR4Ezi3IwthFmfo/l2G5WXYNlKMgqzHQbDq/Q3JdrjpjuiVF
         uM7QLNRc8aVLhBHWAiIniHtXofkoHyVPaRCZ0fHCHHeUURb2zOLv/ocS1yER6cozpWKk
         N7h+qbPdnkqDYG5G4fND+43icyc2fdqCBOGnDkxGiR7N6SQLBOrlooGb5ju8dgcIffY4
         f8ckH5oC33P7fWI2H6HnTVQa08NhOxvSbaSO2BIc/xtYxFFSaQrLIszdG5QPCBggobhk
         6lkm/fdn8RYPD2zxh4CLFae2mfTZStaRVzqZar1DKF4WFP8wPv6zarxRCYepFhlfxr/+
         2DmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPReria7/Ok8sMHwbLHWhhiznQg9Estf1/1uk1jMHQ1bzBKQXqgGDWpywxpCWi0/0KQCKUizOZpk5BEEOc8Dj4gdiRfMdT2m1+6KM=
X-Gm-Message-State: AOJu0YxOFs2GF4ruEBOVwMvSy3joa/F03qRyZuD0Du6syX3m119uB6XS
	20pcKl/qXr6vGFT6vkSbNJVE+CPjy+/IcSmJTlgT8GgGIPVXgkYL4RL2JDg71g==
X-Google-Smtp-Source: AGHT+IEOX25WNCrWUaMxc3lkZuEvbZq3/dMLr0NrYO2cFstfRrmQqZhk/+W2xbcY25YibUai9xTEGw==
X-Received: by 2002:a05:620a:31a9:b0:7a1:6062:ed63 with SMTP id af79cd13be357-7a4e15a434dmr379872785a.29.1723551235139;
        Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:52 +0000
Subject: [PATCH 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-5-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __vdec_1_stop().

This allows vdec_1_start() to explicitly clean-out the clock during the
error-path.

The following smatch warning is fixed:
drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3fe2de0c9331..a65cb4959446 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -129,7 +129,7 @@ static u32 vdec_1_vififo_level(struct amvdec_session *sess)
 	return amvdec_read_dos(core, VLD_MEM_VIFIFO_LEVEL);
 }
 
-static int vdec_1_stop(struct amvdec_session *sess)
+static void __vdec_1_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -158,10 +158,17 @@ static int vdec_1_stop(struct amvdec_session *sess)
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
 
-	clk_disable_unprepare(core->vdec_1_clk);
-
 	if (sess->priv)
 		codec_ops->stop(sess);
+}
+
+static int vdec_1_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_1_stop(sess);
+
+	clk_disable_unprepare(core->vdec_1_clk);
 
 	return 0;
 }
@@ -235,7 +242,8 @@ static int vdec_1_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_1_stop(sess);
+	__vdec_1_stop(sess);
+	clk_disable_unprepare(core->vdec_1_clk);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


