Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3BB3C8571
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbhGNNlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:46 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56700 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhGNNlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269930; x=1628861930;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wRClOOTpYIKz17YoQZPGEsQWo4OJcSdhhZ7l/4lJrYw=;
        b=Y4r2FMILViNSVeD9GPsSSMoef9Qggqvvzu/jrYQ2sUs7fNU93aYIUZgpxBOKysQg
        +2lpGvVL8/zBqOPoeaqiHYDz7WgNF/GRSecUR58wSaK2o8pkS2wMQFBIyPFrcy6v
        ol/pjPfMls3c7U1JaoW55E7326N8MqEcOZWQcybP+MA=;
X-AuditID: c39127d2-1d8f870000001daf-21-60eee8ea67df
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DB.57.07599.AE8EEE06; Wed, 14 Jul 2021 15:38:50 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415385012-1154290 ;
          Wed, 14 Jul 2021 15:38:50 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Wed, 14 Jul 2021 15:38:46 +0200
Message-Id: <20210714133849.1041619-4-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRoCBS/fVi3cJBv8mKVnMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAlfFr+hW2gmsiFYd/2DQwfhboYuTgkBAwkfj2mLeLkYtDSGAbo8ThbxsZIZwL
        jBKNuzczdzFycrAJGEksmNbIBJIQEWhjlNhxpBnMYRa4xijx/e8DdpAqYYFgiUvH/7GB2CwC
        qhLtt3rAunkF7CQ+/FoBViMhIC8x89J3MJtTwF6i++g/FhBbCKjmzuX5jBD1ghInZz5hAVkg
        IXCFUeLuuueMEM1CEqcXnwUbyiygLbFs4WvmCYwCs5D0zEKSWsDItIpRKDczOTu1KDNbryCj
        siQ1WS8ldRMjMHwPT1S/tIOxb47HIUYmDsZDjBIczEoivEuN3iYI8aYkVlalFuXHF5XmpBYf
        YpTmYFES593AWxImJJCeWJKanZpakFoEk2Xi4JRqYPTaednvzwmBl/r++2fwZRVyPKz93DRl
        xXnjydl6m7dvvr/kJ+ePRrX70bEu4VVBbd8ON+/q7Tp+5yB72cGSyY861e9oOB2MnMv0KXd3
        6pTd7VeklHm6ONqkXny29Q/49eVAlNGnSdalHbl68yYs/Kj4+45btdK+tzkXvBY8uxDdl7zT
        t4HjyV8lluKMREMt5qLiRAAPDnT8TQIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dirk Bender <d.bender@phytec.de>

To prevent corrupted frames after starting and stopping the sensor its
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
 drivers/media/i2c/mt9p031.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea90aff576ba..ee2777059682 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -79,7 +79,9 @@
 #define		MT9P031=5FPIXEL=5FCLOCK=5FINVERT		(1 << 15)
 #define		MT9P031=5FPIXEL=5FCLOCK=5FSHIFT(n)		((n) << 8)
 #define		MT9P031=5FPIXEL=5FCLOCK=5FDIVIDE(n)		((n) << 0)
-#define MT9P031=5FFRAME=5FRESTART				0x0b
+#define MT9P031=5FRESTART					0x0b
+#define		MT9P031=5FFRAME=5FPAUSE=5FRESTART		(1 << 1)
+#define		MT9P031=5FFRAME=5FRESTART			(1 << 0)
 #define MT9P031=5FSHUTTER=5FDELAY				0x0c
 #define MT9P031=5FRST					0x0d
 #define		MT9P031=5FRST=5FENABLE			1
@@ -456,9 +458,23 @@ static int mt9p031=5Fset=5Fparams(struct mt9p031 *mt9p=
031)
 static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *subdev, int enable)
 {
 	struct mt9p031 *mt9p031 =3D to=5Fmt9p031(subdev);
+	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(subdev);
+	int val;
 	int ret;
=20
 	if (!enable) {
+		/* enable pause restart */
+		val =3D MT9P031=5FFRAME=5FPAUSE=5FRESTART;
+		ret =3D mt9p031=5Fwrite(client, MT9P031=5FRESTART, val);
+		if (ret < 0)
+			return ret;
+
+		/* enable restart + keep pause restart set */
+		val |=3D MT9P031=5FFRAME=5FRESTART;
+		ret =3D mt9p031=5Fwrite(client, MT9P031=5FRESTART, val);
+		if (ret < 0)
+			return ret;
+
 		/* Stop sensor readout */
 		ret =3D mt9p031=5Fset=5Foutput=5Fcontrol(mt9p031,
 						 MT9P031=5FOUTPUT=5FCONTROL=5FCEN, 0);
@@ -478,6 +494,16 @@ static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *=
subdev, int enable)
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * - clear pause restart
+	 * - don't clear restart as clearing restart manually can cause
+	 *   undefined behavior
+	 */
+	val =3D MT9P031=5FFRAME=5FRESTART;
+	ret =3D mt9p031=5Fwrite(client, MT9P031=5FRESTART, val);
+	if (ret < 0)
+		return ret;
+
 	return mt9p031=5Fpll=5Fenable(mt9p031);
 }
=20
--=20
2.25.1

