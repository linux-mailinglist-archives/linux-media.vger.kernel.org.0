Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040A15B12D8
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 05:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiIHDVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 23:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIHDU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 23:20:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831BDA1A52
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 20:20:55 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A46D06CC;
        Thu,  8 Sep 2022 05:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662607253;
        bh=AuTbnSWruX+Fteo/uZiO4p+MeMp7oMGjv5J4fsw2rgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rq1ZUS69PyXVsD6rvERoq+cwpqmKis5axqYXDw8HCkmLQm2cxFEGvN8YoNcBaz+p2
         pXTnojf20ne84tMgBRVQNPx8RO0UKcBITo99YpJuvovrahs1UM5uwmCi9UYrLDyA9W
         4ev7OyqkUe9eOVS+Ifb07Tr5vEYdHJfbBfHw9A1w=
Date:   Thu, 8 Sep 2022 12:20:43 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/3] media: imx: imx7-media-csi: Move variable to loop
 scope
Message-ID: <20220908032043.GB1140330@pyrite.rasen.tech>
References: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
 <20220907191547.19255-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907191547.19255-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 10:15:45PM +0300, Laurent Pinchart wrote:
> The phys variable is only used as a local loop variable in
> imx7_csi_setup_vb2_buf(), with each entry in the array being used in the
> corresponding iteration of the loop only. Move it to loop scope,
> simplifying the array to a single variable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 336f746ae324..1aef2cf41745 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -399,21 +399,22 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
>  {
>  	struct imx7_csi_vb2_buffer *buf;
>  	struct vb2_buffer *vb2_buf;
> -	dma_addr_t phys[2];
>  	int i;
>  
>  	for (i = 0; i < 2; i++) {
> +		dma_addr_t phys;
> +
>  		buf = imx7_csi_video_next_buf(csi);
>  		if (buf) {
>  			csi->active_vb2_buf[i] = buf;
>  			vb2_buf = &buf->vbuf.vb2_buf;
> -			phys[i] = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
> +			phys = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
>  		} else {
>  			csi->active_vb2_buf[i] = NULL;
> -			phys[i] = csi->underrun_buf.phys;
> +			phys = csi->underrun_buf.phys;
>  		}
>  
> -		imx7_csi_update_buf(csi, phys[i], i);
> +		imx7_csi_update_buf(csi, phys, i);
>  	}
>  }
