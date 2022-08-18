Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF96597B8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 04:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242774AbiHRCc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 22:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242768AbiHRCc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 22:32:58 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1579E75FEB
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 19:32:57 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6B7575C009C;
        Wed, 17 Aug 2022 22:32:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 22:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660789975; x=1660876375; bh=2j01+bNkjS
        X75iCHcd2+3ZL/3+ehB1iVaTwCGqq4FBI=; b=AnBY53qsCmFokjTgMuB3AZd3wT
        mlrx6EP0KT0m/FuqTi2TnPWbzA/fr9H8XM1edSuJQ6HhzaERD6ruuFgyu2g9JIe3
        gSwDfIF2t5TW4u00rD/5I3lQa7EtntvliDa1wQHhKUEB92raRDtMHL0+xUi/mmGJ
        JILFYDgmg+WVSWSBaiTxaCtJ0P84uHqbt6aaWig0R63OZE5+/gAGYoF4DsGVY44q
        lB59VWKnkQBPtFLwrjF9kMLemYnv1GPr6hMuUXHJdbrHPah1PCP05MpODJaucBFp
        jpWWHlgNoCRZLo41dnAaX01zjAx1PJjisCVx+TuLiQKoRLi+13O2HcCqI0DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660789975; x=1660876375; bh=2j01+bNkjSX75iCHcd2+3ZL/3+eh
        B1iVaTwCGqq4FBI=; b=zrhtW3CCIpjJx6QilgQVf04vo/Moo8p/yri6BDmyfxe2
        QUg9TU8wqnhVtIe8YZI/7viBhX2ODR+WLvAsOV3IbOFLxinFi14uuqBVO9+jGF20
        AO+BA14uxfhOuHmvGVnmUEfr8ZPHURxESS/csPyuWAZcDGWJI+5237J5Wh+oFchd
        h2ZSD/zRl3RMzeO6K787shW3MKDnOKAdLCe5DPkxvkB6GDJ/mP41x7ZrvCyfkdJe
        zRHiLt8uPJeDDmNCv6c1oODXdHhVK0zAkVhsWrKTGOO2PY9uC75/Lv1fFfiWYkbv
        rt+KvXFVBZSP+qMcXjXda9fNL8jS7ghwAYeIPH52TA==
X-ME-Sender: <xms:16T9YlY1Ovl6eI1n_nFhvSEGwF9AW3IMl4_uHwnf84WR6x-9kdHHrQ>
    <xme:16T9YsYV8nC3JdbIx0NEVX0y76QnHZdyBTmKOD5K8nLoUvizuTIepuYaWVThxuv1o
    _utT324X2KpNvE_LsE>
X-ME-Received: <xmr:16T9Yn-Bi1QdZDs4LSymjL9psAWS8xo9YLF7ejkRv-hyPxvUbbU6Sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:16T9YjqptR0KlFbtocxqeKtuNRAU1W0Lx9_YU51vqcRaniEuzxgkHw>
    <xmx:16T9YgruHmZh_SBhW9SSxvmiM6VLcRMKNaROV-Rxr8F7L0ExVf52ew>
    <xmx:16T9YpTyJuMAUweRVPId4yxPcN79dqrUfmKuNYpmcmg2yxTKogSOVg>
    <xmx:16T9YplotXuCCV19zrCqLCu37sF6egFJKvXNG4mUvIvvI5m49hK4rg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 22:32:53 -0400 (EDT)
