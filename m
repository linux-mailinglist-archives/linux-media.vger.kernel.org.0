Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2035E677BD5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjAWMyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjAWMyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC2014E86
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JM2QMpouX2Qs3yGzI+1dO9W4pIj3n0fPIrzYHRgwCk4=;
        b=dsqwkv4UHBeHjjdCfve9mts16hLvh4o/QQcAudCO0Vbj2AKuxVw5gGznKlE38MQJbnrldb
        7ggoufwzJfW+4qow5YQnEhj/1yORcM0QVWWAXV1FupcZ2Oh3PjGbI52mYFkuPNy5evI8R6
        bXQ6a8PzUDEIrj6a2+/Aq3GCdcYOC0k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-HO78cWFRM6mVne3yvY3O4Q-1; Mon, 23 Jan 2023 07:53:32 -0500
X-MC-Unique: HO78cWFRM6mVne3yvY3O4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EE4F88B7A0;
        Mon, 23 Jan 2023 12:53:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CEAF2C15BA0;
        Mon, 23 Jan 2023 12:53:27 +0000 (UTC)
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
Subject: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Date:   Mon, 23 Jan 2023 13:51:36 +0100
Message-Id: <20230123125205.622152-29-hdegoede@redhat.com>
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

The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,

as well as various "atomisp" sensor drivers in drivers/staging, *all*
use register access helpers with the following function prototypes:

int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
                    unsigned int len, u32 *val);

int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
                     unsigned int len, u32 val);

To read/write registers on Omnivision OVxxxx image sensors wich expect
a 16 bit register address in big-endian format and which have 1-3 byte
wide registers, in big-endian format (for the higher width registers).

Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
versions of these register access helpers, so that this code duplication
can be removed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/media/ovxxxx_16bit_addr_reg_helpers.h | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 include/media/ovxxxx_16bit_addr_reg_helpers.h

diff --git a/include/media/ovxxxx_16bit_addr_reg_helpers.h b/include/media/ovxxxx_16bit_addr_reg_helpers.h
new file mode 100644
index 000000000000..e2ffee3d797a
--- /dev/null
+++ b/include/media/ovxxxx_16bit_addr_reg_helpers.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * I2C register access helpers for Omnivision OVxxxx image sensors which expect
+ * a 16 bit register address in big-endian format and which have 1-3 byte
+ * wide registers, in big-endian format (for the higher width registers).
+ *
+ * Based on the register helpers from drivers/media/i2c/ov2680.c which is:
+ * Copyright (C) 2018 Linaro Ltd
+ */
+#ifndef __OVXXXX_16BIT_ADDR_REG_HELPERS_H
+#define __OVXXXX_16BIT_ADDR_REG_HELPERS_H
+
+#include <asm/unaligned.h>
+#include <linux/dev_printk.h>
+#include <linux/i2c.h>
+
+static inline int ovxxxx_read_reg(struct i2c_client *client, u16 reg,
+				  unsigned int len, u32 *val)
+{
+	struct i2c_msg msgs[2];
+	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
+	u8 data_buf[4] = { 0, };
+	int ret;
+
+	if (len > 4)
+		return -EINVAL;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = ARRAY_SIZE(addr_buf);
+	msgs[0].buf = addr_buf;
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs)) {
+		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
+		return -EIO;
+	}
+
+	*val = get_unaligned_be32(data_buf);
+
+	return 0;
+}
+
+#define ovxxxx_read_reg8(s, r, v)	ovxxxx_read_reg(s, r, 1, v)
+#define ovxxxx_read_reg16(s, r, v)	ovxxxx_read_reg(s, r, 2, v)
+#define ovxxxx_read_reg24(s, r, v)	ovxxxx_read_reg(s, r, 3, v)
+
+static inline int ovxxxx_write_reg(struct i2c_client *client, u16 reg,
+				   unsigned int len, u32 val)
+{
+	u8 buf[6];
+	int ret;
+
+	if (len > 4)
+		return -EINVAL;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	ret = i2c_master_send(client, buf, len + 2);
+	if (ret != len + 2) {
+		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
+#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
+#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
+
+static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
+{
+	u32 readval;
+	int ret;
+
+	ret = ovxxxx_read_reg8(client, reg, &readval);
+	if (ret < 0)
+		return ret;
+
+	readval &= ~mask;
+	val &= mask;
+	val |= readval;
+
+	return ovxxxx_write_reg8(client, reg, val);
+}
+
+#endif
-- 
2.39.0

