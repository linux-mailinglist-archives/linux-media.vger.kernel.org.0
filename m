Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457B0247A69
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgHQW04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:26:56 -0400
Received: from mail.v3.sk ([167.172.186.51]:54086 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726723AbgHQW0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:26:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id F13F6DFA73;
        Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JZ39Lz8SXlAM; Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 0E6F9DFA75;
        Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ormwiH9akP9X; Mon, 17 Aug 2020 22:08:02 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id D17F2DF880;
        Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 3/4] media: marvell-ccic: mmp: use generic dev_pm_ops
Date:   Tue, 18 Aug 2020 00:08:49 +0200
Message-Id: <20200817220850.401287-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220850.401287-1-lkundrak@v3.sk>
References: <20200817220850.401287-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This simplifies things a bit and makes adding runtime PM a more
straightforward.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes since v1:
- Added this patch

 .../media/platform/marvell-ccic/mmp-driver.c   | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index f04c01bced2f0..78263e746cad2 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -303,26 +303,23 @@ static int mmpcam_platform_remove(struct platform_d=
evice *pdev)
 /*
  * Suspend/resume support.
  */
-#ifdef CONFIG_PM
=20
-static int mmpcam_suspend(struct platform_device *pdev, pm_message_t sta=
te)
+static int mmpcam_suspend(struct device *dev)
 {
-	struct mmp_camera *cam =3D platform_get_drvdata(pdev);
+	struct mmp_camera *cam =3D dev_get_drvdata(dev);
=20
-	if (state.event !=3D PM_EVENT_SUSPEND)
-		return 0;
 	mccic_suspend(&cam->mcam);
 	return 0;
 }
=20
-static int mmpcam_resume(struct platform_device *pdev)
+static int mmpcam_resume(struct device *dev)
 {
-	struct mmp_camera *cam =3D platform_get_drvdata(pdev);
+	struct mmp_camera *cam =3D dev_get_drvdata(dev);
=20
 	return mccic_resume(&cam->mcam);
 }
=20
-#endif
+static SIMPLE_DEV_PM_OPS(mmpcam_pm_ops, mmpcam_suspend, mmpcam_resume);
=20
 static const struct of_device_id mmpcam_of_match[] =3D {
 	{ .compatible =3D "marvell,mmp2-ccic", },
@@ -333,13 +330,10 @@ MODULE_DEVICE_TABLE(of, mmpcam_of_match);
 static struct platform_driver mmpcam_driver =3D {
 	.probe		=3D mmpcam_probe,
 	.remove		=3D mmpcam_platform_remove,
-#ifdef CONFIG_PM
-	.suspend	=3D mmpcam_suspend,
-	.resume		=3D mmpcam_resume,
-#endif
 	.driver =3D {
 		.name	=3D "mmp-camera",
 		.of_match_table =3D of_match_ptr(mmpcam_of_match),
+		.pm =3D &mmpcam_pm_ops,
 	}
 };
=20
--=20
2.26.2

