Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013123D5459
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhGZGyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:54 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56428 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhGZGyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284919; x=1629876919;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+H1mSGK8sEEJKzfOg24gWavE+r+Wd/b4Q6Yu1wUkNo4=;
        b=M/7ocF/1e3w1mqZdZRSAQ4S2xN+j0PwE4h2Ez6JDTwFjw8p14m7hIGIgXOyL/4q7
        uZGa6EHEOJJAp9FgTNtrzs31baO2ikAwhSNV6AgDnJ3H1EDB9IeC3GQE3sqaHVBk
        dj5u2QiLgv6q0zJG3Pe6bXJAkVPiU236m1pk775Ks5g=;
X-AuditID: c39127d2-6feea24000001daf-a5-60fe65b711de
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 54.82.07599.7B56EF06; Mon, 26 Jul 2021 09:35:19 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351871-1233315 ;
          Mon, 26 Jul 2021 09:35:18 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] media: mt9p031: Make pixel clock polarity configurable by DT
Date:   Mon, 26 Jul 2021 09:35:14 +0200
Message-Id: <20210726073518.2167398-3-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726073518.2167398-1-s.riedmueller@phytec.de>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:18,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRoCBS3d76r8Eg65/7Bbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZczrnsxUsEmqYv6tP8wNjOvEuhg5OSQETCQmb57E3sXIxSEksI1R4uCaDmYI
        5wKjxOXp21hAqtgEjCQWTGtkAkmICLQxSuw40swEkmAWuM4oseEHM4gtLBAi0TbvCiuIzSKg
        KnFqcQPQWA4OXgE7iWlH2CC2yUvMvPSdHcTmFLCXuPX0PZgtBFTS2rkRzOYVEJQ4OfMJC8gu
        CYErjBITXs1jgWgWkji9+CwzxF5tiWULXzNPYBSYhaRnFpLUAkamVYxCuZnJ2alFmdl6BRmV
        JanJeimpmxiB4Xt4ovqlHYx9czwOMTJxMB5ilOBgVhLhdVjxO0GINyWxsiq1KD++qDQntfgQ
        ozQHi5I47wbekjAhgfTEktTs1NSC1CKYLBMHp1QD47bZhQ1Fn3fd3xQxg1HrwSWPJ38fqRfu
        P/91Mx+Lk1LEzRXnNyxvW3ZtyuezjBMaul0OFc+Y+z17rpncY4k/rAWBmxZ3OFScvLJM/gnT
        0fJTm74olrK+OXwtJjbwSOAhlzkCjWkhV0Iyv89z+sU4P/Loidgb/36vjY6UDQgtX17YfrTl
        61GXyF9KLMUZiYZazEXFiQAlJDfzTQIAAA==
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

