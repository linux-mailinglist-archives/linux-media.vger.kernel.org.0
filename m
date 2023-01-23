Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9016A677BDF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbjAWMzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjAWMzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3992C23C4D
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HbalVIDbwc1cifI+ymx0Knh7vgZEo1HOpI10J2ei5+s=;
        b=XyAuaHHkzp0NtlaR3jVk0cbEHm81nB3Sz3BDXboz2yEgE0RyCYJT5qpnx99DQBaZQ1r5eB
        KGLNFypCmjYJH5enBPI4/YYXHS7sqyimKmVuboA7N21UjONRai1myv+X5ARDN87FnLm0Kt
        3igkECLBauZ4wga/b7GlOD0qK/1zsLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-jMvvyDqvPUaknzZuD_3TmA-1; Mon, 23 Jan 2023 07:54:11 -0500
X-MC-Unique: jMvvyDqvPUaknzZuD_3TmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9479802BF3;
        Mon, 23 Jan 2023 12:54:10 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 60376C15BA0;
        Mon, 23 Jan 2023 12:54:08 +0000 (UTC)
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
Subject: [PATCH 40/57] media: atomisp: ov2680: Drop struct ov2680_resolution / ov2680_res_preview
Date:   Mon, 23 Jan 2023 13:51:48 +0100
Message-Id: <20230123125205.622152-41-hdegoede@redhat.com>
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

Drop struct ov2680_resolution and the ov2680_res_preview[] array,
this is now only used in ov2680_enum_frame_size() and only
the width + height are used there.

Replace this with a new struct v4l2_frmsize_discrete ov2680_frame_sizes[]
array.

No functional changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        |  24 +-
 drivers/staging/media/atomisp/i2c/ov2680.h    | 610 ------------------
 2 files changed, 19 insertions(+), 615 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 3d5e18fb45ee..432539dd274c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -698,15 +698,29 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
+	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
+		{ 1616, 1216 },
+		{ 1616, 1082 },
+		{ 1616,  916 },
+		{ 1456, 1096 },
+		{ 1296,  976 },
+		{ 1296,  736 },
+		{  800,  600 },
+		{  720,  592 },
+		{  656,  496 },
+		{  336,  256 },
+		{  352,  288 },
+		{  176,  144 },
+	};
 	int index = fse->index;
 
-	if (index >= N_RES_PREVIEW)
+	if (index >= ARRAY_SIZE(ov2680_frame_sizes))
 		return -EINVAL;
 
-	fse->min_width = ov2680_res_preview[index].width;
-	fse->min_height = ov2680_res_preview[index].height;
-	fse->max_width = ov2680_res_preview[index].width;
-	fse->max_height = ov2680_res_preview[index].height;
+	fse->min_width = ov2680_frame_sizes[index].width;
+	fse->min_height = ov2680_frame_sizes[index].height;
+	fse->max_width = ov2680_frame_sizes[index].width;
+	fse->max_height = ov2680_frame_sizes[index].height;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index e9d0c84705fb..20ef59928cb1 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -154,18 +154,6 @@ struct regval_list {
 	u8 value;
 };
 
-struct ov2680_resolution {
-	const struct ov2680_reg *regs;
-	int res;
-	int width;
-	int height;
-	int fps;
-	int pix_clk_freq;
-	u32 skip_frames;
-	u16 pixels_per_line;
-	u16 lines_per_frame;
-};
-
 struct ov2680_format {
 	u8 *desc;
 	u32 pixelformat;
@@ -320,602 +308,4 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{}
 };
 
