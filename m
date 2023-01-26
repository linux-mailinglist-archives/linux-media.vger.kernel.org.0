Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B025267D93C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjAZXCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjAZXC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:02:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8825553986
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:02:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBGE-0002Qd-TI; Fri, 27 Jan 2023 00:02:26 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBGD-000fDl-7c; Fri, 27 Jan 2023 00:02:24 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBGB-00EGXK-7P; Fri, 27 Jan 2023 00:02:23 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas@ndufresne.ca,
        p.zabel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, benjamin.gaignard@collabora.com,
        kernel@pengutronix.de
Subject: [PATCH v2] hantro: fix VIDIOC_ENUM_FRAMESIZES for non-coded formats without postproc
Date:   Fri, 27 Jan 2023 00:02:19 +0100
Message-Id: <20230126230219.3399415-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The frmsize structure was left initialize to 0, as side effect, the
driver was reporting an invalid frmsize.

  Size: Stepwise 0x0 - 0x0 with step 0/0

The frmsize structure in hantro_fmt is only valid for bitstream formats.
So just adding frmsizes for non coded formats does not work to fix this.

When codec_mode is HANTRO_MODE_NONE, then vidioc_enum_framesizes should
return with -ENOTTY. At least when hantro_needs_postproc returns false.
Which is the case for encoders. But with the latest postproc scaling
patch this is not the case anymore. This patch is fixing this back to
how it was but changing the EINVAL to ENOTTY since we touch this anyway.

For now this is a good enough fix, but in the future enum_framesizes
needs to obtain different constraints in framesizes in combination of
coded to raw formats.

Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacities")
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

---
v1 -> v2: - changed EINVAL to ENOTTY as suggested by Nicolas
          - updated the commit message to add more infos to the issue

 drivers/media/platform/verisilicon/hantro_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2c7a805289e7b8..30e650edaea8a3 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -161,8 +161,11 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	}
 
 	/* For non-coded formats check if postprocessing scaling is possible */
-	if (fmt->codec_mode == HANTRO_MODE_NONE && hantro_needs_postproc(ctx, fmt)) {
-		return hanto_postproc_enum_framesizes(ctx, fsize);
+	if (fmt->codec_mode == HANTRO_MODE_NONE) {
+		if (hantro_needs_postproc(ctx, fmt))
+			return hanto_postproc_enum_framesizes(ctx, fsize);
+		else
+			return -ENOTTY;
 	} else if (fsize->index != 0) {
 		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
 			  fsize->index);
-- 
2.30.2

