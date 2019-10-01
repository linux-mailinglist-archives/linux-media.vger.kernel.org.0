Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F08CC3274
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732346AbfJALYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:41 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41806 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732303AbfJALYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:41 -0400
Received: by mail-lf1-f67.google.com with SMTP id r2so9544554lfn.8;
        Tue, 01 Oct 2019 04:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmVOhqPV32NcE6/VgCf74tZc8Nj51x40T3jhqugB4as=;
        b=tcXxZ7mUE0A1PytGsA9lB1vgzJCr3yKYBOgGOYburmc6WX2ASQN8SskUB4XTwouldG
         ETsvsX2HNWCF0hpC2H3lBdaE/JfKIrwCETE+ROCICn6sgNvtW0yDklo5ClQq9JEwdXX9
         puAYycFyVa2lnqNIW8lMzDQsp7i2A3YaYdL2n9DBfPgeQK3DPbscJiET3RsjULYcNrjh
         g1bCb0h/I6wf5nIcFWqGk5ACnvIGVQvq7dSlO/dS1LY+2X/cRC3iaGai2HVzJoayg4wL
         xPrMiG7QIUwiGcHdr6sQth7YhJd73iQfKPwgnstaIQ/UGayBsLFxJuW0LlQYu3vgXrKi
         +L9Q==
X-Gm-Message-State: APjAAAVuKKdEcbApmQG5GqSGNg1j0Kq/FTj8T3oN1bPjBxTs+kJC2sEu
        HvQHvWYuey6jKB+jhYKLiRM=
X-Google-Smtp-Source: APXvYqxuRI13v85jwQ2c1377ih1pB77hgw7oauFXbhh4t6dcq/+Ubf2Bz5eZgLNkvg/mSDtvqXzdGw==
X-Received: by 2002:a05:6512:251:: with SMTP id b17mr15426465lfo.35.1569929078781;
        Tue, 01 Oct 2019 04:24:38 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:37 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v9 8/8] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
Date:   Tue,  1 Oct 2019 13:24:21 +0200
Message-Id: <20191001112421.2778-9-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001112421.2778-1-ribalda@kernel.org>
References: <20191001112421.2778-1-ribalda@kernel.org>
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

