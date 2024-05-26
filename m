Return-Path: <linux-media+bounces-11884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F568CF2C4
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 10:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3718028144B
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 08:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85188F45;
	Sun, 26 May 2024 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HU6QDevo"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-208.smtpout.orange.fr [193.252.23.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD767462;
	Sun, 26 May 2024 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716710490; cv=none; b=UE4LRd0kFiy1XXOFVC5MeEIz7bLW9yUgHGR2aTMbSEQRCKZrG/zIcfbgd1ge/E7Y800FvP7JXg38QZdMa5u1zytVmKbDtjCSnYf/B/u/asZo1TSANTyVGNfACJrM10SHZPtQyVcTk/jSM7DqczoOvvBlT4+54lUO7qlTEqYGU/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716710490; c=relaxed/simple;
	bh=YceaYbK69STYG1+34LgP3lcfEJ/qdP71K3CN/adN8Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoiZPQuizG/2xI6UahJ3H34H/usQwMA19ItBGz8jv3uL2Uf8RogQTGtdyVFHiAmfX8LpSopRgcStIC+3gSy3IpNorp7/ZjH+o3ISwsA53dP5UXgMcjo0/t3pk0lGQUagp6hkjmoP/G6iVYtjMFN1rmIcaRuXC0tJ9GZJc+Oceuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HU6QDevo; arc=none smtp.client-ip=193.252.23.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id B8nVshp7epUD1B8nVsPLZD; Sun, 26 May 2024 10:00:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716710408;
	bh=hCZf5B7Epe9+DdIH1wmQifOFMMbDVPfjY6bD0iQQskA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HU6QDevomlXJ4SNuMksWg9zoDyFOIVAe1o5eMzgLYS8SIbuKQ06Hysame496qhyxD
	 ts1E1A29UuIAbP06wMyoiAdVylOFEZJWTkD3QuWsWjlHGK/9PuxDn3QoWvyG7VTzf1
	 n1K68OInv4vpPcy+lNWaq011Je5+eFNQT4zMAOz8MlzUASHS1wYOuQAI6BuMl6MeOB
	 t6QlYgUiT7m/ezXBs1cq8CjXbopiiezH4LMTaAiCiqQeTKmiXAP1M71gU3JXav2K2q
	 Vx4+2Dt+m+cKxgudkYrinv9NhSH7LtWbdYaDqqrzaxPg0bRZGbuwBs9hR8xxIH3lWV
	 sBLRh7uWF62hA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 May 2024 10:00:08 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	hdegoede@redhat.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/2] media: intel/ipu6: Move isys_remove() close to isys_probe()
Date: Sun, 26 May 2024 09:59:56 +0200
Message-ID: <15a056198775689cb533a7b0ea7e100559a2465d.1716710255.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to fixing a leak in isys_probe(), move isys_remove().
The fix will introduce a new function that will also be called from
isys_remove(). The code needs to be rearranged to avoid a forward
declaration.

Having the .remove function close to the .probe function is also more
standard.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - new patch
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 70 ++++++++++++------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5992138c7290..7ce2047a09b5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -925,41 +925,6 @@ static const struct dev_pm_ops isys_pm_ops = {
 	.resume = isys_resume,
 };
 
-static void isys_remove(struct auxiliary_device *auxdev)
-{
-	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
-	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
-	struct ipu6_device *isp = adev->isp;
-	struct isys_fw_msgs *fwmsg, *safe;
-	unsigned int i;
-
-	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
-		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
-			       fwmsg, fwmsg->dma_addr, 0);
-
-	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
-		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
-			       fwmsg, fwmsg->dma_addr, 0);
-
-	isys_unregister_devices(isys);
-	isys_notifier_cleanup(isys);
-
-	cpu_latency_qos_remove_request(&isys->pm_qos);
-
-	if (!isp->secure_mode) {
-		ipu6_cpd_free_pkg_dir(adev);
-		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
-		release_firmware(adev->fw);
-	}
-
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
-		mutex_destroy(&isys->streams[i].mutex);
-
-	isys_iwake_watermark_cleanup(isys);
-	mutex_destroy(&isys->stream_mutex);
-	mutex_destroy(&isys->mutex);
-}
-
 static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -1167,6 +1132,41 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	return ret;
 }
 
+static void isys_remove(struct auxiliary_device *auxdev)
+{
+	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
+	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
+	struct ipu6_device *isp = adev->isp;
+	struct isys_fw_msgs *fwmsg, *safe;
+	unsigned int i;
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
+		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
+			       fwmsg, fwmsg->dma_addr, 0);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
+		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
+			       fwmsg, fwmsg->dma_addr, 0);
+
+	isys_unregister_devices(isys);
+	isys_notifier_cleanup(isys);
+
+	cpu_latency_qos_remove_request(&isys->pm_qos);
+
+	if (!isp->secure_mode) {
+		ipu6_cpd_free_pkg_dir(adev);
+		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		release_firmware(adev->fw);
+	}
+
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
+		mutex_destroy(&isys->streams[i].mutex);
+
+	isys_iwake_watermark_cleanup(isys);
+	mutex_destroy(&isys->stream_mutex);
+	mutex_destroy(&isys->mutex);
+}
+
 struct fwmsg {
 	int type;
 	char *msg;
-- 
2.45.1


