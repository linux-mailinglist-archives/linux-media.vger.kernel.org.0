Return-Path: <linux-media+bounces-38971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35553B1C9A6
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 18:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96E3189E21F
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 16:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEAE289808;
	Wed,  6 Aug 2025 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBUwxM2l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830052AF1D
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754497204; cv=none; b=W9OxYp7W3Mm3H5hUDQGKphFF4YwXavDA8k1AwiiYlFgBzrYucSuyRfUv4YQ+u8IAiPqXU+AgbNsNxrXtC2AlFQrZgPadAGHp4FTgbcTePJNvACgz2RakltgDqYq6KAxWxJ02ANDQlkJoORpvbOX2qaSD9HDbkQiIfz1sFKUa2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754497204; c=relaxed/simple;
	bh=1Pywg0YuUuu50sG0CG1TwX/aIPjc6Uh/koThz2evJy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=evCshzh3cMXD/k2riMA89dIrWiM/n8GFq3b76s3sEoXVPrtyVZR9l8fG6CBqKexOv/31ouVxOBm5jPj5w9Prixnlrh1G9dYCHwqKssQJMlwx9fN+OJrfqVjvVD6/sO9sl0z0YpackpeelPTYcO18VDw+NfZQyQvVFFzqR+u2bxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBUwxM2l; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70767eef931so1168556d6.3
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754497201; x=1755102001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdwBjFBMWL7CFZp2MDy3xPi5cII5a85518fOxPk4x1c=;
        b=GBUwxM2lv3BKhhpAt1P4AYARLeclK6wuvB3QxPRaVqr3d9bsP2Abtd5cjA39319rR6
         N/5ptsSZQkofEH3nq+eUS7OZ61HRP2HWOD4r+6b/gNSU1m7z04hyF3KVMKE6mr/RYxCp
         eYjVCUsifRHCCeDn36Kj4VlIGGCq0CfLHOUJ4uO0yjY8yUzMUblw8b02FdB8KenHAc6w
         d9yKIEadpgdAMskZUn3/Rub8gBH8byskbWskE+u2O0oY1qxJGvx07EvaonRLENlC10q7
         VXEjvKJ1JuNXQm2Fe+WtlVH2TA+YoB32A3y/1srbZdT0E6lVvMsFLgkKBMptUNYnCVzw
         7QQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754497201; x=1755102001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdwBjFBMWL7CFZp2MDy3xPi5cII5a85518fOxPk4x1c=;
        b=C08nh56IKg+THOF6IJ/J55iaGJjNUXttCZHfye5qv5JOldztSqMHoTiV9sKExDxtiI
         e6P72y2uB3aJWE9v7PobmXjB/Mc54i4aMUL/wymHtSNHQnMe8wk3JeBiN/Ea1i1gZih+
         BVkCi+fPphHp8y6mHmAQCrKtGo4rm2DN7WUSxOGnDIigxdeRjtXdL3QEF5GtikDZldZB
         t2A4HpXaYdAj917sKgjcLftujccGVrIDBHKuj3IREPsSOnegZl5f4D3fDO2eSsaJwd3h
         ZxZJro5aFT4eBWFGR6y3cVHF6gIuJrGViJtPKExF9MHG+X3vgVnBK2QmQMaAf0ipBpWU
         1bTw==
X-Forwarded-Encrypted: i=1; AJvYcCV9cCqt5Iy8dMhp2sx/2ZPdfJiRARGlcgWcUzUdv90TmJef082IWCQZJkmo+thIrHI9AwEwvk6k+/Tv9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+7hGVzVuElo3tIqeW5qH4pLkB0OqA6Ik4xtaZyIxhBwyTNgTk
	HKHfqk2FvaXQO5XXH2KhEkUFoK8eR8QQ1WaCaQqwPpm/AreNogOqq6geDCVB/2a7
X-Gm-Gg: ASbGncsKufI3c3vzxUJV7bjLD2lteTMUKENPnid5mnqmyHRv5PsjRQusCsvb8vw5wMO
	dSiyiqCJdqAn9iZyw0GSivEk2ql2nm6sCVUU4vhj3H/gHFaHdOpUak8HZaIGilEmz/g3v8vbWJn
	Yanon9daLPhNtdjDdzW6Txj+lILHeuNeYloqPl9Ei9ivEKGpttZix/i5W50d3k//l/cEfBUNiJ7
	RjpmPCEzdL/EgNO37LlvpX+prAbkv4neK6BXs6LTIVjpc+vZKZpEGoqDPHuVYUwVksnJ5C5QWHH
	8WaeGBaqMfHV4koNLXWNiuy9+uCIpZQD7avCVwpBlXMaX+mNravMGZt4zFsGdwbZsbSI5EpJ2D3
	Rl7R6KQstmZJDaTd8bXVtPsRVioAx/nR+d8M9WaPVkVLKK6GJNO9/kmWO1RuY
X-Google-Smtp-Source: AGHT+IFpkqfuik49fCec+thBB5rDVumGyUKn3RA9UnbWyK2YttUpPei7VccjREHVV8wVThKmhas+zg==
X-Received: by 2002:a05:6214:1bca:b0:707:51a6:184f with SMTP id 6a1803df08f44-70979667ddfmr46369596d6.48.1754497201030;
        Wed, 06 Aug 2025 09:20:01 -0700 (PDT)
Received: from fyre-x-redhat96-nsd-1.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077c9d6d6csm87455316d6.4.2025.08.06.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:20:00 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: mchehab@kernel.org
Cc: viro@zeniv.linux.org.uk,
	linux-media@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] media : fix uninitialized symbol warnings
Date: Wed,  6 Aug 2025 09:19:35 -0700
Message-ID: <20250806161935.3606261-1-chelsyratnawat2001@gmail.com>
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


