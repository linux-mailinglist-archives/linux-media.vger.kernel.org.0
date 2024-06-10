Return-Path: <linux-media+bounces-12809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2A901C9C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C02AB2304F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1D770ED;
	Mon, 10 Jun 2024 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwkcKzBG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E24745F4;
	Mon, 10 Jun 2024 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007044; cv=none; b=TPG7TKg/oKiyGG2CGbexKPZ8ZYMyC4PDzziXUGSxWE7pLbweQUoMrtgwhlPZkAMiALLhoEK5ZITT1NoXCz9KHxqoEbYqcT7WXWgrqSjbdZu6M/0bVfjj89qR5Umev0HrtxuKODFKbB/xJw7dzl0SaKCBb1/x/O0VL3oOi18kgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007044; c=relaxed/simple;
	bh=lsZZm429aZ80AiEqNfmz436mxdxk7GVMSTRxDA+I7K0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdHfgsndnFFkqSzHURlsUEGv0KgSMPkZDTgv47TK+rX+iTJHBxh68bVCHjix7lZIGGDB8RGOoDTdADFPYpOa/5F96Z1LI3IhAbYBLmklcBu2g9ZzEv37XLR+lixuSF7V3lZfCmfIFjZmyb0qM0oGPsbL9ct6DJALi1H6ADc/7ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwkcKzBG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaea28868dso31516141fa.3;
        Mon, 10 Jun 2024 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007040; x=1718611840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/tvOrV3lDKGVpK4tR+NNQNmVg8LHNueBnoz36Fe83g=;
        b=RwkcKzBGDm0qaGqL5sQwluufV79UIjw0FD4lKtZB2RujVusQsGdbx5Umh3qBLa4WnE
         TaVdIHxEl5icAWEMwxF4BpuKJAITZn3ueA/SLBmQ968UCzsyNIgqcuLjtrVhomjuSZw0
         r6NNcC6ZLQ2fc4zBkp1vkGtPGyrxuyPxm8Wy6EeGqXd0bT2ZElBBWbBK1aw10z735Are
         HT1Ji3KGWpeOvXzaxhFBxNnC1d8mPv5h4mWq2ulp4g3hSHYqYEaHgyH6kxUylNRTNj1S
         aaTC+TEhiyyLgfJkgk+pNFN3zR8y+iIqZKmygXco5sit/cIFHkeZSYeMadwFwmu9dA0L
         mpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007040; x=1718611840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/tvOrV3lDKGVpK4tR+NNQNmVg8LHNueBnoz36Fe83g=;
        b=bx5AeJCNQ2dt930fwTjY27eQC7dVHast59ad8+rJPu9ulpee1ATCaA3kBfwqiVlqrO
         vyILbCcOpOg2cGbMAXivneeEeraXqSu21Otcx9MusYU+BqzEPFUbsxxm+kt7JUBmi52S
         ZdhKY0dCnM8QccYYnk4VqvYoKvMPdeVv7EJhANy/I6mX99aVtnxzq+XGlkasqtu1V0+R
         3dKk+wQjX0kg+c8E4o5v238sMNKS2dLsaDKy2UN6InvjpMHRrKRfyr29bAS2ZteNbOft
         fVPOXQzqsBT6MljchsyULrOfariBcAXteIY9As3/d6ei0bTaUZkrYwPc6e4K5EYAmy3/
         eKBw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+OAGbDYe00fC7Q6UEdny1UwD3glH0WaV7yIIdLXWGqbLjFXnTysvDX2uiHU0HH2NNSBJgV2hFfv17Yr9NiTNu2/rpFpXVC/H2y9u68NdrB40BXpUbqNsJ28/kvuZIao+uRgQrl9L6hg=
X-Gm-Message-State: AOJu0YyG16OHw0A4L3xmcgbovBUWqAYpaBxJdUj33I5Pvb6lLEVz3tl6
	XJ14CH2YuaYYKKdBnoZ1ENpOp/dW6PEAc6hSiPnry7pDZL6qqmUw
X-Google-Smtp-Source: AGHT+IFincPHEtbCK4EgkjaE9BvOPw8+tj6N9/avwuekFyf4Q0WOluQpd1m6wcO7fP4eH2awGMxxRQ==
X-Received: by 2002:a2e:9b0c:0:b0:2ea:ebb0:b5ef with SMTP id 38308e7fff4ca-2eaebb0b884mr50685401fa.19.1718007040092;
        Mon, 10 Jun 2024 01:10:40 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:39 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] media: i2c: alvium: fix alvium_get_fw_version()
