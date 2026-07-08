Return-Path: <linux-media+bounces-67002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qO5QAsJiTmreLgIAu9opvQ
	(envelope-from <linux-media+bounces-67002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:46:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1F7278B6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:46:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YzGVUAM2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67002-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67002-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20D0C313833D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C319D478876;
	Wed,  8 Jul 2026 14:33:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC8285CB4
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521232; cv=none; b=Rq13q1wTI2PIIC88IFA8v4MJ3sfmpAnjLBW0Y7Hct+GkNIZeSrm6CnM/3kEowwOwd5GHvWh6bxamYkQWC/wYPzaELOgn1R2Wpsq7R6iYMcvpNL15CBSRYeWEWut3ipwCA8DxkYKZcmaGQi0uGetjiQ4eODmgjM5HXjzFb0lUHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521232; c=relaxed/simple;
	bh=0UDqQtglcqACOUkBl+tP6mqomEhvOb5H4/SjQHIPDM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEVIEVEY2wwB1FC6ff+iaf7Tngj4BFB3AH3qlUoDm2Y6YTibHuPveX9aXHUktRttZLfCxHL8HVZRIqAbnClCgprhlDQldVDRzfzwVIj83icZqwXohKfdjaXBPbbLl/fsK4ln12Y/UQjS0+Bn8etQ6rOspsccUKV7i41QOfzrAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzGVUAM2; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cac59f8b64so8936125ad.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783521229; x=1784126029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ou1FiOpvl68pVG0xzGeXE/RgdW+vLOyJ2K6VlrmSnA0=;
        b=YzGVUAM2ov5haWNKGgbgbKvjMU9uiYVCjx9AR//1wT9ZE7vobqrJJ8BW8xVi4qPcKy
         Vk8GJcj16ty6TwgfXq3hwjPoPERzZh4CsFyBGQdQ8XszSyTdvf1s/lYQV9pgo4XUqIML
         onRBX6KJbC3XSVmitcGTCRO0Yvj82B1nJrKY2LZHCwd8KK0zEiiqgB8bmAfiYHGZWts7
         R61dqt8YdP+aFEXa3/cVnUMFC89Lee2Vmz5zgLQJMflXi5kDAGn8nzs4qeA+37LLobf8
         xzNMgGenn6ec57FKncnvAoaUZz616tZdcdGM/9AeeLBePHCNVApeE10DI9/iCfZzoXPD
         KJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521229; x=1784126029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ou1FiOpvl68pVG0xzGeXE/RgdW+vLOyJ2K6VlrmSnA0=;
        b=izFtGpMInbHos8bYvH/t6FQrAi/Ku6qJlAQmmOvivtkCHciXrUvI5FW/TjG1K5Nj6j
         9NeDJELbN8vPiEDmY6idpT15UHE1pnmtvQkL+wg5f6pdCC18NrZ1RUIxN2knI5BW+IDP
         wxD5iRy697gXe38v9DyNnQ49XJhBKMv2vHlcnoT+GovcZRZdymjvWUZTYF/x3TeCkyvF
         avxPrOshZsQWr6PtnRleUQI5sWbqQRuRA84amc1NgrHMXHYMNGINzpffzacosQKvh77I
         JbQNS0/Iba3iBNE8btCmpiuawQxsyTc7psZqzOPimbdDBfCmw8EBG0qQDkduUVj13q0b
         s6kQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOHLE7oWAEnrflReRhmGjNbdpQKNHuhp5V/sHg9a7JHkZ5V2rrsbVz+SMstCtAHunyD8z4EQieJE7aXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRRmycGrftKiouBo6mVP0BNlHc67oSM4Us5aV6qSqUywrQRyx
	EBb0qDXTlWV8DGBcKm15GSK1yXuXzAciINqWRsfbJrLnb7ScTFx7Jzxz
X-Gm-Gg: AfdE7ck/ObTxePDeUPXdwESeFUeHLS1K3SGWkZv1P26pAhCFYdMoxd8m2RdOn5YNS5q
	l1pPH6llxEZpkipjStoUzaNF50dd4DcOCe0nLuYS0aTlBBEnCI9DxzsPevte4gWpuV5h51Gj74y
	d++0nIrku1u+vGw44npgOOMZAw9uoSaiojLuicMoP4GixsZpVEWTN5TaaRluowFClQlIYfXgeYa
	yhDtqVVpG1RNL9QjWmyJkd5zjXgFeDZsW4y48dICcr4YvUclIEkOo7VkHq4uwQQvwW0teEOSY0R
	j6eXBToKyoSYixB2+FZMnq4r00fmOlUA8bsLYY/R0DIlEupteCsthzfk8RJIkRRc6+3mYIZJx4w
	SHRNlXdtTt8X34kY5LAqqSxRdsqgbgNobqcFG9225kh5l42EqLgxhE2TBs7tRtHi0y2rg152Oiz
	cEnoiTrjkAje8c9vOCT+BxG2dHAkce1uDg
X-Received: by 2002:a17:902:ef48:b0:2cc:fbf5:afaa with SMTP id d9443c01a7336-2ccfbf5b04emr1707785ad.20.1783521228922;
        Wed, 08 Jul 2026 07:33:48 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1b95:b995:f60c:5c67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf7858sm29331485ad.23.2026.07.08.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:48 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com
Cc: tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: ipu6: Do not free aux device pdata after init
Date: Wed,  8 Jul 2026 22:33:43 +0800
Message-ID: <20260708143343.3165299-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67002-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:tian.shu.qiu@intel.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92D1F7278B6

ipu6_bus_initialize_device() stores the isys/psys pdata pointer in
struct ipu6_bus_device and initializes the auxiliary device. After that
point, error unwinding must drop the auxiliary device reference and let
ipu6_bus_release() free both the bus device and adev->pdata.

The isys and psys init paths already call put_device() when MMU
initialization fails, and ipu6_bus_add_device() calls
auxiliary_device_uninit() on auxiliary_device_add() failure. Both paths
therefore run the bus release callback. The extra kfree(pdata) in the
callers can release the same object a second time.

Remove the manual pdata frees after the auxiliary device has been
initialized.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: cb3117b074ae ("media: intel/ipu6: add IPU auxiliary devices")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d033d46181692..5449a2006bcce 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -400,7 +400,6 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
 		return dev_err_cast_probe(dev, isys_adev->mmu,
 				"ipu6_mmu_init(isys_adev->mmu) failed\n");
 	}
@@ -408,10 +407,8 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
 
 	ret = ipu6_bus_add_device(isys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return isys_adev;
 }
@@ -444,7 +441,6 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
 		return dev_err_cast_probe(&pdev->dev, psys_adev->mmu,
 				"ipu6_mmu_init(psys_adev->mmu) failed\n");
 	}
@@ -452,10 +448,8 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
 
 	ret = ipu6_bus_add_device(psys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return psys_adev;
 }
-- 
2.51.0


