Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCC2692A9C
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 23:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBJW43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 17:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBJW42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 17:56:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F4826599;
        Fri, 10 Feb 2023 14:56:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE99D8BE;
        Fri, 10 Feb 2023 23:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676069786;
        bh=rSU6WL8A5pxiiE+CsZ9jMEQVB0gtoTz7fBtsgzNw8tQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hwbd1fjWuxOYWfYyl2lbxS2OS4TrcjAiwvPDVFla0uKLzIZN7O2baE4C2iw8eWHR3
         nb/q3oEO+Fp8fN//mJHc2m049j8X+R3u1shfoTkbxhoZJV82TgSUDQk3k+i+99rzZj
         QZB2gVTHmpHg4i399mHTkYqrpTyhk8sMJoG1fa3M=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] media: i2c: adv7604: Enable video adjustment
Date:   Sat, 11 Feb 2023 00:56:21 +0200
Message-Id: <20230210225622.24411-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
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

The video adjustments (contrast, brightness, saturation and hue) are
ignored by default by the device when the VID_ADJ_EN bit is clear. The
corresponding V4L2 controls exposed by the drivers have thus no effect.
Fix this by setting the VID_ADJ_EN bit.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7604.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 9d218962d7c8..3af0e67f9edb 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1805,6 +1805,9 @@ static void select_input(struct v4l2_subdev *sd)
 		v4l2_dbg(2, debug, sd, "%s: Unknown port %d selected\n",
 				__func__, state->selected_input);
 	}
+
+	/* Enable video adjustment (contrast, saturation, brightness and hue) */
+	cp_write_clr_set(sd, 0x3e, 0x80, 0x80);
 }
 
 static int adv76xx_s_routing(struct v4l2_subdev *sd,
-- 
Regards,

Laurent Pinchart

