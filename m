Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCC73C856D
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhGNNlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:44 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56718 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbhGNNln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269930; x=1628861930;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BkdkwmiGogTIJ3tL5zily69sBf7WMKTObrHPm+hw5mQ=;
        b=R2Gf5/K3uks2BR8+BP0f95/ZK5fP3yFG05o1EbKS0o8F//0ZQcqXJRBnTuIBEwCW
        3gbTLjNoFO7NzV75pKZ3A4au4836s9lEMKsvNUJeb1pdfZhDQMdTyxYkk5bjAsUf
        iH1xpyd15El+3pBwIwKFppXa4ieCGaudum0ELaOEeDI=;
X-AuditID: c39127d2-1d8f870000001daf-1c-60eee8e959f5
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 6A.57.07599.9E8EEE06; Wed, 14 Jul 2021 15:38:49 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415384960-1154288 ;
          Wed, 14 Jul 2021 15:38:49 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] media: mt9p031: Read back the real clock rate
Date:   Wed, 14 Jul 2021 15:38:44 +0200
Message-Id: <20210714133849.1041619-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714133849.1041619-1-s.riedmueller@phytec.de>
References: <20210714133849.1041619-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:49,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:49
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWyRoCBS/fli3cJBmem2VjMP3KO1WLvsQss
        Fp0Tl7BbXN41h82iZ8NWVotlm/4wWbTuPcJu8WnLNyYHDo/ZHTNZPTat6mTzmHcy0GPFyv9M
        Hp83yQWwRnHZpKTmZJalFunbJXBlTGr6zF5wiL/i58TrTA2MHbxdjJwcEgImEl03LjOB2EIC
        2xglPl7h6mLkArIvMEpcbzzPCpJgEzCSWDCtkQkkISLQxiix40gzmMMs8JRR4sGth+wgVcIC
        rhKT7s8EG8UioCrx5M0KZhCbV8BOYsq2XywQ6+QlZl76DlbPKWAv0X30HwvEajuJO5fnM0LU
        C0qcnPmEBWSBhMAVRomFOzYwQjQLSZxefBZsKLOAtsSyha+ZJzAKzELSMwtJagEj0ypGodzM
        5OzUosxsvYKMypLUZL2U1E2MwKA+PFH90g7GvjkehxiZOBgPMUpwMCuJ8C41epsgxJuSWFmV
        WpQfX1Sak1p8iFGag0VJnHcDb0mYkEB6YklqdmpqQWoRTJaJg1OqgVHlwPm25ZMm3v+q1P1X
        PeTKy/LfTv7C339l7HwZdKB1e4us4vc9/fc+iO4UzxINNrm0ZC5n68000wvTsxzCJbb+zNfy
        MHihNq99S6Hf6abZ9+b386XMSEi4MGnt/kUz/d86X35vluyw/9ev+MacJUln1G/6JrZbe+2O
        XcgqO2v+C3bbloMPxFmVWIozEg21mIuKEwEZlgjbWAIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The real and requested clock can differ and because it is used to
calculate PLL values, the real clock rate should be read.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9p031.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 6eb88ef99783..9dea7c813852 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -229,6 +229,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
1)
=20
 	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(&mt9p031->subdev);
 	struct mt9p031=5Fplatform=5Fdata *pdata =3D mt9p031->pdata;
+	unsigned long ext=5Ffreq;
 	int ret;
=20
 	mt9p031->clk =3D devm=5Fclk=5Fget(&client->dev, NULL);
@@ -239,13 +240,15 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p=
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
@@ -254,7 +257,7 @@ static int mt9p031=5Fclk=5Fsetup(struct mt9p031 *mt9p03=
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

