Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBD857C583
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 09:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiGUHts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 03:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiGUHtq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 03:49:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E8F7CB58
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 00:49:44 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3137B496;
        Thu, 21 Jul 2022 09:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658389783;
        bh=CPjQHhrXXdyNa2+NGD8ownN20SJ22yDUQmBS/tUjUbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aNYKiXz7WpN2LBFAW9zYUS900Hz+ZLS9qF3Xl3TJ7fuDVlUZKqS8jcDWwNHU2ASQB
         vQfwopzVdaz9+nex/qcpa9LpWYTR7ZT3We5r4SN34BWLYe6MeuJOVbgjZiehJaii/D
         anGetrNb5eeMmlbjq2UTLYeMqvjggGstz/iGHkZ0=
Date:   Thu, 21 Jul 2022 16:49:35 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] media: rkisp1: Make local immutable array variables
 static const
Message-ID: <20220721074935.GI3984498@pyrite.rasen.tech>
References: <20220721065706.31710-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721065706.31710-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 21, 2022 at 09:57:06AM +0300, Laurent Pinchart wrote:
> The max_widths and max_heights variables in rkisp1_try_fmt() are
> immutable and don't need to be allocated on the stack every time the
> function is called. Make them static.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index ef3c9389d684..81177ad08cf0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1162,13 +1162,17 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>  			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
>  			   const struct v4l2_format_info **fmt_info)
>  {
> +	static const unsigned int max_widths[] = {
> +		RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> +		RKISP1_RSZ_SP_SRC_MAX_WIDTH,
> +	};
> +	static const unsigned int max_heights[] = {
> +		RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
> +		RKISP1_RSZ_SP_SRC_MAX_HEIGHT,
> +	};
>  	const struct rkisp1_capture_config *config = cap->config;
>  	const struct rkisp1_capture_fmt_cfg *fmt;
>  	const struct v4l2_format_info *info;
> -	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> -					    RKISP1_RSZ_SP_SRC_MAX_WIDTH };
> -	const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
> -					     RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
>  
>  	fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
>  	if (!fmt) {
