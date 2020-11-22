Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4F42BC72F
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgKVQhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:37:23 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:35552 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728206AbgKVQhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:37:23 -0500
X-Halon-ID: 46d3f113-2cdf-11eb-8a9c-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 46d3f113-2cdf-11eb-8a9c-005056917a89;
        Sun, 22 Nov 2020 17:25:04 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] adv748x: Configure device when resuming from sleep
Date:   Sun, 22 Nov 2020 17:36:37 +0100
Message-Id: <20201122163637.3590465-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the device is powered off for example during system suspend to ram
the devices loses its configuration, specially the slave i2c mappings
and other configuration set at probe time. This renders the device
unusable and only way to recover is to unbind and rebind the device to
the driver to run the probe setup again.

Add an early resume callback that reinitializes the device and setup the
slave i2c address mappings and other probe time configuration.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index b578a01cfebe7217..4e54148147b9adec 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -565,6 +565,18 @@ static int adv748x_identify_chip(struct adv748x_state *state)
 	return 0;
 }
 
+/* -----------------------------------------------------------------------------
+ * Suspend / Resume
+ */
+
+static int __maybe_unused adv748x_resume_early(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adv748x_state *state = i2c_get_clientdata(client);
+
+	return adv748x_reset(state);
+}
+
 /* -----------------------------------------------------------------------------
  * i2c driver
  */
@@ -827,10 +839,15 @@ static const struct of_device_id adv748x_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, adv748x_of_table);
 
+static const struct dev_pm_ops adv748x_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, adv748x_resume_early)
+};
+
 static struct i2c_driver adv748x_driver = {
 	.driver = {
 		.name = "adv748x",
 		.of_match_table = adv748x_of_table,
+		.pm = &adv748x_pm_ops,
 	},
 	.probe_new = adv748x_probe,
 	.remove = adv748x_remove,
-- 
2.29.2

