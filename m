Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268C83BF771
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhGHJWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:13 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46322 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhGHJWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735962; x=1628327962;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BkdkwmiGogTIJ3tL5zily69sBf7WMKTObrHPm+hw5mQ=;
        b=rsDn7W+Eolv4Mz0drg9zYCDSK7HUlrrO+iTCKHckYaIkNoYOg5rdfnT3eo95CWok
        Y6eUtyWJgMIVVUS8J5g+nXoZebtGzYzz1Rylc9REWvkJCqATm4h4Br3+fkqs427W
        9vOMls1dPyzVEciW6dherIOt4MOpfxzqkMdGbs0O1a4=;
X-AuditID: c39127d2-1d8f870000001daf-7d-60e6c31a43c9
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 37.B7.07599.A13C6E06; Thu,  8 Jul 2021 11:19:22 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192218-1113441 ;
          Thu, 8 Jul 2021 11:19:22 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] media: mt9p031: Read back the real clock rate
Date:   Thu, 8 Jul 2021 11:19:17 +0200
Message-Id: <20210708091922.5508-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091922.5508-1-s.riedmueller@phytec.de>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:22,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:22
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWyRoCBS1fq8LMEg56HShbzj5xjtdh77AKL
        RefEJewWl3fNYbPo2bCV1WLZpj9MFq17j7BbfNryjcmBw2N2x0xWj02rOtk85p0M9Fix8j+T
        x+dNcgGsUVw2Kak5mWWpRfp2CVwZk5o+sxcc4q/4OfE6UwNjB28XIyeHhICJxPm7N1i7GLk4
        hAS2MUr83LecCcK5xiixcOU+VpAqNgEjiQXTGsESIgJtjBI7jjSDOcwCTxklHtx6yA5SJSzg
        KvHl/VmwDhYBFYnjh5axgNi8AtYSc6ZcYoLYJy8x89J3oHoODk4BG4mu/hSQsBBQybFZt1gh
        ygUlTs58wgIyX0LgCqNE/8dmdoheIYnTi88yg9jMAtoSyxa+Zp7AKDALSc8sJKkFjEyrGIVy
        M5OzU4sys/UKMipLUpP1UlI3MQKD+vBE9Us7GPvmeBxiZOJgPMQowcGsJMJrNONZghBvSmJl
        VWpRfnxRaU5q8SFGaQ4WJXHeDbwlYUIC6YklqdmpqQWpRTBZJg5OqQbG8OJzb1ZnRTEd2iwW
        W3cpNJNvzXLPpU8X7vzwuVJ5Tu12xnn22QrCsY/WLvtkVlO+h2XVhJsnJy/8xRuy+GPolHv5
        Dk61V4Q9DtfaXQmOkHlVMLfT3bZrh9qb/0e0ZgkfceOUOLUny2gbO69f6X3XjgvS/y8vLp6m
        tHHj17231wrPuzC7NdVKQomlOCPRUIu5qDgRANAzIPpYAgAA
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

