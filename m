Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67CCD5649
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbfJMMwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:52:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43117 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfJMMvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:51:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so13949444ljj.10;
        Sun, 13 Oct 2019 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5xwppzxLfD235nBWm/2lMus5/8Z/i+yMzV4wj9LsE4=;
        b=VV1QMnkZm/jSR163JgojCsqmbsoTL0r+24dV0TYzmuH85a/7PzgVyXdS+WGMo8S3rI
         zxl9zUy2vFcWgYSoX8j7nk51PSSUGZ4f1xM4FTP+OuBKtu3Rc8yGcGbhX0nK+LITod+m
         I4hy8cBdfQSLF4lqpq7mMHeekhc7b+WHRmWNJJGq9o4BmioWQFCWjOYQ07n47wEdHD9n
         NULXj71kKHVwCw6jmURC8ooqBH6dOgUCOgNVL1hWugH1McsLd14owdWwgfE89cNZ5ZUK
         FnW3KE2IUyXI3b4oIB1xEE+G8oeWluzjMMreMAeLObhytzgtFbcYw99/GKcK9652h7Ft
         3ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5xwppzxLfD235nBWm/2lMus5/8Z/i+yMzV4wj9LsE4=;
        b=gnCgX57tJKSmiZhxlZc3vIuzxmOb5mh5/WbLXMC/BwKogFLF/TVr2CVk8COTpnE4Uh
         bI4Dbf7k/ZI4W70q3DAIGYz4cCJyVpo3tEf2FQL8RKq++D5SIe0LtQtkJagYP1rVZbBN
         mMNHqc3ybnQ7W9gB+cdGuH7H2swh98Juqu33bK/Koxkah5B5rOlQzYLHjpDzP0I07Pl8
         lD973zRvxbdK4W3J2l/q1pro4OJfr26XMERONMVA1HYoC2UQjQqjUakwV5MSPyW/N0tW
         ZxQMEt0Z9E4FPKTPL+FuCDXx9cLAAtkWWu4vb3Y8aD9s0Qnt69AW6z1ja5pbHHvEUXGs
         FITA==
X-Gm-Message-State: APjAAAVjq5ZsUJr0nla56XdIVrEyBqUmRBjzngVzZq99olQRg4zyZZIG
        AOwSIb/Ccot/ibaV3o0fvxQ=
X-Google-Smtp-Source: APXvYqzXMz8SnBPIqokeFzd8nC9MNXRRuEHd2i6zONnC9nXuFWMjoh43nA50NaOh/HPRUev76wvT2A==
X-Received: by 2002:a2e:207:: with SMTP id 7mr15412581ljc.248.1570971109117;
        Sun, 13 Oct 2019 05:51:49 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m18sm3327243lfb.73.2019.10.13.05.51.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 05:51:48 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 4/6] media: ov6650: Don't reapply pixel clock divisor on format change
Date:   Sun, 13 Oct 2019 14:50:48 +0200
Message-Id: <20191013125050.4153-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013125050.4153-1-jmkrzyszt@gmail.com>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As calculation of pixel clock hardware divisor no longer depends on
mbus format specific maximum pixel clock, there is no need to reapply
the divisor on format change.  Drop related code from ov6650_s_fmt()
helper.

Since a master clock hardware divisor, so far applied only together
with the pixel clock divisor in a single operation, will no longer be
applied from ov6650_s_fmt(), apply it, still using a hardcoded value
for now, from  ov6650_prog_dflt() helper so hardware is still
initialised correctly on device probe.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 61ddd4ea4c26..e95ea132ef06 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -564,8 +564,7 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		.r.height = mf->height << half_scale,
 	};
 	u32 code = mf->code;
-	unsigned long mclk, pclk;
-	u8 coma_set = 0, coma_mask = 0, coml_set, coml_mask, clkrc;
+	u8 coma_set = 0, coma_mask = 0, coml_set, coml_mask;
 	int ret;
 
 	/* select color matrix configuration for given color encoding */
@@ -635,21 +634,9 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		coma_mask |= COMA_QCIF;
 	}
 
-	clkrc = CLKRC_12MHz;
-	mclk = 12000000;
-	dev_dbg(&client->dev, "using 12MHz input clock\n");
-
-	clkrc |= to_clkrc(priv->tpf.numerator);
-
-	pclk = priv->pclk_max / GET_CLKRC_DIV(clkrc);
-	dev_dbg(&client->dev, "pixel clock divider: %ld.%ld\n",
-			mclk / pclk, 10 * mclk % pclk / pclk);
-
 	ret = ov6650_set_selection(sd, NULL, &sel);
 	if (!ret)
 		ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
-	if (!ret)
-		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
 	if (!ret) {
 		priv->half_scale = half_scale;
 
@@ -798,6 +785,8 @@ static int ov6650_prog_dflt(struct i2c_client *client)
 	dev_dbg(&client->dev, "initializing\n");
 
 	ret = ov6650_reg_write(client, REG_COMA, 0);	/* ~COMA_RESET */
+	if (!ret)
+		ret = ov6650_reg_write(client, REG_CLKRC, CLKRC_12MHz);
 	if (!ret)
 		ret = ov6650_reg_rmw(client, REG_COMB, 0, COMB_BAND_FILTER);
 
-- 
2.21.0

