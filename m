Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1704B726658
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjFGQse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjFGQsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7764D1FD7
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mF0G/BuKqMpDT6L2PdQklC8fyBPiSirrDLVqY8Z5J5Q=;
        b=Gq00v1uJ+YEU2jy8vcsRNBImt/uwc/7lLcYjkwuPSjMAgToqw5/KHr6nkymrHO6GVJIzW0
        HES1iOJDZviTtEjEEd7o552YtnP0gA4ndo3ARAgE8rQNT10gBdLw02QjJzvg8LYXp1apO3
        O5cGiMYV+H1Jz1TmZ1nTlRG+MiHCH/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-rf10S96LMECgfgJod8OZHg-1; Wed, 07 Jun 2023 12:47:43 -0400
X-MC-Unique: rf10S96LMECgfgJod8OZHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC625811E8D;
        Wed,  7 Jun 2023 16:47:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 91F2CC1603B;
        Wed,  7 Jun 2023 16:47:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 16/28] media: ov2680: Add endpoint matching support
Date:   Wed,  7 Jun 2023 18:47:00 +0200
Message-Id: <20230607164712.63579-17-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/media/i2c/ov2680.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b3a792b28467..9fa92b4f1307 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -102,6 +102,7 @@ struct ov2680_ctrls {
 
 struct ov2680_dev {
 	struct device			*dev;
+	struct fwnode_handle		*ep_fwnode;
 	struct regmap			*regmap;
 	struct v4l2_subdev		sd;
 
@@ -614,6 +615,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor, struct i2c_client *cl
 	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->sd.fwnode = sensor->ep_fwnode;
 
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret < 0)
@@ -768,29 +770,37 @@ static int ov2680_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->regmap))
 		return PTR_ERR(sensor->regmap);
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
+	sensor->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!sensor->ep_fwnode)
+		return dev_err_probe(dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
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
@@ -817,9 +827,10 @@ static int ov2680_probe(struct i2c_client *client)
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
@@ -833,6 +844,7 @@ static void ov2680_remove(struct i2c_client *client)
 	mutex_destroy(&sensor->lock);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	fwnode_handle_put(sensor->ep_fwnode);
 
 	/*
 	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
-- 
2.40.1

