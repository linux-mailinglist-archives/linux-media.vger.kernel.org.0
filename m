Return-Path: <linux-media+bounces-30588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DAA94FA1
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D513188D19C
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06C2620D2;
	Mon, 21 Apr 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kklmQpf2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96661C2437;
	Mon, 21 Apr 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745232985; cv=none; b=ETkv3uANat1NaNKduN/jWF30I+qmL8WnhQHA5D9Tv8ZLIYgj0rEY2XvZYRjZRxmAODWO1sHYX/sQmln0Bb02XvGMUeoutIKjS9Nj/FRdUalyTVFM6ekj7NL8xpUJp5YmSy+pBIZcpbHXcCoM1BeeVVmalAEfCBL2l3GPeg1GE7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745232985; c=relaxed/simple;
	bh=CMPrIxNOoieeIyOCd3WGjEmr/YSLMAGHrsnQmlu3Gjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k93QMBCVN+Kawj6cAjKzd8SR0ErNjhppQvHgwA4Qfh9lzRDp8zDOJIaG2knz9KgbZCN7GTX2s5+oObserMHHuzlDxoLuWg4o5RLG+gfTdUuLh0LLAZ9UDk0baPskCkBRUB7DkP041/BAEreuYV45rELhcOvajOSe8WtTxqdzBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kklmQpf2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224171d6826so55100075ad.3;
        Mon, 21 Apr 2025 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745232983; x=1745837783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65w025aC3P2DfBTzXXd8QwjFY2MlEBQ0gDWSy2sjY+M=;
        b=kklmQpf2BCsE6pcdV+raiAf0l/ccBfKN5fA67/yCuKG8rodVjHi3nnzsU4VMD8Ntge
         n0cAGrMQc0iBgkf9dHSrwZjw+NACKiIdx9/8qp04XYzzn4sygAO83StVjlfTkPqK1Y4O
         I4/ihkS5VD3+ScvvtNuZDffA8qJXPjJKZmid4EkvqDQGifI/VIGC3LIhevx7Q8oDtWGS
         iDoqNgNeokr7vKvCKIeN6a//lJRBXTetyo94gxO/7xngBmgijpwp6DrJMiU2im9NVkSr
         wuxwhHMTSxK9dUFoMuWTeYi5wcnYau1nW26JtxKEHSwZOEYUNqVoMAbLuaTUOpBai8ql
         DNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745232983; x=1745837783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65w025aC3P2DfBTzXXd8QwjFY2MlEBQ0gDWSy2sjY+M=;
        b=lpyQm8hDciqjCm3YuadPW/5xEI7FtnCstL0LhP7hsLeiz2nF4TVkgMzqgEjvoOdOOi
         t5H7DLT5e3V+ukZtazeOfsuigB+1L9q6SRpvMxlfRaD0+TZBgaJTEPuKRsP3pbzzAOT5
         xJroO6GqLIsaR59ZmqAB6ZlNE8w5dbVJ5j4GL0584uaAfqH9DOnXj++wdjgCWvUIkFXJ
         pM1Wm6qbLkybvIF2ag0D0ZfekaXsyFa0SGj8i0+WYPdrBjeHkyLyTuL434Mo0GgeMe8p
         XNUmsvTYMj0QHr+LSrGV0SzOJ5JgKduw9ullJ+5xKyY0kFfriFEGvC1ojiYJjEFEYbYy
         QeQw==
X-Forwarded-Encrypted: i=1; AJvYcCVHYfbkmU//1ABILvM3WYcps+nPoCG45qfP1k5UBRN8Y1YRQhYhaa4ChOBJRrfSs/JiKqe8fjSQmKxTNpc=@vger.kernel.org, AJvYcCVM5BY9h7WA76+04BlhaijSxhWk1mxDfXlifGg4bETO4Eon/Psx9LUrpQDxi/fT+Dn1n6VW4+ZbPv9RcSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrIuehjUz3R+wajilhwiwB7VY/SP8so+2tKe0EOlFD3HQjUwY
	pm5O8f7S5ui5zeZAjdSD6bntrGtQwRFgj9rCJZeJbLZWd1XylQqe+bnqwbQy
X-Gm-Gg: ASbGnctKG4RvvhBrwC4EVniO1AzcpLKA0Z9BfEjBoVCHz16fTVS/JKTxOFRK06sixgF
	8Ky+FSZ0ufNo08lT1NQClvM1t5vMXmwTSrgfhuz2xDfsZtOQGcJAPCJ3bAfZvMMYD8vbid9n7N3
	winTRFV2+D043XE9bs0AdO+YnwWkCjBrHIurZsg233vUzdxMpddJSUkY/5j0EcpjYJejFDHWjaZ
	Rrwsm8EDIS3mKYEzwks7Y5s5+xew3ywviPDFWyxCbiv6hsFLdZ8TB0tDvJZNr83vF22CBY0gvmg
	i6X92+0dbjmq+Se12LsfGPY3TG/0ZV5WCUNJUhqGq4FcqOi2ffVMi+uM/zea4mrMuB+VHA==
X-Google-Smtp-Source: AGHT+IFQOA4mCLzNAr2CjpNSDw3eaK0OHIPjxDrr89NNpw1Kns/RKdnE+AfXrC/S4pqxYt1+wOK+bA==
X-Received: by 2002:a17:903:252:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-22c53379f74mr194956975ad.5.1745232983083;
        Mon, 21 Apr 2025 03:56:23 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe332csm62673235ad.257.2025.04.21.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:56:22 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil@xs4all.nl,
	zhang_shurong@foxmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
Date: Mon, 21 Apr 2025 19:55:54 +0900
Message-ID: <20250421105555.34984-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the previous commit 1047f9343011 ("media: az6007: 
Fix null-ptr-deref in az6007_i2c_xfer()"), msgs[i].len is user-controlled.

In the previous commit, bounds checking was added because a null-ptr-deref 
bug occurs when msgs[i].buf and msgs[i].len are set to null. However, this 
leads to an out-of-bounds vuln for st->data when msgs[i].len is set to a 
large value.

Therefore, code to check the maximum value of msgs[i].len needs to be added.

Fixes: 1047f9343011 ("media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..fba1b6c08dc7 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -788,7 +788,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 || msgs[i].len + 1 > sizeof(st->data)) {
 				ret = -EIO;
 				goto err;
 			}
@@ -806,7 +806,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 || msgs[i].len + 5 > sizeof(st->data)) {
 				ret = -EIO;
 				goto err;
 			}
--

