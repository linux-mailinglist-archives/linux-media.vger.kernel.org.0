Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A46D3BF76E
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhGHJWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:12 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46340 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhGHJWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735962; x=1628327962;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+H1mSGK8sEEJKzfOg24gWavE+r+Wd/b4Q6Yu1wUkNo4=;
        b=flXzpO3gH8FbuYWRpOMFiw/eABST1Va8PPMF24NUjjvjRdIIkgLPX6plv+qbJLt6
        wnulKJVMMwCJ+m83Sf6+VHaO49mHOokzqbDF+MvCUs3qzvrW3Z2qQFzRgZ9CDHtE
        0eW8wbv2tz91giR48CH/Jk9l/WbO1N6LDIX4wG9spwI=;
X-AuditID: c39127d2-1e4f970000001daf-81-60e6c31aa14e
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F7.B7.07599.A13C6E06; Thu,  8 Jul 2021 11:19:22 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192245-1113442 ;
          Thu, 8 Jul 2021 11:19:22 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] media: mt9p031: Make pixel clock polarity configurable by DT
Date:   Thu, 8 Jul 2021 11:19:18 +0200
Message-Id: <20210708091922.5508-3-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBS1fq8LMEg+nbTCzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgypjXPZmpYJNUxfxbf5gbGNeJdTFyckgImEg8mXOcsYuRi0NIYBujxNOrz1kg
        nGuMErtnLWUGqWITMJJYMK2RCSQhItDGKLHjSDMTSIJZ4DqjxIYfQEUcHMICIRKzb7KChFkE
        VCTeTr8CVsIrYC2x9fdXJoht8hIzL31nBynnFLCR6OpPAQkLAZUcm3WLFaJcUOLkzCdgN0gI
        XGGU6P/YzA7RKyRxevFZZoi12hLLFr5mnsAoMAtJzywkqQWMTKsYhXIzk7NTizKz9QoyKktS
        k/VSUjcxAoP38ET1SzsY++Z4HGJk4mA8xCjBwawkwms041mCEG9KYmVValF+fFFpTmrxIUZp
        DhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBsbY9/eVV/oXKQkmZ09Xv5vF9yLO/JTHdc7E
        Gy/V7//eG8u34GxTw9sDmf09yY/evm02jXz7r8nbZsoRw+niNSVvl9/UnZ9ybpXWvR31z/hC
        PgjNO7jl7eck5ZJ3TnM9W9+WH9xwLLj+3nHd/yqz9/blWNr0nTgS9PuRJFdt5M+SxTdnWi46
        4TRLiaU4I9FQi7moOBEAFmghakwCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christian Hemp <c.hemp@phytec.de>

Evaluate the desired pixel clock polarity from the device tree.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9p031.c | 20 +++++++++++++++++++-
 include/media/i2c/mt9p031.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 588f8eb95984..1f9e98be8066 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1187,6 +1187,7 @@ config VIDEO=5FMT9P031
 	select MEDIA=5FCONTROLLER
 	select VIDEO=5FV4L2=5FSUBDEV=5FAPI
 	select VIDEO=5FAPTINA=5FPLL
+	select V4L2=5FFWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt9p031 5 Mpixel camera.
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 9dea7c813852..ea90aff576ba 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -27,6 +27,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
=20
 #include "aptina-pll.h"
@@ -372,6 +373,14 @@ static int =5F=5Fmt9p031=5Fset=5Fpower(struct mt9p031 =
*mt9p031, bool on)
 		return ret;
 	}
=20
+	/* Configure the pixel clock polarity */
+	if (mt9p031->pdata && mt9p031->pdata->pixclk=5Fpol) {
+		ret =3D mt9p031=5Fwrite(client, MT9P031=5FPIXEL=5FCLOCK=5FCONTROL,
+				MT9P031=5FPIXEL=5FCLOCK=5FINVERT);
+		if (ret < 0)
+			return ret;
+	}
+
 	return v4l2=5Fctrl=5Fhandler=5Fsetup(&mt9p031->ctrls);
 }
=20
@@ -1014,8 +1023,11 @@ static const struct v4l2=5Fsubdev=5Finternal=5Fops m=
t9p031=5Fsubdev=5Finternal=5Fops =3D {
 static struct mt9p031=5Fplatform=5Fdata *
 mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
 {
-	struct mt9p031=5Fplatform=5Fdata *pdata;
+	struct mt9p031=5Fplatform=5Fdata *pdata =3D NULL;
 	struct device=5Fnode *np;
+	struct v4l2=5Ffwnode=5Fendpoint endpoint =3D {
+		.bus=5Ftype =3D V4L2=5FMBUS=5FPARALLEL
+	};
=20
 	if (!IS=5FENABLED(CONFIG=5FOF) || !client->dev.of=5Fnode)
 		return client->dev.platform=5Fdata;
@@ -1024,6 +1036,9 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
 	if (!np)
 		return NULL;
=20
+	if (v4l2=5Ffwnode=5Fendpoint=5Fparse(of=5Ffwnode=5Fhandle(np), &endpoint)=
 < 0)
+		goto done;
+
 	pdata =3D devm=5Fkzalloc(&client->dev, sizeof(*pdata), GFP=5FKERNEL);
 	if (!pdata)
 		goto done;
@@ -1031,6 +1046,9 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
 	of=5Fproperty=5Fread=5Fu32(np, "input-clock-frequency", &pdata->ext=5Ffre=
q);
 	of=5Fproperty=5Fread=5Fu32(np, "pixel-clock-frequency", &pdata->target=5F=
freq);
=20
+	pdata->pixclk=5Fpol =3D !!(endpoint.bus.parallel.flags &
+			       V4L2=5FMBUS=5FPCLK=5FSAMPLE=5FRISING);
+
 done:
 	of=5Fnode=5Fput(np);
 	return pdata;
diff --git a/include/media/i2c/mt9p031.h b/include/media/i2c/mt9p031.h
index 7c29c53aa988..f933cd0be8e5 100644
--- a/include/media/i2c/mt9p031.h
+++ b/include/media/i2c/mt9p031.h
@@ -10,6 +10,7 @@ struct v4l2=5Fsubdev;
  * @target=5Ffreq: Pixel clock frequency
  */
 struct mt9p031=5Fplatform=5Fdata {
+	unsigned int pixclk=5Fpol:1;
 	int ext=5Ffreq;
 	int target=5Ffreq;
 };
--=20
2.25.1

