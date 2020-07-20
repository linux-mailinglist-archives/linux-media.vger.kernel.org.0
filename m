Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09ACE225BC2
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgGTJgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:36:20 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37969 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbgGTJgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:36:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xSDYjXh42NPeYxSDZjmqA4; Mon, 20 Jul 2020 11:36:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595237777; bh=YN4Jx7s1JTKAIF5w5HgjC1zjxXWKkiu623Uz7MATK/c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KhQE/aYG5SPhxiF3I3Dy89TkDHat1pZQfcYkfPuI/mXR6jMSyIj1nO6dNE8AyUb0U
         VprlvkHp2BHwFDmTIQnq22oAaFF0QtLlO5IJvFRhdyODBrwWN51H3rbiPluDKdGSTh
         hq7q9mDuhJUTw1qahd+g7Pia57y6PFrNE6yyMXA/RqtvrzYOPjfUptB+H1khgGUd2N
         mwOv3NGC+sz8WV+k+7/zvP4QsUfihgz7PVMuEhk6jaG5OWKPLaoy+0h/YGQhHjWNQY
         Mtb8l4hfxnhmouvlziJrheBFxXOra+qF/lhBpv9ZQ4+VuSIGEYQCBYag5MGPde6fWm
         V2CvckIJ3iPOA==
Subject: Re: [PATCH 1/4] media: v4l2-ctrl: Add frame-skip std encoder control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
 <20200705121128.5250-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d67fa7eb-afe9-49ad-b56c-d89a8f6bc3b6@xs4all.nl>
Date:   Mon, 20 Jul 2020 11:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200705121128.5250-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBGumGYy69YHRtsd+wfFjNj/4eFpbEasfyuIvjue5qCcaxNyoAZ1Y23VOnavzKtyqEB+hG2YgahW83oF34gpQnGY+Uhzg47VOdEvb41neAvCUXLHWSD8
 1sWDuwn077LAJ4wYmJlJPmxCAAcwlj26subeEjCwM77PwxvzdwsfCV7TTYZbETnMYZs0fVoZ8X1vahbDaVaxXjzZ3ysdqaCeFp2XUT4oxwx0HXvDp0T0Bk+E
 8WDuDYfq1XAT1JUzYdsELiUI/kWwqK9FETW194dW4tylIm0GEHCeleQ3aLxlWmjpuzoom5dbvex42P5fTtg6xZbk50YV2UTN4HWZ8hamtghgsIJAPeMS6S8v
 YhU3T86P+vLkceMi6I/GwEmCIuFcBd8sO/nUQb/5oIHWslAG7/BUU+ModIX7Dnqly7IxqN+xVF6c43tLPsNW/2dBjDGiOIFxPBMUsJzwBKhUs6dhC8+fpM+8
 /z8a8aTs3guwjU8ObtKH6KGOgURHlq7ZHuhhpC+VKznij9Kx7sJvYrUog2lNtce2SANwaXnzMPSxDl2e7b9bXUM5XxB3U9l0eA2vx1FssTi1oS5Cti8vlqq0
 7co/qyUmtPC+uWpXGPvct6Gg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/07/2020 14:11, Stanimir Varbanov wrote:
> Adds encoders standard v4l2 control for frame-skip. The control
> is a copy of a custom encoder control so that other v4l2 encoder
> drivers can use it.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

But see note at the end.

> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 32 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
>  include/uapi/linux/v4l2-controls.h            |  6 ++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..a8b4c0b40747 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -592,6 +592,38 @@ enum v4l2_mpeg_video_bitrate_mode -
>      the average video bitrate. It is ignored if the video bitrate mode
>      is set to constant bitrate.
>  
> +``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE (enum)``
> +
> +enum v4l2_mpeg_video_frame_skip_mode -
> +    Indicates in what conditions the encoder should skip frames. If
> +    encoding a frame would cause the encoded stream to be larger then a
> +    chosen data limit then the frame will be skipped. Possible values
> +    are:
> +
> +
> +.. tabularcolumns:: |p{9.2cm}|p{8.3cm}|
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_DISABLED``
> +      - Frame skip mode is disabled.
> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_LEVEL_LIMIT``
> +      - Frame skip mode enabled and buffer limit is set by the chosen
> +	level and is defined by the standard.
> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
> +      - Frame skip mode enabled and buffer limit is set by the VBV
> +	(MPEG1/2/4) or CPB (H264) buffer size control.
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
>      For every captured frame, skip this many subsequent frames (default
>      0).
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..d088acfa6dd8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -590,6 +590,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"External",
>  		NULL,
>  	};
> +	static const char * const mpeg_video_frame_skip[] = {
> +		"Disabled",
> +		"Level Limit",
> +		"VBV/CPB Limit",
> +		NULL,
> +	};
>  
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
> @@ -651,6 +657,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return flash_strobe_source;
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
>  		return header_mode;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
> +		return mpeg_video_frame_skip;
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>  		return multi_slice;
>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
> @@ -844,6 +852,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1265,6 +1274,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_FLASH_LED_MODE:
>  	case V4L2_CID_FLASH_STROBE_SOURCE:
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 62271418c1be..4e1526175a4c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -742,6 +742,12 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
> +#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 645)

I think this now clashes with "media: v4l2-ctrls: Add encoder constant quality control".

I recommend making a new series that combines both series. That avoid this problem.

Regards,

	Hans

> +enum v4l2_mpeg_video_frame_skip_mode {
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
> +};
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

