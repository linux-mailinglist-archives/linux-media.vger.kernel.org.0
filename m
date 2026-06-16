Return-Path: <linux-media+bounces-65033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WTnRFr5UMWrPgwUAu9opvQ
	(envelope-from <linux-media+bounces-65033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:50:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8886901C2
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:50:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=mkK1FQZ+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65033-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65033-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48AFC31D023B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEF62E7376;
	Tue, 16 Jun 2026 13:48:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88BC34889F;
	Tue, 16 Jun 2026 13:48:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617731; cv=none; b=JgmMW2v9v+VY/3PEwcwrLe1VKIj9pAUfEwZNFrnrQPv+XjpsfIjSxM9ylVkaCf0Hdk2Rih+ymfRmpfxWSXmtPI9H2FuSvgL/L6sq2HsqJ9Egf2oIlJS4AmjW6VEPtQ2YqOxAxLRCxHM3v/wxx1jmBtlkOhDr0yqzDBQieLEPez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617731; c=relaxed/simple;
	bh=6vKKZfWhkpOcahNkN6fPgTtNvN16Fz+lZVSa/A/XPZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbQDIYUXgzDi2Hu4DgEMnayYtKX+bE54IqwOfq6oyy9aE/d98adBAMyXcUaxysmsPwaOZr1Wpf0/vaY9sAjvELia4Nt+DsnoecvDrH7GM10fbazdb+wQm82qTS5qWye8+pNi9uROK7azYTUKLdcqOQUaHRfJuOcON6jBMLTTRGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=mkK1FQZ+; arc=none smtp.client-ip=45.254.49.198
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 429ab32aa;
	Tue, 16 Jun 2026 21:43:25 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	error27@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH v3 2/2] media: atomisp: fix memory leak in atomisp_csi2_bridge_parse_firmware()
Date: Tue, 16 Jun 2026 21:43:19 +0800
Message-Id: <20260616134319.3969928-3-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
References: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed0ac2fb603a2kunmea38caa144bd4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSE9PVhlDGh5OTB1LTx9JH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=mkK1FQZ+aRZhAGzDTk9EfY7y1U0S3bTSppOOcrcP7RRW6DuN1YnmL+1PUsTS/EShtIFyGx41ODIxUbz5xXp7aPEKGKjVjjVxXjk3ufdjeW4MPuEQzZ1MotC5WukZoUIFus6Z4V4SGxZr5W//L9c76SlKtt5Wvsu+sM3fF5wuBpM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=fUnovNl8RSsNGJ1VN9ZTCzfu9exJp/BqQnWeD7RuiJg=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65033-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:error27@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:dawei.feng@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:dkim,seu.edu.cn:email,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF8886901C2

atomisp_csi2_bridge_parse_firmware() initializes isp->notifier and may
allocate async notifier connections via v4l2_async_nf_add_fwnode_remote().
However, these resources are currently leaked if a subsequent entity
registration or probe step fails, or when the driver is removed.

Fix this by introducing dedicated helpers to clean up and unregister the
async notifier state. Call atomisp_notifier_cleanup() to release the
allocated connections in both the entity registration failure path and the
overall probe unwind path.

Additionally, invoke atomisp_notifier_unregister() during the device
remove path to ensure the notifier is properly unregistered from the V4L2
core before its underlying resources are freed.

Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
Reported-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5ba9584b81d7..1073d9e5eafb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -798,6 +798,17 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 	return atomisp_csi_lane_config(isp);
 }
 
+static void atomisp_notifier_cleanup(struct atomisp_device *isp)
+{
+	v4l2_async_nf_cleanup(&isp->notifier);
+}
+
+static void atomisp_notifier_unregister(struct atomisp_device *isp)
+{
+	v4l2_async_nf_unregister(&isp->notifier);
+	atomisp_notifier_cleanup(isp);
+}
+
 static void atomisp_unregister_entities(struct atomisp_device *isp)
 {
 	unsigned int i;
@@ -869,6 +880,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 csi_and_subdev_probe_failed:
+	atomisp_notifier_cleanup(isp);
 	v4l2_device_unregister(&isp->v4l2_dev);
 v4l2_device_failed:
 	media_device_unregister(&isp->media_dev);
@@ -1444,6 +1456,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
+	atomisp_notifier_cleanup(isp);
 	atomisp_unregister_entities(isp);
 error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
@@ -1471,6 +1484,7 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
+	atomisp_notifier_unregister(isp);
 	atomisp_unregister_entities(isp);
 	atomisp_uninitialize_modules(isp);
 	media_device_cleanup(&isp->media_dev);
-- 
2.34.1


