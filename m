Return-Path: <linux-media+bounces-37019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAAAFB598
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC7A1AA0485
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C9A2BEFE3;
	Mon,  7 Jul 2025 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA1LXgAW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6382BDC27;
	Mon,  7 Jul 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897422; cv=none; b=aaLsZB9wj0m3MNVZl/nAYykXgzNnC4e2zgyn2i07170mm9vfUO3BTnJANDPS+7lu/wNfBpBRRTd+SLT5xSQLuiFoJnkU5eqlPyP4M5ru+bwsss62Ao2y2+9kBnShWX1jsPex0Y2oKlhp/XyuQTZbV/BxpBtSA1lI3VRnmz8XfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897422; c=relaxed/simple;
	bh=b/B3k1831vUi2pwNP8MdNzWU1miTvc6hCuBnBbTpojo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PHfPeTkrf18y8AUB4Pgrn39q1j/8E7w7PG33eITbu1fJacYyWZAIx0EFslItRsmFbWciBAi1K/QpeJY5LvJhIJHRRmrXxbOIYt4D/opnqTW2XDUq4UAxwRe7jly45QwPT1YrEDPYgcQairLlWaNWpPUKq9x//T5/DCxHvj1m+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA1LXgAW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6095cea1f4eso309049a12.0;
        Mon, 07 Jul 2025 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897418; x=1752502218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG5eCNv6FpOvgmpPlEUgxQt8hhDv8eg5LGuMjXE/ZtE=;
        b=JA1LXgAWI3Zp2AbVc7wch14ch/1p+Uzr8rEwlWQpnX8/bjJPuArYr2GNraeE9gD7UQ
         HY7gwzPiKAypSSkk69XS/btzD1pcX01znv9HDFARFlat4vZCA9vUAjQYu+i1+RoCQV1I
         pVpY+RdZz/xey4rYHGG0E5v2koxta/JTom7Tqf1kH1B6ji89FobH1BrH2jsn+aAGKV8Y
         vWcYqMoX2tG6FKo6hongy/Un55ltPQQAlm24EE7icJYcozR9qOt8Xm9E8/rOsJaPUosi
         nL/hjPkL5Tls9wWvR5KcrzYCLssmUmB1QYd6nDBQwMNmKcQIuTbKp8qSeDpZC4uyhlKR
         B4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897418; x=1752502218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG5eCNv6FpOvgmpPlEUgxQt8hhDv8eg5LGuMjXE/ZtE=;
        b=ec1nJhDcnrEdlJWha5fm8ieNwQSLgp3pt5Eira4q0kfn8FA0c2vUMLREH6EtjBcyKk
         F5AoKq45eb7Fzr8muB3xsOa4upHQOkrbvgQrwWF32Zlib/7VHW2w9QYkTfXflHLgHEGS
         LuQd9tj8zXhnAz+aLAgir3D0TAEkz/i2OgaNxOCEO+1DkxlS2Zi4T4NgfLbHdyV6FHJT
         WbI1SFpUQUlaK2MpXEDC1TGQYMCzr/0loU5VcRCiXmwgALVe/ed8E115TwNXDDk+cTkl
         c0trKrN3odUvt/vqjUO9ssvbg+NOGFvA9v9hhys4/KSNvFaJ9fL4svNNILYoaF9Wlsv2
         XlMg==
X-Forwarded-Encrypted: i=1; AJvYcCWxkuKCdLlj3QfDbuBb+5X3kagT0BPN+nIajksMjr8/S1QcT5Av9wod7fbcOsr/jV8TQELjnhdepOnWyS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDQ4gECr2NYL5Yy6/UiYdun85BIvRu0O9q86p5ph2HIySwWd7
	pP/2z5zyFV5pAMdhr6fARRgXB1SEVGXEkhVdbxRl/hhP6CuejtwsGk+Z
