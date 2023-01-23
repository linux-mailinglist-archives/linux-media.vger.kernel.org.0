Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9AB677BF6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjAWM4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjAWMzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196DE23D81
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SKbOH0BR33uLs1vJ10EylfjGvfanaIg0BFq5Tid95/k=;
        b=ENiEfDty477cYqa/AkvdUBarIy27k6BS3MOoD4C6Ls6M8kJ8EYvBZEo7h7ghgpPsz3uq7e
        PfJ1SbDtO54tRgvoGsOipagPn2zC2QoRaSlsqpdgEX2hAJgvkWk68Pc5rF/nmNrWUAfEba
        /oZGLgILa3RpYAtH+Cvygz6+F+VR6Kw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-VpfrHOgKOTmjFhUtH1YxvA-1; Mon, 23 Jan 2023 07:54:17 -0500
X-MC-Unique: VpfrHOgKOTmjFhUtH1YxvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78DDF1C07541;
        Mon, 23 Jan 2023 12:54:16 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AE958C15BA0;
        Mon, 23 Jan 2023 12:54:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 42/57] media: atomisp: ov2680: Remove unused data-types and defines from ov2680.h
Date:   Mon, 23 Jan 2023 13:51:50 +0100
Message-Id: <20230123125205.622152-43-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a bunch of unused data-types and defines from ov2680.h.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 60 ----------------------
 1 file changed, 60 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 20ef59928cb1..189d1b2b7584 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -46,45 +46,11 @@
 
 #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
 
-#define OV2680_BIN_FACTOR_MAX 4
-
 #define MAX_FMTS		1
 
-/* sensor_mode_data read_mode adaptation */
-#define OV2680_READ_MODE_BINNING_ON	0x0400
-#define OV2680_READ_MODE_BINNING_OFF	0x00
 #define OV2680_INTEGRATION_TIME_MARGIN	8
-
-#define OV2680_MAX_EXPOSURE_VALUE	0xFFF1
-#define OV2680_MAX_GAIN_VALUE		0xFF
-
-/*
- * focal length bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define OV2680_FOCAL_LENGTH_DEFAULT 0x1B70064
-
-/*
- * current f-number bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define OV2680_F_NUMBER_DEFAULT 0x18000a
-
-/*
- * f-number range bits definition:
- * bits 31-24: max f-number numerator
- * bits 23-16: max f-number denominator
- * bits 15-8: min f-number numerator
- * bits 7-0: min f-number denominator
- */
-#define OV2680_F_NUMBER_RANGE 0x180a180a
 #define OV2680_ID	0x2680
 
-#define OV2680_FINE_INTG_TIME_MIN 0
-#define OV2680_FINE_INTG_TIME_MAX_MARGIN 0
-#define OV2680_COARSE_INTG_TIME_MIN 1
-#define OV2680_COARSE_INTG_TIME_MAX_MARGIN 6
-
 /*
  * OV2680 System control registers
  */
@@ -147,19 +113,6 @@
 #define OV2680_START_STREAMING			0x01
 #define OV2680_STOP_STREAMING			0x00
 
-#define OV2680_INVALID_CONFIG	0xffffffff
-
-struct regval_list {
-	u16 reg_num;
-	u8 value;
-};
-
-struct ov2680_format {
-	u8 *desc;
-	u32 pixelformat;
-	struct ov2680_reg *regs;
-};
-
 /*
  * ov2680 device structure.
  */
@@ -216,18 +169,6 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 			     ctrls.handler)->sd;
 }
 
-#define OV2680_MAX_WRITE_BUF_SIZE	30
-
-struct ov2680_write_buffer {
-	u16 addr;
-	u8 data[OV2680_MAX_WRITE_BUF_SIZE];
-};
-
-struct ov2680_write_ctrl {
-	int index;
-	struct ov2680_write_buffer buffer;
-};
-
 static struct ov2680_reg const ov2680_global_setting[] = {
 	{0x0103, 0x01},
 	{0x3002, 0x00},
@@ -304,7 +245,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{0x5793, 0x00},
 	{0x5794, 0x03}, //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
 	{0x0100, 0x00},	//stream off
-
 	{}
 };
 
-- 
2.39.0

