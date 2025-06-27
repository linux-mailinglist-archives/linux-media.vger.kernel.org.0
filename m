Return-Path: <linux-media+bounces-36079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E3AEB3C5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D37D1C22D00
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47690298270;
	Fri, 27 Jun 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlcSzDPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0EB2980CD;
	Fri, 27 Jun 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018810; cv=none; b=ZUfbL6fmLcxVFY+5cMEGhBp8REecg9MLc/y8cr9K7dD7Lj5L00SAjR2N7WIOW3gywZMCuXQEqIA9j3jLn++gbg9xExBA1kAQzV1d1u+f8oUk6a1o1K3lsXdwSlPk72Nr3HA1DqX3OCaU2yoY1MUDxW7JZEtl+o7ypFcN5HdQWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018810; c=relaxed/simple;
	bh=r0YnwAalgTRGHMtfmaMXLEDkTNOEImu3iRSewaoDnpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MbWuXKlQP4fvWco1jeZAIdMa21k+RdNs7z6M+EJzq1r22PvMLx5aDnvNJMoX3tk207nMCkZNLJ0Ar2LvFab9J7qu3YOGGvLHOFObHDagJoow3+qonrJouxLeNfvx+KgZRteiMH7raiR2dasprje+xT2lXVmNTJ1WpMedXuxkV4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlcSzDPR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a577f164c8so275756f8f.2;
        Fri, 27 Jun 2025 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751018807; x=1751623607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxXlLI+5RHgcRNLRoMQn0tLo5umStcod1M6mXH84eyE=;
        b=jlcSzDPRu9NsUsYc+JrqOHwG2ZID3Xfgj3VFsVNiRuEOgJczt6YnywkNSToRPAFbQz
         OWBPm1yDjq8AFWEFSr47GPia2NTPxq0ziwYPNduVCxsZ7ada/oNZ/nGQoMk0kIW1pws4
         Nc9IdHhjetOSEKzByhfm6Smau/FVgZ4I/R/DRKRM0LO8V9XZznrQw7ILrfJkpW2cSfRK
         PTPow5puKf2TQms0i4RhFFP276Ug5NEIQd7jXuOpA4J0/WHP9qWyFPdF0xeVhUY+tUbo
         Eu3iv6+BJLCJ/CWg63sIz+uesE7RweCmBFPhI0vWvLILwEiI5yRLLzPadkIt4ygiXwIp
         0GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018807; x=1751623607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxXlLI+5RHgcRNLRoMQn0tLo5umStcod1M6mXH84eyE=;
        b=KsbQe2NOuVl+UxYgC9kxw9JVkb0B0IvE/2JesOUTomcGbsgB8qAYpCIgBVPLS4YkMo
         otK0wqVagmFSSjJr3PxNnhdJ9hjByvj1HOhsUMMCr30xXxEPPSWnYWWLtAWe3ndNov5O
         T43C+/Gl/i76WOEKsMIDabPvq4WQ6PCPBwFMmn1gYeDY7opY2pPDPZpeuDgmw2G4ZgoR
         YJwvYfoow+92CoYFI3W+zq/zd5M50kWRkR4xOXCL/Vm5Fq10z8PGBriMGW7VkIWoDciU
         q3bY+l3/UQQj/Qah9URMszUQLcIw7hh8bRET5o1q3qUQhCtc/EOimqGtLdYHb9KRZNk9
         /g5g==
X-Forwarded-Encrypted: i=1; AJvYcCV1DjnFFrKO3Jw2jgW8z8qupS9GfMGTA+Xx0ljna/d99492mEhWTmjjWv2+B3O+2HF8O30ELdQGJZQEyAI=@vger.kernel.org, AJvYcCVYjkMk3cGo7aVDpIVd9u/2drAlrhCDfxzv3q9pqos/aSNAbMlb/asbxGE9A4CrL42gKMRWx/osLyt7FM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfIUA3YTTWWJQkaVzDlnhbG9x9vsNLHNZVu8YCrTa2L+r6xho
	4vdLYg9OXkNxCvOtRCQp9KCwYZv83qV5UR7eHUPufUeUp/Z5uZ1nOX8X
