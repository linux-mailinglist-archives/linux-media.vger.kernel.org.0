Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077DF743A5E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbjF3LIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbjF3LIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4223C21
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9sVkk8a9dbiokoGdyqnE9Wt2jX2HT8imC6M5t3xZs4o=;
        b=bwtoEgOCVwBHJVr3IAPKCe49PKnt7zuWreXpp5G6DE2DBCsLUMsXZv2Wcy9KIIAlnfjN89
        Kqn55m6u9wmcyc6D7w1ptOykI4Qn2niyEmed8wJXChRkpHgKCX9gkzEPSFRhakU1QBMzft
        6jglMZLx70lQqXtpCSe6nwFEX/Y5Qo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-UCPG40P-PvWOyDZF9uGqdg-1; Fri, 30 Jun 2023 07:07:36 -0400
X-MC-Unique: UCPG40P-PvWOyDZF9uGqdg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4038687323D;
        Fri, 30 Jun 2023 11:07:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E3500492B02;
        Fri, 30 Jun 2023 11:07:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link between VCM and sensor
Date:   Fri, 30 Jun 2023 13:06:42 +0200
Message-ID: <20230630110643.209761-15-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In most cases when a VCM is used there is a single integrated module
with the sensor + VCM + lens. This means that the sensor and VCM often
share regulators and possibly also something like a powerdown pin.

In the ACPI tables this is modelled as a single ACPI device with
multiple I2cSerialBus resources.

On atomisp devices the regulators and clks are modelled as ACPI
power-resources, which are controlled by the (ACPI) power state
of the sensor. So the sensor must be in D0 power state for the VCM
to work.

To make this work add a device-link with DL_FLAG_PM_RUNTIME flag
so that the sensor will automatically be runtime-resumed whenever
the VCM is runtime-resumed.

This requires the probing of the VCM and thus the creation of the VCM
I2C-client to be delayed till after the sensor driver has bound.

Move the instantiation of the VCM I2C-client to the v4l2_async_notifier
bound op, so that it is done after the sensor driver has bound; and
add code to add the device-link.

This fixes the problem with the shared ACPI power-resources on atomisp2
and this avoids the need for VCM related workarounds on IPU3 / IPU6.

E.g. until now the dw9719 driver needed to get and control a Vsio
(V sensor IO) regulator since that needs to be enabled to enable I2C
pass-through on the PMIC on the sensor module. So the driver was
controlling this regulator even though the actual dw9719 chip has no
Vsio pin / power-plane.

This also removes the need for ipu_bridge_init() to return
-EPROBE_DEFER since the VCM is now instantiated later.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c     | 159 +++++++++++++++--------
 drivers/media/pci/intel/ipu3/ipu3-cio2.c |   5 +
 include/media/ipu-bridge.h               |   5 +-
 3 files changed, 109 insertions(+), 60 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 07a34f20af8e..32dabc16a7b4 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,7 +4,9 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
@@ -289,29 +291,112 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 	ipu_bridge_init_swnode_group(sensor);
 }
 
-static void ipu_bridge_instantiate_vcm_i2c_client(struct ipu_sensor *sensor)
-{
-	struct i2c_board_info board_info = { };
+/*
+ * The actual instantiation must be done from a workqueue to avoid
+ * a deadlock on taking list_lock from v4l2-async twice.
+ */
+struct ipu_bridge_instantiate_vcm_work_data {
+	struct work_struct work;
+	struct device *sensor;
 	char name[16];
+	struct i2c_board_info board_info;
+};
 
-	if (!sensor->vcm_type)
-		return;
+static void ipu_bridge_instantiate_vcm_work(struct work_struct *_work)
+{
+	struct ipu_bridge_instantiate_vcm_work_data *work =
+		container_of(_work,
+			     struct ipu_bridge_instantiate_vcm_work_data,
+			     work);
+	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
+	struct i2c_client *vcm_client;
+	bool put_fwnode = true;
+	int ret;
 
-	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
-	board_info.dev_name = name;
-	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
-	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
-
-	sensor->vcm_i2c_client =
-		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
-					      1, &board_info);
-	if (IS_ERR(sensor->vcm_i2c_client)) {
-		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
-			 PTR_ERR(sensor->vcm_i2c_client));
-		sensor->vcm_i2c_client = NULL;
+	/*
+	 * The client may get probed before the device_link gets added below
+	 * make sure the sensor is powered-up during probe.
+	 */
+	ret = pm_runtime_get_sync(work->sensor);
+	if (ret < 0) {
+		dev_err(work->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
+			ret);
+		goto out;
 	}
+
+	/*
+	 * Note the client is created only once and then kept around
+	 * even after a rmmod, just like the software-nodes.
+	 */
+	vcm_client = i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(adev),
+						   1, &work->board_info);
+	if (IS_ERR(vcm_client)) {
+		dev_err(work->sensor, "Error instantiating VCM client: %ld\n",
+			PTR_ERR(vcm_client));
+		goto out;
+	}
+
+	device_link_add(&vcm_client->dev, work->sensor, DL_FLAG_PM_RUNTIME);
+
+	dev_info(work->sensor, "Instantiated %s VCM\n", work->board_info.type);
+	put_fwnode = false; /* Ownership has passed to the i2c-client */
+
+out:
+	pm_runtime_put(work->sensor);
+	put_device(work->sensor);
+	if (put_fwnode)
+		fwnode_handle_put(work->board_info.fwnode);
+	kfree(work);
 }
 
