Return-Path: <linux-media+bounces-42230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C64C1B51C45
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0891627BF
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AB0314B67;
	Wed, 10 Sep 2025 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JD1ftN5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC6245019
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757519184; cv=none; b=YxoAcdlvMCzmuva/p4JY1CYocbFVfINsjTBTeXFpG2pg0BTs2x0vhwwCyoKcgBXHSrTxUC9o4fJx8Jz75g60cfUXECAMEh2xJmTNTOJUxz7YkPdCXFnNGrE/B0qFB022s/IVx9HSRSuaKwUXzbD/GX3fYxLiOpEBNCjbQ11r310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757519184; c=relaxed/simple;
	bh=vz/r/Y/nVR90qs+gGF445+Y6Yl8j/EBX5ZCD/VXMsCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbB7/4ayhTHTJMxVaGENv15Ziz6qZq9QFZyk2ZAeJhUdYGyXXxld5IvwXTxYUmaY56XQ/vpFJBXK7/U4/pbF9nbblFXovSjrXVvIyYGf4Zd49uoVNm2yqxStJvNP248VX2S+n592iak4dwRNdMvhifSL7u0VXiuQO3k8pj5C8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JD1ftN5W; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so7829651a12.2
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757519181; x=1758123981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZDre0B01w0VLOyAKtjrQWQqebWixg2+j2xbvEpNCxI=;
        b=JD1ftN5W+gg8J0Kb3sZboaTYS+ShH83rWbCS1iDgrEqfNrEVPc4Dr/xmmS0rpl9owG
         9Nwe/EeR3kPoN33oVadAirToPM4t58rS2XpnzhCMB7FCFHqaKXrp47pq19lSdw9MwpKL
         zBpc42xxX//wowSERzm81mc8y6qSSRlpQL4b5GrSopfROFqe5a997D/s/uV6OVC89Tjo
         Rb3QtIHqgRjXTcJ4oI2YJ1G/+yU/rUKXuwvtWF8q2IK9WBgLMwYHLhvkzG5GE8W/FwT3
         82dGnj9IwaTh9ZQtnR3ya5I8EmQCt62oVZAdDKBbTqksAbSRw2uuazV3HKoGLa89OU50
         aqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757519181; x=1758123981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZDre0B01w0VLOyAKtjrQWQqebWixg2+j2xbvEpNCxI=;
        b=KZmS3Ij12m244ebw+/uavqGb8SFLcaV3Qnkq1L5dlKq642KffEi/wFUulJEAQtbKDK
         2rgMGV7G/LdJA9hw0ixOgZ/JjIeqRmqX8VRbQ5bgaV56uA3mzeTFlY70oP5MQuuBDfiz
         RIKyW9elzBONpN744ZLFwn1t/ABVhOcPWgEgiEe83WfkWBo3362e4QTbfwRixjPtBqRT
         9Vzf9g0V8uc60q7CQ0LH2rQcTiCNiuPRmuDKgDsPkfIDepLmI5jcL7KxKjIwk3soBlQ/
         xdwDwR/NCdciYgvuaFrPq9FI5V30IsFKGRHwNZL01yppEhDSmLkhkCuzeA8G1FQm0aP3
         Iu+g==
X-Gm-Message-State: AOJu0YyW3PPRLtspqP7Xrfuce6HDifPHsUxLRKKdky0s0AYxSvZKgbQY
	828UunZnOImHUY0ibVFQa3qxc4k+0dJW1ez4UJ8V4KoOLoPgrYzZqqkVcxWa+A==
X-Gm-Gg: ASbGncsq+BRSnySat2ZaRDFtdkRIY2v1kz4mEjmA4B9vPLE6HMX3OnRHJR2Ryz+jnCU
	iHaCOg7MEWT35AQ9UIcvsvfEWW+h95cnl5f4wmoaYfErYWgefHfaZZT/6aPNTPmP5/LO1XXV7HL
	0QGXX9/oIbcs3JLALGMFtgkQnh5YmhOLYyBrz85vXcWi44Ky7+z8JievOxe+HKJ3l5964TjmFKh
	7ddqh2MC9ShEJD/fWFo+2IsCgQnrD6+qxBBV7aQ0XiUoxeARc7VZ2Yi1cluFDGNzAq8kzNPNbLQ
	5DcJpFyjzHzYgMMwN5mTE63/W1BDyNjDOmM386XnHH2gxu/Ne1thMdl05iHe6GgJHRuY3zwqt8q
	vp6xhxE+Xr0WfwmMKjZr8j1vV5F4jnZ8wWm0ziIU6WPE=
X-Google-Smtp-Source: AGHT+IHAcLD9SdPB4dxNFKubpMFnPJFtp3i6gEZsUQC+Jm1RBuVRs1raG5CvtDgWk0oUZJ1Ip5IxRQ==
X-Received: by 2002:a05:6402:5242:b0:623:4a7:c670 with SMTP id 4fb4d7f45d1cf-623728d6fabmr13927972a12.8.1757519180634;
        Wed, 10 Sep 2025 08:46:20 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:1266:7a83:f27c:69b7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb66esm3324297a12.47.2025.09.10.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:46:19 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: alvium: Accelerated alvium_set_power
Date: Wed, 10 Sep 2025 17:46:04 +0200
Message-ID: <20250910154605.479611-1-mhecht73@gmail.com>
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
changes since v2:
- remove unused variable dev in alvium_check

changes since v1:
- added alvium_check to be used by read_poll_timeout as
  suggested by Sakari
---
 drivers/media/i2c/alvium-csi2.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 26cac5821b9f..6d2c3d62137c 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -433,10 +433,8 @@ static int alvium_is_alive(struct alvium_dev *alvium)
 
 	alvium_read(alvium, REG_BCRM_MINOR_VERSION_R, &bcrm, &ret);
 	alvium_read(alvium, REG_BCRM_HEARTBEAT_RW, &hbeat, &ret);
-	if (ret)
-		return ret;
 
-	return hbeat;
+	return ret;
 }
 
 static void alvium_print_avail_mipi_fmt(struct alvium_dev *alvium)
@@ -2354,8 +2352,24 @@ static int alvium_get_dt_data(struct alvium_dev *alvium)
 	return -EINVAL;
 }
 
+static int alvium_check(struct alvium_dev *alvium, u64 *bcrm_major)
+{
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
@@ -2365,9 +2379,12 @@ static int alvium_set_power(struct alvium_dev *alvium, bool on)
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
@@ -2432,7 +2449,7 @@ static int alvium_probe(struct i2c_client *client)
 	if (ret)
 		goto err_powerdown;
 
-	if (!alvium_is_alive(alvium)) {
+	if (alvium_is_alive(alvium)) {
 		ret = -ENODEV;
 		dev_err_probe(dev, ret, "Device detection failed\n");
 		goto err_powerdown;
-- 
2.43.0


