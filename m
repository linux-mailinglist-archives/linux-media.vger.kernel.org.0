Return-Path: <linux-media+bounces-35540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BAAE2EA6
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 08:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC21171FB4
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 06:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA63195808;
	Sun, 22 Jun 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuKsuAQA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A928632B;
	Sun, 22 Jun 2025 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750575251; cv=none; b=fH6SAPJyvgRoe10XN/r+mZZ7pYy7Fe2vC6C7fszu5aH+EGXyory6N/T33Gsp3uPcc85qc4gjp6NnZOm8VtICEZrvHXQRnL0KPOrqss08DT0loRirkm53U7WO+Ln923Dl+Pzbreat7r6ou6DGZrB3L3nap9LkcSSGjHXQ078x2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750575251; c=relaxed/simple;
	bh=y+V1uFlm7MNi2yr+Kq0y/HSDVPLN1zc1MGZNQ695iXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WHRjrfp5I1X17eYAGiNxi1spmEdYHrXetpeIcKRs2sBV2pjSCOOlSs6fEMACtmKZLgo9zA7LvUSvlnViZcX/rLrq2OOfTiN5eZuYTFouRsz8+G9qBTOciD2mcHZEbTeIwSuwC4/ADQ1ZyvImq/2a88SZVq+3n9e0BsPkdTWYAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuKsuAQA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45360a81885so956425e9.2;
        Sat, 21 Jun 2025 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750575248; x=1751180048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKQhZ8dZeOW7ZtXU8mvGFMoD5xv3BUDMxbPdweeK0AI=;
        b=fuKsuAQALTWHUZ843MNKjQZIyy4gHQud3nWBPKv9ZWRoBbBV4H9qibmZNH2+QPO1ly
         Y4M54zzKXP+3hqTIDzfQk7rqOThNFAaU0birkuvuo5i+Xv0mMMrT+hvEzDWh/47a1hBt
         GzGEhZHL3Rny7dVjPQXF4f3cPLkrlXxlTJp1xcoc3Epz+85J8nYGCJ/T7/KB4skwuNrH
         r+ExYooMKPqRMJZEUuXGJA5W5AVEHqq5GZ3O+3BkeJ5YbMlIYbF8JuQL9QbPK3m2nOE4
         vids9q39O2wyN5Gxz90sVmdYVg2vbmg+VIVOwKxKgGw8WY0orraOO3xQiGbAf0l6m2kk
         U7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750575248; x=1751180048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKQhZ8dZeOW7ZtXU8mvGFMoD5xv3BUDMxbPdweeK0AI=;
        b=vbPwAStxOhspiFO9Mkn5Q+KP6abhJ5WNonKAcyH4v9wnnsHGZ5upNEvreJo7Q00bc2
         Z8eJGe9ZXOnsAJFR4f9ZsyR/IWfJ62Hleebq8v2Ma8M7WOvScACKv5oE66bjDYBa+Q3u
         v2xzDzl/+6XtFf5IfYR+8ERofrP7qOziQttjEUSJebRmd4xZe+uT80+spH1F+92R+TzM
         LOTCIJyKMyt7jVl26mCTL28iK1d3LPeToyud0VAZlJmhSUgT6P3e5AuSYNr6JyL7g3H4
         S4nybpuIYuTCwfbImFOSkR1cdeR7/5Sx8lhLGnK9M0uRvEAIjOqDO15OrOG4Cs+I0r0J
         vuNg==
X-Forwarded-Encrypted: i=1; AJvYcCXMmAnH0C4+FVXmP+OlF6UAkuEz7/B2w8oVNztaFU+k34kbmShMQ6eYbehL0tD8RsTEBVNd1BTKC5SggA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvzQBsTiHStBdomx838KcDRv6EnmtyGunRQXVhQJ4ZNnW/+Nk
	Yik6Ye4SuzkgaKVEke7FB4UqqJ0P72SBSPlQDPW3CzQHuGMnJRay++vf
