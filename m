Return-Path: <linux-media+bounces-53906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M8KJ1mVo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A871CA747
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECBB4303088C
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACB52857F1;
	Sun,  1 Mar 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSG6NqrK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A398B2594B9;
	Sun,  1 Mar 2026 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328047; cv=none; b=cX5ZLzMezQB/Dz4lcDjgll0Z/2qaowIrN11h1oEefnPa1z/1jff4STRjfX8LWsgExqfsZyRPIuW86Sym/6/SvGwrc3AGE5xlvqDwJQOWHYUw0lduzLhN491ynBJmZDSms89s0hhZIFz/x6vmZo/b4pHOW5flbEJRzNJwBA3VnuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328047; c=relaxed/simple;
	bh=r1HqdgGBASibQ0YgGvLi61p1+FJlWwdBXXrE+0qFUnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pedHSNXW9jho6ZrdjwFd4pR9jHczvCDKYhbIEE0AeemJGX1OcK3GdR2ahJnCnvtp6141BdsSxzeiT0vts5ZWsAWHJlpCL1PUgbML0hgIwvMtxuj/ibwAck7FPj6klLbD4wmvf5INPazSp+9WMljEglxHFPJ1HPfjsn5WIU87bpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSG6NqrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF22CC19421;
	Sun,  1 Mar 2026 01:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328047;
	bh=r1HqdgGBASibQ0YgGvLi61p1+FJlWwdBXXrE+0qFUnw=;
	h=From:To:Cc:Subject:Date:From;
	b=jSG6NqrKPnTBhr/Zg4TNAxQ8LAF2hPaakOefAGiZ9U9pAWkuKaQ+j+Q5HUBBKpjq9
	 g47zlON4EjwSUViqz0XU554jDoDtQDaDncBLnGs9YLUVDElHH5YGHoLRHAsWDveD3X
	 7tP/S/k3ab9fA564tAuwBwsBGgJ2FliAZXdZhOUmxp29rmTVwuM+NmYZMiu9Dod9CG
	 1B2R7VItc4E3AeZu03kcwRyb2IO6os59LDdcO1UiJ/pLey8weqT1G8WojzMRCuPc+6
	 /unx/mG9vOsBX5jAfLEIWR9i7cAWTw8U1yHQ3UNmMyhz/6KqKPig+H+cL88fIQBQ0c
	 TDuXBPNHw6e2A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	bingbu.cao@intel.com
Cc: Stable@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ipu6: Fix RPM reference leak in probe error paths" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:45 -0500
Message-ID: <20260301012045.1676429-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53906-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74A871CA747
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 6099f78e4c9223f4de4169d2fd1cded01279da1a Mon Sep 17 00:00:00 2001
From: Bingbu Cao <bingbu.cao@intel.com>
Date: Tue, 23 Dec 2025 15:22:59 +0800
Subject: [PATCH] media: ipu6: Fix RPM reference leak in probe error paths

Several error paths in ipu6_pci_probe() were jumping directly to
out_ipu6_bus_del_devices without releasing the runtime PM reference.
Add pm_runtime_put_sync() before cleaning up other resources.

Cc: Stable@vger.kernel.org
Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 1f4f20b9c94dc..a2768f44017a5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -630,21 +630,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret,
 			      "Failed to set MMU hardware\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_buttress_map_fw_image(isp->psys, isp->cpd_fw,
 					 &isp->psys->fw_sgt);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret,
 			      "failed to create pkg dir\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = devm_request_threaded_irq(dev, pdev->irq, ipu6_buttress_isr,
@@ -652,7 +652,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					IRQF_SHARED, IPU6_NAME, isp);
 	if (ret) {
 		dev_err_probe(dev, ret, "Requesting irq failed\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_buttress_authenticate(isp);
@@ -683,6 +683,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 out_free_irq:
 	devm_free_irq(dev, pdev->irq, isp);
+out_ipu6_rpm_put:
+	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
 	if (isp->psys) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-- 
2.51.0





