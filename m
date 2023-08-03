Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE9276E47D
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbjHCJf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbjHCJf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2593358B
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kemH3TIGjsRjAmEGqlg6Np7m9pndL4C5+2GpW0YrgzE=;
        b=UptuEEGlrB/RDnTecuPjce9IX/wlc18MOvhNhcysX0rz1EmgPdjiIPbmfkWd8BxNC4dStz
        G/J9kbmULL84v3CL3ehBl6dPnT8jpxJRUEqv17zkUj7babCZUc0TS5Q7bKh9iuL2sAIrMw
        AaCLqF8eqBAnetZf3qYSFUwn5/YCL2E=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-689-vSivb_6vPlaBg7kQKBmLvQ-1; Thu, 03 Aug 2023 05:34:05 -0400
X-MC-Unique: vSivb_6vPlaBg7kQKBmLvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EF21C0754F;
        Thu,  3 Aug 2023 09:34:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1EA022166B25;
        Thu,  3 Aug 2023 09:34:03 +0000 (UTC)
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
Subject: [PATCH v5 08/32] media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
Date:   Thu,  3 Aug 2023 11:33:23 +0200
Message-ID: <20230803093348.15679-9-hdegoede@redhat.com>
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

When the ov2680_power_on() "sensor soft reset failed" path is hit during
probe() the WARN() about putting an enabled regulator at
drivers/regulator/core.c:2398 triggers 3 times (once for each regulator),
filling dmesg with backtraces.

Fix this by properly disabling the regulators on ov2680_power_on() errors.

Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e3652b5394c4..1f923acbbc07 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -475,7 +475,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 		ret = ov2680_write_reg(sensor, OV2680_REG_SOFT_RESET, 0x01);
 		if (ret != 0) {
 			dev_err(dev, "sensor soft reset failed\n");
-			return ret;
+			goto err_disable_regulators;
 		}
 		usleep_range(1000, 2000);
 	} else {
@@ -485,7 +485,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 
 	ret = clk_prepare_enable(sensor->xvclk);
 	if (ret < 0)
-		return ret;
+		goto err_disable_regulators;
 
 	sensor->is_enabled = true;
 
@@ -495,6 +495,10 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 	ov2680_stream_disable(sensor);
 
 	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(OV2680_NUM_SUPPLIES, sensor->supplies);
+	return ret;
 }
 
 static int ov2680_s_power(struct v4l2_subdev *sd, int on)
-- 
2.41.0

