Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EE53F2180
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 22:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbhHSUUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 16:20:17 -0400
Received: from retiisi.eu ([95.216.213.190]:60174 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhHSUUP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 16:20:15 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3A684634C92;
        Thu, 19 Aug 2021 23:19:37 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-acpi@vger.kernel.org, linux-media@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, rafael@kernel.org
Subject: [RFC 1/3] imx258: Defer probing on ident register read fail (on ACPI)
Date:   Thu, 19 Aug 2021 23:19:34 +0300
Message-Id: <20210819201936.7390-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819201936.7390-1-sakari.ailus@linux.intel.com>
References: <20210819201936.7390-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return -EPROBE_DEFER if probing the device fails because of the I²C
transaction (-EIO only). This generally happens when the power on sequence
of the device has not been fully performed yet due to later probing of
other drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx258.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index c249507aa2db..2751c12b6029 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1109,6 +1109,14 @@ static int imx258_identify_module(struct imx258 *imx258)
 
 	ret = imx258_read_reg(imx258, IMX258_REG_CHIP_ID,
 			      IMX258_REG_VALUE_16BIT, &val);
+	if (ret == -EIO && is_acpi_device_node(dev_fwnode(&client->dev))) {
+		/*
+		 * If we get -EIO here and it's an ACPI device, there's a fair
+		 * likelihood it's because the drivers required to power this
+		 * device on have not probed yet. Thus return -EPROBE_DEFER.
+		 */
+		return -EPROBE_DEFER;
+	}
 	if (ret) {
 		dev_err(&client->dev, "failed to read chip id %x\n",
 			IMX258_CHIP_ID);
-- 
2.30.2

