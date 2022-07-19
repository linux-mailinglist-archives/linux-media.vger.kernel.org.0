Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34757A9E1
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239758AbiGSWff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 18:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbiGSWfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 18:35:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28A81D0E0;
        Tue, 19 Jul 2022 15:35:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EF046DB;
        Wed, 20 Jul 2022 00:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658270130;
        bh=+iiK7Yx1oPADqNDPrxQWJQBXO7XmKa+rPeV/DhD0t/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gL0o0Fq7cIzm6nZjoTZRAmugjgSGoUrrZMO/WvLN+/7L093+H/PXkCyyWjFMG7pZn
         395kGQJvR+gpVHyRzFscoUx0/IuvAUVs4OCge60rnasvlSmJWqraeY1EdqNsCkR4rX
         pRi6TUyz6Lz0iZxSEKNfcLSZQh6BOaF6DQfTuR6I=
Date:   Wed, 20 Jul 2022 01:34:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix a crash in uvc_ctrl_init_ctrl()
Message-ID: <YtcxkInnG3DUGbOr@pendragon.ideasonboard.com>
References: <Yta1eXgbVFGrVuTJ@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yta1eXgbVFGrVuTJ@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Tue, Jul 19, 2022 at 04:45:29PM +0300, Dan Carpenter wrote:
> There is a path where "mapping" is NULL when we try to process the
> common mappings so it will crash.
> 
> Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I've submitted [1] to fix this issue, and [2] to replace all the
error-prone loops in this function.

[1] https://lore.kernel.org/linux-media/20220718121219.16079-1-laurent.pinchart@ideasonboard.com/
[2] https://lore.kernel.org/linux-media/20220718222757.8203-1-laurent.pinchart@ideasonboard.com/T/#u

> ---
> This bug was previously reported by the kbuild bot and fixed in later
> versions of the patchset.  The git log doesn't have a link to
> lore.kernel.org but I suspect an earlier version got merged?
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e4826a846861..00ea894e79fd 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2413,9 +2413,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  {
>  	const struct uvc_control_info *info = uvc_ctrls;
>  	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> -	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
> -	const struct uvc_control_mapping *mend =
> -		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +	const struct uvc_control_mapping *mapping;
> +	const struct uvc_control_mapping *mend;
> +	unsigned int i;
>  
>  	/*
>  	 * XU controls initialization requires querying the device for control
> @@ -2453,7 +2453,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	 */
>  	if (chain->dev->info->mappings) {
>  		bool custom = false;
> -		unsigned int i;
>  
>  		for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
>  			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> @@ -2468,7 +2467,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	}
>  
>  	/* Process common mappings next. */
> -	for (; mapping < mend; ++mapping) {
> +	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); i++) {
> +		mapping = &uvc_ctrl_mappings[i];
>  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  		    ctrl->info.selector == mapping->selector)
>  			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> -- 
> 2.35.1
> 

-- 
Regards,

Laurent Pinchart
