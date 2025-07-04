Return-Path: <linux-media+bounces-36862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4BAF979E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA737484E25
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 16:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247FA326A71;
	Fri,  4 Jul 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2CTRHV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90C30E857;
	Fri,  4 Jul 2025 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645461; cv=none; b=fB1j/z9BCd6qjF/v1CM9hb77hn8oRgQb5bnCTF4RpkYP+TF+zYVkN61C+RqfXME78jWn2GzDXRU/ZhaVBWrLAYcJVbAmyyZ3pu8+UhYZoYthLS1wjHhxpFrl0VU/lG9wbTl1xFnAan2IeuU75CwAvU93DH89hQ3969zl+gaFX3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645461; c=relaxed/simple;
	bh=cwdZtGz3IXQ1EG/p34K3KVA9kUdd0ZAHJagpVOIanHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VGYHwMPGFZl0og21crruIXT+By+fjiuPYm+CmhFOK1MHcaJm/uv5vMRHNuyaYSNFfCnzL1XAbSakxvzVqOqmP8GoPmIwq5HeXFK/YJHiYOqnAnW/iabKzyiYqQBckGrv67/gC/ArMsGa4LaGvyWsoNJWjY697DK3giIQ0csmnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2CTRHV3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0bf1616b9so20265366b.0;
        Fri, 04 Jul 2025 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751645458; x=1752250258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWKv6PM/BcPQ/i8arO/1LhjBpgoq9M2qMlX7Y0R2Fpg=;
        b=L2CTRHV3nvPBMngPfEFbjLg1w6ft5rG2kAth2sR/RMVypRS1Q8UNj7Wwqw85zQNkn2
         0/gWoXyRxKG+SHIM+edn29FaCW94r+zsb4L7OZHHgYx3G+7zMVd8bQab2kcNERZUjD+U
         tMpI2EW7o33jaRyMUBg7Pn/VHjqq9rdyDkaWSZR/th0OTOCPMm4lbX88VDwkDeg3Bdke
         /OyNOASVZo2B+ZEZXUOswfDssvQlPrzha16gJWeEsXLGrzfX8wfFISb4JHvTlEw3u4g7
         aOqESNeB0wU6y/IZpa2IlaNcId3LMOLGbkCx99ANJYxufzuCnYLa3yNxiBJL6oxtoipS
         QIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645458; x=1752250258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWKv6PM/BcPQ/i8arO/1LhjBpgoq9M2qMlX7Y0R2Fpg=;
        b=gWb338Q8qsUO/Z9Fy9CPzH+ALrK4gCv37viNFmI6xTcWe0PYjRVRHlecWX5oimg7tW
         qdqhqlTcNd+xsQChVT828WEFpCCn5vfL+NWCpXVcSajXwtcz/kIFsSQMcaSQC7LMQFiX
         YsvtlT+aRKBP/+iniSms/DUgqItWuGwBiuuU48uYHnGvXnFiuGFF9JZHaY0m2VZbn0kz
         t+PzaDcs+wMRHLAhRka5AkD31xLMOxQonexkYstO00yr/XoPuLk8bVav69/yy0fcMI6D
         TKBSJ+CNj0FCfyQJynrUQK/2rRRQjyrKFTFp2N06MI1nPMr3Fw6fWnNsH7S4fKB11KP4
         W9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9KFgDd+hWFPem9wgk+VjgjpfLdlTu81D4kZe8IOprGWIcewOah2RjOxDd8Lh0lUYSfbjEnkYXxplDKq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYky1WyWjDjSv+TX4cCsXoLAJy+jPiBrWcA/dCxo3agQAdoEVE
	xISW70znWGtIb8UGkW7zzSMrrfD+m1+vbZ3aQW5AyjdVHJo1bWhhYYAo
X-Gm-Gg: ASbGncuvssHQ51q7ZtqT0syfPePvAieWphXWgAOMFuNmwX1KByaOBRLZm7q7FtVx+FN
	N+o68md989VXA8KreWCkUDVAi6wyB+MSkBsLsVFzidRHXk11crf4xmshIo6zbpMw2uDAU1lYtAI
	9cdwZyW8Z+txXrvllXOLlSRUk3XdBel6z+2kZSv6CNTnN6+usmN5mNhnYvbenDaZl+tTRiXEO3v
	bgK6n01Z/Eogi4SxNXpVBsH88ayTAkJHVp5Rb6lyQKWK3rd7lPFu3iQGFwloiAh7nH0XSZH1sse
	qnsnCPFgTWzC7lzp0n11fhmhIAFXr9HhrDFkKkIWvavW106IUcsMPzqNFVdJ/6zGsOgwax8GQlW
	07LVq+bpeJhZjx61SZXi2GO/qjWVR2bdn
X-Google-Smtp-Source: AGHT+IEi7/w7Pg0qVqgIrY+90Z1GOtJ0vUjMDQm+fZE47PMuaudthmL0Fjysm83XElDu8wKctqr5kA==
X-Received: by 2002:a17:906:f583:b0:ade:40ed:9f3e with SMTP id a640c23a62f3a-ae3fbe6027amr111119666b.0.1751645457649;
        Fri, 04 Jul 2025 09:10:57 -0700 (PDT)
Received: from localhost.localdomain ([41.37.222.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d30sm192940066b.133.2025.07.04.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:10:57 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c
Date: Fri,  4 Jul 2025 19:10:51 +0300
Message-Id: <20250704161051.16733-1-abdelrahmanfekry375@gmail.com>
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

Tackle TODO item: "Remove custom sysfs files created by atomisp_drvfs.c":
- Remove the sysfs attributes `dbglvl`, `dbgfun`, and `dbgopt`.
- Delete their associated show/store handler functions.
- Remove the corresponding attribute group definitions.
- Keep `dbg_attr_groups[]` as an empty array to preserve compatibility.

Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/ [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v3:
- fix style warning
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


