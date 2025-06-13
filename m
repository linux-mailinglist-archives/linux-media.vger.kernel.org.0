Return-Path: <linux-media+bounces-34746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD86AD8A50
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A753AF03F
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126FF2D5C7C;
	Fri, 13 Jun 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOU1XSqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646E2D6632;
	Fri, 13 Jun 2025 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813747; cv=none; b=NJdWAUkymRM88gIScwt/QJueuaadIluJ+EYxLHJ6yR0I7ldrJngpltu4dgPQ+eXtwVNEmMIpQR2f/jk1wbh3PAPCRJaK6EIMbVPfM6s8rG8f3DodpVF15aDmVmPF3qUtHnVF4gxaoeSGj3ApVC+DWoazHXSjgG7ufBHS0bovyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813747; c=relaxed/simple;
	bh=pG5nrP+4jfuDfje8nKz8m0Q5FmrGYNIw5InT6uU5zEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHWodJ0gVB877bIaa3ZO5QDDFq6qYJ1vWLMIKXMcMha1gEnUt02AH8rI0i26WQNPtw3NzMWLEabjq7p7ck93zzP/8jgUilSRswuMRPQSoPnEpkRWq3bjYnB2HzIgiPwZ16Xk/COPKDno1KOtbZqCP4GdliNbqsVEEReoWZvZ+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOU1XSqw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so4198320a12.1;
        Fri, 13 Jun 2025 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813744; x=1750418544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8upPUPiix/+p5eOdVPCg8aogrC1eXzrVWNgdsnmMac0=;
        b=AOU1XSqwyo6KfS6uy+SHsCHhHtZpZZZTPmolLN1fPPJL9WBa6XpJr3h016mQ3ASLXP
         ejZ8vCBGjVG6nERfY5qqsOIGtjltGI2dTrvSFyoOUyX7HtdndseVGUIgpUJXq7fViJkv
         CRGHZUAYsI9oEY8knBKP0zIUAmGyc1tOrWSGo5aaOmyC68cDGQfjwIs9CbkB7Fmw6CkB
         bmjm1L4VRDZ0qXPJowTSBB/ODgUHjHY698CdECX4Yxv0Id4O0g+RwM8zpdazrF7N+muy
         65wErMB0tRPP2aqnYFwmbK2cItALBnS5Y1AJagO4UUV9BDrbqKnGB4Ic2nfGRswzvjgy
         Hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813744; x=1750418544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8upPUPiix/+p5eOdVPCg8aogrC1eXzrVWNgdsnmMac0=;
        b=w3tqqtg1lFv7TgpwPRFOjbMvejc6Zno2obmcISREHspmNV1v4fXElQwNhqs+ASpekK
         BF9jFWKkMLNflkF3K9ChU0wNK4Dsth5BQPKtPfzFNSMOB/oH643LHwbmzV4p0h34ukua
         +ZulPfNvgYTSWE8JhDUq+ogQ/n6+DgSX+XfmIYtrEj/sz+R7fNAI1phgH0DoaLejROHd
         PKQ5CTlzbwXb66aOSiYOihMrhDj7cZu2NnvtSGgbZ7g0HySR/5clz8fpfQWKeu/8dvTd
         Ui9cyXPR/iNNNyuWpcOCBptmnJEMWZj9AnwqI5/Fc/iDIRZyp2Qmbi3CbXzkUnO3rmYm
         pKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1NdRtMYIYxwDJNXqqov1NouAbKWKVCQ2Csz+A6v0icVeeDqWg1aENPwSqkMTDioZzoETwx0Zlocdykh0=@vger.kernel.org, AJvYcCWS+8Ch+Z9Ows/G1sDeJ5RQWNbwL2hCwDaQWa2JYwJS5PMLu1fK8vdmnOvLnta36hX2TnG2+M2fltpBEz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBbPc7Yvp3Bad0IESi6NAArtIyoeA9NjfjoPd14y32AE4gDS3
	t1VQQpwrThuQLq2j+UZS2Y3w21eEVnMqZeFhJD3XYfMUn7Ney8YopPnx
X-Gm-Gg: ASbGncusdd252hKdBRAsLv6NbOmxDRvsnaXEoUeqJRtxWRijQRqp9JqoOsVQ5jQZDMm
	GvZqRpVKhKqiaVTerHj2Tmxr5cUBnQevnAvEUw9l15kdXjjcFs+IK8dyi8yxR71T5Eude/gz9Qq
	REYjgHETayY0xMe79u0aELHnMXE2bQdFFMgxgCuMlfp1cTu8tpW+PyMyrhf7H6Z7ItnfCBbqkaz
	LufcBW8zBagQ92vc9xzm3VvyNUmudk1Vkjnw+QjIBVMzTMrbHl9FSkYFMlYOEoJijCrF/H+Rz7T
	VDgKb/nkkWlahfnW6CuNVAuzA0BBCJMmsWsb3teBSC5LhpZ1rOdN7/WNSJp1GgY0GSR/ZvJP3Bc
	=
X-Google-Smtp-Source: AGHT+IFOKf2AK+LHeHo5CJSQNqnTUzTSa+BHBpbNIutyxWWNHU1oymXPrQ77SnbG5hbATCoRpNbTRg==
X-Received: by 2002:a17:907:3f21:b0:ad5:3743:3fa1 with SMTP id a640c23a62f3a-adec5d77712mr269199166b.50.1749813743864;
        Fri, 13 Jun 2025 04:22:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b99asm111022566b.125.2025.06.13.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:22:23 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 2/3] media: rc: ir-spi: constrain carrier frequency
Date: Fri, 13 Jun 2025 14:21:52 +0300
Message-ID: <20250613112210.22731-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613112210.22731-1-demonsingur@gmail.com>
References: <20250613112210.22731-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Carrier frequency is currently unconstrained, allowing the SPI transfer
to be allocated and filled only for it to be later rejected by the SPI
controller since the frequency is too large.

Add a check to constrain the carrier frequency inside
ir_spi_set_tx_carrier().

Also, move the number of bits per pulse to a macro since it is not used
in multiple places.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/rc/ir-spi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 50e30e2fae22..0b54ad74cec0 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -21,6 +21,7 @@
 #define IR_SPI_DRIVER_NAME		"ir-spi"
 
 #define IR_SPI_DEFAULT_FREQUENCY	38000
+#define IR_SPI_BITS_PER_PULSE		16
 
 struct ir_spi_data {
 	u32 freq;
@@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 	memset(&xfer, 0, sizeof(xfer));
 
-	xfer.speed_hz = idata->freq * 16;
+	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
 	xfer.len = len * sizeof(*tx_buf);
 	xfer.tx_buf = tx_buf;
 
@@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
 	if (!carrier)
 		return -EINVAL;
 
+	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
+		return -EINVAL;
+
 	idata->freq = carrier;
 
 	return 0;
-- 
2.49.0


