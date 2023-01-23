Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B0F677BE8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjAWMzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbjAWMzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB043A97
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ML8PPYOy7vUfhVzDFptP9dbDSTMZ35faMjijsVcT0Rk=;
        b=Ddw5XoTzgyHKZBsi67Ndl/UWD236PY1xW/s/Zhx/P0+tmzLXm2BaXBKj7EnIT2Mai9zPOL
        xdV2T+2O/XCWgzJpMONbk4rm/QXaK5Yy1Jcmnhcu7QsWRIp2fIPN7uFWcaoYfxGgbYbm/a
        +gFuEyf7+Msp/Rk5I/l/m4XTTAoTIkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-Bxho3K-bNnWEgMBMbQ9Zbw-1; Mon, 23 Jan 2023 07:54:22 -0500
X-MC-Unique: Bxho3K-bNnWEgMBMbQ9Zbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39B3E101AA78;
        Mon, 23 Jan 2023 12:54:22 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AE924C15BA0;
        Mon, 23 Jan 2023 12:54:19 +0000 (UTC)
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
Subject: [PATCH 44/57] media: atomisp: ov2680: Consistently indent define values
Date:   Mon, 23 Jan 2023 13:51:52 +0100
Message-Id: <20230123125205.622152-45-hdegoede@redhat.com>
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

Use the same indentation level for all #define values.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 5aa46f669715..f0641dd611c3 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -44,10 +44,10 @@
 /* If possible send 16 extra rows / lines to the ISP as padding */
 #define OV2680_END_MARGIN			16
 
-#define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
+#define OV2680_FOCAL_LENGTH_NUM			334	/*3.34mm*/
 
-#define OV2680_INTEGRATION_TIME_MARGIN	8
-#define OV2680_ID	0x2680
+#define OV2680_INTEGRATION_TIME_MARGIN		8
+#define OV2680_ID				0x2680
 
 /*
  * OV2680 System control registers
@@ -61,23 +61,23 @@
 #define OV2680_SC_CMMN_SCCB_ID			0x302B /* 0x300C*/
 #define OV2680_SC_CMMN_SUB_ID			0x302A /* process, version*/
 
-#define OV2680_GROUP_ACCESS							0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
+#define OV2680_GROUP_ACCESS			0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
 
 #define OV2680_REG_EXPOSURE_PK_HIGH		0x3500
 #define OV2680_REG_GAIN_PK			0x350a
 
-#define OV2680_HORIZONTAL_START_H					0x3800 /*Bit[11:8]*/
-#define OV2680_HORIZONTAL_START_L					0x3801 /*Bit[7:0]*/
-#define OV2680_VERTICAL_START_H						0x3802 /*Bit[11:8]*/
-#define OV2680_VERTICAL_START_L						0x3803 /*Bit[7:0]*/
-#define OV2680_HORIZONTAL_END_H						0x3804 /*Bit[11:8]*/
-#define OV2680_HORIZONTAL_END_L						0x3805 /*Bit[7:0]*/
-#define OV2680_VERTICAL_END_H						0x3806 /*Bit[11:8]*/
-#define OV2680_VERTICAL_END_L						0x3807 /*Bit[7:0]*/
-#define OV2680_HORIZONTAL_OUTPUT_SIZE_H				0x3808 /*Bit[3:0]*/
-#define OV2680_HORIZONTAL_OUTPUT_SIZE_L				0x3809 /*Bit[7:0]*/
-#define OV2680_VERTICAL_OUTPUT_SIZE_H				0x380a /*Bit[3:0]*/
-#define OV2680_VERTICAL_OUTPUT_SIZE_L				0x380b /*Bit[7:0]*/
+#define OV2680_HORIZONTAL_START_H		0x3800 /*Bit[11:8]*/
+#define OV2680_HORIZONTAL_START_L		0x3801 /*Bit[7:0]*/
+#define OV2680_VERTICAL_START_H			0x3802 /*Bit[11:8]*/
+#define OV2680_VERTICAL_START_L			0x3803 /*Bit[7:0]*/
+#define OV2680_HORIZONTAL_END_H			0x3804 /*Bit[11:8]*/
+#define OV2680_HORIZONTAL_END_L			0x3805 /*Bit[7:0]*/
+#define OV2680_VERTICAL_END_H			0x3806 /*Bit[11:8]*/
+#define OV2680_VERTICAL_END_L			0x3807 /*Bit[7:0]*/
+#define OV2680_HORIZONTAL_OUTPUT_SIZE_H		0x3808 /*Bit[3:0]*/
+#define OV2680_HORIZONTAL_OUTPUT_SIZE_L		0x3809 /*Bit[7:0]*/
+#define OV2680_VERTICAL_OUTPUT_SIZE_H		0x380a /*Bit[3:0]*/
+#define OV2680_VERTICAL_OUTPUT_SIZE_L		0x380b /*Bit[7:0]*/
 #define OV2680_HTS_H				0x380c
 #define OV2680_HTS_L				0x380d
 #define OV2680_VTS_H				0x380e
@@ -89,7 +89,7 @@
 #define OV2680_X_INC				0x3814
 #define OV2680_Y_INC				0x3815
 
-#define OV2680_FRAME_OFF_NUM						0x4202
+#define OV2680_FRAME_OFF_NUM			0x4202
 
 /*Flip/Mirror*/
 #define OV2680_REG_FORMAT1			0x3820
@@ -98,7 +98,7 @@
 #define OV2680_MWB_RED_GAIN_H			0x5004/*0x3400*/
 #define OV2680_MWB_GREEN_GAIN_H			0x5006/*0x3402*/
 #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
-#define OV2680_MWB_GAIN_MAX				0x0fff
+#define OV2680_MWB_GAIN_MAX			0x0fff
 
 #define OV2680_REG_ISP_CTRL00			0x5080
 
-- 
2.39.0

