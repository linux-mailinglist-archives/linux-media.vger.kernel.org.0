Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5828C13AB0
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfEDOkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:52 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42490 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:52 -0400
Received: by mail-qt1-f194.google.com with SMTP id p20so10016169qtc.9;
        Sat, 04 May 2019 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rWFbpbNrzQ1y2PIHtjx8Zisl8LLVI1Mr9vzfhnCkPAA=;
        b=PFwFQHDtTkN/931PrOlDp8Qf7U/eH5jEzr7s9xkqngFKNPbDEQLmTPlkwLv7Euplb9
         lnVo5i6kjPvYLGclNKNTvmFGH0h+k+pw2f0DZ8xTN9Mjc432Pi2mqeldIOORZTkKgTjN
         xsR5xfhVeKwN0Fz3VbnA7Qb7PUuhKjHbtDdWr/3lnylrofWH6VGBKRcQoPyZIEGMS1EX
         sbQRJo1Xq9LQcyiz1vdhBOp+gbMHgOs0XegCmtDGbnYDdM+IFNgkYo0pykZoYLweR7p+
         oemL0tdWEvbnocaa1SBFGOr1NCdhM2KWKbxDQh2xPUkzVKMfSne4wKdRXF66Uy9VCbCL
         RR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rWFbpbNrzQ1y2PIHtjx8Zisl8LLVI1Mr9vzfhnCkPAA=;
        b=nc2CmqRi48a56KICI9qfFPMSs94jlIVTeaxzxgQYQEaKOv8jMYF2OsTqCewChzPNdp
         BejCKaQALhdSjjSI5b54Vy7Ul68AKX0zSiiqS/e0rUh8qVMjt6knzSe5r3rvPJIQLddw
         zW++xaxUEjjcfnWnOgnHOXeQj+FMd8twbqLiqqrBv94YRjwdP0RKwobyEWYVuDCfc4jY
         DccGeh3OVV+3Z4x0igErdyACTddQzQfJe1ht2FKGaAid67Gn/kebLfbmChmJ0QzGtzJX
         cMBe+qwXm9d/AfA9FFKARKPTfB3lnN+6WqIV5BwPYuz+HosdRbTPngEXrTwZTJuq6Y7V
         0PpQ==
X-Gm-Message-State: APjAAAXRShCS0iMPZSfVamJJaQCcfaedUzU7VrULQ7jS5Yf+KnV18wKP
        psjtFOQhE8/1J6dZUfLPJII=
X-Google-Smtp-Source: APXvYqzcyNISvmNu+UTcTQzmt9RYZyQvCh8y5tuZzCyBAqzkVddR7lL6SUZp1zaOukNUbWFiYIITJQ==
X-Received: by 2002:a0c:b05b:: with SMTP id l27mr12899413qvc.162.1556980851372;
        Sat, 04 May 2019 07:40:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:50 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 7/8] media: imx7-media-csi: Check the return value from clk_prepare_enable()
Date:   Sat,  4 May 2019 11:40:26 -0300
Message-Id: <20190504144027.31920-7-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clk_prepare_enable() may fail, so we should better check its return value
and propagate it in the case of error.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index d1ecdcfc792e..dcc6027fe32b 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -390,17 +390,23 @@ static void imx7_csi_error_recovery(struct imx7_csi *csi)
 	imx7_csi_hw_enable(csi);
 }
 
-static void imx7_csi_init(struct imx7_csi *csi)
+static int imx7_csi_init(struct imx7_csi *csi)
 {
+	int ret;
+
 	if (csi->is_init)
-		return;
+		return 0;
 
-	clk_prepare_enable(csi->mclk);
+	ret = clk_prepare_enable(csi->mclk);
+	if (ret < 0)
+		return ret;
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
 
 	csi->is_init = true;
+
+	return 0;
 }
 
 static void imx7_csi_deinit(struct imx7_csi *csi)
@@ -513,7 +519,7 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 
 init:
 	if (csi->sink || csi->src_sd)
-		imx7_csi_init(csi);
+		ret = imx7_csi_init(csi);
 	else
 		imx7_csi_deinit(csi);
 
-- 
2.17.1

