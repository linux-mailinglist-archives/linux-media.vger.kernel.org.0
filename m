Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F567278233
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgIYIGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:06:03 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61918 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgIYIF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601020249; x=1603612249;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=W2ZrFbcxd4kDGmQO+BiozH8E+vz+f2nc13eOaGw19XE=;
        b=iBv1bbb92r0yTpZ1wcrPTdMU0eDJuIRsNLu1ysrjHn9DIrFDPeSZokfc7RDW19Eu
        nDpGWm12wQTokuRjBp8UN6hyWcwzhHREOPQ0Hv4m9XgdTtgALJd3hAeuUelAQXXz
        RUv3Xh2aiodZZkIBv6xbTQfQXqd6p/uiQU/28e4tF3o=;
X-AuditID: c39127d2-253ff70000001c25-f6-5f6da159bed7
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 3E.A5.07205.951AD6F5; Fri, 25 Sep 2020 09:50:49 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092509504915-495334 ;
          Fri, 25 Sep 2020 09:50:49 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 5/5] media: mt9p031: Fix corrupted frame after restarting stream
Date:   Fri, 25 Sep 2020 09:50:29 +0200
Message-Id: <20200925075029.32181-5-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925075029.32181-1-s.riedmueller@phytec.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:49,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:49
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRoCBSzdyYW68we1vchadE5ewW1zeNYfN
        omfDVlaLZZv+MFl82vKNyYHVY3bHTFaPTas62TzmnQz0+LxJLoAlissmJTUnsyy1SN8ugSvj
        zptbTAUnRSquH3rN0sDYJtjFyMkhIWAisX/pB0YQW0hgG6PE1W25EPY1Rom7D8tBbDYBI4kF
        0xqZQGwRAQuJ3kXTgeq5OJgFnjFKtLe1soEkhAUCJP5Pm8gOYrMIqEqs+3yCBcTmFbCRODDl
        MBvEMnmJmZe+g9VwCthKHH17nglimY3Eix1/GSHqBSVOznzCArJAQuAKo8TpT7NYIJqFJE4v
        PssMYjMLaEssW/iaeQKjwCwkPbOQpBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAzUwxPV
        L+1g7JvjcYiRiYPxEKMEB7OSCO/xDTnxQrwpiZVVqUX58UWlOanFhxilOViUxHk38JaECQmk
        J5akZqemFqQWwWSZODilGhgNvl7u+cFwsGfvDN7Z/0z2X1u9n2tH9SqPjyzzcm3OOWb2nkus
        bSl4mlM0b5Vz9mRBP4/nuxfL/Jv8cIbwvrSgU47TZjp1OLr82mAWGniU+cb9f88UGmy6Y2TM
        Zj9uNud101635cbUFd7vubLtDM6Xbyn6djVPW6ugV/bTmsOL+M/L+eh3lfxWYinOSDTUYi4q
        TgQA/2/8F0ICAAA=
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
 drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 8f8ee37a2dd2..2f2daf95dcd3 100644
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

