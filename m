Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A9364D39A
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiLNXjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiLNXis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D5441989;
        Wed, 14 Dec 2022 15:38:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE5434D5;
        Thu, 15 Dec 2022 00:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061125;
        bh=XVEqCGIwarRNwN7it8NKpxDY8sBziUghL0SqdxN6erI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nL/pkPLnkpk7ACK/AvLXM2tW6ifOIJYwiRHtBdxEkIJo3ZLr4zk4GNmOQWjp8u8q2
         KSYo50iBu9fI9fGs67JPTWwnVYk/5a5Vd7QCEj3LvwE/jmi0id1bcIVqBHgQYE4YDs
         OmwZ4PTCeLMatGDObTmTl9/eWMu3JL+q1FCki89U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 11/12] media: i2c: max9286: Select HS as data enable signal
Date:   Thu, 15 Dec 2022 01:38:24 +0200
Message-Id: <20221214233825.13050-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GMSL can transport three synchronization signals: VSync, HSync and Data
Enable. The MAX9286 can select either HS or DE as a line valid signal.

Not all serializers (and transmission formats) support the DE signal.
The MAX9271, used by the RDACM20 and RDACM21 cameras, doesn't document
DE support. Nonetheless, the max9286 driver selects the DE signal as
line valid in register 0x0c (by not setting the DESEL bit). It's not
clear why this works. As HS is a more common line valid qualifier, set
the DESEL bit by default. This is needed to support the onsemi MARS
cameras.

If a camera requires usage of the DE signal in the future, this will
need to be made configurable.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo@jmondi.org> # On Eagle V3M with RDACM20
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 125b4d434f57..58cd2ff49e08 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -567,9 +567,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
 		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
 		      info->datatype);
 
-	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
-	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
-		      MAX9286_HVSRC_D14);
+	/*
+	 * Enable HS/VS encoding, use HS as line valid source, use D14/15 for
+	 * HS/VS, invert VS.
+	 */
+	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_DESEL |
+		      MAX9286_INVVS | MAX9286_HVSRC_D14);
 }
 
 static void max9286_set_fsync_period(struct max9286_priv *priv)
-- 
Regards,

Laurent Pinchart

