Return-Path: <linux-media+bounces-58618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJtGjIG3GkgLQkAu9opvQ
	(envelope-from <linux-media+bounces-58618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CC3E5F5A
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 309AE30028E6
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 20:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271F337FF48;
	Sun, 12 Apr 2026 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARI6uJlq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121737F016
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027179; cv=none; b=B37cQXEPthFTjCiFkpHjI8FfJi7niLVcv7hqOur43nZ0qcj2yLCTIruI2VbPfpN/4U6ufNbZKoB6bawwGuO82bej04mshvn9qazijz8BQSVgy0QrKqKrcQwkYmupKMg98u3KkpSwlIgE4+9GG/ialFw6iWLzMoug2bmc8Wm4a88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027179; c=relaxed/simple;
	bh=LSwQtTxO9bgLLfvTBTPYjeif5BKeT1vGGnw0FGL9CO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uA//frECqp3DdnGVvxxSa6hdhZEHiBldtOVVUbr9EcqqF409bbXBBC3lXDjR7N6uz4rnKNOtreY/pvrPvHjTwQhr1Zd2LOnWi0SJIbI783BCGozUvtMeC9u5F3rDke5GbGf1hP0g1Za8du6ZJ72Pp58A88zi6PETWeQ1S1JNX/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARI6uJlq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-670c6c6e64dso3184699a12.2
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027177; x=1776631977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uty9fiFuMK1NPwHipfta2OelAI5DsbnrR8419q7/lCg=;
        b=ARI6uJlqMQDTkir5WcMp5KShzfx/AOF0hmAJPVVGjA3KbSplkLMQSOoiFrly8sDO0f
         7ev2zSne5l5+aMTX4R8BgMpf7a/A2k9tg8tSO1biDgxI0VFlWexhSbSIdWq5MAcgmRzc
         nkbIUdwQWhTk42aZ/OMHOWFrGYeywRYm2pMGe9exmP5XAzFUsxZeE/ALGO4xo5sZW8Ns
         3ks44elavt1fIf0/vKiZ3SDPjdMA7iFossr+JflK4O1F2Xk39XFDkU/hNx+QhyaoX1H5
         O9p4UAtBh8GF4NNjn5mpY8kOykgkuPKnhTXnjEjtamE//tu3GLqh3O8uIRA1azJzgSiX
         8evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027177; x=1776631977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uty9fiFuMK1NPwHipfta2OelAI5DsbnrR8419q7/lCg=;
        b=sY2Y4HCJrqfBmpYf5imfKepaT+BDyZVzefFg4zzLRcKsaH8kBn4rfBQAe50Bbi/gxL
         RCRQOqLJ4wfjfGWHZbQe/MuX5kSJYfgjOYCLqBeiR6QXylzGwHgMseaJ9cJWN80rl2RU
         RHs+cLbPC/R0v45xqp6a0daMWnVx+rMX5ZIgoYRODQ8u+k8O4O7uY8thicJ8rwEPAwwB
         zBgPb2W2oRac9AIAAdspv/af2tcfIKKp309GchK0++lP/QPEqgxVXzWhuR3SzkIZyQwd
         NRq0Iy0L5H8MkjtYJIFXy9Aqyh+2OFPOJArK7XWzGFpnCTi/6sLTvJ6hVfi6bJ2znUrM
         KheQ==
X-Gm-Message-State: AOJu0YyRNNIBNw3yjbDPuvnioXGw3KLTlSppdGVaL650vzs0pXUwn90O
	yV1dmSt6b8bIHeskB+NwibNCM/X3V2Ch1mtFX9foP3zbO9VpBpB7b2u5AJa0lXSLHyE=
X-Gm-Gg: AeBDievRSy46gScxs9OohzL/sQqe/C2KPsalY331EeeoSasFQ2zKP8wfgKLhm9qj+yg
	SSbWRbYx207qEr6ji0JcWo+eKAzXvR2eWiX3LiLmsx5Uz7apbP9SlpUIROT8BL7Uu3qQ8dfswpj
	S0K0j/D/s3XC8XmhiIHvyNBuSOd8DrVDcSAHC3MMZu+ie4TQSiylpAsr+bX/q1WcIEuNWzxKQjd
	wwe7v/7JbOFb/1SQ9MmaYBZEp6DHpY4UC+JkE9TNfrk0bpciBtI6MxkbJYDjVRrUCKvZe+6pR9J
	1bAXcNeDqEfgGc9rlCygDscdoIvQ0zSWkE0+/mKTCBw8LTUuaxAeDzuM4A5IsYB2x8aq9yTtolk
	fkLUkZ/lN4PmZnKM7tUgyu7iNHLhMer9qi2V8JY30Ilce/QuBpzURQvj0CY+JUTPxUjHEnc3sSn
	ciuHUo83+9k+b3sDhLAGwuPl4ZWzDXPTBwHUYTy6cpCjds+GVzNrxpoT1K9Ikr6tn5aal2IJ/qf
	Pc3vK/Je7GmHO+dvVHSc4G2R27QntRomYAv0gK4l6fDf2oGIx/bh8RiaR6fYkIqucZt+q9CH0x+
	H5zkRQ==
X-Received: by 2002:a17:907:a804:b0:b9c:36a1:d32a with SMTP id a640c23a62f3a-b9d72796861mr597373766b.48.1776027176477;
        Sun, 12 Apr 2026 13:52:56 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77c2sm259088466b.24.2026.04.12.13.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:55 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in error paths
Date: Sun, 12 Apr 2026 22:51:28 +0200
Message-ID: <20260412205128.387234-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58618-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 554CC3E5F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In both ipu7_isys_init() and ipu7_psys_init(), pdata is allocated and
then passed to ipu7_bus_initialize_device(), which stores it in
adev->pdata. The ipu7_bus_release() function frees adev->pdata when the
device's reference count drops to zero.

Two error paths incorrectly call kfree(pdata) after the device teardown
has already freed it:

1. When ipu7_mmu_init() fails: put_device() is called, which drops the
   reference count to zero and triggers ipu7_bus_release() ->
   kfree(pdata). The subsequent kfree(pdata) is a double-free.

2. When ipu7_bus_add_device() fails: it calls auxiliary_device_uninit()
   internally, which calls put_device() -> ipu7_bus_release() ->
   kfree(pdata). The subsequent kfree(pdata) is again a double-free.

Note that the kfree(pdata) when ipu7_bus_initialize_device() itself
fails is correct, because in that case auxiliary_device_init() failed
and the release function was never set up, so pdata must be freed
manually.

Remove the redundant kfree(pdata) calls from the two affected error
paths.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..043b67dfe19a 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2172,7 +2172,6 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
 			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
 		return ERR_CAST(isys_adev->mmu);
 	}
 
@@ -2180,10 +2179,8 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->subsys = IPU_IS;
 
 	ret = ipu7_bus_add_device(isys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return isys_adev;
 }
@@ -2219,7 +2216,6 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
 			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
 		return ERR_CAST(psys_adev->mmu);
 	}
 
@@ -2227,10 +2223,8 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
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
2.53.0


