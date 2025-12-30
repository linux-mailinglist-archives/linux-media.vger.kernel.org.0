Return-Path: <linux-media+bounces-49768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD6CEA8E6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 20:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D49353019E12
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 19:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951112F9DA1;
	Tue, 30 Dec 2025 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDLsNZf4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22A2DC344
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124265; cv=none; b=c9JRop3TaGTe6b4MXbnKosacFHgUjDJ56JUqj/nCYzi+XqxnGwIvx1wfosu+uxfBt2Cjbim3AlpUlw/e9W708rFKvZrklu46Km1HhnevHesJ5SiEBTiGvobA8mgK/+1bJT4Lh3JWjGCgJHPgKf/in6QcopJCL/O2zO8R8FFNBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124265; c=relaxed/simple;
	bh=0XXYIGJiEK0fFuyobO1OkCvR2WcDspAxEe6h9kvH/hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2ypVcQyxJuG3sNJCSTnTc6Z9slyRK86LEkvsB1Q9ZDMdIj39F9B/JsNW4n0JFGwEdObNnUzrGvFISV/88eOrPyc6RnsKbYrkOu5mw36+oVA9/GDzCY00ncGrdj23lTRUa3ABeBY7Tum+46oVSR8v3LfBbmU3YEb85WVJbSj5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDLsNZf4; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c2c36c10dbso65591985a.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 11:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124262; x=1767729062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxzOaKVIkI1DoknUROyjv6X6DFGJhZO2mGfXN0iVyxI=;
        b=aDLsNZf4/52dbaI1r9fdFQ46EHSuz7ywUP5B5n9umA4sLh70OqmV5XLdmDNALh3HDw
         WqHKaNlcXWFRymu/ULsqlTlhnPGWa0yHm5+Ss32xUXZhVJ/E25Gp0521sEq96OQ49+pq
         Un0rXSewGA3pUtkvATs6taVdyOU1/q1n0F8QOVagPECfQeHuYr/P0Qi+JOqPfiXzdRBt
         dwB48Eo3rdV91VZUMgaXy9kL1iMxoDsbI6xXDkRrctIvhJJ7cK8TG/02VVV4LRENO5ua
         42i6WKc28YcnB/Y4uYUXSRwSHAL7XTvSRBe3B+I6Ok3HPJGTot55tIlBoZt3X6srEVwJ
         o2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124262; x=1767729062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxzOaKVIkI1DoknUROyjv6X6DFGJhZO2mGfXN0iVyxI=;
        b=jfc+17OXJ00oifrwsb3XM7tc0nxMfifXdu05H9+qw7g2ejRR5YcMKIL2O8Sic1j0tF
         7+GHNxSwrChaomruaymOytkFy9Pu3FqlxGNiUmp6m/6WG+F1uU2iDMMXtn1mZtc8k6+q
         912qqTZwktSAHwA5EmI4tbCV4XGHu8fjFUoNCciutkryweSG+3pl/AJIy0NkKBMo9MH+
         F/IyZ0mSAUrsaoN/4rSF01ll+Cx/hT6hH4xq08GNNjbs/uh0/DHt3bGue7GDAnXPdSeJ
         CkdTyxZ78M3IF7eTq7xpMPW19BI8tw9TPVtzN3rVhBKEJTZtfCAv9cCP6Ajjoa0eI0jO
         mWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBeSIelf+RjTzlYBEQXuxP2o9wP6y9zBGc8+tkpzFiHfVH6dUJ5AFsjC7dziWdsM1slRnZ3ClbXv1iKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzr74jAjZ+illV5lIsZ8hiAGKj7BJE2rH6PQxgs9XW/u4OMws
	Kzq7whGAmu9iMY9Voru3oNU9DAf+C3Jpc2dZlwIYsMbzO19AgXc7UguI
X-Gm-Gg: AY/fxX6J/Vk4YniyFCmED7lnF61FGjnrnu9qQjVr4JnQchBl96PP++x++PxiSlsYHXs
	PRPKmsw1BSdSnyoxlHLNJr0dFr0lt6iimHeJOdb4/0S9Gd9968qlGdd7pjkbReAPeiFKTwR3WbC
	fDnvBdZcS+CCTbENKD7cskuUuZx67H/ke0lYfF8EzyENurfL53vYJC2PCOhrz/5rXyyQEYN6Ft3
	+Mmj0MczRohctPGUjJMD2sXR5s44ohxopwuWKp1tX/wU+kamTf3XqA3J821qzdclMfee3hTQx5f
	+oFHoPZi4QpUq7rPn0aUPH4TeCsQa4FZMZ6Wck4snEmKepfnKn8FSenNPUGCJ9KRWaaRnW/PGfa
	P6dNdc3NOW5cqKrdOnzsWa8k7xs2fDkFXUCgaJufc6KgBLSOL4lilgXOX2dZF2jgqQfLWlsQsJg
	63/aCvTWtRjP2hqr2pYOBYTuUk8drM0nlBtEvyyxOQE/5uW9MXpDb/wl19RxvPP+t7gJlqsJlV5
	ONaAFlTvkd8dn00F/fMW809ujYwT53HEcORSii4Lg==
X-Google-Smtp-Source: AGHT+IG5PEE92J2hWvnLLk6xG/FXOFnBNkhm7EM6Xf87wnC/TjRMOXlh8oTHEPEkUKo5M3ntVzef8g==
X-Received: by 2002:a05:620a:3190:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8c08f65502dmr5765068785a.5.1767124262368;
        Tue, 30 Dec 2025 11:51:02 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ee7d5sm2647458185a.49.2025.12.30.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:51:01 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
Date: Tue, 30 Dec 2025 14:50:42 -0500
Message-ID: <20251230195041.36768-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223010121.1142862-2-eeodqql09@gmail.com>
References: <20251223010121.1142862-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `ttusb_dec_process_urb_frame()` parses the PVA packet from the
USB device. However, it doesn't check whether the calculated
`packet_payload_length` exceeds the size of the `packet` buffer.

The `packet` buffer has a fixed size of `MAX_PVA_LENGTH + 4`. However,
`packet_payload_length` is derived from 2 bytes of the input data,
allowing a maximum value of 65543 bytes (8 + 0xFFFF).

If a malicious USB device sends a packet with crafted data, it
triggers a heap buffer overflow. This allows an attacker to overwrite
adjacent fields in the `struct ttusb_dec`. Specifically, the `a_pes2ts`
field, which contains a callback function pointer, is located after the
`packet` buffer. Overwriting this pointer can lead to control flow
hijacking.

Fix this by adding a bounds check for the parsed length against the
buffer size.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Change warning function
 v2 -> v3: Add missing comma in the dev_warn argument
 v3 -> v4: Edit alignment
 
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index b4575fe89c95..17c7a8d5ada9 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,10 +703,19 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
-				dec->packet_payload_length = 8 +
+				int len = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+
+				if (len > MAX_PVA_LENGTH + 4) {
+					dev_warn(&dec->udev->dev,
+						 "%s: packet too long - discarding\n",
+						 __func__);
+					dec->packet_state = 0;
+				} else {
+					dec->packet_state++;
+					dec->packet_payload_length = len;
+				}
 			} else if (dec->packet_type ==
 					TTUSB_DEC_PACKET_SECTION &&
 				   dec->packet_length == 5) {
-- 
2.43.0


