Return-Path: <linux-media+bounces-35505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E7AE23ED
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F7E1BC39B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955CC2367DC;
	Fri, 20 Jun 2025 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzNNAocy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3D1DF97D;
	Fri, 20 Jun 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454365; cv=none; b=fANKB1uSFICz5AeHp9qF9kcJafYoTC7Tu8vFTwKQRpn1ZOVM2C7venawOLmHRHGLVYmmjUiiDPV1HxCYusCP6zsz4RXpUfyUO8piyh+vLmIgXSdHsAmmrMCRAyPy2WogJKHLP9uiGgOMnnUNCjTHxKoHzsEAsVNuHTEtmbAOKb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454365; c=relaxed/simple;
	bh=z4cn/akX/dDAjxMey9oCI0QTO+zIUDN3GLRvcTU/Cq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozYXa6O1SHXbytp256T6pau3SuMkip/DHTm7I1CCfqRym32bxUIKxi/+nEABhF95V030xRSKSZA+c5re7oEhoS31QA1yR6UuUV4gQaI72NK1CE9pLcbUnRiZGAwLX6AUQPrUT8FfedZ5Tv9KzSaODDo29P8kOvs40xtLlty0LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzNNAocy; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-710e344bbf9so24259217b3.2;
        Fri, 20 Jun 2025 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750454362; x=1751059162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mPdM6cTcll7M51bPTHRCE/W3UzCGQQJNLvsR4d37PI=;
        b=bzNNAocyFSSsJBmE7YnP7+EXjMQU+2v7Eb4/fGCikh+YSNV1RPPopUyzcIe9cEwjjI
         TCCcLk9k3k/WZi4SrXnJAJv+FwZWzPRdVbDS9G7X1cz02UhorgKLWJHd4LHIP82ugmYK
         mIJI3bvQdgM0cIhIBRtLLoht91FQzBURY5j+NgqFwfgcxIq4z2W9YYdwycU94M/vdSJW
         MYINq8wvrKvkV/MoULWbaC9XCeohixscNG085fbzzKNCCraKjjHSzBAY/YDzGydFVDhf
         B5pTuRFdd5tMzAEvQnOt+MAP4YfGUiPSgTytrRztZh11xIcHZsH5MM4b+eApWZ59B3SV
         Vv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454362; x=1751059162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mPdM6cTcll7M51bPTHRCE/W3UzCGQQJNLvsR4d37PI=;
        b=LpZwFa5+EqQ/2vnpow2yZxSy94tzJ3P9AJoh/A9FqhICQ6W6NCoKpMnaYHdNQUk7vo
         +kiRjH60V5nKAfHBRHq8RzksGafAO8eDRL2dZ76fmLGEdAJrkdUw4ML2RgXvbSIjkC6w
         qsASxVR0H5E8/aWQ5/I4cs3DW0guoBhjkwtPrIVsU3FCk7M592nXsaz3FZ2ckaXXkWiw
         xYT4xpDOgLn0YI1iplJzo/ndppzy9g5R3somojt5m+tF9djQ3j8yq/mdvf3wA1md2sK5
         tSINyL53Mf/kWBcKLgP4+vYR1vLoXsYGt+wwHsz8bwaiMCFvXaAWnsfflwhNsgCO+ACm
         gN5w==
X-Forwarded-Encrypted: i=1; AJvYcCVluqyJt8XwHAyUk9v+e0YCn3rnVqNzuVKE9EWgyyvTvaUb57letR25K6kgKbwgnqEic0XoutUS7e1zvD4=@vger.kernel.org, AJvYcCXo/oSK1iscb95BL0dQH2cY6c6noGj6oe5wPv4BiE7oI3N3HJCkZThdZn2ZZqOuYm0YAQd5Qo1Qtv7f3tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNktzGfBIPtmUMrN9Zq0C5pV4Z5ksqunq42PUVfJk0MRNecoT6
	IO2jHjJUfAOHRpbp48WrKW+TpbQmYTtImcz3jvTIToj1eiLLV5pbVh78
X-Gm-Gg: ASbGncsOHyLxtL/ylqLttY3J+rJsIuYDOKRYlXfxylDIwkD6KnrNS8GYRwBYoF1b5fp
	LWVo3nBm+o6E7LCEK5SexiD1Mqo4PNeoUQ/WQL1SqWME4ZfBhFuqBLl8ykHx6/KLr542s/X5lT1
	nI7chq7af3wuaJg5meSuAeKiHtvjYbYMmCKOuV6McdXDwUg9AwGypPzpF3R7rl6uQFdAPvX28b9
	1RBEAx1hqwcBg5sx19bCmtACv+kkQWfHv+v/QQPMxwycG8J74fKYcNc6ElerqSUjKy3JzvMpH8m
	LhMFZN3PNRp+gJa7NAMI/3C7GQ/0nc2L8HhK4RCdL6hmAVgByX9K9M3K+XC+uzfOSOCJ0ciHC7C
	S
X-Google-Smtp-Source: AGHT+IFUw6qdop+WoEmBwfciQg2VXbNbCLvf7lkfO87ikecmOVb3bEOq/bqWAK5K0wr+5RlQ2Y3xCw==
X-Received: by 2002:a05:690c:4d06:b0:709:197d:5d3c with SMTP id 00721157ae682-712c63bd66emr71461467b3.11.1750454361892;
        Fri, 20 Jun 2025 14:19:21 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4bec110sm5766727b3.105.2025.06.20.14.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:19:21 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: usb: dvb-usb: fix null-ptr-deref in dw2104_i2c_transfer
Date: Fri, 20 Jun 2025 17:19:19 -0400
Message-Id: <20250620211919.3200929-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. We add check on
msg.len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..7c9d09d49da4 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -405,6 +405,8 @@ static int dw2104_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[], i
 	for (j = 0; j < num; j++) {
 		switch (msg[j].addr) {
 		case(DW2102_RC_QUERY): {
+			if (msg[j].len < 2)
+				return -EOPNOTSUPP;
 			u8 ibuf[2];
 
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
@@ -413,6 +415,8 @@ static int dw2104_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[], i
 			break;
 		}
 		case(DW2102_VOLTAGE_CTRL): {
+			if (msg[j].len < 1)
+				return -EOPNOTSUPP;
 			u8 obuf[2];
 
 			obuf[0] = 0x30;
@@ -427,6 +431,8 @@ static int dw2104_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[], i
 		 * case 0x60: ts2020, stv6110, stb6100
 		 */
 		default: {
+			if (msg[j].len < 1)
+				return -EOPNOTSUPP;
 			if (msg[j].flags == I2C_M_RD) {
 				/* read registers */
 				u8  ibuf[MAX_XFER_SIZE];
-- 
2.34.1


