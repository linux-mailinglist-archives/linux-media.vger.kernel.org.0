Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72079A1785
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 12:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfH2K5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 06:57:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53497 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbfH2K5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 06:57:34 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3I7MiR37RDqPe3I7PiNc09; Thu, 29 Aug 2019 12:57:32 +0200
Subject: Re: [PATCH v3 5/7] media: v4l2-core: Add new helper for area controls
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-5-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <83a58290-efa2-a4c4-17dc-0380c6b91ce9@xs4all.nl>
Date:   Thu, 29 Aug 2019 12:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823123737.7774-5-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN8Qe9smLVrh7So1TIE2OftNPD0kSTIHJaTGKdn9RiKFxwIu672Y4iuUfXam3c7F+WA6GzDewtQw/Dm5a4x4aQ0IE01NBGBpY+IVCHLYFi25HT666jJa
 zC7QjRz2tT3LAQT/wzR7mwCrP07Xy1VN//V0K1lE2hHgM+SLexjzzJTU1yDiO9MIlSEI8lUJ+NPhbjpfzl0gczN401p0LqVkVqvT1J9ADylsPf9fCkKgs3jA
 YZEA34Ue5W5sI6n6wWsvWVeArYh/KI9BFd2cwOY2EAyvhcVx6nGXMeEbK8X3Ejs0J8+zRdlTRrf/4Y/SjeR+0+bDoSPexla6VO++HAL6vWisLD5bVWpJNnI6
 S6SSEy7gRv14KmDBIy738uKSLyX0dOzTfofhLYVS7J+X8ewG09M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/23/19 2:37 PM, Ricardo Ribalda Delgado wrote:
> Adding a V4L2_CID_UNIT_CELL_SIZE control requires a lot of boilerplate,
> try to minimize it by adding a new helper.
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 25 ++++++++++++++++++++++++-
>  include/media/v4l2-ctrls.h           | 16 ++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index b3bf458df7f7..33e48f0aec1a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2660,7 +2660,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>  
> -/* Helper function for standard integer menu controls */

Huh?

>  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  			const struct v4l2_ctrl_ops *ops,
>  			u32 id, u8 _max, u8 _def, const s64 *qmenu_int)
> @@ -2684,6 +2683,30 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
>  
> +static void area_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +		union v4l2_ctrl_ptr ptr)
> +{
> +	memcpy(ptr.p_area, ctrl->priv, sizeof(*ptr.p_area));

This can be used in an array, so you have to honor the idx field.

> +}
> +
> +static const struct v4l2_ctrl_type_ops area_ops = {
> +	.init = area_init,
> +};

This is a standard control type, so just add support for it the std_type_ops
functions.

> +
> +struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> +				     const struct v4l2_ctrl_ops *ops,
> +				     u32 id, const struct v4l2_area *area)
> +{
> +	static struct v4l2_ctrl_config ctrl = {
> +		.id = V4L2_CID_UNIT_CELL_SIZE,

This should be set to the passed id, not hardcoded.

> +		.type_ops = &area_ops,

And just drop this line.

> +	};
> +
> +	return v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);

Don't pass area as a priv pointer. Instead the core will just initialize the
area to some default value (1x1), and then you can call set_ctrl()
after creating the control to set it to the proper value.

The READ_ONLY flag applies to the public API, but the kernel API still has
to be able to change it.

> +}
> +EXPORT_SYMBOL(v4l2_ctrl_new_area);
> +
> +/* Helper function for standard integer menu controls */

This comment doesn't belong here.

>  /* Add the controls from another handler to our own. */
>  int v4l2_ctrl_add_handler(struct v4l2_ctrl_handler *hdl,
>  			  struct v4l2_ctrl_handler *add,
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 9a3d11350e67..36f0712ea6dd 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -669,6 +669,22 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  					 u32 id, u8 max, u8 def,
>  					 const s64 *qmenu_int);
>  
> +/**
> + * v4l2_ctrl_new_area() - Allocate and initialize a V4L2_CTRL_TYPE_AREA control.
> + *
> + * @hdl:	The control handler.
> + * @ops:	The control ops.
> + * @id:	The control ID.
> + * @area:	The width and height of the area in a struct v4l2_area.

Specifically, this is the initial width and height.

> + *
> + * If the &v4l2_ctrl struct could not be allocated then NULL is returned
> + * and @hdl->error is set to the error code (if it wasn't set already).
> + */
> +
> +struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> +				     const struct v4l2_ctrl_ops *ops,
> +				     u32 id, const struct v4l2_area *area);
> +
>  /**
>   * typedef v4l2_ctrl_filter - Typedef to define the filter function to be
>   *	used when adding a control handler.
> 

Regards,

	Hans
