Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0E1677BBE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjAWMx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjAWMx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EDA6596
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K5Kq79VHqIoUp+PSEoTTl8h0ovNiUuyK5EkKnXHhuxo=;
        b=GAKu2mFlkP2UEMKVqsKkDFIdLSPg10liq9W28ChBK4awAPcZnUQ83A0mHMTUSBC8tD6r+n
        fHR1Q8bsdbCy4O2vbEkCFGF38wnlVfSteZIxeH0yKNZ5U/W/+tRPUYkII7wr614ulRDMhv
        hlQwzpomkp61eKheb+cbABP7e1kFj74=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-j0FSY9CmMIyp7XuSFD1mzQ-1; Mon, 23 Jan 2023 07:52:43 -0500
X-MC-Unique: j0FSY9CmMIyp7XuSFD1mzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D94487B2A1;
        Mon, 23 Jan 2023 12:52:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE4EC15BA0;
        Mon, 23 Jan 2023 12:52:39 +0000 (UTC)
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
Subject: [PATCH 11/57] media: atomisp: Remove no longer used binning info from sensor resolution info
Date:   Mon, 23 Jan 2023 13:51:19 +0100
Message-Id: <20230123125205.622152-12-hdegoede@redhat.com>
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

Remove the no longer used bin_factor_x, bin_factor_y and bin_mode members
from the resolution info inside various atomisp camera sensor drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/gc0310.h    |  6 --
 drivers/staging/media/atomisp/i2c/gc2235.h    | 27 ---------
 drivers/staging/media/atomisp/i2c/mt9m114.h   | 12 ----
 drivers/staging/media/atomisp/i2c/ov2680.h    | 39 ------------
 drivers/staging/media/atomisp/i2c/ov2722.h    | 30 ----------
 .../staging/media/atomisp/i2c/ov5693/ov5693.h | 60 -------------------
 6 files changed, 174 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 2a559b0d474d..cae480ae6fba 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -123,9 +123,6 @@ struct gc0310_resolution {
 	u32 skip_frames;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 	bool used;
 };
 
@@ -386,9 +383,6 @@ static struct gc0310_resolution gc0310_res_preview[] = {
 		.pixels_per_line = 0x0314,
 		.lines_per_frame = 0x0213,
 #endif
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 2,
 		.regs = gc0310_VGA_30fps,
 	},
diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 8e33eb166bed..55ea422291ba 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -134,9 +134,6 @@ struct gc2235_resolution {
 	u32 skip_frames;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 	bool used;
 };
 
@@ -536,9 +533,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1068,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1600_900_30fps,
 	},
@@ -552,9 +546,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1368,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1616_1082_30fps,
 	},
@@ -567,9 +558,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1368,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1616_1216_30fps,
 	},
@@ -593,9 +581,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1068,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1600_900_30fps,
 	},
@@ -608,9 +593,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1368,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1616_1082_30fps,
 	},
@@ -623,9 +605,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2132,
 		.lines_per_frame = 1368,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1616_1216_30fps,
 	},
@@ -644,9 +623,6 @@ static struct gc2235_resolution gc2235_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 1828,
 		.lines_per_frame = 888,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_1296_736_30fps,
 	},
@@ -659,9 +635,6 @@ static struct gc2235_resolution gc2235_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 1492,
 		.lines_per_frame = 792,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = gc2235_960_640_30fps,
 	},
diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
index 831875071cbb..b0cd1b724394 100644
--- a/drivers/staging/media/atomisp/i2c/mt9m114.h
+++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
@@ -316,9 +316,6 @@ struct mt9m114_res_struct {
 	struct regval_list *regs;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 };
 
 /* 2 bytes used for address: 256 bytes total */
@@ -350,9 +347,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
 
 		.pixels_per_line = 0x0640,
 		.lines_per_frame = 0x0307,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 	},
 	{
 		.desc	= "848P",
@@ -366,9 +360,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
 
 		.pixels_per_line = 0x0640,
 		.lines_per_frame = 0x03E8,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 	},
 	{
 		.desc	= "960P",
@@ -382,9 +373,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
 
 		.pixels_per_line = 0x0644, /* consistent with regs arrays */
 		.lines_per_frame = 0x03E5, /* consistent with regs arrays */
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 	},
 };
 
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 2bc350c67711..596e14453fb3 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -147,9 +147,6 @@ struct ov2680_resolution {
 	u32 skip_frames;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 };
 
 struct ov2680_format {
@@ -758,9 +755,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.fps = 30,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_1616x1216_30fps,
 	},
@@ -771,9 +765,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.fps = 30,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_1616x1082_30fps,
 	},
@@ -784,9 +775,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_1616x916_30fps,
 	},
@@ -797,9 +785,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_1456x1096_30fps,
 	},
@@ -810,9 +795,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_1296x976_30fps,
 	},
@@ -823,9 +805,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_720p_30fps,
 	},
@@ -836,9 +815,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_800x600_30fps,
 	},
