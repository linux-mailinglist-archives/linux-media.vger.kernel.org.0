Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2994D5642
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbfJMMv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:51:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46763 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbfJMMvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:51:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id t8so9918764lfc.13;
        Sun, 13 Oct 2019 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xCq5J+OfyTULb+8V1WcTAauQxnh+VYppr0SjYzFpH8=;
        b=oswxuqjBzvBckACKPIK1IwNha2bWQzHzGSDOY3Z29T+jHXdjLuN0nWeaAHPh1VO6TL
         P7lOkvMo4Ci1kb57FogbNNsrXXYEsUgWoZXxuJqVDL4iFr22zEApS5isYaTNgJAaBjAU
         bkMy2gUwtAcbkUnn04Zb8k6y2LPwAqTxIoa4ZPjevty6ait+ZmzAOClX0J5dmOvEhl0L
         gBRwn+U7RYQt1voGewYQG/zP14zxYO2qFVOBRwnbcs90HbmpMAGOileth0Qpygnhl5QL
         VDVOdVnoVPQnPXdXrpPYHIBSyaAv/CDZP0tT4LgRg2tEg1/ySDTr5ruwXETox752RGTS
         kQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xCq5J+OfyTULb+8V1WcTAauQxnh+VYppr0SjYzFpH8=;
        b=U9zykbAeirtD2Xvrn+hnc2NmRAtN26MKf47mjBYCk4P7glXNcxxYwiiNhgKohU0bl+
         c9ACoqSsNtxmpAfV0X+vHMaN9Xr1Ivi1wjfx4AZJKUETVwpguEf3B/hnCgawqZxhS2nG
         k5kc8W0s1PT33iTTIbX9p7UH49ylTLUH9RRX2XtCjM172gSLLQPCYIXDzS0O4W1lrDcf
         9XHRtUe/VM/uwyiRWNDgyTgV0D1jNpq26bAcfRZS+stK6ZqI/H9YccVJ7f131Hm07YQK
         NIw6TVRdUgOCc+l0ngKLmNFcsdBaDk2d/qX6zw9tOP15xPiN69lYQZ3Rc/VQMq3w1rqE
         8iSA==
X-Gm-Message-State: APjAAAVtPcZoFKx/x8GtBroUAU8HM0f9afZcaALuFWutPFwhZWvRf/VP
        rkIMpQtJ/Y8N74za4DXqUcw=
X-Google-Smtp-Source: APXvYqyl4sKhCoSBzphYXAukd2baCSImv4MOnEM7J5VEaqwqvUSGrU6E5atg3VoIY0m6ERDptQqbmA==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr8769271lfm.25.1570971111538;
        Sun, 13 Oct 2019 05:51:51 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m18sm3327243lfb.73.2019.10.13.05.51.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 05:51:50 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 6/6] media: ov6650: Fix arbitrary selection of master clock rate
Date:   Sun, 13 Oct 2019 14:50:50 +0200
Message-Id: <20191013125050.4153-7-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013125050.4153-1-jmkrzyszt@gmail.com>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A hardcoded 12 MHz master clock frequency has been assumed since
conversion of the driver from soc_camera sensor to a standalone V4L2
subdevice by commit 23a52386fabe ("media: ov6650: convert to standalone
v4l2 subdevice").  Fix it.

Define a static table of supported master clock rates (fix misnamed
symbol while being at it), then use v4l2_clk_get/set_rate() to obtain
a clock rate matching one of those supported.  On success, apply
respective master clock hardware divisor provided by the matching
element of the table.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 64 ++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index f4723c0b5c70..13fd7c4699b2 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -124,7 +124,7 @@
 
 #define DEF_AECH		0x4D
 
-#define CLKRC_6MHz		0x00
+#define CLKRC_8MHz		0x00
 #define CLKRC_12MHz		0x40
 #define CLKRC_16MHz		0x80
 #define CLKRC_24MHz		0xc0
@@ -201,6 +201,29 @@ struct ov6650 {
 	u32 code;
 };
 
+struct ov6650_xclk {
+	unsigned long	rate;
+	u8		clkrc;
+};
+
+static const struct ov6650_xclk ov6650_xclk[] = {
+{
+	.rate	= 8000000,
+	.clkrc	= CLKRC_8MHz,
+},
+{
+	.rate	= 12000000,
+	.clkrc	= CLKRC_12MHz,
+},
+{
+	.rate	= 16000000,
+	.clkrc	= CLKRC_16MHz,
+},
+{
+	.rate	= 24000000,
+	.clkrc	= CLKRC_24MHz,
+},
+};
 
 static u32 ov6650_codes[] = {
 	MEDIA_BUS_FMT_YUYV8_2X8,
@@ -774,7 +797,7 @@ static int ov6650_reset(struct i2c_client *client)
 }
 
 /* program default register values */
-static int ov6650_prog_dflt(struct i2c_client *client)
+static int ov6650_prog_dflt(struct i2c_client *client, u8 clkrc)
 {
 	int ret;
 
@@ -782,7 +805,7 @@ static int ov6650_prog_dflt(struct i2c_client *client)
 
 	ret = ov6650_reg_write(client, REG_COMA, 0);	/* ~COMA_RESET */
 	if (!ret)
-		ret = ov6650_reg_write(client, REG_CLKRC, CLKRC_12MHz);
+		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
 	if (!ret)
 		ret = ov6650_reg_rmw(client, REG_COMB, 0, COMB_BAND_FILTER);
 
@@ -793,8 +816,10 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	u8		pidh, pidl, midh, midl;
-	int		ret;
+	const struct ov6650_xclk *xclk;
+	unsigned long rate;
+	u8 pidh, pidl, midh, midl;
+	int i, ret;
 
 	priv->clk = v4l2_clk_get(&client->dev, NULL);
 	if (IS_ERR(priv->clk)) {
@@ -803,6 +828,33 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 		return ret;
 	}
 
+	rate = v4l2_clk_get_rate(priv->clk);
+	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
+		if (rate != ov6650_xclk[i].rate)
+			continue;
+
+		xclk = &ov6650_xclk[i];
+		dev_info(&client->dev, "using host default clock rate %lukHz\n",
+			 rate / 1000);
+		break;
+	}
+	for (i = 0; !xclk && i < ARRAY_SIZE(ov6650_xclk); i++) {
+		ret = v4l2_clk_set_rate(priv->clk, ov6650_xclk[i].rate);
+		if (ret || v4l2_clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
+			continue;
+
+		xclk = &ov6650_xclk[i];
+		dev_info(&client->dev, "using negotiated clock rate %lukHz\n",
+			 xclk->rate / 1000);
+		break;
+	}
+	if (!xclk) {
+		dev_err(&client->dev, "unable to get supported clock rate\n");
+		if (!ret)
+			ret = -EINVAL;
+		goto eclkput;
+	}
+
 	ret = ov6650_s_power(sd, 1);
 	if (ret < 0)
 		goto eclkput;
@@ -836,7 +888,7 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 
 	ret = ov6650_reset(client);
 	if (!ret)
-		ret = ov6650_prog_dflt(client);
+		ret = ov6650_prog_dflt(client, xclk->clkrc);
 	if (!ret) {
 		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
 
-- 
2.21.0