-/*
- * 176x144 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_QCIF_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0xa0},
-	{0x3802, 0x00},
-	{0x3803, 0x78},
-	{0x3804, 0x05},
-	{0x3805, 0xaf},
-	{0x3806, 0x04},
-	{0x3807, 0x47},
-	{0x3808, 0x00},
-	{0x3809, 0xC0},
-	{0x380a, 0x00},
-	{0x380b, 0xa0},
-	{0x380c, 0x06},
-	{0x380d, 0xb0},
-	{0x3810, 0x00},
-	{0x3811, 0x04},
-	{0x3812, 0x00},
-	{0x3813, 0x04},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x4000, 0x81},
-	{0x4001, 0x40},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x00},
-	{0x5705, 0xc0},
-	{0x5706, 0x00},
-	{0x5707, 0xa0},
-	{0x3820, 0xc2},
-	{0x3821, 0x01},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- * 352x288 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_CIF_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0xa0},
-	{0x3802, 0x00},
-	{0x3803, 0x78},
-	{0x3804, 0x03},
-	{0x3805, 0x8f},
-	{0x3806, 0x02},
-	{0x3807, 0xe7},
-	{0x3808, 0x01},
-	{0x3809, 0x70},
-	{0x380a, 0x01},
-	{0x380b, 0x30},
-	{0x380c, 0x06},
-	{0x380d, 0xb0},
-	{0x3810, 0x00},
-	{0x3811, 0x04},
-	{0x3812, 0x00},
-	{0x3813, 0x04},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x01},
-	{0x5705, 0x70},
-	{0x5706, 0x01},
-	{0x5707, 0x30},
-	{0x3820, 0xc2},
-	{0x3821, 0x01},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- * 336x256 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_QVGA_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0xa0},
-	{0x3802, 0x00},
-	{0x3803, 0x78},
-	{0x3804, 0x03},
-	{0x3805, 0x4f},
-	{0x3806, 0x02},
-	{0x3807, 0x87},
-	{0x3808, 0x01},
-	{0x3809, 0x50},
-	{0x380a, 0x01},
-	{0x380b, 0x00},
-	{0x380c, 0x06},
-	{0x380d, 0xb0},
-	{0x3810, 0x00},
-	{0x3811, 0x04},
-	{0x3812, 0x00},
-	{0x3813, 0x04},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x01},
-	{0x5705, 0x50},
-	{0x5706, 0x01},
-	{0x5707, 0x00},
-	{0x3820, 0xc2},
-	{0x3821, 0x01},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- * 656x496 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_656x496_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0xa0},
-	{0x3802, 0x00},
-	{0x3803, 0x78},
-	{0x3804, 0x05},
-	{0x3805, 0xcf},
-	{0x3806, 0x04},
-	{0x3807, 0x67},
-	{0x3808, 0x02},
-	{0x3809, 0x90},
-	{0x380a, 0x01},
-	{0x380b, 0xf0},
-	{0x380c, 0x06},
-	{0x380d, 0xb0},
-	{0x3810, 0x00},
-	{0x3811, 0x04},
-	{0x3812, 0x00},
-	{0x3813, 0x04},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x02},
-	{0x5705, 0x90},
-	{0x5706, 0x01},
-	{0x5707, 0xf0},
-	{0x3820, 0xc2},
-	{0x3821, 0x01},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- * 720x592 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_720x592_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0x00}, // X_ADDR_START;
-	{0x3802, 0x00},
-	{0x3803, 0x00}, // Y_ADDR_START;
-	{0x3804, 0x05},
-	{0x3805, 0xaf}, // X_ADDR_END;
-	{0x3806, 0x04},
-	{0x3807, 0xaf}, // Y_ADDR_END;
-	{0x3808, 0x02},
-	{0x3809, 0xd0}, // X_OUTPUT_SIZE;
-	{0x380a, 0x02},
-	{0x380b, 0x50}, // Y_OUTPUT_SIZE;
-	{0x380c, 0x06},
-	{0x380d, 0xac}, // HTS;
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x00},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5708, 0x01},
-	{0x5704, 0x02},
-	{0x5705, 0xd0}, // X_WIN;
-	{0x5706, 0x02},
-	{0x5707, 0x50}, // Y_WIN;
-	{0x3820, 0xc2}, // FLIP_FORMAT;
-	{0x3821, 0x01}, // MIRROR_FORMAT;
-	{0x5090, 0x00}, // PRE ISP CTRL16, default value is 0x0C;
-	// BIT[3]: Mirror order, BG or GB;
-	// BIT[2]: Flip order, BR or RB;
-	{0x5081, 0x41},
-	{}
-};
-
-/*
- * 800x600 30fps  VBlanking 1lane 10Bit (binning)
- */
-static struct ov2680_reg const ov2680_800x600_30fps[] = {
-	{0x3086, 0x01},
-	{0x370a, 0x23},
-	{0x3801, 0x00}, /* hstart 0 */
-	{0x3802, 0x00},
-	{0x3803, 0x00}, /* vstart 0 */
-	{0x3804, 0x06},
-	{0x3805, 0x4f}, /* hend 1615 */
-	{0x3806, 0x04},
-	{0x3807, 0xbf}, /* vend 1215 */
-	{0x3808, 0x03},
-	{0x3809, 0x20}, /* hsize 800 */
-	{0x380a, 0x02},
-	{0x380b, 0x58}, /* vsize 600 */
-	{0x380c, 0x06},
-	{0x380d, 0xac}, /* htotal 1708 */
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x00},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x5708, 0x01},
-	{0x5704, 0x03},
-	{0x5705, 0x20},
-	{0x5706, 0x02},
-	{0x5707, 0x58},
-	{0x3820, 0xc2},
-	{0x3821, 0x01},
-	{0x5090, 0x00},
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-	{0x5081, 0x41},
-	{}
-};
-
-/*
- * 720p=1280*720 30fps  VBlanking 1lane 10Bit (no-Scaling)
- */
-static struct ov2680_reg const ov2680_720p_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0xa0}, /* hstart 160 */
-	{0x3802, 0x00},
-	{0x3803, 0xf2}, /* vstart 242 */
-	{0x3804, 0x05},
-	{0x3805, 0xbf}, /* hend 1471 */
-	{0x3806, 0x03},
-	{0x3807, 0xdd}, /* vend 989 */
-	{0x3808, 0x05},
-	{0x3809, 0x10}, /* hsize 1296 */
-	{0x380a, 0x02},
-	{0x380b, 0xe0}, /* vsize 736 */
-	{0x380c, 0x06},
-	{0x380d, 0xa8}, /* htotal 1704 */
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x06},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x4008, 0x02},
-	{0x4009, 0x09},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x05},
-	{0x5705, 0x10},
-	{0x5706, 0x02},
-	{0x5707, 0xe0},
-	{0x3820, 0xc0},
-	{0x3821, 0x00},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- * 1296x976 30fps  VBlanking 1lane 10Bit(no-scaling)
- */
-static struct ov2680_reg const ov2680_1296x976_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0xa0}, /* hstart 160 */
-	{0x3802, 0x00},
-	{0x3803, 0x78}, /* vstart 120 */
-	{0x3804, 0x05},
-	{0x3805, 0xbf}, /* hend 1471 */
-	{0x3806, 0x04},
-	{0x3807, 0x57}, /* vend 1111 */
-	{0x3808, 0x05},
-	{0x3809, 0x10}, /* hsize 1296 */
-	{0x380a, 0x03},
-	{0x380b, 0xd0}, /* vsize 976 */
-	{0x380c, 0x06},
-	{0x380d, 0xa8}, /* htotal 1704 */
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x4008, 0x02},
-	{0x4009, 0x09},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x05},
-	{0x5705, 0x10},
-	{0x5706, 0x03},
-	{0x5707, 0xd0},
-	{0x3820, 0xc0},
-	{0x3821, 0x00}, //mirror/flip
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- *   1456*1096 30fps  VBlanking 1lane 10bit(no-scaling)
- */
-static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0x90},
-	{0x3802, 0x00},
-	{0x3803, 0x78},
-	{0x3804, 0x06},
-	{0x3805, 0x4f},
-	{0x3806, 0x04},
-	{0x3807, 0xC0},
-	{0x3808, 0x05},
-	{0x3809, 0xb0},
-	{0x380a, 0x04},
-	{0x380b, 0x48},
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x00},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x4008, 0x02},
-	{0x4009, 0x09},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x05},
-	{0x5705, 0xb0},
-	{0x5706, 0x04},
-	{0x5707, 0x48},
-	{0x3820, 0xc0},
-	{0x3821, 0x00},
-	// {0x5090, 0x0c},
-	{}
-};
-
-/*
- *1616x916  30fps  VBlanking 1lane 10bit
- */
-
-static struct ov2680_reg const ov2680_1616x916_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x96},
-	{0x3804, 0x06},
-	{0x3805, 0x4f},
-	{0x3806, 0x04},
-	{0x3807, 0x39},
-	{0x3808, 0x06},
-	{0x3809, 0x50},
-	{0x380a, 0x03},
-	{0x380b, 0x94},
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x4008, 0x02},
-	{0x4009, 0x09},
-	{0x5081, 0x41},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x06},
-	{0x5705, 0x50},
-	{0x5706, 0x03},
-	{0x5707, 0x94},
-	{0x3820, 0xc0},
-	{0x3821, 0x00},
-	// {0x5090, 0x0C},
-	{}
-};
-
-/*
- * 1616x1082 30fps VBlanking 1lane 10Bit
- */
-static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x86},
-	{0x3804, 0x06},
-	{0x3805, 0x4f},
-	{0x3806, 0x04},
-	{0x3807, 0xbf},
-	{0x3808, 0x06},
-	{0x3809, 0x50},
-	{0x380a, 0x04},
-	{0x380b, 0x3a},
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x00},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x06},
-	{0x5705, 0x50},
-	{0x5706, 0x04},
-	{0x5707, 0x3a},
-	{0x3820, 0xc0},
-	{0x3821, 0x00},
-	// {0x5090, 0x0C},
-	{0x4008, 0x02},
-	{0x4009, 0x09},
-	{0x5081, 0x41},
-	{}
-};
-
-/*
- * 1616x1216 30fps VBlanking 1lane 10Bit
- */
-static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
-	{0x3086, 0x00},
-	{0x370a, 0x21},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x06},
-	{0x3805, 0x4f},
-	{0x3806, 0x04},
-	{0x3807, 0xbf},
-	{0x3808, 0x06},
-	{0x3809, 0x50},//50},//4line for mirror and flip
-	{0x380a, 0x04},
-	{0x380b, 0xc0},//c0},
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x00},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x4008, 0x00},
-	{0x4009, 0x0b},
-	{0x5081, 0x01},
-	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x06},
-	{0x5705, 0x50},
-	{0x5706, 0x04},
-	{0x5707, 0xc0},
-	{0x3820, 0xc0},
-	{0x3821, 0x00},
-	// {0x5090, 0x0C},
-	{}
-};
-
-static struct ov2680_resolution ov2680_res_preview[] = {
-	{
-		.width = 1616,
-		.height = 1216,
-		.pix_clk_freq = 66,
-		.fps = 30,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_1616x1216_30fps,
-	},
-	{
-		.width = 1616,
-		.height = 1082,
-		.pix_clk_freq = 66,
-		.fps = 30,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_1616x1082_30fps,
-	},
-	{
-		.width = 1616,
-		.height = 916,
-		.fps = 30,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_1616x916_30fps,
-	},
-	{
-		.width = 1456,
-		.height = 1096,
-		.fps = 30,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_1456x1096_30fps,
-	},
-	{
-		.width = 1296,
-		.height = 976,
-		.fps = 30,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_1296x976_30fps,
-	},
-	{
-		.width = 1296,
-		.height = 736,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_720p_30fps,
-	},
-	{
-		.width = 800,
-		.height = 600,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_800x600_30fps,
-	},
-	{
-		.width = 720,
-		.height = 592,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_720x592_30fps,
-	},
-	{
-		.width = 656,
-		.height = 496,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_656x496_30fps,
-	},
-	{
-		.width = 336,
-		.height = 256,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_QVGA_30fps,
-	},
-	{
-		.width = 352,
-		.height = 288,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_CIF_30fps,
-	},
-	{
-		.width = 176,
-		.height = 144,
-		.fps = 60,
-		.pix_clk_freq = 66,
-		.pixels_per_line = 1698,//1704,
-		.lines_per_frame = 1294,
-		.skip_frames = 3,
-		.regs = ov2680_QCIF_30fps,
-	},
-};
-
-#define N_RES_PREVIEW (ARRAY_SIZE(ov2680_res_preview))
-
 #endif
-- 
2.39.0

