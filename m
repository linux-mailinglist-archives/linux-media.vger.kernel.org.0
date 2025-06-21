Return-Path: <linux-media+bounces-35514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA0AE27A0
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 08:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4548189C141
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 06:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E940F1A7AF7;
	Sat, 21 Jun 2025 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1JPIFFc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2241195808;
	Sat, 21 Jun 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750487401; cv=none; b=c9JlZSaroIvVXN9fwglmnMQn1fa0X9BbxsCG4YRrS5Bir5vN4fqL7S2r4NTXUDVprqIlVF3ygdKu8LjXqTRmZMRP0X00FHEpTMhIC5CnFZVTqG8d5SktewauapZuWXUgr5n2K50MQZaroNUSDQM+S5sNcXKWs0jJWwwDg44uyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750487401; c=relaxed/simple;
	bh=+8nxB59T4nNd/zAuaPjugmozXPdx/wYZUcfV2AVIE7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sm7gZCMrxtyIrw25+y/dtb741NTHPmlUoFbsmJ6KIsBEasLXiLbONCUzE5v/YF+0G58SdIs0NwUNte1k2MlY9H9Fs9JjK02VnlcG8UKAQcN5TcBtEiJXSb6cQHbDGUkxKihQ80rk392jERdduFhD5c+tQGrORQHy1Nm5YSiC+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1JPIFFc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso364585f8f.3;
        Fri, 20 Jun 2025 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750487398; x=1751092198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkjbtNwR+2HkOqNIDNJiFuWYyKYkGQKZSPa6ldxqxrI=;
        b=b1JPIFFcGcLvyoaCXr4m1Gcqowx73LwYz0RgY4y1MKYJNFogkoTvonMH7EDPcTjZgg
         5T5+ALx2dO8iEDJQSSrZ8moznlg2EaoegDDycL+GpdIBmLrPNNdF0od2wUvdezA/GWvU
         rporetJH50E2WkLCa8bGuVw3nK3IqDYjVM0VwOXzrSDwT8Fk3JNHbwt01FfNiAsH+PoQ
         EaDdZPJ0hsSV3jiaNq2+ncm16w1/yWeCz8LrsbGmZhiVUvoGC3zOIrUgdG3jula93eS1
         nhYjQH0V0keU6AS6QzsxhDbdVbkuS0FT6EhdQZHtFN9T7xU8sKFcszrWM+BtZOEWriaN
         F3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750487398; x=1751092198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkjbtNwR+2HkOqNIDNJiFuWYyKYkGQKZSPa6ldxqxrI=;
        b=euXD0hXhwdxgcPc5clqEUkdrFZ2CK3Yut8iHgRvioRSwyImH7pQlymvbNmgAP9COh/
         9dLU3Ei4NnEx+HfwXF3DNMIe4X/si+t4U7H4CB7OD884nbnG+gmxP+Jv4NnNifRGuRYF
         Nq3iSry+n6zr8UpTR+SNn6DlNznwvYotuqoboZr0COWhT6cyqWgwk2T8GLvJ/6RHHJcr
         YSbPW59qewoFnNOb52k8cUvvjcJtPqCH5qqVi9A7E2w7aI9NdyqmXgXwn8sbpGPi4Ybo
         Ba/V5MA6F/cR8QYBpb0GcUgoI3a3scMeFuNq9dULo77D3C/cfX+Im5/ShCB6UgIQb5W/
         FWLw==
X-Forwarded-Encrypted: i=1; AJvYcCUnhDza0Jwz4AB7wcmBr862xyK+XtN67+d4Cra/3VhkaKKZUQe0aEXLZNlUXvub0W3g6EC2hHtgSjjPfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LfVupY9djuleYR7pAeuMaT+MjMRQNUIu+W7ei+xcobbWqr5y
	cHCdPQK1bHMzny62NlWe2j5unuLLjO4wfUyZJIY572vvm/eWNlNbG+8N
X-Gm-Gg: ASbGncuh7qIJERwA+LSncKqnCzMHJwNLhGPasJQ8+dpXuU8J9FYbYsWVXHAZjBPbPbc
	yAzgfNa/Mk/EdMIqm1yRkVZBg/xfCO7I3cps1wM12lgDJ69A7qi27l5M7L0Cq5oIQ7ZTi8LN/Pd
	qoYs5fkekBRZvcMcGCevJMQ0ZvT2QBxkLLBbKOgGcFGh3C65AoEHMhOEKJCNCy4YUlEWWzBzCsl
	Mc4R1Z2vhRDi8eQAHZmMJ3w2PVaWBqKtEG6DYG3nyP28dyYVknG0thYZu+Mq57L4pNM8OwSlU1G
	+65RTQEhxXoPRKq80wZwTYcwzyJE/eWh3gs45OHaVIMN+lqocTQ00u5pHBN4hZ15k73NzM+p069
	E4DikS6H+oLZvTlK2Fi3AsOo=
X-Google-Smtp-Source: AGHT+IE/hg0M6sQ7nkl4Ba9kld0aQ2r8UvzDVcYS3F+oasLbyx+jmasGilFbARj3pfUJY1NIUWai6A==
X-Received: by 2002:a5d:5f4a:0:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a6d12a1d62mr1739186f8f.5.1750487397581;
        Fri, 20 Jun 2025 23:29:57 -0700 (PDT)
Received: from localhost.localdomain ([102.46.244.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1391sm44165945e9.9.2025.06.20.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 23:29:57 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: Replace scnprintf with sysfs_emit in bo_show
Date: Sat, 21 Jun 2025 09:29:44 +0300
Message-Id: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
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
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 24 ++++++---------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..cae1fccd06af 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -37,51 +37,41 @@ static const char hmm_bo_type_string[] = "pv";
 static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
 		       char *buf, struct list_head *bo_list, bool active)
 {
-	ssize_t ret = 0;
+	ssize_t offset = 0;
 	struct hmm_buffer_object *bo;
 	unsigned long flags;
 	int i;
 	long total[HMM_BO_LAST] = { 0 };
 	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
 
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
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
+	/* Direct return of accumlated length */
+	return offset;
 }
 
 static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-- 
2.25.1