X-Gm-Gg: ASbGncsa2LWnNfrrgRcZ4krKpbLUR0eaNUGUiAI1F9wN/+fsxt6CdVQpcAl8/Om72OR
	8iU4qdmUle3cKbkfopxsKsksjvTYVO1+luDcg9Ku35qvTx9Llha5hi5qjFxunLQGz5DvJa7bdqq
	VWF+aMGz8JgW/knhdwSEeDXGNY5lSktn3DWZZ8fkJPZI44mnXUkUvePIaohLa2Hc8btfMX5ucLN
	vNpJz3v4i1c4AWfH0/auNNpMVdid3m6arcTslJvylo8Bj97uTxRuknpvtx3aqNxoMSvbetyBmQb
	ZgjeeWmdwKj4bhYUX7KtzhtjPDXjrsrY+BNzfhCkrYLkOgZz4Rzj+q5O0LK+fVHrIA9cSCe9HWB
	NiOFYB8aQ4M6zeIRUzP5/lCbkfNbtP44/czL+yUiZ4hImlS5y8BpgdNlNy+sV
X-Google-Smtp-Source: AGHT+IF9z5sVVDWOycBuMijosCyGfwSOuw8mnL36RrKe51aZtDKZ8djtk/Tm+po0MIBLgZLcfzMdvg==
X-Received: by 2002:a17:907:6d28:b0:ad8:882e:38a with SMTP id a640c23a62f3a-ae3fc4b69d3mr413085966b.14.1751897417713;
        Mon, 07 Jul 2025 07:10:17 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:17 -0700 (PDT)
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
Subject: [PATCH 2/2] staging: media: atomisp: unify initialization flag usage in HMM
Date: Mon,  7 Jul 2025 17:09:23 +0300
Message-Id: <20250707140923.58935-3-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the initialization state of the `hmm_bo_device` was tracked
in two places: a global `hmm_initialized` boolean in `hmm.c`, and a local
integer `flag` in the `hmm_bo_device` struct. This was redundant and could
lead to inconsistent state checks.

- Removes the global `hmm_initialized` variable and all checks against it.
- Replaces the `int flag` in `struct hmm_bo_device` with a strongly-typed 
 `enum hmm_bo_device_init_flag flag` (values: UNINITED = 0, INITED = 1).
- Initializes `flag` to `HMM_BO_DEVICE_UNINITED` at declaration to 
  ensure a well-defined starting state.
- Removes a redundant `hmm_init()` call inside `__hmm_alloc()` since its
  always called after hmm_init()

This change improves type safety, consistency, and readability when
handling the HMM initialization state.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_bo.h   |  9 +++++++--
 drivers/staging/media/atomisp/pci/hmm/hmm.c      | 16 ++++------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..155f9d89b365 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -58,7 +58,10 @@
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
 
-#define	HMM_BO_DEVICE_INITED	0x1
+enum hmm_bo_device_init_flag {
+	HMM_BO_DEVICE_INITED	= 0x1,
+	HMM_BO_DEVICE_UNINITED	= 0x2,
+};
 
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
@@ -86,7 +89,9 @@ struct hmm_bo_device {
 
 	/* list lock is used to protect the entire_bo_list */
 	spinlock_t	list_lock;
-	int flag;
+
+	/* flag to indicate whether the bo device is inited or not */
+	enum hmm_bo_device_init_flag flag;
 
 	/* linked list for entire buffer object */
 	struct list_head entire_bo_list;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index c2ee9d2ec0d5..767a3a24f8e5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -24,9 +24,10 @@
 #include "mmu/isp_mmu.h"
 #include "mmu/sh_mmu_mrfld.h"
 
-struct hmm_bo_device bo_device;
+struct hmm_bo_device bo_device = {
+	.flag = HMM_BO_DEVICE_UNINITED,
+};
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
-static bool hmm_initialized;
 
 int hmm_init(void)
 {
@@ -38,8 +39,6 @@ int hmm_init(void)
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
 		return ret;
 
-	hmm_initialized = true;
-
 	/*
 	 * As hmm use NULL to indicate invalid ISP virtual address,
 	 * and ISP_VM_START is defined to 0 too, so we allocate
@@ -62,7 +61,7 @@ void hmm_cleanup(void)
 	dummy_ptr = 0;
 
 	hmm_bo_device_exit(&bo_device);
-	hmm_initialized = false;
+	bo_device.flag = HMM_BO_DEVICE_UNINITED;
 }
 
 static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
@@ -72,13 +71,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	struct hmm_buffer_object *bo;
 	int ret;
 
-	/*
-	 * Check if we are initialized. In the ideal world we wouldn't need
-	 * this but we can tackle it once the driver is a lot cleaner
-	 */
-
-	if (!hmm_initialized)
-		hmm_init();
 	/* Get page number from size */
 	pgnr = size_to_pgnr_ceil(bytes);
 
-- 
2.25.1


