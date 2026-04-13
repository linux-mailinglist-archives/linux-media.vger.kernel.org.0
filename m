Return-Path: <linux-media+bounces-58658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BnAEMfC3Gn5VwkAu9opvQ
	(envelope-from <linux-media+bounces-58658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:17:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E011A3EA7BB
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA41F300988B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE283B19A6;
	Mon, 13 Apr 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq+l0fPn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA4319601
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075424; cv=none; b=UQYWRzEfsguWSKvkFS9LBBKFYY0kkOks9H32mBlo/cnMzjKpldnnjKttOt37JKf4RkwX1T/D8YMlPNWOxgTZho/XmDEduQ2ciQ8BsDU2kLaA7vb93EJxI1FPCf09TbQ2J4ZkbqvGZ8uYR/w8oQHLj5XWddp0ZwFYElZvf6XeiXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075424; c=relaxed/simple;
	bh=akcy74XyU5d3K3sQ81gj9lOIwvVjGvvwp94SwFPj7Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klMnbBMDjMfGF8gPsATIN/KdVnOpb90dQ2gpXYdjNJwAbyWIpdukxv4Y6hB8vtsnt7scjM22xfQgOJIdJKt8T+JT8iIbp3SbML2NshNoEWWtNS9KbQRYes619otCmR/LFYiNppWaHG7RCw9L/49Z+6S3GmRlU9FyBpN9MByloM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq+l0fPn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b980785a0bfso549722066b.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075421; x=1776680221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2tbEuLkkgaSm8hCLkYwPYv74ch+wx0NWHk6i91CF3s=;
        b=dq+l0fPnNL9SwEKQ/8uTHNSrZ1eQt6zJ8hrZFZ/RZew8+emPJe3i80BXPQUGQFGwXZ
         8FKOOEAA1S8r5KeRhMBbpfCEnEPbb8Jsv7t/Kt80278PSV89JrrLl1gqzg6CyKD++OAB
         nLXR6kSYaLJ15E4S9mhPsYQjuM/27Jk8FDrq6wur6U5tFVeITjGE/Pj8bQZI7X41jASQ
         w0ViKmCTfvBW2kl47D+ZQ+IB0ov1DfQY2uEz8c2Sp9stJtKbuxl9T0/dqDlQwTAKHI49
         eDi1UdvpbL7v8O1AgmAbuMduj6VxaPnKq1SFUtY96ZjLxasN4u7ZC9zv3jE11YnftfXv
         CSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075421; x=1776680221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2tbEuLkkgaSm8hCLkYwPYv74ch+wx0NWHk6i91CF3s=;
        b=Ulof1Vx5DC+fqKm6kCJDktKMP7lQae7SHI4VW0wJrTdmv2EudL71NmiGMiXragyKcX
         2blUooAmCrxn2p6VpgK7npOiF8id9YG9aL8gY/t+rKBgo1PG+cA7OtSCCWpULcawK6Mf
         XNcJsLw1zdYSpgZy9pGAV+5Ti22RK75rETOhHLbeJCE0HZiSQsAkkCQ2DoQYuSCwa6GL
         u9slQldDk7a7TgWhqgUigIrQiLf77CIqSI/dNhfMkYbCrf8fDmzd73M8dpmM739o4ADG
         vMYkFTOfTKCUKXkBNPHMHh6EFgHtkW7REczej0UsqA1FqzOXp526e8q7rprB3FQMHk+5
         uDFA==
X-Gm-Message-State: AOJu0Yzpj8w6Vc/r9JwEsQwvFVS4k6vtg817kEUqLG2dgls9Gm+X8myD
	NxELr58oYJi2ZNLy1AzyYsSVDkewBws0UiLgq45nG1p+sQtQyCgG+Sh75rh3kmX18XA=
X-Gm-Gg: AeBDiet7CdbU/sdKQqvpjDh/Vu7pb/Xnt0uWHqP1LnQtbtt7zSouCK26mHLbihVf8NI
	r8F0BTSxbRoab4r7RdZ+VhLKNyC1rlsS9X/NDFlZSc/IsLlOWJjCJtdhNr+cOVtWJtSzzd2U/Ic
	adbdFVfWwLpk4AO+ZrE0ZWpabRAJR0YBA/QcHzRlMjp1RE7hPp00heNOBuODDekBgv3rpQGTJb6
	4SjZgPijGkDE3kl8kPr8nNBPvd0SgEknrWuBLcWJRuVXh+RmTB7zX4QDcuB2wTTyOMYHlzmKXBl
	7gE9K2GWhQvzHmx1TOoGyzNMY/f0D9Obo5dSgtAt4mKs60VM0+ZEplfYMyWcAuf4osvNHErU6bl
	o6h+o1hbL66au2MpYvvvOFf50xmH5OkLOuiQQhY1014Gm+vw5L9jE3mO/v4o1acgZganKdv/9Ek
	CPo21MltUPqhkvcuJsHn7i/Kh1nMrmKziMqpk0u4IUSzzn0+hByCjAhVjtxV1tq/8U4nyVfxVOH
	L1+Npd/NE0T3p22V63DTdU1bkbZxC/zB8UKAhC3jQ1e1062qD/R49JryTXhvpaspmUDxERGIBTE
	BGIutA==
X-Received: by 2002:a17:907:e10d:b0:b97:eae9:d45e with SMTP id a640c23a62f3a-b9d7279f3d4mr388494066b.50.1776075420885;
        Mon, 13 Apr 2026 03:17:00 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm307755666b.23.2026.04.13.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:17:00 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v2] staging: media: ipu7: fix double-free and use-after-free in error paths
Date: Mon, 13 Apr 2026 12:15:33 +0200
Message-ID: <20260413101533.496090-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205057.386856-5-hossu.alexandru@gmail.com>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58658-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.988];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E011A3EA7BB
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
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
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


