Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD91ADF41
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfD2JRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:17:06 -0400
Received: from shell.v3.sk ([90.176.6.54]:59238 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbfD2JRG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:17:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C7F19103685;
        Mon, 29 Apr 2019 11:16:58 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id KBELO8rOCpzy; Mon, 29 Apr 2019 11:16:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id E5BB8103692;
        Mon, 29 Apr 2019 11:16:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id s7BXmGS662Aw; Mon, 29 Apr 2019 11:16:40 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id A811C10367F;
        Mon, 29 Apr 2019 11:16:39 +0200 (CEST)
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
Subject: [PATCH v4 03/10] [media] marvell-ccic: don't generate EOF on parallel bus
Date:   Mon, 29 Apr 2019 11:16:25 +0200
Message-Id: <20190429091632.2462285-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429091632.2462285-1-lkundrak@v3.sk>
References: <20190429091632.2462285-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The commit 05fed81625bf ("[media] marvell-ccic: add MIPI support for
marvell-ccic driver") that claimed to add CSI2 turned on C0_EOF_VSYNC for
parallel bus without a very good explanation.

That broke camera on OLPC XO-1.75 which precisely uses a sensor on a
parallel bus. Revert that chunk.

Tested on an OLPC XO-1.75.

Fixes: 05fed81625bf755cc67c5864cdfd18b69ea828d1
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/me=
dia/platform/marvell-ccic/mcam-core.c
index d97f39bde9bd..d24e5b7a3bc5 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -792,12 +792,6 @@ static void mcam_ctlr_image(struct mcam_camera *cam)
 	 * Make sure it knows we want to use hsync/vsync.
 	 */
 	mcam_reg_write_mask(cam, REG_CTRL0, C0_SIF_HVSYNC, C0_SIFM_MASK);
-	/*
-	 * This field controls the generation of EOF(DVP only)
-	 */
-	if (cam->bus_type !=3D V4L2_MBUS_CSI2_DPHY)
-		mcam_reg_set_bit(cam, REG_CTRL0,
-				C0_EOF_VSYNC | C0_VEDGE_CTRL);
 }
=20
=20
--=20
2.21.0

