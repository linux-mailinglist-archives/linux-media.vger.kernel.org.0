Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC9B427AC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 15:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbfFLNeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 09:34:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44653 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbfFLNeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 09:34:10 -0400
Received: from [IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270] ([IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270])
        by smtp-cloud9.xs4all.net with ESMTPA
        id b3O8hCmAMbiAgb3OBhDI9R; Wed, 12 Jun 2019 15:34:08 +0200
Subject: Re: [PATCH v3 2/2] media: v4l2-ctrl: Move compound control
 initialization
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190606161254.17311-1-ezequiel@collabora.com>
 <20190606161254.17311-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d102e592-2f00-e28e-2956-6df6a47a125d@xs4all.nl>
Date:   Wed, 12 Jun 2019 15:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190606161254.17311-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLnx/CIFNwToeyLGiKlLE/WPS17PaDRZPS7zxHoLfjTrafUXi15zs8Rj+fp8vj4hXqit6FU7iAG259pGZONRrcjloa3q4KH76NakheZhlQ7xuE60c1+W
 lvKm6q+iqJ9OGg/RiT8ZP1KtRXxkAFbYOLUwuyTwd5vnMCgi5EiYNYSVNtbPIIkoDJpNT0p2TPoBxUWvV0Gbt4Mqu5PjFU5e+K04E3kLg6Bf8i4IZrS3oM3W
 rCCv8Q1l6u7YYPayB3v4il61nBuK5tjrCwVxRuhrmiNCNopcHtH3QJpNMiY3wFhcqMj0mT52sFFCgiwg9xVezfb9YrAGeOQ/wTF0+JOToooZi8zmjMekqM7E
 +VWziyUxW6ofJ0AOKO8H1AObwQi4vL7PCIsKxs4vmaRQNCxb49jFBnNGwVKA8GB4ag1fqSPRVV5Vd4N5h9uJRrm0ZZ5dlA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/19 6:12 PM, Ezequiel Garcia wrote:
> Rework std_init adding an explicit initialization for
> compound controls.
> 
> While here, make sure the control is initialized to zero,
> before providing default values for all its fields.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes from v2:
> * Align parameters to parenthesis
> * Drop unneeded zero initialization
> 
> Changes from v1:
> * Drop the s/break/return replacements
> * Drop unneeded default cases
> * Fix memset to take account of the index
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 37 +++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 92a5521f6813..18c8d0c102d2 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1506,17 +1506,36 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>  	}
>  }
>  
> -static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> -		     union v4l2_ctrl_ptr ptr)
> +static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> +			      union v4l2_ctrl_ptr ptr)
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

This is wrong, it should be ptr.p + idx, just as is done in the memset.
I'd add a 'void *p = ptr.p + idx * ctrl->elem_size;' variable at the beginning
and use 'p' in the memset and in the line above.

Regards,

	Hans

> +		/* 4:2:0 */
> +		p_mpeg2_slice_params->sequence.chroma_format = 1;
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
> @@ -1545,20 +1564,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
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
> 

