Return-Path: <linux-media+bounces-35782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CDAE65FC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1219517B7A1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEE42BEC55;
	Tue, 24 Jun 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5N19+7i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A1230996;
	Tue, 24 Jun 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770575; cv=none; b=ddDNSGmsKlRd6Ua/OwRsnJsDMi0WtxFbAecA3w7ezjUTgEPekIKoXmd2mT5beklgd7XJenDQ5HzmCJMz9Cq0kXgjKMw3+rZ5ObJemRKgrR1Lew28v+OSdDA4SkCOTF/Xq8Vs199TakqCnItBb5I2zO7XoBn/tGorPlkggY3CQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770575; c=relaxed/simple;
	bh=Tk8yEI3GZqNwKijiJ5yRZYVzXAGwr9hx9JMC1LACDXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IvBtcIU0zzdKBWkehZ0jYphjIeQCrK7jP3JQnumeicPCmlypT3pILyfpUEIGJJwrGCHYXsw6A6TE0I8gcK1jc3kQN/ehZQyXhMwL//pUYML9JY8A3jxqKzagqTQJsqU95ICFQ4GMS8HR5h2/vFbAbOq13QNMyXey9m16RsmB9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5N19+7i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso5932595e9.3;
        Tue, 24 Jun 2025 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750770572; x=1751375372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxLpALMzmoxpVe3FlifJUdEQ1NnJF0gckla7VIIchZs=;
        b=a5N19+7ikml0rqizJP6zEqN7qcMoXxD0REyGVS5gBHnxO+GxD1CAJU9YxLE6IpMJsw
         VVk1zSwlSJzuvySQjudWn38Wc+OHAGxlwxNuFkEKzLcq0lvaS0HS03cLLnWf24wqyV0J
         tH5WE52ZZ2wM/S5G9foCGWyy8lF8V0MKwWHXLPJh3jctRu98pdJjbZ/eivHUpUSdj76l
         M+6DXaIJONT6fsFESGEG2ytjFP5LhEFWo5iFXZWEmjhhIPyifc/vUTKJ0udR9VyKjHwd
         V1f17bNu7HrNMWqx0U2waxzhBPQkdX2lpr8xvTYdxGjsGWvDc8VIGgFCVK4n6aXx7GAh
         OE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770572; x=1751375372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxLpALMzmoxpVe3FlifJUdEQ1NnJF0gckla7VIIchZs=;
        b=dCvdOJWOFzRVdX8I9zHj+MQeAZ3LJ9Xf7qp6sxbdgw5GLOf8EyvARe25FO2RcMUZgN
         SBeHlm5J63A379lEq6EkGHMVr1M9oTlk3dIvubiUsq4FZh0FrrnphUnUHZcD20w/jp+c
         ohPEAQG56EU03AUMtDepaP902GC09eNnLIhHOp/wB2Ak9UzLiRcrfsns1jyUwW+jhKRv
         Oi73sjmxweWWKZb8TOciG1FczDrqWOsF1c+gr7YcU1xYrvqP8Pqdvy4or3zYCPiR0MYR
         CYqqNatW16y90PWgeeomHNJpT/ltwIi9DPcFjlo01bpyRtZsSqb5QgiRMOk2Sp1jaYwR
         GfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7dhKLsthBS/KW2oTtiavtUeYRtJsug4BhlfXoOfH/ydFKbXXoAcZ0kP+E1kblmN1Al9AL3x1NNZUCUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw203JdhQxKG7EqxQvEWnRGKzVLNSZjsojbdBSTkAvvdgJOpgxx
	blvXx33YlyamiEiTLJKUEVMww4Oxoqwiy84Hf8ONg4ZdPYCWfst6JUrL
X-Gm-Gg: ASbGnctyD1r3tph0lHCbFcHKXZu1ATmpUa9mzUTxjnYB95uFFGWlcCUWT8d4pbjjFZr
	8PumIsEcx04pSYnE/QdCV9wTTmqkbqpKCCCRi0klRrBp7K3TwyNlvAC9lvBYliZZiPuMhXVIeB5
	auQi/ExVTewhePEMng+y8QU9zleOXMNgSJYjsBHwfBKrnLWutShHBCygbi7R202fgkaY+rTx2GO
	7dPhitFHkcYXlYXHEM/13/fBvohO/pzGt1RSjvHTvzMbbfyg+HW7AyVQLkRmsChrHoD5k0NQwTf
	UBeTQZSteSIbILO74MlHBMRqxXfS13y49PBTO8H10jFeoaHz2rX5Yv6lQL1cILQEoNiqMmQt8dC
	+llccGfwosM+8noyn8BGhdnQ=
X-Google-Smtp-Source: AGHT+IHsf8cmrP64oRsfpdCr7BlNEA/LhYNMjqGEQaEwBjnK4q7OGcd9CA/AJSrbLZ3SkSDkBXxHvQ==
X-Received: by 2002:a05:600c:a07:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-453659bee9bmr56152845e9.4.1750770571439;
        Tue, 24 Jun 2025 06:09:31 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm174024495e9.6.2025.06.24.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:09:31 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	shuah@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 16:08:41 +0300
Message-Id: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com>
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
any standard kernel ABI and needs to be removed before this
driver can be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registration calls form hmm_init() and hmm_cleanup()

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 93 +--------------------
 1 file changed, 3 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..3e5d522125f9 100644
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
@@ -130,13 +48,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	if (!ret) {
-		ret = sysfs_create_group(&atomisp_dev->kobj,
-					 atomisp_attribute_group);
-		if (ret)
-			dev_err(atomisp_dev,
-				"%s Failed to create sysfs\n", __func__);
-	}
+	/* Removed sysfs group registration for active_bo and free_bo attributes */
 
 	return ret;
 }
@@ -145,7 +57,8 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
+
+	/* Removed sysfs group remove for active_bo and free_bo attributes */
 
 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
-- 
2.25.1


