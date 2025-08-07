Return-Path: <linux-media+bounces-38994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC3B1D257
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 08:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344A6189E737
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 06:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10AC223DF9;
	Thu,  7 Aug 2025 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWmUd1FB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0A2222D0
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546992; cv=none; b=cr++WJJHKGmhnweYrnYD7UtswbLzxZsr1HjSBgHzDluR95BiORTmmQ1M6J3v57DTGcGi/Dxbqc/WIjNHC3KR2nOcjNNHey+hXcQxYdDmOkXhhiTOZNN7Wtq+vvZdEQJIcNGHc1OV1SX3rkMAHT00X3dPjyG2waCDITFfXGAmuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546992; c=relaxed/simple;
	bh=G+SAfki3g07RA4WF9J7OFXM79rE373qEoVoJzOAWvL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDfCHRvR0Xj8GnUB2E9aUyC7c8BEHonpvEsZk7tSe7n/NCMu7EUqluQqKI7ZLWs1rfuawhG8i/xgcVKv9ebk2GpIF5egFI39jsL6vum1DYK9UT9B5pKnmhhk5KNaZctO2x9s6nB0P0JZWO8L+tJ+5K+lqZjYRihDBAY/nqSt4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWmUd1FB; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e8053d3382so174974785a.0
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 23:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754546989; x=1755151789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DZbQ1MpdQu1HuPfiMWgvkm1JgnpSAWJavzmYRzmxs8=;
        b=AWmUd1FBfa2S2OhBMTlrSmYNf8nKys1XsXYuBLSF2E40QORui1dB1HE0FjQDy3gcYW
         7QndYs+VBKR5IVUKCgYwi61wXJSwZ7KBtmNzcp9RTW7f/E8LCtRrb9eipxzyVFhuTdhw
         viOB0jAvNbQSweD3Q+ahGnA/KmhZZLLin27yp+nmvu2ZkKZjj2P5aqIxtgz1QakXkmYK
         04IzAPEhhvG6F6ZvZ2FUF7rL49BrcawHsF63hvRyDIFY/UM8UKlnVsLmtLbBNyYIo3jV
         rrctMt9MD2I3nWWkHtfAIDuXVtrOdPVy088+Mzx969h2tDJzr21ItqrsRepgh/wmDJ8q
         vPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754546989; x=1755151789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DZbQ1MpdQu1HuPfiMWgvkm1JgnpSAWJavzmYRzmxs8=;
        b=pOsAgd1Q0xDuCf5pWcIY8jFwdzepmLVOhUD+wp0YLvo7FYnrVCgMGuuKxIWN21dFf0
         sx7XlTYikKl48JvDRi1/nD/4N6opEPP22dFjdbPwg1B7kJKnpFTRWbtmN5cKsbC2sCb4
         8rO11JrUtPfvzp75FbcFdOUZTkkjLE+uU21JFPxkLjiwdjDsuiXZd7L9XUBBFUQvPbX3
         lGlUFUef2XC10j4dxCueQHieelaUj6+QWuvtBkB3odMdFJUu0tQBPkdtujKWMTg4ol2l
         3faPIe7fO6AFOn8Rsm8SwBjHFPW7yjGMgabJtQayT7oFFe0kkWD92NYQzFPDQ5DW0hxL
         w9Dg==
X-Gm-Message-State: AOJu0YzGkX9mcqR26gNkp51M9vHCHD5j/FmSMXRj4liWJ0I3XgSqCtPf
	rRsEct8pSWVicICekrlEUX/Rod9aa0qsQI2QAhV3R512HRADMd8DxBlP17aCQ0Bn
X-Gm-Gg: ASbGncueF9KCGe158ajWhWfx2MW1/AuPMCKlBNV8nnqhmNyGvW8xn3lT/EYn94PDUFf
	aliDBZys6K0aYnV4GBmqXRQXSnMyrnsyZY/2KQ0gFpqi/7NZ6ueYGKb62f7Z71biSNf5WY1KQ5T
	fsXnLeAa9UlfArmu9H+k1blu/3YUj275UlBpKojypvytHOE7fSXCcUIXvHvKLkWP282qAGwiG+n
	X43jOilptsT0EwGHD3ZW4uY73SH3RuY0NVB5cYyFweWA2uk+sb6+tXi0d9qKdZth+JPxf7dk+Mp
	TB2rTpE4p1firN7inDTILa5tmRinXUxdWnmy1fLG09ldLyKHpxh64v9e5hg7hsBnia0H/cmxs1V
	pC8GIhzkZ43SMsVrf+kJGkA22UFSZuFle3aoCGBVLDPKvCMHLwk3R8RH45BUn
X-Google-Smtp-Source: AGHT+IEFCJjDY0AYIa9ftdq48/ZjuSTo9MQoysJExuptJeUll0rlosqIojx0lNs4ajWI00yFuPXFyQ==
X-Received: by 2002:a05:620a:190b:b0:7e6:9de3:aa0d with SMTP id af79cd13be357-7e81ff82ec2mr298274985a.26.1754546989509;
        Wed, 06 Aug 2025 23:09:49 -0700 (PDT)
