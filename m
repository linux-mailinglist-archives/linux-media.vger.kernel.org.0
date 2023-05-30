Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E29671552D
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 07:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjE3Fw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 01:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjE3Fw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 01:52:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9223BF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 22:52:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CE767F3;
        Tue, 30 May 2023 07:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685425923;
        bh=i4hIj33U0pdMd/7J4jzF/yLWvSeGSGbFzk7JO2FHo4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ilUiZZEFvnplVzG5eggqHwbV051a92H+qHyPKz+gG+cw/LQFOPI4skfvWS7epOp5j
         zFEXUCakUOgWyTa2ZsYjIurEmZd8/oXaHHhHQ9zCG5z367AVunIf2gfCwWNnhoObXb
         Y8+NNPNEbJLBQf7D0EugznonEPmUiQREb8lxPLTY=
Date:   Tue, 30 May 2023 08:52:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 15/32] media: v4l: async: Clean up error
 handling in v4l2_async_match_notify
Message-ID: <20230530055224.GT21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-16-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-16-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, May 25, 2023 at 12:15:58PM +0300, Sakari Ailus wrote:
> Add labels for error handling instead of doing it all in individual cases.
> Prepare for more functionality in this function.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index b1025dfc27a92..f51f0c37210c9 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -320,10 +320,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  
>  	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
> -	if (ret < 0) {
> -		v4l2_device_unregister_subdev(sd);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto err_unregister_subdev;
>  
>  	/*
>  	 * Depending of the function of the entities involved, we may want to
> @@ -332,11 +330,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  	 * pad).
>  	 */
>  	ret = v4l2_async_create_ancillary_links(notifier, sd);
> -	if (ret) {
> -		v4l2_async_nf_call_unbind(notifier, sd, asc);
> -		v4l2_device_unregister_subdev(sd);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_call_unbind;
>  
>  	list_del(&asc->waiting_entry);
>  	sd->asd = asc;
> @@ -363,6 +358,14 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  	subdev_notifier->parent = notifier;
>  
>  	return v4l2_async_nf_try_all_subdevs(subdev_notifier);

Unrelated to this patch, but shoulnd't this have error handling too ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +err_call_unbind:
> +	v4l2_async_nf_call_unbind(notifier, sd, asc);
> +
> +err_unregister_subdev:
> +	v4l2_device_unregister_subdev(sd);
> +
> +	return ret;
>  }
>  
>  /* Test all async sub-devices in a notifier for a match. */

-- 
Regards,

Laurent Pinchart
