Return-Path: <linux-media+bounces-42098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECDB4AC04
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683AF16DD41
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830ED3218B9;
	Tue,  9 Sep 2025 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np8ihajT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725731CA4C;
	Tue,  9 Sep 2025 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417376; cv=none; b=pdYmbkAFU56KM3BkgxTOfZ1y0OZBkjgs+eJPKiro4N5hC84zIrSSZ3IgGQVRzuUqEzI2SYnz/V1gPG/xvicJNI23tUoa1+zRi5O5SloXDMSk8yV8zq4dfAiW5y9L4e2Zakt43JIZFgGlnH/SottXnNxA8uf4zj5V6qs1qjdPOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417376; c=relaxed/simple;
	bh=RsKExGiDIm7209nGz6c1dPs4Pik8xWf5DBeUwc9KHJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTdSY144WlrgOaFQRvlTAalXJQYv665Qn60xaO7dmwp81dk6I2FaJqD6+WzT/xTR3BDw+zoxtjrUnUvI89eoUlSQqkS6qCd/y8woEsLPTcSBNItCQ3FN310ut0ORYFLCTjcELGQa3A7+CUUfFN4FU3K/IDVklanyCW4IUlqOZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np8ihajT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b045d56e181so820633866b.2;
        Tue, 09 Sep 2025 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757417373; x=1758022173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEwWMYw5sWUgE1N9NYJI+c7GrJTyt+el5N//tVMM1gQ=;
        b=Np8ihajTDNjuoikMT8DgAaImwlK5aZb/65UW4IIVJWHUmFS1V+n0G8xAjGhNPvRyLP
         Lv0WrSWt95YOnteFtysU1tNar0ejH3G0dL7J9QSct4DA6VQT/vt7wsgIjfkswlVNk9tc
         uMb/JFEYJPFC4KBfn85kV98wopIxBI0CdceFAa+0864Np8mHdppQWwrJVgw+PTXBCDT/
         fOnGllI+n++fakVHu+FHva4JjkzqORWKU8KcuX6kNeNpqYgYiT3Qd7r1TppOGCizjcm8
         55IkqfMWmmoKA6eg/7khuAMZRYE6GM0tk5E6lLnsnRjudcEzs3fOxiu5CfhPrqIp7dw1
         Saxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417373; x=1758022173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEwWMYw5sWUgE1N9NYJI+c7GrJTyt+el5N//tVMM1gQ=;
        b=nVrVjwCOm4wG44ae6UGRNugpvOXPQq7HG/wFBif4Nr4yr4O2U9LWLshggQnpbCHJrI
         ajRm/e6fvocWwbujn5Vv2i4p73J2PKgtBTU9YdX+BJLArqVAjD1180PG75W0SgRcwqbb
         G3tGlOMvpToyO9OARGOQoqHBSp1NrDmlPUmVdGMVVd4P5JRwMkJL22TFBDFDCd1FpMSf
         XMI9QYKmkLUZijE/7UqHPwVaGAKzvVwyXEPmTL2PjzunYF48h9o4KkJ4E2RfeT6HbPja
         StwoLniEMr3BMMJNuz/4GlZUCTJbQTYynbmdCxwvtk9WOOUVAX1DidtpNjbxFt/PF8my
         e+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU/TUmOPNW0VG0lwyyp1FNRClVq2B9j424VYrfHtfk/03vX01n2RjLhZ72NokYV4s12zJPLa3AtmryUgE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynJyaHxDubGiqLbM6TZV/17AXhop+7KVZq7Qji9Pe34Em9ZTHu
	p3Fd1GqpcgSfZ/Wnkgp7ZcX1Lw8ku9HtNgPKUGh3YLnUsREf8oBSnCH2okKjC49J
