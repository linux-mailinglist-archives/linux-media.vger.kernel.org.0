Return-Path: <linux-media+bounces-43209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE36BA0F9A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 20:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD24B1BC69E2
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 18:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DF8313278;
	Thu, 25 Sep 2025 18:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwbB+lDF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8762882B4
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758823844; cv=none; b=WY3PBCAVjchCWMVV5ELeFFizdTwydtm9omoe+Kt8ceVCe7K4jocleEQYerIcjtBVe/iUUlBYQldopWPPUgxQSi/m6b8ScJq7+DkWzViCAXQfAOLqWN+mO29QPWo702J8AhKwq6mDeFflsot5qRPPNmLPqHKMJtopaEO6B7iErYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758823844; c=relaxed/simple;
	bh=3u2Z1Pc8D3oNqINJbtnWAt49YQPsAhRBwY5G2ZGbttA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTcXT7/7A6LqigGhnOOLS0baIw9COqNu3ouSMLLISKGWgoT1LEgvxnZFdAjHxgG1ibBaAgmfD2RCe1nmJRjnXbRKDOzUhokyXUzkUWNg9uU/k6XHZ8egdh3bBM5rlxLDa/TlTN7LLU+9yDw0z0XWQmaxgRRwzLsobDOkYo7dZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwbB+lDF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32ee4817c43so1096397a91.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758823842; x=1759428642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3D+6J5+0iW5mAwUnARNGWccQaDqo6C5S8jNBMNLkLcM=;
        b=ZwbB+lDF0wj/an2rJyB4tNAywaRK3XJNM7TRYKfG/Ax8nPmCrG732RO0tL00Rqkegt
         SRz15X3Q3vvwJpADywwwymU/WayUZM+b8QncXCHeix3Uc/ZiGThiCkW8UDLxP2CSsvcU
         DG8y6lnI2Z9OApBeILVhjfmM41/e2/RVEHoS05ALMbjRv5JfeaExNOxiYFLfq9Y7np8R
         M5dAihIEb8SEwhj1cVpjOZT59B5Q2WQZzAgwA7t1EofYP7fs+k6uaJRTztjSgOq0fMhY
         odK57gHPlt5qUhmbOnmQUFJNGRysrOEd1X6Qy5fq4HgWcGp4hw5mvLoEZBp8XX6QZOHF
         5qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758823842; x=1759428642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D+6J5+0iW5mAwUnARNGWccQaDqo6C5S8jNBMNLkLcM=;
        b=LwNN84rToERHd5eB1Bge/L5IN79/OP7oSzuwngWGqKHien/MdYK2tX3KtMNzs4RxTF
         KJxH7wuQNz1m93etY71CfZxv9748R3npODTpFN7GSUPNA5XZs/Jvf+i75QPxT5HU6BT6
         hjfUuBOVAjd8f5+Gpa8BgV/4dQelx3az++KmHBZ3kZSVeKv8VqSsy6JIH7qbP+nJJbQ4
         On8wSmZ82GE7XawHBOfakZoSzBQuNYg8JnqfGsrBZp2vf3q5KJP6V+I8XFGjJF1TouKj
         da5EkR7cdeTl/t/Mkeg9ORwAWQx88t4fGS4KEHtXQVwB+HcCpQjuwEySoPkCx363J8eI
         0Lqg==
X-Gm-Message-State: AOJu0YxwMeyzatEece6+L8wLo+yeV88L2cYaj2zepwOiTWfcByjHxSwI
	TojFG2K8iLR6rHcQlcPVsbT7S3kJ2BmU+yHlxndpgMPhhP5TgYnmH7iM+e0CR5VUoJhl1Q==
X-Gm-Gg: ASbGnctBwlne1C2L/V9DX7M9VJRMzizX6Ju4Y5noYElw8FAglXyntyoHzd8xmVtGM6L
	5ZM6t0ABnHgTf6i1wZEG7MevHCFtypL+k8fohd0o68i7EQ/7OejPed71zWcAs9c7CjBcn63wUVu
	pTzkqG7zLwdhwkcPZz6tIx09GMSgjDZvAgqpdqMsSdW+flTGDAw+p6Rrza7IZSalwQHaxAHkSIl
	9Ntoc+8pOSM44iMJEkdCqdWqU8OIxT9Qv5bvHoUiL8MClr6ZQZBRBk91qa91sHmtxtuhuRv97Eq
	jIX1x4d1hRVOHGnyVbDtY0SrTDio3FKiL5ivWcb7w9WwulpQagB23r1u/5ma+vPDBD+0lS5cFgA
	CxnvDUWEaZfHUfuhPKmRpQmO0Ok3T2xtZi+8F+uL+ASS6sg54ptIR9gqocg==
