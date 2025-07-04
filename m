Return-Path: <linux-media+bounces-36844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEBAF9537
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 16:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999EF189D9CD
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 14:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A20119AD48;
	Fri,  4 Jul 2025 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVZPB5oA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E404170826;
	Fri,  4 Jul 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638585; cv=none; b=gpK0N2M6eio2+Vj/+WX20LZZDAiCnRJ8yTYmbmmwUJeV8Gh6JGdZhBwXmcBIxfLrUy92S0KxA/1RlQ5heka3qxLHJR1dfMmhcjXCaSPI75wMQK8yqruQvDwCIqP3vSi3mA6S5KD0LKjgf/BINJ0iAjB/JB5AiACPqBp37h4TnJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638585; c=relaxed/simple;
	bh=oo+uEgK1Jfph1XkO08KqkKaj+w/7lywoKLOEgNgfAZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JKJDqzQ4zu5U6xxJCpz6srVkwBvxznXGB1VCXxUghnossEjM28aCJBtKpXu1KJ7UAVS+bMKmA5EHHPF7g8/2KZKBx+G5zwzKxi/1+sCMju6WSEFZ0SIwS75u0g5SkkrJQNsLqHB8TIgVPGKfgSl5hlE1Y32MeVZgjWOEe5vdS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVZPB5oA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6095f07cd53so137281a12.3;
        Fri, 04 Jul 2025 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638580; x=1752243380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sb8iimynI9CzYNi0AnSl9OGFpIWMTxy9TSj8evqbmoU=;
        b=EVZPB5oAT+hyu8PJbNlth9xsz3KdDLACNRGPwCTDwcP0EZeEojv3xkTeTbHafzyc0j
         LgcFH+U5bvK3HJQ6tgP1emqNrVRCmGy2B1ohWHRUfpOypTlp4P1Celh6jqlShefFc5sd
         xHcKHtNX8XZ9VSmpZN8OhpPQrZ22GwamoEAoMbT0JGGbBPociwwnUuoKxbuhy3afKXYv
         s0WTjvqGmcVMiqjNcYgII38dKamMxf39PMAVf7Vi92S7GtKB0WTPp1eQq45R1zDg0iOe
         IZ006EG9BjKlGQsy3yKcMaNbVp4f/KGtmpStKn8flnPgXHEkMpp4aDFdU/HcmA2ImzJ5
         N5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638580; x=1752243380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sb8iimynI9CzYNi0AnSl9OGFpIWMTxy9TSj8evqbmoU=;
        b=gnpPGTHekMyRgeOi2+QoKuHW6pPQpTKE6fSJY0DEuwBMxKvohJ3NZZsTmsVbY0yF7T
         sks8Ug8v7zlt8GPLn7Yw1ZgA7Qhf609GkoKcUfCF0uPimt9TMHjbhQfIdRibb9MnRIVp
         25KWOkFzSwEHJDvyBTETebsnnRbHMgqXYnAn678yajoCguW05xIflEGZcHXGWbjMKONH
         JYDRD8C2g4L8sll5uGgcS66umTHF18TA9ffpr5s1YEHmfZEzubkL93RWH7Obd4gxfAfu
         Xoyt1C/WE4UtnO387QbkXHrxTyHt9UJV3Vr6QGHvYs0CYKKW3cqYXoP2yRM1APEGBHUY
         vmWg==
X-Forwarded-Encrypted: i=1; AJvYcCUARHOnlWk/P3ohjm24KvFYvRPmBOByMCn90b5R7Q9uBQ/EbR62Z0/fy199R+njxE/j4tlm3bLqzMVs1qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpdEgAaV/DkXaRggh8fQrUIRMABNDwGD9HwVIv3q1gZdhv66a
	hSk09XUs+WJRN8352ZwQ0hD6R/KHxug49P736gHwb2GjTDs+GVuXVTB1QfyNKA==
X-Gm-Gg: ASbGncsHZEfWqu7nWwgiGccNNj9AD16GzXLryAoLwgomD2aMKtha/9nl6DR1m1WF6a8
	cAyNqgOoFMpZyjcHla5CXjqfIdzlWZhGLi6S+Pv5YjST7PBCy7pCJoy1Cv1EfqZaOC7QKAtBNlk
	3hfm8bs644eYubEVrc5F79gNxYc8r7EscwCm0NTTamipDOhwXk5wCY85Hf21shYZf8y4XmHotiG
	jME/OC8hUit8BQLfG3YE0RBGOC/Hdf5b0K95BUmrIrlcrgIcCMwjuqXYeAQv60TxFbeCQZ1H7fW
	nZlBju+0ktsDOvdmsiDCcsY4qjJ3NG2VMGnE9svuwYHYCDetORJOqXukbw9wC0Xr1gab+1a2WpX
	fQ4tN8II/3D7Rds53DWboNg==
