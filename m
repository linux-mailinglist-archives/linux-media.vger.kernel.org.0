Return-Path: <linux-media+bounces-9124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0578A20C6
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368F8286A97
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3986441C6D;
	Thu, 11 Apr 2024 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ntrkH0K0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB13F9F9
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870280; cv=none; b=YfJntdTeO73XZ+wtJLEh8L3SoSoVNfjXlJsGQgJxsJXQzJdwhqfUJ21Fa4nJLN0wEAHyS151/qsTMBjfn+U107v/QDoCgRX8B6c2HUIZkZKYoDv3Vyu4A8Bb5q/UGkKnP/aQOFvZVHnS0rk9QlzLuHIgNC/cnOLIB7oDWc9HpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870280; c=relaxed/simple;
	bh=dp4RMhErGFhr4bpB4GWRG+LeS25vv/r3I5ywr16IJEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9I2ayxoPzDDxjdjdejGzKDXavver+f/Xgi2lDww39gVhMdKdy1phWPlz3JINTxD15ZbWTSSJJsu4nDQIJAZrwHwgWX1FvuHHil71R0RYDnjg8K3lzGws9enGPY4ZEWDN0DY99Se8USWdU+wMzsbP7yrFWSQvm0cLDDHPDDhV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ntrkH0K0; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa12c21ff4so183009eaf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870278; x=1713475078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uKL1mHSZL4YF4kY3BJqD6MsU90syv43Ru49OzukfDM=;
        b=ntrkH0K086JJwfBHvGT5bb5VuGHKzxCZeV+zfZjg9H/AZdpOIBuvUBnFqqiE4Gzdu7
         /TfWC86WGODUY5y7LbE5XimrOgNAg9qwRaxzK0yDKN8yikvlUcZVfXOY+I2MDtbohfKx
         sKuEWleuiHBybEx64rdHSYKamoQK0IgBIAqYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870278; x=1713475078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uKL1mHSZL4YF4kY3BJqD6MsU90syv43Ru49OzukfDM=;
        b=CCirKVXavD/NsW1qLPe1vJDKiZsZuoUvoBcobxUmu6lqskiuc4yCg3CYYOGtAkL/rP
         tXLzM8S952czr0a122aDCQAhNQwh4/AjIqopa8fCwN6kmHS6hpGEA29d7kwXKJXL4jQU
         K0zxVDhUjgZYrGLhQe2C6mVkF1kFPmiI+NLbEBPEy5Pn9jmoctywTLx9eFfBmLEEMb6C
         BMvwJuMKmL7ptMXCDG+O+wYslpkrsdSxhR0hZn/nDidSCqhxq8SBrUkbNqFKEb9S9t6Q
         eLTkP04AcMS56O5WsxPPzdqJsgZ3wyufVNhYi2l67cYAochmBInMqlu+MnWh1/hwiLjB
         JRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ43psn+Bvd4EKa9lj0pzYwSUjUUH277P2jZPXJVexjTG+JYwFfDh9ZI71Yla2WIWd3NK2fZOaCB9v4VK0DqChP6ilsDDyhd9O6Rk=
X-Gm-Message-State: AOJu0Yztq+3Le189yqHVwUV44RLSfFrL/a0eb2uDYP+4TwR+ZXVK3uCu
	lwMrWzXi8Fgy3aOOP6GnZmHqmnb/V1uiF1StCa3vnyhGu/nsn8gsKa0zkzbW1Q==
X-Google-Smtp-Source: AGHT+IGhlN9obDs811TzuFeTw+yQpMZFy0dDvN3jgb99c2lssw4pJXubU4SOxjWfkOF/RoOypkxSZg==
X-Received: by 2002:a05:6358:9807:b0:186:12cb:d1a8 with SMTP id y7-20020a056358980700b0018612cbd1a8mr629894rwa.25.1712870278344;
        Thu, 11 Apr 2024 14:17:58 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:17:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:54 +0000
Subject: [PATCH 5/7] media: tunner: xc5000: Refactor firmware load
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-5-045f92467937@chromium.org>
References: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
In-Reply-To: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Anton Sviridenko <anton@corp.bluecherry.net>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.12.4

Make sure the firmware is released when we leave
xc_load_fw_and_init_tuner()

This change makes smatch happy:
drivers/media/tuners/xc5000.c:1213 xc_load_fw_and_init_tuner() warn: 'fw' from request_firmware() not released on lines: 1213.

Cc: Shuah Khan <shuah.kh@samsung.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/tuners/xc5000.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index 2182e5b7b6064..30aa4ee958bde 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -58,7 +58,7 @@ struct xc5000_priv {
 	struct dvb_frontend *fe;
 	struct delayed_work timer_sleep;
 
-	const struct firmware   *firmware;
+	bool inited;
 };
 
 /* Misc Defines */
@@ -1110,23 +1110,19 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe, int force)
 	if (!force && xc5000_is_firmware_loaded(fe) == 0)
 		return 0;
 
-	if (!priv->firmware) {
-		ret = request_firmware(&fw, desired_fw->name,
-					priv->i2c_props.adap->dev.parent);
-		if (ret) {
-			pr_err("xc5000: Upload failed. rc %d\n", ret);
-			return ret;
-		}
-		dprintk(1, "firmware read %zu bytes.\n", fw->size);
+	ret = request_firmware(&fw, desired_fw->name,
+			       priv->i2c_props.adap->dev.parent);
+	if (ret) {
+		pr_err("xc5000: Upload failed. rc %d\n", ret);
+		return ret;
+	}
+	dprintk(1, "firmware read %zu bytes.\n", fw->size);
 
-		if (fw->size != desired_fw->size) {
-			pr_err("xc5000: Firmware file with incorrect size\n");
-			release_firmware(fw);
-			return -EINVAL;
-		}
-		priv->firmware = fw;
-	} else
-		fw = priv->firmware;
+	if (fw->size != desired_fw->size) {
+		pr_err("xc5000: Firmware file with incorrect size\n");
+		release_firmware(fw);
+		return -EINVAL;
+	}
 
 	/* Try up to 5 times to load firmware */
 	for (i = 0; i < 5; i++) {
@@ -1204,6 +1200,7 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe, int force)
 	}
 
 err:
+	release_firmware(fw);
 	if (!ret)
 		printk(KERN_INFO "xc5000: Firmware %s loaded and running.\n",
 		       desired_fw->name);
@@ -1274,7 +1271,7 @@ static int xc5000_resume(struct dvb_frontend *fe)
 
 	/* suspended before firmware is loaded.
 	   Avoid firmware load in resume path. */
-	if (!priv->firmware)
+	if (!priv->inited)
 		return 0;
 
 	return xc5000_set_params(fe);
@@ -1293,6 +1290,8 @@ static int xc5000_init(struct dvb_frontend *fe)
 	if (debug)
 		xc_debug_dump(priv);
 
+	priv->inited = true;
+
 	return 0;
 }
 
@@ -1306,10 +1305,6 @@ static void xc5000_release(struct dvb_frontend *fe)
 
 	if (priv) {
 		cancel_delayed_work(&priv->timer_sleep);
-		if (priv->firmware) {
-			release_firmware(priv->firmware);
-			priv->firmware = NULL;
-		}
 		hybrid_tuner_release_state(priv);
 	}
 

-- 
2.44.0.683.g7961c838ac-goog


