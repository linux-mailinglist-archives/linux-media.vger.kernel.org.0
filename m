Return-Path: <linux-media+bounces-48365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB50CABEF6
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 04:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C86E30271AF
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 03:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B853D274FE8;
	Mon,  8 Dec 2025 03:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht+4OzrG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415820487E
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 03:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163587; cv=none; b=Qv2oBX+DXcbfSuwi4L6sytOCQ2kr50IUa2Hmihbef/lC+SfjXUyr1t3iakUeDSaFSQdqDFLu9bARR8P93TjURRcgMJfrtOde2kC74WaqVmQQAu6RlAVjFTd8zr5Hyc098hVdHg979QHo8T7ILxUfKt7LDWjZfksjwyTOhdVNcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163587; c=relaxed/simple;
	bh=rAvl13OFCVxdaYtaQPBo+tUQXCa6gdUpoP7Bx2fKdVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dw+RoOmHLC6SMBnj8qdNOL6zZ4CeYhcqr9NxeGGtHmkKZoVJBrru3lXxOGnHb0LH0Xp+9cknYbt3KxKcZxwO4EdjIJf7eTVhJHsShgF/v5IIGVzxvz5t97LkNAR4emvHFKlJgpROL5sku3NMaaC/+NYevsd15xzaNlizyWbgbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht+4OzrG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29555b384acso40114005ad.1
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 19:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765163585; x=1765768385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYX2ooIlQ0+ulIrJRn/Q40MXHBfq+kRpa2QUKgQDnTU=;
        b=ht+4OzrGrkvakYezHkmWLZ2o1DLSgIoAQc/P2B0+ObgBLQQwQh6lAyAVGJWVisvzur
         IxCpkkEjpF6e/RwcdWj1MvzfJJJ6E1WAZmukJLSQwGKjzVBufj0sv7wbrxP4r5dybTt8
         gMSmBhby9LoDPGo93n0LpbwhkHgt9Hz7+BDRAy4wlfk7zfB+1x4qEsnhey3M7r2JuT7Y
         zym5AlvpvQ3vdc669x0LTAC6NZ4jY29WdI8hfjmoyVwKYUOt2J3Hxx0ZnkaWxAaWcaVL
         s0bE1xCHU+xSMXh7VJsatbpgFdhiD7n5Cn+rZvQvdH7KiSL2Cp2biLKpFLPFvyJkebOS
         dmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765163585; x=1765768385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYX2ooIlQ0+ulIrJRn/Q40MXHBfq+kRpa2QUKgQDnTU=;
        b=cVKdakPYa7HU/fKawhWqoRtR9ZzBcRFiDeB+qm4Gce/UMYSRbujGUHL0EI2CtskHNH
         7F98i+slZpgEBQYuQnMEw60JSRmjCG5MYFVUgflzIASVJnN41zCBz3TEbxStGe2beZ99
         ob312oZZTI57lyGByRSlSy16BdryiUAi06oZDv27l/ns4t7gDz1vJxhpYVFsM7pa9kWN
         BCjF7eoeoZg1clyKc4bKS9wG6DftrqqPoO6iaTNTcp2RHrJnBCzYVkWzj7X2AKzjlEOT
         bP3oGbPiUw7tjYXhWZRaBLgleQi9EuUz+FP3gEcaNou++4a5O7d278MA8OqIqnt81+/t
         og5Q==
X-Gm-Message-State: AOJu0YzuMbncbUSFMmoVB2vIisWu9xZ2dtP384Y+0Kn5FSnn8+YWhHdl
	FHMW1VZZT2JRA3FLCQTxSv6tWTYRGBzJZkFulB+iHXKCPpJSnswYaZyFW+yH6hs8
X-Gm-Gg: ASbGncu8EC4Bg2zpna8yxEWknkToofi3bMkjHE6EbsjxeT7Mdu0u/bmQj7Rstab/7dY
	3taQjaKveLVY1sX7eG8SNcZ4xKnioZUvMMcP8fSsAd6lHS45s8yoJmGOSq96l82LzOV6EP5EgJ6
	qzPlYviedhXJxUz27kSq892esLd1SZqg1F4Rqs4qq/Hord1t3H8FUSw0kpAS8NcQivvmFdGDV4K
	shXLAYAh9Ax8b/5er97J6yGFItu5Ze8jWj7ni2KlAJLcHZXEkVlTZW8QjYa0b7S/ntDkrk9jfaM
	NN4fM+UUfDM36y3o3c7Rqwol7Lca+65nr57sFDLcxyYnO/5gj0o2PMD562WmR9KGa3UOX5zKesu
	puy783QYWOEFoPlFW/vz3Pf//NWsoa/ZEM4ehqDbCc5CYdl5HaHgcnuD/pxXmDlcAWvLCtY0ZZS
	aaFmzY+HMOKghqwGgzMsfhMaoT+AuiAIAI4MmIB6pjuIg=
X-Google-Smtp-Source: AGHT+IF6KtQs08mOWinVqBkLg5gqwqjXDMb5wznNC0Q1/S5ZIcJAiOTQnqnlSi5N8EWBIixq1pUWBA==
X-Received: by 2002:a17:902:e812:b0:295:6427:87e4 with SMTP id d9443c01a7336-29df871034fmr69099735ad.40.1765163584729;
        Sun, 07 Dec 2025 19:13:04 -0800 (PST)
Received: from localhost.localdomain ([38.224.232.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99effasm109800685ad.57.2025.12.07.19.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 19:13:04 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	micha@freedict.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] media: dw2102: validate I2C messages in su3000_i2c_transfer()
Date: Mon,  8 Dec 2025 03:12:25 +0000
Message-ID: <20251208031224.10579-2-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

syzbot reports a general protection fault caused by su3000_i2c_transfer()
dereferencing msg->buf without validating the message length or buffer
pointer. Although i2c-dev blocks zero-length messages, malformed I²C
messages can still reach the driver through the DVB USB subsystem.

#syz test

Add strict validation of each message to prevent NULL-pointer
dereferences.

Reported-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Fixes: 0e148a522b84 ("media: dw2102: Don't translate i2c read into write")
Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..0dd210ea16f3 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -733,6 +733,36 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		return -EAGAIN;
 	}
 
+		/* Validate incoming I²C messages */
+	if (!msg || num <= 0) {
+		mutex_unlock(&d->data_mutex);
+        mutex_unlock(&d->i2c_mutex);
+		return -EINVAL;
+	}
+
+	for (j = 0; j < num; j++) {
+		/* msg buffer must exist */
+		if (!msg[j].buf) {
+			mutex_unlock(&d->data_mutex);
+            mutex_unlock(&d->i2c_mutex);
+			return -EINVAL;
+		}
+
+		/* zero or negative length is invalid */
+		if (msg[j].len <= 0) {
+			mutex_unlock(&d->data_mutex);
+            mutex_unlock(&d->i2c_mutex);
+			return -EINVAL;
+		}
+
+		/* protect against unreasonable sizes */
+		if (msg[j].len > 256) {
+			mutex_unlock(&d->data_mutex);
+            mutex_unlock(&d->i2c_mutex);
+			return -EOPNOTSUPP;
+		}
+	}
+
 	j = 0;
 	while (j < num) {
 		switch (msg[j].addr) {
-- 
2.43.0


