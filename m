Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73A17CF36A
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 11:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344919AbjJSJBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 05:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjJSJBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 05:01:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B2FFE
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 02:01:44 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5111D735;
        Thu, 19 Oct 2023 11:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697706095;
        bh=8rybJaxLZiLCbzxQNSRsfONEDfgH/x0Uwlx2XXbiE7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1bj3rFv1xonrxvJd8Tt9nLqn5SLcNdphZkg0B3LIovYxAyFk3iL989e3619KefJC
         +P1W3VXHpRUrh8lq4harBvxGfAITmsAghIhe85liFG/TMgchKD0+hmmo0NS93XGX1k
         J2boO3A0g3fgsnwSlH9TeTnuM4+NvtJefyPuwO88=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 1/3] staging: vc04_services: Support module autoloading using MODULE_DEVICE_TABLE
Date:   Thu, 19 Oct 2023 14:31:26 +0530
Message-Id: <20231019090128.430297-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019090128.430297-1-umang.jain@ideasonboard.com>
References: <20231019090128.430297-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VC04 has now a independent bus vchiq_bus to register its devices.
However, the module auto-loading for bcm2835-audio and bcm2835-camera
currently happens through MODULE_ALIAS() macro specified explicitly.

The correct way to auto-load a module, is when the alias is picked
out from MODULE_DEVICE_TABLE(). In order to get there, we need to
introduce  vchiq_device_id and add relevant entries in file2alias.c
infrastructure so that aliases can be generated. This patch targets
adding vchiq_device_id and do_vchiq_entry, in order to
generate those alias using the /script/mod/file2alias.c.

Going forward the MODULE_ALIAS() from bcm2835-camera and bcm2835-audio
will be dropped, in favour of MODULE_DEVICE_TABLE being used there.

The alias format for vchiq_bus devices will be "vchiq:<dev_name>".
Adjust the vchiq_bus_uevent() to reflect that.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
 include/linux/mod_devicetable.h                          | 4 ++++
 scripts/mod/devicetable-offsets.c                        | 3 +++
 scripts/mod/file2alias.c                                 | 9 +++++++++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 4ac3491efe45..8e40e006f14b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -26,7 +26,7 @@ static int vchiq_bus_uevent(const struct device *dev, struct kobj_uevent_env *en
 {
 	const struct vchiq_device *device = container_of_const(dev, struct vchiq_device, dev);
 
-	return add_uevent_var(env, "MODALIAS=%s", dev_name(&device->dev));
+	return add_uevent_var(env, "MODALIAS=vchiq:%s", dev_name(&device->dev));
 }
 
 static int vchiq_bus_probe(struct device *dev)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
index 7eaaf9a91cda..caa6fdf25bb1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
@@ -7,6 +7,7 @@
 #define _VCHIQ_DEVICE_H
 
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
 
 struct vchiq_device {
 	struct device dev;
@@ -18,6 +19,8 @@ struct vchiq_driver {
 	int		(*resume)(struct vchiq_device *device);
 	int		(*suspend)(struct vchiq_device *device,
 				   pm_message_t state);
+
+	const struct vchiq_device_id *id_table;
 	struct device_driver driver;
 };
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index b0678b093cb2..700cbf34c3b8 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -946,4 +946,8 @@ struct cdx_device_id {
 	__u32 override_only;
 };
 
+struct vchiq_device_id {
+	char name[32];
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index abe65f8968dd..e8aadc780da5 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -267,5 +267,8 @@ int main(void)
 	DEVID_FIELD(cdx_device_id, device);
 	DEVID_FIELD(cdx_device_id, override_only);
 
+	DEVID(vchiq_device_id);
+	DEVID_FIELD(vchiq_device_id, name);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 38120f932b0d..78dfae5a8720 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1478,6 +1478,14 @@ static int do_cdx_entry(const char *filename, void *symval,
 	return 1;
 }
 
+static int do_vchiq_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD_ADDR(symval, vchiq_device_id, name);
+	sprintf(alias, "vchiq:%s", *name);
+
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1558,6 +1566,7 @@ static const struct devtable devtable[] = {
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
 	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
 	{"cdx", SIZE_cdx_device_id, do_cdx_entry},
+	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.40.1

