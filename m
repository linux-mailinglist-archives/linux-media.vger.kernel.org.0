Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5CF447466
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235947AbhKGRTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31285 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235942AbhKGRTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=INP/po4e8nraFLBHME9OkzJGog791g7efMD+eWiNZt8=;
        b=W6bsk/zZD1A32mYdq3ue8DhO8OoD9MnTXHNWQUPJyink902BzK1i1UyvgF7A45rbNqqzpt
        6FW+Ix1NgHtt++yU6K4y2IDQ089J7wtPkG2pzm/7Y8aDEgVSjlnoVDkVPtA91jqyehnsQk
        7Ost3iT/7LDvSQ+7VJbgTJ+7x9YzHvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rzmznxzNMHqKZF5TqC87sw-1; Sun, 07 Nov 2021 12:16:10 -0500
X-MC-Unique: rzmznxzNMHqKZF5TqC87sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8E218042A8;
        Sun,  7 Nov 2021 17:16:08 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0C4367843;
        Sun,  7 Nov 2021 17:16:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 07/11] media: atomisp-ov2680: Make ov2680_read_reg() support 24 bit registers
Date:   Sun,  7 Nov 2021 18:15:45 +0100
Message-Id: <20211107171549.267583-8-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some ov2680 registers like exposure are 24 bit,
ov2680_read_reg() already mostly supports this, we just
need to change the return type from u16 to u32.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 5b192218ba91..7e49f4eb0410 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -48,7 +48,7 @@ static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
 
 /* i2c read/write stuff */
 static int ov2680_read_reg(struct i2c_client *client,
-			   int len, u16 reg, u16 *val)
+			   int len, u16 reg, u32 *val)
 {
 	struct i2c_msg msgs[2];
 	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
@@ -168,7 +168,7 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
 {
 	struct atomisp_sensor_mode_data *buf = &info->data;
 	unsigned int pix_clk_freq_hz;
-	u16 reg_val;
+	u32 reg_val;
 	int ret;
 
 	dev_dbg(&client->dev,  "++++ov2680_get_intg_factor\n");
@@ -410,7 +410,7 @@ static long ov2680_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u16 reg_v, reg_v2;
+	u32 reg_v, reg_v2;
 	int ret;
 
 	/* get exposure */
@@ -433,7 +433,7 @@ static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 	if (ret)
 		goto err;
 
-	*value = reg_v + (((u32)reg_v2 << 16));
+	*value = reg_v + (reg_v2 << 16);
 err:
 	return ret;
 }
@@ -443,7 +443,7 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	struct camera_mipi_info *ov2680_info = NULL;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
-	u16 val;
+	u32 val;
 	u8 index;
 
 	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
@@ -473,7 +473,7 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 	struct camera_mipi_info *ov2680_info = NULL;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
-	u16 val;
+	u32 val;
 	u8 index;
 
 	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
@@ -933,7 +933,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 static int ov2680_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u16 high, low;
+	u32 high, low;
 	int ret;
 	u16 id;
 	u8 revision;
-- 
2.31.1

