Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8078575C95
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbiGOHoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiGOHoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:44:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06747C1B4
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 00:44:37 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4E1993;
        Fri, 15 Jul 2022 09:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657871075;
        bh=EYq45zGoUpOXunsfzllgRnepVXXmx+WGLuPM9ZT1l9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WmSEmGcLE4C6+NHwAFufW+M0JB+gd9R58ZpbC+Ha77LJBdXjXZje+YHcKGWe2bDmX
         zwLRIeCrLjvZIv/xzsy4p9nC2LvxvBGC/5FuvZUBaGYtMPJLwL2bBQzZ4gQuRWEwup
         Bv0Mo5JjklzFFEUcJ7MNPGCIFaOQtBeSSLwvqI0I=
Date:   Fri, 15 Jul 2022 16:44:28 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 1/3] media: rockchip: rkisp1: Set DPCC methods enable
 bits inside loop
Message-ID: <20220715074428.GE3411283@pyrite.rasen.tech>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
 <20220616160456.21549-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616160456.21549-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 16, 2022 at 07:04:54PM +0300, Laurent Pinchart wrote:
> The rkisp1_dpcc_config() function looks over methods sets to configure
> them, but sets the RKISP1_CIF_ISP_DPCC_METHODS_SET_* registers outside
> of the loop with hand-unrolled code. Move this to the loop to simplify
> the code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c88a9c0fa86e..140012fa18f0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -18,6 +18,8 @@
>  #define RKISP1_ISP_PARAMS_REQ_BUFS_MIN	2
>  #define RKISP1_ISP_PARAMS_REQ_BUFS_MAX	8
>  
> +#define RKISP1_ISP_DPCC_METHODS_SET(n) \
> +			(RKISP1_CIF_ISP_DPCC_METHODS_SET_1 + 0x4 * (n))
>  #define RKISP1_ISP_DPCC_LINE_THRESH(n) \
>  			(RKISP1_CIF_ISP_DPCC_LINE_THRESH_1 + 0x14 * (n))
>  #define RKISP1_ISP_DPCC_LINE_MAD_FAC(n) \
> @@ -66,13 +68,9 @@ static void rkisp1_dpcc_config(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_SET_USE,
>  		     arg->set_use);
>  
> -	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_1,
> -		     arg->methods[0].method);
> -	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_2,
> -		     arg->methods[1].method);
> -	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_3,
> -		     arg->methods[2].method);
>  	for (i = 0; i < RKISP1_CIF_ISP_DPCC_METHODS_MAX; i++) {
> +		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_METHODS_SET(i),
> +			     arg->methods[i].method);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_THRESH(i),
>  			     arg->methods[i].line_thresh);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_MAD_FAC(i),