X-Gm-Gg: ASbGnctiVPg0eGme8X0aN2di5jDl7yoS/BjP+xYE+n5gTW/OTwf2mTY8AJCvvUWqs4K
	ylYEjZUeUqyjuxUsGCH+bp/sPj9hzk3sPj3QDCaSg08zfikZjs6IyGbiuH8RjBSXCjSdLxNkEAE
	swSxrfTfEoK+uHFPJijTnzTCKjDP4N60qcQBobKIA6wI/XVF1lBrAVqpT6tcCN84BM+sM6dEfAc
	nWt4xhKmT64a0CyYm9V29l4oZsMwyZ9P64+jWk7DnVRlD9Q2OMpc2EovHOJM+bmxIMaTbzyPqtQ
	1Y70LdcVyWFGYSGfEWa9lS14bO9MWxymR5lRl42Q8ZABkjqwbtZuzrlMWbaiXBrlX95NPizNnRu
	6KryJ5i8U2yQEJUBNc7KIUk1q
X-Google-Smtp-Source: AGHT+IGPWENIh37fy0usHQ/GxRQDWqrtNlHrDfI+wS47KXWgE9P6pSxGpvKCA6RJwezPYbisfZU3uw==
X-Received: by 2002:a05:600c:358d:b0:453:8c5:95d3 with SMTP id 5b1f17b1804b1-4538ee5d303mr10792245e9.7.1751018806659;
        Fri, 27 Jun 2025 03:06:46 -0700 (PDT)
Received: from localhost.localdomain ([156.208.147.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm75908545e9.5.2025.06.27.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:06:46 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v5] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Fri, 27 Jun 2025 13:06:04 +0300
Message-Id: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attributes active_bo and free_bo expose internal buffer
state used only for debugging purposes. These are not part of
any standard kernel ABI, and need to be removed before this
driver may be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registration calls form hmm_init() and hmm_cleanup()

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v5:
- remove stray change

v4: https://lore.kernel.org/all/20250627072939.21447-1-abdelrahmanfekry375@gmail.com/
- fix typos

v3: https://lore.kernel.org/all/20250624170746.47188-1-abdelrahmanfekry375@gmail.com/
- remove blank line

v2: https://lore.kernel.org/all/20250624144943.39297-1-abdelrahmanfekry375@gmail.com/
- add Suggested-by line
- remove unnecessary comments

v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/

---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 91 ---------------------
 1 file changed, 91 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..f998b57f90c4 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -28,88 +28,6 @@ struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 static bool hmm_initialized;

-/*
- * p: private
- * v: vmalloc
- */
-static const char hmm_bo_type_string[] = "pv";
-
-static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
-		       char *buf, struct list_head *bo_list, bool active)
-{
-	ssize_t ret = 0;
-	struct hmm_buffer_object *bo;
-	unsigned long flags;
-	int i;
-	long total[HMM_BO_LAST] = { 0 };
-	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
-
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
-
-	spin_lock_irqsave(&bo_device.list_lock, flags);
-	list_for_each_entry(bo, bo_list, list) {
-		if ((active && (bo->status & HMM_BO_ALLOCED)) ||
-		    (!active && !(bo->status & HMM_BO_ALLOCED))) {
-			ret = scnprintf(buf + index1, PAGE_SIZE - index1,
-					"%c %d\n",
-					hmm_bo_type_string[bo->type], bo->pgnr);
-
-			total[bo->type] += bo->pgnr;
-			count[bo->type]++;
-			if (ret > 0)
-				index1 += ret;
-		}
-	}
-	spin_unlock_irqrestore(&bo_device.list_lock, flags);
-
-	for (i = 0; i < HMM_BO_LAST; i++) {
-		if (count[i]) {
-			ret = scnprintf(buf + index1 + index2,
-					PAGE_SIZE - index1 - index2,
-					"%ld %c buffer objects: %ld KB\n",
-					count[i], hmm_bo_type_string[i],
-					total[i] * 4);
-			if (ret > 0)
-				index2 += ret;
-		}
-	}
-
-	/* Add trailing zero, not included by scnprintf */
-	return index1 + index2 + 1;
-}
-
-static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, true);
-}
-
-static ssize_t free_bo_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
-{
-	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, false);
-}
-
-
-static DEVICE_ATTR_RO(active_bo);
-static DEVICE_ATTR_RO(free_bo);
-
-static struct attribute *sysfs_attrs_ctrl[] = {
-	&dev_attr_active_bo.attr,
-	&dev_attr_free_bo.attr,
-	NULL
-};
-
-static struct attribute_group atomisp_attribute_group[] = {
-	{.attrs = sysfs_attrs_ctrl },
-};
-
 int hmm_init(void)
 {
 	int ret;
@@ -130,14 +48,6 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);

-	if (!ret) {
-		ret = sysfs_create_group(&atomisp_dev->kobj,
-					 atomisp_attribute_group);
-		if (ret)
-			dev_err(atomisp_dev,
-				"%s Failed to create sysfs\n", __func__);
-	}
-
 	return ret;
 }

@@ -145,7 +55,6 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);

 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
--
2.25.1


