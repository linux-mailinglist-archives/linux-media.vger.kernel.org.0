Return-Path: <linux-media+bounces-53198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK35GDGXnGluJgQAu9opvQ
	(envelope-from <linux-media+bounces-53198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:06:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90B17B3E5
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 823AE304E320
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8960533B6C0;
	Mon, 23 Feb 2026 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="S9Ih2+Zx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m25493.xmail.ntesmail.com (mail-m25493.xmail.ntesmail.com [103.129.254.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7533AD8D;
	Mon, 23 Feb 2026 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.254.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869909; cv=none; b=TTQZNFuyBNLgtPumrUtqDeqWlsnOxCZpjO6pc9Iu/Wz4FLsqT799piKwF62up6w4+i3d/MpFHKusdNidv7mh+mZ/hZO0tR+ARIXbktW3OHPYL2Aj1GshWtOuuYj7PliGUtggnmVVe8jTwm47Mdk/RRfI7QBpI0HKdeT9JtclNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869909; c=relaxed/simple;
	bh=+Zmx9HFXd3J1WMpSSkClIvvvSDK/h8AC9XbuO3aIJpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ph+TmLsyG0SOzPmiNATrVR6sfDzEB3/HbYROqbOtK4aCiRY/9pte3aQHuUSvW/Vxlz4DqtoB5uTs3ySZBEyiZhd9gQ3fz3ijaMoR6VfHUqC5WFYf+GqyQZ1HcHC4D31qGG5BH3bf0PvR2jrcK6tBoh1/5LATIPGDTe+6j95l170=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=S9Ih2+Zx; arc=none smtp.client-ip=103.129.254.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b3c9189;
	Mon, 23 Feb 2026 23:42:38 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <phasta@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 03/37] media: ipu6: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
Date: Mon, 23 Feb 2026 23:42:23 +0800
Message-Id: <1771861343-85256-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9c8b2ab7c109cckunm348ae840986fa0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx1KTFZOQksfGh0ZSUJKH0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=S9Ih2+ZxJOD2xWedJlRXj3vAypT5C9ewv2kSioBCFmH7hwEztuYBtKu15ryQA0dZ29eiC5xp6f6YYaNRg7+tPWpq6nWjmWFlNnearyipGOfUyfGkmU5oSh074R7eDKFuIZoypcUx+5z1BkOWynBL8CPW8ka1rxhPHDP5noLEEog=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=968HR2FsOyt4L9TQuezVAWJYaCmhjAu3piY44vWApCw=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53198-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF90B17B3E5
X-Rspamd-Action: no action

pcim_enable_device() no longer automatically manages IRQ vectors via devres.
Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
pcim_alloc_irq_vectors() should be used.

To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/media/pci/intel/ipu6/ipu6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 24238f8..6ab94db 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -471,7 +471,7 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
 		return 0;
 	}
 
-	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
+	ret = pcim_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
 	if (ret < 0)
 		return dev_err_probe(&dev->dev, ret, "Request msi failed");
 
-- 
2.7.4


