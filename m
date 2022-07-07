Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F25F56A657
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 16:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbiGGO42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 10:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235645AbiGGO4D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 10:56:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB5115A2C
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 07:54:51 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A04B326;
        Thu,  7 Jul 2022 16:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657205690;
        bh=tnm247nhSqZsDLLKpK3xMsn+1NnqphDazCIWy6lOt1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hv2DRJfeREikt67Q39dn7JA0Qcf7j4pQ+7M/Wqdq3um2x+sv/XsyRJZhcdgQpuMIY
         gmcsTjO0tect08/loiEsDglRCXeMBoPLDDTbkCVuhJi1xmtkO64fIt2J/JVezGU4yn
         qMog2jCXJGKiVKVUPkP3Gha7jinAXa9UlYbGo3TA=
Date:   Thu, 7 Jul 2022 23:54:41 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 34/55] media: rkisp1: isp: Initialize some variables
 at declaration time
Message-ID: <20220707145441.GR3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-35-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-35-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:52AM +0300, Laurent Pinchart wrote:
> Initialize the src_fmt and sink_fmt variable when declaring them in
> rkisp1_config_isp().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 938541ce52ce..53f0516594ef 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -142,12 +142,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  {
>  	struct rkisp1_device *rkisp1 = isp->rkisp1;
>  	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
> -	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
> +	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
> +	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
>  	struct v4l2_mbus_framefmt *sink_frm;
>  	struct v4l2_rect *sink_crop;
>  
> -	sink_fmt = isp->sink_fmt;
> -	src_fmt = isp->src_fmt;
>  	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
>  					  RKISP1_ISP_PAD_SINK_VIDEO,
>  					  V4L2_SUBDEV_FORMAT_ACTIVE);
