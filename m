Return-Path: <linux-media+bounces-49408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329ECD8B67
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 11:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C773020397
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A86733DEF7;
	Tue, 23 Dec 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LTVbY7nL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA6C32C94F
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484186; cv=none; b=UWHs7Fq0WHDmNxSt6jO/ssBHjLUnMQZRgwIsLwBrzQ4tmQsPo+ghJP3PRdvA8eFJdFIM4yMx7IgqVkJb9c1h5RT+loR9e+WoyeLSiHA/AyUjgjKISgqFz9PmLfWSssHkGE5Y5XXDi/Ecm5vhyItyjd1z9Thl6t3avBd6blBVrLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484186; c=relaxed/simple;
	bh=wVdqZWqwmPY1Cu2m3fV7/xu1uBeJqysomH0AL/l4wI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HULy5PqEuT2jt3bLl8V2HT7itEJ8/f9TKw3yxzjVEq+ebITzZuu86kbUkw4L+9DDyMNAYzaS5iyPnT0yY9i9aZto2GxAxWFDm5wnC0+81QXxq60LZBS7NNt95IvqdqxteQ4puHPw/mACLVeI7dJqcpOdrs4fsW2i6uE4dMFivVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LTVbY7nL; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-595819064cdso7795999e87.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484181; x=1767088981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUcTnxYD+aiXPNA8mUA20oia8cBhXKH7lsGlpr1Fxss=;
        b=LTVbY7nLdLjASQHiBxb2lcnveY/cMG+ZrPI0NXxzykyRdI4U6+H4wdGyCU2WXvxxHJ
         EajGayFccuGL7/kTyLQsCSYx0UAZdTw54itU7WpDDlYVLJQlXIg6mTtg1Z9EjjU1VhFE
         ND8ZQ0on7mya8/1LFe/mxZdjwj2CoHCBvNisI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484181; x=1767088981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUcTnxYD+aiXPNA8mUA20oia8cBhXKH7lsGlpr1Fxss=;
        b=iqf1Z/27kdMKMMu2sfOhl977FBC9/g6hE+XxWxY+YtJYuWht/PoFRcPY/bSAPiaESS
         FdOUyF5/aQ2Zx183ezjgynn/Hi0GGkStGXWJ+jBmJLAYpUxMA3ZWF5Splp8fhB0EmYC5
         yUpSedgTJvo0UY4BKKiM8vDNbc9YiERZJiQK+tixaggQtypzF4US31CQCfxsEdNGfNQg
         eXEGMb935wZwjR8ohYfw9nIU/8XG471QF9U3y/wIpcOMEYeEHSsQ7oEpFP91/5vYw/wj
         pEh0naKkMesTiYV7E+55nV1WuHzm61Qe916M3n+OTZtnH5wHZpPWJ96zwGrsT7GXydp4
         UylA==
X-Forwarded-Encrypted: i=1; AJvYcCXshRhOBvKqmxOYsJDRnYL/khpfEcC20/9BkGyMglUmd5OlVEECk3lQRanWgbOSOrrRI526oQo0xAfC5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsrgH+eRow5JYsglel0gaMXxsTQUqOUb+FIF/t0nCFh1RsZzz
	wn2WDwCy4egrdzAnz94+Vpl+TyZTk/KRvn7wi3A2LJAzsFkmc6I2ZBZydOXWdUqgOw==
X-Gm-Gg: AY/fxX5Sgl014DFTUwK288LAMGwKHzSq/tf4Y5/cDkgPdOLl0lyHnzHkoPZVWphrnhI
	67h2po3zxsrz33lpyAGbeXMMjORhKotEzzOugaQjPyYT5l5JPmsQWMY6h9L+0NiLeA6LEQi5l5x
	hUeU708wHKTkRjqEYs2PMGg+xmdYbln6mXL53ayuQ6tg0mamBo9wzF3iuSDSLeLv9Y7wiRTX78Y
	dIJLLKnhedAazfVFS+yikhr5UyS2h+Bl/0+W5q4/pdwIGo69ths1i47OedRekiJAYH/MwvvGWpB
	UULUKGDmoKl8KjbGXbDrEtgxqTq9tjHF62kmM311SeRBwryLUEjIj8i03OvPgWIBvA5wx4ddYqT
	+tUGoB99Jksk1989HddN+fFj0dGQZ7DcvX3z1CLY5HBBvC+hQMRGzwV8jI5Dq7uTk3Lhb58XMpM
	SuMsbv9/punueQTGwKLkSJNdsOUIYxg8UWZoJQCDDQiX58uvxm9lFBLa/FgflFjmcK6sRuYhqqF
	bL8NjM0
X-Google-Smtp-Source: AGHT+IHUtiYy/b1w7aGEwapBzSYDcplHqB3pOohRpr+U+rLexxqRV9AwzsCeEnjx4WC+rrCtt6Cywg==
X-Received: by 2002:a05:6512:2310:b0:595:90ce:df8e with SMTP id 2adb3069b0e04-59a17d042f2mr3900726e87.5.1766484180563;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:02:57 +0000
Subject: [PATCH v3 1/2] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-warnings-6-19-v3-1-e8f56cb204ec@chromium.org>
References: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
In-Reply-To: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

As we get ready for kzalloc checking for invalid sizes, let's add
documentation for the cases where the size is different but valid.

This patch fixes this cocci warning:
./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f9129553209922fda548ca320494ae6ae797854c..c120ea3594fb5d0f40d6b9a7c67ffc28c42109f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1212,5 +1212,10 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+	return &out->inst;
 }

-- 
2.52.0.358.g0dd7633a29-goog


