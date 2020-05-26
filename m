Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0594E1E21AB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 14:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbgEZMKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 08:10:02 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50073 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727933AbgEZMKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 08:10:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dYP3jV0QzDazBdYP7jf1Gv; Tue, 26 May 2020 14:09:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590494998; bh=QwLeF6HA5MXM0lAuvwqjmzDvL7l0Ju+BIITWx1LKRk4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tgM57EdMR4/+xYryhjAtsyUtobM0wNXjQD6pE7+gosz29/jbzf6z1z63upjU7tTA6
         qezBhU3FfE8FcXYpFnE4VCCaZwQREQTnxs72PikvVXvSSc9rfTosr9DzuLnADV6lOH
         wEjBgO5QoAgC9z2RkcuJIK9HYMw+fINo8m++HB2SIIhlAHnpGvXjklLFZLc7MF3Ejg
         DQTJxjdZMg6RHd1PsXwkosVmewLiZdNMWelzs+ZG1JMJM7kdLq0TDfptysw/5jqlqs
         PQM+pHEX5Vuv2aaxA6fNBDPy+db0oQpsfWcKXeko/DrquuraxE0ZQhwNFvhcB6G/nj
         SuF5mUex8vfRQ==
Subject: Re: [PATCH] media: v4l2-ctrls: Add encoder constant quality control
To:     Maheshwar Ajja <majja@codeaurora.org>, mchehab@kernel.org,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        p.zabel@pengutronix.de, posciak@chromium.org, jonas@kwiboo.se,
        boris.brezillon@collabora.com, ribalda@kernel.org,
        tglx@linutronix.de, sumitg@nvidia.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1589836035-16579-1-git-send-email-majja@codeaurora.org>
 <1590195927-14438-1-git-send-email-majja@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cfa24e64-5911-3e7d-2f6f-f39da1516e1a@xs4all.nl>
Date:   Tue, 26 May 2020 14:09:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1590195927-14438-1-git-send-email-majja@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN/k0FyV5a0viT9aAYfjS0g5UUEJ/t5qw/5vTeRJr1lBwDYAPRKDUHNoi8meKmguObHakjEvFqpQAfBJL0Km0ChmbwJTtkv5xQnjmEwYnKvL+IHG0WBd
 gjWSZzixu364hLys5Q0nEd4q8zB6WtAsgb7uKvslaEaq3yDS18Tjrp/PvUPL2C5DQdtDXIG5bXtzCRLk7uaOy+B6NBdB6+X7PybpQVk47mhutYC2cfqsJM8g
 BKunDBIj+1A47donyeFCNrU+hVG0vd/xMWA7VgqXfTCOh0WuHVznRY9QKlTy6jP8/CRh1yJCr8PAOw0UqvRsRNU12L/uR9rYdUPH97Ty6kqz2apQysPeHkHw
 G7xRuZM+pFnXss5yH/3QeVcEvrWzgGR6FK8jrN3dcG4i/i/bXk0tGARgOY2MM4AJpbNEzt+5EdM+zWCsSHmNfRKAbjuZajNh1Gl60MrnBQ42BJqXCKz9xOEM
 D+hahN89O9UrFXfVL9mlFX6fZpphNeSyyZ3/bzla7taflWT2SrZPuJHcGOEM2XnjhhvwpShFZQd+hbB4nO0wqO4x2WXiDLWc8FYxkYGof25mlodPQBkofbo5
 fAU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/05/2020 03:05, Maheshwar Ajja wrote:
> When V4L2_CID_MPEG_VIDEO_BITRATE_MODE value is
> V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, encoder will produce
> constant quality output indicated by
> V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY control value.
> Encoder will choose appropriate quantization parameter
> and bitrate to produce requested frame quality level.
> 
> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      |  2 ++
>  include/uapi/linux/v4l2-controls.h                        |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a..b9d3f7a 100644
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
> index 1c617b4..f94cc9d 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -199,6 +199,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  	static const char * const mpeg_video_bitrate_mode[] = {
>  		"Variable Bitrate",
>  		"Constant Bitrate",
> +		"Constant Quality",
>  		NULL
>  	};
>  	static const char * const mpeg_stream_type[] = {
> @@ -982,6 +983,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
> +	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:		return "Constant Quality";

Add this to the codec controls that are earlier in this function (around line 925).

It's not HEVC specific, it can be used by any codec with constant quality support,
so it looks odd making this part of the HEVC controls.

Other than that, this looks good. Before it can be accepted we do need a driver
that supports this feature, so a second patch is needed that adds this to a driver
(I'm guessing that that will be the venus driver).

Regards,

	Hans

>  
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0ba1005..ca916da 100644
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

