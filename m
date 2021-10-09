Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43C7427BC3
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 18:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhJIQI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 12:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22436 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232120AbhJIQIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 12:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633795601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=edKTHI0kqdZ3/aEQQCcjzJYSFAw9X+wm+DJd7h86hkY=;
        b=QEnpnRbYTL8iDoZEqQ2DPgq2V6sbJU8HE2pCkJBrgVXJFut1MinK/coVUIJq+bLxs3kd9l
        09a0P8ubnWYCWJT1Vn1VHZ4n9hPz/s976hMhQ3GNIXCsYdb9nDmP98uZhQyF7JQjSph2EJ
        kyzCcS47F2u1qc/uROeBdkyjBu7Wc2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-kG4uR5zWOh6ic8GAJHJWJg-1; Sat, 09 Oct 2021 12:06:40 -0400
X-MC-Unique: kG4uR5zWOh6ic8GAJHJWJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF511808304;
        Sat,  9 Oct 2021 16:06:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B38CB5C1B4;
        Sat,  9 Oct 2021 16:06:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 11/13] platform/x86: int3472: Deal with probe ordering issues
Date:   Sat,  9 Oct 2021 18:05:46 +0200
Message-Id: <20211009160548.306550-12-hdegoede@redhat.com>
In-Reply-To: <20211009160548.306550-1-hdegoede@redhat.com>
References: <20211009160548.306550-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The clk and regulator frameworks expect clk/regulator consumer-devices
to have info about the consumed clks/regulators described in the device's
fw_node.

To work around this info missing from the ACPI tables on devices where
the int3472 driver is used, the int3472 MFD-cell drivers attach info about
consumers to the clks/regulators when registering these.

This causes problems with the probe ordering wrt drivers for consumers
of these clks/regulators. Since the lookups are only registered when the
provider-driver binds, trying to get these clks/regulators before then
results in a -ENOENT error for clks and a dummy regulator for regulators.

All the sensor ACPI fw-nodes have a _DEP dependency on the INT3472 ACPI
fw-node, so to work around these probe ordering issues the ACPI core /
i2c-code does not instantiate the I2C-clients for any ACPI devices
which have a _DEP dependency on an INT3472 ACPI device until all
_DEP-s are met.

This relies on acpi_dev_clear_dependencies() getting called by the driver
for the _DEP-s when they are ready, add a acpi_dev_clear_dependencies()
call to the discrete.c probe code.

In the tps68470 case calling acpi_dev_clear_dependencies() is already done
by the acpi_gpiochip_add() call done by the driver for the GPIO MFD cell
(The GPIO cell is deliberately the last cell created to make sure the
clk + regulator cells are already instantiatred when this happens).

However for proper probe ordering, the clk/regulator cells must not just
be instantiated the must be fully ready (the clks + regulators must be
registered with their subsystems).

Add MODULE_SOFTDEP dependencies for the clk and regulator drivers for
the instantiated MFD-cells so that these are loaded before us and so
that they bind immediately when the platform-devs are instantiated.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Only call acpi_dev_clear_dependencies() in the discrete.c case, for the
  tps68470 case this is already done by the acpi_gpiochip_add() for the
  GPIO MFD cell.
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 drivers/platform/x86/intel/int3472/tps68470.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index fefe12850777..e23a45b985dc 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -380,6 +380,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	acpi_dev_clear_dependencies(adev);
 	return 0;
 }
 
diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index c53c7960ee09..2f953fd7ccb1 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -173,6 +173,11 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		return device_type;
 	}
 
+	/*
+	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
+	 * for the GPIO cell already does this.
+	 */
+
 	return ret;
 }
 
@@ -206,3 +211,4 @@ module_i2c_driver(int3472_tps68470);
 MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
 MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator gpio-tps68470");
-- 
2.31.1

