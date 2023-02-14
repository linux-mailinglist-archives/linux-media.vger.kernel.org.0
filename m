Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4139E6970A4
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 23:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbjBNWUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 17:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjBNWUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 17:20:42 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5164EDC
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 14:20:37 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F20648597D;
        Tue, 14 Feb 2023 23:20:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1676413235;
        bh=6lQnqa5Ho4Bz6/mJICnn0i845HTYucwYtLbjsjL3e24=;
        h=From:To:Cc:Subject:Date:From;
        b=K5XJhpZ5s1HiccBic2/BviwKazCrvOXT0qF7yRHnaL5AHRciZuTMhWKI8O1RkSafh
         X/6h0cpF94h5jsiMqT7IAxSGJ8x8EXu1QIyzlutvU2nz4S1SCO6J6gImWW+mZYjxcY
         89ScvuTOvDbULkuZjVpPzsC8s6MMxcrMMVGdGKuWqtYKOtOsiknBspxdwEGC2HfPKj
         nQcmGLCXfknkBYzVNgYOOLRiDI7QHKPPs/fIxqu+jyENkArVpGLJFt+JvPziROpL+e
         1e2ICBwE2To7476QrFSw10i8UJBgShOkqg5XJfcxW8izbWGQ54+8WUtC8Hr0MFJdO4
         C8xjqwgferUyQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-mipi-csis: Check csis_fmt validity before use
Date:   Tue, 14 Feb 2023 23:20:24 +0100
Message-Id: <20230214222024.165956-1-marex@denx.de>
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
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index e99633565463e..8e307ca0b5688 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1108,6 +1108,8 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fmt = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SOURCE);
 	csis_fmt = find_csis_format(fmt->code);
 	v4l2_subdev_unlock_state(state);
+	if (!csis_fmt)
+		return -EINVAL;
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 	fd->num_entries = 1;
-- 
2.39.1

