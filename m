Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D2E6D31BB
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjDAPAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjDAPAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8D11D2C6
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6FuOeWEELOamaeerlnB3zyuCPRWdMphq+iPfxZumvpw=;
        b=C3Ss1supdQM427oCwzREYjWnpeJdMzyFRPzJ1HWARBahLeto2KOMHRVEMtloZc9acEuCdO
        7q15SSc1txanBIIGLR5+04e3fvXCcp73/qLgqiZ9LGdEfafsivF7cZQSMv7AbkgXW3vdOm
        EYYSffSDdNVUTzbvoi0925t6sY8H7Wg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-yMBJoRptP-ac6CMYwMETgw-1; Sat, 01 Apr 2023 10:59:46 -0400
X-MC-Unique: yMBJoRptP-ac6CMYwMETgw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AAC51C04184;
        Sat,  1 Apr 2023 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB739483EC1;
        Sat,  1 Apr 2023 14:59:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 05/28] media: atomisp: gc0310: Remove GC0310_TOK_*
Date:   Sat,  1 Apr 2023 16:59:03 +0200
Message-Id: <20230401145926.596216-6-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the ability to have special tokens in a reg-list,
GC0310_TOK_DELAY is not used and GC0310_TOK_TERM can be replaced
with ARRAY_SIZE, simplifying the code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 47 ++++++++-----------
 drivers/staging/media/atomisp/i2c/gc0310.h    |  9 +---
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 0d90683ed227..18aebeef6869 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -134,6 +134,7 @@ static int gc0310_write_reg(struct i2c_client *client, u16 data_length,
  * gc0310_write_reg_array - Initializes a list of GC0310 registers
  * @client: i2c driver client structure
  * @reglist: list of registers to be written
+ * @count: number of register, value pairs in the list
  *
  * This function initializes a list of registers. When consecutive addresses
  * are found in a row on the list, this function creates a buffer and sends
@@ -202,39 +203,28 @@ static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
 }
 
 static int gc0310_write_reg_array(struct i2c_client *client,
-				  const struct gc0310_reg *reglist)
+				  const struct gc0310_reg *reglist, int count)
 {
-	const struct gc0310_reg *next = reglist;
 	struct gc0310_write_ctrl ctrl;
-	int err;
+	int i, err;
 
 	ctrl.index = 0;
-	for (; next->type != GC0310_TOK_TERM; next++) {
-		switch (next->type & GC0310_TOK_MASK) {
-		case GC0310_TOK_DELAY:
+	for (i = 0; i < count; i++) {
+		/*
+		 * If next address is not consecutive, data needs to be
+		 * flushed before proceed.
+		 */
+		if (!__gc0310_write_reg_is_consecutive(client, &ctrl,
+						       &reglist[i])) {
 			err = __gc0310_flush_reg_array(client, &ctrl);
 			if (err)
 				return err;
-			msleep(next->val);
-			break;
-		default:
-			/*
-			 * If next address is not consecutive, data needs to be
-			 * flushed before proceed.
-			 */
-			if (!__gc0310_write_reg_is_consecutive(client, &ctrl,
-							       next)) {
-				err = __gc0310_flush_reg_array(client, &ctrl);
-				if (err)
-					return err;
-			}
-			err = __gc0310_buf_reg_array(client, &ctrl, next);
-			if (err) {
-				dev_err(&client->dev, "%s: write error, aborted\n",
-					__func__);
-				return err;
-			}
-			break;
+		}
+		err = __gc0310_buf_reg_array(client, &ctrl, &reglist[i]);
+		if (err) {
+			dev_err(&client->dev, "%s: write error, aborted\n",
+				__func__);
+			return err;
 		}
 	}
 
@@ -478,7 +468,8 @@ static int gc0310_init(struct v4l2_subdev *sd)
 	mutex_lock(&dev->input_lock);
 
 	/* set initial registers */
-	ret  = gc0310_write_reg_array(client, gc0310_reset_register);
+	ret = gc0310_write_reg_array(client, gc0310_reset_register,
+				     ARRAY_SIZE(gc0310_reset_register));
 
 	/* restore settings */
 	gc0310_res = gc0310_res_preview;
@@ -648,7 +639,7 @@ static int startup(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	ret = gc0310_write_reg_array(client, dev->res->regs);
+	ret = gc0310_write_reg_array(client, dev->res->regs, dev->res->reg_count);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 write register err.\n");
 		return ret;
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 6947bf53ff4f..ecca3b5e42bf 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -110,6 +110,7 @@
 struct gc0310_resolution {
 	u8 *desc;
 	const struct gc0310_reg *regs;
+	int reg_count;
 	int res;
 	int width;
 	int height;
@@ -139,9 +140,6 @@ struct gc0310_device {
 
 enum gc0310_tok_type {
 	GC0310_8BIT  = 0x0001,
-	GC0310_TOK_TERM   = 0xf000,	/* terminating token for reg list */
-	GC0310_TOK_DELAY  = 0xfe00,	/* delay token for reg list */
-	GC0310_TOK_MASK = 0xfff0
 };
 
 /**
@@ -330,8 +328,6 @@ static const struct gc0310_reg gc0310_reset_register[] = {
 	{GC0310_8BIT, 0x48, 0x03}, //sun mode
 	{GC0310_8BIT, 0x4f, 0x60}, //sun_clamp
 	{GC0310_8BIT, 0xfe, 0x00},
-
-	{GC0310_TOK_TERM, 0, 0},
 };
 
 static struct gc0310_reg const gc0310_VGA_30fps[] = {
@@ -356,8 +352,6 @@ static struct gc0310_reg const gc0310_VGA_30fps[] = {
 	{GC0310_8BIT, 0x13, 0x02},//05 //05 //LWC[15:8]
 
 	{GC0310_8BIT, 0xfe, 0x00},
-
-	{GC0310_TOK_TERM, 0, 0},
 };
 
 static struct gc0310_resolution gc0310_res_preview[] = {
@@ -374,6 +368,7 @@ static struct gc0310_resolution gc0310_res_preview[] = {
 #endif
 		.skip_frames = 2,
 		.regs = gc0310_VGA_30fps,
+		.reg_count = ARRAY_SIZE(gc0310_VGA_30fps),
 	},
 };
 
-- 
2.39.1

