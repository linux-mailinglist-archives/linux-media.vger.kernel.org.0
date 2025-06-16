Return-Path: <linux-media+bounces-34849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D108EADA62D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 04:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0B53A8E69
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 02:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9443428E594;
	Mon, 16 Jun 2025 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPWx6E1m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1AE14A4F9;
	Mon, 16 Jun 2025 02:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750039721; cv=none; b=CyOq0QESbmVw0TR6UPuzYQrSxQjAVKZ/7UhlORqcVOePf2XMfbWwnSmIlPqCQxfWT/rkMbsnFF2g5+1diE6WEbofTbe06gIXBKswmLshLu9BAKdtI9OIEXB2krDAmcEZ4zksmTrR60TAHjgqlDgBd/OMsbX/1yL0qvLsqQscmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750039721; c=relaxed/simple;
	bh=YzfeWc5rykV+26M6k2a4KnFTALui7jcmwCaxGyrIMPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zsrg7htIjWDNo9RJeE7NzMdt6C3w8pmH9L+HDzdDujw/4kmhWJiB8VnLFkHXEalhfKMtdmt4AzBcA/6pVybrU6LSa7u6n0IydbE4Tt1JBv5yYur6WZnYAb/tUl7nFWF2mPSmxpUFcS7ZtH/XO4rB8sxb2Mumwf+I0EzXg/32J8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPWx6E1m; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e5e6ab7b8so32726717b3.1;
        Sun, 15 Jun 2025 19:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750039718; x=1750644518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqBf2z/y6/j2cgyHHwE0B8qL8Flta5mBURT44+VOH78=;
        b=aPWx6E1mUK3E9Qd/x7uq853+sJqjvd/UfaQxnk0faFhlpn528TYK6iwprzGCZ+CoAB
         e7unEia1wCnnFsgovNH+VtLe80BCJNbLpDCjx8jQu1hNctNq/Fv1wPC1ensjn6xQrotR
         miGa2NUmPNpH1TLM1p1EaONjOq9E4fVbIO/WBvXv2n7A+Dstm3KCK7VUyMWpv7By6Xjq
         kP+Pm34sDmva/cbdlhZSX2dhfd4xTTenEArBN4xmuQ5znMqfRubvVG9fMAnVgY4XhISG
         DPzbpmYZorDHg9Fl9MD4x3IFeCAfSYPM6AiDEPwrquIVAjnuWK2syupXGSN0qJ1Q33jF
         K8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750039718; x=1750644518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqBf2z/y6/j2cgyHHwE0B8qL8Flta5mBURT44+VOH78=;
        b=sdeTn0ntwsiN10VwNXYXztNBvXo9njy7YJsIwFzHlJigf4yQDydB6txCom/CMomHVR
         La1N2Ro27P1Yd58PJEGBv+471HufyaDqooelb+b4zgsA01hr5oOdpTbHfalmyUMoFH+D
         C1xJqnmmfS9KVciEoUzpqIJ0w0j8sJ5Y3zzUypVDRGfG7ZMFLRZ5O8kk8mwrE7wNzdtm
         M198qFgvVvpF/u5ivSxdePzT9Wc6QRMfyFrMHC4bXGNssEdGBN+43DsS6ohGc8UuUB8q
         jrgPypFALZGcd/PhGkjWBEwxXtnFc8B7qVk//y1pXspvMN3XK5HIM72IoAmarpt2U3lB
         mTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDw9kThj6x+HkzmMjYSUUTYu1YsCxEQLtcdUt5mUWu8ggBUpjMg+crEXgtrbqu1kKrIq3qSASN2RfDcQM=@vger.kernel.org, AJvYcCX7dNZUfkC0yRabeuQ6zeFfB0BtmQKIHJCB+YINdhVD+JAW5r3rVRPs3iQEf8KObDZdijp2moPEN9nzRmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPG0f9TVFVpw86uuRozOfuN09x0lGGqpqmt3wZm/AHWqMa9lU
	8AyFDfnn9nZR5MILmqLRfSVo3QpW4cI77AbdDeZgMzoqHdKsNukoyYVoIPzGZfJ8
X-Gm-Gg: ASbGncuXKLtLTMtYy08b6ERGbN6SsuUryfQRVZai8O7s6s7oP4ga/bj/hpXoN43QIFn
	wf2v93ik5xQzgMmI132i5nfWEMhn9BJB/7rHrvNKL0vROwl3b0oGmuFVzIAagDr86Bmn0ExJA39
	l9NTwMwd7rXxuMPdclGCInunv/LZUu5ijiuVQ4b40pB2Upl2qmv39313Ht1VztJ6l2x88vFemCM
	Hju2DDtZ9moJD9EndF1tPvEH0noN/rPD7fJprhhz/G5PE8Mj1YbE9LgxXyosYOFjVUOQOlYPn0w
	81LsnKOQy+yEhF0yXhT2kpsujUxxchGQ9/d6A48niG/KD4ZuuueDIu+EC3zkw1FKj6s/2AC5NGZ
	O
X-Google-Smtp-Source: AGHT+IGWOsUGov3FtiPh9xtnK3e46JwclcqyFjMpWPYen4z7rAHftJ19OrIxPeaVLgOPXoTS4zkFlw==
X-Received: by 2002:a05:690c:60c5:b0:6f9:7a3c:1fe with SMTP id 00721157ae682-71175431bcamr103707327b3.23.1750039718431;
        Sun, 15 Jun 2025 19:08:38 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-711527d3104sm15192977b3.108.2025.06.15.19.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 19:08:38 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: w7090p: fix null-ptr-deref in zd1301_demod_i2c_master_xfer
Date: Sun, 15 Jun 2025 22:08:35 -0400
Message-Id: <20250616020835.791693-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In zd1301_demod_i2c_master_xfer, msg is controlled by user. When
msg[0].buf is null and msg[0].len is zero, former checks on
msg[0].buf would be passed. If accessing msg[0].buf[0] without
sanity check, null pointer deref would happen. We add
check on msg[0].len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb:
az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/dvb-frontends/zd1301_demod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/zd1301_demod.c b/drivers/media/dvb-frontends/zd1301_demod.c
index e8b9e67a8717..ebc10f96438e 100644
--- a/drivers/media/dvb-frontends/zd1301_demod.c
+++ b/drivers/media/dvb-frontends/zd1301_demod.c
@@ -325,7 +325,7 @@ static int zd1301_demod_i2c_master_xfer(struct i2c_adapter *adapter,
 	if (ZD1301_IS_I2C_XFER_WRITE_READ(msg, num)) {
 		dev_dbg(&pdev->dev, "write&read msg[0].len=%u msg[1].len=%u\n",
 			msg[0].len, msg[1].len);
-		if (msg[0].len > 1 || msg[1].len > 8) {
+		if (msg[0].len != 1 || msg[1].len > 8) {
 			ret = -EOPNOTSUPP;
 			goto err;
 		}
@@ -372,7 +372,7 @@ static int zd1301_demod_i2c_master_xfer(struct i2c_adapter *adapter,
 		}
 	} else if (ZD1301_IS_I2C_XFER_WRITE(msg, num)) {
 		dev_dbg(&pdev->dev, "write msg[0].len=%u\n", msg[0].len);
-		if (msg[0].len > 1 + 8) {
+		if (msg[0].len > 1 + 8 || msg[0].len < 1) {
 			ret = -EOPNOTSUPP;
 			goto err;
 		}
-- 
2.34.1


