Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E9D667D4E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240208AbjALSD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 13:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240146AbjALSC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:02:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F9A551FE
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:25:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65389491;
        Thu, 12 Jan 2023 18:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673544310;
        bh=Lu7rYpISM6QoUK1B0LsUDhnpv5KHMB+M3UTTwg/Rkjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EVP48oKwjoVUZlvIDe7RbwT279U5zWlCqpxmF/fUvt6rZ4Lu03yrw0JoxtK43QI2Y
         T+ylpFazHl9NiJCeqKJbiJ2OnJBH7QFqZXfwvg1O5tbZ4yt21mggEBtFELxikNtjlv
         NdJ1Ui7FAq6QIHhCfaQwHBKskHaFUVGdFiYZGQJA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 2/7] media: imx-pxp: Don't set bus_info manually in .querycap()
Date:   Thu, 12 Jan 2023 19:25:02 +0200
Message-Id: <20230112172507.30579-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
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

The v4l2_capability.bus_info field is set by the V4L2 core when left
empty by the .querycap() handler. This is the recommended practice, in
order to ensure bus_info coherence between drivers. Don't set it
manually.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-pxp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index dcb04217288b..945316edd580 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1117,8 +1117,6 @@ static int pxp_querycap(struct file *file, void *priv,
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
 	strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-			"platform:%s", MEM2MEM_NAME);
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

