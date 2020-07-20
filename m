Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892B5225AD1
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgGTJGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:06:22 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42287 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbgGTJGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:06:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xRkVjXSTlNPeYxRkWjmdDD; Mon, 20 Jul 2020 11:06:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595235979; bh=2FJzit5n0YE2hjdQJPBoYTGdU63MnCmR4nSVSBKTdvs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hHV30ov/BaNpJP4l3l+bgYqd8QGPp+Jhiltcq7BEX49RPGrIdYwXAHbPi1pJqnNqz
         crGm3BTHdr/F3McCy/vfOocsquzupr9RSRxs5PWwblwUKy69GOIaQ64zldYgO06Ba4
         SwLWUVoKmXTQU2XVpy8TJoa5iLdGmhd1Glz26tiTW97QXEiAPMRW798nkwHAuJooP5
         Y6QkHuKFoH64sMQ6Ko2WY4mbExcFracOpYKGAA1NaI1GQNWnZ9dIGoRzcOFIsndTxl
         6FyvXf4ci7TShOqHQaYClc18ILZ6F0pVfxrjtWKVp+QNEwECOY8lORZk8unq+aK1ym
         sFHuOTefGsq0g==
Subject: Re: [PATCH v2 1/4] media: v4l2-ctrls: Add encoder constant quality
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
 <20200616201446.15996-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <075e4109-00ed-4c47-009a-84915ed6f75a@xs4all.nl>
Date:   Mon, 20 Jul 2020 11:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200616201446.15996-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMuEScfQvDFOW+ycP4h2PWMq17WlTRaO/n6Hu9nNK+v1KYxd2WYRhfEAWz33YFpy40PtD+0AhTQ8C4PWrd5IrLi5XAjJJrwgzbM2BQC0uQO9BVfQvft/
 XeL5hbB1x2PB//eCGGXNVSiaWVspG7VyEQmwBLXmbMIstTkYkjmlc7+jjz6u2L7oRkKtTaeUN3by1tN8QLllWUfgrFZvq+i1AHUfAuTgJLuGdHMZExVbJp3o
 pH7OPVhk2qAwZPqIC615i+6AyT2JO5GJPAUog7ZKrCIhye8eM70uw98sPz0y1wcLOFshhCr8rRp3knInRIOBV/YQ9cQ1c4HYrtX34pFApnhP/smz5Gk7/rr9
 /NHUIUP9lupWLq6MJSlZ+tgOwmXC8WrvrEWbyTMKn/PNOTefnyYcG8zGWfMqfYKboY4oCrFdmackg3kiA8ecxeCxuSfUtmtDsULeYu9BCOMK5sgTbpekmAQV
 vDUG7VZ7AUlYAFvY3tw5512XRYolHmn5AAZibg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 22:14, Stanimir Varbanov wrote:
> From: Maheshwar Ajja <majja@codeaurora.org>
> 
> When V4L2_CID_MPEG_VIDEO_BITRATE_MODE value is
> V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, encoder will produce
> constant quality output indicated by
> V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY control value.
> Encoder will choose appropriate quantization parameter
> and bitrate to produce requested frame quality level.
> 
> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                   |  2 ++
>  include/uapi/linux/v4l2-controls.h                     |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..b9d3f7ae6486 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -581,6 +581,8 @@ enum v4l2_mpeg_video_bitrate_mode -
>        - Variable bitrate
>      * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CBR``
>        - Constant bitrate
> +    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
> +      - Constant quality
>  
>  
>  
> @@ -592,6 +594,14 @@ enum v4l2_mpeg_video_bitrate_mode -
>      the average video bitrate. It is ignored if the video bitrate mode
>      is set to constant bitrate.
>  
> +``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY (integer)``
> +    Constant quality level control. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` value is
> +    ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``. Valid range is 1 to 100
> +    where 1 indicates lowest quality and 100 indicates highest quality.
> +    Encoder will decide the appropriate quantization parameter and
> +    bitrate to produce requested frame quality.
> +
>  ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
>      For every captured frame, skip this many subsequent frames (default
>      0).
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..bc00d02e411f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -200,6 +200,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  	static const char * const mpeg_video_bitrate_mode[] = {
>  		"Variable Bitrate",
>  		"Constant Bitrate",
> +		"Constant Quality",
>  		NULL
>  	};
>  	static const char * const mpeg_stream_type[] = {
> @@ -832,6 +833,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
>  	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
>  	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
> +	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
>  	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
>  	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
>  	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 62271418c1be..0f7e4388dcce 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -375,6 +375,7 @@ enum v4l2_mpeg_video_aspect {
>  enum v4l2_mpeg_video_bitrate_mode {
>  	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
>  	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
> +	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
>  };
>  #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_MPEG_BASE+207)
>  #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_MPEG_BASE+208)
> @@ -742,6 +743,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
> +#define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