Received: from fyre-x-redhat96-nsd-1.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e69716fa4asm674039885a.58.2025.08.06.23.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 23:09:48 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: mchehab@kernel.org,
	viro@zeniv.linux.org.uk
Cc: linux-media@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] media: fix uninitialized symbol warnings
Date: Wed,  6 Aug 2025 23:09:36 -0700
Message-ID: <20250807060936.3728239-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize variables to fix these smatch warnings
drivers/media/i2c/ir-kbd-i2c.c:339 ir_key_poll() error: uninitialized
symbol 'protocol'.
drivers/media/i2c/ir-kbd-i2c.c:339 ir_key_poll() error: uninitialized
symbol 'scancode'.
drivers/media/i2c/ir-kbd-i2c.c:339 ir_key_poll() error: uninitialized
symbol 'toggle'.
drivers/media/tuners/xc4000.c:1102 xc_debug_dump() error: uninitialized
symbol 'adc_envelope'.
drivers/media/tuners/xc4000.c:1108 xc_debug_dump() error: uninitialized
symbol 'lock_status'.
drivers/media/tuners/xc4000.c:1123 xc_debug_dump() error: uninitialized
symbol 'frame_lines'.
drivers/media/tuners/xc4000.c:1127 xc_debug_dump() error: uninitialized
symbol 'quality'.
drivers/media/tuners/xc5000.c:645 xc_debug_dump() error: uninitialized
symbol 'adc_envelope'.
drivers/media/tuners/xc5000.c:651 xc_debug_dump() error: uninitialized
symbol 'lock_status'.
drivers/media/tuners/xc5000.c:665 xc_debug_dump() error: uninitialized
symbol 'frame_lines'.
drivers/media/tuners/xc5000.c:668 xc_debug_dump() error: uninitialized
symbol 'quality'.
drivers/media/tuners/xc5000.c:671 xc_debug_dump() error: uninitialized
symbol 'snr'.
drivers/media/tuners/xc5000.c:674 xc_debug_dump() error: uninitialized
symbol 'totalgain'.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2:
 - fix commit msg

 drivers/media/i2c/ir-kbd-i2c.c |  8 ++++----
 drivers/media/tuners/xc4000.c  |  8 ++++----
 drivers/media/tuners/xc5000.c  | 12 ++++++------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index c84e1e0e6109..79b3716fce2d 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -321,10 +321,10 @@ static int get_key_avermedia_cardbus(struct IR_i2c *ir, enum rc_proto *protocol,
 
 static int ir_key_poll(struct IR_i2c *ir)
 {
-	enum rc_proto protocol;
-	u32 scancode;
-	u8 toggle;
-	int rc;
+	enum rc_proto protocol = 0;
+	u32 scancode = 0;
+	u8 toggle = 0;
+	int rc = 0;
 
 	dev_dbg(&ir->rc->dev, "%s\n", __func__);
 	rc = ir->get_key(ir, &protocol, &scancode, &toggle);
diff --git a/drivers/media/tuners/xc4000.c b/drivers/media/tuners/xc4000.c
index 3cf54d776d36..b44c97e4e5ec 100644
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -1087,12 +1087,12 @@ static int check_firmware(struct dvb_frontend *fe, unsigned int type,
 
 static void xc_debug_dump(struct xc4000_priv *priv)
 {
-	u16	adc_envelope;
+	u16	adc_envelope = 0;
 	u32	freq_error_hz = 0;
-	u16	lock_status;
+	u16	lock_status = 0;
 	u32	hsync_freq_hz = 0;
-	u16	frame_lines;
-	u16	quality;
+	u16	frame_lines = 0;
+	u16	quality = 0;
 	u16	signal = 0;
 	u16	noise = 0;
 	u8	hw_majorversion = 0, hw_minorversion = 0;
diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index 30aa4ee958bd..bf4ff461e082 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -622,14 +622,14 @@ static int xc5000_fwupload(struct dvb_frontend *fe,
 
 static void xc_debug_dump(struct xc5000_priv *priv)
 {
-	u16 adc_envelope;
+	u16 adc_envelope = 0;
 	u32 freq_error_hz = 0;
-	u16 lock_status;
+	u16 lock_status = 0;
 	u32 hsync_freq_hz = 0;
-	u16 frame_lines;
-	u16 quality;
-	u16 snr;
-	u16 totalgain;
+	u16 frame_lines = 0;
+	u16 quality = 0;
+	u16 snr = 0;
+	u16 totalgain = 0;
 	u8 hw_majorversion = 0, hw_minorversion = 0;
 	u8 fw_majorversion = 0, fw_minorversion = 0;
 	u16 fw_buildversion = 0;
-- 
2.47.3


