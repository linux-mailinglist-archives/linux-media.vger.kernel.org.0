Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A0252CFE
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgHZLxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:53:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:65208 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729183AbgHZLvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:51:04 -0400
IronPort-SDR: xvv1QklBTxbO8XsNCUf58shMstFRXRW3mR99o3IlDwccA5RuQj9kbBJHc3w/wz5UFNDZMdkwB8
 FkB72rG5Z+Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143938750"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="143938750"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:51:02 -0700
IronPort-SDR: y+0uCAceZd6tvhhudRbf/v1uOKXcKJaqJt5S26xYcwltESEuXtX+t9QXnYkzHb4zhzGwq9n7+t
 GrZ4kG8pPvWw==
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="339134984"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:50:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 812D520CEF;
        Wed, 26 Aug 2020 14:50:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kAu0e-0001bV-Sz; Wed, 26 Aug 2020 14:54:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH v6 5/6] at24: Support probing while off
Date:   Wed, 26 Aug 2020 14:54:31 +0300
Message-Id: <20200826115432.6103-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In certain use cases (where the chip is part of a camera module, and the
camera module is wired together with a camera privacy LED), powering on
the device during probe is undesirable. Add support for the at24 to
execute probe while being powered off. For this to happen, a hint in form
of a device property is required from the firmware.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/misc/eeprom/at24.c | 43 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 2591c21b2b5d8..a343e55e41126 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -561,6 +561,7 @@ static int at24_probe(struct i2c_client *client)
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
+	bool low_power;
 	struct regmap *regmap;
 	bool writable;
 	u8 test_byte;
@@ -698,25 +699,30 @@ static int at24_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, at24);
 
-	err = regulator_enable(at24->vcc_reg);
-	if (err) {
-		dev_err(dev, "Failed to enable vcc regulator\n");
-		return err;
-	}
+	low_power = acpi_dev_state_low_power(&client->dev);
+	if (!low_power) {
+		err = regulator_enable(at24->vcc_reg);
+		if (err) {
+			dev_err(dev, "Failed to enable vcc regulator\n");
+			return err;
+		}
 
-	/* enable runtime pm */
-	pm_runtime_set_active(dev);
+		pm_runtime_set_active(dev);
+	}
 	pm_runtime_enable(dev);
 
 	/*
-	 * Perform a one-byte test read to verify that the
-	 * chip is functional.
+	 * Perform a one-byte test read to verify that the chip is functional,
+	 * unless powering on the device is to be avoided during probe (i.e.
+	 * it's powered off right now).
 	 */
-	err = at24_read(at24, 0, &test_byte, 1);
-	if (err) {
-		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
-		return -ENODEV;
+	if (!low_power) {
+		err = at24_read(at24, 0, &test_byte, 1);
+		if (err) {
+			pm_runtime_disable(dev);
+			regulator_disable(at24->vcc_reg);
+			return -ENODEV;
+		}
 	}
 
 	pm_runtime_idle(dev);
@@ -736,9 +742,11 @@ static int at24_remove(struct i2c_client *client)
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
 	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		regulator_disable(at24->vcc_reg);
-	pm_runtime_set_suspended(&client->dev);
+	if (!acpi_dev_state_low_power(&client->dev)) {
+		if (!pm_runtime_status_suspended(&client->dev))
+			regulator_disable(at24->vcc_reg);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	return 0;
 }
@@ -775,6 +783,7 @@ static struct i2c_driver at24_driver = {
 	.probe_new = at24_probe,
 	.remove = at24_remove,
 	.id_table = at24_ids,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 
 static int __init at24_init(void)
-- 
2.20.1

