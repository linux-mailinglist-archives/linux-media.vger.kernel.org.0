Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8BE5B132C
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 06:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiIHELC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 00:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiIHELB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 00:11:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E457F08E
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 21:11:00 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F2546CC;
        Thu,  8 Sep 2022 06:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662610259;
        bh=44dHmJ4u22SzcVzZybrHJSce2B5/MoMpWxsvFGdar4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fdp8KBlrhJVpZ2FsaqEZJ7qSNALdOhmvdiSPBXDmEMFeTI8ef3KAf9KdVstldY3PA
         XLUXtPflXgCEBoThYS4/DffJVdqbXsFOwoyaH3P0qj+KvvQdOa3gIDa7KXw37iacdr
         kb68k3s5OCmiraGAF19A3u1Ze6wt2ZIOLlKKQdPI=
Date:   Thu, 8 Sep 2022 13:10:50 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 4/6] staging: media: imx: Drop IMX_MEDIA_GRP_ID_CSI
Message-ID: <20220908041050.GH1140330@pyrite.rasen.tech>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907200424.32136-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 11:04:22PM +0300, Laurent Pinchart wrote:
> The IMX_MEDIA_GRP_ID_CSI group ID isn't used anymore. Drop it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-dev-common.c | 1 -
>  drivers/staging/media/imx/imx-media.h            | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index 8f7ced3a9cca..991820a8500f 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -39,7 +39,6 @@ static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
>  	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
>  		/* skip if not a CSI or a CSI mux */
>  		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
> -		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
>  		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI_MUX))
>  			continue;
>  
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index f263fc3adbb9..5e794f291da6 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -299,7 +299,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
>  
>  /* subdev group ids */
>  #define IMX_MEDIA_GRP_ID_CSI2          BIT(8)
> -#define IMX_MEDIA_GRP_ID_CSI           BIT(9)
>  #define IMX_MEDIA_GRP_ID_IPU_CSI_BIT   10
>  #define IMX_MEDIA_GRP_ID_IPU_CSI       (0x3 << IMX_MEDIA_GRP_ID_IPU_CSI_BIT)
>  #define IMX_MEDIA_GRP_ID_IPU_CSI0      BIT(IMX_MEDIA_GRP_ID_IPU_CSI_BIT)
