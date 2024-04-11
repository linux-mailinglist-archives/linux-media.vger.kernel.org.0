Return-Path: <linux-media+bounces-9125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3758A20C8
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64738B24236
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1B1446AC;
	Thu, 11 Apr 2024 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OR3RTLBD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04DF4174C
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870282; cv=none; b=ScUlmZ0XXv+Vr0SCXLwRArUFGupZ31QYJvuH+FzbzatJc5fzA3Q2cu3sAneM/ga3oXqzjRCLMhcqRJLZQR9x/VBDZfOHnXzAoT7j19FQGN8Kvy5IT7l6Q2TLd7sLAm5UXwXner8Qvk4LqSkVpuy4UuFxPJLxihh6UlrDPOTsEKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870282; c=relaxed/simple;
	bh=Ogh+hSh4Or5uPuB9tfRQOhwkH7pUIRHWmEF19NCyWzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0cqE7wN9h8ID7WZgW10RoW9HrKAiNPgKh8HUJJAJSL3Q8TB1z3QEH2hd1mDge31lm6H2ehL0aDfnQO9jSGaQp6Wmqp5HtLwYecPQ+ctUgC0p4raDzkjIW6pGqyUxPgtwP5UciXbXqqHbvILBTgaAkBs3NU89qu97Y+3wri5eB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OR3RTLBD; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5aa25e99414so191574eaf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870280; x=1713475080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5nSR1yFGYwMcL96r69NW1l3sh3LFO29KJ2x2ErdnHk=;
        b=OR3RTLBD8M6HjvxKqQsArPSGRNkTaTccLQxASsqwwgk10DQFBL1f00ZYJq6qZEPWRn
         +/9KPeOmghux+xSZjoJZtiJWkd3UnceAQSRastwyRf+TRN9KLg7JtzpoiqG6jDn8cnVO
         929Kd8wu+awJ27msuRO8KN1r/IR82+UXECqR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870280; x=1713475080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5nSR1yFGYwMcL96r69NW1l3sh3LFO29KJ2x2ErdnHk=;
        b=RrGWfk46xDT728Uuj2ccI/ECm0Of/Ne5Vy+QJ+5BKP4MtMmG/QrigwmVfbjvwzoXqr
         6bFDeOv3uipfBq5TZn9Tc7FGYyb55JwK+TJDJufVjxnF7boOAPEvtshRogdu8QTFArSe
         vtUg5ouZZ0NPaVia9CJm9yUfddN/OZoBNMUFVWJxx7g0OIYXsCpJiZhT0gTVEttEfNAG
         1Zg8rVJtjfYEWUJ3VcwSYnyD501ovX3frG9o4PEtkdIOEOhEhsFtGpNs9EO/FoBz3mw1
         c7hF20UFsy+F1dnoL3DF8oZzt9FXuRBkb9SBqxuq5DSb3i13gardLirvDsVBxYyVnYrg
         PSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCtgwaUP1qvUpQEYnVbj9bv7pqCYS85QlMKAWod8r31qgpOMzLFOk3XwIB/qFNVNUD4RqqdiKGbQN9A+8FC9vhRiADNy0aeG1XH7M=
X-Gm-Message-State: AOJu0Yy7ql333U2kxBZFJGu5Fn6GetMASINoYsbcJ+TJHkJzrm/fYRYD
	HJ7hZXawxuVYqpA5SN/9kCS2kF1ESvMvVnpXErQ/Omten78+NAIpI3d36MS5zQ==
X-Google-Smtp-Source: AGHT+IEh0blwfOKKlbWUs8oomzyYZwweaLJ6NFxR3Gr9CI9V/VL83VlcnszoDVWX3MZ+lZ28+ZL6Tg==
X-Received: by 2002:a05:6358:4b45:b0:186:f3f:3252 with SMTP id ks5-20020a0563584b4500b001860f3f3252mr667180rwc.14.1712870279979;
        Thu, 11 Apr 2024 14:17:59 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:17:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:55 +0000
Subject: [PATCH 6/7] media: dvb-frontends: drx39xyj: Refactor firmware
 upload
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-6-045f92467937@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Do not cache the file, instead load it on demand.

