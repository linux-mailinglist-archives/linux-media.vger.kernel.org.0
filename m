Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F415C5992DD
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbiHSCBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbiHSCBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:01:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D9ADCFE1;
        Thu, 18 Aug 2022 19:01:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 498F63F1;
        Fri, 19 Aug 2022 04:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660874472;
        bh=yUNwAR0eAnW44PVw7Dor2GeL5K5d/TyZGCrLPhkWrZ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JX+0HQ7nSuidUbmNcZsFtnHzpxHKyVkhYUHyLttjEUxylc97F6uTiBMlbLlg/xplx
         Q3ko6fM6cBzvfGg6vtrMrijeIIVwNmCoPiw54hU/nhUA57LNFYVr18L3Rjl62Wgvpn
         c56igeCZoGMLE61Tl/15PEhBo2DNRQL4AzYH8y6M=
Date:   Fri, 19 Aug 2022 05:01:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Message-ID: <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810083711.219642-2-taki@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hayama-san,

Thank you for the patch.

On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:
> To support DRM blend mode in R-Car DU driver, we must be able to pass
> a plane with the premultiplied alpha. Adding a new property to
> vsp1_du_atomic_config allows the R-Car DU driver to pass the
> premultiplied alpha plane.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
>  include/media/vsp1.h                           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 0c2507dc03d6..019e18976bd8 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>  	rpf->mem.addr[1] = cfg->mem[1];
>  	rpf->mem.addr[2] = cfg->mem[2];
>  
> +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;

I'll drop the parentheses when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	vsp1->drm->inputs[rpf_index].crop = cfg->src;
>  	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
>  	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index cc1b0d42ce95..48f4a5023d81 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>   * @dst: destination rectangle on the display (integer coordinates)
>   * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>   * @zpos: Z position of the plane (from 0 to number of planes minus 1)
> + * @premult: true for premultiplied alpha
>   */
>  struct vsp1_du_atomic_config {
>  	u32 pixelformat;
> @@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
>  	struct v4l2_rect dst;
>  	unsigned int alpha;
>  	unsigned int zpos;
> +	bool premult;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
