Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80782247A63
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgHQW04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:26:56 -0400
Received: from mail.v3.sk ([167.172.186.51]:54080 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726706AbgHQW0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:26:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id E881EDFA6D;
        Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id nYpoqF5w-xba; Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 15BC4DF98E;
        Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BO-Okhu1VpfZ; Mon, 17 Aug 2020 22:08:00 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id CFE69DF880;
        Mon, 17 Aug 2020 22:08:00 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 1/4] media: cafe-driver: use drvdata instead of back-casting from v4l2_device
Date:   Tue, 18 Aug 2020 00:08:47 +0200
Message-Id: <20200817220850.401287-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220850.401287-1-lkundrak@v3.sk>
References: <20200817220850.401287-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit commit 95db3a60e065 ("[media] v4l: Add a media_device pointe=
r
to the v4l2_device structure") the v4l core doesn't insist on using drvda=
ta
itself.  Therefore we can use it ourselves, making things somewhat simple=
r.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes since v1:
- Added this patch

 drivers/media/platform/marvell-ccic/cafe-driver.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/=
media/platform/marvell-ccic/cafe-driver.c
index 58b9915ac7a40..00f623d62c962 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -497,6 +497,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	cam =3D kzalloc(sizeof(struct cafe_camera), GFP_KERNEL);
 	if (cam =3D=3D NULL)
 		goto out;
+	pci_set_drvdata(pdev, cam);
 	cam->pdev =3D pdev;
 	mcam =3D &cam->mcam;
 	mcam->chip_id =3D MCAM_CAFE;
@@ -592,8 +593,7 @@ static void cafe_shutdown(struct cafe_camera *cam)
=20
 static void cafe_pci_remove(struct pci_dev *pdev)
 {
-	struct v4l2_device *v4l2_dev =3D dev_get_drvdata(&pdev->dev);
-	struct cafe_camera *cam =3D to_cam(v4l2_dev);
+	struct cafe_camera *cam =3D pci_get_drvdata(pdev);
=20
 	if (cam =3D=3D NULL) {
 		printk(KERN_WARNING "pci_remove on unknown pdev %p\n", pdev);
@@ -609,8 +609,7 @@ static void cafe_pci_remove(struct pci_dev *pdev)
  */
 static int __maybe_unused cafe_pci_suspend(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev =3D dev_get_drvdata(dev);
-	struct cafe_camera *cam =3D to_cam(v4l2_dev);
+	struct cafe_camera *cam =3D dev_get_drvdata(dev);
=20
 	mccic_suspend(&cam->mcam);
 	return 0;
@@ -619,8 +618,7 @@ static int __maybe_unused cafe_pci_suspend(struct dev=
ice *dev)
=20
 static int __maybe_unused cafe_pci_resume(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev =3D dev_get_drvdata(dev);
-	struct cafe_camera *cam =3D to_cam(v4l2_dev);
+	struct cafe_camera *cam =3D dev_get_drvdata(dev);
=20
 	cafe_ctlr_init(&cam->mcam);
 	return mccic_resume(&cam->mcam);
--=20
2.26.2

