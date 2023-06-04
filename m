Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CB872187E
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbjFDQPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbjFDQPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3EEE3
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hkx4khUA3TAswnfOzkexCn5x0yKXES9pzSO9c//gVB4=;
        b=Mewh4z2o7XMjv1YMwjJMG4oSunj2eX5iVr2mI6bKLSPi7Mn4EP56F13wCjsmuPgTt78bdJ
        z4mBci8NCJQCh+xqOJ+vik9/OX7WYmmOJjPiz+TS9h5NuazRQ1Uv3jOrXA7Uu3a7EfUMJW
        eCv1ALYnJwiVLOM6O8ur4WaVRJCuNUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-clLuQE4gNam10gl0i85Uiw-1; Sun, 04 Jun 2023 12:14:24 -0400
X-MC-Unique: clLuQE4gNam10gl0i85Uiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C2C638035BF;
        Sun,  4 Jun 2023 16:14:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA293492B00;
        Sun,  4 Jun 2023 16:14:21 +0000 (UTC)
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
Subject: [PATCH 4/5] media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
Date:   Sun,  4 Jun 2023 18:14:05 +0200
Message-Id: <20230604161406.69369-5-hdegoede@redhat.com>
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

The data sheets say the registers at offset 0x3700 - 0x373f are
"sensor control" registers rename the unknown variable in
ov2680_set_mode() to sensor_ctrl_0a and add
a OV2680_REG_SENSOR_CTRL_0A define.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++++----
 drivers/staging/media/atomisp/i2c/ov2680.h         | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index dcc06c725544..7a5ad8ccd81f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -245,22 +245,22 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 static int ov2680_set_mode(struct ov2680_dev *sensor)
 {
 	struct i2c_client *client = sensor->client;
-	u8 unknown, inc, fmt1, fmt2;
+	u8 sensor_ctrl_0a, inc, fmt1, fmt2;
 	int ret;
 
 	if (sensor->mode.binning) {
-		unknown = 0x23;
+		sensor_ctrl_0a = 0x23;
 		inc = 0x31;
 		fmt1 = 0xc2;
 		fmt2 = 0x01;
 	} else {
-		unknown = 0x21;
+		sensor_ctrl_0a = 0x21;
 		inc = 0x11;
 		fmt1 = 0xc0;
 		fmt2 = 0x00;
 	}
 
-	ret = ov_write_reg8(client, 0x370a, unknown);
+	ret = ov_write_reg8(client, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 6a71de55600b..d032af245674 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -72,6 +72,8 @@
 #define OV2680_REG_EXPOSURE_PK_HIGH		0x3500
 #define OV2680_REG_GAIN_PK			0x350a
 
+#define OV2680_REG_SENSOR_CTRL_0A		0x370a
+
 #define OV2680_HORIZONTAL_START_H		0x3800 /* Bit[11:8] */
 #define OV2680_HORIZONTAL_START_L		0x3801 /* Bit[7:0]  */
 #define OV2680_VERTICAL_START_H			0x3802 /* Bit[11:8] */
-- 
2.40.1

