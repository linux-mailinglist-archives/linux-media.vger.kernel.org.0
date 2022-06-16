Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8232754E6A6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378051AbiFPQFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 12:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378017AbiFPQFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 12:05:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3058C483A5
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 09:05:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D38B2898;
        Thu, 16 Jun 2022 18:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655395512;
        bh=kX38/TBN5PynJkSOE6Mnkyb9J7QIpHmpEZAAzRwBL0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pZNCkeIGgCTJ5V+cxCIHMF7ylq4YdLdCMNtWKST+TxVtMmcskXGwjfcQi80bYVGEq
         aT4PGvs7+lAfz3PVaueKcU69hD8UPKCY1H/k+RXE5agka/POJzYjYExMiiQvVi4a7B
         F73NIlkaTm3LkcruyNTDRqf4Zs+HriSAqahh5g+w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 1/3] media: rockchip: rkisp1: Set DPCC methods enable bits inside loop
Date:   Thu, 16 Jun 2022 19:04:54 +0300
Message-Id: <20220616160456.21549-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
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

The rkisp1_dpcc_config() function looks over methods sets to configure
them, but sets the RKISP1_CIF_ISP_DPCC_METHODS_SET_* registers outside
of the loop with hand-unrolled code. Move this to the loop to simplify
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c88a9c0fa86e..140012fa18f0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -18,6 +18,8 @@
 #define RKISP1_ISP_PARAMS_REQ_BUFS_MIN	2
 #define RKISP1_ISP_PARAMS_REQ_BUFS_MAX	8
 
+#define RKISP1_ISP_DPCC_METHODS_SET(n) \
+			(RKISP1_CIF_ISP_DPCC_METHODS_SET_1 + 0x4 * (n))
 #define RKISP1_ISP_DPCC_LINE_THRESH(n) \
 			(RKISP1_CIF_ISP_DPCC_LINE_THRESH_1 + 0x14 * (n))
 #define RKISP1_ISP_DPCC_LINE_MAD_FAC(n) \
@@ -66,13 +68,9 @@ static void rkisp1_dpcc_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_SET_USE,
 		     arg->set_use);
 
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_1,
-		     arg->methods[0].method);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_2,
-		     arg->methods[1].method);
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_3,
-		     arg->methods[2].method);
 	for (i = 0; i < RKISP1_CIF_ISP_DPCC_METHODS_MAX; i++) {
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_METHODS_SET(i),
+			     arg->methods[i].method);
 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_THRESH(i),
 			     arg->methods[i].line_thresh);
 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_MAD_FAC(i),
-- 
Regards,

Laurent Pinchart

