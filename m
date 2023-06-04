Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2489872187C
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjFDQPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjFDQPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48537DF
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nJXpReGBegAvRNDGOfYqicUKej5nUDHaJDYY5xDD8B0=;
        b=EYa3xdr2+11PBeHV8/sOznc2k74Oxou0q2oiuQzAlUGK5vHLfgUrhI1ERNP3t+gIyBSYZb
        waCcGh/iLTkso19iZGT5izP+ZjFe8jnHnfTRNILF2tFXt5SP1kp+79yf325ImMT8Gymj3b
        KRheDqIKygRADogFH1kRHW7C4DO3QGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-P-ylcQKAPUejx6pIIDWhaA-1; Sun, 04 Jun 2023 12:14:22 -0400
X-MC-Unique: P-ylcQKAPUejx6pIIDWhaA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95DB3185A78F;
        Sun,  4 Jun 2023 16:14:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE6F492B00;
        Sun,  4 Jun 2023 16:14:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 3/5] media: atomisp: ov2680: Remove unnecessary registers from ov2680_global_setting[]
Date:   Sun,  4 Jun 2023 18:14:04 +0200
Message-Id: <20230604161406.69369-4-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
References: <20230604161406.69369-1-hdegoede@redhat.com>
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

Many of the values in ov2680_global_setting[] match the default/reset
register value for the ov2680 sensor (verified with both datasheet
and actual hw) so they are no-ops.

And there are also a coupe of others which are later overwritten
by ctrls or by ov2680_set_mode().

Remove all the unnecessary entries and add annotations to
the remaining entries documenting what they change
(in sofar as things are documented in the datasheet).

This also removes the double writing of OV2680_REG_SOFT_RESET in
ov2680_init_registers() (one direct write, one in ov2680_global_setting[])
instead add a short sleep after the first write to give the sensor
time to reset.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        |   1 +
 drivers/staging/media/atomisp/i2c/ov2680.h    | 117 ++++++++----------
 2 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 1db2eb9f9e25..dcc06c725544 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -175,6 +175,7 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 	int ret;
 
 	ret = ov_write_reg8(client, OV2680_SW_RESET, 0x01);
+	usleep_range(1000, 2000);
 	ret |= ov2680_write_reg_array(client, ov2680_global_setting);
 
 	return ret;
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index b6c0ef591c69..6a71de55600b 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -172,82 +172,75 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 }
 
 static struct ov2680_reg const ov2680_global_setting[] = {
-	{0x0103, 0x01},
-	{0x3002, 0x00},
+	/* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
 	{0x3016, 0x1c},
-	{0x3018, 0x44},
-	{0x3020, 0x00},
-	{0x3080, 0x02},
+
+	/* PLL MULT bits 0-7, datasheet default 0x37 for 24MHz extclk, use 0x45 for 19.2 Mhz extclk */
 	{0x3082, 0x45},
-	{0x3084, 0x09},
-	{0x3085, 0x04},
-	{0x3086, 0x00},
+
+	/* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw does not do auto) */
 	{0x3503, 0x03},
-	{0x350b, 0x36},
-	{0x3600, 0xb4},
-	{0x3603, 0x39},
-	{0x3604, 0x24},
-	{0x3605, 0x00},
-	{0x3620, 0x26},
-	{0x3621, 0x37},
-	{0x3622, 0x04},
-	{0x3628, 0x00},
-	{0x3705, 0x3c},
-	{0x370c, 0x50},
-	{0x370d, 0xc0},
-	{0x3718, 0x88},
-	{0x3720, 0x00},
-	{0x3721, 0x00},
-	{0x3722, 0x00},
-	{0x3723, 0x00},
-	{0x3738, 0x00},
-	{0x3717, 0x58},
-	{0x3781, 0x80},
-	{0x3789, 0x60},
-	{0x3800, 0x00},
-	{0x3819, 0x04},
+
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
 	{0x4000, 0x81},
-	{0x4001, 0x40},
+
+	/* Set black level compensation range to 0 - 3 (default 0 - 11) */
 	{0x4008, 0x00},
 	{0x4009, 0x03},
+
+	/* VFIFO R2 0x00 -> 0x02 set Frame reset enable */
 	{0x4602, 0x02},
+
+	/* MIPI ctrl CLK PREPARE MIN change from 0x26 (38) -> 0x36 (54) */
 	{0x481f, 0x36},
+
+	/* MIPI ctrl CLK LPX P MIN change from 0x32 (50) -> 0x36 (54) */
 	{0x4825, 0x36},
-	{0x4837, 0x18},
+
+	/* R ISP CTRL2 0x20 -> 0x30, set sof_sel bit */
 	{0x5002, 0x30},
-	{0x5004, 0x04},//manual awb 1x
-	{0x5005, 0x00},
-	{0x5006, 0x04},
-	{0x5007, 0x00},
-	{0x5008, 0x04},
-	{0x5009, 0x00},
-	{0x5080, 0x00},
-	{0x5081, 0x41},
-	{0x5708, 0x01},  /* add for full size flip off and mirror off 2014/09/11 */
-	{0x3701, 0x64},  //add on 14/05/13
-	{0x3784, 0x0c},  //based OV2680_R1A_AM10.ovt add on 14/06/13
-	{0x5780, 0x3e},  //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
-	{0x5781, 0x0f},
-	{0x5782, 0x04},
-	{0x5783, 0x02},
-	{0x5784, 0x01},
-	{0x5785, 0x01},
-	{0x5786, 0x00},
-	{0x5787, 0x04},
+
+	/*
+	 * Window CONTROL 0x00 -> 0x01, enable manual window control,
+	 * this is necessary for full size flip and mirror support.
+	 */
+	{0x5708, 0x01},
+
+	/*
+	 * DPC CTRL0 0x14 -> 0x3e, set enable_tail, enable_3x3_cluster
+	 * and enable_general_tail bits based OV2680_R1A_AM10.ovt.
+	 */
+	{0x5780, 0x3e},
+
+	/* DPC MORE CONNECTION CASE THRE 0x0c (12) -> 0x02 (2) */
 	{0x5788, 0x02},
-	{0x5789, 0x00},
-	{0x578a, 0x01},
-	{0x578b, 0x02},
-	{0x578c, 0x03},
-	{0x578d, 0x03},
+
+	/* DPC GAIN LIST1 0x0f (15) -> 0x08 (8) */
 	{0x578e, 0x08},
+
+	/* DPC GAIN LIST2 0x3f (63) -> 0x0c (12) */
 	{0x578f, 0x0c},
-	{0x5790, 0x08},
-	{0x5791, 0x04},
+
+	/* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
 	{0x5792, 0x00},
-	{0x5793, 0x00},
-	{0x5794, 0x03}, //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
-	{0x0100, 0x00},	//stream off
+
 	{}
 };
 
-- 
2.40.1

