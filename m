Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878FA3DBF13
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 21:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhG3TfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 15:35:20 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:47724 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhG3TfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 15:35:19 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d29 with ME
        id bXb62500421Fzsu03Xb7m6; Fri, 30 Jul 2021 21:35:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jul 2021 21:35:11 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'
Date:   Fri, 30 Jul 2021 21:35:05 +0200
Message-Id: <fccdeaa92b4e2f666ef6deeaa7975ccab5c98c3f.1627673587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is likely a typo here. To be consistent, we should compare
'fmt.height' with 'ctx->out.pix_fmt.height', not 'ctx->out.pix_fmt.width'.

Instead of fixing the test, just remove it and copy 'fmt' unconditionally.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
v2: axe the tests. The structure is small, and it is likely that it was
    already copied with the broken test.
---
 drivers/media/platform/meson/ge2d/ge2d.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..9b1e973e78da 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -779,11 +779,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 		 * If the rotation parameter changes the OUTPUT frames
 		 * parameters, take them in account
 		 */
-		if (fmt.width != ctx->out.pix_fmt.width ||
-		    fmt.height != ctx->out.pix_fmt.width ||
-		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
-		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
-			ctx->out.pix_fmt = fmt;
+		ctx->out.pix_fmt = fmt;
 
 		break;
 	}
-- 
2.30.2

