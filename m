Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E4D6D31BC
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjDAPAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjDAPAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCB11CBAE
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=US/2IeK285PZlUA2Tl98A9Oi89YZl6NRbds6ETiMeIg=;
        b=ZageukPlFnEPIoqba38FMN0eFoMGw3HbsV9lH0MyT73XvGZQlpKlx1s5YhYhG98lh7IQQX
        +ozrAT4/krE/ILqNCAo4qbkrcxETZZgDY4qFKVIfWZe9UM3GrhAAUZ6Gi05nsvB6ZjSiOR
        d8xhAWXIMmTZkXcenruoJeS7CvptkZM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-0XVtv_RjM9ytluGJndfBjQ-1; Sat, 01 Apr 2023 10:59:47 -0400
X-MC-Unique: 0XVtv_RjM9ytluGJndfBjQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F65C3815F61;
        Sat,  1 Apr 2023 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F45C400F59;
        Sat,  1 Apr 2023 14:59:45 +0000 (UTC)
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
Subject: [PATCH 06/28] media: atomisp: gc0310: Simplify gc0310_write_reg_array()
Date:   Sat,  1 Apr 2023 16:59:04 +0200
Message-Id: <20230401145926.596216-7-hdegoede@redhat.com>
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

Remove the complex optimization to send multiple registers in
one i2c-transfer. None of the other sensor drivers are doing this
and the reg-lists are only used once at stream-start time, so
this does not need to be highly optimized.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 87 +------------------
 drivers/staging/media/atomisp/i2c/gc0310.h    | 12 ---
 2 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 18aebeef6869..5974dd5bd95e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -135,100 +135,19 @@ static int gc0310_write_reg(struct i2c_client *client, u16 data_length,
  * @client: i2c driver client structure
  * @reglist: list of registers to be written
  * @count: number of register, value pairs in the list
- *
- * This function initializes a list of registers. When consecutive addresses
- * are found in a row on the list, this function creates a buffer and sends
- * consecutive data in a single i2c_transfer().
- *
- * __gc0310_flush_reg_array, __gc0310_buf_reg_array() and
- * __gc0310_write_reg_is_consecutive() are internal functions to
- * gc0310_write_reg_array_fast() and should be not used anywhere else.
- *
  */
-
-static int __gc0310_flush_reg_array(struct i2c_client *client,
-				    struct gc0310_write_ctrl *ctrl)
-{
-	u16 size;
-
-	if (ctrl->index == 0)
-		return 0;
-
-	size = sizeof(u8) + ctrl->index; /* 8-bit address + data */
-	ctrl->buffer.addr = (u8)(ctrl->buffer.addr);
-	ctrl->index = 0;
-
-	return gc0310_i2c_write(client, size, (u8 *)&ctrl->buffer);
-}
-
-static int __gc0310_buf_reg_array(struct i2c_client *client,
-				  struct gc0310_write_ctrl *ctrl,
-				  const struct gc0310_reg *next)
-{
-	int size;
-
-	switch (next->type) {
-	case GC0310_8BIT:
-		size = 1;
-		ctrl->buffer.data[ctrl->index] = (u8)next->val;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* When first item is added, we need to store its starting address */
-	if (ctrl->index == 0)
-		ctrl->buffer.addr = next->reg;
-
-	ctrl->index += size;
-
-	/*
-	 * Buffer cannot guarantee free space for u32? Better flush it to avoid
-	 * possible lack of memory for next item.
-	 */
-	if (ctrl->index + sizeof(u8) >= GC0310_MAX_WRITE_BUF_SIZE)
-		return __gc0310_flush_reg_array(client, ctrl);
-
-	return 0;
-}
-
-static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
-					     struct gc0310_write_ctrl *ctrl,
-					     const struct gc0310_reg *next)
-{
-	if (ctrl->index == 0)
-		return 1;
-
-	return ctrl->buffer.addr + ctrl->index == next->reg;
-}
-
 static int gc0310_write_reg_array(struct i2c_client *client,
 				  const struct gc0310_reg *reglist, int count)
 {
-	struct gc0310_write_ctrl ctrl;
 	int i, err;
 
-	ctrl.index = 0;
 	for (i = 0; i < count; i++) {
-		/*
-		 * If next address is not consecutive, data needs to be
-		 * flushed before proceed.
-		 */
-		if (!__gc0310_write_reg_is_consecutive(client, &ctrl,
-						       &reglist[i])) {
-			err = __gc0310_flush_reg_array(client, &ctrl);
-			if (err)
-				return err;
-		}
-		err = __gc0310_buf_reg_array(client, &ctrl, &reglist[i]);
-		if (err) {
-			dev_err(&client->dev, "%s: write error, aborted\n",
-				__func__);
+		err = gc0310_write_reg(client, GC0310_8BIT, reglist[i].reg, reglist[i].val);
+		if (err)
 			return err;
-		}
 	}
 
-	return __gc0310_flush_reg_array(client, &ctrl);
+	return 0;
 }
 
 static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index ecca3b5e42bf..a2734934fc6a 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -158,18 +158,6 @@ struct gc0310_reg {
 
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
-#define GC0310_MAX_WRITE_BUF_SIZE	30
-
-struct gc0310_write_buffer {
-	u8 addr;
-	u8 data[GC0310_MAX_WRITE_BUF_SIZE];
-};
-
-struct gc0310_write_ctrl {
-	int index;
-	struct gc0310_write_buffer buffer;
-};
-
 /*
  * Register settings for various resolution
  */
-- 
2.39.1

