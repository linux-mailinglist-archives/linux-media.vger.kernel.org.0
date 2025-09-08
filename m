Return-Path: <linux-media+bounces-42027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098AB4928B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3DD0189AE78
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A3930DEB2;
	Mon,  8 Sep 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXgX9W0d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654ED30CDBB;
	Mon,  8 Sep 2025 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344062; cv=none; b=hOi+hhIHBYIzgFzVPWGv5Kx/CePbpjBmBaRYd//DsrxJQtl6vMgKPmsOjte1B3gbmcDHixBYxzFRZ2WNa3gB5ghgd7XwY9TpWEj0qeXr5lUE7EyT1Kvdd4J+PwbM6K97piUGQpMi7CNmeshyghGXwkFvSgvBaKxCAsYzOt1ES68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344062; c=relaxed/simple;
	bh=gRcob5bbTYCtqhImMT4WO8ZNZYRsccm7UOfu6lo+V5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/nUfIk1oC3HaAI2kPf3A/2UThwPHCj04rxHKCKkxVsNPuuHWfJkHYsNWE7juKu2LPWzh/Z43d9iz4ie5jFxWD7eLxsb9qJz5eCdmzYMOzZe9K2Wri1pQe3R9rhrm+APA4kf0UpOu9SAH0xDEAzNNMebXaKiJJIQPOoo1YeGFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXgX9W0d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445806e03cso59040195ad.1;
        Mon, 08 Sep 2025 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757344059; x=1757948859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYzcpiorMVX6Ede+R/KhzIY+gwW1IY4AzESeGSEE60w=;
        b=GXgX9W0dmfPhan6f/U7a+4vIk0mskXKnfednJxDvW0I8UcvxcIFacKQJt5P4zRdgQl
         SHxGbzm/FBQSAFhWeuPzK/rnycnc8YlGJK5B62O5sgtZLQJqJa4KCqoRSgjzuDkN10g7
         iny5v2KRxLEMd/EYhc4qSWLfCsexPW5BYB1bDGepoZ8vyZvsxWagAtP93TkmiGe+Zz2c
         fpB0p1LHXu2WjmVJ1dlZ+Zv9ImMvyBFGgqG1EVq8LlSYMMbvPWT+NLkaYdSNCWHvvR1d
         IsNBpLAswZ3p+Hipe5sKcfrAxEBcGmjK1dVKPG9boYKD7wEV9mHRMncvuGXfv1LfVKb3
         WTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344059; x=1757948859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYzcpiorMVX6Ede+R/KhzIY+gwW1IY4AzESeGSEE60w=;
        b=JN4g9D8eTo3SAUvEM46rLsWj3J/RDvyHngVb6tPF/RnzNAvxIHleRx9zgWL5AVf45C
         r85wnf+uzBo+dr+jCfOUtsOxrN6Bo2+m5HXg+Ud7YOKJLomGpShI+Oj9GOiG4GJAbWbY
         k3T3UQyxEBxxz7EJUYPxSilpG+XZxYwHVsxpW5dwZWyyWwtOuVr/dV/9yS7F8iTD1j9q
         hLFuXHAHbmI9YCuuegWI11onVJ0zBbjQLpWagPZTV03n+G8h65VbXyld81dKf40q65H6
         q8IpOQerXT0+Nif14+g9bh4hZrkLOIA8kKort3143UqImMVxMhcMnf7a96SN7kyNNlnt
         aqmA==
X-Forwarded-Encrypted: i=1; AJvYcCUXJj+vsX03jyMznFtX2mseZQgJN7VzQJyyYB9upPqM/GMhEjGupNILgHsYpsDJxe3tFuQZCMsC@vger.kernel.org, AJvYcCWUjOb+hLMOV3DE5L166lOmme1KEjXn8hbEmrXw6QxRvKMYWGik60gFj7JxLeDjPeUmyWB0dY7R90C2Zjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/xlXJnsCsg6c3W67YEx0sIg3JoXsrEzuyEet+totcigpi+T8
	3DxvUmXHWuVpVjKALmMpfIvQDw8xqjVfBjZ4iIwNyhTUHrg4edjX1Lfa
