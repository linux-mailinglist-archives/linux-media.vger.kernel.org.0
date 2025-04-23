Return-Path: <linux-media+bounces-30816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2EBA98DFD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7341F4471CC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3D1280A51;
	Wed, 23 Apr 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+ylJyDv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DA1A9B39;
	Wed, 23 Apr 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419810; cv=none; b=ovzee0oWCNMuLhw4rWbtMFAeZ42DlMocU7PmJBI8zKLdeSPh0NAx9PEJRWy5g/Ptkv3+fJqBXv2GbTU4vD3sGproarb7ZUY+HDcTN1bkCWzTHHPKD8f6VNwhCE608zbdeOxJukdC08TUydw11PruJ2G1RjmR8kreoBGrgVD68gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419810; c=relaxed/simple;
	bh=cqboPyTx2cmE3bXcH8hw3VHROeLIbbmXPrr/jpwekTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnBhd6mqj6KFseWb+9aN2UnJ2oEcgY+RsQtXQPHZ9CpyxOBLzj3dBVA1W39IHgtXjSJIW5+P/bMVrzz0L48oRgEOwMEs2R360cFpXHBH0IaZGV6OSfHKH8FO45oTxGuVrsPVRxNaMZGzKX84pZA7x9nK1ONiELaXGugYaUfm5ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+ylJyDv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so102180235ad.0;
        Wed, 23 Apr 2025 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745419808; x=1746024608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kacme6riPUWb6HwFjmzh0C2P6n/HVJi+iGJ7APUnik8=;
        b=R+ylJyDvO0+EmGQ10Mt2avyMaS+hzvt+HBzmMPigCXr1ntNylS+Zam+vbLv7sd6qgy
         VAG/CBezJmOrTIw8WTzaT2g4LqSozvtAR3c/pPhj7eCL3+PdwhFKj7IoU2rjlBra2lvf
         gasnR60qhavA8/n9nN5GJbjxyJMB+OeFQmy9tvIfru0/ZFyGMAr+YbjrsJUanp1tS73t
         uQ56sIH2XySh2ab4iaHFKMRK0i97YIJXNRabjKeJcSdesaAlr9wQaOkzmy7pBjCCi/KZ
         Bv5qN3ex4jrmpHpV/YS+STL+dQ+5/4Qh6Da+z1yd/BuHo/ypdNU01tzI1afzvKzt/wGg
         km1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419808; x=1746024608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kacme6riPUWb6HwFjmzh0C2P6n/HVJi+iGJ7APUnik8=;
        b=jZjJvelfoIllPPquMQgn4uikEmEW1e6Pk01JdrHj6+6GVxQ6rZrDEm2kWy7I0mp8Va
         D27DvZ/NP8AiYKFrdy6/qLuMF1tAqjzBNYEfhKuLIX86m5j6utkypO7EsyWDge4ORpKJ
         BZL4UF5xPIbR/Nq0Vl4gXWGtj21zsl0IhXQrpRmrTncBzma2gInMOljIufAm175udXKb
         oXnEehmjD+rznMUP/JVKfC1F0+0E9porrn327pzja1DBkk+zKaLGQ3eAB6UuNQI6zota
         22nvrtP1RA1GG6Wl4u1oZj4hsHUdazdrg9bqfMmbHIMW51XeioPYYTb+b2gUC3H/4Mk3
         8crw==
X-Forwarded-Encrypted: i=1; AJvYcCXTSTIcdDdFSSQ18tDkhZZZNyDAX37rYnYKa+itBdYL744/3C7+3XKV4EWz52qtgAVerlxVMq7isAMSSd8=@vger.kernel.org, AJvYcCXdWifj7LebFLyba+2yRNHfg6he0Wb3/ekaKwe1zo4ypGp45p4ZpMiyA6UEJkGEtTKTFHtkYIKYExffGIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKB7KH4pWfRKOhkUqHiXKMX+wPNQmmv3Oa0Vg0VUibacL8dLp
	vN9hKlHfXHsRGHR1jHx4X3PdZ8fmcIGfyUemcskaKNnRW5cHf0Tk
X-Gm-Gg: ASbGnctdDG4LObHXdukRT/lfG4/ffT4ZTF+98cLaWHYitCiZ5mWdzqpGzzYtuscLa/2
	RkdDptsdmSV9o18b9+7VW+PNGn1n4DumADXVA6/zOh0rfuwRO4dQNCTiLVIEESSG9BGYjpt9SQC
	7gOqIcbjpqx0Ze44YgXevhDN42UIKKsno9sMLUA/GiqKtXTspxdZo33ldpFzunWubRPy1It4r83
	fmJ+iectBBsWBQEaiUtgXV9Ie6qRF9+VNvgksMPReM07uTsXj9WvNYM9+zi1y9xZp7qruREeT9i
	Ib94gR5Fke7UUBdh2KCWT0LI+u/W2dTNqAdgnGbjSjqSdSDcgKwyh5RJe8lYqRI=
X-Google-Smtp-Source: AGHT+IEqPjhKdysQZK6cQg9qIZ6iAF0G4yZ/FAGa3E9ZtvhdAhxYy4nxgibZOTZ5/l3OVQFUXXEd+w==
X-Received: by 2002:a17:902:ced0:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22c536423c5mr269107925ad.51.1745419808425;
        Wed, 23 Apr 2025 07:50:08 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.129.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm105144655ad.130.2025.04.23.07.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:50:08 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: i2c: ov13858: Enable clock frequency macro
Date: Wed, 23 Apr 2025 20:19:35 +0530
Message-ID: <20250423144941.20826-2-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z_5K9Kz2i8TouhC4@kekkonen.localdomain>
References: <Z_5K9Kz2i8TouhC4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines a macro `OV13858_MCLK` for the clock frequency (19200000 Hz).
Replaces the hardcoded clock frequency value in the probe function.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>

Thanks for the feedback. I have revised the commit message to use
correct terminology

---
 drivers/media/i2c/ov13858.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 7a3fc1d28514..a1242a90cdc9 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -21,6 +21,8 @@
 #define OV13858_REG_SOFTWARE_RST	0x0103
 #define OV13858_SOFTWARE_RST		0x01
 
+#define OV13858_MCLK				19200000
+
 /* PLL1 generates PCLK and MIPI_PHY_CLK */
 #define OV13858_REG_PLL1_CTRL_0		0x0300
 #define OV13858_REG_PLL1_CTRL_1		0x0301
@@ -1664,7 +1666,7 @@ static int ov13858_probe(struct i2c_client *client)
 	u32 val = 0;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000)
+	if (val != OV13858_MCLK)
 		return -EINVAL;
 
 	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
-- 
2.43.0


