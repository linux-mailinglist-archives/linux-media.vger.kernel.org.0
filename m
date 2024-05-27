Return-Path: <linux-media+bounces-11989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681318D06E5
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 17:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF291C217E8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2051E4BF;
	Mon, 27 May 2024 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4VEY0N5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188673449;
	Mon, 27 May 2024 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825171; cv=none; b=LWKNz55EaG6w56IUSAxTSrz4oLFmyGnvNRfD2CVu4om96H5HbiXk5UpEWdsDGu2R+Zv/Cz2NvIzJBRUzkomtlwc8ShQQeBS/3a4oAKWCK1I0NRd/3tU25pGgcobkbijcbYLq0yS5V80bsNlI/UKHuzN8qfvD617KeCDFjXdqudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825171; c=relaxed/simple;
	bh=j1dXBWJfIG5XCsCoKaTMfGEVTzRkzUBmCb5nlko+V0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mT9LHntLoi/jwEhMRruVPVcxNGnODTZ/s0ugD0wUI9GW3Bs6hs9mIHYI9nubMM00NbuZtReMWBIoVaHaLFq4nFI77iPWaiMsCrDF7dYQU2c0t0C9XS7XNlGbAqcctQj0WiImuQIBd6pvYttIMK3cbdCBC9JK6vJf385yZW7bJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4VEY0N5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B3AC2BBFC;
	Mon, 27 May 2024 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825170;
	bh=j1dXBWJfIG5XCsCoKaTMfGEVTzRkzUBmCb5nlko+V0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4VEY0N5FEFobsiL3DAhE7mSKtu6qkb7+TLJaqVi5WJFqkCijydym9WpTFkqqwswi
	 XviTFCF5I0GE+AoC72/x9ErKiOA2Y2+WNYnE2f7Os7huc5RKrL5JR+UkkRKBrYwVfU
	 OypQmY2huXlEqFKGxDsvX9EgM0Kz2Emrfn0YP2fZbpiSZHn/XDllohi4djb0RyWMjC
	 H2zUOtiuYD2kuFlawU5l10uP6woHlbHNTqkcFZddV7+yZRGxEOrKD9vaEJlAglNLhW
	 /eAgropuHCmiuol1gwpqn7yB0RSAng84NPFTqYdSIXTvbNMXwykZy2ccrwLjQcRA4S
	 VNXfK4i/h3JYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	bingbu.cao@intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 20/23] media: intel/ipu6: Fix build with !ACPI
Date: Mon, 27 May 2024 11:50:21 -0400
Message-ID: <20240527155123.3863983-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155123.3863983-1-sashal@kernel.org>
References: <20240527155123.3863983-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 8810e055b57543f3465cf3c15ba4980f9f14a84e ]

Modify the code so it can be compiled tested in configurations that do
not have ACPI enabled.

