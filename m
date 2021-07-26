Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF453D545D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhGZGyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:55 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232461AbhGZGyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284919; x=1629876919;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wRClOOTpYIKz17YoQZPGEsQWo4OJcSdhhZ7l/4lJrYw=;
        b=belzzakJEqyfnDmARkg2McxWZf79oFA6EjqOb0KShewFP3BFGy92H2GRzUEgdxXQ
        6lD7x40YfNDypgZIzH2TTy1arSlypwWosPREmShc6w3iJKR2H7P51VVKYE10fwre
        XfMdKfI7p8vgngKXwtmEGzyc1q8RHuoiAjJ0r8Q0784=;
X-AuditID: c39127d2-1e4f970000001daf-a7-60fe65b73cb8
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 05.82.07599.7B56EF06; Mon, 26 Jul 2021 09:35:19 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351899-1233316 ;
          Mon, 26 Jul 2021 09:35:18 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Mon, 26 Jul 2021 09:35:15 +0200
Message-Id: <20210726073518.2167398-4-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726073518.2167398-1-s.riedmueller@phytec.de>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS3d76r8Eg2PnZCzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyvg1/QpbwTWRisM/bBoYPwt0MXJySAiYSFxff5Oti5GLQ0hgG6PEx3PPmSCc
        C4wSb5cfYgOpYhMwklgwrREsISLQxiix40gzmMMscI1R4vvfB+wgVcICwRInph5mAbFZBFQl
        XvX3gHXzCthJzOh4ywaxT15i5qXvYPWcAvYSt56+B7OFgGpaOzeyQ9QLSpyc+YQFZIGEwBVG
        iQNHNzJBNAtJnF58lhnEZhbQlli28DXzBEaBWUh6ZiFJLWBkWsUolJuZnJ1alJmtV5BRWZKa
        rJeSuokRGMCHJ6pf2sHYN8fjECMTB+MhRgkOZiURXocVvxOEeFMSK6tSi/Lji0pzUosPMUpz
        sCiJ827gLQkTEkhPLEnNTk0tSC2CyTJxcEo1MHrPZpP1Wqs2U3CJ9bKrjeUxXiu/ecrl8a2v
        Vn598pzBzPl9hQxbXXneWE9k5RdcfqqsJTFy4rLIwLioFzEbPKf23+xTmq544LAWw5Fl1Z8t
        +V6knTpzWSwmhWdT6F25WkddC5EJxg6MKT0FH+/vO2p/v+zBxYxWy4OHHKV6WxZqB06u+xpb
        rMRSnJFoqMVcVJwIAFki6e5OAgAA
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

