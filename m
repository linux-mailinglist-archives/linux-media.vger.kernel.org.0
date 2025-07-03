Return-Path: <linux-media+bounces-36687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC21FAF7DF9
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263E418858A3
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F48258CF8;
	Thu,  3 Jul 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXPVsx5V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFBB33DF;
	Thu,  3 Jul 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560468; cv=none; b=PjZikFYRe+8F1HFOfV02LbQYPCPZe7mNQctA49t9nyTtg/OMs/6J+tLrBi7oWvmAiiP56zuKW+ZwAnqWihSR5Zrhphc4tJCmrdoFikve6CFjiA5YunwL5GSL/ps6IG8DTCRh1Cme6WD3ixWzMfv1YjXiCJywiBQHstC1xRAnWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560468; c=relaxed/simple;
	bh=VKwdBc7nBeYzyYiWahHZprHF+d0zFQMTpiieOfjnnbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rvq+/1PhPUtOVaFZLO82MjLMz6VEMr8sy+qXK6sY0cAzPHwq1CQRvVEPbluB9pe6zZl+4QerqdrQkf1Y6tmGTzGsYCZLm8o+AWRepYzxx1KXHC9jsXnZpm3uU5QTiv2OwGymqFjEEAYYwK9M+iY+WKIS558oMHkyfqHRUfwapN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXPVsx5V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45368313a7bso10715e9.3;
        Thu, 03 Jul 2025 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751560465; x=1752165265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Srec9QR/GmFsR6ZG7Q56odxAHiKleEbcbPmhdL22Zbg=;
        b=EXPVsx5VfeCrg97nqSbI++jMAMKP5Mp/UckTqBjSAKf1kWBrXCNFFBQHXMojH3LNyq
         BIfACPEQHAIuvlnlBmrY/K0ryFL9qgDoc1/aET5OrpeXyCaBk5LbzLVSn5to3mabqnOe
         CbA/j0x7EAwOJ2JYjuz9M0bsRdeMFA8R7LgSW7IeLYWwteXCSnnm8Dm3YeZOEhBu+aP5
         zaNACtuEam/aAzDlLQzTh0eTYt/E1ouotHbjFow/BrPjtAhP23madwY9JtLKoS7Krva2
         CrNrkjT6fpDd3h2ibWNTiIaDe6FfaQMYSmXK6v+gLxqVUyoewUyaGdand0jiCkfE95tO
         DU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560465; x=1752165265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Srec9QR/GmFsR6ZG7Q56odxAHiKleEbcbPmhdL22Zbg=;
        b=wFHSZzN0IgoVGvadGlarQpRYGq/vf1Q4RWknFjpD6GLIovYERqzuo6DKk2h0OgUmxr
         bYQsv3eVjXrv9QuOXH7QK2Y6P32cDlQ0KQX+mTwDVBMpP1aP2otzbOgX7e/R0Z7CihNM
         gU+2ub/y5e7CsGu5dNGtgAgcSppH6TY+7BDHTWXgKzLV6UOv4PjGowdkmjhTW3fVnXWw
         DhiOW9fCn3UZWoEbztIQmYkvw7dM+fo7acqwgcZ1GItOSE8scgMCpeK+V10J34HIhXzu
         bVNCLo1LOP0BVbEOp0G6h8ldMYGRWR4TW2ZmZnUcYPCcEY3cBc1UB/vcOtp/vhFmcXvn
         KpPA==
X-Forwarded-Encrypted: i=1; AJvYcCWign8V0TXrq9Z1U2k87hBvC8n2ONAeYcf6S7rWq6f4hDdC6haY5GztPjKap/39AWc177GIM/0G7neb7E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyntFURCkl31t1PLczGg/2gfYp3+yrq93C5s9X/uFw/fM+NchcN
	1nTZbDJFmpWrOv4uqus5jUsSqitbJkvMGVI45tc6R20Vf3KK1lN8W0UkjtQiARwi
X-Gm-Gg: ASbGncsviv6lFpiNXTE7Onp8SKNrfwYLJL5hAa48NfHWmT9UjMUPT1a/aFwvL83xj5v
	qbG7u7nn/FkLPMZj++vOqiBFRwxT8P/ZU0bxcUebOwccIPO2sZQhs4ApQaG5AyqBH0kjIzT06hD
	To0C1p6M6FCZvCyjPrb7N0sjwKDKwZFPjk5MYcebbXuGVkBAlibeQvXwO8CY7l1A4DSjews1rSa
	FZ9wHEI/JZz2pKk71usysayoDiNEm/6IQsDqfzWmSU4LKIv3bLUM5VtCq27SFOlYZAvUSZnBBo5
	5aNv+pw8OO+xyIuATpuGc+2SECkKVwGAUI/B5aNHc20j1HOO48xmGAFJ0+L6lN9LkdN1bDLmMCF
	DcxK0jORAZVCzFnAvFChI
X-Google-Smtp-Source: AGHT+IF1gdEMbWmckU8zZNqNOEiPSgfYqKdroPQU+DWQMNKxl4cBvFKaJ1cKNO2FmfxqEFvic+P0nQ==
X-Received: by 2002:a05:600c:a30a:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454a373583cmr21491165e9.8.1751560463966;
        Thu, 03 Jul 2025 09:34:23 -0700 (PDT)
Received: from localhost.localdomain ([102.42.87.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168673asm2153235e9.26.2025.07.03.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:34:23 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c
Date: Thu,  3 Jul 2025 19:33:50 +0300
Message-Id: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue the process of atomisp driver cleanup as dicussed with hans
and andy in [1].

Tackle TODO item "Remove custom sysfs files created by atomisp_drvfs.c":
- Removing dbglvl, dbgfun, and dbgopt sysfs attributes
- Eliminating their show/store handler functions
- Deleting the attribute group definitions
- Preserving dbg_attr_groups[] as an empty array for compatibility

[1]: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
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


