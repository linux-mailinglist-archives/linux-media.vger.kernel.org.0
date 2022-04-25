Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595A550DD51
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbiDYJz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiDYJzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:55:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFA93EBBB
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:52:12 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so28494181ejd.9
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=53PzOAb/6ZIFsnfh5G8KIpLpMHisHpH8jbCospIPB5Y=;
        b=cdihKGMmfIlx0x7OoCDE4JJHr4/I0N0m3/7hIJ+hxcqlMNeEutPQDBvWLK96q2XHzd
         hwRbtYFYDRnu5oUGHeSk5xq5113OSbzD9M59ryGa1DcdUl4WGzf/oKadSnXCnsUrXbsK
         krzC50c8zio24zIiaYGNJruDcFgsVtVdNBc4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=53PzOAb/6ZIFsnfh5G8KIpLpMHisHpH8jbCospIPB5Y=;
        b=EFwL/jRQYqgoUbihpFbH27RrRO3z6dnRX0+hohj/Yk5i7z3atNj81cfdhsOlRsy/hV
         dh6Hswsw2J2wMlDXv46cJqs+Fbz1eOMOfok9XLnpx9zBquCNX4eLe8IpFNBPb6FewT3E
         zlJlBe57n6yuC59k1k3MspViMuleFaUipEOgBZM1mev9zTRJZTpcvKuCW8IzbQP7n4LY
         6KvxbGZF1EKtoP6lTZI7vZlTxLAwtLT9kE3TouuqUfMqEC7q9X3DsYCnE1IuFOFtHXwj
         yjZZPdHw0GKFefKrRlFT5mgbr6Qv4rO9BeQKt98e7mjFPI87hBj9NrkpmgjAdAAPUne7
         Mstg==
X-Gm-Message-State: AOAM531gqhL71nzwSuP/DY08vAPmYdxF03Y1iOMg3tT5rRHCX2o8D/Pz
        oMrVypX5p5/WKkVVwCNbsqKLDg==
X-Google-Smtp-Source: ABdhPJxTf7T92A+nZyK8/+UutZf/nt6FBewyx0ovWDOKY/eJ5r5YK7HzQFerdOCItdCcQjBI1en7aQ==
X-Received: by 2002:a17:906:cf84:b0:6f3:a3d8:365f with SMTP id um4-20020a170906cf8400b006f3a3d8365fmr589460ejb.242.1650880331316;
        Mon, 25 Apr 2022 02:52:11 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id b89-20020a509f62000000b00425e21479fdsm1647679edf.19.2022.04.25.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:52:11 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:51:53 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 09/21] media: rkisp1: regs: Rename CCL, ICCL and IRCL
 registers with VI_ prefix
