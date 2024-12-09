Return-Path: <linux-media+bounces-22939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A879E99A5
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5053418834FE
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0211F0E26;
	Mon,  9 Dec 2024 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dwRcVnqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE71E9B2F
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756177; cv=none; b=Kzr7VFys3Xl7ukpRyjRrLqSA5pWWyNbWedQpN6vL5pm5v5SImnUmp1XAwc9I2vCPxN1DTgd2oYB23cb542EdpMsXfdcZhdlBsKxkfWPKmPOfZcxCsNbWx2y5edSHsOUy9AsHfiCc6caQl80NcMuVBb15PdoAWYdQyIzzJttUGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756177; c=relaxed/simple;
	bh=v7fEv+PQgG49lk4iKaJBPXeCbWAcgmJ4OBYd6cOxNC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QlG8rE8WyT9lxf87Jzz2snKDS8U7FtginV9PqMl4Bm+YMflqaPuNxlDDbCnq6PJp7ghtT2IiORkl31fuTxs0e8lT3MfGiSr19n6yAZnLCvswbXHE6YBjff98aD2Lb82a//7+rxu4arlMBj8P0BfdKAOFGkssmcsqOc5Qq3n49j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dwRcVnqK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385dece873cso2091602f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733756172; x=1734360972; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9/sTnTDQc8p68+X06XluYmO4nBose0FpqExl64Pr6M=;
        b=dwRcVnqKAgq6uHprOsggi0YGVyseb5g60WJYDwQrOFJbpBO5YXMz2XNKGBG0HC4JoI
         q0vDVDTySShKqrPIlAklSzCw3u30pVb29lKqKUuXHPuLaCxzSsX+Ca8SXMDQaemscAjX
         vhyUJ1oJvlQgt0jn3oJt2+D3w8BMJGCUMRXvcn1xQ9zMy7ZGOUrczdV9zDWhdEH1aFjb
         dDCYKXWRW3q2onHFwzYHs+Wytw60wbBLkUMc2YebG1m9zxoConwDnYDckn5hwm+YVI8x
         0Ps2E/RVETugnb2xJKkv0H58F6fNBcDT1vJooOhaO4r+OYo12byh0RisjnVaVN1c2P5T
         ITog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756172; x=1734360972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9/sTnTDQc8p68+X06XluYmO4nBose0FpqExl64Pr6M=;
        b=TKHQ07/hrXxd++JFAx99kwyjihlF+H1l7VQTFMIHxXECkLt/4KeMpuY/6MFHdrNeL2
         RUcE2CroRrSg9d6LT+diONhOspbyaslrN0sHqth/HEVkx/nEJ9XIaBq9WKWD84qN14hc
         RArfLom88E5qkf3nH3FGZRh/31/nHt3mzdL1uiSpv0fZFPHdgLfhLWtU6xzj9m3QB8w4
         5/t7yDHvTCNMRjZ/cAwxstn1f/9xN6ZZuAqzluirVH7G0JdynVBRVNWpS80BKdtKCkHD
         urum84gnBNCJxTUNF5/ajunyJJuNEfaEUhR6/1mxDFrUl9JsN7wLvKuWbIlordlo17Mj
         lixQ==
X-Forwarded-Encrypted: i=1; AJvYcCX63OyyNNC7tig8g1JmaoOM9hYFFhtQpjbkrlOR0juOBDEbog4Kz1/bEpdGVyOOT8PTvltcp32yYyfG1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO2WDBuC7NBPGrK8W+9R4EpBWBRScc9P1N8KO4ST5BFrIk+hsK
	J14TyDIHxx92XpoVGvBVzC8R33cDdElZz6q1jxKKcCoAJhWqnFc/0BB1HSlVjHo=
X-Gm-Gg: ASbGncujFJX1X/Zchp5CgK5hehsk3qHiTV8ngA/96p4z5OXZXSg7z5V3EWuIRTeByj5
	qKNGDQ87VUTTeyB0G61KRa05LJQxawerj4gJZZSayxRdLLgAAXu7NPkk4R3ih/WHQEH+26HGTq0
	r0SCzHiYbaADcBaOkAS8m9ZPUoO5i8qG7lsTJtZ+jwjy9MWzlPymbP2ibwvwhcgzF6OpCDV9XLv
	5lm1p1D8hBEl0FmKZY9fZQJJ/piHETxUKewJqrw3w==
X-Google-Smtp-Source: AGHT+IHhHCXqjaznY5Q6KEGwqqpPsaxnnFCKGS+fgXu9MlUG5T4//fuuGvyhnK/fDHt70l+KnjfY4w==
X-Received: by 2002:a5d:64ef:0:b0:385:fb56:fb73 with SMTP id ffacd0b85a97d-3862b3553cfmr8496529f8f.15.1733756171744;
        Mon, 09 Dec 2024 06:56:11 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3861ecf4119sm13221887f8f.14.2024.12.09.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:56:11 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 09 Dec 2024 14:55:45 +0000
Subject: [PATCH] media: i2c: ov9282: Correct the exposure offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-media-ov9282-fix-v1-1-d06bb7546f18@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIAPAEV2cC/x2MywqAIBAAfyX23IIuRdmvRAfRtfbQAwUJxH9PO
 s7ATIHEUTjB0hWInCXJfTXQfQfusNfOKL4xkKJBkzJ4sheLdzY0EwZ50Wp2SlMYaSJo2RO56X+
 5brV+mx3ztWIAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The datasheet lists that "Maximum exposure time is frame
length -25 row periods, where frame length is set by
registers {0x380E, 0x380F}".
However this driver had OV9282_EXPOSURE_OFFSET set to 12
which allowed that restriction to be violated, and would
result in very under-exposed images.

Correct the offset.

Fixes: 14ea315bbeb7 ("media: i2c: Add ov9282 camera sensor driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
This was picked up by one of our users noting that images were
going dark for captures through libcamera. libcamera was resetting
vblank and hblank to minimums for the capture, and that put us in
the situation where it broke the datasheet requirement for
exposure being at least 25 lines shorter than the frame length.
---
 drivers/media/i2c/ov9282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 9f52af6f047f..87e5d7ce5a47 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -40,7 +40,7 @@
 /* Exposure control */
 #define OV9282_REG_EXPOSURE	0x3500
 #define OV9282_EXPOSURE_MIN	1
-#define OV9282_EXPOSURE_OFFSET	12
+#define OV9282_EXPOSURE_OFFSET	25
 #define OV9282_EXPOSURE_STEP	1
 #define OV9282_EXPOSURE_DEFAULT	0x0282
 

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241209-media-ov9282-fix-a1ec012f5272

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


