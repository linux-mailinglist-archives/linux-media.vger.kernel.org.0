Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00EA6971D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 00:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjBNXcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 18:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBNXcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 18:32:47 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A38A2FCF1
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 15:32:46 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9B0E48597D;
        Wed, 15 Feb 2023 00:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1676417564;
        bh=Ydcfckh08fdrY25On7XbN0Dw3yLwnNKhJVS7GXEwseA=;
        h=From:To:Cc:Subject:Date:From;
        b=KopsVYnnxKkSh4KIi6ilKIi9Z4825e+qP4mdGkAt4/GPuDW0ul2zbtjxxeBOFoCIG
         3IMitWYkM3IWVIJ63LYX6+j5YQQ43kMq9/UeMayn7C0s6yJKqBTgSH7rLKn7XuhAiP
         5dZEnUyk8+aWRYM0MwITj50GP7PqGesZpO3yatQ2Jr9iy6OwOYxgypUnYsm1DFHzDw
         VvZDeec+KnCYn4y/TRyfmjKRY4RkfVUcF8hBdCMkOKeHWH8wkaDOwkPuxHPQbvM7/r
         pPjehnNb5w7mtyn/dMWUZNm+aEmL4PNFXPCo94hm8oKWiU98M/6th7+sZJKXtvU9WW
         yAVHLiENJLh/w==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: imx-mipi-csis: Check csis_fmt validity before use
Date:   Wed, 15 Feb 2023 00:32:33 +0100
Message-Id: <20230214233233.177122-1-marex@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The find_csis_format() may return NULL in case supported format is not
found, check the return value of find_csis_format() before using the
result to avoid NULL pointer dereference.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: 11927d0fd0d0 ("media: imx-mipi-csis: Use V4L2 subdev active state")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
V2: Add blank line
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index e99633565463e..2731ae94cb031 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1109,6 +1109,9 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	csis_fmt = find_csis_format(fmt->code);
 	v4l2_subdev_unlock_state(state);
 
+	if (!csis_fmt)
+		return -EINVAL;
+
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 	fd->num_entries = 1;
 
-- 
2.39.1

