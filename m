Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2833427E730
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgI3KwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:52:04 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbgI3KwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601463117; x=1604055117;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=G1/2BgyoatPHnSiyT4dMVmNoh+3yE3VQGZZbZjWFxEE=;
        b=IwLd0ZR8hNyaQZfPVFo53elt7EYCrrapYBgDAV6IDXe/h9X+n/OK8L1+Ok8PfjCt
        SRjpm9iBeh3z0oJ3+nmuh8dIMHj2oe69Q5lKM1uBv0dM8jpQoERNXlMHcsfjKc7p
        sv7bm/4PdskKiwoml74GYTvOuXQH9lbdXIIIh/SzZbg=;
X-AuditID: c39127d2-269ff70000001c25-d5-5f74634c7008
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8F.89.07205.C43647F5; Wed, 30 Sep 2020 12:51:56 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012515660-526327 ;
          Wed, 30 Sep 2020 12:51:56 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 5/5] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Wed, 30 Sep 2020 12:51:33 +0200
Message-Id: <20200930105133.139981-5-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930105133.139981-1-s.riedmueller@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:56,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:56
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRoCBS9cnuSTe4PV5a4vOiUvYLS7vmsNm
        0bNhK6vFsk1/mCw+bfnG5MDqMbtjJqvHplWdbB7zTgZ6fN4kF8ASxWWTkpqTWZZapG+XwJXR
        s/o0W8EDkYqv+/ewNDBOE+xi5OSQEDCRePhyM3MXIxeHkMA2Rom3Ty+zgCSEBK4xSsy+aQJi
        swkYSSyY1sgEYosIWEj0LprOCNLALPCMUaK9rZUNJCEsECyxakEDmM0ioCpxdH0vM4jNK2Ar
        8Xj/cWaIbfISMy99ZwexOQXsJE7f/8XaxcgBtMxW4uLkLIhyQYmTM5+wgMyXELjCKNHx9iwb
        RK+QxOnFZ8HmMAtoSyxb+Jp5AqPALCQ9s5CkFjAyrWIUys1Mzk4tyszWK8ioLElN1ktJ3cQI
        DNTDE9Uv7WDsm+NxiJGJg/EQowQHs5II76HEkngh3pTEyqrUovz4otKc1OJDjNIcLErivBt4
        S8KEBNITS1KzU1MLUotgskwcnFINjJOXLVWazbB2L59mgXr1sue3Wqafuxm52fTnoal8e0Nz
        l/d2fHZ9YZD2r7Xfbtsh0defl/NfEhea5vFsV93HeVsfu7fI2By/w2R+I/6p4MnI7vmluxjL
        l/4yOyt0TbqkdhV302V3XeWbspOuzC7/UGj92SOsfU7ypjbWp3Fdy6XUs7LuTFl6OEmJpTgj
        0VCLuag4EQBubmDKQgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dirk Bender <d.bender@phytec.de>

To prevent corrupted frames after starting and stopping the sensor it's
datasheet specifies a specific pause sequence to follow:

Stopping:
	Set Pause=5FRestart Bit -> Set Restart Bit -> Set Chip=5FEnable Off

Restarting:
	Set Chip=5FEnable On -> Clear Pause=5FRestart Bit

The Restart Bit is cleared automatically and must not be cleared
manually as this would cause undefined behavior.

Signed-off-by: Dirk Bender <d.bender@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
No changes in v2
---
 drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d10457361e6c..d59f66e3dcf3 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -80,6 +80,8 @@
 #define		MT9P031=5FPIXEL=5FCLOCK=5FSHIFT(n)		((n) << 8)
 #define		MT9P031=5FPIXEL=5FCLOCK=5FDIVIDE(n)		((n) << 0)
 #define MT9P031=5FFRAME=5FRESTART				0x0b
+#define		MT9P031=5FFRAME=5FRESTART=5FSET		(1 << 0)
+#define		MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET		(1 << 1)
 #define MT9P031=5FSHUTTER=5FDELAY				0x0c
 #define MT9P031=5FRST					0x0d
 #define		MT9P031=5FRST=5FENABLE			1
@@ -483,9 +485,25 @@ static int mt9p031=5Fset=5Fparams(struct mt9p031 *mt9p=
031)
 static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *subdev, int enable)
 {
 	struct mt9p031 *mt9p031 =3D to=5Fmt9p031(subdev);
+	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(subdev);
+	int val;
 	int ret;
=20
 	if (!enable) {
+		val =3D mt9p031=5Fread(client, MT9P031=5FFRAME=5FRESTART);
+
+		/* enable pause restart */
+		val |=3D MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET;
+		ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
+		if (ret < 0)
+			return ret;
+
+		/* enable restart + keep pause restart set */
+		val |=3D MT9P031=5FFRAME=5FRESTART=5FSET;
+		ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
+		if (ret < 0)
+			return ret;
+
 		/* Stop sensor readout */
 		ret =3D mt9p031=5Fset=5Foutput=5Fcontrol(mt9p031,
 						 MT9P031=5FOUTPUT=5FCONTROL=5FCEN, 0);
@@ -505,6 +523,13 @@ static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *=
subdev, int enable)
 	if (ret < 0)
 		return ret;
=20
+	val =3D mt9p031=5Fread(client, MT9P031=5FFRAME=5FRESTART);
+	/* disable reset + pause restart */
+	val &=3D ~MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET;
+	ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
+	if (ret < 0)
+		return ret;
+
 	return mt9p031=5Fpll=5Fenable(mt9p031);
 }
=20
--=20
2.25.1

