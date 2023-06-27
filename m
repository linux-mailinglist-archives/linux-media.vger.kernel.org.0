Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D9873FC31
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 14:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjF0Mwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 08:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjF0Mwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 08:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C372716
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687870287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5x7RUWpr0GPzpeNTqxWoGm3+Vd0s+kk7YYAFA7dc7Po=;
        b=FzhpY+yQNcgsY86fBHf5iPUQg+LrN+a+tUte+C75+JprMJZGf/IH2p4pCNmaOj/twwbFJZ
        MtIjIXPttHD/RqoBk8u1AZvNLGZ5VrZNacKZxoBNN+NaH6/km7K43QpGte13WpCEzECFxT
        UtT2bx9J4P1ZtS0JJQmQzsmuxgEnC8c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ZcXD5DiNMt2Tka9quiglPQ-1; Tue, 27 Jun 2023 08:51:20 -0400
X-MC-Unique: ZcXD5DiNMt2Tka9quiglPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0612B1C28D03;
        Tue, 27 Jun 2023 12:51:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 928C814682FA;
        Tue, 27 Jun 2023 12:51:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 5/5] media: Remove ov_16bit_addr_reg_helpers.h
Date:   Tue, 27 Jun 2023 14:51:08 +0200
Message-ID: <20230627125109.52354-6-hdegoede@redhat.com>
In-Reply-To: <20230627125109.52354-1-hdegoede@redhat.com>
References: <20230627125109.52354-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The helpers in this header are not used anywhere anymore,
they have been superseded by the new CCI register access helpers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/media/ov_16bit_addr_reg_helpers.h | 92 -----------------------
 1 file changed, 92 deletions(-)
 delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h

diff --git a/include/media/ov_16bit_addr_reg_helpers.h b/include/media/ov_16bit_addr_reg_helpers.h
deleted file mode 100644
index 1c60a50bd795..000000000000
--- a/include/media/ov_16bit_addr_reg_helpers.h
+++ /dev/null
@@ -1,92 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * I2C register access helpers for Omnivision OVxxxx image sensors which expect
- * a 16 bit register address in big-endian format and which have 1-3 byte
- * wide registers, in big-endian format (for the higher width registers).
- *
- * Based on the register helpers from drivers/media/i2c/ov2680.c which is:
- * Copyright (C) 2018 Linaro Ltd
- */
-#ifndef __OV_16BIT_ADDR_REG_HELPERS_H
-#define __OV_16BIT_ADDR_REG_HELPERS_H
-
-#include <asm/unaligned.h>
-#include <linux/dev_printk.h>
-#include <linux/i2c.h>
-
-static inline int ov_read_reg(struct i2c_client *client, u16 reg,
-				  unsigned int len, u32 *val)
-{
-	u8 addr_buf[2], data_buf[4] = { };
-	struct i2c_msg msgs[2];
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs)) {
-		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
-		return -EIO;
-	}
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-#define ov_read_reg8(s, r, v)	ov_read_reg(s, r, 1, v)
-#define ov_read_reg16(s, r, v)	ov_read_reg(s, r, 2, v)
-#define ov_read_reg24(s, r, v)	ov_read_reg(s, r, 3, v)
-
-static inline int ov_write_reg(struct i2c_client *client, u16 reg,
-				   unsigned int len, u32 val)
-{
-	u8 buf[6];
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	ret = i2c_master_send(client, buf, len + 2);
-	if (ret != len + 2) {
-		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-#define ov_write_reg8(s, r, v)	ov_write_reg(s, r, 1, v)
-#define ov_write_reg16(s, r, v)	ov_write_reg(s, r, 2, v)
-#define ov_write_reg24(s, r, v)	ov_write_reg(s, r, 3, v)
-
-static inline int ov_update_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
-{
-	u32 readval;
-	int ret;
-
-	ret = ov_read_reg8(client, reg, &readval);
-	if (ret < 0)
-		return ret;
-
-	val = (readval & ~mask) | (val & mask);
-
-	return ov_write_reg8(client, reg, val);
-}
-
-#endif
-- 
2.41.0

