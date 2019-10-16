Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E458D9099
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389042AbfJPMRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:17:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57011 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729700AbfJPMRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:17:34 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KiF7iHR3HPduvKiFAiqtHK; Wed, 16 Oct 2019 14:17:32 +0200
Subject: Re: [PATCH] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191014141427.30708-1-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
Date:   Wed, 16 Oct 2019 14:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014141427.30708-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBR5pB19oFAukO9VtYHkDDfsL69Wfo06FqENWD1XFNDyvhP+5hkzAB1ymsexnJiSLZ7R+eG58CqR8/JwPS04BpBnh3t84NT8LBa7b6Ct839dMJ0IMWO6
 dW7GIL7L5AmUHBiXDpy9Yu5hIIz4AnYBKlKAZwc5Y0I1ogUIn9t17Ldwx/93c7ue69Enp5T4xzi1IwhJkmxooU43wYkmluHG+ey0KkRXZnMWYOWqaGGfLK69
 Vh1ekO2I+1RT5Z+Z7DuRUklG0/SIWMq6cNfL0voobicuom02DZmBbBda7WGRCbsz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
> This allows setting the default value on compound controls created via
> v4l2_ctrl_new_custom.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
>  include/media/v4l2-ctrls.h           | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bf50d37ef6c1..12cf38f73f7b 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>  			type, min, max,
>  			is_menu ? cfg->menu_skip_mask : step, def,
>  			cfg->dims, cfg->elem_size,
> -			flags, qmenu, qmenu_int, ptr_null, priv);
> +			flags, qmenu, qmenu_int, cfg->p_def, priv);
>  	if (ctrl)
>  		ctrl->is_private = cfg->is_private;
>  	return ctrl;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 26205ba3a0a0..2fca5b823961 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
>   * @max:	The control's maximum value.
>   * @step:	The control's step value for non-menu controls.
>   * @def:	The control's default value.
> + * @p_def:	The control's default value for compound controls.
>   * @dims:	The size of each dimension.
>   * @elem_size:	The size in bytes of the control.
>   * @flags:	The control's flags.
> @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
>  	s64 max;
>  	u64 step;
>  	s64 def;
> +	union v4l2_ctrl_ptr p_def;
>  	u32 dims[V4L2_CTRL_MAX_DIMS];
>  	u32 elem_size;
>  	u32 flags;
> 

I'm not sure about this. It might be a bit awkward to initialize p_def given that it is a union.

Perhaps a simple void pointer would be easier?

Regards,

	Hans
