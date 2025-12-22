Return-Path: <linux-media+bounces-49269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE65CD47BF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 01:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 548E4300479A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 00:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546E31F3B85;
	Mon, 22 Dec 2025 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+r9UdTG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EACC2AD37
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766362958; cv=none; b=ObY9DjoFDMUohvuQ5T2J1Mn4syr5q/65bUk1PfPpj2xpALKAqb9UFmA29SbmR1pltqr10AGuzIjS6aE1ztIyjw/+9uAXGECDgwpwhUrNBNciOvl3+5ZmtOMJLEa8giB5c0LeZn4cwwisFaDk/IA57Fd5TVCapll4cw9K1z8qSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766362958; c=relaxed/simple;
	bh=/4VpmscdJAmltw6qgbzHKyfcQ9dPgSNzZHqoCv3OIE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLSqpNBeKLyinKIjpbBw5m2o1iQugbaHFPxZVh+trEU6FjqSCtZCk4xY07aEUEfLz/fRNgffeS3xg2R5XUNaf0nooTLKHkJDBHyxHq/3AgBmdPDmFDJ8l88mhHKQepBsXRr/v6q2sRZo7XxTQb5tXPFxQyPbtpIX9Nz2Ppcb800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+r9UdTG; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8be92e393f8so350201785a.1
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 16:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766362956; x=1766967756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sD4hUVC58wHYj0/TBqBKJe071NUQ0n28qUzgcUEIws=;
        b=j+r9UdTGB+f+xI0OH5hbwYm2BKLyDpiwuoorkOFAubWBCCUIZB5UWdWAoC+hbE+B+4
         mhXzVGVtLle0R32QCHNg6SsnYOypCX54CbwjsmHOxP8bRtTojPZpkGdI+tRWMrnUydeQ
         3D+jlF1lMuU95BQGlAVYHYp+Fvg2ruVN6wLi2Gp2E6DIz+w33eXVD416PHTsz5TVqOAO
         OPv1SCausa2i9gMhMtKqWjVAOdJaoJzK7BENKyzn80wuJsp6YDaYMwxe51hScAYMy9vu
         FZzaQg2aYthQxGQYvDYKNhy/zkv2Fjet8ZEqbq4PRV1CtD0rRAA8LKU0D83DZ6oIEEWZ
         PoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766362956; x=1766967756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sD4hUVC58wHYj0/TBqBKJe071NUQ0n28qUzgcUEIws=;
        b=o546n6r0gZRDyMpibJzUCPX+ibBjK/wLRuJZrulznQWvJDQUqEJ4dzyhHNIGyBhh7i
         h1J1FiCQIXvliEzsECRqaI31yTk0k5HUHboPRrZbx2R0U8c7dTCqPoS87Jgsrna/KavH
         7najq5z7sKl5brhFOxVeIfn2jEq9QhsuhF5BlgJPLCZSF6k0Qo8XMcJuRu3RNNECu96s
         k8T4+gRIRfOGi+MAEFZyT5bs5hpi7uEfxgLBI04zJ99w01MiptoDvIHBz/nbRtLsOzmu
         fKJ6/24aRIj7Ak6Fw4QXkfLqHH1lbL5GDeG0PelcsF621w1DG/5PBYQ9oh3s0ZB+bXNm
         mwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPG0dMwV82xb1pAlh/jTTXI+vDld5NVSlCLDcGJX9Hq57+bkqFS5ENWoXQvEe1L/f6yZgSL16f/ziqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpxaqR5UfRMUamquB+B4o0hprUM8XucER+qVFG3zvJuQJHxz3
	9NhLInaPL98wmldv0BMP5jQ25F2lA02UwWM9hKXwBs40rvkS/hAXjTpZ
X-Gm-Gg: AY/fxX5HZL8l3L0v2bzWHnXvXEUBUk4Jc5cEbq1lrV4DPz0qUT450rMSsNQd2vPuGgK
	LimjDVpGguCe/nJceeDZGNmSdqZvIcs0X33UGGvmlALkgPE2zlO0O6/abuQ7YguO+umzkA6AvkR
	qXr2wWTPkpcpL/QDvryONjKl7JS+Vim7Pi1+W/AtiSIXvjx9xchxvh7aktfLJIWXjGy3TCblQ2E
	eNKWKX0Yd+UAhSqzMPEo2D911jEzklWoNjL1goFO9cn5TaEZn4eiGFqZxqcUXa0x0WT0jTzNBfr
	N+DAeINEO9R6IW/jHRNhBieXJKoVEMG2gQ/etxAPRKKDOC9XBrXBYF1NjAxDxxUlZW7h1AOWui/
	Nh+dRsQIyQDM1HcOhuNNTbW92U14s+gWtBja90p7jJ7V94maEjgD+bbK7US/kOCu0IfdSfhNr0A
	kUysOGB8WgSB6IORdL/WYiB1aXTVYIBnMdQeqU4lk8/l+0ASw50Mh+TADtQBoV3PzgaXEMYMy+p
	cZGDx/P9u7Q+k1ccf0HI0LkV9gH4PgCzh4aTQVZzw==
X-Google-Smtp-Source: AGHT+IHJJ3JeIp8QgT4PSUJx2el1EjjLL4jxtW3NEah7Hx+ksV/qcNiIL623TmA/6StQrVFzV1obAg==
X-Received: by 2002:a05:620a:19a1:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8bee79b99cdmr1940287985a.29.1766362956118;
        Sun, 21 Dec 2025 16:22:36 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c095b79b32sm708874785a.0.2025.12.21.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 16:22:35 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
Date: Sun, 21 Dec 2025 19:20:20 -0500
Message-ID: <20251222002019.882867-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index b4575fe89c95..77452ff2522f 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,10 +703,18 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
-				dec->packet_payload_length = 8 +
+				int len = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+
+				if (len > MAX_PVA_LENGTH + 4) {
+					printk("%s: packet too long - discarding\n",
+					       __func__);
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


