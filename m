Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D136482838
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbiAAS2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbiAAS2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:22 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 083041C5E;
        Sat,  1 Jan 2022 19:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061701;
        bh=cC05pikczMfCTTejBalLAeTBNCIgo7s5Ewq7sBic6co=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RlMDieVDtUBbeIj/ElXRXtut9fZhpj1eBDyS8t1afgEQUkZXqK0OAmBk3Qiwa/Ar+
         bcn/yoEsMnlN3UdWFfD6H6XUiLWHh4dfFGP5fzba/Zlmq6kR+QD6nJAlwE++AFHT4j
         IAzChoTwBJdgSV9zHc2Sok7xkBWdueljuj5SFbSQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 11/11] media: i2c: max9286: Select HS as data enable signal
Date:   Sat,  1 Jan 2022 20:28:06 +0200
Message-Id: <20220101182806.19311-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 drivers/media/i2c/max9286.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 07ebb01640a1..446fc238d642 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -563,9 +563,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
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

