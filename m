Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8441E324FA7
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 13:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhBYMGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 07:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhBYMGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 07:06:50 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3C7C061574;
        Thu, 25 Feb 2021 04:06:10 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id C8E611F46026
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     fbuergisser@google.com, dianders@google.com,
        Collabora Kernel ML <kernel@collabora.com>,
        acourbot@google.com, tfiga@google.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] media: hantro: Auto generate the AXI ID to avoid conflicts
Date:   Thu, 25 Feb 2021 13:06:01 +0100
Message-Id: <20210225120601.669238-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AXI ID is an AXI bus configuration for improve bus performance. If
read and write operations use different ID the operations can be
paralleled, whereas when they have the same ID the operations will be
serialized. Right now, the write ID is fixed to 0 but we can set it to
0xff to get auto generated ID to avoid possible conflicts.

This change has no functional changes, but seems reasonable to let the
hardware to autogenerate the ID instead of hardcoding in software.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 845bef73d218..090088cd98ea 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -30,7 +30,7 @@ static void set_params(struct hantro_ctx *ctx)
 	u32 reg;
 
 	/* Decoder control register 0. */
-	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
+	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0xff);
 	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
 		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
 	if (sps->profile_idc > 66) {
-- 
2.30.0

