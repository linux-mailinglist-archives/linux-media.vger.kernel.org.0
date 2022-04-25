Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E9550DD33
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbiDYJyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiDYJyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:54:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265A03DA44
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:51:07 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dk23so5179068ejb.8
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZrjU65SXNk9viGTJqO/AE5ojQZkbJAG+jwmUiiDdSUk=;
        b=RfvQDXUANssqkN2HxukuD3uCKC6CYsyxL6OoDY63DG7frcGVc+oWusfKgGXgk/fTtQ
         7nIWSsQD8QCF/tDWdEE/4xyCVEG8gEfityJ6gE1hWxzqsSoqdZhBqPT644ETGkMGBgsC
         MzGqOU2vy4FZX604q9lH/2pzgE2KJRbbOgAik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZrjU65SXNk9viGTJqO/AE5ojQZkbJAG+jwmUiiDdSUk=;
        b=U5y8uOJ+wuaR3bCTdpD+9NV0fzPJYTW9NsRpF5LvL2NFPf+d2etmiI9Ph6MzJ+2nN/
         O9Nidiog9n9FGTJ4UWI4tLMdLo3WQqPFTv0/8hkIDr8gRuRR/7mPe7Uqoc8mcgvoMX+E
         IJLG0WTperYK5qg8mYCLy4RgXgh4yBtoFTMqy7btcMpR7kuzkuJ3tSNORLjyqGeWJ7OQ
         tL1XjnEBeE66pf8WOhbOKx7EItagY5XcyPEkXadLlv965Sw2Zdpt27w9WlgsB6gv5rML
         8uZlMyeGmjVEIaBJnltaWDZexBkm3F2eWZtHciiLK9IMBtA85TPZ1avS2F1+yAQGuMre
         gQbQ==
X-Gm-Message-State: AOAM533Dumhh/Pv3gH4fUbq69Uc8vjkJ/mv/OONSDjFUuQ5t92PavLg/
        sBVZqC03BTNqdvvH20FjLEq+7if7D/K3ag==
X-Google-Smtp-Source: ABdhPJykb9OOO2NnlNd6oAf6nuJMeKUtjcapTN5+UK/m/fsv6wAQ8IbgCd4Smq1dwROGMuggPL8YOA==
X-Received: by 2002:a17:907:9719:b0:6f0:14b6:33e9 with SMTP id jg25-20020a170907971900b006f014b633e9mr16157908ejc.734.1650880265691;
        Mon, 25 Apr 2022 02:51:05 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id kb9-20020a1709070f8900b006e889aad94esm3463609ejc.128.2022.04.25.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:51:05 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:50:47 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 08/21] media: rkisp1: regs: Don't use BIT() macro for
 multi-bit register fields
