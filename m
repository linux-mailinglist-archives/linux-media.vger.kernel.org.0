Return-Path: <linux-media+bounces-35797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AEAE69B2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 945867ADB63
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149442D9ED1;
	Tue, 24 Jun 2025 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQmocEus"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863432D879C;
	Tue, 24 Jun 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776624; cv=none; b=dX5BtjigclNN5QZaIkfj836kX1VctEt8HqsLNmxgoenUkoiLBKk60RdxPtemN1RAl2PwdNiR3gj8LdAtLIuCvukk5ylBDNLBuMbWjyFXbBKd5JZHaUAQtV44YQxuTpvVYhikAucMSzkd09/12NDeDwhHfRdUa2ysyXPtbC4D4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776624; c=relaxed/simple;
	bh=BLBs6VvptUTipdYqP5sZ+EBtpSjpz67hsxN65i7P6Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aw157kbYhNbyaTG+5Utp4tz+VW42e9FlN6ma5IrTE08NdSj08GmcNACjyMdbpTM7wYSLzf4IwPtNgscbfcxYK1SposqZN8hB6m9RKtguU0kzNs+MwhjIRoZq14hYNhus+0524iM1XuNN3XhcaFGAiLDqLv0aDKQrOQqlwfVDs8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQmocEus; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e62619afso700318f8f.1;
        Tue, 24 Jun 2025 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750776621; x=1751381421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLiCLOp03+AJLmaw4roATsJrCtRQMhCkeGidyycUVtg=;
        b=DQmocEusaKUSWfM1qkLQFiwm12YE1lUruwggFTlPJqBY1msYoU+SMR0D0SVMKZm9Vv
         uB0sbJ//eGFWE7olTkP5L8JOkzCZgqkHIBhk200LOaS3c88gh/pI0CZFD0Kex11fzXVL
         3LLCdYLMqH8E4j2S8yIa0A7f74WmlC7gT5CJuJya/QPih3jbObqY+KwWzMz605dEE3Xk
         Tegf0M4pNwpzZ9caCjrAX6D1Ota1KRtgq4a9z7Ag94JwNPNB7+7pP9yoUXQJxmIcUzM9
         c85dO3t28puu97a0Y1yeR+bCPiUQXX20Gi6jBden6Ach4LuDzoZADjiU8P3k1uKpXN85
         EjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776621; x=1751381421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLiCLOp03+AJLmaw4roATsJrCtRQMhCkeGidyycUVtg=;
        b=I3wendY0H0mbCF7vGEOTzLdfWyEOCh6s33o60BslZZTuXOQQHumZBbxOoxv54iUlCh
         U3qkDH4qwMHwKc9qPXv51/+KTfk095d4PoRKQvc0QtQV4Wtq/QqNdt9K0RZOGuyfcj1p
         S15X6n7OEXyqXm6dR2QPJAjZZyeaHn2MQwhjlZ95ceKLpGZaG36DLgeglIRGvHAN3KSf
         pNDv9Bd/nbWZ5LYuuTZnAJt83Cm4/FkjwCct8trtMOvcRI+uzZgMrSTVHl3fPGdSTWSi
         KKwTgGHlDjHVWn7bZc08oElNihuQPQ6f/U/3k+gnPweCR8nFq6Mu1ZUIY5aIFnh2SnfU
         hPRw==
X-Forwarded-Encrypted: i=1; AJvYcCX++CexitOYn82Rbi4R/3SWer2/nJSoMFxqtjEblXHjboH1w49jAOTzDWYe+kAP0cpXT8mjfihgR6k8AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfYaYgvIeEUoAPJyWkD0y+w0anY2cZavIk2w1fkP45y7nmXN0
	L/81Rlt9MEAH1MgtAKfV5le9G9MEjGfOPSbK4x0mGa3wsDNEAJKq61iM
X-Gm-Gg: ASbGncvzftIAIdW2e8JpoQ1r97aO7B1x7qprM+cLaLVeS0ineadf/kLcWx72jFV5m0i
	WSN4Sb8mUENIaM3rOged8+LIZXt7cIbrXN20d8lGPcwpKE/yvEqMKVu4bIBocvucFB9t1Ecvafm
	Psqxk0YxXCPWXIhdaztIjcM6FwdT5CIKtJIXfoxFVcR1VV340szYWilXL9FSe9eiU7dMFJ25Ae8
	wbbBWy0i80yeErV0yaASLpnrkGFzgcL7y/XtQkB+UciZK3CacghxdeHoyRCeTBxBhTYiVNm0iPx
	k1UWd935cc+oE/KnnHQN80bJHdMFptATkWkLz47rd1D/Aj0O6GT7e61h0NU0wmfKOUlPxQeZGfj
	l84215bh1Hh4vGzIl6f8x42o=
X-Google-Smtp-Source: AGHT+IGp7FJxQ3lNRUT+69d4u3yFJMen8jE313LI5u9E0DtmCWAKYJVpQdPQQhXkTON2m4kEE//Lew==
X-Received: by 2002:a05:6000:2f83:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a6d128bc58mr4951035f8f.3.1750776620577;
        Tue, 24 Jun 2025 07:50:20 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff8b8sm2092841f8f.71.2025.06.24.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:50:19 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 17:49:43 +0300
Message-Id: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
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

Suggested-by : Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Add Suggested-by line
- Remove unnecessary comments
v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/

 drivers/staging/media/atomisp/pci/hmm/hmm.c | 92 +--------------------
 1 file changed, 1 insertion(+), 91 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..0a4d7dd5e6c4 100644
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
 
@@ -145,7 +55,7 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
+
 
 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
-- 
2.25.1


