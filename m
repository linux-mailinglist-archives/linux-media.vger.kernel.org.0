Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E011302396
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 11:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbhAYKSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 05:18:10 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58531 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727408AbhAYKQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 05:16:36 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yoRlT2wgiWRg3yoUlfoEt; Mon, 25 Jan 2021 11:09:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611569378; bh=10OZ4C4oJRmz4e8mTjoJyag5+Zj9mbPXnERwT1rgrfQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=clSd4Po+R2kpxf3Dwf3EuBpcJyRjSSSAROvqG9aBCUVMIxo3vJv/LATilozEsU0KH
         lbTA37YL4kFGBb4PNEmdip4qiwFBmoBZnyvzFpRQGy3iu+N7Y1DGlsNKBhGFbmpZjG
         Ss9P5J9o6ZiBS7Wiob7v4+bfvT2s4XGx55rAUO5USZdT7EnqD8mWR4MWR1m1dN+YR6
         kjoQpqJqoDeXYynSTE03akTTyKCJKikWwWKZU27lPL85ZUiT8eyrJitcnH7Q2RKMZ5
         K0X4jsY1P0wf5pFLhZ9y76rkIzzeACn+ajS/2WymEMM/+zyu8fTP+rVX3tEbnkHVG1
         tp5tD3BrBt/YA==
Subject: Re: [PATCH v4 1/5] v4l: Add new Colorimetry Class
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
 <20210120092606.3987207-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <45c31168-ad69-70de-9cc7-1c825eecfd40@xs4all.nl>
Date:   Mon, 25 Jan 2021 11:09:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120092606.3987207-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG6RBSpzu2+u6sNd/1sizAp6yJDu+K1+A8YosIOiHVC2gDZ32i5vyLEU/DnO7y6H0Zc3NW/GD80ijov4M4TejNIjEZjLzZDBc69NI02Fo2KnAVApoyNK
 nLbqL+PguA0zjIpRhSEUApg04nspsEtVHbh69DH0bHzfueqXfYsKwStmoXh4npcAoNO6VsSqYCDaaZ7LLQySukAtd/HxVGHvhD5yd+T4yiKFuP6JTkCrHoYY
 SHbHcwcpRXfG7bGExQ/OK4yYRi8e3pouaU/Ccr5Oa3eum81kTR0fTMAkbkv/fV/JuQ5wMNYnBdK+H+5bjPeO1N4o6nlr1VRwtL0POdnTTQj/0eanM4T4h96s
 /28DRgM2EGF+2Oz7xamwIOLQO+ay7u5KYFX0paXPHUC1XY+tBkf26YMTeHvs89hz2u70Io4c
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 10:26, Stanimir Varbanov wrote:
> Add Colorimetry control class for colorimetry controls
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index f7b310240af2..a5137a867411 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1201,6 +1201,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>  	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>  	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> +
> +	/* Colorimetry controls */
> +	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> +	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
>  	default:
>  		return NULL;
>  	}
> @@ -1389,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RF_TUNER_CLASS:
>  	case V4L2_CID_DETECT_CLASS:
>  	case V4L2_CID_CODEC_STATELESS_CLASS:
> +	case V4L2_CID_COLORIMETRY_CLASS:
>  		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
>  		/* You can neither read not write these */

I wouldn't have bothered with this, but since a v5 will be needed in any case:
can you fix the typo in this comment? not -> nor

No need to create a separate patch for this. Just mention in the commit message
that you fixed this typo as well.

Regards,

	Hans

>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..a41039559193 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -66,6 +66,7 @@
>  #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
>  #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
> +#define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
>  
>  /* User-class control IDs */
>  
> @@ -1657,6 +1658,9 @@ struct v4l2_ctrl_fwht_params {
>  	__u32 quantization;
>  };
>  
> +#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
> +#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> 

