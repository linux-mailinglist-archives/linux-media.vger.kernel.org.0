Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47E227E72D
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbgI3Kv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:51:59 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbgI3Kv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601463114; x=1604055114;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8Ne0Cho+Zmb2A9HZaNjT+Nce0O3XMfwK2n40tLuNhBo=;
        b=T/ZxTko4U9TO4DTF93T7JZ6IDG6lcDrC+hAZXTZ0kCg+859hv3NDR+oV6EhsLk+k
        LpaIiY7OPHNwSBY+TXQmM/XYA1sH58JPieHrD10gHOzRioH/lWe1ONZmhUFNrpyl
        cmeA2hUb7pRw01ZXzPpzjx/9NGfI/3GMiFNy+Aun/EY=;
X-AuditID: c39127d2-253ff70000001c25-d4-5f74634a4d88
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 2F.89.07205.A43647F5; Wed, 30 Sep 2020 12:51:54 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012515375-526326 ;
          Wed, 30 Sep 2020 12:51:53 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 4/5] media: mt9p031: Make pixel clock polarity configurable by DT
Date:   Wed, 30 Sep 2020 12:51:32 +0200
Message-Id: <20200930105133.139981-4-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930105133.139981-1-s.riedmueller@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:53,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:54
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRoCBS9cruSTeYMtdFovOiUvYLS7vmsNm
        0bNhK6vFsk1/mCw+bfnG5MDqMbtjJqvHplWdbB7zTgZ6fN4kF8ASxWWTkpqTWZZapG+XwJXR
        euc3a8Eh6Yo1q44yNzAuFu9i5OSQEDCRmH/wMzOILSSwjVHi70z5LkYuIPsao8TJD2vZQRJs
        AkYSC6Y1MoHYIgIWEr2LpjOCFDELPGeUmLN9FyNIQlggROL3jh5WEJtFQFXifutqNhCbV8BW
        4l/rDlaIbfISMy99BxvKKWAncfr+L6A4B9A2W4mLk7MgygUlTs58wgIyX0LgCqPElGvPmSB6
        hSROLz4LdimzgLbEsoWvmScwCsxC0jMLSWoBI9MqRqHczOTs1KLMbL2CjMqS1GS9lNRNjMBA
        PTxR/dIOxr45HocYmTgYDzFKcDArifAeSiyJF+JNSaysSi3Kjy8qzUktPsQozcGiJM67gbck
        TEggPbEkNTs1tSC1CCbLxMEp1cCYwz3RRKjQfGLR5k1ymutOWKfEtZcGm+oWaU9/+uTCy0S7
        S+kzzCa/XHV20SW9hHXyxwvYHtnUKf/7WtnvN7+lwHG5t++i9IlennYXBW8KqQhV3rY/mDRz
        Sliyw+qjb+6wL99YxPL7kvmRszO5WtadPqL9YCcHq7fVpVVLnBUFv8/2VJw+gbNRiaU4I9FQ
        i7moOBEA6E/jSkICAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christian Hemp <c.hemp@phytec.de>

Evaluate the desired pixel clock polarity from the device tree.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Changes in v2:
 - Initialise endpoint bus=5Ftype field to V4L2=5FMBUS=5FPARALLEL since the
   sensor only supports a parallel interface
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9p031.c | 20 +++++++++++++++++++-
 include/media/i2c/mt9p031.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c7ba76fee599..7c026daeacf0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1103,6 +1103,7 @@ config VIDEO=5FMT9P031
 	select MEDIA=5FCONTROLLER
 	select VIDEO=5FV4L2=5FSUBDEV=5FAPI
 	select VIDEO=5FAPTINA=5FPLL
+	select V4L2=5FFWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt9p031 5 Mpixel camera.
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index de36025260a8..d10457361e6c 100644
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
@@ -399,6 +400,14 @@ static int =5F=5Fmt9p031=5Fset=5Fpower(struct mt9p031 =
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
@@ -1062,8 +1071,11 @@ static const struct v4l2=5Fsubdev=5Finternal=5Fops m=
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
@@ -1072,6 +1084,9 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
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
@@ -1079,6 +1094,9 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
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

