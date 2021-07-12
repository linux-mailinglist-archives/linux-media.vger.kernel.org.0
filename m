Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B812A3C59AB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350965AbhGLJH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 05:07:26 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45270 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357150AbhGLI60 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 04:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626080136; x=1628672136;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BkdkwmiGogTIJ3tL5zily69sBf7WMKTObrHPm+hw5mQ=;
        b=ihMgNSLG9jEAz57qEto6IGNq2y1zKIKRJuvZ01CacfQ0F+lEGzJnlmj/pIggivs8
        Pq9aFjOsLjsXGj5Mr5FGWcgrBWS+jPZ2NOLYvQmaMPep2sHrFU4VwCE59acraOei
        LcLlKW/cAYHHYQ7QxNd8PQ3+he5qAbYs10wtaOVpnro=;
X-AuditID: c39127d2-1d8f870000001daf-1b-60ec03881221
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 7A.8D.07599.8830CE06; Mon, 12 Jul 2021 10:55:36 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071210553595-1131631 ;
          Mon, 12 Jul 2021 10:55:35 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] media: mt9p031: Read back the real clock rate
Date:   Mon, 12 Jul 2021 10:55:30 +0200
Message-Id: <20210712085535.11907-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712085535.11907-1-s.riedmueller@phytec.de>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:36,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:36
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsWyRoCBS7eD+U2CweHZYhbzj5xjtdh77AKL
        RefEJewWl3fNYbPo2bCV1WLZpj9MFq17j7BbfNryjcmBw2N2x0xWj02rOtk85p0M9Fix8j+T
        x+dNcgGsUVw2Kak5mWWpRfp2CVwZk5o+sxcc4q/4OfE6UwNjB28XIyeHhICJxOX3p9i7GLk4
        hAS2MUrsnfaQCcK5zigxuWUxG0gVm4CRxIJpjWAJEYE2RokdR5rBHGaBp4wSD249ZAepEhZw
        leh4M40FxGYRUJXYfuw4I4jNK2AjMfnZakaIffISMy99B6rn4OAUsJXY88MSJCwEVHJ9/gYW
        iHJBiZMzn7BAlF9hlLhxMRzCFpI4vfgsM4jNLKAtsWzha+YJjAKzkLTMQpJawMi0ilEoNzM5
        O7UoM1uvIKOyJDVZLyV1EyMwpA9PVL+0g7FvjschRiYOxkOMEhzMSiK833pfJQjxpiRWVqUW
        5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLglGpgXOcllqC1ur1g5+HizYdS
        OWrX//k5ZckZO9aYho/OWon8DdP3cB1YuGv9rjMRiuyvuid8ueBz/vXcO9vuanlsvMvsXjvz
        +j+N2XH3D9TqrH4Qee1V7l/zvtZzJdrq0/dLxez/rsDZG/hqacnD7fY+VwwKgsofzma8bHnL
        YCGPtPyss69OZ14XrVNiKc5INNRiLipOBAAr/HxJVwIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The real and requested clock can differ and because it is used to
calculate PLL values, the real clock rate should be read.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9p031.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 6eb88ef99783..9dea7c813852 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -229,6 +229,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
=20
 	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(&mt9p031->subdev);
 	struct mt9p031=5Fplatform=5Fdata *pdata =3D mt9p031->pdata;
+	unsigned long ext=5Ffreq;
 	int ret;
=20
 	mt9p031->clk =3D devm=5Fclk=5Fget(&client->dev, NULL);
@@ -239,13 +240,15 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p=
031)
 	if (ret < 0)
 		return ret;
=20
+	ext=5Ffreq =3D clk=5Fget=5Frate(mt9p031->clk);
+
 	/* If the external clock frequency is out of bounds for the PLL use the
 	 * pixel clock divider only and disable the PLL.
 	 */
-	if (pdata->ext=5Ffreq > limits.ext=5Fclock=5Fmax) {
+	if (ext=5Ffreq > limits.ext=5Fclock=5Fmax) {
 		unsigned int div;
=20
-		div =3D DIV=5FROUND=5FUP(pdata->ext=5Ffreq, pdata->target=5Ffreq);
+		div =3D DIV=5FROUND=5FUP(ext=5Ffreq, pdata->target=5Ffreq);
 		div =3D roundup=5Fpow=5Fof=5Ftwo(div) / 2;
=20
 		mt9p031->clk=5Fdiv =3D min=5Ft(unsigned int, div, 64);
@@ -254,7 +257,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
 		return 0;
 	}
=20
-	mt9p031->pll.ext=5Fclock =3D pdata->ext=5Ffreq;
+	mt9p031->pll.ext=5Fclock =3D ext=5Ffreq;
 	mt9p031->pll.pix=5Fclock =3D pdata->target=5Ffreq;
 	mt9p031->use=5Fpll =3D true;
=20
--=20
2.25.1

