Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290B6A7464
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfICUNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43646 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfICUNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:11 -0400
Received: by mail-lf1-f65.google.com with SMTP id q27so13911906lfo.10;
        Tue, 03 Sep 2019 13:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IcqZJ12KOyIHhnyKrSM4vVin/1ptnU9c0uX7Y+r6P0=;
        b=ZHE34QUZHjaD8xN46LMKJTKDy6CuT/CxEHdme6rddkEvoEX1IWFhCEq6z9vql7y+Pe
         VobQYvOv276vE5pLiIjQC24s8Rl41VpQnagPaLjKeZei+kjCnGfnswJS2zdDWuTX2XB/
         Y4r3iFIk6UhbpnDtzcVVnH48qppykNexh2RYPZBHGglHkGMQa2gbP1GIuRcC7WbwII+2
         zX0ihy58T/wdXb50OoDfuT7UyNQrgSS8w4iybBb91l/UCWZ7nqj/nLgnGtfYU5kt/OnS
         itsU5ZBU6rO3nrJiNQqkZI0oPMCHUT2T2XVFBxtiABF5g99REHt8fXyAGKmbjktxV3S7
         mYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IcqZJ12KOyIHhnyKrSM4vVin/1ptnU9c0uX7Y+r6P0=;
        b=AXwUe/dqol3wYH6Mrvga+7Bl8/G9Fe8uRUmDfxURGy4bLATg96mckK/dR/e6e6Hib8
         sWwO0BfruBgQAgK3Q0XnpKTAMGuWj88o0RW3Pr49ynPsjxVO/1L9oXtRE8f2DRxj2tlh
         v/CwIZemSr7wYXZD2GmRIneE1xF1ZrrFnZzL240WJ1fBx/himxYSMuhvm6oZfZB1XR0B
         c2YGT3AT4cpwrxiZT4r1dK57cl+/NNs7JcNZn9gObQabZ9g1Mr2jhYItUUf+5Tu9RK4L
         0CCno+I7Uj23PTcztcYVa1XPfB4NgEYLFOP9Tz87BHsg8ursvVDMGcjL3Jsx7kX9R8RC
         GNtA==
X-Gm-Message-State: APjAAAWAQ/S3NgsPWe+Vv2SXsEyJXe3wyd0ADtwXxn/5XQd47XRaJvU/
        +PySD5Xbdf8kQssNDH2NSWw=
X-Google-Smtp-Source: APXvYqzPMsICAJ50n2zYxbzUO9NsodqXdGQQ/0/IR2iZHwaySiVATABd1nminonJFouKbx6Byd/X/A==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr7585162lfi.82.1567541588869;
        Tue, 03 Sep 2019 13:13:08 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:08 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 8/9] media: ov6650: Fix stored frame format not in sync with hardware
Date:   Tue,  3 Sep 2019 22:11:43 +0200
Message-Id: <20190903201144.13219-9-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver stores frame format settings supposed to be in line with
hardware state in a device private structure.  Since the driver initial
submission, those settings are updated before they are actually applied
on hardware.  If an error occurs on device update, the stored settings
my not reflect hardware state anymore and consecutive calls to
.get_fmt() may return incorrect information.  That in turn may affect
ability of a bridge device to use correct DMA transfer settings if such
incorrect informmation on active frame format returned by .get_fmt() is
used.

Assuming a failed device update means its state hasn't changed, update
frame format related settings stored in the device private structure
only after they are successfully applied so the stored values always
reflect hardware state as closely as possible.

Fixes: 2f6e2404799a ("[media] SoC Camera: add driver for OV6650 sensor")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 4fd8ac8e3994..126a662be301 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -627,7 +627,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		dev_err(&client->dev, "Pixel format not handled: 0x%x\n", code);
 		return -EINVAL;
 	}
-	priv->code = code;
 
 	if (code == MEDIA_BUS_FMT_Y8_1X8 ||
 			code == MEDIA_BUS_FMT_SBGGR8_1X8) {
@@ -648,7 +647,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		dev_dbg(&client->dev, "max resolution: CIF\n");
 		coma_mask |= COMA_QCIF;
 	}
-	priv->half_scale = half_scale;
 
 	clkrc = CLKRC_12MHz;
 	mclk = 12000000;
@@ -666,8 +664,13 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
 	if (!ret)
 		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
-	if (!ret)
+	if (!ret) {
+		priv->half_scale = half_scale;
+
 		ret = ov6650_reg_rmw(client, REG_COML, coml_set, coml_mask);
+	}
+	if (!ret)
+		priv->code = code;
 
 	return ret;
 }
-- 
2.21.0

