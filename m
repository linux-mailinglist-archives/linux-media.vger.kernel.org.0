Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A543B9EA7
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbhGBKB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:01:58 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55518 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhGBKB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219963; x=1627811963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Qr5s1r6Ub8Vj1bNnO6u1Muq3sTquNmzAkAvrU3k4hJM=;
        b=Jl1XrQxUKM1r42lBlih67vIRFud53pGzcHLj/yGoYx4HuQaQWOLY1U9Qj6EhT2M7
        tGvdSzkkPCt9onl87t/4LmhJq9zNborc+mAsZHBSTf5fHXh/gxqqOEsH856QNEoL
        s28HbJAmM88l6kRc2xSO/q6dSaq43d2I4WtnYT0feOs=;
X-AuditID: c39127d2-a9fbd70000001c5e-74-60dee37b6717
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A3.01.07262.B73EED06; Fri,  2 Jul 2021 11:59:23 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592287-1081046 ;
          Fri, 2 Jul 2021 11:59:22 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 1/6] media: mt9p031: Read back the real clock rate
Date:   Fri, 2 Jul 2021 11:59:17 +0200
Message-Id: <20210702095922.118614-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702095922.118614-1-s.riedmueller@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsWyRoCBS7f68b0Eg98LBSzmHznHarH32AUW
        i86JS9gtLu+aw2bRs2Erq8WyTX+YLFr3HmG3+LTlG5MDh8fsjpmsHptWdbJ5zDsZ6LFi5X8m
        j8+b5AJYo7hsUlJzMstSi/TtErgyZi/4zlxwiL9i58WPjA2MHbxdjJwcEgImEv/uXmLvYuTi
        EBLYxihx7/hjKOcao8TiT+1MIFVsAkYSC6Y1gtkiAlESP8/3sIDYzAITmSQa92uA2MICrhKv
        D55hBLFZBFQkNn3+AlbDK2Arce33I3aIbfISMy99B7M5Bewkztw8ClYjBFRztP8XK0S9oMTJ
        mU9YQI6QELjCKDHj0jImiGYhidOLzzJDLNaWWLbwNfMERoFZSHpmIUktYGRaxSiUm5mcnVqU
        ma1XkFFZkpqsl5K6iREY0ocnql/awdg3x+MQIxMH4yFGCQ5mJRHe0Hn3EoR4UxIrq1KL8uOL
        SnNSiw8xSnOwKInzbuAtCRMSSE8sSc1OTS1ILYLJMnFwSjUw1vq5awtdqG+bd3R6/Kf7C2da
        nZ5aVih3Weahj9mel5wLPkeKc3s+7amq5e/nlox567+2NOWcjFydyNn+l/MYUkS2Ve1fvj0j
        Si37fJ3fdQnBR80WR4K9rkte+svLdDeA4dX5l3N4fuU7sTDdW+Ke9P3hRrlCe23euk1m3H1b
        FF0rls8te7dQiaU4I9FQi7moOBEAw5y0f1cCAAA=
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
index 77567341ec98..3eaaa8d44523 100644
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

