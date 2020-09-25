Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B31278231
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgIYIF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:05:57 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61920 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbgIYIF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601020245; x=1603612245;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=x5Pk/l2MiC1puFAoUsj9YgTJFrLM/W2OzlbBAh4xBcc=;
        b=aabP0zdtZPlT+FWbirhNwfjksCzPoc91adY+3d35kYVEAdu4FBuBT9JIQ0OI8VqC
        7wuDU/mGfgKyuWXOWLXrZ/Q43Qw9mvx2UkNL3a7ZUxKlRCupcvQEHxnQZZjk/dOJ
        KNj1vJAag77POiLvyYETgO/UPGs04f14QGicyxT7DnY=;
X-AuditID: c39127d2-269ff70000001c25-f4-5f6da1551b95
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 6D.A5.07205.551AD6F5; Fri, 25 Sep 2020 09:50:45 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092509504515-495332 ;
          Fri, 25 Sep 2020 09:50:45 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 3/5] media: mt9p031: Implement [gs]_register debug calls
Date:   Fri, 25 Sep 2020 09:50:27 +0200
Message-Id: <20200925075029.32181-3-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925075029.32181-1-s.riedmueller@phytec.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:45,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.09.2020 09:50:45
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBSzd0YW68wY4+EYu9xy6wWHROXMJu
        cXnXHDaLng1bWS2WbfrDZPFpyzcmBzaP2R0zWT02repk85h3MtBjxcr/TB6fN8kFsEZx2aSk
        5mSWpRbp2yVwZbzZc5WpoIO/YtO/VtYGxvs8XYycHBICJhKf701gBLGFBLYxSmw5WNDFyAVk
        X2OUePZrGztIgk3ASGLBtEYmEFtEwEKid9F0sAZmga+MEuvOZoPYwgIeEo2NK8DqWQRUJZYt
        6WQFsXkFbCROvf3GCLFMXmLmpe9gNZwCthJH355nglhsI/Fix19GiHpBiZMzn7CAHCEhcIVR
        ov/UDDaIZiGJ04vPMkMs1pZYtvA18wRGgVlIemYhSS1gZFrFKJSbmZydWpSZrVeQUVmSmqyX
        krqJERi8hyeqX9rB2DfH4xAjEwfjIUYJDmYlEd7jG3LihXhTEiurUovy44tKc1KLDzFKc7Ao
        ifNu4C0JExJITyxJzU5NLUgtgskycXBKNTAuvRvCLuG22kauZ6Z8d4Fu35+2Q2Zx7lXrPh0L
        ThDY2aGs8s989fMbv3fasogqZH1QWmwmeuiY+IxYwZzcL7M6Dcuc3fiX54m4PFawO1ItZ79v
        m9gXl7YzLY2fPMRVZn/6+EJwve3Kj86Mm2+xHQ3asJCT4Y9PuMaLxuj/ey9zLT17YovCvhIl
        luKMREMt5qLiRADUtBXmTAIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Implement g=5Fregister and s=5Fregister v4l2=5Fsubdev=5Fcore=5Fops to access
camera register directly from userspace for debug purposes.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ce192be4531f..f5d6a7890c47 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -703,6 +703,30 @@ static int mt9p031=5Frestore=5Fblc(struct mt9p031 *mt9=
p031)
 	return 0;
 }
=20
+#ifdef CONFIG=5FVIDEO=5FADV=5FDEBUG
+static int mt9p031=5Fg=5Fregister(struct v4l2=5Fsubdev *sd,
+			      struct v4l2=5Fdbg=5Fregister *reg)
+{
+	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(sd);
+	int ret;
+
+	ret =3D mt9p031=5Fread(client, reg->reg);
+	if (ret < 0)
+		return ret;
+
+	reg->val =3D ret;
+	return 0;
+}
+
+static int mt9p031=5Fs=5Fregister(struct v4l2=5Fsubdev *sd,
+			      struct v4l2=5Fdbg=5Fregister const *reg)
+{
+	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(sd);
+
+	return mt9p031=5Fwrite(client, reg->reg, reg->val);
+}
+#endif
+
 static int mt9p031=5Fs=5Fctrl(struct v4l2=5Fctrl *ctrl)
 {
 	struct mt9p031 *mt9p031 =3D
@@ -1000,6 +1024,10 @@ static int mt9p031=5Fclose(struct v4l2=5Fsubdev *sub=
dev, struct v4l2=5Fsubdev=5Ffh *fh)
=20
 static const struct v4l2=5Fsubdev=5Fcore=5Fops mt9p031=5Fsubdev=5Fcore=5Fo=
ps =3D {
 	.s=5Fpower        =3D mt9p031=5Fset=5Fpower,
+#ifdef CONFIG=5FVIDEO=5FADV=5FDEBUG
+	.s=5Fregister	=3D mt9p031=5Fs=5Fregister,
+	.g=5Fregister	=3D mt9p031=5Fg=5Fregister,
+#endif
 };
=20
 static const struct v4l2=5Fsubdev=5Fvideo=5Fops mt9p031=5Fsubdev=5Fvideo=
=5Fops =3D {
--=20
2.25.1

