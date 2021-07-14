Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002BA3C8575
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhGNNlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:47 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56700 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhGNNlp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269930; x=1628861930;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qN6QTxTTKZhnbCx2gpq04CN4bCn0nWKxKQ/ztel5F0Q=;
        b=Hr8IDNoSA8mqF6jN4MkG8qhN5XEtwlzPUj8o9TtUgEG2VNwbqOAIICAMymKVB8B2
        +wjtQrSNJ9IuLpwOuRWh1NBAtB1iFgVySZv4o2yAmMp88WMy7Qwd996vDoF2neFl
        OANntsCkU4IhrCZ2wR/OYrgtkNx/jfQZW66jqN6PHto=;
X-AuditID: c39127d2-1e4f970000001daf-24-60eee8ead8d4
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 9C.57.07599.AE8EEE06; Wed, 14 Jul 2021 15:38:50 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415385038-1154291 ;
          Wed, 14 Jul 2021 15:38:50 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] media: mt9p031: Use BIT macro
Date:   Wed, 14 Jul 2021 15:38:47 +0200
Message-Id: <20210714133849.1041619-5-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS/fVi3cJBqs/G1jMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAlXHk5Wq2gp2yFWsfHmFrYHwi0cXIySEhYCLx6/Qpli5GLg4hgW2MEv+W72WD
        cC4wSvxtvcMCUsUmYCSxYFojE0hCRKCNUWLHkWYwh1lgC6PE9MvL2UCqhAVMJTb9ncwKYrMI
        qEr83t0HVMTBwStgJ3F0YyLEOnmJmZe+s4PYnAL2Et1H/4EtEAIquXN5PiOIzSsgKHFy5hOw
        kyQErjBK3F33nBGiWUji9OKzzCA2s4C2xLKFr5knMArMQtIzC0lqASPTKkah3Mzk7NSizGy9
        gozKktRkvZTUTYzAAD48Uf3SDsa+OR6HGJk4GA8xSnAwK4nwLjV6myDEm5JYWZValB9fVJqT
        WnyIUZqDRUmcdwNvSZiQQHpiSWp2ampBahFMlomDU6qBce1zqcAb+bY8KdGyL/rYJTWfX/6z
        pDd5mf/7sLS2uJl3MnoScpZOuT4jdYH+MwfNw54zMnrPHFbbd+OF9bZN1d9tGp/eWpayuEqE
        7YnXmvbEicmnXR80phpbdR+J+p0WkyF65a5WEgPXjltix845Tt79w02zPvDfqocF4gmRC/9+
        PzbPYvanm0osxRmJhlrMRcWJAL6XkuBOAgAA
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

