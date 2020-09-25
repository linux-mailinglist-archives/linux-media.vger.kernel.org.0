Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BB427822C
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgIYIFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:05:40 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61906 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgIYIFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:05:40 -0400
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Sep 2020 04:05:40 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601020238; x=1603612238;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j0kqQYL4u8t86vKnzKM+WdGJT8q9+TWpXY5c8+70iWo=;
        b=nHXWGDnoL6vXSe7HqRozREJDOaivo/1SMXl7Q8O6Lf36syi9AJ1JYKny9Zn4SMN5
        kZjKbN5F1oLT8awUjuHE/RtLRisE7GkzqCseDW1EwfYy34eYcRLUum9YgA09rwL0
        tIyMag6UvIj7rfOJfnBU0NykQCEyd+0IHJ3g/yjNJgs=;
X-AuditID: c39127d2-253ff70000001c25-ef-5f6da14ecba7
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1C.A5.07205.E41AD6F5; Fri, 25 Sep 2020 09:50:38 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092509503863-495326 ;
          Fri, 25 Sep 2020 09:50:38 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 1/5] media: mt9p031: Add support for 8 bit and 10 bit formats
Date:   Fri, 25 Sep 2020 09:50:25 +0200
Message-Id: <20200925075029.32181-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:38,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:38
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWyRoCBS9dvYW68wZVtOhZf58xjteicuITd
        4vKuOWwWPRu2slos2/SHyeLTlm9MDmwesztmsnpsWtXJ5jHvZKBH/18Dj8+b5AJYo7hsUlJz
        MstSi/TtErgy3i8/wFjwWaGis+8MWwNjj0wXIweHhICJxKnDEl2MXBxCAtsYJSZNbmWHcK4x
        SrT/esjUxcjJwSZgJLFgWiOYLSJgIdG7aDojSBGzQAeTRN+n02wgCWEBX4n3vx4zg9gsAqoS
        m59vYwexeQVsJM5tngFWIyEgLzHz0neouKDEyZlPWCDiVxglNj7XgLCFJE4vPgs2h1lAW2LZ
        wtfMExj5ZiFpmYUktYCRaRWjUG5mcnZqUWa2XkFGZUlqsl5K6iZGYCgenqh+aQdj3xyPQ4xM
        HIyHGCU4mJVEeI9vyIkX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzruBtyRMSCA9sSQ1OzW1ILUI
        JsvEwSnVwFhQs9N/5qFH/DP0J1eGW3+9ce3FnuV1e5Y2BptoNN5svmZ0aPbqhlOSrae3pOcu
        U3v0um32p3Wswbpp/Sonkr9dvifoG22XzNywLkSq+v9lkwsfbN0Oi2wVfK63uN6p6LHDi7Qp
        jdLaZ/ICsnPlVD4KW//imidbvaPv7TKhNT/Wst7PEmVL26LEUpyRaKjFXFScCABGoN4KMwIA
        AA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christian Hemp <c.hemp@phytec.de>

Aside from 12 bit monochrome or color format the sensor implicitly
supports 10 and 8 bit formats as well by simply dropping the
corresponding LSBs.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
[jlu@pengutronix.de: simplified by dropping v4l2=5Fcolorspace handling]
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index dc23b9ed510a..0002dd299ffa 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -116,6 +116,18 @@ enum mt9p031=5Fmodel {
 	MT9P031=5FMODEL=5FMONOCHROME,
 };
