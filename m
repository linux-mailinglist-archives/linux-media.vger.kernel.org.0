Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC7013FFF
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2019 16:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfEEOBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 May 2019 10:01:47 -0400
Received: from shell.v3.sk ([90.176.6.54]:55759 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727928AbfEEOBQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 May 2019 10:01:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id D2BE7103B0D;
        Sun,  5 May 2019 16:01:13 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id yw9AFyKl-U0e; Sun,  5 May 2019 16:00:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 64163103D29;
        Sun,  5 May 2019 16:00:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5MsybriK81eC; Sun,  5 May 2019 16:00:39 +0200 (CEST)
Received: from nedofet.lan (ip-89-102-31-34.net.upcbroadband.cz [89.102.31.34])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 32C6B103D2C;
        Sun,  5 May 2019 16:00:38 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v5 06/10] [media] marvell-ccic/mmp: enable clock before accessing registers
Date:   Sun,  5 May 2019 16:00:27 +0200
Message-Id: <20190505140031.9636-7-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505140031.9636-1-lkundrak@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The access to REG_CLKCTRL or REG_CTRL1 without the clock enabled hangs
the machine. Enable the clock first.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index a1b1d66e34cd9..352e67fc10621 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -144,6 +144,7 @@ static int mmpcam_power_up(struct mcam_camera *mcam)
  * Turn on power and clocks to the controller.
  */
 	mmpcam_power_up_ctlr(cam);
+	mcam_clk_enable(mcam);
 /*
  * Provide power to the sensor.
  */
@@ -157,8 +158,6 @@ static int mmpcam_power_up(struct mcam_camera *mcam)
 	gpio_set_value(pdata->sensor_reset_gpio, 1); /* reset is active low */
 	mdelay(5);
=20
-	mcam_clk_enable(mcam);
-
 	return 0;
 }
=20
--=20
2.21.0

