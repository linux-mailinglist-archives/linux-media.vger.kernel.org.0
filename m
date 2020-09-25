Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0244E278230
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgIYIF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:05:57 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61918 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbgIYIF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601020243; x=1603612243;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+eokensvnxwkVbrpUiSFBQcafkBkMrnKdXT6ALQzPsg=;
        b=M5FmlZwyk10LIDjxl53sc8GUjoi+nc38rG2xkxWJHUaOLdmJnGvdbMcuhSiV/rWL
        yiW/0X6/Q4ynR3ItBg+5tF9d7+KN/L57z344/PpXbgD/jceFDbP598LXWOrUUeHb
        afY4dpN0l5WhWrTDjh0J6ZjaEqmFI1OWh/ZWrwZAG94=;
X-AuditID: c39127d2-253ff70000001c25-f3-5f6da153816b
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DC.A5.07205.351AD6F5; Fri, 25 Sep 2020 09:50:43 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092509504323-495329 ;
          Fri, 25 Sep 2020 09:50:43 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 2/5] media: mt9p031: Read back the real clock rate
Date:   Fri, 25 Sep 2020 09:50:26 +0200
Message-Id: <20200925075029.32181-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925075029.32181-1-s.riedmueller@phytec.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:43,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:43
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBSzd4YW68wdk5ShZ7j11gseicuITd
        4vKuOWwWPRu2slos2/SHyeLTlm9MDmwesztmsnpsWtXJ5jHvZKDHipX/mTw+b5ILYI3isklJ
        zcksSy3St0vgyri5+yhjwX++iilr/zI2MJ7i6WLk5JAQMJGYcu4LSxcjF4eQwDZGib7nb9lA
        EkIC1xgllvUqg9hsAkYSC6Y1MoHYIgIWEr2LpjOC2MwCXxkl1p3NBrGFBZwkbvZNBYuzCKhK
        rNi6HmwOr4CNxKVjF9kglslLzLz0nR3E5hSwlTj69jwTxC4biRc7/jJC1AtKnJz5BOwgCYEr
        jBLbWzewQjQLSZxefJYZYrG2xLKFr5knMArMQtIzC0lqASPTKkah3Mzk7NSizGy9gozKktRk
        vZTUTYzA4D08Uf3SDsa+OR6HGJk4GA8xSnAwK4nwHt+QEy/Em5JYWZValB9fVJqTWnyIUZqD
        RUmcdwNvSZiQQHpiSWp2ampBahFMlomDU6qBcbLBpc+RcpmPLivGfGnozf14U1inuVGs/6Df
        6y07njwXM5+87fHuuOK/t4PW382MbN+sJSuy4C/Di3y7/63ts2R0LRpczQ7K1S3lvXnp+eRT
        VocD5jFzHb1e5qV/ysmjfmFtzA62B4dXqfukT1mYM8Mk1+YRd8aTXzta2DUOOydJ5Ipa3OUS
        VmIpzkg01GIuKk4EAEcXl6dMAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The real and requested clock can differ and because it is used to
calculate PLL values, the real clock rate should be read.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 0002dd299ffa..ce192be4531f 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -255,6 +255,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
=20
 	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(&mt9p031->subdev);
 	struct mt9p031=5Fplatform=5Fdata *pdata =3D mt9p031->pdata;
+	unsigned long ext=5Ffreq;
 	int ret;
=20
 	mt9p031->clk =3D devm=5Fclk=5Fget(&client->dev, NULL);
@@ -265,13 +266,15 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p=
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
@@ -280,7 +283,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
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

