Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD48F27E72C
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbgI3Kvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:51:55 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Kvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601463108; x=1604055108;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EBbV7tZj+aMHE+es+7w9+LXsXZ9jLst9SC6njbjHeSk=;
        b=iGNY+yHmYmHs5Onap3bi9z3z7exnPgR0U5bjBeL1WmjgnGIKDks5uHA7Ac4T4dU0
        wuwpM0benMOUYD6kX2kj6DqIZn887MNb6Xcuz75+nDX6espZCOEtxCUgl3m4qL1H
        NTiQJoOV2k/v316Uo+SbWan5WfIoMUo+UsphBX0V24Y=;
X-AuditID: c39127d2-269ff70000001c25-d3-5f7463445290
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id BE.89.07205.443647F5; Wed, 30 Sep 2020 12:51:48 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012514771-526325 ;
          Wed, 30 Sep 2020 12:51:47 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 3/5] media: mt9p031: Implement [gs]_register debug calls
Date:   Wed, 30 Sep 2020 12:51:31 +0200
Message-Id: <20200930105133.139981-3-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930105133.139981-1-s.riedmueller@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:47,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:47
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWyRoCBS9cluSTe4NQlRou9xy6wWHROXMJu
        cXnXHDaLng1bWS2WbfrDZPFpyzcmBzaP2R0zWT02repk85h3MtBjxcr/TB6fN8kFsEZx2aSk
        5mSWpRbp2yVwZXRfP81aMJ+/YtuUTawNjO95uhg5OSQETCSWzFjBCGILCWxjlDjQltDFyAVk
        X2OU2NA/iw0kwSZgJLFgWiMTiC0iYCHRu2g6WAOzwFdGiXVns0FsYQFvibPLX7OD2CwCqhIv
        JswAq+cVsJVY/m87C8QyeYmZl76D1XAK2Emcvv+LtYuRA2iZrcTFyVkQ5YISJ2c+YQG5QULg
        CqPE1pUXmCF6hSROLz7LDLFXW2LZwtfMExgFZiHpmYUktYCRaRWjUG5mcnZqUWa2XkFGZUlq
        sl5K6iZGYOgenqh+aQdj3xyPQ4xMHIyHGCU4mJVEeA8llsQL8aYkVlalFuXHF5XmpBYfYpTm
        YFES593AWxImJJCeWJKanZpakFoEk2Xi4JRqYNzD27rj0g6V/hVNDeYcVjJbD2yu6PonEPBq
        c7f0/KAYxnvW/64Ftb77n+EcKK/Qk3gs7bhF9MEm4YIfrqsZ5fw1Ps7I1PxsekIy8OFmBmON
        1+In75epf2D6r/Wi9Nek2hseby5azoxY/zMn0H2esPqf/JJ7VRtN/y08X3nnhZLqR/+mCM1j
        65VYijMSDbWYi4oTAdQ8ZrdLAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Implement g=5Fregister and s=5Fregister v4l2=5Fsubdev=5Fcore=5Fops to access
camera register directly from userspace for debug purposes.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
No changes in v2
---
 drivers/media/i2c/mt9p031.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index b4c042f418c1..de36025260a8 100644
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

