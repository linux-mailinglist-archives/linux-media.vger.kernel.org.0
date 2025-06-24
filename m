Return-Path: <linux-media+bounces-35812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E927AE6D48
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074763B1645
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BDB2DAFCB;
	Tue, 24 Jun 2025 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K84ZgtEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D241622D4C3;
	Tue, 24 Jun 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784874; cv=none; b=AqFKtie1qtzIkCebHS+juEATmJvVDRpGMCNQ1qbCbrHuIK6vXcWh1WVXl0GA0WOclZ/jtXqhuMdZlMhI75FZZanKiyzPx10yBWS3Z0cisYl9hciQ31iPmRhSGos5FKE/sejpkOYGtfA8AA6EOCIiWPv+REvmAyhxSs2E+Y4lq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784874; c=relaxed/simple;
	bh=BdK48HQUVgROYu/fdurM4M1jjaU5V16794q7R5cWk6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E5tUQ+QHRElOZ0BPCEZ4ETwcrQcvmfxKtbVpXeQW7WBoTAHUkJPu7ylM6s4/GrRlpS383JNiTEqrLpPg/TdE3HY+Ped6eUSPeKMa6TdtTtr+WaIasVPL4pz9721jtzES7wAiWUzCB0BZOImrj8Wnb+ERNNe+1wokN3opLfu9koA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K84ZgtEy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so785547f8f.3;
        Tue, 24 Jun 2025 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750784871; x=1751389671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObyXLI84Z31XYxnK3+dlbESL592RBP6HyileFe6Fn4o=;
        b=K84ZgtEyUr/g1pR/FdshouS8mpPx0e8lc64PSXNFlnp85czVctaVsSP4DPLjHBsmdx
         ZpxFY7W4FlHYvhfotfDpfhVcUkXDZuqCB8nE5VjV2ojJNQHnXPNaDIN8vge4o5V+J9z+
         5uB4UIhbcVH3OgoXq0GfsdCuMFfkZaQ2oUxLZdfCsUEBFcYzoco+D9l2AwJZ82L01uYr
         O4iivxjJiZlFLvnaeCzBkl09Xh6QmNjDcFtDSeF/aVBCex9SAXoEAheU46NJHsSPc8sq
         MjohG4IY9g99rtryS+0h4NYMzcSiyhanr3AQPyFgRxguwmz/FTJ+ygDE3ZTOL+yddgkk
         98og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784871; x=1751389671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObyXLI84Z31XYxnK3+dlbESL592RBP6HyileFe6Fn4o=;
        b=WzK0YO/hg3hZY2n3fT0P8Vz0R46SFRvqM5kuK4ZWNYFpasJFur/TdeK5AbLJvpATx2
         OGcmaYpevd7xiQkro9WdR2ZNIQLraFi3tGxAQ1UUFTiGV/8jXsijXvNpiJg8wH7233sV
         usIE78lEJemGYswEaXeJCnOMrr6sBq4/DiT0+lKRTlsERn/B6OVhqSAAGtD450Byq5QE
         E4HEYCeUkOE3J8d5kwb+R5t4ZWyUYlKRbS+CLJUjcH5tjGtiwg3AYVsFsc6edpiRlzUH
         E0QLUDmWTnyyzM8K+3lkb59vyOjW70Ml6QSIEp9XXXgZ1U/sgixWEpveAD/keQTLQORz
         oMHw==
X-Forwarded-Encrypted: i=1; AJvYcCUKuuK4k41FfzGrDHFgZwRU6tE9FCpen0NAg5TEeUJaR1L5OaOEkBR+EazB90utuZ0WgiWAQe2Gfdmpfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqkeb8OtyED6v8Offv1WWKzWzcpBHZBW7zSVEuXkq4Dis6Zmam
	5t9W6Ff0QCYHd61c3uBqs8bTYKGJXKJGMn58dtn/TqZLsHmDNsz9/vp2
X-Gm-Gg: ASbGncv/ZPqdnHIxvtKhMBWUQiVtgpHqmvY6TT/UYAgL/t/m9DiMo2ZVHtlIstc7jIt
	uo4rv6QOHF3XTGT6VSRgrEQLA6T9Eq0kXProOdo7MkIPePxXCobb+naiocN7du9skMS6WsJbuyo
	ZHkTz9exJyjHf1cO/Co23n7q+QT4FOfEuhmnAVH+Mt2vyDHOt3RLBGJJcVDOFmGVpNB8giicbjC
	8iktPy32/og5AwUl7+XHGF2s3y9CwfSzxGazGDiDcL1AV7OtHvRg95LubqLl481vaJNumP2ZjK+
	RAm60+ttT8jnxCRKeOg/RQABlff+xmv/SyoRy/fB/2Nj/IszRj+LDLSWD6txTFljRPSuVguStHl
	yrffFMwnGm5Yqj/bY+Bp/nCA=
X-Google-Smtp-Source: AGHT+IG77uVXEH4AozCewSC0hVaIbZ+qEmV5cR5amypSmBksZVMTzHgWCpQNQvVj528NQr+Fd6jmog==
X-Received: by 2002:a05:6000:2010:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3a6d12e428amr5303702f8f.12.1750784870707;
        Tue, 24 Jun 2025 10:07:50 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff8d9sm2410172f8f.70.2025.06.24.10.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:07:50 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 20:07:46 +0300
Message-Id: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attributes active_bo and free_bo expose internal buffer state used
only for debugging purposes. These are not part of any standard kernel ABI,
and needs to be removed before this driver can be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registeration calls form hmm_init() and hmm_cleanup()

Suggested-by : Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v3:
- remove blank line

v2: https://lore.kernel.org/all/20250624144943.39297-1-abdelrahmanfekry375@gmail.com/
- Add Suggested-by line
- Remove unnecessary comments

v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/

 drivers/staging/media/atomisp/pci/hmm/hmm.c | 92 ---------------------
 1 file changed, 92 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..469de184b9b8 100644
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

@@ -145,12 +55,10 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);

 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
 	dummy_ptr = 0;
-
 	hmm_bo_device_exit(&bo_device);
 	hmm_initialized = false;
 }
--
2.25.1


