Return-Path: <linux-media+bounces-11717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A08CC063
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734481C224DE
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 11:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBDD82D9E;
	Wed, 22 May 2024 11:38:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC6282D6D;
	Wed, 22 May 2024 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377888; cv=none; b=dd0swZpb167MS+JA88rLrV9dfxRx+ufjeE6lOTbW0pliaxRRF6TYqDrvehbi36IxKULvYI9trkLaDe3j77d4VBXnrqQtxOYdAnA7nMoe7M7La8nqP2AEWv8NviuDZ7V5f0O66ZTYcvCX7Zx9Rq2RtQyujoq1wagsRsV1D5CQmHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377888; c=relaxed/simple;
	bh=2BJRm4wgEIkAM6We144klaRept7/E/Hts/VoRR5fcY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn8+rkcTrNecUiKuQXrTB/w0m3NZXgjwhLoYivZjLTcssyz+zW6zigPtZWLK89pVO6ZW+S1yPc89mpxt0K3/4L+RxD9T67Alldx7Vxfreb/8pP5j5/wreURfMTP45Ys37BV9F/b5vlhLe4UEMwQDiKAOpO6NP8DKKJJEypjweec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94602C2BD11;
	Wed, 22 May 2024 11:38:04 +0000 (UTC)
Message-ID: <ae3f4c13-9a4b-44e3-b793-f94aba59127f@xs4all.nl>
Date: Wed, 22 May 2024 13:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: v4l2-ctrls: Add average qp control
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: nicolas@ndufresne.ca, shawnguo@kernel.org, robh+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240506084918.799544-1-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240506084918.799544-1-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 10:49, Ming Qian wrote:
> Add a control V4L2_CID_MPEG_VIDEO_AVERAGE_QP to report the average qp
> value of current encoded frame. the value applies to the last dequeued
> capture buffer.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> v3
> - document the valid range of the new ctrl
> 
> v2
>  - improve document description according Hans's comments
>  - drop volatile flag
> 
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 14 ++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  5 +++++
>  include/uapi/linux/v4l2-controls.h                 |  2 ++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 2a165ae063fb..4a379bd9e3fb 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1653,6 +1653,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Quantization parameter for a P frame for FWHT. Valid range: from 1
>      to 31.
>  
> +``V4L2_CID_MPEG_VIDEO_AVERAGE_QP (integer)``
> +    This read-only control returns the average QP value of the currently
> +    encoded frame. The value applies to the last dequeued capture buffer
> +    (VIDIOC_DQBUF). Its valid range depends on the encoding format and parameters.
> +    For H264, its valid range is from 0 to 51.
> +    For HEVC, its valid range is from 0 to 51 for 8 bit and
> +    from 0 to 63 for 10 bit.
> +    For H263 and MPEG4, its valid range is from 1 to 31.
> +    For VP8, its valid range is from 0 to 127.
> +    For VP9, its valid range is from 0 to 255.
> +    If the codec's MIN_QP and MAX_QP are set, then the QP will meet both requirements.
> +    Codecs need to always use the specified range, rather then a HW custom range.
> +    Applicable to encoders
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 8696eb1cdd61..1ea52011247a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -970,6 +970,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>  
> @@ -1507,6 +1508,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*max = 0xffffffffffffLL;
>  		*step = 1;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 99c3f5e99da7..974fd254e573 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -898,6 +898,8 @@ enum v4l2_mpeg_video_av1_level {
>  	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 = 23
>  };
>  
> +#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)


