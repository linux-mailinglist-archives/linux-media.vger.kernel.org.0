Return-Path: <linux-media+bounces-41926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A3B47BB2
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 15:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EE6217DE0B
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 13:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195C92690C0;
	Sun,  7 Sep 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXKtRqVB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B6183CC3;
	Sun,  7 Sep 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757253278; cv=none; b=C8np4C9NtTFXPP3iZtjXGgQUTLZqCWMFZwugKNdo7b1oUXQA59uYPlXYm9vx7ytnRF1BWfAZrVfz8kAYb7ZoWX4GcKzHQvoNKvhWgQiJMdH0C+vvwBjlRxx194RAp/csY5xBHVTTjIZs6WDcqZrkADJ7VCWodyMwjc0dHAsKSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757253278; c=relaxed/simple;
	bh=DPKOhFWBZXz0AyvXZDAgXRk9fueE421+oxKlkZqAEjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YD9RGDjvQCd86OuIjte+51bEdEXfxNXHPpcG8y5pkSDLIDQAtDHeyzBWe2witdVPgYyF5WskkLWYWX5poIjnJNIxqHCgwVvDU1uTMQWbKJ8IrvhJKRFxi0r9rJI6SEizP4AsuldNNVSOMfJZ2RgBcuguwATy2cdaEpIOeH7vAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXKtRqVB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32d3e17d927so1351254a91.2;
        Sun, 07 Sep 2025 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757253276; x=1757858076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ath9tHm44WdkM2EOqBfdfhglOX8YpTapcIX4BTRY6u8=;
        b=RXKtRqVB5BPllzjN7K7zoXNPflADoMMk5euDafT7Q/XJkgSgfwtgKvRL2G/OTwYJk+
         ovrqZKpeB3hWw1pLJtG2EyBahlBg2ESNDRwNBBc9BcOCgBvmGBKGDHXpg+ab7ZEWZJkj
         oRFYgkNk2dMxjMxrTDFl8SUUZE/g/IEZTJ1t4sJaL1rIhKGjnDt1gAlZ7YXwTmoXEBO+
         +hO5dbE3piuLaqlAXnFpA3vzyHAukjx3jEvIG1o3gZZWoa9i+6y3T+tP0YOuuI/9u9mH
         hugKMOEaayijidPt9HhgnkaOWQa1fZHwm9TbccOvhTgnOPX1pUBKUtL2StUA141kFzLc
         e9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757253276; x=1757858076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ath9tHm44WdkM2EOqBfdfhglOX8YpTapcIX4BTRY6u8=;
        b=qohNR0+FS7aKXWEt002eUarSvdVLjqsA0kS2cN3EGGZTrNr1p83BZOCe9Zttsg76Zh
         ufd3ZpzYJ+FMkQT8e5h/ZkS6zXmxKUmnCajdL6LK2vSvE//MZnbfdgWxM2+ql3Gt8/PK
         ohVYhcFV4O73eq/v11X6nUK+spSrdrGtS+KoON+Ewaf0YAGWspfNdbr/0yksfFofGqly
         WK+LQ/6a8mcMYX8QePYVBTi4cj3Pzag9mDjW8W+wXieqssY9rfNIrbKiqKG44el4I46A
         lnLKOSoCqLpogbrW80QTFn1K9BmiQauOTsG4m9IAfv9Zk5e03jo36+r9HgIfwo6G4t97
         5x+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjZhsR8GLiCLKqAhyRoGecHkkIzVEi5J3s9VHaWR1nXzVRD15RtYZ5cPfWA0XdGLB/Ia/6SNj3uCTMxjY=@vger.kernel.org, AJvYcCXDmxrJopw4NHVn+PzMdvy/kaHS0Ie9XCK7AMUI+hM4unyYsTFWeaqLPWpyTyWSynWfuvwqMMPCHVlCJ5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfhPvnvHIq9Ew/r3u0rGTSILb6k46AfLyAvxdLSHleccFfNm2
	1MyKaC+NI/m1nOLvOVwcSvmGappHJZzkJG746VwUP8WQCmCowEAfOrCE
