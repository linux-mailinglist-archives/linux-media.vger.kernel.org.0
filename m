Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C672C76E495
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjHCJhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbjHCJgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5CB35A5
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OU0ELlj18DaO7z7eFjreRnwtZGmvkS2ThEX3kD1fe7I=;
        b=KgLrh8AvEmi0hZ7VVvfV9wWA3/F420rIdBKo0bUU7vOWnqFkiKGIyKdBX3US3+EqwPIQHB
        vT9P9qyIdQCR+8UD/BkqZ1QQiQnNVEXWiMULFwadU8RVv40uTJp8DroOJaXXBrH0+WLd9x
        6ckXW9mKTT7T6TAtHMA9xRjYUBOEYgo=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207--WfbfLPSPnqff240Uztyww-1; Thu, 03 Aug 2023 05:34:23 -0400
X-MC-Unique: -WfbfLPSPnqff240Uztyww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 773C02A59578;
        Thu,  3 Aug 2023 09:34:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 11DB42166B25;
        Thu,  3 Aug 2023 09:34:20 +0000 (UTC)
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
Subject: [PATCH v5 19/32] media: ov2680: Annotate the per mode register setting lists
Date:   Thu,  3 Aug 2023 11:33:34 +0200
Message-ID: <20230803093348.15679-20-hdegoede@redhat.com>
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

Annotate the per mode register setting lists.

This is a preparation patch for moving to calculating the per mode
settings, allowing to set any mode through cropping.

The annotations make it easier to see which registers are mode
dependent and which are fixed.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 118 ++++++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a83efd449993..e7d2e555e1c6 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -140,27 +140,117 @@ static const int ov2680_hv_flip_bayer_order[] = {
 };
 
 static const struct reg_sequence ov2680_setting_30fps_QUXGA_800_600[] = {
-	{0x3086, 0x01}, {0x370a, 0x23}, {0x3808, 0x03}, {0x3809, 0x20},
-	{0x380a, 0x02}, {0x380b, 0x58}, {0x380c, 0x06}, {0x380d, 0xac},
-	{0x380e, 0x02}, {0x380f, 0x84}, {0x3811, 0x04}, {0x3813, 0x04},
-	{0x3814, 0x31}, {0x3815, 0x31}, {0x3820, 0xc0}, {0x4008, 0x00},
-	{0x4009, 0x03}, {0x4837, 0x1e}, {0x3501, 0x4e}, {0x3502, 0xe0},
+	/* Set PLL SP DIV to 1 for binning mode */
+	{0x3086, 0x01},
+
+	/* Sensor control register 0x0a to 0x23 for binning mode */
+	{0x370a, 0x23},
+
+	/* Set X and Y output size to 800x600 */
+	{0x3808, 0x03},
+	{0x3809, 0x20},
+	{0x380a, 0x02},
+	{0x380b, 0x58},
+
+	/* Set HTS + VTS to 1708x644 */
+	{0x380c, 0x06},
+	{0x380d, 0xac},
+	{0x380e, 0x02},
+	{0x380f, 0x84},
+
+	/* Set ISP WIN X and Y start to 4x4 */
+	{0x3811, 0x04},
+	{0x3813, 0x04},
+
+	/* Set X INC and Y INC for binning */
+	{0x3814, 0x31},
+	{0x3815, 0x31},
+
+	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
+	{0x3820, 0xc0},
+
+	/* Set black level compensation range to 0 - 3 (default 0 - 11) */
+	{0x4008, 0x00},
+	{0x4009, 0x03},
+
+	/* Set MIPI pclk period to 0x1e (default/reset is 0x18) */
+	{0x4837, 0x1e},
+
+	/* Initialize exposure to 0x4ee (overridden by the ctrl, drop this */
+	{0x3501, 0x4e},
+	{0x3502, 0xe0},
+
+	/* R MANUAL set exposure and gain to manual (hw does not do auto) */
 	{0x3503, 0x03},
 };
 
 static const struct reg_sequence ov2680_setting_30fps_720P_1280_720[] = {
-	{0x3086, 0x00}, {0x3808, 0x05}, {0x3809, 0x00}, {0x380a, 0x02},
-	{0x380b, 0xd0}, {0x380c, 0x06}, {0x380d, 0xa8}, {0x380e, 0x05},
-	{0x380f, 0x0e}, {0x3811, 0x08}, {0x3813, 0x06}, {0x3814, 0x11},
-	{0x3815, 0x11}, {0x3820, 0xc0}, {0x4008, 0x00},
+	/* Set PLL SP DIV to 0 for not binning mode */
+	{0x3086, 0x00},
+
+	/* Set X and Y output size to 1280x720 */
+	{0x3808, 0x05},
+	{0x3809, 0x00},
+	{0x380a, 0x02},
+	{0x380b, 0xd0},
+
+	/* Set HTS + VTS to 1704x1294 */
+	{0x380c, 0x06},
+	{0x380d, 0xa8},
+	{0x380e, 0x05},
+	{0x380f, 0x0e},
+
+	/* Set ISP WIN X and Y start to 8x6 */
+	{0x3811, 0x08},
+	{0x3813, 0x06},
+
+	/* Set X INC and Y INC for non binning */
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+
+	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
+	{0x3820, 0xc0},
+
+	/* Set backlight compensation range start to 0 */
+	{0x4008, 0x00},
 };
 
 static const struct reg_sequence ov2680_setting_30fps_UXGA_1600_1200[] = {
-	{0x3086, 0x00}, {0x3501, 0x4e}, {0x3502, 0xe0}, {0x3808, 0x06},
-	{0x3809, 0x40}, {0x380a, 0x04}, {0x380b, 0xb0}, {0x380c, 0x06},
-	{0x380d, 0xa8}, {0x380e, 0x05}, {0x380f, 0x0e}, {0x3811, 0x00},
-	{0x3813, 0x00}, {0x3814, 0x11}, {0x3815, 0x11}, {0x3820, 0xc0},
-	{0x4008, 0x00}, {0x4837, 0x18}
+	/* Set PLL SP DIV to 0 for not binning mode */
+	{0x3086, 0x00},
+
+	/* Initialize exposure to 0x4ee (overridden by the ctrl, drop this */
+	{0x3501, 0x4e},
+	{0x3502, 0xe0},
+
+	/* Set X and Y output size to 1600x1200 */
+	{0x3808, 0x06},
+	{0x3809, 0x40},
+	{0x380a, 0x04},
+	{0x380b, 0xb0},
+
+	/* Set HTS + VTS to 1704x1294 */
+	{0x380c, 0x06},
+	{0x380d, 0xa8},
+	{0x380e, 0x05},
+	{0x380f, 0x0e},
+
+	/* Set ISP WIN X and Y start to 0x0 */
+	{0x3811, 0x00},
+	{0x3813, 0x00},
+
+	/* Set X INC and Y INC for non binning */
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+
+	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
+	{0x3820, 0xc0},
+
+	/* Set backlight compensation range start to 0 */
+	{0x4008, 0x00},
+
+	/* Set MIPI pclk period to default/reset value of 0x18 */
+	{0x4837, 0x18}
 };
 
 static const struct ov2680_mode_info ov2680_mode_init_data = {
-- 
2.41.0

