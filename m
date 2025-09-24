Return-Path: <linux-media+bounces-43076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45AB9B17E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 19:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6180E1782FD
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 17:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8833168FC;
	Wed, 24 Sep 2025 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyFqbUnd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35A315789
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735684; cv=none; b=a01C0j48V/TlpwhlocY+VWDZQ6VTaVN2skUM61d2L+suQR/yHdyRGGPB2fhOOG7Tyb8q280znf72On5kRaNmQPWBKclrxh3Tl/Llux9d61H7CzxsXPDlupLqsLXnSt8r/ECKHFyT8FzsOG0M7L5IyBm6KmzJrv3qA6Nqxrigsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735684; c=relaxed/simple;
	bh=bQYk1EC/G2kWRYB45UUzoDmY01Dotdy7GHuXCL8h2zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqcFzpyJYjp63geBvsv9NYu1HRH08utgE3QPmw5drFOrVLYpa/J8cxGLQkjcUSF88zNwmpfcL8tsjARiz7AeIPS97kuZzonP9ozk9KTm9F5m47nNqm2XIJppCS29zYC4saX/l9Emym2cv9BU6R4TX/lAGpOoTI7TcaGGD183scE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyFqbUnd; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-780f6632e64so57051b3a.2
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758735682; x=1759340482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ty52FH05Tvs7xv/IdghzsK+lMAT5+OB4jQyAKfAPbHQ=;
        b=FyFqbUndW0zeVua9nrw7au3j9ZG22CzQIvGi00NjHH9eGG9S4bgn1D0v2qdQ9DjKH8
         AythRt1jNl6hg56uwf7u7qTvLtJrZLm8ZYOUiN3s+xiKSfMtijn4beclduqE9+IyaM/6
         Mf5dcED8zVhgO8+IPcEjmqP5VTYynjm0RpCIMO2q3JjkFE2JW4fl7blRPpCH1bSa+8Og
         3OOt0MViGEvsBcxaEuOogpZTZLgR86QnpRdtweyEYDskD99qCyIutdUIa+j+uJtEDVv2
         BPFjnk6GFLGobMq6ButsRLzCtgaPOtWZaBNO/5sGbEjM14NSSdmDxy8OyXY1KWaFX28r
         PamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758735682; x=1759340482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty52FH05Tvs7xv/IdghzsK+lMAT5+OB4jQyAKfAPbHQ=;
        b=aetnG2W+kF7i0K7/ZfcFq062d0MdaR7Iw2iws+pzpkB9pLvjvcvvNJnPOzVOOTpR+p
         p6UN4UTpNPM9IYuSyMC9os6v4PgqE81J08qJSobIAwKbjH3YzXwItvAnExWxNUvpLh4R
         M7SQkB/9MlN1ggyRTcNMqv3nPPavtjKtVFu1SGxxZrEqyrDgP8ZB42J/qnWA5/YFJdU7
         0aCHeCSdKUidgfmmdCbhiTmTZLMpwrda+72YeBlni52QJ9MzMqhhP8Qadg5mDCZqfPP2
         Cj1b36PQz75Z9yi4nYbNN+pb+ZV3VdM1u1DxL7WuOIqUf9qCyimeb5Y+ijH/0vTfLafX
         s/6Q==
X-Gm-Message-State: AOJu0YxUeCDS7HV1qR09nL70K81THRxlxPg5MIx7J+XBUbs/2EraSz20
	9RbbJvR49OXt/kJvYWZklwZqMjz7e8OQtPyNzyfAKB7sdQMpOsqnoqTW977dqLiYHpAD+g==
X-Gm-Gg: ASbGncv9d3xEYsxJQ66JjA0vizls9FlF9sCv4qvcOE73Hy76hF8pxXS6B63T7rmp/8v
	iCwTKtTC+dauF96RTaFiGXgjcwlYGbk8yE5RacSe7zGbBpE2bJ2UwyZ/Ks8U492LkeSV0qt/oMq
	TVvHL+3jpZPq2ocHIbEVRIyxhdZ1x/KEI5nAKb6cGgWIJHzASdGWZr4rj8jKlo6ULLo4mUi3z3C
	L3HqInQ0AnhVj5p8gZAJlq/5RuVbyfhnq3n1yzWg16EYXMMAm89qCeilvT/4xpgAVIoDTcr04VF
	RDCBpuR7gQtmDXC6bgboC7CRy/cibe0lD3ZHMH936Pcz5BNttsq8URAKTqb9rdm/BffklrgulaD
	u6PmBDY7fxOwAPnl2ae/03Vwsqbll2j+1wpsnaDTLwjUnNERRhxRiQz+rJA==
