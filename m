Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25503C856E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhGNNlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:45 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56700 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbhGNNln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269930; x=1628861930;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+H1mSGK8sEEJKzfOg24gWavE+r+Wd/b4Q6Yu1wUkNo4=;
        b=rtpdpm4FXwScQ5iADn2tfUWNsKx6jwUSPI1d/9oCqVjRN/EBeOH3XAA7cmxk2v8h
        Ki8S/WjMREsM5gpiGenyUYFAx6V28p73abrkZ0/1z4xUj7LhmJa8XJJ6Huheww7p
        BVsfvmC1OmlbAWmWuf8e91/ojMBjQv4M/G51GXl6SsU=;
X-AuditID: c39127d2-1e4f970000001daf-1e-60eee8ead44d
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1B.57.07599.AE8EEE06; Wed, 14 Jul 2021 15:38:50 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415384985-1154289 ;
          Wed, 14 Jul 2021 15:38:49 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] media: mt9p031: Make pixel clock polarity configurable by DT
Date:   Wed, 14 Jul 2021 15:38:45 +0200
Message-Id: <20210714133849.1041619-3-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714133849.1041619-1-s.riedmueller@phytec.de>
References: <20210714133849.1041619-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:50,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:50
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRoCBS/fVi3cJBv+WCVvMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAlTGvezJTwSapivm3/jA3MK4T62Lk5JAQMJF43LaUsYuRi0NIYBujxN6/j1gh
        nAuMEkd+vGIBqWITMJJYMK2RCSQhItDGKLHjSDMTSIJZ4DqjxIYfzF2MHBzCAiESU9YngIRZ
        BFQlPjQ3soHYvAJ2El2TL7JBbJOXmHnpOzuIzSlgL9F99B/YfCGgmjuX5zNC1AtKnJz5hAVk
        l4TAFUaJu+ueM0I0C0mcXnyWGWKvtsSyha+ZJzAKzELSMwtJagEj0ypGodzM5OzUosxsvYKM
        ypLUZL2U1E2MwPA9PFH90g7GvjkehxiZOBgPMUpwMCuJ8C41epsgxJuSWFmVWpQfX1Sak1p8
        iFGag0VJnHcDb0mYkEB6YklqdmpqQWoRTJaJg1OqgdHzb/lH7v+/px1vu3T7YsYP50qmboN7
        bVaH844Kalt8NVqxpeLrij8NF7OXh57q2p671PHNLJEva1qfvtt/fe8kvnJzufk7H8UnsmZP
        eeA++UQvv+cfPuNLh1MbLP6G/LfQ3W5d/vO7m3UuXzx74PnSu8vux8vKVx4p0ZLLNdK3vv/h
        79+/ipFKLMUZiYZazEXFiQAlakl2TQIAAA==
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

