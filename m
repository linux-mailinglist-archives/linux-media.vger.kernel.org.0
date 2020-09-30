Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0695127E723
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgI3Kvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:51:44 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Kvj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601463095; x=1604055095;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y7g5Aql4+5rCpjrJRKtf2YlTYouxnKhzHWzTCuyvIwo=;
        b=UptPZvfZhO/ZthCzI8TKg26TFUwe/1ppN4+JlulNc7KOUxFMosWFl41HppTV5Zjx
        bNKYdLHdL7l4BbN8NUoXk0jD/8iJFjfArP2oS5a40U0N29RioeK+S1FlC7CPoBlO
        sjgqlVKy7IbaT0P8RhGatme5rqxwfCkw59njwmynml0=;
X-AuditID: c39127d2-253ff70000001c25-cf-5f7463376621
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 9D.89.07205.733647F5; Wed, 30 Sep 2020 12:51:35 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012513525-526321 ;
          Wed, 30 Sep 2020 12:51:35 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 1/5] media: mt9p031: Add support for 8 bit and 10 bit formats
Date:   Wed, 30 Sep 2020 12:51:29 +0200
Message-Id: <20200930105133.139981-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:35,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:35
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWyRoCBS9c8uSTe4PBUVYuvc+axWnROXMJu
        cXnXHDaLng1bWS2WbfrDZPFpyzcmBzaP2R0zWT02repk85h3MtCj/6+Bx+dNcgGsUVw2Kak5
        mWWpRfp2CVwZnU1nWQumKFXsvXeSvYFxkmwXIyeHhICJRO/9DuYuRi4OIYFtjBK7txxngXCu
        MUosufudCaSKTcBIYsG0RjBbRMBConfRdEaQImaBDiaJvk+n2boYOTiEBQIkNp/LAKlhEVCV
        WHxtDQuIzStgK3HpQgMTxDZ5iZmXvrNDxAUlTs58ArZMQuAKo8SN+4ehioQkTi8+ywxiMwto
        Syxb+Jp5AiPfLCQ9s5CkFjAyrWIUys1Mzk4tyszWK8ioLElN1ktJ3cQIDMbDE9Uv7WDsm+Nx
        iJGJg/EQowQHs5II76HEkngh3pTEyqrUovz4otKc1OJDjNIcLErivBt4S8KEBNITS1KzU1ML
        UotgskwcnFINjHE5v/p1V0jP7NjSyLuW6eAPiZ0TvIMc/02t4Tn9XWHaJE5exyeZc7e8PPfC
        +pTcy9RfT71KDb/PkHa7eeF5tGiANkPapp1ZDd8sGXcxmRjqTa/6sM5hRf7Luf/FVxt4MPNn
        d/zfFPzrGUvr5myvIDEprVZRmaC2vlXSa2QZ3t5X5pE+w5khpcRSnJFoqMVcVJwIABtfCjY0
        AgAA
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
Changes in v2:
 - Use unsigned int for num=5Ffmts and loop variable in find=5Fdatafmt
 - Remove superfluous const qualifier from find=5Fdatafmt
---
 drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index dc23b9ed510a..2e6671ef877c 100644
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
+	unsigned int num=5Ffmts;
+
 	/* Registers cache */
 	u16 output=5Fcontrol;
 	u16 mode2;
@@ -148,6 +163,17 @@ static struct mt9p031 *to=5Fmt9p031(struct v4l2=5Fsubd=
ev *sd)
 	return container=5Fof(sd, struct mt9p031, subdev);
 }
=20
+static u32 mt9p031=5Ffind=5Fdatafmt(struct mt9p031 *mt9p031, u32 code)
+{
+	unsigned int i;
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

