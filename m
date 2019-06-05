Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1243C35AA2
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 12:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfFEKpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 06:45:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46967 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727076AbfFEKpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 06:45:32 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YTQ7hkRae3qlsYTQAhfJT6; Wed, 05 Jun 2019 12:45:30 +0200
Subject: Re: [PATCH v2 2/2] media: v4l2-ctrl: Move compound control
 initialization
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190530171909.19018-1-ezequiel@collabora.com>
 <20190530171909.19018-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c79a5cf7-775f-120f-b431-f00b05ff1a6c@xs4all.nl>
Date:   Wed, 5 Jun 2019 12:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190530171909.19018-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMyK79k9VS0xjUYK7mi4l25wSX89G2Ym+7deNxxjax7JyXPQh3FsLhpcfA1tH3gT8RsXLboJcRtcjeot+5C8seqFanpJhQUglyscb5m+0JUaJwNGz424
 AWQzyRfgOawpwSo41zSMGUiitoc5lKd1d3ihwLJ0OlFMdvRevTAD02DKl3vHTI5MLpHth5HQhzjWdkQY0wGumbQ4o5JBIxJloZdNpKxmFhdIKqQK4VQ4mhRZ
 IMhrlUNtlsz2f0zXxAvJ8JF+iO0dSn5LVU/8IpRGjoLupGdm+2/x7Kudt8XvzSGLsCTQQvTmdQM62UtvL68u7IZzCkquEYBabJKKZZKAfXQl9v2TD2KEyNmm
 LYusy4JzpO0B10T4oxxPjDUjwaAcLqfQtwQ5Hox6Zn+NvX6sL7sg3BvHJ/cqTneH/GO94LyxFM0pHil7qxBMnbQxug9YpGpu9yHjarPNcnuUnXwhImrjDG0j
 67IaJDmdPdTiuK/t
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/30/19 7:19 PM, Ezequiel Garcia wrote:
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

As Boris mentioned, fix the alignment with the open (.

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

I'd drop this assignment. Everything is already zeroed, so why still do this?

Regards,

	Hans

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
> 

