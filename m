Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2972DFFB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfE2OlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:41:13 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51977 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbfE2OlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:41:13 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VzlNhqhARsDWyVzlOhhqb0; Wed, 29 May 2019 16:41:11 +0200
Subject: Re: [PATCH] media: v4l2: Initialize mpeg slice controls
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com
References: <20190503114221.28469-1-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b025d972-b7a9-ae0d-a286-e0364d1b52ea@xs4all.nl>
Date:   Wed, 29 May 2019 16:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503114221.28469-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOyyJGD7XSKeeAdl/8Pg8TIJrFkcTwtxaWIJZTMMTtJUgdK7D8LYhz03gXYdq4ZjnFuxM1dD/QRg6tdkoZmS/IU8Si1y9Lg+FAal9BY660KUY5Pf7oUQ
 VrXk5OgMjDnwAo0aEn93WYaygVH6ekAcg+Uig0z19Yos0ueRn1g7vrqk8JYX5LU+neWkiXYEOVVCFSb5+WXjsy40dLhokkmqLha6Of//AI1izqKD3rAMAVW3
 3+CAI2JTHQ6kDiQxajY7Zdu1q+J/xf9a5jLzSt3USsleQqwb7vky6nwdQJjBTtY5hsVauMX20+bGAwoou3Xmu7ebz7+L9QDrt+WDknJ6532AdCnzDWGY7OOS
 kBWaMnkgqd2NZ3f6wKs6s0mvjcuivYhF82PgoSdOFU/YqFFDYlV95BbDUFhfdzJJYGFEI4d9MAT3TAwe3u1dFtNNmA+JC1p0yGdIyEm8E81jMZSl1SzD5K8Z
 HFUz3r5JxIcoqUNsSaoFCDT01896IQcOtb0YGA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/3/19 1:42 PM, Boris Brezillon wrote:
> Make sure the default value at least passes the std_validate() tests.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index b1ae2e555c68..19d40cc6e565 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1461,7 +1461,14 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>  static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>  		     union v4l2_ctrl_ptr ptr)
>  {
> -	switch (ctrl->type) {
> +	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> +
> +	/*
> +	 * The cast is needed to get rid of a gcc warning complaining that
> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
> +	 * v4l2_ctrl_type enum.
> +	 */
> +	switch ((u32)ctrl->type) {
>  	case V4L2_CTRL_TYPE_STRING:
>  		idx *= ctrl->elem_size;
>  		memset(ptr.p_char + idx, ' ', ctrl->minimum);
> @@ -1486,6 +1493,17 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_U32:
>  		ptr.p_u32[idx] = ctrl->default_value;
>  		break;
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

Oops, this isn't complete. It should still zero the p_mpeg2_slice_params
struct first. Right now any fields not explicitly set just have whatever
was in memory.

Can you post a patch fixing this?

Regards,

	Hans

> +		break;
>  	default:
>  		idx *= ctrl->elem_size;
>  		memset(ptr.p + idx, 0, ctrl->elem_size);
> 

