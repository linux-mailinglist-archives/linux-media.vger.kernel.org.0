Return-Path: <linux-media+bounces-60286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO90HiWZ+GkAxAIAu9opvQ
	(envelope-from <linux-media+bounces-60286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:03:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5A4BD62E
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C24E1302AF04
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EC539BFEE;
	Mon,  4 May 2026 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv0+wAO+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27C3D522F
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899579; cv=none; b=PD46EZkpaWPnYiCZPgOvjOviY28hwj/oZ8BPKbqKfM13X3AVGgGMZkeZZj8N8f0mNf+5kND6YMCJ2dCva0n3qrGib+XGmUMlICKEyC28lU+SmjUkAClqq1kYk5pFRTChAe4kwj3jZNI5uhUNTJwFIbsw+ihTuUeADaFvD8G0C7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899579; c=relaxed/simple;
	bh=C3Kz5qTzZkB+SC+9hZnM3gfu9srJJQ7bGN4QKH1fps8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qOVA10DN6UEoCFRL/S+rFX8SAf9XhNFr4e/wyA/sDHNHZY8pBw+5qUMGDUY3yZ0MdzQhodee6/bNL7NMHj37F2tikG4VlR7XElnD+tqLVydtkk61PvYkuHcnPwp3ghj92y/G/Q0xgHHlwfDupvJtCWQ9HkfM+m/AuDi14o4y8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv0+wAO+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c80291e6237so786078a12.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777899576; x=1778504376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKZVhHxD7xRzXNoGtRypXUUEsdwehShk5FlRxtbxB7o=;
        b=Jv0+wAO+3tmNecmKFUNVY/quzP/AzNKl2Bk1o8jFYzTIRph7yePrXMh313VSfUtKF+
         unhvvassZVeLbU4dI3TI3d1fXrxjMhp06KzHetmntW3RdQpC5mld9FKt/D7Kcnv1w5Zg
         VI4MXBWVMeIfFMaDoGJUTDWE2JasyLHWH30hkUAlrZh+bx25vwcsuL7mzU9+oNs3HsJP
         AuNEhLu3EoLzofUgwTEfmS4KPKhTBD3AZy+038Dt6byksnpAXsPvHld1b09rqNhoYxQZ
         AZFkk8gdFKkzUv20Z+wYTUwohejbt39oFFnVLYxS/a2JrVrLmd5/TW1HrtJ4xw5GdsYk
         IFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899576; x=1778504376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKZVhHxD7xRzXNoGtRypXUUEsdwehShk5FlRxtbxB7o=;
        b=KtiaQ1zVgOWGekgcfhSaDSkUoOgKc6712lDNJYmBRRXRHfZc2uy4m7QU51nw+TYvnx
         JlDJt0s5bFvldGUrP+roZn8JW+mAj92OEK1YQ4B4fbehGjw4FwE7keQgNTS7K6d24s5B
         AzTspUe0qeYw+rPve2Rxv+uBZa2rBf1YwwWw/k9YCVkIkcGlRMpu4N5QsYakgM7Miqrz
         xBgvH1hyDOE0/qwMqPyVPrEFUTMPgJ4FZApvU6MlrcMkcpzHTAp4G0sa34lI6K2bSu+K
         f/0rra6F40tVvKjBQ3Dk/GNwJwidlbRYD+mpphJ9Fdrwcb7PyYYofLQwTx9QYVMQjhBs
         gOIw==
X-Forwarded-Encrypted: i=1; AFNElJ/wHYJ06eEDwlqVCTSQcFUDz8bsVSVdML5I2SvkFnaujY3eRu1ZPg6EVTX2jMK9aTWXQR2Zhk94zrYaJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA92xJZQeUZM5RPK3G+tjJnWdApycqdgFcuix21mmOe+LBKFb/
	eMeWiXGqL8N4+17Y+r5rs0eSEY6gTr3lPMke0Z64hUzv4aO9TomEJ9+L
X-Gm-Gg: AeBDieuz7LU+2+fbLjBgyf1ZM12LYcNUa3n3xWwgjp/7/hNfkMSDfPxjm0Y30J1f4D0
	WT6xcuodoli3mTTNlWiCzwjfid8HW2nFMeR+QAjaofw6FpJLNfsnnGXYCzi1JIdacfwXJZLEK0d
	UzpUqMNQI40N6ulkviTBViWvKI6n5ywee5xHl5jhHrivGuk6xglbd1c7i3wzMckQMlQBychbOZ4
	LuyNCB4l2RtUdpKjiwjVuljG3ieo3akZmHdP6XswEWL1jb4UESNFlkz+C105Iaoetke10ZvkaSC
	0WWjYFZLCkZJqoqvRr5cWgYSBRApS6rnXt/IQvOOVcK+86IfWSA174kDkYVq9HAdKZ0gs/09w/Z
	vZFy0FdnJ5qmvwwf1s+tVAZTYoPvF3FlT5Xc0BSAtyA3GWc4kPGEFV0rVK/ZZjwjUPHitLJphwP
	S9dDExxaeRUqk/+rpFho+hqMHGghgCLCM=
X-Received: by 2002:a05:6a20:7491:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3a7f1c97a99mr9968814637.27.1777899576509;
        Mon, 04 May 2026 05:59:36 -0700 (PDT)
Received: from lgs.. ([223.99.13.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f84asm9192517a12.19.2026.05.04.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:59:36 -0700 (PDT)
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
Subject: [PATCH v2] media: staging/ipu7: Fix pdata double free in init error paths
Date: Mon,  4 May 2026 20:59:05 +0800
Message-ID: <20260504125905.580124-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DEB5A4BD62E
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
	TAGGED_FROM(0.00)[bounces-60286-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
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
v2:
  - Use ERR_PTR(ret) instead of ERR_CAST(ret) after caching PTR_ERR(),
    fixing the build errors reported by kernel test robot.

 drivers/staging/media/ipu7/ipu7.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..21746752a2b0 100644
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
2.43.0


