Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE353C59AE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351289AbhGLJH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 05:07:29 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45266 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382701AbhGLJCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 05:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626080136; x=1628672136;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wRClOOTpYIKz17YoQZPGEsQWo4OJcSdhhZ7l/4lJrYw=;
        b=BgccaId6E5w9yWtDbWYQLIyC+d5R7YJFmCAp28lx9/XTm/+UFcQwCVOjIE+4nP3h
        VBNOlz3jDr6M7agWCAaLLONhZURMRpxFhVol1FzXClQLsn6cE9n8cVxN/oPG3ptK
        LcWaJLsQFubsKNpDuyfGo9rr33c3LKoTtwF1+Hs5Xk0=;
X-AuditID: c39127d2-1d8f870000001daf-20-60ec03881f0d
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id EB.8D.07599.8830CE06; Mon, 12 Jul 2021 10:55:36 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071210553628-1131633 ;
          Mon, 12 Jul 2021 10:55:36 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Mon, 12 Jul 2021 10:55:32 +0200
Message-Id: <20210712085535.11907-4-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712085535.11907-1-s.riedmueller@phytec.de>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:36,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:36
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBS7eD+U2CwY/HOhbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZfyafoWt4JpIxeEfNg2MnwW6GDk5JARMJNb0LmPtYuTiEBLYxijRdO8WM4Rz
        nVHi6YpJzCBVbAJGEgumNTKBJEQE2hgldhxpBnOYBa4xSnz/+4AdpEpYIFhiz/0tTCA2i4Cq
        xMSHR1hBbF4BG4l9e7+zQuyTl5h56TtQPQcHp4CtxJ4fliBhIaCS6/M3sECUC0qcnPmEBaL8
        CqPEjYvhELaQxOnFZ8EOYhbQlli28DXzBEaBWUhaZiFJLWBkWsUolJuZnJ1alJmtV5BRWZKa
        rJeSuokRGLyHJ6pf2sHYN8fjECMTB+MhRgkOZiUR3m+9rxKEeFMSK6tSi/Lji0pzUosPMUpz
        sCiJ827gLQkTEkhPLEnNTk0tSC2CyTJxcEo1MGY/En6z9d/ti9M+5TL5Llibyvxa8EyPrfpn
        HqFjBwznxparv5Xkk2K8eFJYr2lx176b/ZM9ji/xPZu3Z1bki2vzdTJZ/wYxsaQd+hcruf9K
        v/ruzAmL+mem+h2a88Z9ru60NEu2W1wy+60tG/b5HFi2ULzGMfy8FNMqdsnLv/m9ixh3lIT9
        vabEUpyRaKjFXFScCACOmuZoTAIAAA==
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

