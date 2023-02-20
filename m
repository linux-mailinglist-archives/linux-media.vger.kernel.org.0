Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB54C69C8EE
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 11:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjBTKtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 05:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjBTKtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 05:49:02 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED522A5F2;
        Mon, 20 Feb 2023 02:49:01 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:d30c:b155:96fb:dcc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 465BF6602173;
        Mon, 20 Feb 2023 10:49:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676890140;
        bh=tiJU1XPfasKdiChhkAX5L0vI56X8ZEAvctUJUjANgAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WsfFgn/LAzRHgba5r4let4PikDJEKi3nz7x+JN032GIebw38U8b7q4/jfMgEUcc7E
         9pEIGIASB0M7KVFEIhKtCEJGOrTBmNzE3jBC+D4eAv2if/fA3fu3s3pPGJN0HjUqqN
         9qeKO3HLaWIKZw9ZnsKztmlrgYTqiYVCckpDNgKuuQmxQZtCp1IlMyVMP/HTCAKOYE
         7+bWt8KZjpOSxJWK2DcIWE3KbWCg4wPPMOfbVpi0MVHZXHKSdJHLxJg72AekvkLkWF
         Bm8o+RgflIzQxHd7NjTg3gMoBco76PBfzJhGfUEsPlO/a82027p/MJZ7Dio+14xo8b
         rsf7MsWy4/GXA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.co.uk,
        robert.mader@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 6/6] media: verisilicon: VP9: Only propose 10 bits compatible pixels formats
Date:   Mon, 20 Feb 2023 11:48:49 +0100
Message-Id: <20230220104849.398203-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220104849.398203-1-benjamin.gaignard@collabora.com>
References: <20230220104849.398203-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When decoding a 10bits bitstreams VP9 driver should only expose
10bits pixel formats.
To fulfill this requirement it is needed to call hantro_reset_raw_fmt()
when bit depth change and to correctly set match_depth in pixel formats
enumeration.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 9:
- Fix brackets

 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 7d452f1afaae..d20e62c025ae 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -307,9 +307,14 @@ static int hantro_vp9_s_ctrl(struct v4l2_ctrl *ctrl)
 			   struct hantro_ctx, ctrl_handler);
 
 	switch (ctrl->id) {
-	case V4L2_CID_STATELESS_VP9_FRAME:
-		ctx->bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
-		break;
+	case V4L2_CID_STATELESS_VP9_FRAME: {
+		int bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
+
+		if (ctx->bit_depth == bit_depth)
+			return 0;
+
+		return hantro_reset_raw_fmt(ctx, bit_depth);
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