X-Gm-Gg: ASbGncuMNA1gLg1F4VAQ7o7O7+d/GBsRP/VaTgaQbawSmzLZWTuaPpXLvQomle/zmWT
	x9kjwjh8ML0rNC+RZi+kR+ruSURMXfkty0IssvHzRnEl8aLV5J33xEUpF75Gxm8767dTV7UlH4L
	AZ4eizi1ZyjuV4ZzpMqyf1wnAwm1aVppFgIw93T+gSNIWn568MMW9c1bD898MiTJ8PA9tDGEO2D
	xnECY5wQsufHnpb3MrENQMF4Ab5eSMtmuQvY5FAf3xJd9RcvetAki+bCk1gpqlt1o/z0ChxuXBB
	A4t+8GS+A20eSJQruReQdOtPkoGZ+SJzV2MYlQ5Zro3sw2MPJQsa08bSDSYuHo7Kcn5YNPg0/v9
	5SPTyP5TGo38NyGXEsnOOEOFI
X-Google-Smtp-Source: AGHT+IExP4WFR6DFGR0lMKjyTFJaG5ZsU4nOX8iA3vhlq5spPOb76BvedsWJNEMS5tZZjqcVc+b98w==
X-Received: by 2002:a05:600c:524b:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-453659b8b23mr29407995e9.5.1750575247520;
        Sat, 21 Jun 2025 23:54:07 -0700 (PDT)
Received: from localhost.localdomain ([156.208.241.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17c35sm6497432f8f.31.2025.06.21.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 23:54:07 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Replace scnprintf with sysfs_emit in bo_show
Date: Sun, 22 Jun 2025 09:53:40 +0300
Message-Id: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
PAGE_SIZE handling and standardized sysfs output.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Change the place of ssize_t offset.
- Addressing a possible change in behaviour if sysfs_emit fails.
v1: https://lore.kernel.org/all/20250621062944.168386-1-abdelrahmanfekry375@gmail.com/
- Convert scnprintf with sysfs_emit/sysfs_emit_at in bo_show func.
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 25 +++++++--------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..b5d0516e36dc 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -37,51 +37,42 @@ static const char hmm_bo_type_string[] = "pv";
 static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
 		       char *buf, struct list_head *bo_list, bool active)
 {
-	ssize_t ret = 0;
 	struct hmm_buffer_object *bo;
 	unsigned long flags;
 	int i;
 	long total[HMM_BO_LAST] = { 0 };
 	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
+	ssize_t offset = 0;
 
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
+	/* Changing to sysfs_emit changes the behaviour if failed*/
+	offset += sysfs_emit(buf, "type pgnr\n");
 
 	spin_lock_irqsave(&bo_device.list_lock, flags);
 	list_for_each_entry(bo, bo_list, list) {
 		if ((active && (bo->status & HMM_BO_ALLOCED)) ||
 		    (!active && !(bo->status & HMM_BO_ALLOCED))) {
-			ret = scnprintf(buf + index1, PAGE_SIZE - index1,
+			offset += sysfs_emit_at(buf, offset,
 					"%c %d\n",
 					hmm_bo_type_string[bo->type], bo->pgnr);
 
 			total[bo->type] += bo->pgnr;
 			count[bo->type]++;
-			if (ret > 0)
-				index1 += ret;
 		}
 	}
 	spin_unlock_irqrestore(&bo_device.list_lock, flags);
 
 	for (i = 0; i < HMM_BO_LAST; i++) {
 		if (count[i]) {
-			ret = scnprintf(buf + index1 + index2,
-					PAGE_SIZE - index1 - index2,
+			offset += sysfs_emit_at(buf,
+					offset,
 					"%ld %c buffer objects: %ld KB\n",
 					count[i], hmm_bo_type_string[i],
 					total[i] * 4);
-			if (ret > 0)
-				index2 += ret;
 		}
 	}
 
-	/* Add trailing zero, not included by scnprintf */
-	return index1 + index2 + 1;
+	/* Direct return of accumulated length */
+	return offset;
 }
 
 static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-- 
2.25.1


