Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2F47ACD37
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjIYAmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjIYAlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:41:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D76FB
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 092E1842;
        Mon, 25 Sep 2023 02:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602371;
        bh=XPfv5PjLYD9hJloMDgKLyMW61PPSzbg+Y2qe/MkZTZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BUn2GVrDCNOnDoiqYal0oDxGwqrty4LxTXs9GcbYUBl3fXTV7BREUoEhcaIItP1Qi
         qIdUJohqaq1Df9Y+YPWkZeMkMHorxhFGYp/hIs84/061eYqX3kl/rMjfJ7KeB2oP7L
         eUtRIn9oD85dC72+YupDzZZXauQ3KFa1iYKAiYkI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 06/14] media: rkisp1: Constify rkisp1_v12_params_ops
Date:   Mon, 25 Sep 2023 03:41:04 +0300
Message-ID: <20230925004112.22797-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_v12_params_ops global variable doesn't need to be modified.
Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 8e3dc4966b94..173d1ea41874 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1726,7 +1726,7 @@ static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
 	.afm_config = rkisp1_afm_config_v10,
 };
 
-static struct rkisp1_params_ops rkisp1_v12_params_ops = {
+static const struct rkisp1_params_ops rkisp1_v12_params_ops = {
 	.lsc_matrix_config = rkisp1_lsc_matrix_config_v12,
 	.goc_config = rkisp1_goc_config_v12,
 	.awb_meas_config = rkisp1_awb_meas_config_v12,
-- 
Regards,

Laurent Pinchart