Date:   Thu, 18 Aug 2022 05:32:49 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 1/5] media: rkisp1: Clean up LSC configuration code
Message-ID: <20220818023249.7hddwxb2mimxh4cs@guri>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220817021850.20460-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220817021850.20460-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17.08.2022 05:18, Laurent Pinchart wrote:
>Clean up the LSC configuration code to improve its readability by
>shortening lines, using extra local variables and renaming long
>variables. No functional change intended.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-params.c  | 199 ++++++++----------
> 1 file changed, 86 insertions(+), 113 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index 246a6faa1fc1..fbbaf5505291 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -198,149 +198,129 @@ static void
> rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
> 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
> {
>-	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>+	struct rkisp1_device *rkisp1 = params->rkisp1;
>+	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
>
>-	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
>+	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
>
> 	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
>-	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>+	sram_addr = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
> 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
> 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
>
> 	/* program data tables (table size is 9 * 17 = 153) */
> 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
>+		const __u16 *r_tbl = pconfig->r_data_tbl[i];
>+		const __u16 *gr_tbl = pconfig->gr_data_tbl[i];
>+		const __u16 *gb_tbl = pconfig->gb_data_tbl[i];
>+		const __u16 *b_tbl = pconfig->b_data_tbl[i];
>+
> 		/*
> 		 * 17 sectors with 2 values in one DWORD = 9
> 		 * DWORDs (2nd value of last DWORD unused)
> 		 */
> 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j],
>-								 pconfig->r_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j],
>-								 pconfig->gr_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j],
>-								 pconfig->gb_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j],
>-								 pconfig->b_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
>+					r_tbl[j], r_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
>+					gr_tbl[j], gr_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
>+					gb_tbl[j], gb_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(
>+					b_tbl[j], b_tbl[j + 1]));
> 		}
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>-			     data);
>
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>-			     data);
>-
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>-			     data);
>-
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>-			     data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(r_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(gr_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(gb_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(b_tbl[j], 0));
> 	}
>-	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>-			    RKISP1_CIF_ISP_LSC_TABLE_0 :
>-			    RKISP1_CIF_ISP_LSC_TABLE_1;
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
>-		     isp_lsc_table_sel);
>+
>+	lsc_table_sel = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
>+			RKISP1_CIF_ISP_LSC_TABLE_0 : RKISP1_CIF_ISP_LSC_TABLE_1;
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL, lsc_table_sel);
> }
>
> static void
> rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
> 			     const struct rkisp1_cif_isp_lsc_config *pconfig)
> {
>-	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>+	struct rkisp1_device *rkisp1 = params->rkisp1;
>+	unsigned int lsc_status, sram_addr, lsc_table_sel, i, j;
>
>-	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
>+	lsc_status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
>
> 	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
>-	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>-		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
>-		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
>+	sram_addr = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
>+		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
>+		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
>
> 	/* program data tables (table size is 9 * 17 = 153) */
> 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
>+		const __u16 *r_tbl = pconfig->r_data_tbl[i];
>+		const __u16 *gr_tbl = pconfig->gr_data_tbl[i];
>+		const __u16 *gb_tbl = pconfig->gb_data_tbl[i];
>+		const __u16 *b_tbl = pconfig->b_data_tbl[i];
>+
> 		/*
> 		 * 17 sectors with 2 values in one DWORD = 9
> 		 * DWORDs (2nd value of last DWORD unused)
> 		 */
> 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>-					pconfig->r_data_tbl[i][j],
>-					pconfig->r_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>-					pconfig->gr_data_tbl[i][j],
>-					pconfig->gr_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>-					pconfig->gb_data_tbl[i][j],
>-					pconfig->gb_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
>-
>-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>-					pconfig->b_data_tbl[i][j],
>-					pconfig->b_data_tbl[i][j + 1]);
>-			rkisp1_write(params->rkisp1,
>-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>+					r_tbl[j], r_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>+					gr_tbl[j], gr_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>+					gb_tbl[j], gb_tbl[j + 1]));
>+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>+				     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>+					b_tbl[j], b_tbl[j + 1]));
> 		}
>
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->r_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>-			     data);
>-
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gr_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>-			     data);
>-
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gb_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>-			     data);
>-
>-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->b_data_tbl[i][j], 0);
>-		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>-			     data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(r_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(gr_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(gb_tbl[j], 0));
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
>+			     RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(b_tbl[j], 0));
> 	}
>-	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>-			    RKISP1_CIF_ISP_LSC_TABLE_0 :
>-			    RKISP1_CIF_ISP_LSC_TABLE_1;
>-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
>-		     isp_lsc_table_sel);
>+
>+	lsc_table_sel = lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE ?
>+			RKISP1_CIF_ISP_LSC_TABLE_0 : RKISP1_CIF_ISP_LSC_TABLE_1;
>+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL, lsc_table_sel);
> }
>
> static void rkisp1_lsc_config(struct rkisp1_params *params,
> 			      const struct rkisp1_cif_isp_lsc_config *arg)
> {
>+	struct rkisp1_device *rkisp1 = params->rkisp1;
> 	unsigned int i, data;
> 	u32 lsc_ctrl;
>
> 	/* To config must be off , store the current status firstly */
>-	lsc_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
>+	lsc_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
> 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> 				RKISP1_CIF_ISP_LSC_CTRL_ENA);
> 	params->ops->lsc_matrix_config(params, arg);
>@@ -349,38 +329,31 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		/* program x size tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
> 						    arg->x_size_tbl[i * 2 + 1]);
>-		rkisp1_write(params->rkisp1,
>-			     RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
>
> 		/* program x grad tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
> 						    arg->x_grad_tbl[i * 2 + 1]);
>-		rkisp1_write(params->rkisp1,
>-			     RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
>
> 		/* program y size tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_size_tbl[i * 2],
> 						    arg->y_size_tbl[i * 2 + 1]);
>-		rkisp1_write(params->rkisp1,
>-			     RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
>
> 		/* program y grad tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
> 						    arg->y_grad_tbl[i * 2 + 1]);
>-		rkisp1_write(params->rkisp1,
>-			     RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
> 	}
>
> 	/* restore the lsc ctrl status */
>-	if (lsc_ctrl & RKISP1_CIF_ISP_LSC_CTRL_ENA) {
>-		rkisp1_param_set_bits(params,
>-				      RKISP1_CIF_ISP_LSC_CTRL,
>+	if (lsc_ctrl & RKISP1_CIF_ISP_LSC_CTRL_ENA)
>+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> 				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
>-	} else {
>-		rkisp1_param_clear_bits(params,
>-					RKISP1_CIF_ISP_LSC_CTRL,
>+	else
>+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> 					RKISP1_CIF_ISP_LSC_CTRL_ENA);
>-	}
> }
>
> /* ISP Filtering function */
>-- 
>Regards,
>
>Laurent Pinchart
>
