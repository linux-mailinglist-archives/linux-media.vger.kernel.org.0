Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A993D59FF72
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 18:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239314AbiHXQZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 12:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbiHXQZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 12:25:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608CC6B150
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 09:24:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0B4E2B3;
        Wed, 24 Aug 2022 18:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661358297;
        bh=x7G77r2sngu7BeuYkzghCIiGJX0SkPuD8INQJu1TR0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=teyVBEGroYnsqJL+8ZNfPUwkHMjJOHwXubP19atqCO/2NPn7rSVBHI5N1BC6XSYsx
         CcA+1jNNjGjMtCtp2Qo3USoIWs45BHDb8h3+L2sd69BiiMVKg7zQRCmiSe87dx4rqr
         6STr5LU+/5MIjfdiG80EqonyMIirg8nIAtHPI0Ts=
Date:   Wed, 24 Aug 2022 19:24:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 2/7] media: uvcvideo: add uvc_ctrl_get_fixed for
 getting default value
Message-ID: <YwZQ0/de2LTMuoQw@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-3-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628075705.2278044-3-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Tue, Jun 28, 2022 at 04:57:00PM +0900, Yunke Cao wrote:
> Introduce a new uvc_ctrl_get_fixed. It simply calls query_v4l2_ctrl()

"fixed" sounds a bit confusing to me. How about calling it
uvc_ctrl_get_boundary() or uvc_ctrl_get_limit() ? A better name could
possibly be found as the default value isn't a limit.
uvc_ctrl_get_info() comes to mind, but it wouldn't match the UVC
GET_INFO concept, which may be confusing.

> for now, but is easier to extend to support compound controls and
> V4L2_CTRL_WHICH_MIN/MAX_VAL in the following patches.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c |  6 +-----
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0e78233fc8a0..772d9d28a520 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1697,6 +1697,19 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
>  }
>  
> +int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> +		       struct v4l2_ext_control *xctrl)
> +{
> +	struct v4l2_queryctrl qc = { .id = xctrl->id };
> +	int ret = uvc_query_v4l2_ctrl(chain, &qc);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	xctrl->value = qc.default_value;
> +	return 0;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle,
>  	struct v4l2_ext_control *xctrl)
>  {
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 648dcd579e81..0366d05895a9 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1042,15 +1042,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  
>  	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			struct v4l2_queryctrl qc = { .id = ctrl->id };
> -
> -			ret = uvc_query_v4l2_ctrl(chain, &qc);
> +			ret = uvc_ctrl_get_fixed(chain, ctrl);
>  			if (ret < 0) {
>  				ctrls->error_idx = i;
>  				return ret;
>  			}
> -
> -			ctrl->value = qc.default_value;
>  		}
>  
>  		return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c5b4febd2d94..ba028ba7c34e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -901,6 +901,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> +		       struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  			   bool read);

-- 
Regards,

Laurent Pinchart
