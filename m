Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D847E3BF775
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhGHJWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:15 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46318 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhGHJWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735963; x=1628327963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qN6QTxTTKZhnbCx2gpq04CN4bCn0nWKxKQ/ztel5F0Q=;
        b=A4i+7U66/EeJ0fXtuAhMbmw2t36WkZcfmKKZLIwKOkwXXmmT2hKQdJyVx+hoo0A9
        GtxOI3VgpFA/lIlre1MEByF6d/jQJh/hPxCWiM9nyiyXoQinwEv6PnAeEQqZObpQ
        cpm/7O6n/z5xMx+5GS6y1XeWF7Cy+jMnN8UyIiA5HCw=;
X-AuditID: c39127d2-1e4f970000001daf-86-60e6c31b0742
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 69.B7.07599.B13C6E06; Thu,  8 Jul 2021 11:19:23 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192301-1113444 ;
          Thu, 8 Jul 2021 11:19:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] media: mt9p031: Use BIT macro
Date:   Thu, 8 Jul 2021 11:19:20 +0200
Message-Id: <20210708091922.5508-5-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091922.5508-1-s.riedmueller@phytec.de>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS1f68LMEg75bEhbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZRx5uZqtYKdsxdqHR9gaGJ9IdDFyckgImEhcu/mVtYuRi0NIYBujxNOtZ9kg
        nGuMEu///mECqWITMJJYMK2RCSQhItDGKLHjSDOYwyywhVFi+uXlbCBVwgKmElsmPATrYBFQ
        kXjbvJkFxOYVsJZYvqWJBWKfvMTMS9/Zuxg5ODgFbCS6+lNAwkJAJcdm3WKFKBeUODnzCQvI
        fAmBK4wS838tY4PoFZI4vfgsM4jNLKAtsWzha+YJjAKzkPTMQpJawMi0ilEoNzM5O7UoM1uv
        IKOyJDVZLyV1EyMwgA9PVL+0g7FvjschRiYOxkOMEhzMSiK8RjOeJQjxpiRWVqUW5ccXleak
        Fh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLglGpgzC1aLf5wu70BZ9T5z7pH088V/3r+
        WPCXSv+Vk5qv1Ba0rixOEUm5bp/348Kjnzy+V++GfsotZT55anb2/jvfjJ8cS5338t3JuqjL
        E+T3KSXWb5z2nXdJfLsk9/znISdKX0rOaVsZJd4beaRn/7a1PRvnlxar7/xb9db82OnC+wGH
        4qqVn19sXarEUpyRaKjFXFScCAA2aExtTgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of the BIT macro for setting individual bits. This improves
readability and safety with respect to shifts.

When on it also remove two zero value disable defines.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ee2777059682..cbce8b88dbcf 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -76,40 +76,38 @@
 #define	MT9P031=5FPLL=5FCONFIG=5F1				0x11
 #define	MT9P031=5FPLL=5FCONFIG=5F2				0x12
 #define MT9P031=5FPIXEL=5FCLOCK=5FCONTROL			0x0a
-#define		MT9P031=5FPIXEL=5FCLOCK=5FINVERT		(1 << 15)
+#define		MT9P031=5FPIXEL=5FCLOCK=5FINVERT		BIT(15)
 #define		MT9P031=5FPIXEL=5FCLOCK=5FSHIFT(n)		((n) << 8)
 #define		MT9P031=5FPIXEL=5FCLOCK=5FDIVIDE(n)		((n) << 0)
 #define MT9P031=5FRESTART					0x0b
-#define		MT9P031=5FFRAME=5FPAUSE=5FRESTART		(1 << 1)
-#define		MT9P031=5FFRAME=5FRESTART			(1 << 0)
+#define		MT9P031=5FFRAME=5FPAUSE=5FRESTART		BIT(1)
+#define		MT9P031=5FFRAME=5FRESTART			BIT(0)
 #define MT9P031=5FSHUTTER=5FDELAY				0x0c
 #define MT9P031=5FRST					0x0d
-#define		MT9P031=5FRST=5FENABLE			1
-#define		MT9P031=5FRST=5FDISABLE			0
+#define		MT9P031=5FRST=5FENABLE			BIT(0)
 #define MT9P031=5FREAD=5FMODE=5F1				0x1e
 #define MT9P031=5FREAD=5FMODE=5F2				0x20
