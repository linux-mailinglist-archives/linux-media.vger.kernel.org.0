Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D124A6ED959
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjDYAbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDYAbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:31:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C76658F
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:31:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8248F4FE;
        Tue, 25 Apr 2023 02:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682382655;
        bh=1tuNZz1aVq9lk7BbDzjUFSAdyrgO29MGSiR3EtLsy2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qE5kkkVjPl/3dHx5bCaZkHKThHnlQMZCcbCknbuOB/ZUPKJ2lZZZRmSHCEQ57BjF3
         dVxqfYkYFivILjeEsqzrwdf4L9cUxtKrQonTSR4Vsp7vIsdZ+MQAqVoBFUZjA1/suj
         pA6zWE0qG/etoMvqcxYYdX2GDpWh8oA2vUezPEwo=
Date:   Tue, 25 Apr 2023 03:31:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 14/18] media: xilinx-vipp: Init async notifier after
 registering V4L2 device
Message-ID: <20230425003116.GC4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-15-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-15-sakari.ailus@linux.intel.com>
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

On Thu, Mar 30, 2023 at 02:58:49PM +0300, Sakari Ailus wrote:
> Initialise the V4L2 async notifier after registering the V4L2 device, just
> before parsing DT for async sub-devices. This way struct device is
> available to the notifier right from the beginning.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-vipp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 70e7a1f6ed3b..83430633ed28 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -516,6 +516,8 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  		goto done;
>  	}
>  
> +	v4l2_async_nf_init(&xdev->notifier);
> +
>  	/* Parse the graph to extract a list of subdevice DT nodes. */
>  	ret = xvip_graph_parse(xdev);
>  	if (ret < 0) {
> @@ -596,7 +598,6 @@ static int xvip_composite_probe(struct platform_device *pdev)
>  
>  	xdev->dev = &pdev->dev;
>  	INIT_LIST_HEAD(&xdev->dmas);
> -	v4l2_async_nf_init(&xdev->notifier);
>  
>  	ret = xvip_composite_v4l2_init(xdev);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