Message-ID: <YmZvOXPfxZ7UYPhw@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-10-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The documentation names the CCL, ICCL and IRCL registers with a VI_
> prefix, like the VI_ID and VI_DPCL registers. Fix the macro names
> accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 19 +++---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  8 +--
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 60 +++++++++----------
>  3 files changed, 44 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 4f7b2157b8cc..3c77cec568fb 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -523,20 +523,21 @@ static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
>  	readx_poll_timeout(readl, rkisp1->base_addr + RKISP1_CIF_ISP_RIS,
>  			   val, val & RKISP1_CIF_ISP_OFF, 20, 100);
>  	rkisp1_write(rkisp1,
> -		     RKISP1_CIF_IRCL_MIPI_SW_RST | RKISP1_CIF_IRCL_ISP_SW_RST,
> -		     RKISP1_CIF_IRCL);
> -	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_IRCL);
> +		     RKISP1_CIF_VI_IRCL_MIPI_SW_RST |
> +		     RKISP1_CIF_VI_IRCL_ISP_SW_RST,
> +		     RKISP1_CIF_VI_IRCL);
> +	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_VI_IRCL);
>  }
>  
>  static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
>  {
> -	u32 val = RKISP1_CIF_ICCL_ISP_CLK | RKISP1_CIF_ICCL_CP_CLK |
> -		  RKISP1_CIF_ICCL_MRSZ_CLK | RKISP1_CIF_ICCL_SRSZ_CLK |
> -		  RKISP1_CIF_ICCL_JPEG_CLK | RKISP1_CIF_ICCL_MI_CLK |
> -		  RKISP1_CIF_ICCL_IE_CLK | RKISP1_CIF_ICCL_MIPI_CLK |
> -		  RKISP1_CIF_ICCL_DCROP_CLK;
> +	u32 val = RKISP1_CIF_VI_ICCL_ISP_CLK | RKISP1_CIF_VI_ICCL_CP_CLK |
> +		  RKISP1_CIF_VI_ICCL_MRSZ_CLK | RKISP1_CIF_VI_ICCL_SRSZ_CLK |
> +		  RKISP1_CIF_VI_ICCL_JPEG_CLK | RKISP1_CIF_VI_ICCL_MI_CLK |
> +		  RKISP1_CIF_VI_ICCL_IE_CLK | RKISP1_CIF_VI_ICCL_MIPI_CLK |
> +		  RKISP1_CIF_VI_ICCL_DCROP_CLK;
>  
> -	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
> +	rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ICCL);
>  
>  	/* ensure sp and mp can run at the same time in V12 */
>  	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index f6da2571b55f..cb5840b5d974 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1058,8 +1058,8 @@ static void rkisp1_ie_config(struct rkisp1_params *params,
>  static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
>  {
>  	if (en) {
> -		rkisp1_param_set_bits(params, RKISP1_CIF_ICCL,
> -				      RKISP1_CIF_ICCL_IE_CLK);
> +		rkisp1_param_set_bits(params, RKISP1_CIF_VI_ICCL,
> +				      RKISP1_CIF_VI_ICCL_IE_CLK);
>  		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_CTRL_ENABLE,
>  			     RKISP1_CIF_IMG_EFF_CTRL);
>  		rkisp1_param_set_bits(params, RKISP1_CIF_IMG_EFF_CTRL,
> @@ -1067,8 +1067,8 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
>  	} else {
>  		rkisp1_param_clear_bits(params, RKISP1_CIF_IMG_EFF_CTRL,
>  					RKISP1_CIF_IMG_EFF_CTRL_ENABLE);
> -		rkisp1_param_clear_bits(params, RKISP1_CIF_ICCL,
> -					RKISP1_CIF_ICCL_IE_CLK);
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_VI_ICCL,
> +					RKISP1_CIF_VI_ICCL_IE_CLK);
>  	}
>  }
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 887f4768dc0a..0f6ea67b4d5a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -210,7 +210,7 @@
>  #define RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP	BIT(1)
>  #define RKISP1_CIF_MI_XTD_FMT_CTRL_DMA_CB_CR_SWAP	BIT(2)
>  
> -/* CCL */
> +/* VI_CCL */
>  #define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
>  /* VI_ISP_CLK_CTRL */
>  #define RKISP1_CIF_CLK_CTRL_ISP_RAW			BIT(0)
> @@ -241,32 +241,32 @@
>  #define RKISP1_CIF_CLK_CTRL_RSZS			BIT(25)
>  #define RKISP1_CIF_CLK_CTRL_MIPI			BIT(26)
>  #define RKISP1_CIF_CLK_CTRL_MARVINMI			BIT(27)
> -/* ICCL */
> -#define RKISP1_CIF_ICCL_ISP_CLK				BIT(0)
> -#define RKISP1_CIF_ICCL_CP_CLK				BIT(1)
> -#define RKISP1_CIF_ICCL_RES_2				BIT(2)
> -#define RKISP1_CIF_ICCL_MRSZ_CLK			BIT(3)
> -#define RKISP1_CIF_ICCL_SRSZ_CLK			BIT(4)
> -#define RKISP1_CIF_ICCL_JPEG_CLK			BIT(5)
> -#define RKISP1_CIF_ICCL_MI_CLK				BIT(6)
> -#define RKISP1_CIF_ICCL_RES_7				BIT(7)
> -#define RKISP1_CIF_ICCL_IE_CLK				BIT(8)
> -#define RKISP1_CIF_ICCL_SIMP_CLK			BIT(9)
> -#define RKISP1_CIF_ICCL_SMIA_CLK			BIT(10)
> -#define RKISP1_CIF_ICCL_MIPI_CLK			BIT(11)
> -#define RKISP1_CIF_ICCL_DCROP_CLK			BIT(12)
> -/* IRCL */
> -#define RKISP1_CIF_IRCL_ISP_SW_RST			BIT(0)
> -#define RKISP1_CIF_IRCL_CP_SW_RST			BIT(1)
> -#define RKISP1_CIF_IRCL_YCS_SW_RST			BIT(2)
> -#define RKISP1_CIF_IRCL_MRSZ_SW_RST			BIT(3)
> -#define RKISP1_CIF_IRCL_SRSZ_SW_RST			BIT(4)
> -#define RKISP1_CIF_IRCL_JPEG_SW_RST			BIT(5)
> -#define RKISP1_CIF_IRCL_MI_SW_RST			BIT(6)
> -#define RKISP1_CIF_IRCL_CIF_SW_RST			BIT(7)
> -#define RKISP1_CIF_IRCL_IE_SW_RST			BIT(8)
> -#define RKISP1_CIF_IRCL_SI_SW_RST			BIT(9)
> -#define RKISP1_CIF_IRCL_MIPI_SW_RST			BIT(11)
> +/* VI_ICCL */
> +#define RKISP1_CIF_VI_ICCL_ISP_CLK			BIT(0)
> +#define RKISP1_CIF_VI_ICCL_CP_CLK			BIT(1)
> +#define RKISP1_CIF_VI_ICCL_RES_2			BIT(2)
> +#define RKISP1_CIF_VI_ICCL_MRSZ_CLK			BIT(3)
> +#define RKISP1_CIF_VI_ICCL_SRSZ_CLK			BIT(4)
> +#define RKISP1_CIF_VI_ICCL_JPEG_CLK			BIT(5)
> +#define RKISP1_CIF_VI_ICCL_MI_CLK			BIT(6)
> +#define RKISP1_CIF_VI_ICCL_RES_7			BIT(7)
> +#define RKISP1_CIF_VI_ICCL_IE_CLK			BIT(8)
> +#define RKISP1_CIF_VI_ICCL_SIMP_CLK			BIT(9)
> +#define RKISP1_CIF_VI_ICCL_SMIA_CLK			BIT(10)
> +#define RKISP1_CIF_VI_ICCL_MIPI_CLK			BIT(11)
> +#define RKISP1_CIF_VI_ICCL_DCROP_CLK			BIT(12)
> +/* VI_IRCL */
> +#define RKISP1_CIF_VI_IRCL_ISP_SW_RST			BIT(0)
> +#define RKISP1_CIF_VI_IRCL_CP_SW_RST			BIT(1)
> +#define RKISP1_CIF_VI_IRCL_YCS_SW_RST			BIT(2)
> +#define RKISP1_CIF_VI_IRCL_MRSZ_SW_RST			BIT(3)
> +#define RKISP1_CIF_VI_IRCL_SRSZ_SW_RST			BIT(4)
> +#define RKISP1_CIF_VI_IRCL_JPEG_SW_RST			BIT(5)
> +#define RKISP1_CIF_VI_IRCL_MI_SW_RST			BIT(6)
> +#define RKISP1_CIF_VI_IRCL_CIF_SW_RST			BIT(7)
> +#define RKISP1_CIF_VI_IRCL_IE_SW_RST			BIT(8)
> +#define RKISP1_CIF_VI_IRCL_SI_SW_RST			BIT(9)
> +#define RKISP1_CIF_VI_IRCL_MIPI_SW_RST			BIT(11)
>  
>  /* C_PROC_CTR */
>  #define RKISP1_CIF_C_PROC_CTR_ENABLE			BIT(0)
> @@ -687,11 +687,11 @@
>  /*                            CIF Registers                            */
>  /* =================================================================== */
>  #define RKISP1_CIF_CTRL_BASE			0x00000000
> -#define RKISP1_CIF_CCL				(RKISP1_CIF_CTRL_BASE + 0x00000000)
> +#define RKISP1_CIF_VI_CCL			(RKISP1_CIF_CTRL_BASE + 0x00000000)
>  #define RKISP1_CIF_VI_ID			(RKISP1_CIF_CTRL_BASE + 0x00000008)
>  #define RKISP1_CIF_VI_ISP_CLK_CTRL_V12		(RKISP1_CIF_CTRL_BASE + 0x0000000C)
> -#define RKISP1_CIF_ICCL				(RKISP1_CIF_CTRL_BASE + 0x00000010)
> -#define RKISP1_CIF_IRCL				(RKISP1_CIF_CTRL_BASE + 0x00000014)
> +#define RKISP1_CIF_VI_ICCL			(RKISP1_CIF_CTRL_BASE + 0x00000010)
> +#define RKISP1_CIF_VI_IRCL			(RKISP1_CIF_CTRL_BASE + 0x00000014)
>  #define RKISP1_CIF_VI_DPCL			(RKISP1_CIF_CTRL_BASE + 0x00000018)
>  
>  #define RKISP1_CIF_IMG_EFF_BASE			0x00000200
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
