Return-Path: <linux-media+bounces-38067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888AB0A6A4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 16:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0531C81A9A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 14:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AFD1C5D57;
	Fri, 18 Jul 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGg3tFXg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF026ADD;
	Fri, 18 Jul 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752850318; cv=none; b=PKwRQYAREWGMeu5tMY/Dl17yJLWyWyQa9mer86rYZ3t6xXln8UC31DM+nGqyXsyz5PLCWzWNLiqa9TGlwJP3dpVPoUaqJ2DBIu2KkGnIwfaH1bKUtuRf2WGll7ak3+f12tFaeWZK5TdAPcLmIreNJulbzVn1V8EQWizOJqe29B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752850318; c=relaxed/simple;
	bh=XrVVAqrBrFGK/CqdRyZ41ONim0L5CqyvpVeievJbdUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dXF2am1GHhkENcoHXmJsEKFqJyHvjO2zw2lFohG5IhLP6jIVAUx77ZDm8ju73P0rBeQb9TDzpkdG0dV/TWIH2d3Ce08rVXLKOf/uN2yOLku74CYUkxDZdPlr1MFjttY6ViyUMF9JTeKAaxyTuUji5gbLGsxbB8WOfeJxLL3boa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGg3tFXg; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b34a8f69862so1759698a12.2;
        Fri, 18 Jul 2025 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752850316; x=1753455116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYbq3N2likdUTcLjgs20eG4yJugMO0jrWc+rRJWvNZg=;
        b=XGg3tFXglihf9vH2r5gQZhxp5P/EG1LoAQREXHVJ0Bj4Lxx0/O3xMOYrAATAZRxA0P
         T8RAy+IPC8g6vppJ625Q7iOADWjJ5J/lxWs+FD0hzhOhzLHm940tjdd/5YA4548m4p4q
         tIj37FWMMLuksVCnqPLZ2xOQvnJa/91slY8T42l762OXk4uNzsVgHqvbOg6Ef6lmyqMJ
         zQw8+wTMisr2VCXh2CGVJQBhDJjvARWPkxObd5vbj95v7PJonp5DRXr7QnWesDtKPa5D
         Qg0eLfWY9iS3qi9cNsVZk/AV9W9D9LQb0re3LUebIso5ehlZGGMvkt3C7D4xTeVbA2cL
         2gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850316; x=1753455116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYbq3N2likdUTcLjgs20eG4yJugMO0jrWc+rRJWvNZg=;
        b=cWarUK4lhxBdoF9jiB3SX7mLC1ANrR7bBhr9zksaIHfEwZ5hZ5dAbc/1JUvOa3+nLs
         kzajWm1IX/DvIC1uLBZxGtHq1f1zd3dD0ydbb9vgMmZpytX7maAnUFYpOcZ2sP2yp/zv
         MH9QXmblrcT7gMpug4fbp1Hj96i4dS8iBc+JTmATAzXz7Qfd9dYEMSn9L9Gj1YCBrgdE
         lnk9Qt9hng9ezYE7E2dp/+6RZtKwZUMwa/VufOfqXDcrKlPHk+ZlbROpHBEnF0LmUyum
         I2DzIoDlZG9Q2hC53ufgRR7cejQ2zoAWv0JVXMvgO7jursQ5xT6szL2UojWo8xcTSdXj
         aaug==
X-Forwarded-Encrypted: i=1; AJvYcCVcIGvgQuD4shSJVHFSFieIjLA89kjr8r42oPCuVT4XKAWPqGjdN+eumWpqmarQQAh5nWj3hDojwfOJU6Y=@vger.kernel.org, AJvYcCXmt5np/bUt+dF7GFT47a+Lwv+OPziNEZqSpVy7rr2UFx0QmpfyI0XqD5uGW8vHhQRkcYYfC0eY4OMAY9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UHbBGWgukE0zDCfeDNJjaIpac7S389ohZX7zgScwr+h69pqX
	PSZ37pqOagZh3SpI6qAP2/DYa/W8CCrmjyniPwzWmKdvMGykujulR+UHeudP+nhbAOEu1A==