X-Gm-Gg: ASbGncuUw0U46yTfVRCZ+Yc9SgbwtwXCvCRI88yuRsi1m4rLy1p4Dvk4dHUbqrYLMl7
	LePjL6108+ib/uRSroVdZfJezK+VLAe/JTYB7EEukb95zH7lKsHG1GsB1rKbKnFYZMgYjGELp/n
	VoQHEt7ZEecsaCLLnHf5LkEZC7iIMiC9Dd5Nh6hhq9j3qO9KMALnk6iw6/DGhPpYBLIcLJBEZ6Z
	S3sk7jhXWI43RKQUDv9PQXukaifxBHgldhn/oZr6v7ZHRX8avSoTXLD3Aa1mKXeaXhK/G4EPyJj
	1bY9HQoUWv0h+H93AvOMyjCNz0RjMFSSl94Qt8keo661LIPNZSNANVbGDpaH4k0KUok8k/Qe+7F
	ASyK289bF62YKH3WXBWzxbePsXUNAVGD6W6j1JXiVFkacsKkpxw==
X-Google-Smtp-Source: AGHT+IEEWqDf/hfi9vN9BNJxR24pzRVrpJlwWLa4WxBkrCl3DJ1TUse9QPpKo7m1zjXPV9OeGz4N9w==
X-Received: by 2002:a17:902:fa85:b0:249:407f:9648 with SMTP id d9443c01a7336-25173118d57mr78508335ad.48.1757344059553;
        Mon, 08 Sep 2025 08:07:39 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b273e4ad5sm169744005ad.25.2025.09.08.08.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 08:07:39 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com,
	syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Subject: [PATCH v2 1/2] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
Date: Tue,  9 Sep 2025 00:07:29 +0900
Message-Id: <20250908150730.24560-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908150730.24560-1-aha310510@gmail.com>
References: <20250908150730.24560-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the blen is not properly bounds-checked in __az6007_read/write,
it is easy to get out-of-bounds errors in az6007_i2c_xfer later.

Therefore, we need to add bounds-checking to __az6007_read/write to
resolve this.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Change to fix the root cause of oob
- Link to v1: https://lore.kernel.org/all/20250421105555.34984-1-aha310510@gmail.com/
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 62 +++++++++++++++------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..4202042bdb55 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -97,11 +97,17 @@ static struct mt2063_config az6007_mt2063_config = {
 	.refclock = 36125000,
 };
 
