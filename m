Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E86D5645
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfJMMvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:51:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37463 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbfJMMvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:51:50 -0400
Received: by mail-lf1-f66.google.com with SMTP id w67so9959056lff.4;
        Sun, 13 Oct 2019 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jqZhIjSnGaQkCto65LI2ltagzMepKonmREX9kN29OzI=;
        b=MCEH99lMhnFs50GY5tA5FlYHtFeRCvWmbyyz8e8MusYGDwyijf4jpLoH2zKXE/RZlB
         myQPdSDfg82aOhlsyHiPBbuFSOyAm8f5hL0P5oK+r2cNnw90t1xANBt5e6XqUzRjX5FY
         fm7oO8VT17rsiLtHamC1LfFV+MSKh6nPGlOewZLdmBQVLMMoJ0/7hCpabCqdm7AiPYCO
         xj7R6mx7GqjGQhkGX7sMz6tsddvgeUVhOYR2W20NZ4fgGUksu9KKzRpNDuo/DBh0cdcg
         3jP6K48q/ZqESAkFzvDBRE6Z5jfNphoLNtg2/9cWwfExB9ZAgOgkLcEWX+h4f1SSlb/W
         K/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqZhIjSnGaQkCto65LI2ltagzMepKonmREX9kN29OzI=;
        b=toLEpWnbVNHln7HfAMUmaMAHIEz4SxYAzv91rT28xX+C/5n8HX6fuiozuZSGFkH1vF
         YjSaqthZG88Ros1pLx010p2dyfmCfJR43UnF8xooGchD4JD7serdgmnYIfhqO6Ginabz
         MkRv05AdIDxqu4DHCVopYvq3LMiAxVnLrWNVYBV+UyGnNpE0uhAyDcHK/NKYJ/lsRg4G
         R9XqctywWCrqEIkXqPTn0tof9cwu0JpTqYWpDQvZGlNNN4alk3jtkDpBZs2MbS1Wyzea
         3BQ/J7qVd6xVYn2UZTb9sG4DzQhatg7vtX+3Hvbw2rydG8zrofU0Rx1JZzVqr3NL4f9j
         rqaA==
X-Gm-Message-State: APjAAAWDWKzSUWPikNEiAH3/e/dA4vnwkdL3KA19QqZSrZuRIlrn9Vhr
        IOlloB4tgi0ChcRCOGb+vx8=
X-Google-Smtp-Source: APXvYqyxwDLf3f0ZqrDsWwDPE6BLC8VpoJvSBbJ1n3RMjNQ8rcK8iCDnxU1Sz/yqn1JVoxx2POf1ZA==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr15393804lff.32.1570971107842;
        Sun, 13 Oct 2019 05:51:47 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m18sm3327243lfb.73.2019.10.13.05.51.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 05:51:47 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 3/6] media: ov6650: Simplify clock divisor calculation
Date:   Sun, 13 Oct 2019 14:50:47 +0200
Message-Id: <20191013125050.4153-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013125050.4153-1-jmkrzyszt@gmail.com>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As appears from an analysis of to_clkrc() helper code after its
pclk_limit argument has been dropped, its result no longer depends on
another argument - pclk_max.  Moreover, assuming that a constant value
of FRAME_RATE_MAX is always used as a denominator of the only
significant argument left - a struct v4l2_fract, the result in fact
depends only on the numerator value of that argument.  As a further
consequence, it no longer makes sense to recalculate frame intervals by
converting them forth and back with a GET_CLKRC_DIV(to_clkrc(tpf))
construct.

Drop use of GET_CLKRC_DIV() on results of to_clkrc() where possible -
use the frame interval value directly.  Furthermore, replace the
to_clkrc() helper function with a simple macro and update its users to
always use FRAME_RATE_MAX as frame interval denominator and pass only
its numerator as an argument.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index a50244401491..61ddd4ea4c26 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -545,18 +545,7 @@ static bool is_unscaled_ok(int width, int height, struct v4l2_rect *rect)
 	return width > rect->width >> 1 || height > rect->height >> 1;
 }
 
-static u8 to_clkrc(struct v4l2_fract *timeperframe, unsigned long pclk_max)
-{
-	unsigned long pclk;
-
-	if (timeperframe->numerator && timeperframe->denominator)
-		pclk = pclk_max * timeperframe->denominator /
-				(FRAME_RATE_MAX * timeperframe->numerator);
-	else
-		pclk = pclk_max;
-
-	return (pclk_max - 1) / pclk;
-}
+#define to_clkrc(div)	((div) - 1)
 
 /* set the format we will capture in */
 static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
@@ -650,7 +639,7 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 	mclk = 12000000;
 	dev_dbg(&client->dev, "using 12MHz input clock\n");
 
-	clkrc |= to_clkrc(&priv->tpf, priv->pclk_max);
+	clkrc |= to_clkrc(priv->tpf.numerator);
 
 	pclk = priv->pclk_max / GET_CLKRC_DIV(clkrc);
 	dev_dbg(&client->dev, "pixel clock divider: %ld.%ld\n",
@@ -749,9 +738,7 @@ static int ov6650_g_frame_interval(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
 
-	ival->interval.numerator = GET_CLKRC_DIV(to_clkrc(&priv->tpf,
-							  priv->pclk_max));
-	ival->interval.denominator = FRAME_RATE_MAX;
+	ival->interval = priv->tpf;
 
 	dev_dbg(&client->dev, "Frame interval: %u/%u s\n",
 		ival->interval.numerator, ival->interval.denominator);
@@ -766,7 +753,6 @@ static int ov6650_s_frame_interval(struct v4l2_subdev *sd,
 	struct ov6650 *priv = to_ov6650(client);
 	struct v4l2_fract *tpf = &ival->interval;
 	int div, ret;
-	u8 clkrc;
 
 	if (tpf->numerator == 0 || tpf->denominator == 0)
 		div = 1;  /* Reset to full rate */
@@ -778,14 +764,9 @@ static int ov6650_s_frame_interval(struct v4l2_subdev *sd,
 	else if (div > GET_CLKRC_DIV(CLKRC_DIV_MASK))
 		div = GET_CLKRC_DIV(CLKRC_DIV_MASK);
 
-	tpf->numerator = div;
-	tpf->denominator = FRAME_RATE_MAX;
-
-	clkrc = to_clkrc(tpf, priv->pclk_max);
-
-	ret = ov6650_reg_rmw(client, REG_CLKRC, clkrc, CLKRC_DIV_MASK);
+	ret = ov6650_reg_rmw(client, REG_CLKRC, to_clkrc(div), CLKRC_DIV_MASK);
 	if (!ret) {
-		priv->tpf.numerator = GET_CLKRC_DIV(clkrc);
+		priv->tpf.numerator = div;
 		priv->tpf.denominator = FRAME_RATE_MAX;
 
 		*tpf = priv->tpf;
-- 
2.21.0

