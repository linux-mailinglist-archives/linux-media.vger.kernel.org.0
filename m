Return-Path: <linux-media+bounces-58669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL29OYYI3WkZZAkAu9opvQ
	(envelope-from <linux-media+bounces-58669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 17:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A463EDC96
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 17:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D9C1301DD83
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 15:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0907F3D8129;
	Mon, 13 Apr 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfh2DF49"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094293C457C
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093255; cv=none; b=OGMwmhN2RIwrLCtHW05+s09u2CBWwLeSPG9u6W6ox8KdHpbCsSINWOVTbby44jU8qxVVcaVCR2d/s0RbhXa0blOz0WpnZb5jeZ7qxsxp95je8oel1nn/VqQX+muwGwtg+e5xPxBZBm/cpmDr+2WgRWDinBeDkooO01GGfc5U8bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093255; c=relaxed/simple;
	bh=wLnKz0lTNl3u6Hc5SEDvuWJmbFpREBwXZsvmW+L1huQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yrnjrm0PROqfBvFbGwJet/7E1AsKhJ3COHGOY4w9cGxRZxJiSIPNtu/pqGAKSHLZKRq/FvU99STxmZg0r9OcvzKtI06nc2JmyVPHa3Fsn2uEglnD7N0OxWAX/0m+DT9H4eva28kvrD/uiSkMCHefiNxv57urUHQJjKhDUhFjPJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfh2DF49; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9358dd7f79so740006466b.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776093252; x=1776698052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siLykDQuPSI0K3YOTzdJt9UJ6NmzQ8lrmgay3bCveqg=;
        b=jfh2DF495sMJ8Sn3lOZni2srcAzTGOqLtu5IdKOVuvDouo/mORVthzQU5VwmN+5Cuc
         9Rlxv1EZ/2XTHZ9NxH5eRNZLrPA9hvKdW37zxOM+CubqP+1c8MjOscDIaL2D6oCBKgdP
         KjmgfZrXqHtxZpsoHVG/jlFgm1I8QJVIVJBf/L5oPDh1FDdFNXSWyeJdkEnw3i3eHftl
         FkXQLzc6kiW3mZPfg6khe9Pf5hiOx6K+PPVD2fa3RmkCj2/rtCB91YLAzd2D9kBAteBu
         lk5XKXNjnkZywsOCnZBb6Jgy3KyiAvOiivsLJ3g4B/MW2mHBfzyd30YgxOZ9zWHuaxoG
         YRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093252; x=1776698052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siLykDQuPSI0K3YOTzdJt9UJ6NmzQ8lrmgay3bCveqg=;
        b=TOHDD8oHM8Yk9ZumBMJK6BRInK5EatvTCYAAJBe9nANOhbD22dHPCHJ0X9SGc6UpXZ
         zd1W6bSpI2C9KU2mympkkaxQxJk4RqQEHX5tovwnYZyAn5VVOQ2IC+CRpwMQINCb7ty9
         pjgbxlaYZw0qR4oi6rQwJmiuennNytMl0lYl712y2j6tRkofwscGWU812SUgDJPj2kRi
         yN6x3U2F/OecZ3lS3c8ps4gQXD+Ns4lT+DWVupcJWsOJ16Hc9aZbxMbzSBm/DYPfRPhN
         cgJGvw2uoxqVIRTqRVm/t3Okuz44R6dok/9XdH9G43LWO25Kuyi5ukawYJK4ADAjTZLA
         V5Gg==
X-Gm-Message-State: AOJu0YwPbZxZ00aAFBxR3Z7ytjonFjTCq+VGjdmrv6v1PXitIJhA2t7j
	Iu2RcaaA+Su2jeC31thlwYjwhqmTyYHxMtXnIMnApKjXV5ZzG6runNPIc+Lnd4i9xcButg==
X-Gm-Gg: AeBDietXD5XmrAhhApPyXZyvoFad92HHcmiIM6V8FhehK5usMa0QyfHeALWlJjwLJQ3
	ihma3hJQ0qF3maIkFzLyUDI83kVbX04gtGx4K84sIA4NtNIZ3KHxd7uw0Srr6PQKZgLxCcGS6EV
	jtggEmPinuIABacp8+9SNAIXedUGQxFLbn0ykfc6ObVm+6u7uGpOkwPGm6Wi18Ayi0mxh6tdNoo
	N4Jz25671BtSN/sYjetFsSM0FYd82fmatFPqecaCeXMM0dH92chtxRW2qJwDYrmP3EtP6A3bkT9
	OZq4xgP0zFx+Vzo6Lt11tIhzmBU94b466E78A420+5PEMCDve+0IOaVhXozEdL7XJygMY3I/4Kk
	zyZkDO9RSxAF3J6x+z/Nv/mYvIQ+X116oe16r4ohKsE4PokqYDddO2bRIRKuu5rJgNAOdgyEygv
	zH1L7H2CappYuX6BnCsExbQCBnbIBLsOWaTpUr4x7hZghXlvElA7UVfum5FmJUXwi+smQMOvrmp
	PqZc79D1JRrAsDnTCvzRz/yUIC3fW9ne83Bziah71xU/HC6A/lVGd75Ha6EgaNbOAOX3jPufcUb
	/+vuxGxqnnaN29UC
X-Received: by 2002:a17:907:8e16:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-b9d7267e295mr773185066b.35.1776093252053;
        Mon, 13 Apr 2026 08:14:12 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77dfsm323472966b.18.2026.04.13.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:14:11 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] staging: media: ipu7: fix double-free and use-after-free in error paths
Date: Mon, 13 Apr 2026 17:12:44 +0200
Message-ID: <20260413151244.612492-1-hossu.alexandru@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58669-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59A463EDC96
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

Additionally, the error code was not saved before calling put_device(),
causing ERR_CAST() to dereference the already-freed adev pointer when
constructing the return value. Fix this by saving the error from
dev_err_probe() before put_device() and returning ERR_PTR() instead.

Remove the redundant kfree(pdata) calls and fix the use-after-free in
the return values of the two affected error paths.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v3:
 - Add Cc: stable@vger.kernel.org (Media CI)

v2:
 - Add Fixes tag (Dan Carpenter)
 - Save error before put_device() to avoid use-after-free in ERR_CAST()
   return value; use ERR_PTR(ret) instead (Dan Carpenter)
 - Apply same fix to ipu7_psys_init() (Dan Carpenter)

 drivers/staging/media/ipu7/ipu7.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..310e3f24e571 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2169,21 +2169,18 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
-			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
+		ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
+				    "ipu7_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(isys_adev->mmu);
+		return ERR_PTR(ret);
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
@@ -2216,21 +2213,18 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu = ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
-			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
+				    "ipu7_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(psys_adev->mmu);
+		return ERR_PTR(ret);
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
2.53.0


