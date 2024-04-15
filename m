Return-Path: <linux-media+bounces-9366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDA8A4E64
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752AF280E2E
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696666D1B4;
	Mon, 15 Apr 2024 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4ihh8z0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53A6CDD5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182586; cv=none; b=fVZyM+e9I831C+YVdbk1e8JSbiPY2O3Hiik7theBjmzqFIlul/+dIw+SjvaFVPFoV1f/1BHDeB/boVfxv7d2rpIM33a2COKFjv7kmD4PdVroNA9Hlr1lQ4za0NiWbK8yFxgR8rmET1qA4FjHYW+2jb5MGircnnE8idsX0vzTA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182586; c=relaxed/simple;
	bh=KKMyyTAJpFqESuB5V6vdcIg2wnpqr+JE1DJB4LNDbiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmEqXpyDS6rdulgJBC8pRTpOJxifan4fk+s6Ht6PvzEQmyBpeaytw5SzGcEtHxFqTY4Nwbw/xp1IgFPb8+sUMgPjRJQmfYFL28uP97rVXfVCh8FGO4126ypMFOv2OcHKB82WHPXJ41Rev2x2R3YT20ZVEd+Yo0v+IkgFr0noexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4ihh8z0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAxWP/s/oIBjuL1HfB2KxTYGQKJBNrhVAEBZv4tLZwo=;
	b=E4ihh8z0MsPAvuoyFYD504HNjbT7dFad1y0gaEE+xEGpKPNtY2J7OEpjDsVODoeDylPABX
	sS0PxrjIx1L9dKaA/3gMwUSgPgtra+tggxGNuiPriKSziakjJmL8uuNyQIUVwmOlA9gh45
	bzfxD7SWiQBnMB+rFgxqfPel1mh3vZs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-WZseYm0-Mk60lJ7kryeAOw-1; Mon,
 15 Apr 2024 08:03:00 -0400
X-MC-Unique: WZseYm0-Mk60lJ7kryeAOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C50F29ABA13;
	Mon, 15 Apr 2024 12:03:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00512C13FA2;
	Mon, 15 Apr 2024 12:02:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 18/23] media: atomisp: Remove struct atomisp_platform_data
Date: Mon, 15 Apr 2024 14:02:15 +0200
Message-ID: <20240415120220.219480-19-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

struct atomisp_platform_data only has a single subdevs member. Remove
this struct and replace atomisp_get_platform_data() with
atomisp_platform_get_subdevs().

Note atomisp_get_platform_data() and now atomisp_platform_get_subdevs()
always succeed, so while at it also remove unnecessary error checking.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |  6 +---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 36 +++++++++----------
 .../media/atomisp/pci/atomisp_internal.h      |  1 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 16 ++-------
 4 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 098859bde86f..0e3f6fb78483 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -115,10 +115,6 @@ struct intel_v4l2_subdev_table {
 	struct v4l2_subdev *subdev;
 };
 
-struct atomisp_platform_data {
-	struct intel_v4l2_subdev_table *subdevs;
-};
-
 /*
  *  Sensor of external ISP can send multiple steams with different mipi data
  * type in the same virtual channel. This information needs to come from the
@@ -173,7 +169,7 @@ struct camera_mipi_info {
 	const u32                       *metadata_effective_width;
 };
 
-const struct atomisp_platform_data *atomisp_get_platform_data(void);
+const struct intel_v4l2_subdev_table *atomisp_platform_get_subdevs(void);
 int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 				    enum atomisp_input_format format,
 				    enum atomisp_bayer_order bayer_order);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e12354820a3a..e176483df301 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -127,17 +127,13 @@ static int gmin_v2p8_enable_count;
 /* The atomisp uses subdev==NULL for the end-of-list marker, so leave space. */
 static struct intel_v4l2_subdev_table pdata_subdevs[MAX_SUBDEVS + 1];
 
-static const struct atomisp_platform_data pdata = {
-	.subdevs = pdata_subdevs,
-};
-
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev);
 
-const struct atomisp_platform_data *atomisp_get_platform_data(void)
+const struct intel_v4l2_subdev_table *atomisp_platform_get_subdevs(void)
 {
-	return &pdata;
+	return pdata_subdevs;
 }
-EXPORT_SYMBOL_GPL(atomisp_get_platform_data);
+EXPORT_SYMBOL_GPL(atomisp_platform_get_subdevs);
 
 int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 				struct camera_sensor_platform_data *plat_data)
@@ -164,7 +160,7 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	adev->power.flags.power_resources = 0;
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-		if (!pdata.subdevs[i].subdev)
+		if (!pdata_subdevs[i].subdev)
 			break;
 
 	if (i == MAX_SUBDEVS)
