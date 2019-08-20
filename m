Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125AC95B34
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbfHTJkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 05:40:35 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34715 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTJke (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 05:40:34 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so5573697edb.1;
        Tue, 20 Aug 2019 02:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4LOpR2+qDGG/nyT8CDQzwfIkNx8dPONyLIfkWrwXb0=;
        b=pAO8b0enPUDQRcQU6KJWM6w6AMVJewkc3FljenpBBsAm/fcc8fGxid94RcAa5blnTT
         7rwCL/6QHjw5aWg7eHp7tjl1GST1GH9m1lYHR6gw20imO3IG48dDe7NOl37b1ZCyBu5v
         NINgf4c6I+4c7IEbsQ072ot/D/YpHUIEiQWb1r1BzpWI0yeYxg858Yqy93knqkImbipb
         a6JyF4nVnEc2TjQkXcqEG2kdv4XqGXU1Jlj7s0T9DJw6VKB8VKQlpKgGE3wzGByu8knj
         VPqQZgkh9PkuLQ1XttC6Jpo5HYDNKPV+UKduMpj0kFJtntxzwAqn00456lBpBxPfDZ0C
         Yhvg==
X-Gm-Message-State: APjAAAV23+IUD+tsBwXO5NG1PPwTQEWVoWAcbofor3yYSfPJq6OfHxdH
        n/TTAqxkM/L6Uzm6Q/SF1fU=
X-Google-Smtp-Source: APXvYqyRecxQxMOPmI8NopXpVU38gqYahmiUiwm3vmKPM5fq7qf5ITTqib2gdF9RQeyAID+0r/k/CA==
X-Received: by 2002:a17:906:3604:: with SMTP id q4mr1518387ejb.102.1566294032808;
        Tue, 20 Aug 2019 02:40:32 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id j37sm3354259ede.23.2019.08.20.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 02:40:31 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2 3/3] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
Date:   Tue, 20 Aug 2019 11:40:27 +0200
Message-Id: <20190820094027.4144-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190820094027.4144-1-ribalda@kernel.org>
References: <20190820094027.4144-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the product brief, the unit cell size is 1120 nanometers^2.

https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 159a3a604f0e..cc0a013ba7da 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -47,6 +47,7 @@ struct imx214 {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *unit_size;
 
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
@@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
 	return ret;
 }
 
+static void unit_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
+		     union v4l2_ctrl_ptr ptr)
+{
+	ptr.p_area->width = 1120;
+	ptr.p_area->height = 1120;
+}
+
+static const struct v4l2_ctrl_type_ops unit_size_ops = {
+	.init = unit_size_init,
+};
+
+static struct v4l2_ctrl *new_unit_size_ctrl(struct v4l2_ctrl_handler *handler)
+{
+	static struct v4l2_ctrl_config ctrl = {
+		.id = V4L2_CID_UNIT_CELL_SIZE,
+		.type_ops = &unit_size_ops,
+	};
+
+	return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
+}
 static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1029,6 +1050,8 @@ static int imx214_probe(struct i2c_client *client)
 					     V4L2_CID_EXPOSURE,
 					     0, 3184, 1, 0x0c70);
 
+	imx214->unit_size = new_unit_size_ctrl(&imx214->ctrls);
+
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
-- 
2.23.0.rc1

