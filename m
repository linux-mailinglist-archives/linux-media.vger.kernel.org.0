Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA903652E73
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 10:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiLUJZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 04:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiLUJZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 04:25:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D85E1DA4A;
        Wed, 21 Dec 2022 01:25:17 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CECDBD8B;
        Wed, 21 Dec 2022 10:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671614711;
        bh=gJWZGj+0Env0pf41JaaKnHYexVp19/3ifHWurEm4Kl8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sZwOCMKkNDzHgl+4aa4v0KCPG4UfYCTuxnTFyCIek3v1sNpsPzNvR/ZVUIUEs1zGY
         PXueabtiRR6oApIzAjsKJ0wKywKoFbDMiIN6/CkOP6NgWYcLnj8iXMvZq8AdKqu8PP
         XT/n2EB9Ka09UaYuLTEbvAyh2zCMJPA1QOvmhB0w=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 6/7] drm: rcar-du: Bump V3U to gen 4
Date:   Wed, 21 Dec 2022 11:24:47 +0200
Message-Id: <20221221092448.741294-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3U is actually gen 4 IP, like in V4H. Bump up V3U gen in the
rcar_du_r8a779a0_info.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 46c60a2d710d..c7c5217cfc1a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -504,7 +504,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
-	.gen = 3,
+	.gen = 4,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_NO_BLENDING,
-- 
2.34.1