It fixes the following errors:
drivers/media/pci/intel/ipu-bridge.c:103:30: error: implicit declaration of function ‘acpi_device_handle’; did you mean ‘acpi_fwnode_handle’? [-Werror=implicit-function-declaration]
drivers/media/pci/intel/ipu-bridge.c:103:30: warning: initialization of ‘acpi_handle’ {aka ‘void *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
drivers/media/pci/intel/ipu-bridge.c:110:17: error: implicit declaration of function ‘for_each_acpi_dev_match’ [-Werror=implicit-function-declaration]
drivers/media/pci/intel/ipu-bridge.c:110:74: error: expected ‘;’ before ‘for_each_acpi_consumer_dev’
drivers/media/pci/intel/ipu-bridge.c:104:29: warning: unused variable ‘consumer’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:103:21: warning: unused variable ‘handle’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:166:38: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:185:43: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:191:30: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:196:30: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:202:30: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:223:31: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:236:18: error: implicit declaration of function ‘acpi_get_physical_device_location’ [-Werror=implicit-function-declaration]
drivers/media/pci/intel/ipu-bridge.c:236:56: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:238:31: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:256:31: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:275:31: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:280:30: error: invalid use of undefined type ‘struct acpi_device’
drivers/media/pci/intel/ipu-bridge.c:469:26: error: implicit declaration of function ‘acpi_device_hid’; did you mean ‘dmi_device_id’? [-Werror=implicit-function-declaration]
drivers/media/pci/intel/ipu-bridge.c:468:74: warning: format ‘%s’ expects argument of type ‘char *’, but argument 4 has type ‘int’ [-Wformat=]
drivers/media/pci/intel/ipu-bridge.c:637:58: error: expected ‘;’ before ‘{’ token
drivers/media/pci/intel/ipu-bridge.c:696:1: warning: label ‘err_put_adev’ defined but not used [-Wunused-label]
drivers/media/pci/intel/ipu-bridge.c:693:1: warning: label ‘err_put_ivsc’ defined but not used [-Wunused-label]
drivers/media/pci/intel/ipu-bridge.c:691:1: warning: label ‘err_free_swnodes’ defined but not used [-Wunused-label]
drivers/media/pci/intel/ipu-bridge.c:632:40: warning: unused variable ‘primary’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:632:31: warning: unused variable ‘fwnode’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:733:73: error: expected ‘;’ before ‘{’ token
drivers/media/pci/intel/ipu-bridge.c:725:24: warning: unused variable ‘csi_dev’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:724:43: warning: unused variable ‘adev’ [-Wunused-variable]
drivers/media/pci/intel/ipu-bridge.c:599:12: warning: ‘ipu_bridge_instantiate_ivsc’ defined but not used [-Wunused-function]
drivers/media/pci/intel/ipu-bridge.c:444:13: warning: ‘ipu_bridge_create_connection_swnodes’ defined but not used [-Wunused-function]
drivers/media/pci/intel/ipu-bridge.c:297:13: warning: ‘ipu_bridge_create_fwnode_properties’ defined but not used [-Wunused-function]
drivers/media/pci/intel/ipu-bridge.c:155:12: warning: ‘ipu_bridge_check_ivsc_dev’ defined but not used [-Wunused-function]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 66 ++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index e994db4f4d914..61750cc98d705 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -15,6 +15,8 @@
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
 
+#define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
+
 /*
  * 92335fcf-3203-4472-af93-7b4453ac29da
  *
@@ -87,6 +89,7 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
+#if IS_ENABLED(CONFIG_ACPI)
 /*
  * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
  * instead of device and driver match to probe IVSC device.
@@ -100,13 +103,13 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
 {
-	acpi_handle handle = acpi_device_handle(adev);
-	struct acpi_device *consumer, *ivsc_adev;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ivsc_acpi_ids); i++) {
 		const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
+		struct acpi_device *consumer, *ivsc_adev;
 
+		acpi_handle handle = acpi_device_handle(adev);
 		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
 			/* camera sensor depends on IVSC in DSDT if exist */
 			for_each_acpi_consumer_dev(ivsc_adev, consumer)
@@ -118,6 +121,12 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
 
 	return NULL;
 }
+#else
+static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
+{
+	return NULL;
+}
+#endif
 
 static int ipu_bridge_match_ivsc_dev(struct device *dev, const void *adev)
 {
@@ -163,7 +172,7 @@ static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
 		csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
 		if (!csi_dev) {
 			acpi_dev_put(adev);
-			dev_err(&adev->dev, "Failed to find MEI CSI dev\n");
+			dev_err(ADEV_DEV(adev), "Failed to find MEI CSI dev\n");
 			return -ENODEV;
 		}
 
@@ -182,24 +191,25 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 	acpi_status status;
 	int ret = 0;
 
-	status = acpi_evaluate_object(adev->handle, id, NULL, &buffer);
+	status = acpi_evaluate_object(ACPI_PTR(adev->handle),
+				      id, NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
 	obj = buffer.pointer;
 	if (!obj) {
-		dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
+		dev_err(ADEV_DEV(adev), "Couldn't locate ACPI buffer\n");
 		return -ENODEV;
 	}
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&adev->dev, "Not an ACPI buffer\n");
+		dev_err(ADEV_DEV(adev), "Not an ACPI buffer\n");
 		ret = -ENODEV;
 		goto out_free_buff;
 	}
 
 	if (obj->buffer.length > size) {
-		dev_err(&adev->dev, "Given buffer is too small\n");
+		dev_err(ADEV_DEV(adev), "Given buffer is too small\n");
 		ret = -EINVAL;
 		goto out_free_buff;
 	}
@@ -220,7 +230,7 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
 	default:
-		dev_warn(&adev->dev,
+		dev_warn(ADEV_DEV(adev),
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
 			 ssdb->degree);
 		return 0;
@@ -230,12 +240,14 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
 {
 	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld;
-	acpi_status status;
+	struct acpi_pld_info *pld = NULL;
+	acpi_status status = AE_ERROR;
 
+#if IS_ENABLED(CONFIG_ACPI)
 	status = acpi_get_physical_device_location(adev->handle, &pld);
+#endif
 	if (ACPI_FAILURE(status)) {
-		dev_warn(&adev->dev, "_PLD call failed, using default orientation\n");
+		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
@@ -253,7 +265,8 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
 		break;
 	default:
-		dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
+		dev_warn(ADEV_DEV(adev), "Unknown _PLD panel val %d\n",
+			 pld->panel);
 		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
 		break;
 	}
@@ -272,12 +285,12 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 		return ret;
 
 	if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
-		dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
+		dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vcmtype);
 		ssdb.vcmtype = 0;
 	}
 
 	if (ssdb.lanes > IPU_MAX_LANES) {
-		dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
+		dev_err(ADEV_DEV(adev), "Number of lanes in SSDB is invalid\n");
 		return -EINVAL;
 	}
 
@@ -465,8 +478,14 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						sensor->ipu_properties);
 
 	if (sensor->csi_dev) {
+		const char *device_hid = "";
+
+#if IS_ENABLED(CONFIG_ACPI)
+		device_hid = acpi_device_hid(sensor->ivsc_adev);
+#endif
+
 		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
-			 acpi_device_hid(sensor->ivsc_adev), sensor->link);
+			 device_hid, sensor->link);
 
 		nodes[SWNODE_IVSC_HID] = NODE_SENSOR(sensor->ivsc_name,
 						     sensor->ivsc_properties);
@@ -631,11 +650,15 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 {
 	struct fwnode_handle *fwnode, *primary;
 	struct ipu_sensor *sensor;
-	struct acpi_device *adev;
+	struct acpi_device *adev = NULL;
 	int ret;
 
+#if IS_ENABLED(CONFIG_ACPI)
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-		if (!adev->status.enabled)
+#else
+	while (true) {
+#endif
+		if (!ACPI_PTR(adev->status.enabled))
 			continue;
 
 		if (bridge->n_sensors >= IPU_MAX_PORTS) {
@@ -671,7 +694,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 			goto err_free_swnodes;
 		}
 
-		sensor->adev = acpi_dev_get(adev);
+		sensor->adev = ACPI_PTR(acpi_dev_get(adev));
 
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
@@ -727,11 +750,16 @@ static int ipu_bridge_ivsc_is_ready(void)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+#if IS_ENABLED(CONFIG_ACPI)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
-			if (!sensor_adev->status.enabled)
+#else
+		while (true) {
+			sensor_adev = NULL;
+#endif
+			if (!ACPI_PTR(sensor_adev->status.enabled))
 				continue;
 
 			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
-- 
2.43.0