Date: Mon, 10 Jun 2024 10:10:30 +0200
Message-Id: <20240610081034.1195523-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610081034.1195523-1-tomm.merciai@gmail.com>
References: <20240610081034.1195523-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of reading device_fw reg as multiple regs let's read the entire
64bit reg using one i2c read and use bit masks and bit shifts to get fw
info.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Use bit masks and bit shifts instead of struct as suggested by SAilus

 drivers/media/i2c/alvium-csi2.c | 23 ++++++++++++-----------
 drivers/media/i2c/alvium-csi2.h | 14 ++++++++++----
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index e65702e3f73e..7a38c424ea48 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -403,21 +403,22 @@ static int alvium_get_bcrm_vers(struct alvium_dev *alvium)
 static int alvium_get_fw_version(struct alvium_dev *alvium)
 {
 	struct device *dev = &alvium->i2c_client->dev;
-	u64 spec, maj, min, pat;
-	int ret = 0;
+	u64 val;
+	int ret;
 
-	ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_SPEC_VERSION_R,
-			  &spec, &ret);
-	ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MAJOR_VERSION_R,
-			  &maj, &ret);
-	ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MINOR_VERSION_R,
-			  &min, &ret);
-	ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_PATCH_VERSION_R,
-			  &pat, &ret);
+	ret = alvium_read(alvium, REG_BCRM_DEVICE_FW, &val, NULL);
 	if (ret)
 		return ret;
 
-	dev_info(dev, "fw version: %llu.%llu.%llu.%llu\n", spec, maj, min, pat);
+	dev_info(dev, "fw version: %02u.%02u.%04u.%08x\n",
+		 (u8)((val & BCRM_DEVICE_FW_SPEC_MASK) >>
+		       BCRM_DEVICE_FW_SPEC_SHIFT),
+		 (u8)((val & BCRM_DEVICE_FW_MAJOR_MASK) >>
+		       BCRM_DEVICE_FW_MAJOR_SHIFT),
+		 (u16)((val & BCRM_DEVICE_FW_MINOR_MASK) >>
+			BCRM_DEVICE_FW_MINOR_SHIFT),
+		 (u32)((val & BCRM_DEVICE_FW_PATCH_MASK) >>
+			BCRM_DEVICE_FW_PATCH_SHIFT));
 
 	return 0;
 }
diff --git a/drivers/media/i2c/alvium-csi2.h b/drivers/media/i2c/alvium-csi2.h
index 9463f8604fbc..ed712ad44899 100644
--- a/drivers/media/i2c/alvium-csi2.h
+++ b/drivers/media/i2c/alvium-csi2.h
@@ -31,10 +31,7 @@
 #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
 
 #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
-#define REG_BCRM_DEVICE_FW_SPEC_VERSION_R		REG_BCRM_V4L2_8BIT(0x0010)
-#define REG_BCRM_DEVICE_FW_MAJOR_VERSION_R		REG_BCRM_V4L2_8BIT(0x0011)
-#define REG_BCRM_DEVICE_FW_MINOR_VERSION_R		REG_BCRM_V4L2_16BIT(0x0012)
-#define REG_BCRM_DEVICE_FW_PATCH_VERSION_R		REG_BCRM_V4L2_32BIT(0x0014)
+#define REG_BCRM_DEVICE_FW				REG_BCRM_V4L2_64BIT(0x0010)
 #define REG_BCRM_WRITE_HANDSHAKE_RW			REG_BCRM_V4L2_8BIT(0x0018)
 
 /* Streaming Control Registers */
@@ -205,6 +202,15 @@
 
 #define ALVIUM_LP2HS_DELAY_MS				100
 
+#define BCRM_DEVICE_FW_MAJOR_MASK			GENMASK_ULL(15, 8)
+#define BCRM_DEVICE_FW_MAJOR_SHIFT			8
+#define BCRM_DEVICE_FW_MINOR_MASK			GENMASK_ULL(31, 16)
+#define BCRM_DEVICE_FW_MINOR_SHIFT			16
+#define BCRM_DEVICE_FW_PATCH_MASK			GENMASK_ULL(63, 32)
+#define BCRM_DEVICE_FW_PATCH_SHIFT			32
+#define BCRM_DEVICE_FW_SPEC_MASK			GENMASK_ULL(7, 0)
+#define BCRM_DEVICE_FW_SPEC_SHIFT			0
+
 enum alvium_bcrm_mode {
 	ALVIUM_BCM_MODE,
 	ALVIUM_GENCP_MODE,
-- 
2.34.1


