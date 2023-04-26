Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2876EEB8D
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 02:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbjDZAmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 20:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238473AbjDZAmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 20:42:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE6518E98;
        Tue, 25 Apr 2023 17:42:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4A752CF;
        Wed, 26 Apr 2023 02:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682469736;
        bh=SAag8aJ1BC2P1SaBmc5qNaPC4McLvWFziPkSyIfZDyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HyfFHAUVzp5WOOOe9s4w7z+QX9JmODSto0YAh//2JlpEJKCNy5R0jkp8aP7VWSnV3
         +YGKnO4T4w4bknDhTiz2ijHgC6De94EQXMDg5yjurqu5U8SBf30dYZUsWlkw0nHXlQ
         V9O7m4kUrJXOWG0DDQoHFzDQFUT9GsU0RUQ7pwpc=
Date:   Wed, 26 Apr 2023 03:42:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: renesas: fdp1: Identify R-Car Gen2 versions
Message-ID: <20230426004237.GA31537@pendragon.ideasonboard.com>
References: <453e34f0eda526f79b0297952937dc0a0b5aacf8.1682435583.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <453e34f0eda526f79b0297952937dc0a0b5aacf8.1682435583.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Apr 25, 2023 at 05:15:02PM +0200, Geert Uytterhoeven wrote:
> On R-Car M2-W:
> 
>     rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
>     rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)
> 
> Although the IP Internal Data Register on R-Car Gen2 is documented to
> contain all zeros, the actual register contents seem to match the FDP1
> version ID of R-Car H3 ES1.*, which has just been removed.
> Fortunately this version is not used for any other purposes yet.
> 
> Fix this by re-adding the ID, now using an R-Car Gen2-specific name.
> 
> Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* handling")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
> ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.
> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
> index 99af68fddc9249f5..b0a694f9245cc2c6 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -254,6 +254,7 @@ MODULE_PARM_DESC(debug, "activate debug info");
>  
>  /* Internal Data (HW Version) */
>  #define FD1_IP_INTDATA			0x0800
> +#define FD1_IP_GEN2			0x02010101

A comment as requested by Wolfram would be nice. I'd mention here that
the same ID is used by H3 ES1.x. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  #define FD1_IP_M3W			0x02010202
>  #define FD1_IP_H3			0x02010203
>  #define FD1_IP_M3N			0x02010204
> @@ -2360,6 +2361,9 @@ static int fdp1_probe(struct platform_device *pdev)
>  
>  	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
>  	switch (hw_version) {
> +	case FD1_IP_GEN2:
> +		dprintk(fdp1, "FDP1 Version R-Car Gen2\n");
> +		break;
>  	case FD1_IP_M3W:
>  		dprintk(fdp1, "FDP1 Version R-Car M3-W\n");
>  		break;

-- 
Regards,

Laurent Pinchart
