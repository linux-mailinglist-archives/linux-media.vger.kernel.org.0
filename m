Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A15A59675A
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 04:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238196AbiHQCTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 22:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238194AbiHQCTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 22:19:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990507FE69
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 19:19:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5174856D;
        Wed, 17 Aug 2022 04:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660702747;
        bh=XupCYAjgEXRLsh/cw0J6P5qpgliM91hjO+yB+Qz1miQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QTO5SRdClUF3jH3FYW+osq5tO4wmlZN5XxGw8ihAiQ7VbnfY/dHEWTa5Plk1uMP/w
         FCMV6oJC1ZpUcIKoEsGqWrBfKttdiIAHYAL9YSDl9tQMPbIqCDjYdLk7CnGT5MDiC7
         4wyVow9BD6LjPIW5vNf/sIRlpKaKQOroKdhUMMsM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 2/5] media: rkisp1: Store LSC register values in u32 variables
Date:   Wed, 17 Aug 2022 05:18:47 +0300
Message-Id: <20220817021850.20460-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the u32 type instead of unsigned int to store register values in the
LSC configuration code, to make the variables' size more explicit. No
functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index fbbaf5505291..dbe826fd02d2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -199,7 +199,8 @@ rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
 	struct rkisp1_device *rkisp1 = params->rkisp1;
-	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
+	u32 lsc_status, sram_addr, lsc_table_sel;
+	unsigned int i, j;
 
 	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
 
@@ -258,7 +259,8 @@ rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
 	struct rkisp1_device *rkisp1 = params->rkisp1;
-	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
+	u32 lsc_status, sram_addr, lsc_table_sel;
+	unsigned int i, j;
 
 	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
 
@@ -316,8 +318,8 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
 			      const struct rkisp1_cif_isp_lsc_config *arg)
 {
 	struct rkisp1_device *rkisp1 = params->rkisp1;
-	unsigned int i, data;
-	u32 lsc_ctrl;
+	u32 lsc_ctrl, data;
+	unsigned int i;
 
 	/* To config must be off , store the current status firstly */
 	lsc_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
-- 
Regards,

Laurent Pinchart

