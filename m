Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD81B353969
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 20:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhDDSa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Apr 2021 14:30:29 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:18191 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229861AbhDDSa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Apr 2021 14:30:28 -0400
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Apr 2021 14:30:28 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 911d8938-9571-11eb-8ccd-005056bdfda7;
        Sun, 04 Apr 2021 21:14:16 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/1] media: ipu3-cio2: Fix referece counting when looping over ACPI devices
Date:   Sun,  4 Apr 2021 21:14:09 +0300
Message-Id: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When we continue, due to device is disabled, loop we have to drop reference count.
When we have an array full of devices we have to also drop the reference count.
Note, in this case the cio2_bridge_unregister_sensors() is called by the caller.

Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Cc: Daniel Scally <djrscally@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index c2199042d3db..85f8b587405e 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -173,14 +173,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	int ret;
 
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-		if (!adev->status.enabled)
+		if (!adev->status.enabled) {
+			acpi_dev_put(adev);
 			continue;
+		}
 
 		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
+			acpi_dev_put(adev);
 			dev_err(&cio2->dev, "Exceeded available CIO2 ports\n");
-			cio2_bridge_unregister_sensors(bridge);
-			ret = -EINVAL;
-			goto err_out;
+			return -EINVAL;
 		}
 
 		sensor = &bridge->sensors[bridge->n_sensors];
@@ -228,7 +229,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	software_node_unregister_nodes(sensor->swnodes);
 err_put_adev:
 	acpi_dev_put(sensor->adev);
-err_out:
 	return ret;
 }
 
-- 
2.31.1

