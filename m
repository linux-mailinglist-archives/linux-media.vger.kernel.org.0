Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA13DAC10
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 21:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhG2Tth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 15:49:37 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:48950 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229645AbhG2Ttg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 15:49:36 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d56 with ME
        id b7pU2500D21Fzsu037pUqA; Thu, 29 Jul 2021 21:49:31 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Jul 2021 21:49:31 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'
Date:   Thu, 29 Jul 2021 21:49:25 +0200
Message-Id: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is likely a typo here. To be consistent, we should compare
'fmt.height' with 'ctx->out.pix_fmt.height', not 'ctx->out.pix_fmt.width'.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've not looked deeply in the code, but why is this test needed in the
first place?
Couldn't we assigned 'ctx->out.pix_fmt = fmt' un-conditionally?
---
 drivers/media/platform/meson/ge2d/ge2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..be22bb60e7cf 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -780,7 +780,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 		 * parameters, take them in account
 		 */
 		if (fmt.width != ctx->out.pix_fmt.width ||
-		    fmt.height != ctx->out.pix_fmt.width ||
+		    fmt.height != ctx->out.pix_fmt.height ||
 		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
 		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
 			ctx->out.pix_fmt = fmt;
-- 
2.30.2