X-Google-Smtp-Source: AGHT+IFc7IohEsknf/s8s4QFDEXv5Yh63dnCdh0iNkJ2FiQksbeWPWAzsgLI+sTiW+yLce4CuDrXlw==
X-Received: by 2002:a05:6402:40c9:b0:602:f026:82cc with SMTP id 4fb4d7f45d1cf-60fd65641e7mr705154a12.5.1751638579144;
        Fri, 04 Jul 2025 07:16:19 -0700 (PDT)
Received: from localhost.localdomain ([41.37.222.172])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c7f7bsm1390972a12.81.2025.07.04.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:16:18 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c
Date: Fri,  4 Jul 2025 17:15:27 +0300
Message-Id: <20250704141527.10146-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue the cleanup of the AtomISP driver as discussed with Hans and Andy
in [1].

Tackle the TODO item: "Remove custom sysfs files created by atomisp_drvfs.c":
- Remove the sysfs attributes `dbglvl`, `dbgfun`, and `dbgopt`.
- Delete their associated show/store handler functions.
- Remove the corresponding attribute group definitions.
- Keep `dbg_attr_groups[]` as an empty array to preserve compatibility.

Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/ [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- modify the reference link line.

 .../staging/media/atomisp/pci/atomisp_drvfs.c | 138 ------------------
 1 file changed, 138 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 31c82c3c0d33..c25fd3ff003d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -1,9 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-/*
- * Support for atomisp driver sysfs interface
- *
- * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- */

 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,140 +11,7 @@
 #include "hmm/hmm.h"
 #include "ia_css_debug.h"

-#define OPTION_BIN_LIST			BIT(0)
-#define OPTION_BIN_RUN			BIT(1)
-#define OPTION_VALID			(OPTION_BIN_LIST | OPTION_BIN_RUN)
-
-/*
- * dbgopt: iunit debug option:
- *        bit 0: binary list
- *        bit 1: running binary
- *        bit 2: memory statistic
- */
-static unsigned int dbgopt = OPTION_BIN_LIST;
-
-static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
-				    unsigned int opt)
-{
-	int ret = 0;
-
-	if (opt & OPTION_VALID) {
-		if (opt & OPTION_BIN_LIST) {
-			ret = atomisp_css_dump_blob_infor(isp);
-			if (ret) {
-				dev_err(isp->dev, "%s dump blob infor err[ret:%d]\n",
-					__func__, ret);
-				goto opt_err;
-			}
-		}
-
-		if (opt & OPTION_BIN_RUN) {
-			if (isp->asd.streaming) {
-				atomisp_css_dump_sp_raw_copy_linecount(true);
-				atomisp_css_debug_dump_isp_binary();
-			} else {
-				ret = -EPERM;
-				dev_err(isp->dev, "%s dump running bin err[ret:%d]\n",
-					__func__, ret);
-				goto opt_err;
-			}
-		}
-	} else {
-		ret = -EINVAL;
-		dev_err(isp->dev, "%s dump nothing[ret=%d]\n", __func__, ret);
-	}
-
-opt_err:
-	return ret;
-}
-
-static ssize_t dbglvl_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	unsigned int dbglvl = ia_css_debug_get_dtrace_level();
-
-	return sysfs_emit(buf, "dtrace level:%u\n", dbglvl);
-}
-
-static ssize_t dbglvl_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	unsigned int dbglvl;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &dbglvl);
-	if (ret)
-		return ret;
-
-	if (dbglvl < 1 || dbglvl > 9)
-		return -ERANGE;
-
-	ia_css_debug_set_dtrace_level(dbglvl);
-	return size;
-}
-static DEVICE_ATTR_RW(dbglvl);
-
-static ssize_t dbgfun_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	unsigned int dbgfun = atomisp_get_css_dbgfunc();
-
-	return sysfs_emit(buf, "dbgfun opt:%u\n", dbgfun);
-}
-
-static ssize_t dbgfun_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	struct atomisp_device *isp = dev_get_drvdata(dev);
-	unsigned int opt;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &opt);
-	if (ret)
-		return ret;
-
-	return atomisp_set_css_dbgfunc(isp, opt);
-}
-static DEVICE_ATTR_RW(dbgfun);
-
-static ssize_t dbgopt_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	return sysfs_emit(buf, "option:0x%x\n", dbgopt);
-}
-
-static ssize_t dbgopt_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	struct atomisp_device *isp = dev_get_drvdata(dev);
-	unsigned int opt;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &opt);
-	if (ret)
-		return ret;
-
-	dbgopt = opt;
-	ret = iunit_dump_dbgopt(isp, dbgopt);
-	if (ret)
-		return ret;
-
-	return size;
-}
-static DEVICE_ATTR_RW(dbgopt);
-
-static struct attribute *dbg_attrs[] = {
-	&dev_attr_dbglvl.attr,
-	&dev_attr_dbgfun.attr,
-	&dev_attr_dbgopt.attr,
-	NULL
-};
-
-static const struct attribute_group dbg_attr_group = {
-	.attrs = dbg_attrs,
-};

 const struct attribute_group *dbg_attr_groups[] = {
-	&dbg_attr_group,
 	NULL
 };
--
2.25.1