X-Gm-Gg: ASbGnctdAqyhee+x62n6PqfUTJXSqcsXGQfhapdhvV5UeEoIyQrvc2RkbUl9Lx97Cq2
	RDaJ5cer8u7CYG6/cQ8hXLMpieIBT864MuyJ2MLkGn25nfF8QZDWAxsB34yC+8hWg1p/kNgHa+7
	y6x+RVkt1032xJrVf0CrYIeoutxFM4r+FOJUUnprfbwky9cRFc5Xp0tuFteVu5F0fsZqoVR49u7
	H40dPwSK3lSakwxHSPS/orPKYT6rqkW84sLfQD7zDpXX+aUkIOyQwQMIWDO3tfsBtvlzJP/8Zou
	4bwGkLYyygteH7SZn4yHMHL61W02b+ZEW7SIZfabhwcuQT9if7DOPSA2R2G/fQ9mRxdNynSU4KH
	XTyAMYGSP+3U23HsmcEKneosqaXZ5Bq0tHhGvKgrqjBmaCfzwdA==
X-Google-Smtp-Source: AGHT+IF3FtIG65isxx/bZfmlry652TD5smGXxD6tQRUokmznfK7i0Wzst5YNDdYT+cLp0yLfTKv9Vw==
X-Received: by 2002:a17:90b:3d81:b0:32b:8edb:12ce with SMTP id 98e67ed59e1d1-32d43f18b0bmr9218774a91.15.1757253275941;
        Sun, 07 Sep 2025 06:54:35 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b520d33cbd8sm5960335a12.41.2025.09.07.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 06:54:35 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH v2] media: dvb-usb: az6027: fix out-of-bounds in az6027_i2c_xfer()
Date: Sun,  7 Sep 2025 22:53:35 +0900
Message-Id: <20250907135335.308595-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg[i].len is a user-controlled value, the current implementation easily
causes out-of-bounds errors in az6027_i2c_xfer().

