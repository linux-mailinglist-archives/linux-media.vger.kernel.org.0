Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74D7278232
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgIYIGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:06:03 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61920 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgIYIF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601020247; x=1603612247;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m09GuPxODIBi6CsANbjfMfr/YvqAFgMfC3Wj/NunD5c=;
        b=G5HqRrJmTZI22TXQD/hef/gHRyscv00cnEK5uRaiQ5JXXIEQMxdRTmj5+fWzPhag
        xwsdlDfCy6SlE+x9yeo970ZkfQLp1W118ukE8+sQHVLeN+r9DqaHQ8y8jpBJhvED
        zwnDCD5yvLL2jGZTnHOR9r8i44COhkXoU2ce62RbW0k=;
X-AuditID: c39127d2-253ff70000001c25-f5-5f6da157af91
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DD.A5.07205.751AD6F5; Fri, 25 Sep 2020 09:50:47 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092509504720-495333 ;
          Fri, 25 Sep 2020 09:50:47 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 4/5] media: mt9p031: Make pixel clock polarity configurable by DT
Date:   Fri, 25 Sep 2020 09:50:28 +0200
Message-Id: <20200925075029.32181-4-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925075029.32181-1-s.riedmueller@phytec.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:47,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:47
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRoCBSzd8YW68wf7pihadE5ewW1zeNYfN
        omfDVlaLZZv+MFl82vKNyYHVY3bHTFaPTas62TzmnQz0+LxJLoAlissmJTUnsyy1SN8ugStj
        zrldrAWtUhXL5ncyNTD2inUxcnJICJhI3G2ezQxiCwlsY5R48Fmgi5ELyL7GKHGqaTkLSIJN
        wEhiwbRGJhBbRMBConfRdEaQImaB54wSc7bvYgRJCAsESvw7vIwdxGYRUJW48esSG4jNK2Aj
        8XXTbFaIbfISMy99B6vhFLCVOPr2PBPEZhuJFzv+MkLUC0qcnPmEBWSBhMAVRomZh3qZIZqF
        JE4vPgtmMwtoSyxb+Jp5AqPALCQ9s5CkFjAyrWIUys1Mzk4tyszWK8ioLElN1ktJ3cQIDNXD
        E9Uv7WDsm+NxiJGJg/EQowQHs5II7/ENOfFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeTfwloQJ
        CaQnlqRmp6YWpBbBZJk4OKUaGA9wTRR0PiC+yMNiyhQdkW2tbqt9mHdqN2xwkP8YvOFHScuk
        TGFePYXa+w3qimIM63hKynedm9p1eHfu5sbsqjVNHcum1a19n9YQsiyG+e2tL+cCbz/zniyo
        36n099SaFeHmH28Iyx69vNBxwxVJrs6VaVPC2g0ObVfjeOP9ofaL6ZaOne/dapVYijMSDbWY
        i4oTAVrdt5xDAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christian Hemp <c.hemp@phytec.de>

Evaluate the desired pixel clock polarity from the device tree.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9p031.c | 19 ++++++++++++++++++-
 include/media/i2c/mt9p031.h |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

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
index f5d6a7890c47..8f8ee37a2dd2 100644
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
@@ -1062,7 +1071,8 @@ static const struct v4l2=5Fsubdev=5Finternal=5Fops mt=
9p031=5Fsubdev=5Finternal=5Fops =3D {
 static struct mt9p031=5Fplatform=5Fdata *
 mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
 {
-	struct mt9p031=5Fplatform=5Fdata *pdata;
+	struct mt9p031=5Fplatform=5Fdata *pdata =3D NULL;
+	struct v4l2=5Ffwnode=5Fendpoint endpoint;
 	struct device=5Fnode *np;
=20
 	if (!IS=5FENABLED(CONFIG=5FOF) || !client->dev.of=5Fnode)
@@ -1072,6 +1082,10 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
 	if (!np)
 		return NULL;
=20
+	endpoint.bus=5Ftype =3D V4L2=5FMBUS=5FUNKNOWN;
+	if (v4l2=5Ffwnode=5Fendpoint=5Fparse(of=5Ffwnode=5Fhandle(np), &endpoint)=
 < 0)
+		goto done;
+
 	pdata =3D devm=5Fkzalloc(&client->dev, sizeof(*pdata), GFP=5FKERNEL);
 	if (!pdata)
 		goto done;
@@ -1079,6 +1093,9 @@ mt9p031=5Fget=5Fpdata(struct i2c=5Fclient *client)
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

