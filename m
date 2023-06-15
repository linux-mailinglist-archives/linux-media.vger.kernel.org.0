Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4C1731B19
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345033AbjFOOPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345028AbjFOOPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7590A2947
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qtke3epwMxfZmSh1aC/1/gDj/3z3vXQUYqijhX2QE4Y=;
        b=L4ZYnNW6mwWOybtJVGKGPWFWS284+a1cRcvlWs/9PCJf+Z6DIs93O2OCu8603cJgcR9bl7
        q5VsurVY1ErI+nNO0aJ/UlQE58RdA/a9FPtnSxfY4Dv8uJas4ih9J5IbbuYYjiAr5PtS1i
        clSUDhRxToCs58j3yq7VTOH3lOwg33o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-bJo2eqjkMCKO1X_9Nl2onA-1; Thu, 15 Jun 2023 10:14:38 -0400
X-MC-Unique: bJo2eqjkMCKO1X_9Nl2onA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55E54858282;
        Thu, 15 Jun 2023 14:14:24 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4269F429543;
        Thu, 15 Jun 2023 14:14:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 25/28] media: ov2680: Add a bunch of register tweaks
Date:   Thu, 15 Jun 2023 16:13:46 +0200
Message-Id: <20230615141349.172363-26-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Usually when developing a sensor driver with help from the vendor
the vendor will provide a bunch of register tweaks for optimal
performance of the sensor.

The atomisp-ov2680.c driver was (presumably) developed by Intel with
help from OmniVision and indeed contains a bunch of register tweaks.

Add these register tweaks to the "main" ov2680.c driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 1651fc6df972..a1cf877e13ef 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -178,18 +178,71 @@ static const int ov2680_hv_flip_bayer_order[] = {
 };
 
 static const struct reg_sequence ov2680_global_setting[] = {
+	/* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
+	{0x3016, 0x1c},
+
 	/* R MANUAL set exposure and gain to manual (hw does not do auto) */
 	{0x3503, 0x03},
 
+	/* Analog control register tweaks */
+	{0x3603, 0x39}, /* Reset value 0x99 */
+	{0x3604, 0x24}, /* Reset value 0x74 */
+	{0x3621, 0x37}, /* Reset value 0x44 */
+
+	/* Sensor control register tweaks */
+	{0x3701, 0x64}, /* Reset value 0x61 */
+	{0x3705, 0x3c}, /* Reset value 0x21 */
+	{0x370c, 0x50}, /* Reset value 0x10 */
+	{0x370d, 0xc0}, /* Reset value 0x00 */
+	{0x3718, 0x88}, /* Reset value 0x80 */
+
+	/* PSRAM tweaks */
+	{0x3781, 0x80}, /* Reset value 0x00 */
+	{0x3784, 0x0c}, /* Reset value 0x00, based on OV2680_R1A_AM10.ovt */
+	{0x3789, 0x60}, /* Reset value 0x50 */
+
+	/* BLC CTRL00 0x01 -> 0x81 set avg_weight to 8 */
+	{0x4000, 0x81},
+
 	/* Set black level compensation range to 0 - 3 (default 0 - 11) */
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 
+	/* VFIFO R2 0x00 -> 0x02 set Frame reset enable */
+	{0x4602, 0x02},
+
+	/* MIPI ctrl CLK PREPARE MIN change from 0x26 (38) -> 0x36 (54) */
+	{0x481f, 0x36},
+
+	/* MIPI ctrl CLK LPX P MIN change from 0x32 (50) -> 0x36 (54) */
+	{0x4825, 0x36},
+
+	/* R ISP CTRL2 0x20 -> 0x30, set sof_sel bit */
+	{0x5002, 0x30},
+
 	/*
 	 * Window CONTROL 0x00 -> 0x01, enable manual window control,
 	 * this is necessary for full size flip and mirror support.
 	 */
 	{0x5708, 0x01},
+
+	/*
+	 * DPC CTRL0 0x14 -> 0x3e, set enable_tail, enable_3x3_cluster
+	 * and enable_general_tail bits based OV2680_R1A_AM10.ovt.
+	 */
+	{0x5780, 0x3e},
+
+	/* DPC MORE CONNECTION CASE THRE 0x0c (12) -> 0x02 (2) */
+	{0x5788, 0x02},
+
+	/* DPC GAIN LIST1 0x0f (15) -> 0x08 (8) */
+	{0x578e, 0x08},
+
+	/* DPC GAIN LIST2 0x3f (63) -> 0x0c (12) */
+	{0x578f, 0x0c},
+
+	/* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
+	{0x5792, 0x00},
 };
 
 static struct ov2680_dev *to_ov2680_dev(struct v4l2_subdev *sd)
-- 
2.40.1

