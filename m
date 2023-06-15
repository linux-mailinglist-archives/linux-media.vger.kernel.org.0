Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55038731B15
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344911AbjFOOPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345019AbjFOOPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00405294C
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ET/nzhEYWy+raA5z/6dMaglG9+rMGZ2aXJ+SjOLGuzQ=;
        b=YZQXYPN4QC5PPUjE9uCMnps6HOpVeET4cSd+c6pp+Ek0LgSGN9rc/LVMeRlQSchqpvVrX5
        8XsKac/7t7JTtmfY1gnc3gvaPH7L/wIRO3oJ0ndsJQ/nor3eS6vj2Fd/S+fJsUzli6+PN9
        FzGQ64ROt4m+62Gx/yAubjvoGwTSBgw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-8B0j76y1Nu6whvjepiSU7w-1; Thu, 15 Jun 2023 10:14:45 -0400
X-MC-Unique: 8B0j76y1Nu6whvjepiSU7w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AE2A3C0DDA2;
        Thu, 15 Jun 2023 14:14:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4519D48FB01;
        Thu, 15 Jun 2023 14:14:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 16/28] media: ov2680: Add endpoint matching support
Date:   Thu, 15 Jun 2023 16:13:37 +0200
Message-Id: <20230615141349.172363-17-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add endpoint matching support and defer probe() until
the endpoint fwnode is available. This is necessary on ACPI
platforms where the bridge code creating the fwnodes may also e.g.
set the "clock-frequency" device property and add GPIO mappings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index d4ef34859914..52ae265612fa 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -103,6 +103,7 @@ struct ov2680_ctrls {
 
 struct ov2680_dev {
 	struct device			*dev;
+	struct fwnode_handle		*ep_fwnode;
 	struct regmap			*regmap;
 	struct v4l2_subdev		sd;
 
@@ -638,6 +639,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->sd.fwnode = sensor->ep_fwnode;
 
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret < 0)
@@ -799,29 +801,39 @@ static int ov2680_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->regmap))
 		return PTR_ERR(sensor->regmap);
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
+	sensor->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev),
+							   NULL);
+	if (!sensor->ep_fwnode)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	mutex_init(&sensor->lock);
+
 	ret = ov2680_parse_dt(sensor);
 	if (ret < 0)
-		return -EINVAL;
+		goto err_fwnode_put;
 
 	ret = ov2680_mode_init(sensor);
 	if (ret < 0)
-		return ret;
+		goto err_fwnode_put;
 
 	ret = ov2680_get_regulators(sensor);
 	if (ret < 0) {
 		dev_err(dev, "failed to get regulators\n");
-		return ret;
+		goto err_fwnode_put;
 	}
 
-	mutex_init(&sensor->lock);
-
 	/*
 	 * Power up and verify the chip now, so that if runtime pm is
 	 * disabled the chip is left on and streaming will work.
 	 */
 	ret = ov2680_power_on(sensor);
 	if (ret < 0)
-		goto lock_destroy;
+		goto err_fwnode_put;
 
 	ret = ov2680_check_id(sensor);
 	if (ret < 0)
@@ -848,9 +860,10 @@ static int ov2680_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(&client->dev);
 err_powerdown:
 	ov2680_power_off(sensor);
-lock_destroy:
+err_fwnode_put:
 	dev_err(dev, "ov2680 init fail: %d\n", ret);
 	mutex_destroy(&sensor->lock);
+	fwnode_handle_put(sensor->ep_fwnode);
 
 	return ret;
 }
@@ -864,6 +877,7 @@ static void ov2680_remove(struct i2c_client *client)
 	mutex_destroy(&sensor->lock);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	fwnode_handle_put(sensor->ep_fwnode);
 
 	/*
 	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
-- 
2.40.1

