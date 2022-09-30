Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180065F0FB6
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 18:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiI3QRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 12:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbiI3QRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 12:17:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0904311F7DC;
        Fri, 30 Sep 2022 09:17:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7216A47C;
        Fri, 30 Sep 2022 18:17:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664554659;
        bh=2fok7GNXTJv1uiaMCNQaZgDLKMQ2ugaF86bN7hnadjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u8b+an6d9OMUQmLNPybTSkrn3+wJ3uE1GnoL5T/3IXQHDRikZTaE2OekOQzta8UTr
         xVnNt7U4bmrse5b5ow9uqeVu5FfhZwo2h6iHylJq4C8ZGfT3MALQRhPTdqudSWf9/Y
         th1ptgWI7/qZgHLDbMA95vocaHcvgKCDxdNxn6/Q=
Date:   Fri, 30 Sep 2022 19:17:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] usb: gadget: uvc: don't put item still in use
Message-ID: <YzcWompDLd7iIip+@pendragon.ideasonboard.com>
References: <YzbZ62gq3i4n7Vhx@kroah.com>
 <20220930122839.1747279-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930122839.1747279-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

(Cc'ing Kieran and Dan)

Thank you for the patch.

On Fri, Sep 30, 2022 at 02:28:39PM +0200, Michael Grzeschik wrote:
> With the patch "588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api
> calls)" the driver is keeping a list of configfs entries currently
> configured. The list is used in uvc_v4l2 on runtime.

s/on runtime/at runtime/

> The driver now is giving back the list item just after it was referenced
> with config_item_put. It also calls config_item_put on uvc_free, which
> is the only and right place to give back the reference. This patch fixes
> the issue by removing the extra config_item_put in uvc_alloc.
> 
> Fixes: 588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api calls)

I still don't like this much :-( As shown by this fix, the additional
complexity that it incurs on the kernel side can cause bugs, and the
gain for userspace is quite minimal in my opinion, as parsing configfs
(or obtaining that information out-of-band through other means) will
still be needed anyway to handle controls properly (I think we have
agreed that userspace needs to handle the UVC requests in any case).

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 -> v2: - fixed commitish to valid one from usb-next tree
> 
>  drivers/usb/gadget/function/f_uvc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index e6948cf8def30b..8bc591431d153e 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -995,7 +995,6 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
>  		goto err_config;
>  
>  	uvc->header = to_uvcg_streaming_header(h);
> -	config_item_put(h);

Assuming we want to keep 588b9e85609b, the fix seems right.

>  	if (!uvc->header->linked) {
>  		mutex_unlock(&opts->lock);
>  		kfree(uvc);

-- 
Regards,

Laurent Pinchart
