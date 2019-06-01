Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A61A31AAB
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfFAJCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:02:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfFAJCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:02:08 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0CC592612A0;
        Sat,  1 Jun 2019 10:02:06 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:02:03 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 2/2] media: v4l2-ctrl: Move compound control
 initialization
Message-ID: <20190601110203.6bbfad1c@collabora.com>
In-Reply-To: <20190530171909.19018-2-ezequiel@collabora.com>
References: <20190530171909.19018-1-ezequiel@collabora.com>
        <20190530171909.19018-2-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 30 May 2019 14:19:09 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Rework std_init adding an explicit initialization for
> compound controls.
> 
> While here, make sure the control is initialized to zero,
> before providing default values for all its fields.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> Changes from v1:
> * Drop the s/break/return replacements
> * Drop unneeded default cases
> * Fix memset to take account of the index
> 
>  drivers/media/v4l2-core/v4l2-ctrls.c | 37 +++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index c7d5fdb8efb4..ebaff951ec87 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1506,17 +1506,38 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>  	}
>  }
>  
> -static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		     union v4l2_ctrl_ptr ptr)

nit: union v4l2_ctrl_ptr is not aligned on the std_init_compound() open
parens.

The patch looks good otherwise:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  {
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  
> +	idx *= ctrl->elem_size;
> +	memset(ptr.p + idx, 0, ctrl->elem_size);
> +
>  	/*
>  	 * The cast is needed to get rid of a gcc warning complaining that
>  	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
>  	 * v4l2_ctrl_type enum.
>  	 */
>  	switch ((u32)ctrl->type) {
> +	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> +		p_mpeg2_slice_params = ptr.p;
> +		/* 4:2:0 */
> +		p_mpeg2_slice_params->sequence.chroma_format = 1;
> +		/* 8 bits */
> +		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
> +		/* interlaced top field */
> +		p_mpeg2_slice_params->picture.picture_structure = 1;
> +		p_mpeg2_slice_params->picture.picture_coding_type =
> +					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
> +		break;
> +	}
> +}
> +
> +static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +		     union v4l2_ctrl_ptr ptr)
> +{
> +	switch (ctrl->type) {
>  	case V4L2_CTRL_TYPE_STRING:
>  		idx *= ctrl->elem_size;
>  		memset(ptr.p_char + idx, ' ', ctrl->minimum);
> @@ -1543,20 +1564,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_U32:
>  		ptr.p_u32[idx] = ctrl->default_value;
>  		break;
> -	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> -		p_mpeg2_slice_params = ptr.p;
> -		/* 4:2:0 */
> -		p_mpeg2_slice_params->sequence.chroma_format = 1;
> -		/* 8 bits */
> -		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
> -		/* interlaced top field */
> -		p_mpeg2_slice_params->picture.picture_structure = 1;
> -		p_mpeg2_slice_params->picture.picture_coding_type =
> -					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
> -		break;
>  	default:
> -		idx *= ctrl->elem_size;
> -		memset(ptr.p + idx, 0, ctrl->elem_size);
> +		std_init_compound(ctrl, idx, ptr);
>  		break;
>  	}
>  }