X-Gm-Gg: ASbGncvmCAk8eFRBxHcBmFhbL/txLrrJmiz+HkiLlnat2zmvUtI/VB5c9ZMP2FWw8iv
	A5YIONQsBErNMtzSnLjNAv+SFLkB0flHhsBgtBCuA6qA+8pmSxaBkQr5WD1chkNTH/8SMxn0U2o
	L7fOBpBp6WATZaPmCmaDjrTRXZL78cjTyQXXKW+UC2Y9f3uJXn97G71O27DiQqNFOOirnqDyqt3
	5q+XoL5iWtkQPhtA+2Evfg9AltmK3RuiBfx5+k4hujaZES5OH22dBovRyUhQX7en+ZsX1RZkWo/
	OhJeJS0KXRjmmNAYmPfVBgx9k2r/ScN/626uelJemwA7w0u+kEnsebX7bKO5zUndFIKoBK/AiuH
	cv6lJm0Y95i3iPJ7KGoOrRTz0+JcMQRnBg06Jc7ZtblmqT5lXYoV2cyN7binVQrmLIFo9OY6VcH
	0=
X-Google-Smtp-Source: AGHT+IGjCVG6wG6J2a/R2oQUFOo/4hwZzpv916gMYEaiFVezIdBEWrlKJfZLIPxa45pVRgplo3PyBg==
X-Received: by 2002:a17:90b:37c5:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-31c9f45e283mr14371053a91.1.1752850315980;
        Fri, 18 Jul 2025 07:51:55 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([27.57.176.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1b8f89sm5498965a91.9.2025.07.18.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:51:55 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: b2c2: flexcop-eeprom: Fix assignment and missing return in MAC check
Date: Fri, 18 Jul 2025 14:51:44 +0000
Message-ID: <20250718145149.3180-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes a coding style violation and build error in
`flexcop_eeprom_check_mac_addr()`. The function contained
an invalid assignment in an if-condition and was missing
a return at the end of a non-void function.

Fixes the warning:
  warning: operation on ‘ret’ may be undefined [-Wsequence-point]

And the error:
  error: control reaches end of non-void function [-Werror=return-type]

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/common/b2c2/flexcop-eeprom.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-eeprom.c b/drivers/media/common/b2c2/flexcop-eeprom.c
index 0f2151cd36f2..c4f66d13941e 100644
--- a/drivers/media/common/b2c2/flexcop-eeprom.c
+++ b/drivers/media/common/b2c2/flexcop-eeprom.c
@@ -90,7 +90,7 @@ static char eeprom_set_mac_addr(struct adapter *adapter, char type, u8 *mac)
 static int flexcop_eeprom_read(struct flexcop_device *fc,
 		u16 addr, u8 *buf, u16 len)
 {
-	return fc->i2c_request(fc,FC_READ,FC_I2C_PORT_EEPROM,0x50,addr,buf,len);
+	return fc->i2c_request(fc, FC_READ, FC_I2C_PORT_EEPROM, 0x50, addr, buf, len);
 }
 
 #endif
@@ -107,7 +107,7 @@ static u8 calc_lrc(u8 *buf, int len)
 static int flexcop_eeprom_request(struct flexcop_device *fc,
 	flexcop_access_op_t op, u16 addr, u8 *buf, u16 len, int retries)
 {
-	int i,ret = 0;
+	int i, ret = 0;
 	u8 chipaddr =  0x50 | ((addr >> 8) & 3);
 	for (i = 0; i < retries; i++) {
 		ret = fc->i2c_request(&fc->fc_i2c_adap[1], op, chipaddr,
@@ -135,12 +135,15 @@ int flexcop_eeprom_check_mac_addr(struct flexcop_device *fc, int extended)
 	u8 buf[8];
 	int ret = 0;
 
-	if ((ret = flexcop_eeprom_lrc_read(fc,0x3f8,buf,8,4)) == 0) {
+	ret = flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
+
+	if (ret == 0) {
 		if (extended != 0) {
 			err("TODO: extended (EUI64) MAC addresses aren't completely supported yet");
-			ret = -EINVAL;
-		} else
-			memcpy(fc->dvb_adapter.proposed_mac,buf,6);
+			ret = ret = -EINVAL;
+		} else {
+			memcpy(fc->dvb_adapter.proposed_mac, buf, 6);
+		}
 	}
 	return ret;
 }
-- 
2.43.0


