Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAEF5A1749
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 18:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242849AbiHYQ4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 12:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbiHYQ4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 12:56:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA31AC25C
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 09:56:04 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C91E2B3;
        Thu, 25 Aug 2022 18:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661446563;
        bh=jSi0ZyNQnaU7/n7ajgbXz0WChMQQ8z24m1K2AixXa44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M0iyvhu4OKv2ZcFt/Keci7JrPHROaH3OiVqmTXr+oqYDieeYOQOj59sHQ+CMW6+ac
         +Dvrp7k/6Mitan+a55UJV5m+58uKk8oLSm0aXQrUt+FCWUt7/5dKiJBHBAvJgbnUz3
         G64T0sAnid6s9XCIvcxzQ6NEQzp3OTGY4Vavshz4=
Date:   Thu, 25 Aug 2022 11:55:55 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 5/9] media: rkisp1: Configure quantization using ISP
 source pad
Message-ID: <20220825165555.GH109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-6-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:36PM +0300, Laurent Pinchart wrote:
> The rkisp1_config_isp() function uses the format on the sink pad of the
> ISP to configure quantization at the output of the ISP. This is
> incorrect, as hinted by the src_frm variable name that stores the
> format. Fix it by using the source pad.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 7869f0cced62..babf88066c2e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -341,7 +341,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  		struct v4l2_mbus_framefmt *src_frm;
>  
>  		src_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
> -						 RKISP1_ISP_PAD_SINK_VIDEO,
> +						 RKISP1_ISP_PAD_SOURCE_VIDEO,
>  						 V4L2_SUBDEV_FORMAT_ACTIVE);
>  		rkisp1_params_configure(&rkisp1->params, sink_fmt->bayer_pat,
>  					src_frm->quantization);