X-Google-Smtp-Source: AGHT+IEH7V8AaqsK8NVGCCYR/TOu4QgCBqsRmAXHSWKWcD9xohjCTkdmty7dG+stB3XxdKNYyTnwTQ==
X-Received: by 2002:a05:6a21:3385:b0:240:1d4f:720b with SMTP id adf61e73a8af0-2e7c4dac17dmr504768637.23.1758735682190;
        Wed, 24 Sep 2025 10:41:22 -0700 (PDT)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.63.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0da42fdesm14921267b3a.66.2025.09.24.10.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:41:21 -0700 (PDT)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH] media: dvbringbuffer : fix space issues
Date: Wed, 24 Sep 2025 23:11:01 +0530
Message-ID: <20250924174105.8302-1-nikhilsunilkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the space issues detected by the checkpatch tool

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_ringbuffer.c | 33 ++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_ringbuffer.c b/drivers/media/dvb-core/dvb_ringbuffer.c
index 7d4558de8..29b1fa028 100644
--- a/drivers/media/dvb-core/dvb_ringbuffer.c
+++ b/drivers/media/dvb-core/dvb_ringbuffer.c
@@ -37,10 +37,10 @@
 
 void dvb_ringbuffer_init(struct dvb_ringbuffer *rbuf, void *data, size_t len)
 {
-	rbuf->pread=rbuf->pwrite=0;
-	rbuf->data=data;
-	rbuf->size=len;
-	rbuf->error=0;
+	rbuf->pread = rbuf->pwrite = 0;
+	rbuf->data = data;
+	rbuf->size = len;
+	rbuf->error = 0;
 
 	init_waitqueue_head(&rbuf->queue);
 
@@ -235,7 +235,7 @@ ssize_t dvb_ringbuffer_write_user(struct dvb_ringbuffer *rbuf,
 	return len;
 }
 
-ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t len)
+ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8 *buf, size_t len)
 {
 	int status;
 	ssize_t oldpwrite = rbuf->pwrite;
@@ -245,7 +245,8 @@ ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t le
 	DVB_RINGBUFFER_WRITE_BYTE(rbuf, PKT_READY);
 	status = dvb_ringbuffer_write(rbuf, buf, len);
 
-	if (status < 0) rbuf->pwrite = oldpwrite;
+	if (status < 0)
+		rbuf->pwrite = oldpwrite;
 	return status;
 }
 
@@ -258,8 +259,10 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
 
 	pktlen = rbuf->data[idx] << 8;
 	pktlen |= rbuf->data[(idx + 1) % rbuf->size];
-	if (offset > pktlen) return -EINVAL;
-	if ((offset + len) > pktlen) len = pktlen - offset;
+	if (offset > pktlen)
+		return -EINVAL;
+	if ((offset + len) > pktlen)
+		len = pktlen - offset;
 
 	idx = (idx + DVB_RINGBUFFER_PKTHDRSIZE + offset) % rbuf->size;
 	todo = len;
@@ -278,7 +281,7 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
 }
 
 ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
-				int offset, u8* buf, size_t len)
+				int offset, u8 *buf, size_t len)
 {
 	size_t todo;
 	size_t split;
@@ -286,8 +289,10 @@ ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
 
 	pktlen = rbuf->data[idx] << 8;
 	pktlen |= rbuf->data[(idx + 1) % rbuf->size];
-	if (offset > pktlen) return -EINVAL;
-	if ((offset + len) > pktlen) len = pktlen - offset;
+	if (offset > pktlen)
+		return -EINVAL;
+	if ((offset + len) > pktlen)
+		len = pktlen - offset;
 
 	idx = (idx + DVB_RINGBUFFER_PKTHDRSIZE + offset) % rbuf->size;
 	todo = len;
@@ -309,7 +314,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
 	rbuf->data[(idx + 2) % rbuf->size] = PKT_DISPOSED;
 
 	// clean up disposed packets
-	while(dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
+	while (dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
 		if (DVB_RINGBUFFER_PEEK(rbuf, 2) == PKT_DISPOSED) {
 			pktlen = DVB_RINGBUFFER_PEEK(rbuf, 0) << 8;
 			pktlen |= DVB_RINGBUFFER_PEEK(rbuf, 1);
@@ -321,7 +326,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
 	}
 }
 
-ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t* pktlen)
+ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t *pktlen)
 {
 	int consumed;
 	int curpktlen;
@@ -339,7 +344,7 @@ ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t*
 	if (consumed < 0)
 		consumed += rbuf->size;
 
-	while((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
+	while ((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
 
 		curpktlen = rbuf->data[idx] << 8;
 		curpktlen |= rbuf->data[(idx + 1) % rbuf->size];
-- 
2.43.0