This makes smatch a happy parser:
drivers/media/dvb-frontends/drx39xyj/drxj.c:11908 drx_ctrl_u_code() warn: 'fw' from request_firmware() not released on lines: 11877,11886,11896.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/drx39xyj/drx_driver.h |  2 -
 drivers/media/dvb-frontends/drx39xyj/drxj.c       | 49 +++++++++++------------
 2 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drx_driver.h b/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
index 15f7e58c5a308..2c2fd4bf79ccf 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
+++ b/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
@@ -33,7 +33,6 @@
 
 #include <linux/kernel.h>
 #include <linux/errno.h>
-#include <linux/firmware.h>
 #include <linux/i2c.h>
 
 /*
@@ -1910,7 +1909,6 @@ struct drx_demod_instance {
 	/* generic demodulator data */
 
 	struct i2c_adapter	*i2c;
-	const struct firmware	*firmware;
 };
 
 /*-------------------------------------------------------------------------
diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 19d8de400a687..1ef53754bc037 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -56,6 +56,7 @@ INCLUDE FILES
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__
 
 #include <linux/module.h>
+#include <linux/firmware.h>
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/slab.h>
@@ -11750,6 +11751,7 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 	u8 *mc_data = NULL;
 	unsigned size;
 	char *mc_file;
+	const struct firmware *fw;
 
 	/* Check arguments */
 	if (!mc_info || !mc_info->mc_file)
@@ -11757,28 +11759,22 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 
 	mc_file = mc_info->mc_file;
 
-	if (!demod->firmware) {
-		const struct firmware *fw = NULL;
-
-		rc = request_firmware(&fw, mc_file, demod->i2c->dev.parent);
-		if (rc < 0) {
-			pr_err("Couldn't read firmware %s\n", mc_file);
-			return rc;
-		}
-		demod->firmware = fw;
-
-		if (demod->firmware->size < 2 * sizeof(u16)) {
-			rc = -EINVAL;
-			pr_err("Firmware is too short!\n");
-			goto release;
-		}
+	rc = request_firmware(&fw, mc_file, demod->i2c->dev.parent);
+	if (rc < 0) {
+		pr_err("Couldn't read firmware %s\n", mc_file);
+		return rc;
+	}
 
-		pr_info("Firmware %s, size %zu\n",
-			mc_file, demod->firmware->size);
+	if (fw->size < 2 * sizeof(u16)) {
+		rc = -EINVAL;
+		pr_err("Firmware is too short!\n");
+		goto release;
 	}
 
-	mc_data_init = demod->firmware->data;
-	size = demod->firmware->size;
+	pr_info("Firmware %s, size %zu\n", mc_file, fw->size);
+
+	mc_data_init = fw->data;
+	size = fw->size;
 
 	mc_data = (void *)mc_data_init;
 	/* Check data */
@@ -11874,7 +11870,8 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 						    0x0000)) {
 					pr_err("error reading firmware at pos %zd\n",
 					       mc_data - mc_data_init);
-					return -EIO;
+					rc = -EIO;
+					goto release;
 				}
 
 				result = memcmp(curr_ptr, mc_data_buffer,
@@ -11883,7 +11880,8 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 				if (result) {
 					pr_err("error verifying firmware at pos %zd\n",
 					       mc_data - mc_data_init);
-					return -EIO;
+					rc = -EIO;
+					goto release;
 				}
 
 				curr_addr += ((dr_xaddr_t)(bytes_to_comp / 2));
@@ -11893,17 +11891,17 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 			break;
 		}
 		default:
-			return -EINVAL;
+			rc = -EINVAL;
+			goto release;
 
 		}
 		mc_data += mc_block_nr_bytes;
 	}
 
-	return 0;
+	rc = 0;
 
 release:
-	release_firmware(demod->firmware);
-	demod->firmware = NULL;
+	release_firmware(fw);
 
 	return rc;
 }
@@ -12271,7 +12269,6 @@ static void drx39xxj_release(struct dvb_frontend *fe)
 	kfree(demod->my_ext_attr);
 	kfree(demod->my_common_attr);
 	kfree(demod->my_i2c_dev_addr);
-	release_firmware(demod->firmware);
 	kfree(demod);
 	kfree(state);
 }

-- 
2.44.0.683.g7961c838ac-goog


