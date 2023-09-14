Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BC67A0429
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 14:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbjINMlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 08:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238470AbjINMlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 08:41:35 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0526C1FCE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 05:41:31 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qglet-0008Mc-KV; Thu, 14 Sep 2023 14:41:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 14 Sep 2023 14:40:45 +0200
Subject: [PATCH 13/13] media: rockchip: rga: add NV12M support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v1-13-abfd77260ae3@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the multi-planar variants of NV12. The RGA is now able
to exchange DMABUFs with other devices that only support multi-planar
NV12, for example the Hantro JPEG encoder.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index e0324341e702..a9b4d4bca733 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -278,6 +278,15 @@ static struct rga_fmt formats[] = {
 		.y_div = 2,
 		.x_div = 1,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.color_swap = RGA_COLOR_NONE_SWAP,

-- 
2.39.2