+int ipu_bridge_instantiate_vcm(struct device *sensor)
+{
+	struct ipu_bridge_instantiate_vcm_work_data *work;
+	struct fwnode_handle *vcm_fwnode;
+	struct i2c_client *vcm_client;
+	struct acpi_device *adev;
+	char *sep;
+
+	adev = ACPI_COMPANION(sensor);
+	if (!adev)
+		return 0;
+
+	vcm_fwnode = fwnode_find_reference(dev_fwnode(sensor), "lens-focus", 0);
+	if (IS_ERR(vcm_fwnode))
+		return 0;
+
+	/* When reloading modules the client will already exist */
+	vcm_client = i2c_find_device_by_fwnode(vcm_fwnode);
+	if (vcm_client) {
+		fwnode_handle_put(vcm_fwnode);
+		put_device(&vcm_client->dev);
+		return 0;
+	}
+
+	work = kzalloc(sizeof(*work), GFP_KERNEL);
+	if (!work) {
+		fwnode_handle_put(vcm_fwnode);
+		return -ENOMEM;
+	}
+
+	INIT_WORK(&work->work, ipu_bridge_instantiate_vcm_work);
+	work->sensor = get_device(sensor);
+	snprintf(work->name, sizeof(work->name), "%s-VCM",
+		 acpi_dev_name(adev));
+	work->board_info.dev_name = work->name;
+	work->board_info.fwnode = vcm_fwnode;
+	strscpy(work->board_info.type, fwnode_get_name(vcm_fwnode),
+		I2C_NAME_SIZE);
+	/* Strip "-<link>" postfix */
+	sep = strchrnul(work->board_info.type, '-');
+	*sep = 0;
+
+	queue_work(system_long_wq, &work->work);
+
+	return 0;
+}
+EXPORT_SYMBOL(ipu_bridge_instantiate_vcm);
+
 static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 {
 	struct ipu_sensor *sensor;
@@ -321,7 +406,6 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 		sensor = &bridge->sensors[i];
 		software_node_unregister_node_group(sensor->group);
 		acpi_dev_put(sensor->adev);
-		i2c_unregister_device(sensor->vcm_i2c_client);
 	}
 }
 
@@ -371,8 +455,6 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
 
-		ipu_bridge_instantiate_vcm_i2c_client(sensor);
-
 		dev_info(bridge->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
@@ -409,40 +491,6 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 	return ret;
 }
 
-/*
- * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
- * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
- * the VCM and regulators/clks are not described in ACPI, instead they are
- * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
- * for the clks/regulators the VCM i2c-clients must not be instantiated until
- * the PMIC is fully setup.
- *
- * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
- * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
- * for the sensors.
- */
-static int ipu_bridge_sensors_are_ready(void)
-{
-	struct acpi_device *adev;
-	bool ready = true;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
-		const struct ipu_sensor_config *cfg =
-			&ipu_supported_sensors[i];
-
-		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-			if (!adev->status.enabled)
-				continue;
-
-			if (!acpi_dev_ready_for_enumeration(adev))
-				ready = false;
-		}
-	}
-
-	return ready;
-}
-
 int ipu_bridge_init(struct device *dev,
 		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
 					       struct ipu_sensor *sensor))
@@ -452,9 +500,6 @@ int ipu_bridge_init(struct device *dev,
 	unsigned int i;
 	int ret;
 
-	if (!ipu_bridge_sensors_are_ready())
-		return -EPROBE_DEFER;
-
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
 		return -ENOMEM;
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 51a6d7cc44d2..690fc1c919af 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1388,10 +1388,15 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
 	struct cio2_queue *q;
+	int ret;
 
 	if (cio2->queue[s_asd->csi2.port].sensor)
 		return -EBUSY;
 
+	ret = ipu_bridge_instantiate_vcm(sd->dev);
+	if (ret)
+		return ret;
+
 	q = &cio2->queue[s_asd->csi2.port];
 
 	q->csi2 = s_asd->csi2;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 969d8d7d6b93..31b138170c73 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -7,8 +7,6 @@
 #include <linux/types.h>
 #include <media/v4l2-fwnode.h>
 
-struct i2c_client;
-
 #define IPU_HID				"INT343E"
 #define IPU_MAX_LANES				4
 #define IPU_MAX_PORTS				4
@@ -117,7 +115,6 @@ struct ipu_sensor {
 	/* append ssdb.link(u8) in "-%u" format as suffix of HID */
 	char name[ACPI_ID_LEN + 4];
 	struct acpi_device *adev;
-	struct i2c_client *vcm_i2c_client;
 
 	/* SWNODE_COUNT + 1 for terminating NULL */
 	const struct software_node *group[SWNODE_COUNT + 1];
@@ -156,9 +153,11 @@ int ipu_bridge_init(struct device *dev,
 		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
 					       struct ipu_sensor *sensor));
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
+int ipu_bridge_instantiate_vcm(struct device *sensor);
 #else
 /* Use a define to avoid the parse_sensor_fwnode arg getting evaluated */
 #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
+static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
 #endif
 
 #endif
-- 
2.41.0

