Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F405A27E724
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgI3Kvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:51:45 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58446 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729205AbgI3Kvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601463099; x=1604055099;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dzg7oLQPWCGjeAIksjtJZdy7ElG4yvKdUuApBlBIjbg=;
        b=c78Wx227XDwx+Z777O6T43ECjiHQtO+Cjxw2YJWXsVMi6+MWGUnA6OoNLUPM5FG2
        RBsSHepIYKGN4U+5HnZcT8w/8/9VHzTOEV7awSaBNXYudCK2FRC/2K5oXAPnOV9f
        B3p2s7tocVT98iDi33jQKqVGRJHKi82ljqeqwI7hvPk=;
X-AuditID: c39127d2-269ff70000001c25-d0-5f74633b52a9
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0E.89.07205.B33647F5; Wed, 30 Sep 2020 12:51:39 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012513957-526322 ;
          Wed, 30 Sep 2020 12:51:39 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 2/5] media: mt9p031: Read back the real clock rate
Date:   Wed, 30 Sep 2020 12:51:30 +0200
Message-Id: <20200930105133.139981-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930105133.139981-1-s.riedmueller@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:39,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:51:39
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWyRoCBS9c6uSTeYFGnqcXeYxdYLDonLmG3
        uLxrDptFz4atrBbLNv1hsvi05RuTA5vH7I6ZrB6bVnWyecw7GeixYuV/Jo/Pm+QCWKO4bFJS
        czLLUov07RK4Mk52cBRM4694tfs/UwPjLZ4uRg4OCQETiSc7lLoYOTmEBLYxSnz6E93FyAVk
        X2OUWPbqMgtIgk3ASGLBtEYmEFtEwEKid9F0RhCbWeAro8S6s9kgtrCAq0R/xzFmEJtFQFXi
        5J5pbCA2r4CtxIxjv1lBbAkBeYmZl76zg9icAnYSp+//YgW5QQio5uLkLIhyQYmTM5+wgNwg
        IXCFUeLCxhVQvUISpxefZYbYqy2xbOFr5gmMArOQ9MxCklrAyLSKUSg3Mzk7tSgzW68go7Ik
        NVkvJXUTIzBsD09Uv7SDsW+OxyFGJg7GQ4wSHMxKIryHEkvihXhTEiurUovy44tKc1KLDzFK
        c7AoifNu4C0JExJITyxJzU5NLUgtgskycXBKNTDGyXVyGnc/0Do57YLIHo5Jm3qNymen/imY
        1j577sbr+zcKhdZt2j63+EHKl7bkPR78bgEZJ1zFthQee+Rc9OtWHXdIo7NzRFQdV9/xyVMs
        F6tMY1xk/9Lt9NniVyHx50xvGinlrK1Y8rNoca7jjSC9tZsfbSiI/p4+QTvozYPtP78y/att
        WVGtxFKckWioxVxUnAgA9L/RdUkCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The real and requested clock can differ and because it is used to
calculate PLL values, the real clock rate should be read.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
No changes in v2
---
 drivers/media/i2c/mt9p031.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 2e6671ef877c..b4c042f418c1 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -255,6 +255,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
=20
 	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(&mt9p031->subdev);
 	struct mt9p031=5Fplatform=5Fdata *pdata =3D mt9p031->pdata;
+	unsigned long ext=5Ffreq;
 	int ret;
=20
 	mt9p031->clk =3D devm=5Fclk=5Fget(&client->dev, NULL);
@@ -265,13 +266,15 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p=
031)
 	if (ret < 0)
 		return ret;
=20
+	ext=5Ffreq =3D clk=5Fget=5Frate(mt9p031->clk);
+
 	/* If the external clock frequency is out of bounds for the PLL use the
 	 * pixel clock divider only and disable the PLL.
 	 */
-	if (pdata->ext=5Ffreq > limits.ext=5Fclock=5Fmax) {
+	if (ext=5Ffreq > limits.ext=5Fclock=5Fmax) {
 		unsigned int div;
=20
-		div =3D DIV=5FROUND=5FUP(pdata->ext=5Ffreq, pdata->target=5Ffreq);
+		div =3D DIV=5FROUND=5FUP(ext=5Ffreq, pdata->target=5Ffreq);
 		div =3D roundup=5Fpow=5Fof=5Ftwo(div) / 2;
=20
 		mt9p031->clk=5Fdiv =3D min=5Ft(unsigned int, div, 64);
@@ -280,7 +283,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
 		return 0;
 	}
=20
-	mt9p031->pll.ext=5Fclock =3D pdata->ext=5Ffreq;
+	mt9p031->pll.ext=5Fclock =3D ext=5Ffreq;
 	mt9p031->pll.pix=5Fclock =3D pdata->target=5Ffreq;
 	mt9p031->use=5Fpll =3D true;
=20
--=20
2.25.1

