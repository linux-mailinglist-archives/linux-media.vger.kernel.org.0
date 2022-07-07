Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933AE56A5E5
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 16:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235999AbiGGOso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 10:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbiGGOsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 10:48:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8055E12763
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 07:48:30 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95FBC326;
        Thu,  7 Jul 2022 16:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657205308;
        bh=XC1WR/Gw6LfjJ8b1BbAg3Dw4N0ZBqngLCBiD8W/eWO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JOcqjCBAhABpMep5reCDv0xg2EtIS38lr8glCRVPLTJf7IQNq3thb8Bb2/H9J+x/b
         NZJa02gYRIfIYJC+KxlWKxyCMpIa5fFUASY1Oh1J5JqjmjOIP7Hgv0SJD7u8zYBs52
         /pL2mWfvE9PApI3DdB+bcFdsG0hoDl4Coq+bRKj4=
Date:   Thu, 7 Jul 2022 23:48:20 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 38/55] media: rkisp1: isp: Disallow multiple active
 sources
Message-ID: <20220707144820.GO3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:56AM +0300, Laurent Pinchart wrote:
> The ISP supports multiple source subdevs, but can only capture from a
> single one at a time. The source is selected through link setup. The
> driver finds the active source in its .s_stream() handler using the
> media_entity_remote_pad() function. This fails to reject invalid
> configurations with multiple active sources. Fix it by using the
> media_entity_remote_source_pad() helper instead, and inline
> rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
> small and has a single caller.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 30 ++++++++-----------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 37623b73b1d9..d7e2802d11f5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -58,20 +58,6 @@
>   * Helpers
>   */
>  
> -static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
> -{
> -	struct media_pad *local, *remote;
> -	struct media_entity *sensor_me;
> -
> -	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
> -	remote = media_pad_remote_pad_first(local);
> -	if (!remote)
> -		return NULL;
> -
> -	sensor_me = remote->entity;
> -	return media_entity_to_v4l2_subdev(sensor_me);
> -}
> -
>  static struct v4l2_mbus_framefmt *
>  rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
>  		       struct v4l2_subdev_state *sd_state,
> @@ -743,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
>  	struct rkisp1_device *rkisp1 = isp->rkisp1;
>  	const struct rkisp1_sensor_async *asd;
> +	struct media_pad *source_pad;
> +	struct media_pad *sink_pad;
>  	int ret;
>  
>  	if (!enable) {
> @@ -754,10 +742,18 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  		return 0;
>  	}
>  
> -	rkisp1->source = rkisp1_isp_get_source(sd);
> +	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
> +	source_pad = media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(source_pad)) {
> +		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
> +			PTR_ERR(source_pad));
> +		return -EPIPE;
> +	}
> +
> +	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
>  	if (!rkisp1->source) {
> -		dev_warn(rkisp1->dev, "No link between isp and source\n");
> -		return -ENODEV;
> +		/* This should really not happen, so is not worth a message. */
> +		return -EPIPE;
>  	}
>  
>  	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
