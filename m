Return-Path: <linux-media+bounces-34846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5828ADA597
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15881188D710
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3023214209;
	Mon, 16 Jun 2025 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBalmuQ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510B20C47C;
	Mon, 16 Jun 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037556; cv=none; b=Apiw2g10yUwg8txZxHyX6fbsbCFWnHiV/WTkHR3rfQwjfkjMwGeueRsUcuWUr0RxpxM1TDM49DMIXbmWFiVpsJCIQiDiUYugHm1vkMnYW5zGphYwH3Wh/gS/SVkm8khnU8jabwdDIeNdpzjQPjG/jTRzY0Am6EH2hLtVjo3r8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037556; c=relaxed/simple;
	bh=Xz/+0VnfN3IGXDiU4+xuJK1ttGz7b0rROQ3kF9fgDeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rNctpY3j0HEnnha+7o5LCMrOCzFc+gGKD2xBTt172vHzErYoDZyNCW/wiCvbfEkajpA21+kZNuFv6UwrC0vRrqTQG/cfDcoeT45Nw+AzwqIZA4s5t9odktk714zvHM8XHx0/zQ+E2sRlNSd0vhe+QQYHWwsqoLZN/R7NerPsp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBalmuQ7; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e82596e88c4so102039276.1;
        Sun, 15 Jun 2025 18:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037553; x=1750642353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLFx3iAjCfOZeU9+t09vSiac2GGwgfHqdEf7KpounTM=;
        b=ZBalmuQ7AJP5ud0wriVEdC7uPIiIcW/uf9UQSTJxaivcoUZUXaidiRwosuxyeKmjeU
         XwPvHqJzMNz9j0N9vq/FcKDTtoxS3IB83CTTrmO+wdE4gr0wuJUZ3TqYWb5kThiqWk43
         X7Q0om28MA7B1OEbWeNliSnF0CtCm+wgJLeypbZQYwiKCbB42yleLEB4hM3CVVSKByhO
         3gcQaPcXbtSDT9CKWlXLVA8I0EEnTGN7JJJsIWRMwBF5rlBM2X/rjcVIBHo28eKgpFwF
         nyBzEN1OdL1+G+W9rEOPVzOuLVgSB5MtYU06LipcdpffKv9zWGswNIA94qpXA5ggGq10
         okrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037553; x=1750642353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLFx3iAjCfOZeU9+t09vSiac2GGwgfHqdEf7KpounTM=;
        b=S9qMlRxDZaanVJWpVXq1e8NbZXYKwfGzBttb/ZJCAFPGEbispd26+v5oY5Qr5Qmbqf
         2gPNwp3qnCMqf4rznbZyy0p8OGMsu3eIu0/wnhn7kbRzfcKIxklKoXR0jBRJGYfkT5xX
         5bQPWCAlMMytJC3/gxw0hXvEVv/zvMyiSTPMu5XszkwT/5DYs8373gkfcO9cWOMoe50R
         /VOJX6/NorHGzRlEbNzC5vQo0UKw+YF3H1z/I8tRNc/2DSqW48WeJyDs8haf6O4un2Pl
         xCXChqg6rEv0wBoOWlyTNbtj9dWcfUG+ah8j1SWbLCOr+apdbaXwZQ5yfrByIBPngnwA
         ZKqg==
X-Forwarded-Encrypted: i=1; AJvYcCW+4dHSz2U2GWTityRfE+lyPFM1C7P2kVN31faHLoCBLgqI7xifdqm3YJFpTK9MzT2G6vKK1sXYtK5rkaI=@vger.kernel.org, AJvYcCXBF9/9nEBM2xSfDiaTF0UV/9MwU4WepmE3qRoJyHsk3n52zGAjpbIiFDg27OS7pzCK0ajvLSR0fpglE7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbA78KB9xa/zAChgV8TJZ7ms41R0qcWWiDfc6Y6tAX66BQkTA
	JbgOOSdRDjYp5IuSJmvJZW00b36zfc4Rj2RkZsX5gpw248AlObpoAJcDxF66zgFO
X-Gm-Gg: ASbGncvsNGaWaDTRe0enmV5dF8v0fm+/I8jfrqxs4w2vgefcrjp/GkOw208U1oSKtjQ
	JJ4aTDF2Ix4u2cemTlhvvs+rOFA6CsxBtJBGQaF0Puh+NKsryYRUoWzZ9aumTT4OEGPfks+y+Zk
	6JpTyDWqI+pZjiw/rvsvrWLIyrG8bGc+qddO7eqj6ocVchF13EGVtmpRwBQL7U2K+Fqczc8Qu65
	EjqPgY07k2Eh7o62EpKHErmEnw71HMR51urse7dU3IT+PsSMQcMkciKI8EvY2X0+VHq9NF5QLeO
	MKcK04TCC99D7/BXKvZPF7WKd1jmjtugBT/UAUjMm2/bafKmEiSkKaYyVUoie6q5uru0dpF70cs
	h
X-Google-Smtp-Source: AGHT+IGy//j57u08M2fMBsU0VzJ3rKwrB/0RUTbUXhHpz8PWQhnAdXbQeaFUzn0oqyIvzVVjTmOTtw==
X-Received: by 2002:a05:690c:368a:b0:70e:195:e924 with SMTP id 00721157ae682-71175493fbfmr106631037b3.36.1750037553667;
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71182da452bsm5692997b3.30.2025.06.15.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	algonell@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: dib7090p: fix null-ptr-deref in dib7090p_rw_on_apb()
Date: Sun, 15 Jun 2025 21:32:31 -0400
Message-Id: <20250616013231.730221-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dib7090p_rw_on_apb, msg is controlled by user. When msg[0].buf is null and
msg[0].len is zero, former checks on msg[0].buf would be passed. If accessing
msg[0].buf[2] without sanity check, null pointer deref would happen. We add
check on msg[0].len to prevent crash. Similar issue occurs when access
msg[1].buf[0] and msg[1].buf[1].

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/dvb-frontends/dib7000p.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 46753d2ae212..9a309e23443a 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2256,8 +2256,12 @@ static int dib7090p_rw_on_apb(struct i2c_adapter *i2c_adap,
 	u16 word;
 
 	if (num == 1) {		/* write */
+		if (msg[0].len < 3)
+			return -EOPNOTSUPP;
 		dib7000p_write_word(state, apb_address, ((msg[0].buf[1] << 8) | (msg[0].buf[2])));
 	} else {
+		if (msg[1].len < 2)
+			return -EOPNOTSUPP;
 		word = dib7000p_read_word(state, apb_address);
 		msg[1].buf[0] = (word >> 8) & 0xff;
 		msg[1].buf[1] = (word) & 0xff;
-- 
2.34.1