Therefore, to prevent this, we need to strengthen bounds checking through
a comprehensive refactoring of az6027_usb_in_op/az6027_usb_out_op/
az6027_i2c_xfer.

Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Change to fix the root cause of oob
- Link to v1: https://lore.kernel.org/all/20250421115045.81394-1-aha310510@gmail.com/
---
 drivers/media/usb/dvb-usb/az6027.c | 105 ++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 33 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 056935d3cbd6..c021362e9b8a 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -296,12 +296,19 @@ static struct stb6100_config az6027_stb6100_config = {
 
 /* check for mutex FIXME */
 static int az6027_usb_in_op(struct dvb_usb_device *d, u8 req,
-			    u16 value, u16 index, u8 *b, int blen)
+			    u16 value, u16 index, u8 *b, int blen, int buf_size)
 {
 	int ret = -1;
 	if (mutex_lock_interruptible(&d->usb_mutex))
 		return -EAGAIN;
 
+	if (blen > buf_size) {
+		err("usb in %d bytes, but max size is %d bytes\n",
+			blen, buf_size);
+		ret = -EOPNOTSUPP;
+		goto end_unlock;
+	}
+
 	ret = usb_control_msg(d->udev,
 			      usb_rcvctrlpipe(d->udev, 0),
 			      req,
@@ -321,6 +328,7 @@ static int az6027_usb_in_op(struct dvb_usb_device *d, u8 req,
 	deb_xfer("in: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
 	debug_dump(b, blen, deb_xfer);
 
+end_unlock:
 	mutex_unlock(&d->usb_mutex);
 	return ret;
 }
@@ -330,16 +338,24 @@ static int az6027_usb_out_op(struct dvb_usb_device *d,
 			     u16 value,
 			     u16 index,
 			     u8 *b,
-			     int blen)
+			     int blen,
+			     int buf_size)
 {
 	int ret;
 
-	deb_xfer("out: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
-	debug_dump(b, blen, deb_xfer);
-
 	if (mutex_lock_interruptible(&d->usb_mutex))
 		return -EAGAIN;
 
+	if (blen > buf_size) {
+		err("usb out %d bytes, but max size is %d bytes\n",
+			blen, buf_size);
+		ret = -EOPNOTSUPP;
+		goto end_unlock;
+	}
+
+	deb_xfer("out: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
+	debug_dump(b, blen, deb_xfer);
+
 	ret = usb_control_msg(d->udev,
 			      usb_sndctrlpipe(d->udev, 0),
 			      req,
@@ -350,6 +366,7 @@ static int az6027_usb_out_op(struct dvb_usb_device *d,
 			      blen,
 			      2000);
 
+end_unlock:
 	if (ret != blen) {
 		warn("usb out operation failed. (%d)", ret);
 		mutex_unlock(&d->usb_mutex);
@@ -375,7 +392,7 @@ static int az6027_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 	index = 0;
 	blen = 0;
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		warn("usb out operation failed. (%d)", ret);
 
@@ -399,7 +416,7 @@ static int az6027_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 int az6027_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	u8 v = onoff;
-	return az6027_usb_out_op(d,0xBC,v,3,NULL,1);
+	return az6027_usb_out_op(d,0xBC,v,3,NULL,1,0);
 }
 */
 
@@ -431,7 +448,7 @@ static int az6027_ci_read_attribute_mem(struct dvb_ca_en50221 *ca,
 	index = 0;
 	blen = 1;
 
-	ret = az6027_usb_in_op(d, req, value, index, b, blen);
+	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
 	if (ret < 0) {
 		warn("usb in operation failed. (%d)", ret);
 		ret = -EINVAL;
@@ -468,7 +485,7 @@ static int az6027_ci_write_attribute_mem(struct dvb_ca_en50221 *ca,
 	index = value;
 	blen = 0;
 
-	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen);
+	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen, 0);
 	if (ret != 0)
 		warn("usb out operation failed. (%d)", ret);
 
@@ -504,7 +521,7 @@ static int az6027_ci_read_cam_control(struct dvb_ca_en50221 *ca,
 	index = 0;
 	blen = 2;
 
-	ret = az6027_usb_in_op(d, req, value, index, b, blen);
+	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
 	if (ret < 0) {
 		warn("usb in operation failed. (%d)", ret);
 		ret = -EINVAL;
@@ -544,7 +561,7 @@ static int az6027_ci_write_cam_control(struct dvb_ca_en50221 *ca,
 	index = value;
 	blen = 0;
 
-	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen);
+	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen, 0);
 	if (ret != 0) {
 		warn("usb out operation failed. (%d)", ret);
 		goto failed;
@@ -575,7 +592,7 @@ static int CI_CamReady(struct dvb_ca_en50221 *ca, int slot)
 	index = 0;
 	blen = 1;
 
-	ret = az6027_usb_in_op(d, req, value, index, b, blen);
+	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
 	if (ret < 0) {
 		warn("usb in operation failed. (%d)", ret);
 		ret = -EIO;
@@ -604,7 +621,7 @@ static int az6027_ci_slot_reset(struct dvb_ca_en50221 *ca, int slot)
 	index = 0;
 	blen = 0;
 
-	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
 	if (ret != 0) {
 		warn("usb out operation failed. (%d)", ret);
 		goto failed;
@@ -616,7 +633,7 @@ static int az6027_ci_slot_reset(struct dvb_ca_en50221 *ca, int slot)
 	index = 0;
 	blen = 0;
 
-	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
 	if (ret != 0) {
 		warn("usb out operation failed. (%d)", ret);
 		goto failed;
@@ -660,7 +677,7 @@ static int az6027_ci_slot_ts_enable(struct dvb_ca_en50221 *ca, int slot)
 	index = 0;
 	blen = 0;
 
-	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
 	if (ret != 0) {
 		warn("usb out operation failed. (%d)", ret);
 		goto failed;
@@ -692,7 +709,7 @@ static int az6027_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 	index = 0;
 	blen = 1;
 
-	ret = az6027_usb_in_op(d, req, value, index, b, blen);
+	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
 	if (ret < 0) {
 		warn("usb in operation failed. (%d)", ret);
 		ret = -EIO;
@@ -771,7 +788,7 @@ static int az6027_ci_init(struct dvb_usb_adapter *a)
 /*
 static int az6027_read_mac_addr(struct dvb_usb_device *d, u8 mac[6])
 {
-	az6027_usb_in_op(d, 0xb7, 6, 0, &mac[0], 6);
+	az6027_usb_in_op(d, 0xb7, 6, 0, &mac[0], 6, 6);
 	return 0;
 }
 */
@@ -831,7 +848,7 @@ static int az6027_frontend_poweron(struct dvb_usb_adapter *adap)
 	index = 3;
 	blen = 0;
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		return -EIO;
 
@@ -851,7 +868,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
 	index = 3;
 	blen = 0;
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		return -EIO;
 
@@ -861,7 +878,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
 	blen = 0;
 	msleep_interruptible(200);
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		return -EIO;
 
@@ -872,7 +889,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
 	index = 3;
 	blen = 0;
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		return -EIO;
 
@@ -894,7 +911,7 @@ static int az6027_frontend_tsbypass(struct dvb_usb_adapter *adap, int onoff)
 	index = 0;
 	blen = 0;
 
-	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
+	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
 	if (ret != 0)
 		return -EIO;
 
@@ -955,6 +972,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 	u16 index;
 	u16 value;
 	int length;
+	int ret;
 	u8 req;
 	u8 *data;
 
@@ -981,7 +999,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			}
 			value = msg[i].buf[0] & 0x00ff;
 			length = 1;
-			az6027_usb_out_op(d, req, value, index, data, length);
+			ret = az6027_usb_out_op(d, req, value, index,
+						data, length, 256);
+			if (ret != 0) {
+				i = ret;
+				break;
+			}
 		}
 
 		if (msg[i].addr == 0xd0) {
@@ -995,7 +1018,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 				index = (((msg[i].buf[0] << 8) & 0xff00) | (msg[i].buf[1] & 0x00ff));
 				value = msg[i].addr + (msg[i].len << 8);
 				length = msg[i + 1].len + 6;
-				az6027_usb_in_op(d, req, value, index, data, length);
+				ret = az6027_usb_in_op(d, req, value, index,
+							data, length, 256);
+				if (ret != 0) {
+					i = ret;
+					break;
+				}
+
 				len = msg[i + 1].len;
 				for (j = 0; j < len; j++)
 					msg[i + 1].buf[j] = data[j + 5];
@@ -1013,9 +1042,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 				value = msg[i].addr + (2 << 8);
 				length = msg[i].len - 2;
 				len = msg[i].len - 2;
-				for (j = 0; j < len; j++)
-					data[j] = msg[i].buf[j + 2];
-				az6027_usb_out_op(d, req, value, index, data, length);
+				ret = az6027_usb_out_op(d, req, value, index,
+							&msg[i].buf[2], length, 256);
+				if (ret != 0) {
+					i = ret;
+					break;
+				}
 			}
 		}
 
@@ -1026,7 +1058,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 				index = 0x0;
 				value = msg[i].addr;
 				length = msg[i].len + 6;
-				az6027_usb_in_op(d, req, value, index, data, length);
+				ret = az6027_usb_in_op(d, req, value, index,
+							data, length, 256);
+				if (ret != 0) {
+					i = ret;
+					break;
+				}
+
 				len = msg[i].len;
 				for (j = 0; j < len; j++)
 					msg[i].buf[j] = data[j + 5];
@@ -1042,11 +1080,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 				value = msg[i].addr + (1 << 8);
 				length = msg[i].len - 1;
 				len = msg[i].len - 1;
-
-				for (j = 0; j < len; j++)
-					data[j] = msg[i].buf[j + 1];
-
-				az6027_usb_out_op(d, req, value, index, data, length);
+				ret = az6027_usb_out_op(d, req, value, index,
+							&msg[i].buf[1], length, 256);
+				if (ret != 0) {
+					i = ret;
+					break;
+				}
 			}
 		}
 	}
--

