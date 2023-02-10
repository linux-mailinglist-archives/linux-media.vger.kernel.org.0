Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4278D692A9D
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 23:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjBJW4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 17:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBJW4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 17:56:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FE62BF23;
        Fri, 10 Feb 2023 14:56:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD558886;
        Fri, 10 Feb 2023 23:56:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676069787;
        bh=X0WNXLVARzL1ats4vw1Zei4+47i/xaoDhB/JnKfMavw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UbrsfxhIqoKrYIvUs9BtO3JlFS65iBgZCCrAYvPEmtW6FvhyHfVkBctsW58G8vL6J
         Q6cLfeblIOI86jvwW7QhP60QdYz4yuD36z9eHuvUz89j6GpwqnDA0X8Y8NS8J801K9
         niD41NJGrDm9XH+6oLVU+dH+lIcHuNLEd7maZVVg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media: i2c: adv7604: Fix range of hue control
Date:   Sat, 11 Feb 2023 00:56:22 +0200
Message-Id: <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ADV7604, ADV7611 and ADV7612 software manuals different the CP_HUE
value differently:

- For ADV7604 and ADV7611, the hue is specified as an unsigned 8-bit
  value, and calculated as

  (CP_HUE[7:0] * 180) / 256 - 90

  with the range set to [-90°, 90°]. Additionally, the values 0x00, 0x0f
  and 0xff are documented as corresponding to -90°, 0° and 90°
  respectively.

- For ADV7612, the hue is specified as a signed 8-bit value in the range
  [0°, 360°[ without any formula. Additionally, the value 0x00 is
  documented as corresponding to 0°.

The ADV7604 and ADV7611 documentation is clearly wrong as the example
values don't correspond to the formula. Furthermore, the [-90°, 90°]
range seems incorrect as it would cover only half of the hue space.

The ADV7612 documentation is better, although the range should likely be
[-180°, 180°[ if the value is signed. Given that the values wrap around,
this makes no difference in practice.

The hue values have been verified on ADV7612 to follow the
documentation. There is a high chance they do as well on ADV7604 and
ADV7611.

In any case, all software manuals document the register as 8-bit, so the
current range of the V4L2 hue control [0, 128] is not correct. Expand it
to cover the full 8-bit space, using unsigned values to avoid breaking
any application that may rely on 128 being a valid value.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7604.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 3af0e67f9edb..3d0898c4175e 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3548,7 +3548,7 @@ static int adv76xx_probe(struct i2c_client *client)
 	v4l2_ctrl_new_std(hdl, &adv76xx_ctrl_ops,
 			V4L2_CID_SATURATION, 0, 255, 1, 128);
 	v4l2_ctrl_new_std(hdl, &adv76xx_ctrl_ops,
-			V4L2_CID_HUE, 0, 128, 1, 0);
+			V4L2_CID_HUE, 0, 255, 1, 0);
 	ctrl = v4l2_ctrl_new_std_menu(hdl, &adv76xx_ctrl_ops,
 			V4L2_CID_DV_RX_IT_CONTENT_TYPE, V4L2_DV_IT_CONTENT_TYPE_NO_ITC,
 			0, V4L2_DV_IT_CONTENT_TYPE_NO_ITC);
-- 
Regards,

Laurent Pinchart

