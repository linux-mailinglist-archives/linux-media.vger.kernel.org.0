Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F597864BC
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 03:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239110AbjHXBj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 21:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239174AbjHXBjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 21:39:41 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC99DE66
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 18:39:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 30A838647E;
        Thu, 24 Aug 2023 03:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1692841178;
        bh=n+VBQRrBQaxWW+yJwsOPipCZth8juy6ZycPvNLJzwX8=;
        h=From:To:Cc:Subject:Date:From;
        b=cc1rCXw/i2e5/70jFcaM1/SWzg/5hFuBtjY7WMELA1NaLuOAwGO/BH1U4fsv9VypZ
         fPzi/AGFSw5ztn1GwdMhrmDHUiNlfVDrLRnENPEq+7gNQKNe9T+KfG7k+T2MmNSmyZ
         VAobhyuvtiR8VG3Pw/VGVuks/w9AHkGGucto9svnsmgoZOxsZQ0we5AYqZcg4HfD6x
         j8H5Pom7d2v3+rirGp7MmVlsIqG4xQeyAD8MDOkoyziS5hfp3/2hZD7MNjasPqa705
         YzaEmlWtOmJb4ETgvCQxy4uj6lxGzPwpA2wZR889bak7xBwc65rSPoUt8qzlXixT6e
         +P4ARjPXtXCVQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] media: verisilicon: Do not enable G2 postproc downscale if source is narrower than destination
Date:   Thu, 24 Aug 2023 03:39:35 +0200
Message-Id: <20230824013935.303132-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of encoded input VP9 data width that is not multiple of macroblock
size, which is 16 (e.g. 1080x1920 frames, where 1080 is multiple of 8), the
width is padded to be a multiple of macroblock size (for 1080x1920 frames,
that is 1088x1920).

The hantro_postproc_g2_enable() checks whether the encoded data width is
equal to decoded frame width, and if not, enables down-scale mode. For a
frame where input is 1080x1920 and output is 1088x1920, this is incorrect
as no down-scale happens, the frame is only padded. Enabling the down-scale
mode in this case results in corrupted frames.

Fix this by adjusting the check to test whether encoded data width is
greater than decoded frame width, and only in that case enable the
down-scale mode.

To generate input test data to trigger this bug, use e.g.:
$ gst-launch-1.0 videotestsrc ! video/x-raw,width=272,height=256,format=I420 ! \
                 vp9enc ! matroskamux ! filesink location=/tmp/test.vp9
To trigger the bug upon decoding (note that the NV12 must be forced, as
that assures the output data would pass the G2 postproc):
$ gst-launch-1.0 filesrc location=/tmp/test.vp9 ! matroskademux ! vp9parse ! \
                 v4l2slvp9dec ! video/x-raw,format=NV12 ! videoconvert ! fbdevsink

Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacities")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 0224ff68ab3fc..64d6fb852ae9b 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.40.1

