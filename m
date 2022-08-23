Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E8359EBA7
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbiHWS6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiHWS6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:58:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B268175B0
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:26:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71ACB2B3;
        Tue, 23 Aug 2022 19:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275480;
        bh=JYsUTl6OKO8+/awD+6c1bDVOSss66ZqHUueZFtF5eRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZW3gAuT4hozfIEWgBjsT55mmpyXaTSVqs1KdJTn1s5AEiVFlgZdRTy+MiQY1qkdKi
         UN+7cy1jKISPOXF4VhRO8y11t0CFo3QUDLlRyro7pXme3nB9Nugud9e5iHCvRMlvDf
         NpWop77g3hdpHC7NojEwBNcB+EwxT1HJc4Yliml8=
Date:   Tue, 23 Aug 2022 20:24:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 3/3] media: rockchip: rkisp1: Define macros for DPCC
 configurations in UAPI
Message-ID: <YwUNVML8WLWs0ib4@pendragon.ideasonboard.com>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
 <20220616160456.21549-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616160456.21549-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Would you be able to review this patch ?

On Thu, Jun 16, 2022 at 07:04:56PM +0300, Laurent Pinchart wrote:
> Extend the UAPI rkisp1-config.h header with macros for all DPCC
> configuration fields. While at it, clarify of fix issues in the DPCC
> documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  1 -
>  include/uapi/linux/rkisp1-config.h            | 77 +++++++++++++++----
>  2 files changed, 61 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index dc01f968c19d..a931f7216e9b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -620,7 +620,6 @@
>  /* DPCC */
>  #define RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE		BIT(0)
>  #define RKISP1_CIF_ISP_DPCC_MODE_GRAYSCALE_MODE		BIT(1)
> -#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE		BIT(2)
>  #define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK		GENMASK(3, 0)
>  #define RKISP1_CIF_ISP_DPCC_SET_USE_MASK		GENMASK(3, 0)
>  #define RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK		0x00001f1f
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 583ca0d9a79d..730673ecc63d 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -117,7 +117,46 @@
>  /*
>   * Defect Pixel Cluster Correction
>   */
> -#define RKISP1_CIF_ISP_DPCC_METHODS_MAX       3
> +#define RKISP1_CIF_ISP_DPCC_METHODS_MAX				3
> +
> +#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE			(1U << 2)
> +
> +#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER	(1U << 0)
> +#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_RB_CENTER	(1U << 1)
> +#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_G_3X3		(1U << 2)
> +#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_RB_3X3		(1U << 3)
> +
> +/* 0-2 for sets 1-3 */
> +#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_SET(n)		((n) << 0)
> +#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_FIX_SET		(1U << 3)
> +
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_GREEN_ENABLE		(1U << 0)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_GREEN_ENABLE		(1U << 1)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_GREEN_ENABLE		(1U << 2)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_GREEN_ENABLE	(1U << 3)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_GREEN_ENABLE		(1U << 4)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_RED_BLUE_ENABLE	(1U << 8)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_RED_BLUE_ENABLE	(1U << 9)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_RED_BLUE_ENABLE	(1U << 10)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_RED_BLUE_ENABLE	(1U << 11)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_RED_BLUE_ENABLE	(1U << 12)
> +
> +#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_G(v)			((v) << 0)
> +#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RB(v)			((v) << 8)
> +#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_G(v)			((v) << 0)
> +#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RB(v)			((v) << 8)
> +#define RKISP1_CIF_ISP_DPCC_PG_FAC_G(v)				((v) << 0)
> +#define RKISP1_CIF_ISP_DPCC_PG_FAC_RB(v)			((v) << 8)
> +#define RKISP1_CIF_ISP_DPCC_RND_THRESH_G(v)			((v) << 0)
> +#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RB(v)			((v) << 8)
> +#define RKISP1_CIF_ISP_DPCC_RG_FAC_G(v)				((v) << 0)
> +#define RKISP1_CIF_ISP_DPCC_RG_FAC_RB(v)			((v) << 8)
> +
> +#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_G(n, v)			((v) << ((n) * 4))
> +#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_RB(n, v)		((v) << ((n) * 4 + 2))
> +
> +#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_G(n, v)			((v) << ((n) * 4))
> +#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_RB(n, v)			((v) << ((n) * 4 + 2))
>  
>  /*
>   * Denoising pre filter
> @@ -249,16 +288,20 @@ struct rkisp1_cif_isp_bls_config {
>  };
>  
>  /**
> - * struct rkisp1_cif_isp_dpcc_methods_config - Methods Configuration used by DPCC
> + * struct rkisp1_cif_isp_dpcc_methods_config - DPCC methods set configuration
>   *
> - * Methods Configuration used by Defect Pixel Cluster Correction
> + * This structure stores the configuration of one set of methods for the DPCC
> + * algorithm. Multiple methods can be selected in each set (independently for
> + * the Green and Red/Blue components) through the @method field, the result is
> + * the logical AND of all enabled methods. The remaining fields set thresholds
> + * and factors for each method.
>   *
> - * @method: Method enable bits
> - * @line_thresh: Line threshold
> - * @line_mad_fac: Line MAD factor
> - * @pg_fac: Peak gradient factor
> - * @rnd_thresh: Rank Neighbor Difference threshold
> - * @rg_fac: Rank gradient factor
> + * @method: Method enable bits (RKISP1_CIF_ISP_DPCC_METHODS_SET_*)
> + * @line_thresh: Line threshold (RKISP1_CIF_ISP_DPCC_LINE_THRESH_*)
> + * @line_mad_fac: Line Mean Absolute Difference factor (RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_*)
> + * @pg_fac: Peak gradient factor (RKISP1_CIF_ISP_DPCC_PG_FAC_*)
> + * @rnd_thresh: Rank Neighbor Difference threshold (RKISP1_CIF_ISP_DPCC_RND_THRESH_*)
> + * @rg_fac: Rank gradient factor (RKISP1_CIF_ISP_DPCC_RG_FAC_*)
>   */
>  struct rkisp1_cif_isp_dpcc_methods_config {
>  	__u32 method;
> @@ -272,14 +315,16 @@ struct rkisp1_cif_isp_dpcc_methods_config {
>  /**
>   * struct rkisp1_cif_isp_dpcc_config - Configuration used by DPCC
>   *
> - * Configuration used by Defect Pixel Cluster Correction
> + * Configuration used by Defect Pixel Cluster Correction. Three sets of methods
> + * can be configured and selected through the @set_use field. The result is the
> + * logical OR of all enabled sets.
>   *
> - * @mode: dpcc output mode
> - * @output_mode: whether use hard coded methods
> - * @set_use: stage1 methods set
> - * @methods: methods config
> - * @ro_limits: rank order limits
> - * @rnd_offs: differential rank offsets for rank neighbor difference
> + * @mode: DPCC mode (RKISP1_CIF_ISP_DPCC_MODE_*)
> + * @output_mode: Interpolation output mode (RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_*)
> + * @set_use: Methods sets selection (RKISP1_CIF_ISP_DPCC_SET_USE_*)
> + * @methods: Methods sets configuration
> + * @ro_limits: Rank order limits (RKISP1_CIF_ISP_DPCC_RO_LIMITS_*)
> + * @rnd_offs: Differential rank offsets for rank neighbor difference (RKISP1_CIF_ISP_DPCC_RND_OFFS_*)
>   */
>  struct rkisp1_cif_isp_dpcc_config {
>  	__u32 mode;

-- 
Regards,

Laurent Pinchart
