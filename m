Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9757D2D1BFF
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgLGVZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:09 -0500
Received: from retiisi.eu ([95.216.213.190]:34638 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgLGVZJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:09 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A428B634CA5;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 19/24] ccs: Add a sanity check for external clock frequency
Date:   Mon,  7 Dec 2020 23:15:25 +0200
Message-Id: <20201207211530.21180-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver depends on the external clock frequency. Add a sanity check for
the frequency, by returning an error from probe if it's zero.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index fae8ceded861..08fce285f73a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3275,6 +3275,11 @@ static int ccs_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!sensor->hwcfg.ext_clk) {
+		dev_err(&client->dev, "cannot work with xclk frequency 0\n");
+		return -EINVAL;
+	}
+
 	sensor->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset))
-- 
2.29.2

