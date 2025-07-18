Return-Path: <linux-media+bounces-38061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CAB0A4D1
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4C916E6F4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 13:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492232DBF76;
	Fri, 18 Jul 2025 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV/PvT7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C5218EA8;
	Fri, 18 Jul 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752844095; cv=none; b=TdA2vtM/M/IDlt/2yRMqbkQ9/Ul91yo+TVU3n5LrRbVHtLT7M0k0ZAkMX/JTHyWzvtE+9TzfocvN8AvKpy9JuBtbIuyQaHhFmyesdSpOi5vKWImBjVaDWSSYqh0uJ75RW9YRgXVcAGTcr2SgY1yqdwFZO4OW7+yCc5a1JEygR4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752844095; c=relaxed/simple;
	bh=BGoXAIPMUMwVyrTqd9zgZfK7KQasBow3XqKhoUBGF58=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aI3JH+6QcG2fYDY2sr4UTHy+nDWhcTvhduV8DzxGww6GYjdrXftSWLgSjV7fNDEX3DRpvDpNo/etP0WCpO4va04ygEvxrvJCVoztXi69lYFbP8ICfzXZc9n3SGwg4CKTNJkEr1sV3UqgDJLRaBg4wJp7ysBKEA3jYPiM+uFSqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV/PvT7f; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1353347a12.2;
        Fri, 18 Jul 2025 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752844093; x=1753448893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKd3GvcYF3gQCFm0OcSr9YY+9zf3UHvOPRoBWIJzi6M=;
        b=QV/PvT7fvbS8XVCXH1xJkxCqmN1N7zX/4RVkMo/MXaO0q2BgiSbeYe+SfAyPivxAu6
         GM2l6MXDKcdbu9ONnHVMuiJB5788YX7ODbE+Nsmq2vsUaiMcDolIgAzw2W0m/CHnpi/w
         QP3QKBriJSpkmOkNgTCFk3/+0xCCVp2Jbzdis5QzgX+nYn5TdBHMxOVzq4F74Zz5SeO/
         /sXnTwnDGhH1y7Zmdzm0QPV+/05KvNA7W0WtAxxnYXqY2hRNEXBiqU7ozrfPz3Aqz/N7
         PkL8LTG/tVdqjVEhvZ+GXI+FYacMdqH8jkAHjnpRncW+2NphZ6mG1qDF3bhkutUedhiN
         vugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752844093; x=1753448893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKd3GvcYF3gQCFm0OcSr9YY+9zf3UHvOPRoBWIJzi6M=;
        b=CAJX5O9pYYgMNG8i16iUrtdgkQdL0AERsvS90EujjbDX8JxsJFn+9atIWJk+0oxixU
         kmWrt/rlaq7LzrND7fmreHRj5Rlqjqoguc4HNUBU6RavR2xPR51Y28Y9wmeTi7sz0u1V
         98tViBn2c+5XUbiC5Dx4EPDgcs68H2aYYf0TjDqF0LCYQCwURPDL1de28nXZNBW1WN7X
         2jefeGAN6eeHgjrRnBgtiigGIfqiyao+/M5pQezcuiq0G854T06TfiWTJ0Saf8Jq8NxM
         mnFh81HtU0/33VP1AvEZPd/vNX0sNWbDo/noqraCiRjTm3YeZHIEpz9wlj/QNmg3OIAD
         1Q9g==
X-Forwarded-Encrypted: i=1; AJvYcCVf9ONzh59D6meNoEek/r1xHNB4oSBiTBFM0XmoYbbL4g9OnWMaAXpgsG2FXm5Nxfa9W9sstY+u+PJxiA0=@vger.kernel.org, AJvYcCWWWTv8mzdTcmmU2eWMfJNrI48EqeZ5Ap4eYK5jsHmwdA1jLpjGc48ltlyZ6YqAxae57d7HUNJXQFH55lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgrj2c6XVUn/ZsByabeNbXO0zU3Ei773tb69vme3NkMHQnL8x
	hQZZZLR3pXF2JmMRruACtXGUWqJtqMaPT2bvI6NAGVKG8Qss3Z7Zd7MHjkb0En7OtmFbpA==
X-Gm-Gg: ASbGncvYdQVs42MBqBlqEnK4OHtM81miTS7LVKsVBNaZU0G/T3McyLxOsnshOQKrXvD
	548IW/KNAy57CmUlY9bMtTjmIGIvaoQ4Ff3BCADTMyTa+5QDelqqn+Ol1JSLNC7AA5rS2qMnj9j
	NCBytpFPCe0sV8h6pveAlK60ctUEo5fPwWVytTri/4L4dbc1d2PyEdW6YcbF3TClnSrFfX6gHKj
	q7i5X4TaIn5+hTe0czCDFNgiLB6lncLotGzatvhLz1D+GqokRBAXzUYzB+BDtvwOf0+v5KI72HV
	46JZD7GZoiDltJGvBhumDJPjtCPkOfTG7a+5vn2Hr2cnrpcCsfRYeovkt5Jc/+k7ngrfbm5DvT+
	N5Wn5IsEWOMCFlO4atGHQTs94y9qdmIqWXk3gbB2BNrWkCa6KGhdMedBl4jwrMmWUCIlqJog3JA
	==
X-Google-Smtp-Source: AGHT+IGsbO5kdgwYLDnOzUgEZqdvPKwh1sS8bHjGVzzPRV8MeKQtn3K5FzvMAFLMrUJDAdUvFor96A==
X-Received: by 2002:a17:90b:5244:b0:312:db8:dbd2 with SMTP id 98e67ed59e1d1-31c9e75b9bcmr15887851a91.19.1752844093398;
        Fri, 18 Jul 2025 06:08:13 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e4566fsm1302031a91.1.2025.07.18.06.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:08:13 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-core: dvb_ringbuffer: Fix various coding style issues
Date: Fri, 18 Jul 2025 13:08:01 +0000
Message-ID: <20250718130807.87691-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file dvb_ringbuffer.c has several minor coding style violations.
This patch resolves these issues to improve code readability and align
the code with the Linux kernel coding style.

The cleanups include:
- Adding spaces around assignment and comparison operators.
- Adding spaces after commas in function arguments.
- Placing statements on a new line for single-line 'if' blocks.
- Correcting minor indentation.

This is a purely stylistic change with no functional impact.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/dvb-core/dvb_ringbuffer.c | 35 ++++++++++++++-----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_ringbuffer.c b/drivers/media/dvb-core/dvb_ringbuffer.c
index 7d4558de8e83..ecb6f11abc24 100644
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
@@ -321,14 +326,14 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
 	}
 }
 
-ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t* pktlen)
+ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t *pktlen)
 {
 	int consumed;
 	int curpktlen;
 	int curpktstatus;
 
 	if (idx == -1) {
-	       idx = rbuf->pread;
+		idx = rbuf->pread;
 	} else {
 		curpktlen = rbuf->data[idx] << 8;
 		curpktlen |= rbuf->data[(idx + 1) % rbuf->size];
@@ -339,7 +344,7 @@ ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t*
 	if (consumed < 0)
 		consumed += rbuf->size;
 
-	while((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
+	while ((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
 
 		curpktlen = rbuf->data[idx] << 8;
 		curpktlen |= rbuf->data[(idx + 1) % rbuf->size];
-- 
2.43.0


