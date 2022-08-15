Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253495929E1
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 08:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241118AbiHOGw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 02:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241104AbiHOGw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 02:52:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EE01BE81
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 23:52:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3DEE4A8;
        Mon, 15 Aug 2022 08:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660546374;
        bh=0171k1qH7SHeDwer62SyPmML9Ace3FoMxdDkTBowJu8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=scS9p8JIeXu3jZFga7NViC4NFqcGG0r/iBIyapLjWnr6bA+51csAbIk4A0PaKluM2
         8/lk8c419Sp+jzqg+aKmj6A0Yuhl24/4y23eHWHwNv2woEnrOpmxEqx+BLUO5g2B6P
         dgm0vqDKd0YvZBC3AmdUUN81DTQBlMGk5ysjuyO8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 5/7] media: rkisp1: Configure quantization using ISP source pad
Date:   Mon, 15 Aug 2022 09:52:33 +0300
Message-Id: <20220815065235.23797-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_config_isp() function uses the format on the sink pad of the
ISP to configure quantization at the output of the ISP. This is
incorrect, as hinted by the src_frm variable name that stores the
format. Fix it by using the source pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 8b93b5c03bce..9d4d018d58b6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -341,7 +341,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		struct v4l2_mbus_framefmt *src_frm;
 
 		src_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
-						 RKISP1_ISP_PAD_SINK_VIDEO,
+						 RKISP1_ISP_PAD_SOURCE_VIDEO,
 						 V4L2_SUBDEV_FORMAT_ACTIVE);
 		rkisp1_params_configure(&rkisp1->params, sink_fmt->bayer_pat,
 					src_frm->quantization);
-- 
Regards,

Laurent Pinchart