@@ -179,9 +175,9 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	if (!gs)
 		return -ENODEV;
 
-	pdata.subdevs[i].port = gs->csi_port;
-	pdata.subdevs[i].lanes = gs->csi_lanes;
-	pdata.subdevs[i].subdev = subdev;
+	pdata_subdevs[i].port = gs->csi_port;
+	pdata_subdevs[i].lanes = gs->csi_lanes;
+	pdata_subdevs[i].subdev = subdev;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(atomisp_register_i2c_module);
@@ -194,9 +190,9 @@ int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd)
 		return 0;
 
 	for (i = 0; i < MAX_SUBDEVS; i++) {
-		if (pdata.subdevs[i].subdev == sd) {
+		if (pdata_subdevs[i].subdev == sd) {
 			for (j = i + 1; j <= MAX_SUBDEVS; j++)
-				pdata.subdevs[j - 1] = pdata.subdevs[j];
+				pdata_subdevs[j - 1] = pdata_subdevs[j];
 		}
 		if (gmin_subdevs[i].subdev == sd) {
 			if (gmin_subdevs[i].gpio0)
@@ -1125,7 +1121,7 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 	}
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-		if (!pdata.subdevs[i].subdev)
+		if (!pdata_subdevs[i].subdev)
 			break;
 
 	if (i >= MAX_SUBDEVS) {
@@ -1137,9 +1133,9 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 	if (ret)
 		return ret;
 
-	pdata.subdevs[i].port = port;
-	pdata.subdevs[i].lanes = lanes;
-	pdata.subdevs[i].subdev = subdev;
+	pdata_subdevs[i].port = port;
+	pdata_subdevs[i].lanes = lanes;
+	pdata_subdevs[i].subdev = subdev;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(atomisp_register_sensor_no_gmin);
@@ -1149,12 +1145,12 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev)
 	int i;
 
 	for (i = 0; i < MAX_SUBDEVS; i++) {
-		if (pdata.subdevs[i].subdev != subdev)
+		if (pdata_subdevs[i].subdev != subdev)
 			continue;
 
 		camera_sensor_csi_free(subdev);
-		pdata.subdevs[i].subdev = NULL;
-		pdata.subdevs[i].port = 0;
+		pdata_subdevs[i].subdev = NULL;
+		pdata_subdevs[i].port = 0;
 		break;
 	}
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 9227399502b9..9c2bc5332fa4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -175,7 +175,6 @@ struct atomisp_device {
 	struct media_device media_dev;
 	struct atomisp_sub_device asd;
 	struct v4l2_async_notifier notifier;
-	struct atomisp_platform_data *pdata;
 	void *mmu_l1_base;
 	void __iomem *base;
 	const struct firmware *firmware;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 470c123256a7..4a87401a5389 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -783,27 +783,20 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 
 static int atomisp_subdev_probe(struct atomisp_device *isp)
 {
-	const struct atomisp_platform_data *pdata;
-	struct intel_v4l2_subdev_table *subdevs;
+	const struct intel_v4l2_subdev_table *subdevs;
 	int ret, mipi_port;
 
 	ret = atomisp_csi2_bridge_parse_firmware(isp);
 	if (ret)
 		return ret;
 
-	pdata = atomisp_get_platform_data();
-	if (!pdata) {
-		dev_err(isp->dev, "no platform data available\n");
-		return 0;
-	}
-
 	/*
 	 * TODO: this is left here for now to allow testing atomisp-sensor
 	 * drivers which are still using the atomisp_gmin_platform infra before
 	 * converting them to standard v4l2 sensor drivers using runtime-pm +
 	 * ACPI for pm and v4l2_async_register_subdev_sensor() registration.
 	 */
-	for (subdevs = pdata->subdevs; subdevs->subdev; ++subdevs) {
+	for (subdevs = atomisp_platform_get_subdevs(); subdevs->subdev; ++subdevs) {
 		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdevs->subdev);
 		if (ret)
 			continue;
@@ -1186,7 +1179,6 @@ static void atomisp_pm_uninit(struct atomisp_device *isp)
 
 static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	const struct atomisp_platform_data *pdata;
 	struct atomisp_device *isp;
 	unsigned int start;
 	u32 val;
@@ -1195,10 +1187,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	/* Pointer to struct device. */
 	atomisp_dev = &pdev->dev;
 
-	pdata = atomisp_get_platform_data();
-	if (!pdata)
-		dev_warn(&pdev->dev, "no platform data available\n");
-
 	start = pci_resource_start(pdev, ATOM_ISP_PCI_BAR);
 	dev_dbg(&pdev->dev, "start: 0x%x\n", start);
 
-- 
2.44.0


