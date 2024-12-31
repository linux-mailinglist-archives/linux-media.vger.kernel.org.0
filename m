Return-Path: <linux-media+bounces-24194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9379FEE65
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 10:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13265188319A
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425DE1925A6;
	Tue, 31 Dec 2024 09:37:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54584189903
	for <linux-media@vger.kernel.org>; Tue, 31 Dec 2024 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735637862; cv=none; b=IVp+iaC39i2xAs+lN8ZV9lcTrzb9H2w+8Xn6sdiSADIfznMXglV3ilJldGg9SCsLwV6pjSeupQMPcPIsS8vur5RXy67u5eHj4R3R6bbdGstdwoUi9Z2HmkBpkBkpIHy5lnEJodYGlg5DHb1OxrcV8mxuZBOBBYGpNPr9vaUXACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735637862; c=relaxed/simple;
	bh=fNlFM1sJLzXfKXH6chPLiZVmDoBJ+ttP7e0lp/TbYic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxS5NuSP0msm2H+fb6qXiBBR6W4yhTNJir/wmoUTdERpn0Qg/P8Fnic2FnTbKwVAEQgkuqTS/mFcXQn1z7rPey/HimIcOG0Kn/t+6efTmL5T0sLM+Qwg6pucC4e7hziyCSQXKYtIV5ZNMWzJG4wBZoUHUsYXhK6JXw2oIhyxd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Matthias Schwarzott <zzam@gentoo.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Schwarzott <zzam@gentoo.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH v2] cx23885: add simple suspend/resume
Date: Tue, 31 Dec 2024 10:37:25 +0100
Message-ID: <20241231093725.29894-1-zzam@gentoo.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After suspend-to-memory or suspend-to-disk, additional chips are no longer
reachable via i2c. Trying to tune to DVB-C on a cx23885 based
Hauppauge WinTV-HVR-4400-HD:

  si2165 8-0064: could not set chip_mode
  tda18271: performing RF tracking filter calibration

This patch implements the simplest possible suspend/resume that is
enough to tune to dvb-c channel after resume.
Afterwards dmesg looks like this:

  si2165 8-0064: downloading firmware from file 'dvb-demod-si2165.fw' \
    size=5768
  si2165 8-0064: si2165_upload_firmware: extracted patch_version=0x9a, \
    block_count=0x27, crc_expected=0xcc0a
  si2165 8-0064: fw load finished
  tda18271: performing RF tracking filter calibration
  tda18271: RF tracking filter calibration complete

Signed-off-by: Matthias Schwarzott <zzam@gentoo.org>

---
Changes in v2:
- Reformatted commit-message to make checkpatch happy.

Signed-off-by: Matthias Schwarzott <zzam@gentoo.org>
---
 drivers/media/pci/cx23885/cx23885-core.c | 33 +++++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index c8705d786cdd..a39f445ce22a 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2231,6 +2231,28 @@ static void cx23885_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
+static int __maybe_unused cx23885_suspend(struct device *dev_d)
+{
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
+	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct cx23885_dev *dev = to_cx23885(v4l2_dev);
+
+	cx23885_shutdown(dev);
+
+	return 0;
+}
+
+static int __maybe_unused cx23885_resume(struct device *dev_d)
+{
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
+	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct cx23885_dev *dev = to_cx23885(v4l2_dev);
+
+	cx23885_reset(dev);
+
+	return 0;
+}
+
 static const struct pci_device_id cx23885_pci_tbl[] = {
 	{
 		/* CX23885 */
@@ -2250,11 +2272,14 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
+
 static struct pci_driver cx23885_pci_driver = {
-	.name     = "cx23885",
-	.id_table = cx23885_pci_tbl,
-	.probe    = cx23885_initdev,
-	.remove   = cx23885_finidev,
+	.name      = "cx23885",
+	.id_table  = cx23885_pci_tbl,
+	.probe     = cx23885_initdev,
+	.remove    = cx23885_finidev,
+	.driver.pm = &cx23885_pm_ops,
 };
 
 static int __init cx23885_init(void)
-- 
2.47.1


