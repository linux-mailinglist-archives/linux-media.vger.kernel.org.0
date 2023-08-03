Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B0776E492
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbjHCJgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235130AbjHCJgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB9435A2
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0NgLAKz9Yt7HtZ5vybpERWJr/SrAgRfg1hdXVwyplVw=;
        b=RfnGW16vEHdrfcnzpkYnaAWger1pMz6tTz3R9FjTIzAL0vdlOp7841N42og0X0RPWZa/z1
        BkMv+3I0eORO4V/qOqWyn/GhK2BIngVxaCaQVymPKnzcCrf2sQucqbGT2nMZiZ/8e7CihK
        GrGRijNjePGd6qolq4D7AqYJIIfF0lY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-Clv5J6QQOsOq-Hz2TVPYJQ-1; Thu, 03 Aug 2023 05:34:18 -0400
X-MC-Unique: Clv5J6QQOsOq-Hz2TVPYJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9417688D06C;
        Thu,  3 Aug 2023 09:34:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2F49C2166B25;
        Thu,  3 Aug 2023 09:34:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 16/32] media: ov2680: Wait for endpoint fwnode before continuing with probe()
Date:   Thu,  3 Aug 2023 11:33:31 +0200
Message-ID: <20230803093348.15679-17-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Defer probe() until the endpoint fwnode is available. This is necessary
on ACPI platforms where the bridge code creating the fwnodes may also e.g.
set the "clock-frequency" device property and add GPIO mappings.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Only defer probe do not set v4l2_subdev.fwnode
---
 drivers/media/i2c/ov2680.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a8c257f3bcd6..d4664581b49b 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -717,10 +717,22 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = sensor->dev;
+	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *gpio;
 	unsigned int rate = 0;
 	int i, ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
+	ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!ep_fwnode)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	fwnode_handle_put(ep_fwnode);
+
 	/*
 	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
 	 * drivers have standardized on using "powerdown" as con-id name
@@ -801,7 +813,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	ret = ov2680_parse_dt(sensor);
 	if (ret < 0)
-		return -EINVAL;
+		return ret;
 
 	ret = ov2680_mode_init(sensor);
 	if (ret < 0)
-- 
2.41.0