X-Gm-Gg: ASbGncumFNpXdqv+DoEewJ4qbJ2/IAYJL3AEzhqlEj8Fte9pawgOPmHuqWLUpOS1Kz+
	AQMzrP4nO0Wlz/pgp2+p7RWnTzHchFfNbG4tESuh2jxqD5VZHVUrJgLtqJxjJV3AqAJ9X+JLSBi
	UhOIzKWuxopXF4e1np41gU/Gfyp/yqPMlChG9sqCTIkd3qkdeYqID3XlZ99x9tkHJqd+PrvyKH6
	jwcjS4OoIBB5ptUTtkR6eewUaz58r7n4R45s5wa/246kGSVQtA3YVbd9r/pj1YP5cUoRynIF1yh
	Ya108oPQAOUsKeo21Y2MmG/1YdGY9qg9zYav0609EuiwgwgeJUqmChWmmhP0C8uFdievhtO4Wl1
	YRCyxqaPvNvmvK5/GNzYYaFRfJgLU+qT6
X-Google-Smtp-Source: AGHT+IGInsfa65fLtGFKDjLXDkkhyE9HsVrvX9H3yYe6VIJOtTBzXLTvDHT3CjBKrJGNRXqSEE9heA==
X-Received: by 2002:a17:907:3ea2:b0:b04:1b90:8d7a with SMTP id a640c23a62f3a-b04b1463381mr1268606066b.27.1757417373083;
        Tue, 09 Sep 2025 04:29:33 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0424cc1698sm2118734266b.21.2025.09.09.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:29:32 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: alvium: Accelerated alvium_set_power
Date: Tue,  9 Sep 2025 13:22:51 +0200
Message-ID: <20250909112252.2577949-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now alvium_set_power tests if Alvium is up and running already
instead of waiting for the period of a full reboot. This safes
about 5-7 seconds delay for each connected camera what is already
booted especially when using multiple Alvium cameras or using
camera arrays.
The new function alvium_check is used by read_poll_timeout to check
whether a camera is connected on I2C and if it responds already.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
v2:
- added alvium_check to be used by read_poll_timeout as
  suggested by Sakari
---
 drivers/media/i2c/alvium-csi2.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 5c1bab574394..c63af96d3b31 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -443,10 +443,8 @@ static int alvium_is_alive(struct alvium_dev *alvium)
 
 	alvium_read(alvium, REG_BCRM_MINOR_VERSION_R, &bcrm, &ret);
 	alvium_read(alvium, REG_BCRM_HEARTBEAT_RW, &hbeat, &ret);
-	if (ret)
-		return ret;
 
-	return hbeat;
+	return ret;
 }
 
 static void alvium_print_avail_mipi_fmt(struct alvium_dev *alvium)
@@ -2364,8 +2362,25 @@ static int alvium_get_dt_data(struct alvium_dev *alvium)
 	return -EINVAL;
 }
 
+static int alvium_check(struct alvium_dev *alvium, u64 *bcrm_major)
+{
+	struct device *dev = &alvium->i2c_client->dev;
+	int ret = 0;
+
+	ret = alvium_read(alvium, REG_BCRM_MAJOR_VERSION_R, bcrm_major, NULL);
+
+	if (ret)
+		return ret;
+
+	if (*bcrm_major != 0)
+		return 0;
+
+	return -ENODEV;
+}
+
 static int alvium_set_power(struct alvium_dev *alvium, bool on)
 {
+	u64 bcrm_major = 0;
 	int ret;
 
 	if (!on)
@@ -2375,9 +2390,12 @@ static int alvium_set_power(struct alvium_dev *alvium, bool on)
 	if (ret)
 		return ret;
 
-	/* alvium boot time 7s */
-	msleep(7000);
-	return 0;
+	/* alvium boot time is up to 7.5s but test if its available already */
+	read_poll_timeout(alvium_check, bcrm_major, (bcrm_major == 0),
+		250000, 7500000, false,
+		alvium, &bcrm_major);
+
+	return ret;
 }
 
 static int alvium_runtime_resume(struct device *dev)
@@ -2442,7 +2460,7 @@ static int alvium_probe(struct i2c_client *client)
 	if (ret)
 		goto err_powerdown;
 
-	if (!alvium_is_alive(alvium)) {
+	if (alvium_is_alive(alvium)) {
 		ret = -ENODEV;
 		dev_err_probe(dev, ret, "Device detection failed\n");
 		goto err_powerdown;
-- 
2.43.0


