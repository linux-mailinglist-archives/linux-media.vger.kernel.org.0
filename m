Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD01552AA2
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 07:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345478AbiFUFvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 01:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345433AbiFUFvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 01:51:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B793E220F5
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 22:51:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50E906BB;
        Tue, 21 Jun 2022 07:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655790697;
        bh=i6pSV8DH9GELGDx3ZvumK+KtX5DJurYaPMerQ0Cjbig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VE3dyOfgoZNaLJHIm0KsxA5QYwdoBm+eUcq1CBGd2FuBhGOQ7bHeT3nMVvI54NffT
         56LHkT9GTIm5XtkE/Qj9179LW/kd0mAD+dCs11G+VqvMqR/ROFcX15KL8OzcgNJ5Ad
         Yn7gh8BDNXedHvD9hx765O6jqAlVFIPc08raqbWg=
Date:   Tue, 21 Jun 2022 08:51:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1] media: uvcvideo: user entity get_cur in uvc_ctrl_set
Message-ID: <YrFcWWRWWIj23mk/@pendragon.ideasonboard.com>
References: <20220621043506.1142851-1-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621043506.1142851-1-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Tue, Jun 21, 2022 at 01:35:06PM +0900, Yunke Cao wrote:
> Entity controls should get_cur using an entity-defined function
> instead of via a query. Fix this in uvc_ctrl_set.
> 
> Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0e78233fc8a0..54c047019313 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1787,15 +1787,21 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
>  			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				0, ctrl->info.size);
> +		} else if (ctrl->entity->get_cur) {
> +			ret = ctrl->entity->get_cur(chain->dev,
> +				ctrl->entity,
> +				ctrl->info.selector,
> +				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +				ctrl->info.size);
>  		} else {
>  			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
>  				ctrl->entity->id, chain->dev->intfnum,
>  				ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> -			if (ret < 0)
> -				return ret;
>  		}
> +		if (ret < 0)
> +			return ret;

ret may be used uninitialized here.

>  
>  		ctrl->loaded = 1;

There's very similar code in __uvc_ctrl_get(), could it be factored out,
maybe into a __uvc_ctrl_get_cur() function ?

>  	}

-- 
Regards,

Laurent Pinchart