X-Google-Smtp-Source: AGHT+IEvI/Zn0/bwZ03S8X+dYp1EKKmZPn61r8TgfpwHOcE6n4vYwztpEi25wZ270KfumXzxyfsgsQ==
X-Received: by 2002:a17:90b:3d0b:b0:32e:dcc6:cd3f with SMTP id 98e67ed59e1d1-33456f55426mr4017199a91.14.1758823842519;
        Thu, 25 Sep 2025 11:10:42 -0700 (PDT)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.63.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347254dd4fsm3059574a91.12.2025.09.25.11.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 11:10:41 -0700 (PDT)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH v2] media: dvbringbuffer : fix space issues
Date: Thu, 25 Sep 2025 23:40:27 +0530
Message-ID: <20250925181032.7862-1-nikhilsunilkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the space issues detected by the checkpatch tool

Changes in v2:
 - Split multiple assignments into separate lines

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_ringbuffer.c | 34 +++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_ringbuffer.c b/drivers/media/dvb-core/dvb_ringbuffer.c
index 7d4558de8..99c2d700c 100644
--- a/drivers/media/dvb-core/dvb_ringbuffer.c
+++ b/drivers/media/dvb-core/dvb_ringbuffer.c
@@ -37,10 +37,11 @@
 
 void dvb_ringbuffer_init(struct dvb_ringbuffer *rbuf, void *data, size_t len)
 {
-	rbuf->pread=rbuf->pwrite=0;
-	rbuf->data=data;
-	rbuf->size=len;
-	rbuf->error=0;
+	rbuf->pread = 0;
+	rbuf->pwrite = 0;
+	rbuf->data = data;
+	rbuf->size = len;
+	rbuf->error = 0;
 
 	init_waitqueue_head(&rbuf->queue);
 
@@ -235,7 +236,7 @@ ssize_t dvb_ringbuffer_write_user(struct dvb_ringbuffer *rbuf,
 	return len;
 }
 
-ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t len)
+ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8 *buf, size_t len)
 {
 	int status;
 	ssize_t oldpwrite = rbuf->pwrite;
@@ -245,7 +246,8 @@ ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t le
 	DVB_RINGBUFFER_WRITE_BYTE(rbuf, PKT_READY);
 	status = dvb_ringbuffer_write(rbuf, buf, len);
 
-	if (status < 0) rbuf->pwrite = oldpwrite;
+	if (status < 0)
+		rbuf->pwrite = oldpwrite;
 	return status;
 }
 
@@ -258,8 +260,10 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
 
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
@@ -278,7 +282,7 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
 }
 
 ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
-				int offset, u8* buf, size_t len)
+				int offset, u8 *buf, size_t len)
 {
 	size_t todo;
 	size_t split;
@@ -286,8 +290,10 @@ ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
 
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
@@ -309,7 +315,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
 	rbuf->data[(idx + 2) % rbuf->size] = PKT_DISPOSED;
 
 	// clean up disposed packets
-	while(dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
+	while (dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
 		if (DVB_RINGBUFFER_PEEK(rbuf, 2) == PKT_DISPOSED) {
 			pktlen = DVB_RINGBUFFER_PEEK(rbuf, 0) << 8;
 			pktlen |= DVB_RINGBUFFER_PEEK(rbuf, 1);
@@ -321,7 +327,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
 	}
 }
 
-ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t* pktlen)
+ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t *pktlen)
 {
 	int consumed;
 	int curpktlen;
@@ -339,7 +345,7 @@ ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t*
 	if (consumed < 0)
 		consumed += rbuf->size;
 
-	while((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
+	while ((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
 
 		curpktlen = rbuf->data[idx] << 8;
 		curpktlen |= rbuf->data[(idx + 1) % rbuf->size];
-- 
2.43.0


