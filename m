Return-Path: <linux-media+bounces-53999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKkzCxW+o2mPLAUAu9opvQ
	(envelope-from <linux-media+bounces-53999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 05:18:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BA1CE7EA
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 05:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16E9D301C6E1
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 04:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5403148D0;
	Sun,  1 Mar 2026 04:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnhN2cgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6D313283
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772338703; cv=none; b=s0Mie0PtGYxxx7BA92Qngg3mObE5x0uxnwgtYc5+nvtgVNS1lkgypNebpMFriB09n/wV6ZF63mVVZ6mBYXyC9AxULPXVabxnrHSrFd51A1GDBumcq4IMlLGzMC6idtGQb9s8ehGtUE/cqUfjUIseeWakq1nzhjApMK7n2qgLMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772338703; c=relaxed/simple;
	bh=xWb14Ex3kUdDZoR/I5oUCAdUhsMYy7Mpget5ZRRWlEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FU5GsBRfZrp1uEZzh8+2oI90fRk+USaTa/tcMGC1sG2RFHU2a9Gx7w6ZLhtAMUBytG934omk4kdOuvH5INFkuxsE9BMe+QOO7eZzD/BcZzpyEXi14gvrSg9LHQUjm1686wIV8I3d1LqmdyPXg7f9imiCbvSnqSW6V1aHSZY9g40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnhN2cgR; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c9f6b78ca4so459502785a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 20:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772338701; x=1772943501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7RWNVIIQtMJvrnP7LhcgeJ8kigZSsnoQ3mQyerhYeM=;
        b=JnhN2cgRhchPVDr+5TmqEEKAESPpH/NM+89nQ9tGfDwwWv9OyBkJM9TEhhrQZ3d/FR
         g6E3OLS8AW8uidy52RQ44fGLaOJiRCSYIU2uK+THub+Ans5iubUirNDRV/rplpjE1meg
         As3TAMGSr4QvyHB/3e87O6YVgwkMau1v5N4SYmVZiXRcYfHydmo4bN4ZUJuzdkOfZaNr
         4wnhb7n55zJbW57oNS26oF8fOoAE5zUIWD0guqW1eehskHBfyuMZfM+lT4RJ3EF/RdlK
         rTCW9DZvsVKH78jI7bOUNFJyLieCQ43Iee2yzU0KTIaiCriEtYknLKeMMN7uapRh+sdB
         dBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772338701; x=1772943501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7RWNVIIQtMJvrnP7LhcgeJ8kigZSsnoQ3mQyerhYeM=;
        b=gmdashlKzgUOvJyDW8UHXuLnWqr3c/Er5eGPjAGXdubuIm+2TXZCese6FPZ67Mz8qe
         a5cVyafE9+1TdbfS6Z3wz1lOfrUdRGEfzX0LTb1VMxCk3y0acZ1/43B2ZbuUiY53ijrh
         PvmACHzo2C7ZTH6HCffKbTzxAbnd0OBXFXOffGNRbtsc8xRBQYhT5xoQLjTmXoEanNFP
         hG8V1sQ5GgGFHtHi38FxSZ4wxa6WKvFfkFd30Jm6pCtcvO+f4vBD62jcOlD5zXjFZyf1
         DAyKUuLZv39a1x+vF9+JvZOU3vrN6YGSdZqEO0ojoFVGHJgAfrxiy+GRaCtGm3/LUMKG
         X9XA==
X-Forwarded-Encrypted: i=1; AJvYcCV1vErujeJt5C3fx1BGJr4Q/jh71ngvU4dWVPpxn+Dl62DfgpZG2Pet5kcCX2wEJzYE+9/3USBTIye4Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKnJK0dN06PyVPbkHDzAhv34nPeNIhSReCX5jiet6wMfaT/Ho
	IzcHNkJyT7vK5Ikx9of1c/xL49kppctnbGW/7xQPVB35uMLE4ZgIc4fU
X-Gm-Gg: ATEYQzx2ablt4eibbhVIuFeKjSF3y9xzjOtRUJmnriUpdOPHK4UV4Obn+YbNUMkwKAD
	Ymf+AAJD+6G4TOUXJyvZ9gTS0oZgn0fS2T1icu1Vg9SUQvjG6B+kQ1UNEDrbA6zQh6h0FTiAO1B
	QK8sOysA+y38szTt1jiUBqdFOWv9d73XeMuvMViEI0S3VpU5MB8uV8+81vUxAppzGBkntW2eKwI
	HZ3QH32f9fo9hAOu3Dry6aD2yLC9/5AEYlLoxqe/VeXmPclDzQZFdZeqyRsY81GUGEepyusLnM4
	8YxOMuV72WoG9BbKg6lfsI2ENpQenF0USqPq9M4DetOTrGS0OqyWrfa3xSLjS9e7GMIsGzYv9H4
	ELIGMNiHyBvOC60qCtppYyYEDwfffG0upJonD7RgxxaZcqxRpK7cXEgB8InUt12FUtpreORSVxT
	lIS6WkK97xK0NLaug/BWrhpjUMCaaXy7XlifvgkmF8ZrKqiAczHWl6ipKRFX+Z99EJOjk9PIiih
	/M6ZA5U+fb0B2ckx56vYavPS2REQKrKcBhCjXUz7jEyMg==
X-Received: by 2002:a05:620a:28c2:b0:8ca:d5cb:6840 with SMTP id af79cd13be357-8cbc8e8496emr1119514385a.73.1772338701287;
        Sat, 28 Feb 2026 20:18:21 -0800 (PST)
Received: from rusty.tail87dd8.ts.net (host-28-207.ilmon.monticello.illinois.us.clients.pavlovmedia.net. [216.171.28.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf64ef00sm857647385a.10.2026.02.28.20.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 20:18:20 -0800 (PST)
From: Jack Tanner <jtanner0786@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jack Tanner <jtanner0786@gmail.com>
Subject: [PATCH] media: atomisp: ov2722: move sensor init from set_fmt to s_stream
Date: Sat, 28 Feb 2026 22:17:28 -0600
Message-ID: <20260301041728.577647-2-jtanner0786@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301041728.577647-1-jtanner0786@gmail.com>
References: <20260301041728.577647-1-jtanner0786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-53999-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jtanner0786@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 696BA1CE7EA
X-Rspamd-Action: no action

Move the sensor reset and register programming from ov2722_set_fmt()
into ov2722_s_stream(), which is the correct place to initialize
hardware. This removes the ov2722_startup() helper and its fragile
retry loop that attempted to power cycle the sensor on failure.

Signed-off-by: Jack Tanner <jtanner0786@gmail.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 73 +++++--------------
 drivers/staging/media/atomisp/i2c/ov2722.h    |  2 -
 2 files changed, 17 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..0585b984e097 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,39 +599,14 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
-static int ov2722_startup(struct v4l2_subdev *sd)
-{
-	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	ret = ov2722_write_reg(client, OV2722_8BIT,
-			       OV2722_SW_RESET, 0x01);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 reset err.\n");
-		return ret;
-	}
-
-	ret = ov2722_write_reg_array(client, dev->res->regs);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 write register err.\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov2722_resolution *res;
 	struct camera_mipi_info *ov2722_info = NULL;
-	int ret = 0;
 
 	if (format->pad)
 		return -EINVAL;
@@ -662,38 +637,8 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
 
-	ret = ov2722_startup(sd);
-	if (ret) {
-		int i = 0;
-
-		dev_err(&client->dev, "ov2722 startup err, retry to power up\n");
-		for (i = 0; i < OV2722_POWER_UP_RETRY_NUM; i++) {
-			dev_err(&client->dev,
-				"ov2722 retry to power up %d/%d times, result: ",
-				i + 1, OV2722_POWER_UP_RETRY_NUM);
-			power_down(sd);
-			ret = power_up(sd);
-			if (ret) {
-				dev_err(&client->dev, "power up failed, continue\n");
-				continue;
-			}
-			ret = ov2722_startup(sd);
-			if (ret) {
-				dev_err(&client->dev, " startup FAILED!\n");
-			} else {
-				dev_err(&client->dev, " startup SUCCESS!\n");
-				break;
-			}
-		}
-		if (ret) {
-			dev_err(&client->dev, "ov2722 startup err\n");
-			goto err;
-		}
-	}
-
-err:
 	mutex_unlock(&dev->input_lock);
-	return ret;
+	return 0;
 }
 
 static int ov2722_get_fmt(struct v4l2_subdev *sd,
@@ -754,10 +699,26 @@ static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&dev->input_lock);
 
+	if (enable) {
+		ret = ov2722_write_reg(client, OV2722_8BIT,
+				       OV2722_SW_RESET, 0x01);
+		if (ret) {
+			dev_err(&client->dev, "ov2722 reset err\n");
+			goto out;
+		}
+
+		ret = ov2722_write_reg_array(client, dev->res->regs);
+		if (ret) {
+			dev_err(&client->dev, "ov2722 write register err.\n");
+			goto out;
+		}
+	}
+
 	ret = ov2722_write_reg(client, OV2722_8BIT, OV2722_SW_STREAM,
 			       enable ? OV2722_START_STREAMING :
 			       OV2722_STOP_STREAMING);
 
+out:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 00317d105305..d3499c9e5465 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -21,8 +21,6 @@
 
 #include "../include/linux/atomisp_platform.h"
 
-#define OV2722_POWER_UP_RETRY_NUM 5
-
 /* Defines for register writes and register array processing */
 #define I2C_MSG_LENGTH		0x2
 #define I2C_RETRY_COUNT		5
-- 
2.51.0


