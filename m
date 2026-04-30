Return-Path: <linux-media+bounces-60041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDYqHm/r8mltvgEAu9opvQ
	(envelope-from <linux-media+bounces-60041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:41:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E978649DA71
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 017FF301F144
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 05:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3236C59E;
	Thu, 30 Apr 2026 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixphaErN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80923BD17
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527656; cv=none; b=IXiHAo/8JE+ldizQ53tUTJn0ip45BkEUeo+HElKC8wOoixvfvPRZAWXxmeZ9lG8HQSbpQigSE+x1UpwsCDTVjQ/VJCpd22P46z4O6qg5/QW4O7/3g2MeB18h/uPZVALsBW3EfngXdBHr9Vw13smkJNintr1GU6mPJmd9RNr3jZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527656; c=relaxed/simple;
	bh=sZvheAZoRjvdKOT6LW/gjyVxmpfa0CA+ZSeMbibVNSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFSMTozRYCq4ttgy9bCqXdh4vs0VpEOPIvi5qbu5pbQwQkMBpzD8wRxj77HAel4OH2t2TVcPsMWlufeKzrPslcmBldcB6NQMDDCI1jlVdS/wA9NlSpGjsugLeITVSWI7E9llSl9dYahaHsHa4ZoaUUdLUYrG+nh5tpndmBEkIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixphaErN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so227530b3a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 22:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777527655; x=1778132455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+zXDwYkscXkwwf38XELFgWIvVjVJaXVdUr9CcmySjw=;
        b=ixphaErNs1+/2ILmQCYRgWaxvCWSimn26T8rN2NXAFpG81WzPmP301pp41584+7nyE
         LIxLmg7ZKtFrM4TTCuzJNLm2690OjnDaET0z/LByFF7v6qPc5XgXYl2kXGLw61OVvNn2
         CABnfil3PrtKadAnPUUu4jIyekW+Q8SgDkAiCwOOcPNlxHIFskKEsPGgSUF6awnX1wxJ
         Uu4lzt2nYNiGMSk2VrMZolmKAa2yjwxdO4LkxY2Zc6fQIT6aZFvksW/AxgXzXSvYr//H
         6jgRIkHRGZAbJpb/GUWx93mvogS0NTMjmO/abJhreTaP0ny/c9wca3UdEOkhpn+qUWZa
         QacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777527655; x=1778132455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+zXDwYkscXkwwf38XELFgWIvVjVJaXVdUr9CcmySjw=;
        b=EWbdtlNLH2pVc/oOXPXfc8FZeGjv0I5Tk9XNI33119c+fp6fq3avdKTrHeGLxsoM8e
         IrNhQqO36WFpmgBXKVCV7oMXKIPiVzZWbeVbrogilorDcoeV+jlK8jPyUj8LD4QvSZ8V
         jlxTzKXLPPfP195ssPN5yCJBB4QZ2b2Q7O2TNDr5JjFFwqd71XA6TQg5BAGMbSoGWfXw
         2YowiD/kpMQXFcCzbT5dKytshIeJONCBJIf0S+LIGmYZvAqNC8Re1navLe6M8TZ1a5jy
         u1tSOkVcaXicaj4zBTEAI1OxBs//ZRjn1P5tPpi85oEg4RWTDl+Xw4YXindD7hoY9c74
         CwQg==
X-Forwarded-Encrypted: i=1; AFNElJ882hHl6rLGRDE6lNsYzM9GFVmWVs1iGyIqRpGB9IlYamNmVCdMMA9Ot4XETLTgdHIXAmBqj86/MAOaJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweiORdgbNIjf/t9d1ensaeeHsoZFE6tUZVxHFgMBOlU/WYoFFd
	Y3ZLHH9VSDQIJLgl0xCAhda+7TUoPprwtUE7oiAZXVqXSUvZOb5Qh/xm
X-Gm-Gg: AeBDiet6R98O5LZe/1m7dQJ3x6h/NlV/nrkavDbxD8KXhVDVX9tVWGSYPWmXuhRF+4q
	PdpQTRWyYQu86nJDsgyEc8DF0tZCdIIBZcbA5GfB8po7asLsH7DUWV/BP1XGaDaV82p8tm7OaMq
	EI7yNgqLTzGXHolfG5/KjiZuLOW6HV7MziQMLOiJxcl4zxZ+Zt5pyDBy2kEmmuw+4M204QGd07W
	jIBipke2cTUIHom3irmMGotxq8lByF7dOkW3ETquE959fXJNqJyJwdQJlPaQcsdNOFEOzmAG+H6
	hg9OIW6fXI6EshNYQgNpp3daK128ZHAqQ9OazSK1ctdgJi7eoaIZZ14oGCNM6hvdL7uSwBqVqwJ
	aEJJJAwCT3TjMhTADYeQi0kUiMGNlVqDS4wWFzU3ib29ziDqBndnd+8OXDXST0nmbpy/7IB2i05
	gVdHkDHZG4vYQs/B+e
X-Received: by 2002:a05:6a00:302a:b0:82f:4386:7989 with SMTP id d2e1a72fcca58-834fdc0daabmr1792231b3a.24.1777527654799;
        Wed, 29 Apr 2026 22:40:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb090sm3858242b3a.43.2026.04.29.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:40:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
Date: Thu, 30 Apr 2026 13:38:20 +0800
Message-ID: <20260430053820.446080-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E978649DA71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60041-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

ipu7_bus_initialize_device() stores the caller allocated pdata pointer in
adev->pdata and installs ipu7_bus_release() as the device release callback.
After auxiliary_device_init() succeeds, pdata is released by
ipu7_bus_release().

The isys and psys init error paths still call kfree(pdata) after
put_device() or after ipu7_bus_add_device() fails. In both cases the
auxiliary device release callback has already been invoked, so pdata has
already been freed through adev->pdata.

Remove the duplicate kfree(pdata) calls. Also cache the MMU init error
before calling put_device(), since put_device() may release the auxiliary
device container.

This issue was found by a static analysis tool I am developing.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..069f0238c8cf 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2169,21 +2169,19 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
+		ret = PTR_ERR(isys_adev->mmu);
+		dev_err_probe(dev, ret,
 			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(isys_adev->mmu);
+		return ERR_CAST(ret);
 	}
 
 	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
 	isys_adev->subsys = IPU_IS;
 
 	ret = ipu7_bus_add_device(isys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return isys_adev;
 }
@@ -2216,21 +2214,19 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu = ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
+		ret = PTR_ERR(psys_adev->mmu);
+		dev_err_probe(&pdev->dev, ret,
 			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(psys_adev->mmu);
+		return ERR_CAST(ret);
 	}
 
 	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
 	psys_adev->subsys = IPU_PS;
 
 	ret = ipu7_bus_add_device(psys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return psys_adev;
 }
-- 
2.43.0


