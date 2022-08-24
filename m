Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E4F5A026F
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 22:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240101AbiHXUEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 16:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbiHXUEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 16:04:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0097C515
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 13:04:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81BF52B3;
        Wed, 24 Aug 2022 22:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661371438;
        bh=LBgYD2+UC9xRDbHzyOaIB5DnvxDbUG6gCR0sKkDqQ38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MDBKJw5MxL8QqGD8+W8Fg9rbsr7RTX/kqRTPyfpsduJaIwyManFUHXR8U+mpqfJ7K
         BkUnIH9NcBmleB17NCWjZGRzNxiMGLIdzLtzwzueX24LKRRZbe5nhl7F0x6oesB16X
         Gi+ukeDUbLsV8rDU4WF7m2unaKyaCtIVOTIXpGmU=
Date:   Wed, 24 Aug 2022 23:03:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 6/7] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <YwaEKeJCjzio11MG@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-7-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628075705.2278044-7-yunkec@google.com>
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

On Tue, Jun 28, 2022 at 04:57:04PM +0900, Yunke Cao wrote:
> Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 73 ++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvc_v4l2.c | 11 +++--
>  drivers/media/usb/uvc/uvcvideo.h |  3 +-
>  3 files changed, 70 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 00482269233a..b569d6824ac1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1923,7 +1923,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  }
>  
>  int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> -			     struct v4l2_ext_control *xctrl)
> +			     struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>  	struct v4l2_queryctrl qc = { .id = xctrl->id };
>  	int ret = uvc_query_v4l2_ctrl(chain, &qc);
> @@ -1931,16 +1931,69 @@ int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
>  	if (ret < 0)
>  		return ret;
>  
> -	xctrl->value = qc.default_value;
> +	switch (v4l2_which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		xctrl->value = qc.default_value;
> +		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		xctrl->value = qc.minimum;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		xctrl->value = qc.maximum;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> +static int __uvc_ctrl_get_fixed_compound(struct uvc_video_chain *chain,
> +					 struct uvc_control_mapping *mapping,
> +					 struct uvc_control *ctrl,
> +					 u32 v4l2_which,
> +					 struct v4l2_ext_control *xctrl)
> +{
> +	int ret;
> +	u32 flag, id;
> +
> +	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +		return -EINVAL;
> +

This can't happen.

> +	switch (v4l2_which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		flag = UVC_CTRL_FLAG_GET_DEF;
> +		id = UVC_CTRL_DATA_DEF;
> +		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		flag = UVC_CTRL_FLAG_GET_MIN;
> +		id = UVC_CTRL_DATA_MIN;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		flag = UVC_CTRL_FLAG_GET_MAX;
> +		id = UVC_CTRL_DATA_MAX;
> +		break;
> +	default:
> +		return -EINVAL;

Can this happen ?

> +	}
> +
> +	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
> +		return -EACCES;
> +
> +	if (!ctrl->cached) {
> +		ret = uvc_ctrl_populate_cache(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, id, xctrl);
> +}
> +
>  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -		       struct v4l2_ext_control *xctrl)
> +		       struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *mapping;
> -	int ret;
>  
>  	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
>  		return -EACCES;
> @@ -1950,16 +2003,10 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  
>  	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> -		return __uvc_ctrl_get_fixed_std(chain, xctrl);
> +		return __uvc_ctrl_get_fixed_std(chain, xctrl, v4l2_which);
>  
> -	if (!ctrl->cached) {
> -		ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
> -					       xctrl);
> +	return __uvc_ctrl_get_fixed_compound(chain, mapping, ctrl, v4l2_which,
> +					     xctrl);
>  }
>  
>  int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index aad61af36271..004e3b764737 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1043,16 +1043,21 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> +	switch (ctrls->which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +	case V4L2_CTRL_WHICH_MAX_VAL:
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			ret = uvc_ctrl_get_fixed(chain, ctrl);
> +			ret = uvc_ctrl_get_fixed(chain, ctrl, ctrls->which);
>  			if (ret < 0) {
>  				ctrls->error_idx = i;
>  				return ret;
>  			}
>  		}
> -
>  		return 0;
> +
> +	default:

	case V4L2_CTRL_WHICH_CUR_VAL:

> +		break;

and

	default:
		return -EINVAL;

(please double-check that the error value is the right one). This should
be mentioned in the commit message.

>  	}
>  
>  	ret = uvc_ctrl_begin(chain);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9ff95bbad251..54cc47bc2d33 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -913,7 +913,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -		       struct v4l2_ext_control *xctrl);
> +		       struct v4l2_ext_control *xctrl,
> +		       u32 v4l2_which);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  			   bool read);

-- 
Regards,

Laurent Pinchart
