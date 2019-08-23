Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E259AFBE
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394786AbfHWMht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:37:49 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43530 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394773AbfHWMhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id h13so13220923edq.10;
        Fri, 23 Aug 2019 05:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4LOpR2+qDGG/nyT8CDQzwfIkNx8dPONyLIfkWrwXb0=;
        b=VZolX3HOVaZtnd8rm0lG/PVVSirbjHDNSa+wtQmYvbCMhiDFdOPWFMUvs4xoocHBGA
         3ZPHMhtwa486dNQnSdJXlFlgll8OT61AjH0eJ8DijNF8OiUUxaYpnaZwAem1j7gEN7Ca
         waRk7eCYp7Ea03g4lQcVgeym0fEj6XFs3MFV8j3nf0Tt5EFfPRia33ErPqpv+2tMZuk5
         +BBu34377+LwiQI785oMCN8ZLgAvwZ0a3VkXunvwjfEHh9JkZ4Tg0FYeFBljxT4CZ9y9
         Ei15HgWYz1lnts8ODveP1WSJ62cb0uymD9felMikweZSe9zRblzWYxSssElKgXZQKaKW
         iKHQ==
X-Gm-Message-State: APjAAAUT9O1MFt0IzFgBGmsiJQ+s78sr0r4X3zPDuLmSTvZQkupaXa3F
        3/2KhLDeWjWc/ENV1b+e4qs=
X-Google-Smtp-Source: APXvYqyQcg0tQkqTfgr4NABXJXIB9EaBGO/TqQaLu/B1uyEWgDHoR+PkcD+hocVgEafBcowrUGQBSg==
X-Received: by 2002:a17:906:161b:: with SMTP id m27mr3925225ejd.203.1566563865377;
        Fri, 23 Aug 2019 05:37:45 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:44 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 4/7] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
Date:   Fri, 23 Aug 2019 14:37:34 +0200
Message-Id: <20190823123737.7774-4-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
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