=20
+static const u32 mt9p031=5Fcolor=5Ffmts[] =3D {
+	MEDIA=5FBUS=5FFMT=5FSGRBG8=5F1X8,
+	MEDIA=5FBUS=5FFMT=5FSGRBG10=5F1X10,
+	MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12,
+};
+
+static const u32 mt9p031=5Fmonochrome=5Ffmts[] =3D {
+	MEDIA=5FBUS=5FFMT=5FY8=5F1X8,
+	MEDIA=5FBUS=5FFMT=5FY10=5F1X10,
+	MEDIA=5FBUS=5FFMT=5FY12=5F1X12,
+};
+
 struct mt9p031 {
 	struct v4l2=5Fsubdev subdev;
 	struct media=5Fpad pad;
@@ -138,6 +150,9 @@ struct mt9p031 {
 	struct v4l2=5Fctrl *blc=5Fauto;
 	struct v4l2=5Fctrl *blc=5Foffset;
=20
+	const u32 *fmts;
+	int num=5Ffmts;
+
 	/* Registers cache */
 	u16 output=5Fcontrol;
 	u16 mode2;
@@ -148,6 +163,17 @@ static struct mt9p031 *to=5Fmt9p031(struct v4l2=5Fsubd=
ev *sd)
 	return container=5Fof(sd, struct mt9p031, subdev);
 }
=20
+static const u32 mt9p031=5Ffind=5Fdatafmt(struct mt9p031 *mt9p031, u32 cod=
e)
+{
+	int i;
+
+	for (i =3D 0; i < mt9p031->num=5Ffmts; i++)
+		if (mt9p031->fmts[i] =3D=3D code)
+			return mt9p031->fmts[i];
+
+	return mt9p031->fmts[mt9p031->num=5Ffmts-1];
+}
+
 static int mt9p031=5Fread(struct i2c=5Fclient *client, u8 reg)
 {
 	return i2c=5Fsmbus=5Fread=5Fword=5Fswapped(client, reg);
@@ -476,10 +502,11 @@ static int mt9p031=5Fenum=5Fmbus=5Fcode(struct v4l2=
=5Fsubdev *subdev,
 {
 	struct mt9p031 *mt9p031 =3D to=5Fmt9p031(subdev);
=20
-	if (code->pad || code->index)
+	if (code->pad || code->index >=3D mt9p031->num=5Ffmts)
 		return -EINVAL;
=20
-	code->code =3D mt9p031->format.code;
+	code->code =3D mt9p031->fmts[code->index];
+
 	return 0;
 }
=20
@@ -573,6 +600,8 @@ static int mt9p031=5Fset=5Fformat(struct v4l2=5Fsubdev =
*subdev,
 	=5F=5Fformat->width =3D =5F=5Fcrop->width / hratio;
 	=5F=5Fformat->height =3D =5F=5Fcrop->height / vratio;
=20
+	=5F=5Fformat->code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, format->format.c=
ode);
+
 	format->format =3D *=5F=5Fformat;
=20
 	return 0;
@@ -951,10 +980,7 @@ static int mt9p031=5Fopen(struct v4l2=5Fsubdev *subdev=
, struct v4l2=5Fsubdev=5Ffh *fh)
=20
 	format =3D v4l2=5Fsubdev=5Fget=5Ftry=5Fformat(subdev, fh->pad, 0);
=20
-	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME)
-		format->code =3D MEDIA=5FBUS=5FFMT=5FY12=5F1X12;
-	else
-		format->code =3D MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12;
+	format->code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, 0);
=20
 	format->width =3D MT9P031=5FWINDOW=5FWIDTH=5FDEF;
 	format->height =3D MT9P031=5FWINDOW=5FHEIGHT=5FDEF;
@@ -1121,10 +1147,14 @@ static int mt9p031=5Fprobe(struct i2c=5Fclient *cli=
ent,
 	mt9p031->crop.left =3D MT9P031=5FCOLUMN=5FSTART=5FDEF;
 	mt9p031->crop.top =3D MT9P031=5FROW=5FSTART=5FDEF;
=20
-	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME)
-		mt9p031->format.code =3D MEDIA=5FBUS=5FFMT=5FY12=5F1X12;
-	else
-		mt9p031->format.code =3D MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12;
+	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME) {
+		mt9p031->fmts =3D mt9p031=5Fmonochrome=5Ffmts;
+		mt9p031->num=5Ffmts =3D ARRAY=5FSIZE(mt9p031=5Fmonochrome=5Ffmts);
+	} else {
+		mt9p031->fmts =3D mt9p031=5Fcolor=5Ffmts;
+		mt9p031->num=5Ffmts =3D ARRAY=5FSIZE(mt9p031=5Fcolor=5Ffmts);
+	}
+	mt9p031->format.code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, 0);
=20
 	mt9p031->format.width =3D MT9P031=5FWINDOW=5FWIDTH=5FDEF;
 	mt9p031->format.height =3D MT9P031=5FWINDOW=5FHEIGHT=5FDEF;
--=20
2.25.1

