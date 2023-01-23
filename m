Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB86F677BD3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjAWMyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B700124106
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yN4kOk/iBUEXy7Zw3cB+7IgP3VQkRKmvsvC8NBnuYQw=;
        b=aPncf4+rRH/+IcPi1HL5U2dbG+1VLJV+1wEpgnyywCPS2wXkhR5PmAzkjrXcQNPAzmRqLo
        Dfg3t6X9OY192zpALcvvWoRdoQd9PDS1i2gjqpivH8yWI9GWcl+yX8IVyiV6QBd9I2E9UO
        AziiSQXAkXKp6HW/jsuiAqdSFTrstZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-e2-DL1JdMlSOVmNwsV7bdg-1; Mon, 23 Jan 2023 07:53:12 -0500
X-MC-Unique: e2-DL1JdMlSOVmNwsV7bdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03A62817229;
        Mon, 23 Jan 2023 12:53:11 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66288C15BA0;
        Mon, 23 Jan 2023 12:53:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 22/57] media: atomisp: Add atomisp_register_sensor_no_gmin() helper
Date:   Mon, 23 Jan 2023 13:51:30 +0100
Message-Id: <20230123125205.622152-23-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DSDT of all Windows BYT / CHT devices which I have seen has proper
ACPI powermagement for the clk and regulators used by the sensors.

So there is no need for the whole custom atomisp_gmin custom code to
disable the ACPI pm and directly poke at the PMIC for this.

Add new atomisp_register_sensor_no_gmin() + atomisp_unregister_subdev()
helpers which allow registering a sensor with the atomisp code without
using any of the atomisp_gmin power-management code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |  4 ++
 .../media/atomisp/pci/atomisp_gmin_platform.c | 61 +++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 82973aa0e1eb..539b21d39d3b 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -211,6 +211,10 @@ struct camera_mipi_info {
 };
 
 const struct atomisp_platform_data *atomisp_get_platform_data(void);
+int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
+				    enum atomisp_input_format format,
+				    enum atomisp_bayer_order bayer_order);
+void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 234088711f29..1e943c423893 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1082,6 +1082,67 @@ static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
 	return 0;
 }
 
+int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
+				    enum atomisp_input_format format,
+				    enum atomisp_bayer_order bayer_order)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	int i, ret, clock_num, port = 0;
+
+	if (adev) {
+		/* Get ACPI _PR0 derived clock to determine the csi_port default */
+		if (acpi_device_power_manageable(adev)) {
+			clock_num = atomisp_get_acpi_power(&client->dev);
+
+			/* Compare clock to CsiPort 1 pmc-clock used in the CHT/BYT reference designs */
+			if (IS_ISP2401)
+				port = clock_num == 4 ? 1 : 0;
+			else
+				port = clock_num == 0 ? 1 : 0;
+		}
+
+		port = gmin_get_var_int(&client->dev, false, "CsiPort", port);
+		lanes = gmin_get_var_int(&client->dev, false, "CsiLanes", lanes);
+	}
+
+	for (i = 0; i < MAX_SUBDEVS; i++)
+		if (!pdata.subdevs[i].type)
+			break;
+
+	if (i >= MAX_SUBDEVS) {
+		dev_err(&client->dev, "Error too many subdevs already registered\n");
+		return -ENOMEM;
+	}
+
+	ret = camera_sensor_csi_alloc(subdev, port, lanes, format, bayer_order);
+	if (ret)
+		return ret;
+
+	pdata.subdevs[i].type = RAW_CAMERA;
+	pdata.subdevs[i].port = port;
+	pdata.subdevs[i].subdev = subdev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(atomisp_register_sensor_no_gmin);
+
+void atomisp_unregister_subdev(struct v4l2_subdev *subdev)
+{
+	int i;
+
+	for (i = 0; i < MAX_SUBDEVS; i++) {
+		if (pdata.subdevs[i].subdev != subdev)
+			continue;
+
+		camera_sensor_csi_free(subdev);
+		pdata.subdevs[i].subdev = NULL;
+		pdata.subdevs[i].type = 0;
+		pdata.subdevs[i].port = 0;
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(atomisp_unregister_subdev);
+
 static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
 	char *camera_module)
 {
-- 
2.39.0

