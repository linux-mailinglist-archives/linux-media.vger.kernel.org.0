Return-Path: <linux-media+bounces-16385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A419548D0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D463287147
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC871BC066;
	Fri, 16 Aug 2024 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RxoY7XtA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA31AC425
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811530; cv=none; b=ElNh6wJURnS/QjTMPHs/jjJcfj6V2LkI90Iv3JnvsREVUxgLQ7GbZF2M8W5Ar8qc2uDSl1BMeWGr9w9h1xtEmKpHoGJ1mXXeppHaUkNGNxWXPVV1hTTC2+5XJHNGJBX1tUP5SibEk3lrOZomrFZHSnIRJCHtjK4KTmD59x84QBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811530; c=relaxed/simple;
	bh=EucDhSv61CuFfP11sjE8SXVP+6M/bqH4uWFxl+dPrlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCBH+rQFa89ZX+tuxWwsORDprs2hA9v0Jhbry8yQdo8nJ87uAg3CMs1khC8rbiMklFp+FhgSHo+eZLvdFUZ9mKAYovLwxiSTkO+1kgShWomrTxPy9G0qrmDjMpJ2oUyBI4vFYoL5TwMtfbFNxVMTqZfHBo6NIEuxSzn0D6kk/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RxoY7XtA; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf6beda038so11430406d6.2
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=RxoY7XtApnJKWlHkPGcL5/0zb29zp/BcEtSQnI1OwybBUIi3FPhv5NY31knAw6AMSg
         TUNyw9wd+iMR65blqSWmSxe4PC4d8tZjQaGHbgcXB3InmDAQoDNKA06GdEY0QqyAAKuK
         0iWJIG9tJPQjLmaHr6M96GWqX86ERko0wY8HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=mhxAMNxScMl/vKjWsENK/BMOApTfCY4txHwmzZ1P4oQFRDJWmFy6x03HYNPzrzUY4z
         loTdFU5oQ/AAhJeuETb//+cIaxNP+AW3q1SJnG/Hde+nosujH4gVJ1XEbS69B51Z8E+L
         KK7jC/BkZ/SdjamhW/EBEbUyy6/n8IBAw7vOaj+VHSUISe171Z8yTH1sM8m5vZQSvAv2
         9lH78Dcf3IjQtXrJcIsTETfludJkt6reZMcuK1iUtE7LuBSROfR/8eLJG2eF6EbIoy7r
         witLnLcQr0ntS0zMTtrKwaG463Owsc1f4trMhGp2iIdiFteSJLsoa48+3qaCu2G+voP8
         caSg==
X-Forwarded-Encrypted: i=1; AJvYcCULmJwjmE8ml7MZB9vIWMXb04lcZd3KnqTAieRTuksFYa5rV8bh1Au/7TFdrgUUDQMc+QmdmJGy9HVhBo4YtAuM02zR603nnD8hj2Y=
X-Gm-Message-State: AOJu0YzU4Ej8WJfZ2ZV+cqJVI4y0Z9sdMbqalAo9dJ36cHcqDiLemVFs
	unnpqaqGpwL5LaRLgdN0GtTVrM4hZDuM6ii/rVuYG2+enEfPPTQDal2WUMdzLw==
X-Google-Smtp-Source: AGHT+IHYD7aRmKGXgp+t/Ifehq3d65H0DR+M710hdZy/In2eSfy3ZYdXCjNDHAYDxXFnFLaObLyDlQ==
X-Received: by 2002:a05:6214:3d9c:b0:6bd:83cb:1b8f with SMTP id 6a1803df08f44-6bf7ce5a411mr36042536d6.36.1723811527255;
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:03 +0000
Subject: [PATCH v2 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-5-c63105db07e8@chromium.org>
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
2.46.0.184.g6999bdac58-goog


