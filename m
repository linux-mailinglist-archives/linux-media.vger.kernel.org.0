Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2839B92348
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfHSMRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:17:30 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44271 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHSMR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:17:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id a21so1450220edt.11;
        Mon, 19 Aug 2019 05:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FE4bYWxIaccoeXNLB30tqGs+7lXszx/GYxEDp2iGn3E=;
        b=Rhzjiln60dyXIljUbTnq34nbmC0pbIxMiixmZqyYb/3D4RIn44fUeY6Ax5Jul2mDPc
         f5zSUGEm0c4QkSKqvO9GehM1xCocF+hD89W8AUWWSQ0899ZJ+3Mrhx6VnFhKU51XZS7F
         WZoCqDjmosISNlJhR/FHrmggC5HNslBnC/i27r5hKMY+2Wglh9X6Lq8GnkC+t8NgIwr0
         fpoiLS9JCt1yg4FxJjpR7705zwIBg53WDwcbh+6pEwfpLJexQ1DlNfYcw53ipD76wrTy
         t1Jg88kQQLMi+8Xl38/n3fcs32JJQB9SQyW9iKt+9Q8Jz0tfGgniOlkbKvn7kJqQ6bd7
         On4Q==
X-Gm-Message-State: APjAAAX3hNyRgq+hhJ0I5Oscal/n9lSE3rGsxnbdiT6kI7j7NNvCQp/i
        ykNgUYhnI3pIBb9NJ+bAw9A=
X-Google-Smtp-Source: APXvYqyl7hoy839fM1/yFk/TjaVwWLeYmdbCgvpCwlgGLS8LH/9pKQz50H8LQyyW6hvpjdyQT+/35g==
X-Received: by 2002:aa7:d606:: with SMTP id c6mr24579348edr.185.1566217047383;
        Mon, 19 Aug 2019 05:17:27 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b31sm2753639edf.33.2019.08.19.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 05:17:26 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH 3/3] media: imx214: Add new control with V4L2_CID_PIXEL_SIZE
Date:   Mon, 19 Aug 2019 14:17:20 +0200
Message-Id: <20190819121720.31345-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819121720.31345-1-ribalda@kernel.org>
References: <20190819121720.31345-1-ribalda@kernel.org>
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
index 159a3a604f0e..b2f6bd2d8d7d 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -47,6 +47,7 @@ struct imx214 {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *pixel_size;
 
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
@@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
 	return ret;
 }
 
+static void pixel_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
+		     union v4l2_ctrl_ptr ptr)
+{
+	ptr.p_pixel_size->width = 1120;
+	ptr.p_pixel_size->height = 1120;
+}
+
+static const struct v4l2_ctrl_type_ops pixel_size_ops = {
+	.init = pixel_size_init,
+};
+
+static struct v4l2_ctrl *new_pixel_size_ctrl(struct v4l2_ctrl_handler *handler)
+{
+	static struct v4l2_ctrl_config ctrl = {
+		.id = V4L2_CID_PIXEL_SIZE,
+		.type_ops = &pixel_size_ops,
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
 
+	imx214->pixel_size = new_pixel_size_ctrl(&imx214->ctrls);
+
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
-- 
2.23.0.rc1

