Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50BF3D5458
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhGZGyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:53 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbhGZGyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284918; x=1629876918;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BkdkwmiGogTIJ3tL5zily69sBf7WMKTObrHPm+hw5mQ=;
        b=WDZlCYzCecUKZykIb5d2M9bgGVyPwJHAdPPyqjIxwf5bKuKOJlKh2mY1kGEfuWmR
        S9+RjHhJ9DxxTOW3C9wRviqSX0vshV6K26tkZhcfb4fHXDgQYxxF8m7eUh1mCqi3
        wL30dwNtCRFTiC03FxjStaC5SnyDmQMtMZ1UDD8zPTw=;
X-AuditID: c39127d2-1d8f870000001daf-a2-60fe65b6366f
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 93.82.07599.6B56EF06; Mon, 26 Jul 2021 09:35:18 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351843-1233314 ;
          Mon, 26 Jul 2021 09:35:18 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] media: mt9p031: Read back the real clock rate
Date:   Mon, 26 Jul 2021 09:35:13 +0200
Message-Id: <20210726073518.2167398-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726073518.2167398-1-s.riedmueller@phytec.de>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:18,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:18
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWyRoCBS3db6r8Eg8O7jSzmHznHarH32AUW
        i86JS9gtLu+aw2bRs2Erq8WyTX+YLFr3HmG3+LTlG5MDh8fsjpmsHptWdbJ5zDsZ6LFi5X8m
        j8+b5AJYo7hsUlJzMstSi/TtErgyJjV9Zi84xF/xc+J1pgbGDt4uRk4OCQETiZ/Xu1m7GLk4
        hAS2MUr8OLiCCcK5wChx8PAiZpAqNgEjiQXTGsESIgJtjBI7jjSDOcwCTxklHtx6yA5SJSzg
        KvFp0lvGLkYODhYBVYkZs6RBwrwCdhKb/95hglgnLzHz0newck4Be4lbT9+D2UJANa2dG9kh
        6gUlTs58wgIyX0LgCqPEyvYTLBDNQhKnF58Fu4hZQFti2cLXzBMYBWYh6ZmFJLWAkWkVo1Bu
        ZnJ2alFmtl5BRmVJarJeSuomRmBQH56ofmkHY98cj0OMTByMhxglOJiVRHgdVvxOEOJNSays
        Si3Kjy8qzUktPsQozcGiJM67gbckTEggPbEkNTs1tSC1CCbLxMEp1cBYf9L/Zopd8Il992rv
        zXosai/Qdyg4+Y+10rkDnEv2FE+qME28mvHu7Ta19Uun9rXOUl3z1j9MJ+SHoW8yl2eakmtB
        8LWVATdX6AbX2r65tKx7Y5qPsdiTfvcblj9WuDqXPYt5ftTGofXJJ4ZGC3Xr0uh9/Z8luXhf
        fSysZEtbsemH9jEx729KLMUZiYZazEXFiQCE3ongWAIAAA==
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

