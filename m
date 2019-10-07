Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01538CE09B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfJGLfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:24 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42497 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfJGLfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:19 -0400
Received: by mail-lf1-f65.google.com with SMTP id c195so9006000lfg.9;
        Mon, 07 Oct 2019 04:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmVOhqPV32NcE6/VgCf74tZc8Nj51x40T3jhqugB4as=;
        b=hZU5BIigDKrW3EbZX/srO/Xz3nHbo3ImZokKfx48aUdKpTGjL6CP+4ORzzsufI/N/i
         6Gec15jpJMUE2EppJ3+Ai0s//8aQfCzBupOtna58ZsrqmTFHnMIYG3tNieW4YcvPB6ix
         HFb87XSsqChGb5e2/rjy19V7d6LIHonqDFfWVQTzCInUh+3oX/22FI0PYVaaTNURBR7B
         dph2E30s+s2mMAFtKNAsNWZyNlOIYOOGqBaD7OVAZ7smvzOeqOtQq/WF8uro0V//i8WH
         /VHY9q1o6ZBwbLtRhdEavsXbRe80Z5d9eoxVRZp1aUJ1LgoW/SL3v2bEycRC1IegT96t
         Lvow==
X-Gm-Message-State: APjAAAXOcXzxndoE3oTLYLAG/aTXv+eiSUTNhWqX40CabJmOZCRfZTnT
        rkv5HwYFtk4fesDNTqyjFYo=
X-Google-Smtp-Source: APXvYqy9XxrNLq2MEaMQGnjZ56QD7dlDtRgKrb3Pgk4e1h2O/nZiZfcSvqfBKoTTk7Seo5suBxbXhg==
X-Received: by 2002:ac2:44a3:: with SMTP id c3mr15246729lfm.17.1570448116812;
        Mon, 07 Oct 2019 04:35:16 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:15 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v10 8/8] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
Date:   Mon,  7 Oct 2019 13:35:02 +0200
Message-Id: <20191007113502.11746-9-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007113502.11746-1-ribalda@kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
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
index 159a3a604f0e..adcaaa8c86d1 100644
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
+				v4l2_ctrl_ptr_create((void *)&unit_size));
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
-- 
2.23.0

