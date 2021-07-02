Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D4B3B9EB4
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhGBKCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:02:07 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55530 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbhGBKB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219964; x=1627811964;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MfDh1elcmtubGEkIf/niQl0eKkFxqT3rHEFU5MzWt8c=;
        b=hiorjg7GOSVsodHMet9jdop5W948equtlyQk0yKfc2bgBCKgDlskLyBIollJ5wSR
        OuLRAV4hjwgEtGtITOsvsfMYTumsAsIHDBfDmsXzvArsFwfTkmpLKurewszw1Qxh
        QsY2xkxVUCjt75c1fNUZ+tiaE3aDDNuklzU3tV9WQRo=;
X-AuditID: c39127d2-a9fbd70000001c5e-80-60dee37c2f12
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 17.01.07262.C73EED06; Fri,  2 Jul 2021 11:59:24 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592418-1081051 ;
          Fri, 2 Jul 2021 11:59:24 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 6/6] media: mt9p031: Use BIT macro
Date:   Fri, 2 Jul 2021 11:59:22 +0200
Message-Id: <20210702095922.118614-7-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRoCBS7fm8b0Eg4l/VS3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgypjatIqpYKdYRf+k/cwNjE3CXYycHBICJhIvLrxj6mLk4hAS2MYocfTaJyjn
        GqPE276zzCBVbAJGEgumNTKB2CICURI/z/ewgNjMAg8YJfa/SgCxhQVMJTZNWwdWwyKgIrHn
        /VI2EJtXwFbizf5DjBDb5CVmXvrODmJzCthJnLl5FGyOEFDN0f5frBD1ghInZz5hATlCQuAK
        o8TU49+ZIZqFJE4vhjiIWUBbYtnC18wTGAVmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZlSWqy
        XkrqJkZg+B6eqH5pB2PfHI9DjEwcjIcYJTiYlUR4Q+fdSxDiTUmsrEotyo8vKs1JLT7EKM3B
        oiTOu4G3JExIID2xJDU7NbUgtQgmy8TBKdXAGPusbtVlLXaTQMnSqBW7hedsinhxzjVadNWP
        Iyt3pGTmf6+tTb1buu+wMkOcge2PjlK/wOnyRV48zY4FB+smd/87uHODnexkJeHCMtYW0b7j
        J41ear156/xsw92yAK6zJ8u+7l/ieTVwz6fPkpLFX85ktut3Sh5e/Fo53SkrY7VRQgzPW54A
        JZbijERDLeai4kQAY4gW2U0CAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of the BIT macro for setting individual bits. This improves
readability and safety with respect to shifts.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 3511c4ff350d..0a5bcbebe55f 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -76,39 +76,39 @@
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
 #define		MT9P031=5FRST=5FENABLE			1
 #define		MT9P031=5FRST=5FDISABLE			0
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
+#define		MT9P031=5FTEST=5FPATTERN=5FENABLE		BIT(0)
 #define		MT9P031=5FTEST=5FPATTERN=5FDISABLE		(0 << 0)
 #define MT9P031=5FTEST=5FPATTERN=5FGREEN			0xa1
 #define MT9P031=5FTEST=5FPATTERN=5FRED			0xa2
--=20
2.25.1

