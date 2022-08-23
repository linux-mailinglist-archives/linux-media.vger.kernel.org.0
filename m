Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0914359EB88
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbiHWSym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbiHWSyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:54:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F7211D535
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:20:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B226FE1E;
        Tue, 23 Aug 2022 19:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275134;
        bh=ei00uxRrPfVtT4n0RYTb5ZUOk9kkdzGSUKVGJZnvSoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OdD9eqVLle7qyTj+HNqmKTt53/iGk9JFY0/VJk/sg2HMvTe9M5H/V1FvHxbo7axBl
         k/XaXG92Bl5yL28R1CItiGUDAIm8mLmr84UfwQezseSGpR0TYwn1MmUqpKKkmmV6OP
         Pk6pqn4bu25nvrMZm9jTBMXpz3Ei1SlJT4vUYoyw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 6/9] media: rkisp1: Don't pass the quantization to rkisp1_csm_config()
Date:   Tue, 23 Aug 2022 20:18:37 +0300
Message-Id: <20220823171840.8958-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
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

The rkisp1_csm_config() function takes a pointer to the rkisp1_params
structure which contains the quantization value. There's no need to pass
it separately to the function. Drop it from the function parameters.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 8b4eea77af0d..163419624370 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1076,7 +1076,7 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
 	}
 }
 
-static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
+static void rkisp1_csm_config(struct rkisp1_params *params)
 {
 	static const u16 full_range_coeff[] = {
 		0x0026, 0x004b, 0x000f,
@@ -1090,7 +1090,7 @@ static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
 	};
 	unsigned int i;
 
-	if (full_range) {
+	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
 		for (i = 0; i < ARRAY_SIZE(full_range_coeff); i++)
 			rkisp1_write(params->rkisp1,
 				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
@@ -1562,11 +1562,7 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
 			      rkisp1_hst_params_default_config.mode);
 
-	/* set the  range */
-	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE)
-		rkisp1_csm_config(params, true);
-	else
-		rkisp1_csm_config(params, false);
+	rkisp1_csm_config(params);
 
 	spin_lock_irq(&params->config_lock);
 
-- 
Regards,

Laurent Pinchart

