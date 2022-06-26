Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E4B55B19A
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 13:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiFZLia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 07:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiFZLi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 07:38:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7978911A3B
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 04:38:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BAD747C;
        Sun, 26 Jun 2022 13:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656243503;
        bh=+X7KAMy4Z/g/StPD+Ch2XigJtXqOKGwbT/vawrogbHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p6tVhoj2BPXP3AxmCD1rhf2e3ifFaP0ndJuPNMmrcRO7vNMGtcZBaVdzXSDbL5hSf
         35TWbWvI3TClqhUbikHHEczuK4gsIDkWWxANivKrc9NEP2bEXNbT/oBYAk8hdscJcM
         cBOUE1np0adTEQsyFc6ItHm1syQCeDonCLXN6vvA=
Date:   Sun, 26 Jun 2022 14:38:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 53/55] media: rkisp1: Shift DMA buffer addresses on
 i.MX8MP
Message-ID: <YrhFHt+PsaWXsTUD@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-54-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-54-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Wed, Jun 15, 2022 at 04:11:25AM +0900, Paul Elder wrote:
> On the ISP that is integrated in the i.MX8MP, the DMA base addresses are
> encoded in 34-bit. Shift them to the left by 2 bits so that they can be

I think you meant right, not left.

> contained in 32 bits.

The important part here is that this is how the address is encoded in
the hardware. I suppose it's obvious, otherwise it woudln't work at all,
but maybe it could be explained more explicitly ?

On the ISP that is integrated in the i.MX8MP, DMA addresses have been
extended to 34 bits, with the 32 MSBs stored in the DMA address
registers and the 2 LSBs set to 0. Shift the buffer addresses right by 2
on that platform.

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 19 +++++++++++--------
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  3 ++-
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 35cec263c563..234b1f8488cb 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -624,6 +624,9 @@ static void rkisp1_dummy_buf_destroy(struct rkisp1_capture *cap)
>  
>  static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  {
> +	u8 shift = cap->rkisp1->info->features & RKISP1_FEATURE_DMA_34BIT ?
> +		   2 : 0;
> +
>  	cap->buf.curr = cap->buf.next;
>  	cap->buf.next = NULL;
>  
> @@ -636,7 +639,7 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  		buff_addr = cap->buf.next->buff_addr;
>  
>  		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
> -			     buff_addr[RKISP1_PLANE_Y]);
> +			     buff_addr[RKISP1_PLANE_Y] >> shift);
>  		/*
>  		 * In order to support grey format we capture
>  		 * YUV422 planar format from the camera and
> @@ -645,17 +648,17 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
>  			rkisp1_write(cap->rkisp1,
>  				     cap->config->mi.cb_base_ad_init,
> -				     cap->buf.dummy.dma_addr);
> +				     cap->buf.dummy.dma_addr >> shift);
>  			rkisp1_write(cap->rkisp1,
>  				     cap->config->mi.cr_base_ad_init,
> -				     cap->buf.dummy.dma_addr);
> +				     cap->buf.dummy.dma_addr >> shift);
>  		} else {
>  			rkisp1_write(cap->rkisp1,
>  				     cap->config->mi.cb_base_ad_init,
> -				     buff_addr[RKISP1_PLANE_CB]);
> +				     buff_addr[RKISP1_PLANE_CB] >> shift);
>  			rkisp1_write(cap->rkisp1,
>  				     cap->config->mi.cr_base_ad_init,
> -				     buff_addr[RKISP1_PLANE_CR]);
> +				     buff_addr[RKISP1_PLANE_CR] >> shift);
>  		}
>  	} else {
>  		/*
> @@ -663,11 +666,11 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>  		 * throw data if there is no available buffer.
>  		 */
>  		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
> -			     cap->buf.dummy.dma_addr);
> +			     cap->buf.dummy.dma_addr >> shift);
>  		rkisp1_write(cap->rkisp1, cap->config->mi.cb_base_ad_init,
> -			     cap->buf.dummy.dma_addr);
> +			     cap->buf.dummy.dma_addr >> shift);
>  		rkisp1_write(cap->rkisp1, cap->config->mi.cr_base_ad_init,
> -			     cap->buf.dummy.dma_addr);
> +			     cap->buf.dummy.dma_addr >> shift);
>  	}
>  
>  	/* Set plane offsets */
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 96657e55a5b0..0b834579d08c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -113,6 +113,7 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_DUAL_CROP = BIT(1),
>  	RKISP1_FEATURE_RSZ_CROP = BIT(2),
>  	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),
> +	RKISP1_FEATURE_DMA_34BIT = BIT(4),
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index d68a805e8b6b..4c77aa2bc50a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -506,7 +506,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
>  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
>  	.isp_ver = IMX8MP_V10,
>  	.features = RKISP1_FEATURE_RSZ_CROP
> -		  | RKISP1_FEATURE_MAIN_STRIDE,
> +		  | RKISP1_FEATURE_MAIN_STRIDE
> +		  | RKISP1_FEATURE_DMA_34BIT,
>  };
>  
>  static const struct of_device_id rkisp1_of_match[] = {

-- 
Regards,

Laurent Pinchart