-static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
-			    u16 index, u8 *b, int blen)
+static int __az6007_read(struct usb_device *udev, struct az6007_device_state *st,
+			    u8 req, u16 value, u16 index, u8 *b, int blen)
 {
 	int ret;
 
+	if (blen > sizeof(st->data)) {
+		pr_err("az6007: tried to read %d bytes, but I2C max size is %lu bytes\n",
+		       blen, sizeof(st->data));
+		return -EOPNOTSUPP;
+	}
+
 	ret = usb_control_msg(udev,
 			      usb_rcvctrlpipe(udev, 0),
 			      req,
@@ -125,24 +131,30 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
 static int az6007_read(struct dvb_usb_device *d, u8 req, u16 value,
 			    u16 index, u8 *b, int blen)
 {
-	struct az6007_device_state *st = d->priv;
+	struct az6007_device_state *st = d_to_priv(d);
 	int ret;
 
 	if (mutex_lock_interruptible(&st->mutex) < 0)
 		return -EAGAIN;
 
-	ret = __az6007_read(d->udev, req, value, index, b, blen);
+	ret = __az6007_read(d->udev, st, req, value, index, b, blen);
 
 	mutex_unlock(&st->mutex);
 
 	return ret;
 }
 
-static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
-			     u16 index, u8 *b, int blen)
+static int __az6007_write(struct usb_device *udev, struct az6007_device_state *st,
+			    u8 req, u16 value, u16 index, u8 *b, int blen)
 {
 	int ret;
 
+	if (blen > sizeof(st->data)) {
+		pr_err("az6007: tried to write %d bytes, but I2C max size is %lu bytes\n",
+		       blen, sizeof(st->data));
+		return -EOPNOTSUPP;
+	}
+
 	if (az6007_xfer_debug) {
 		printk(KERN_DEBUG "az6007: OUT req: %02x, value: %04x, index: %04x\n",
 		       req, value, index);
@@ -150,12 +162,6 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 				     DUMP_PREFIX_NONE, b, blen);
 	}
 
-	if (blen > 64) {
-		pr_err("az6007: tried to write %d bytes, but I2C max size is 64 bytes\n",
-		       blen);
-		return -EOPNOTSUPP;
-	}
-
 	ret = usb_control_msg(udev,
 			      usb_sndctrlpipe(udev, 0),
 			      req,
@@ -172,13 +178,13 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 static int az6007_write(struct dvb_usb_device *d, u8 req, u16 value,
 			    u16 index, u8 *b, int blen)
 {
-	struct az6007_device_state *st = d->priv;
+	struct az6007_device_state *st = d_to_priv(d);
 	int ret;
 
 	if (mutex_lock_interruptible(&st->mutex) < 0)
 		return -EAGAIN;
 
-	ret = __az6007_write(d->udev, req, value, index, b, blen);
+	ret = __az6007_write(d->udev, st, req, value, index, b, blen);
 
 	mutex_unlock(&st->mutex);
 
@@ -775,7 +781,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			value = addr | (1 << 8);
 			length = 6 + msgs[i + 1].len;
 			len = msgs[i + 1].len;
-			ret = __az6007_read(d->udev, req, value, index,
+			ret = __az6007_read(d->udev, st, req, value, index,
 					    st->data, length);
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
@@ -788,7 +794,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 && msgs[i].len > 64) {
 				ret = -EIO;
 				goto err;
 			}
@@ -796,11 +802,8 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			index = msgs[i].buf[0];
 			value = addr | (1 << 8);
 			length = msgs[i].len - 1;
-			len = msgs[i].len - 1;
-			for (j = 0; j < len; j++)
-				st->data[j] = msgs[i].buf[j + 1];
-			ret =  __az6007_write(d->udev, req, value, index,
-					      st->data, length);
+			ret =  __az6007_write(d->udev, st, req, value, index,
+					      &msgs[i].buf[1], length);
 		} else {
 			/* read bytes */
 			if (az6007_xfer_debug)
@@ -815,10 +818,12 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			value = addr;
 			length = msgs[i].len + 6;
 			len = msgs[i].len;
-			ret = __az6007_read(d->udev, req, value, index,
+			ret = __az6007_read(d->udev, st, req, value, index,
 					    st->data, length);
-			for (j = 0; j < len; j++)
-				msgs[i].buf[j] = st->data[j + 5];
+			if (ret >= len) {
+				for (j = 0; j < len; j++)
+					msgs[i].buf[j] = st->data[j + 5];
+			}
 		}
 		if (ret < 0)
 			goto err;
@@ -845,6 +850,7 @@ static const struct i2c_algorithm az6007_i2c_algo = {
 
 static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 {
+	struct az6007_device_state *state = d_to_priv(d);
 	int ret;
 	u8 *mac;
 
@@ -855,7 +861,7 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 		return -ENOMEM;
 
 	/* Try to read the mac address */
-	ret = __az6007_read(d->udev, AZ6007_READ_DATA, 6, 0, mac, 6);
+	ret = __az6007_read(d->udev, state, AZ6007_READ_DATA, 6, 0, mac, 6);
 	if (ret == 6)
 		ret = WARM;
 	else
@@ -864,9 +870,9 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 	kfree(mac);
 
 	if (ret == COLD) {
-		__az6007_write(d->udev, 0x09, 1, 0, NULL, 0);
-		__az6007_write(d->udev, 0x00, 0, 0, NULL, 0);
-		__az6007_write(d->udev, 0x00, 0, 0, NULL, 0);
+		__az6007_write(d->udev, state, 0x09, 1, 0, NULL, 0);
+		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
+		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
 	}
 
 	pr_debug("Device is on %s state\n",
--

