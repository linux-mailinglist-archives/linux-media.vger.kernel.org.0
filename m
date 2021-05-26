Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C39391A5D
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 16:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbhEZOhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 10:37:24 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50246 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234894AbhEZOhP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 10:37:15 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 8FFE54076B20;
        Wed, 26 May 2021 14:35:26 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Leon Romanovsky <leon@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: marvell-ccic: set error code in probe
Date:   Wed, 26 May 2021 17:35:06 +0300
Message-Id: <20210526143506.6945-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When i2c_new_client_device() fails, cafe_pci_probe() cleans up all
resources and returns 0. The patch sets the error code on the
corresponding path.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/platform/marvell-ccic/cafe-driver.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index baac86f3d153..9aa374fa8b36 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -486,6 +486,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	struct cafe_camera *cam;
 	struct mcam_camera *mcam;
 	struct v4l2_async_subdev *asd;
+	struct i2c_client *i2c_dev;
 
 	/*
 	 * Start putting together one of our big camera structures.
@@ -561,11 +562,16 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	clkdev_create(mcam->mclk, "xclk", "%d-%04x",
 		i2c_adapter_id(cam->i2c_adapter), ov7670_info.addr);
 
-	if (!IS_ERR(i2c_new_client_device(cam->i2c_adapter, &ov7670_info))) {
-		cam->registered = 1;
-		return 0;
+	i2c_dev = i2c_new_client_device(cam->i2c_adapter, &ov7670_info);
+	if (IS_ERR(i2c_dev)) {
+		ret = PTR_ERR(i2c_dev);
+		goto out_mccic_shutdown;
 	}
 
+	cam->registered = 1;
+	return 0;
+
+out_mccic_shutdown:
 	mccic_shutdown(mcam);
 out_smbus_shutdown:
 	cafe_smbus_shutdown(cam);
-- 
2.26.2