Message-ID: <YmZu98Tag1Re83D0@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-9-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The BIT() macro is meant to represent a single bit. It is incorrectly
> used for register field values that store the value 1 in a multi-bit
> field. Use the usual (1 << n) construct for those.
> 
> While at it, move RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED where it
> belongs with the other READ_FMT values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v3:
> 
> - Move RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED where it belongs
> ---
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index d326214c7e07..887f4768dc0a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -11,7 +11,7 @@
>  /* ISP_CTRL */
>  #define RKISP1_CIF_ISP_CTRL_ISP_ENABLE			BIT(0)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT		(0 << 1)
> -#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		BIT(1)
> +#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		(1 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601		(2 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601	(3 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE		(4 << 1)
> @@ -33,37 +33,37 @@
>  #define RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW		BIT(1)
>  #define RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW		BIT(2)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_RGGB		(0 << 3)
> -#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		BIT(3)
> +#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		(1 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GBRG		(2 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_BGGR		(3 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(pat)		((pat) << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_YCBYCR			(0 << 7)
> -#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			BIT(7)
> +#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			(1 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_CBYCRY			(2 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_CRYCBY			(3 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL		(0 << 9)
> -#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		BIT(9)
> +#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		(1 << 9)
>  #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ODD		(2 << 9)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B		(0 << 12)
> -#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		BIT(12)
> +#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		(1 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_MSB		(2 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO		(3 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_MSB		(4 << 12)
>  
>  /* VI_DPCL */
>  #define RKISP1_CIF_VI_DPCL_DMA_JPEG			(0 << 0)
> -#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		BIT(0)
> +#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		(1 << 0)
>  #define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_JPEG		(2 << 0)
> -#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			BIT(2)
> +#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			(1 << 2)
>  #define RKISP1_CIF_VI_DPCL_CHAN_MODE_SP			(2 << 2)
>  #define RKISP1_CIF_VI_DPCL_CHAN_MODE_MPSP		(3 << 2)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_SPMUX			(0 << 4)
> -#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			BIT(4)
> +#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			(1 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_IE			(2 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_JPEG			(3 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_ISP			(4 << 4)
>  #define RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL		(0 << 8)
> -#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			BIT(8)
> +#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			(1 << 8)
>  #define RKISP1_CIF_VI_DPCL_IF_SEL_MIPI			(2 << 8)
>  #define RKISP1_CIF_VI_DPCL_DMA_IE_MUX_DMA		BIT(10)
>  #define RKISP1_CIF_VI_DPCL_DMA_SP_MUX_DMA		BIT(11)
> @@ -112,26 +112,26 @@
>  #define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
>  #define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_16		(0 << 16)
> -#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		BIT(16)
> +#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		(1 << 16)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_64		(2 << 16)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_16		(0 << 18)
> -#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		BIT(18)
> +#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		(1 << 18)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_64		(2 << 18)
>  #define RKISP1_CIF_MI_CTRL_INIT_BASE_EN			BIT(20)
>  #define RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN		BIT(21)
>  #define RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8		(0 << 22)
> -#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		BIT(22)
> +#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		(1 << 22)
>  #define RKISP1_MI_CTRL_MP_WRITE_YUVINT			(2 << 22)
>  #define RKISP1_MI_CTRL_MP_WRITE_RAW12			(2 << 22)
>  #define RKISP1_MI_CTRL_SP_WRITE_PLA			(0 << 24)
> -#define RKISP1_MI_CTRL_SP_WRITE_SPLA			BIT(24)
> +#define RKISP1_MI_CTRL_SP_WRITE_SPLA			(1 << 24)
>  #define RKISP1_MI_CTRL_SP_WRITE_INT			(2 << 24)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV400			(0 << 26)
> -#define RKISP1_MI_CTRL_SP_INPUT_YUV420			BIT(26)
> +#define RKISP1_MI_CTRL_SP_INPUT_YUV420			(1 << 26)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV422			(2 << 26)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV444			(3 << 26)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV400			(0 << 28)
> -#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			BIT(28)
> +#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			(1 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV422			(2 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV444			(3 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_RGB565			(4 << 28)
> @@ -186,22 +186,22 @@
>  
>  /* MI_DMA_CTRL */
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_16		(0 << 0)
> -#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		BIT(0)
> +#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		(1 << 0)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_64		(2 << 0)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_16	(0 << 2)
> -#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	BIT(2)
> +#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	(1 << 2)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_64	(2 << 2)
>  #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PLANAR		(0 << 4)
> -#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		BIT(4)
> -#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
> -#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		BIT(6)
> +#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		(1 << 4)
>  #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED		(2 << 4)
> +#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
> +#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		(1 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV422		(2 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV444		(3 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_BYTE_SWAP		BIT(8)
>  #define RKISP1_CIF_MI_DMA_CTRL_CONTINUOUS_ENA		BIT(9)
>  #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_NO		(0 << 12)
> -#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		BIT(12)
> +#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		(1 << 12)
>  #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_16BIT		(2 << 12)
>  /* MI_DMA_START */
>  #define RKISP1_CIF_MI_DMA_START_ENABLE			BIT(0)
> @@ -282,10 +282,10 @@
>  #define RKISP1_CIF_C_PROC_TONE_RESERVED			0xF000
>  /* DUAL_CROP_CTRL */
>  #define RKISP1_CIF_DUAL_CROP_MP_MODE_BYPASS		(0 << 0)
> -#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		BIT(0)
> +#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		(1 << 0)
>  #define RKISP1_CIF_DUAL_CROP_MP_MODE_RAW		(2 << 0)
>  #define RKISP1_CIF_DUAL_CROP_SP_MODE_BYPASS		(0 << 2)
> -#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		BIT(2)
> +#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		(1 << 2)
>  #define RKISP1_CIF_DUAL_CROP_SP_MODE_RAW		(2 << 2)
>  #define RKISP1_CIF_DUAL_CROP_CFG_UPD_PERMANENT		BIT(4)
>  #define RKISP1_CIF_DUAL_CROP_CFG_UPD			BIT(5)
> @@ -294,7 +294,7 @@
>  /* IMG_EFF_CTRL */
>  #define RKISP1_CIF_IMG_EFF_CTRL_ENABLE			BIT(0)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE		(0 << 1)
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		BIT(1)
> +#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		(1 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA		(2 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL		(3 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS		(4 << 1)
> @@ -314,7 +314,7 @@
>  
>  /* IMG_EFF_COLOR_SEL */
>  #define RKISP1_CIF_IMG_EFF_COLOR_RGB			0
> -#define RKISP1_CIF_IMG_EFF_COLOR_B			BIT(0)
> +#define RKISP1_CIF_IMG_EFF_COLOR_B			(1 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_G			(2 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_GB			(3 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_R			(4 << 0)
> @@ -376,7 +376,7 @@
>  
>  /* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS_V10		(0 << 0)
> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		BIT(0)
> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		(1 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_RED_V10		(2 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN_V10		(3 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE_V10		(4 << 0)
> @@ -639,7 +639,7 @@
>  #define RKISP1_CIF_ISP_BLS_ENA				BIT(0)
>  #define RKISP1_CIF_ISP_BLS_MODE_MEASURED		BIT(1)
>  #define RKISP1_CIF_ISP_BLS_MODE_FIXED			0
> -#define RKISP1_CIF_ISP_BLS_WINDOW_1			BIT(2)
> +#define RKISP1_CIF_ISP_BLS_WINDOW_1			(1 << 2)
>  #define RKISP1_CIF_ISP_BLS_WINDOW_2			(2 << 2)
>  
>  /* GAMMA-IN */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
