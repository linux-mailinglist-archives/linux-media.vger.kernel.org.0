Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C132583F7D
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238844AbiG1NCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238837AbiG1NCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEA746D81;
        Thu, 28 Jul 2022 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013370; x=1690549370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGHyMONZ2wrKJUIuy4ZNGqJusCkm0oXUk4BvqHTAOwU=;
  b=MNTBc7Fbln2ij6NNxC7QJ5oUlU4mYb8Ctl61cp+hWhYZTeOf8wBpvXKf
   muWAo5EiFXIiSdNDArfglqHT1x8u3hJYV3B9bZ6eqAig5OcRDOBoi8ZVr
   F+U04F90c5dO1DmVxL/+HwzS6U252CLfS9jXqiFuO2G38GTWfnYnMrEZp
   a2V4tWYPIUcYncbXPwOnE9XZ3en02jf93upFZs7/vW1+I7AT4x3BDi1MZ
   ncs3GAhpamRl0DGjitRVDTD6SM1qvpwFuWmkMph7VR7hmX/T7UHSjUU/6
   Qk0Y235Ddgr+hW8rqK5Kcs1eoRtyzulbrxA0he2Ck6shTISSmDEe4GIs7
   w==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321375"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013364; x=1690549364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGHyMONZ2wrKJUIuy4ZNGqJusCkm0oXUk4BvqHTAOwU=;
  b=Ka5mZJhxRXR4V9p/9rpGyYb8Gww8tSV0sSccCKFuQR/lr/BR71t0s9Jn
   KqLsMsYfixhjR3I9/t6bnmaQCP2nE9xx5p1oOxtCbDk7kbG9f23UY4M6U
   WvMYJ8Yd+23iUgFzxem+1xwsEIEtMZoJN4amGgx5mTQvntpYaYbipql4L
   T8Hn01vXuwAvKm9kZH3xqPwJ3j2340V26CRNpZwJC56tOw2o8zfgJZOLl
   NkXbWRkNnDHBwhOheI/tF8EzJWjoLvYHojWboQNA2HieCTPaSifNk4NyI
   n377YMLZ3/+FoRq/mkSu+Vb+8q4xJWJ0L302WK9kPWIkByTzx9GKPyAwF
   A==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321374"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3B440280072;
        Thu, 28 Jul 2022 15:02:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 6/7] media: i2c: ov9282: Set v4l2 subdev name according to sensor model
Date:   Thu, 28 Jul 2022 15:02:36 +0200
Message-Id: <20220728130237.3396663-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To distinguish ov9281 & ov9282 the name has to be explicitly set.
Provide a fixed string using platform data.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Replaced v4l2_i2c_subdev_set_name with device_get_match_data and added
  platform data containing the sensor name

 drivers/media/i2c/ov9282.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 352dbe21a902..f79bdfa821e8 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1037,6 +1037,7 @@ static int ov9282_get_regulators(struct ov9282 *ov9282)
 static int ov9282_probe(struct i2c_client *client)
 {
 	struct ov9282 *ov9282;
+	const char *sensor_name;
 	int ret;
 
 	ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
@@ -1047,6 +1048,12 @@ static int ov9282_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
+	sensor_name = device_get_match_data(ov9282->dev);
+	if (!sensor_name) {
+		dev_err(ov9282->dev, "Sensor name is missing");
+		return ret;
+	}
+	v4l2_i2c_subdev_set_name(&ov9282->sd, client, sensor_name, NULL);
 
 	ret = ov9282_parse_hw_config(ov9282);
 	if (ret) {
@@ -1152,8 +1159,8 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
-	{ .compatible = "ovti,ov9281" },
-	{ .compatible = "ovti,ov9282" },
+	{ .compatible = "ovti,ov9281", .data = "ov9281" },
+	{ .compatible = "ovti,ov9282", .data = "ov9282" },
 	{ }
 };
 
-- 
2.25.1

