Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC18DEB9E
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 14:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJUMIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 08:08:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51645 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728113AbfJUMIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 08:08:01 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MWTbiUbnQo1ZhMWTeiM4Pd; Mon, 21 Oct 2019 14:07:59 +0200
Subject: Re: [PATCH v2] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191016145512.24747-1-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f8cd7654-15f3-2c89-bcbb-bbebcf0fe649@xs4all.nl>
Date:   Mon, 21 Oct 2019 14:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016145512.24747-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGNYbYd4WHD+U9ete5V61CtzoKvjJdc4GNJ5idAraIX35hv1d6iUboXc174wm355+dQHxzHgZbjmO75+uNrLn5VO5/YkSLMRkl7pXaRDhIm29msrlHyi
 /YMo1ibJXaFBOpLzkD5SHA4InDwi3JQsycKI52tDRbP4cCzDILJ5SWoaHxVO0b83KScGMTk0/9t4AW/CY9pzB7y+txmb3iKWxM9M6qAnkKSayDouv9T7EU6g
 poI13sknGSVmnjhH2QRCERBuVEjzZF0hlKZ3wrRPu8dz7XKS4D2KGpLHGAoV8qJk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 4:55 PM, Ricardo Ribalda Delgado wrote:
> This allows setting the default value on compound controls created via
> v4l2_ctrl_new_custom.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 3 ++-
>  include/media/v4l2-ctrls.h           | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bf50d37ef6c1..939aa110daa0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2583,7 +2583,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>  			type, min, max,
>  			is_menu ? cfg->menu_skip_mask : step, def,
>  			cfg->dims, cfg->elem_size,
> -			flags, qmenu, qmenu_int, ptr_null, priv);
> +			flags, qmenu, qmenu_int,
> +			v4l2_ctrl_ptr_create((void *)cfg->p_def), priv);

I don't like this cast. I've been experimenting a bit and this works fine:

#include <stdlib.h>
#include <stdio.h>

union v4l2_ctrl_ptr {
        int *p_int;
        const int *p_int_const;
};

struct v4l2_ctrl_config {
        union v4l2_ctrl_ptr p;
};

static const int i = 5;

static const struct v4l2_ctrl_config c = {
        .p.p_int_const = &i,
};

int main(int argc, char **argv)
{
        printf("%d\n", *c.p.p_int_const);
        return 0;
}

So I would like to see a p_const being added to the union, and I think we
need a v4l2_ctrl_const_ptr_create() helper.

In a separate patch it would be really nice to replace any uses of .p with
.p_const where possible to signal that the contents isn't modified.

Regards,

	Hans

>  	if (ctrl)
>  		ctrl->is_private = cfg->is_private;
>  	return ctrl;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 26205ba3a0a0..d08d19a4ae34 100644
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
> +	const void *p_def;
>  	u32 dims[V4L2_CTRL_MAX_DIMS];
>  	u32 elem_size;
>  	u32 flags;
> 

