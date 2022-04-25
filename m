Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C7E50DF70
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiDYLzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbiDYLzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:55:39 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40BD13DCA
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:52:33 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r13so29112161ejd.5
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EF9uo8DAJAgucJr2sOJJIteNlLGTCrdyTxetLoJ3Wzc=;
        b=G4t+3akTuo6RNho9wE/xnBMRkZaEAxo8Aa1nPauY8BmZJHY1rICJ8+LvvnLLW7oJx9
         AE9sowddd97dz1loNTIzlb2KqsEyChCCPfJqus7jzZ1iOKOviMyRGIU9yvkHJiuD2GI2
         R+qv1MQp/DDhcIGUrLulDJHcRCMzzHMzjI9t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EF9uo8DAJAgucJr2sOJJIteNlLGTCrdyTxetLoJ3Wzc=;
        b=XI7GwvD2nmAOY1n4hZ36sAJULDId3wp+hquPAnsPFhbeqAbuxqyyDoBH6hF1jhwzSl
         PmKtjmYcefQvAjzxdSG+BePCrEiVv7+I4iSIUWbSNyUI2L7N+gry+jKWjcuzHu88Qq3Q
         Zf7Pwyk0XylMZ1sxAZn6FXxPX+np1PYNivBALzKTi/ParwfNQ06vWejFbCo4qavmp5zK
         VyOJtTUlqqOlCpghgR2TktLL6oW4HK2LjQznnclXc5JEhngH221mvQ87p/U4zKyyz7jY
         GTCuWP5HE2fkCXFmfYX96RHEbYeuHCrhYrMS9ebhkBawNwGSISEiL4Zvk3/pVStJT49h
         wI5g==
X-Gm-Message-State: AOAM530K9Q5QtKIYL3pV/1fauxf7iaVn/PPaMUZw9Mjp9ejM+LmI/5W8
        7++8JsRZusAijtNTc2ZsRrw+Zg==
X-Google-Smtp-Source: ABdhPJzzCkz28sGq97VxSslhlPAPWiEiq0fmx9EE+E28YxrTRIHS8xpl9G9437Kq5OUuZXwDdBeVgw==
X-Received: by 2002:a17:907:a412:b0:6f0:1071:25ac with SMTP id sg18-20020a170907a41200b006f0107125acmr16019319ejc.261.1650887552584;
        Mon, 25 Apr 2022 04:52:32 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709064f0f00b006f00349c4c3sm3481279eju.122.2022.04.25.04.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:52:32 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:52:14 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 20/21] media: rkisp1: Align macro definitions
Message-ID: <YmaLbhEArcbCC/Ho@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-21-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-21-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Make the code more readable by using the same alignment for all macros
> in rkisp1-common.h.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index a7ffe2830fa8..4243ff5e2197 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -29,14 +29,14 @@ struct dentry;
>   * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
>   * on which pad the media bus format is supported
>   */
> -#define RKISP1_ISP_SD_SRC BIT(0)
> -#define RKISP1_ISP_SD_SINK BIT(1)
> +#define RKISP1_ISP_SD_SRC			BIT(0)
> +#define RKISP1_ISP_SD_SINK			BIT(1)
>  
>  /* min and max values for the widths and heights of the entities */
> -#define RKISP1_ISP_MAX_WIDTH		4032
> -#define RKISP1_ISP_MAX_HEIGHT		3024
> -#define RKISP1_ISP_MIN_WIDTH		32
> -#define RKISP1_ISP_MIN_HEIGHT		32
> +#define RKISP1_ISP_MAX_WIDTH			4032
> +#define RKISP1_ISP_MAX_HEIGHT			3024
> +#define RKISP1_ISP_MIN_WIDTH			32
> +#define RKISP1_ISP_MIN_HEIGHT			32
>  
>  #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
>  #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
> @@ -46,20 +46,20 @@ struct dentry;
>  #define RKISP1_RSZ_SRC_MIN_HEIGHT		16
>  
>  /* the default width and height of all the entities */
> -#define RKISP1_DEFAULT_WIDTH		800
> -#define RKISP1_DEFAULT_HEIGHT		600
> +#define RKISP1_DEFAULT_WIDTH			800
> +#define RKISP1_DEFAULT_HEIGHT			600
>  
> -#define RKISP1_DRIVER_NAME	"rkisp1"
> -#define RKISP1_BUS_INFO		"platform:" RKISP1_DRIVER_NAME
> +#define RKISP1_DRIVER_NAME			"rkisp1"
> +#define RKISP1_BUS_INFO				"platform:" RKISP1_DRIVER_NAME
>  
>  /* maximum number of clocks */
> -#define RKISP1_MAX_BUS_CLK	8
> +#define RKISP1_MAX_BUS_CLK			8
>  
>  /* a bitmask of the ready stats */
> -#define RKISP1_STATS_MEAS_MASK		(RKISP1_CIF_ISP_AWB_DONE |	\
> -					 RKISP1_CIF_ISP_AFM_FIN |	\
> -					 RKISP1_CIF_ISP_EXP_END |	\
> -					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
> +#define RKISP1_STATS_MEAS_MASK			(RKISP1_CIF_ISP_AWB_DONE |	\
> +						 RKISP1_CIF_ISP_AFM_FIN |	\
> +						 RKISP1_CIF_ISP_EXP_END |	\
> +						 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>  
>  /* enum for the resizer pads */
>  enum rkisp1_rsz_pad {
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
