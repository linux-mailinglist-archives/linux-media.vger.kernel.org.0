Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0A03B9EAF
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhGBKCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:02:02 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55534 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbhGBKB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219964; x=1627811964;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=w1EOePrvY2I1BmLZBTkVvG3gIYcpvhoOPqXSOjYRuAE=;
        b=lZbFwNzsFncD70kQISfEMJ1B23bMiRjDeX1GX0ghYG5uIz4UCpP1QtQbOTSjDW6z
        gdU1F2/PGXNFRhNvqatXYXuI7SUcrt/oDXzisDGOFdM6s7J5+ftmPH/qTPNzLS0Q
        EiEyoCx3B2np4CXj25kWmHZr1AH0UCq2rwf6T5hqLlc=;
X-AuditID: c39127d2-a77bc70000001c5e-7d-60dee37c68d7
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 56.01.07262.C73EED06; Fri,  2 Jul 2021 11:59:24 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592393-1081050 ;
          Fri, 2 Jul 2021 11:59:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 5/6] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Fri, 2 Jul 2021 11:59:21 +0200
Message-Id: <20210702095922.118614-6-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702095922.118614-1-s.riedmueller@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:24,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:24
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWyRoCBS7fm8b0EgyO3pCzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyvh6bz5zwTWRio6rO5gbGD8LdDFyckgImEis/XuZuYuRi0NIYBujxMqjF9lB
        EkIC1xglOnttQGw2ASOJBdMamUBsEYEoiZ/ne1hAbGaBJiaJSxd1uxg5OIQFgiUenbEHCbMI
        qEgs79nKCGLzCthK3P98lgVil7zEzEvfwcZzCthJnLl5lAVila3E0f5frBD1ghInZz5hAblH
        QuAKo8TU49+ZIZqFJE4vPssMsVdbYtnC18wTGAVmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZl
        SWqyXkrqJkZg6B6eqH5pB2PfHI9DjEwcjIcYJTiYlUR4Q+fdSxDiTUmsrEotyo8vKs1JLT7E
        KM3BoiTOu4G3JExIID2xJDU7NbUgtQgmy8TBKdXAuHGa/RwXh2xPv48yC+apn29Usigt+Zd6
        LELNJ8nu9n0bV0P/axc/Ntg2zvN+1jb9bI01w59zDSYpW6/Fzjvp/j7d+l6rif5CJzZTp4op
        kUEHt7K8MwrWf/nB/1zg1IojNy+onDSym1/zeNHH4NqrIc9nfxSKU3myrXmODtuevKnafw5V
        m/37ocRSnJFoqMVcVJwIALe1pkVLAgAA
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
index 6a6f16df3f4a..3511c4ff350d 100644
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
@@ -482,9 +484,23 @@ static int mt9p031=5Fset=5Fparams(struct mt9p031 *mt9p=
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
@@ -504,6 +520,16 @@ static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *=
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

