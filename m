Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5911D7E05
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 18:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgERQMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 12:12:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgERQMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 12:12:06 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A57E6258;
        Mon, 18 May 2020 18:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589818324;
        bh=3KOO56tvSe4Uzbml8wVaWf6Cx3GmcFPTgACUgJyykQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g/tfbolp3NoUepBm9dwEUzWb/x0r1LfzkxEGQMCzDkQfRnaA1j5BaGPHoxWsazCCZ
         6SMmqiNrjROoXL2WNapZIIYdb5ulNPTanl5BaPmiILVtuTj2xYSnpzjjel9op51VtD
         0UXYjne3omFETNRuvuAtGkJ7Ah2yFhBx/WrBnipk=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] fixes! [max9286]: Validate link formats
Date:   Mon, 18 May 2020 17:11:59 +0100
Message-Id: <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
References: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Disallow setting a format on the source link, but enable link validation
by returning the format of the first bound source when getting the
format of the source pad.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ef824d2b26b8..6c01595936d7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -711,7 +711,10 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
 
-	if (format->pad >= MAX9286_SRC_PAD)
+	/* \todo: Multiplexed streams support
+	 * Prevent setting the format on the shared multiplexed bus.
+	 */
+	if (format->pad == MAX9286_SRC_PAD)
 		return -EINVAL;
 
 	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
@@ -743,11 +746,17 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
+	unsigned int pad = format->pad;
 
-	if (format->pad >= MAX9286_SRC_PAD)
-		return -EINVAL;
+	/* \todo: Multiplexed Stream Support
+	 * Support link validation by returning the format of the first bound
+	 * link. All links must have the same format, as we do not support
+	 * mixing, and matching of cameras connected to the max9286.
+	 */
+	if (format->pad == MAX9286_SRC_PAD)
+		pad = ffs(priv->bound_sources);
 
-	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
+	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
 	if (!cfg_fmt)
 		return -EINVAL;
 
-- 
2.25.1

