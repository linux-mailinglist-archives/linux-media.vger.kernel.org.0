Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69AEC1EA9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbfI3KG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:06:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41055 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfI3KGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:06:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id r2so6535991lfn.8;
        Mon, 30 Sep 2019 03:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2dEZ5VveeCRyXH+CovRffyZBiPh0RcTQuJCALACFyo=;
        b=USnb21lLGcxxi7sMxBUvqaT0mG2c6IZTH8m8YWUST4l8Y7Gch8wCwioZAFe/gCXF7R
         i4jX+8czmB4aVV5VezTeQrxCQOhmfnYqFFFswxOgxAdlAjrAovd+0VLKXa/JglLJh04d
         Tpn+J8sxMsu2ECN6fIp5fsT8kZv2F1ybjUSGUgTJGTY4WULtExhasUCra5cUZZRSSCOA
         llUZIpUngW7EVPJCc41gRA4nVnnCB+UpvMK25mJNrG+e9TL2NKe0Jkp3dAaVFYB8ziMa
         p/T1q8QHACKgn1YQFfeVNqV/EhAVks8P6PLW5QaJZmpFrNfNWZ6b/tHHhm6p5zR9aEn1
         vbYQ==
X-Gm-Message-State: APjAAAWoFp2q25xzMqJlZIwFHklD1k07mMBL941Jiy1eI4/kpNOxy76o
        uTyIkFuzsEaaXF8yklO0GyM=
X-Google-Smtp-Source: APXvYqzGJJ+ZwN/HRp10IThFkho3TT0C0+ycqJo+yYCne7gcqlwwyGtmdZaN1zlJqWsj5tH/1O60Gg==
X-Received: by 2002:a05:6512:75:: with SMTP id i21mr10789844lfo.95.1569838012486;
        Mon, 30 Sep 2019 03:06:52 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z72sm3091580ljb.98.2019.09.30.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:06:51 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 8/8] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
Date:   Mon, 30 Sep 2019 12:06:36 +0200
Message-Id: <20190930100636.18318-9-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930100636.18318-1-ribalda@kernel.org>
References: <20190930100636.18318-1-ribalda@kernel.org>
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
 drivers/media/i2c/imx214.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 159a3a604f0e..4d9879f60dfb 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -47,6 +47,7 @@ struct imx214 {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *unit_size;
 
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
@@ -948,6 +949,10 @@ static int imx214_probe(struct i2c_client *client)
 	static const s64 link_freq[] = {
 		IMX214_DEFAULT_LINK_FREQ,
 	};
+	static const struct v4l2_area unit_size = {
+		.width = 1120,
+		.height = 1120,
+	};
 	int ret;
 
 	ret = imx214_parse_fwnode(dev);
@@ -1029,6 +1034,10 @@ static int imx214_probe(struct i2c_client *client)
 					     V4L2_CID_EXPOSURE,
 					     0, 3184, 1, 0x0c70);
 
+	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
+				NULL,
+				V4L2_CID_UNIT_CELL_SIZE,
+				v4l2_ctrl_ptr_from_void((void *)&unit_size));
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
-- 
2.23.0

