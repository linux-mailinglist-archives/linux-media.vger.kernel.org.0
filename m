Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA1C651506
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 22:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiLSVi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 16:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiLSVi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 16:38:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86592767E;
        Mon, 19 Dec 2022 13:38:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 119AE825;
        Mon, 19 Dec 2022 22:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671485904;
        bh=pWvj+TZlYF5MAnXYt4SAFsLGUF5G5mRhNSnVQfxfWJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jqmT3MM/+Hzqwi+5yksB1H1LpQoSrjnZ8p/dJl5lyZuQ1lCAfia8KzHc+7I4omTO7
         J2c31cys4tzJRGVdM5Geot8R/aEs6LniKkq2pM/ohhK5hgZBl1bSLwUTozhjYv+CH6
         14PtoyvoUvIXAqX8IYXm65kybU+hEgiVbGI8YYCY=
Date:   Mon, 19 Dec 2022 23:38:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 6/7] drm: rcar-du: Bump V3U to gen 4
Message-ID: <Y6DZzPtR5tVDkL/S@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-7-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219140139.294245-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Dec 19, 2022 at 04:01:38PM +0200, Tomi Valkeinen wrote:
> V3U is actually gen 4 IP, like in V4H. Bumb up V3U gen in the
> rcar_du_r8a779a0_info.

With the typo reporting by Kieran fixed,

Conditionally-Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 46c60a2d710d..c7c5217cfc1a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -504,7 +504,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> -	.gen = 3,
> +	.gen = 4,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_NO_BLENDING,

-- 
Regards,

Laurent Pinchart