@@ -849,9 +825,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_720x592_30fps,
 	},
@@ -862,9 +835,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_656x496_30fps,
 	},
@@ -875,9 +845,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_QVGA_30fps,
 	},
@@ -888,9 +855,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_CIF_30fps,
 	},
@@ -901,9 +865,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-		.bin_factor_x = 0,
-		.bin_factor_y = 0,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2680_QCIF_30fps,
 	},
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 5802cdb0e90c..020743a944c4 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -177,9 +177,6 @@ struct ov2722_resolution {
 	u32 skip_frames;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 	bool used;
 	int mipi_freq;
 };
@@ -1109,9 +1106,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2260,
 		.lines_per_frame = 1244,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1632_1092_30fps,
 		.mipi_freq = 422400,
@@ -1125,9 +1119,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2260,
 		.lines_per_frame = 1244,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1452_1092_30fps,
 		.mipi_freq = 422400,
@@ -1141,9 +1132,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2068,
 		.lines_per_frame = 1114,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1080p_30fps,
 		.mipi_freq = 345600,
@@ -1167,9 +1155,6 @@ struct ov2722_resolution ov2722_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2260,
 		.lines_per_frame = 1244,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1632_1092_30fps,
 		.mipi_freq = 422400,
@@ -1183,9 +1168,6 @@ struct ov2722_resolution ov2722_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2260,
 		.lines_per_frame = 1244,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1452_1092_30fps,
 		.mipi_freq = 422400,
@@ -1199,9 +1181,6 @@ struct ov2722_resolution ov2722_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2068,
 		.lines_per_frame = 1114,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1080p_30fps,
 		.mipi_freq = 345600,
@@ -1220,9 +1199,6 @@ struct ov2722_resolution ov2722_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2048,
 		.lines_per_frame = 1184,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_QVGA_30fps,
 		.mipi_freq = 364800,
@@ -1236,9 +1212,6 @@ struct ov2722_resolution ov2722_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2048,
 		.lines_per_frame = 1184,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_480P_30fps,
 	},
@@ -1251,9 +1224,6 @@ struct ov2722_resolution ov2722_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2068,
 		.lines_per_frame = 1114,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.skip_frames = 3,
 		.regs = ov2722_1080p_30fps,
 		.mipi_freq = 345600,
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
index c9b9dc780f96..5e17eaf8fd6e 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
+++ b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
@@ -198,9 +198,6 @@ struct ov5693_resolution {
 	int pix_clk_freq;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 bin_factor_x;
-	u8 bin_factor_y;
-	u8 bin_mode;
 	bool used;
 };
 
@@ -1109,9 +1106,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_736x496_30fps,
 	},
 	{
@@ -1123,9 +1117,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_1616x1216_30fps,
 	},
 	{
@@ -1137,9 +1128,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2576x1456_30fps,
 	},
 	{
@@ -1151,9 +1139,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2576x1936_30fps,
 	},
 };
@@ -1175,9 +1160,6 @@ struct ov5693_resolution ov5693_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_736x496_30fps,
 	},
 	{
@@ -1189,9 +1171,6 @@ struct ov5693_resolution ov5693_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_1424x1168_30fps,
 	},
 	{
@@ -1203,9 +1182,6 @@ struct ov5693_resolution ov5693_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_1616x1216_30fps,
 	},
 	{
@@ -1217,9 +1193,6 @@ struct ov5693_resolution ov5693_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2592x1456_30fps,
 	},
 	{
@@ -1231,9 +1204,6 @@ struct ov5693_resolution ov5693_res_still[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2592x1944_30fps,
 	},
 };
@@ -1250,9 +1220,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 1,
 		.regs = ov5693_736x496,
 	},
 	{
@@ -1264,9 +1231,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 1,
 		.regs = ov5693_336x256,
 	},
 	{
@@ -1278,9 +1242,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 1,
 		.regs = ov5693_368x304,
 	},
 	{
@@ -1292,9 +1253,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 1,
 		.regs = ov5693_192x160,
 	},
 	{
@@ -1306,9 +1264,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 0,
 		.regs = ov5693_1296x736,
 	},
 	{
@@ -1320,9 +1275,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 2,
-		.bin_factor_y = 2,
-		.bin_mode = 0,
 		.regs = ov5693_1296x976,
 	},
 	{
@@ -1334,9 +1286,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_1636p_30fps,
 	},
 	{
@@ -1348,9 +1297,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_1940x1096,
 	},
 	{
@@ -1362,9 +1308,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2592x1456_30fps,
 	},
 	{
@@ -1376,9 +1319,6 @@ struct ov5693_resolution ov5693_res_video[] = {
 		.used = 0,
 		.pixels_per_line = 2688,
 		.lines_per_frame = 1984,
-		.bin_factor_x = 1,
-		.bin_factor_y = 1,
-		.bin_mode = 0,
 		.regs = ov5693_2592x1944_30fps,
 	},
 };
-- 
2.39.0

