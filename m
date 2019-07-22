Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3F16FEC3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 13:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbfGVLds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 07:33:48 -0400
Received: from shell.v3.sk ([90.176.6.54]:59556 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728823AbfGVLdr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 07:33:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A7EA9493BC;
        Mon, 22 Jul 2019 13:33:44 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id XcO2OS7kd5o7; Mon, 22 Jul 2019 13:33:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 8462D493BD;
        Mon, 22 Jul 2019 13:33:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SDNL2wXi2afC; Mon, 22 Jul 2019 13:33:40 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5D13B493BC;
        Mon, 22 Jul 2019 13:33:40 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] media: marvell-ccic: mmp: add MODULE_DEVICE_TABLE
Date:   Mon, 22 Jul 2019 13:33:10 +0200
Message-Id: <20190722113310.719399-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes autoloading the module by the OF compatible string.

Fixes: 83c40e6611ec ("media: marvell-ccic/mmp: add devicetree support")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 10559492e09ed..92b92255dac66 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -372,6 +372,7 @@ static const struct of_device_id mmpcam_of_match[] =3D=
 {
 	{ .compatible =3D "marvell,mmp2-ccic", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, mmpcam_of_match);
=20
 static struct platform_driver mmpcam_driver =3D {
 	.probe		=3D mmpcam_probe,
--=20
2.21.0