-#define		MT9P031=5FREAD=5FMODE=5F2=5FROW=5FMIR		(1 << 15)
-#define		MT9P031=5FREAD=5FMODE=5F2=5FCOL=5FMIR		(1 << 14)
-#define		MT9P031=5FREAD=5FMODE=5F2=5FROW=5FBLC		(1 << 6)
+#define		MT9P031=5FREAD=5FMODE=5F2=5FROW=5FMIR		BIT(15)
+#define		MT9P031=5FREAD=5FMODE=5F2=5FCOL=5FMIR		BIT(14)
+#define		MT9P031=5FREAD=5FMODE=5F2=5FROW=5FBLC		BIT(6)
 #define MT9P031=5FROW=5FADDRESS=5FMODE			0x22
 #define MT9P031=5FCOLUMN=5FADDRESS=5FMODE			0x23
 #define MT9P031=5FGLOBAL=5FGAIN				0x35
 #define		MT9P031=5FGLOBAL=5FGAIN=5FMIN			8
 #define		MT9P031=5FGLOBAL=5FGAIN=5FMAX			1024
 #define		MT9P031=5FGLOBAL=5FGAIN=5FDEF			8
-#define		MT9P031=5FGLOBAL=5FGAIN=5FMULT		(1 << 6)
+#define		MT9P031=5FGLOBAL=5FGAIN=5FMULT		BIT(6)
 #define MT9P031=5FROW=5FBLACK=5FTARGET			0x49
 #define MT9P031=5FROW=5FBLACK=5FDEF=5FOFFSET			0x4b
 #define MT9P031=5FGREEN1=5FOFFSET				0x60
 #define MT9P031=5FGREEN2=5FOFFSET				0x61
 #define MT9P031=5FBLACK=5FLEVEL=5FCALIBRATION			0x62
-#define		MT9P031=5FBLC=5FMANUAL=5FBLC			(1 << 0)
+#define		MT9P031=5FBLC=5FMANUAL=5FBLC			BIT(0)
 #define MT9P031=5FRED=5FOFFSET				0x63
 #define MT9P031=5FBLUE=5FOFFSET				0x64
 #define MT9P031=5FTEST=5FPATTERN				0xa0
 #define		MT9P031=5FTEST=5FPATTERN=5FSHIFT		3
-#define		MT9P031=5FTEST=5FPATTERN=5FENABLE		(1 << 0)
-#define		MT9P031=5FTEST=5FPATTERN=5FDISABLE		(0 << 0)
+#define		MT9P031=5FTEST=5FPATTERN=5FENABLE		BIT(0)
 #define MT9P031=5FTEST=5FPATTERN=5FGREEN			0xa1
 #define MT9P031=5FTEST=5FPATTERN=5FRED			0xa2
 #define MT9P031=5FTEST=5FPATTERN=5FBLUE			0xa3
@@ -199,7 +197,7 @@ static int mt9p031=5Freset(struct mt9p031 *mt9p031)
 	ret =3D mt9p031=5Fwrite(client, MT9P031=5FRST, MT9P031=5FRST=5FENABLE);
 	if (ret < 0)
 		return ret;
-	ret =3D mt9p031=5Fwrite(client, MT9P031=5FRST, MT9P031=5FRST=5FDISABLE);
+	ret =3D mt9p031=5Fwrite(client, MT9P031=5FRST, 0);
 	if (ret < 0)
 		return ret;
=20
@@ -794,8 +792,7 @@ static int mt9p031=5Fs=5Fctrl(struct v4l2=5Fctrl *ctrl)
 			if (ret < 0)
 				return ret;
=20
-			return mt9p031=5Fwrite(client, MT9P031=5FTEST=5FPATTERN,
-					     MT9P031=5FTEST=5FPATTERN=5FDISABLE);
+			return mt9p031=5Fwrite(client, MT9P031=5FTEST=5FPATTERN, 0);
 		}
=20
 		ret =3D mt9p031=5Fwrite(client, MT9P031=5FTEST=5FPATTERN=5FGREEN, 0x05a0=
);
--=20
2.25.1

