Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A1126226B
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 00:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgIHWJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 18:09:22 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58021 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726369AbgIHWJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 18:09:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Flngk7HoMgJnQFlnhktjnR; Wed, 09 Sep 2020 00:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599602958; bh=IhI721eaP7+VKo8uClkjaJoSslW4xBDgSR0a8FCRnE4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NskNbFgmCYGAFEKUpTba97xohZsyH0EEPSrQpNUFfQ4FYEoEhgYRuCYfFYNgMaDVi
         rgQMxHUfds+X1tPubWS+9rKPbGoWHNyDSsBgL5si53Tne2wj+f7lTZgAsLyM/xVCzB
         1E2wXYOEZBS5QGq3YjSP2z3Ll5Cza3ZLWwoChSsOFsEFRgZ2W8iWs6Z2yA0+44duVu
         hwemU4EwlwKOD+zMTSwTedSIsmoEVvnutElPfCd/pdKGw0HSEHyjQAQ70Z0dnI4VCX
         bFOS6+LfedI7RhRi4c5n2T3DhoMAUosLPvgOmq8GChvCenHyKAvYHPU8f741FD1/z/
         FqUu+SjUsPYKA==
Subject: Re: [PATCH v3 1/6] v4l2-ctrl: Add VP9 codec levels
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
 <20200908123221.2793-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7592e482-de3e-9bc8-c08d-a860d4e8dd26@xs4all.nl>
Date:   Wed, 9 Sep 2020 00:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908123221.2793-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfItfcxsl9h2MIrorM3mxfgR6A2KKfuGYEJNE//D1nZHI2IZdad69k+Qd5pq64wodoysevrxk2dHN1B5xbVxjo0SzuIg5HKkQyraWU4uCtvoS5e/NqiIE
 sihNdNJiHcmJx3qTwT9vsPwoDlqvjrRRjHbzEosx+bCP3GovHK1gm7T4HCMtV997J+Nfkxcox+bD+sNEJYY/rDZOQdcD+V8TRTxZ1wnNshGAOJbCgfUXxieZ
 slgtC+ztmLVkgCCZlnpekKTt8/g29Nrs7IKAa46eI16jSRGpFvBoJhJUYHtW9bRl0q0dKdZFdU5ABdQLfEW9rXR+56DtjKJ2AYSLpp625tSvaLd3YFIpz25W
 Q9D3kTCf6+kau+Yc4NXwtjq5nKk77Wd2+jFIubvEMkF1EIKYG6mJgWnVeKCcz1bfBtwbmkb9SSMPCOn2WORWYLKUb/bt5PRflIaIVBtXMsyvIszm+Mr9zVuy
 GFjjU70yNe44CEbKuwO+e2H4rjxcgNXus8oE48LGzL9k4hVh9F+DeJytBZkL/crL/Cjf2u36RzGYwqKzzZW9rlcExkT4uym5vgChjS3YabpQb04p/uPd8zcz
 sq9sykabOoXPKYCXQPQB08l2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/09/2020 14:32, Stanimir Varbanov wrote:
> Add menu control for VP9 codec levels. A total of 14 levels are
> defined for Profile 0 (8bit) and Profile 2 (10bit). Each level
> is a set of constrained bitstreams coded with targeted resolutions,
> frame rates, and bitrates.
> 
> The definitions have been taken from webm project [1].
> 
> [1] https://www.webmproject.org/vp9/levels/
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks,

	Hans

> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 43 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 21 +++++++++
>  include/uapi/linux/v4l2-controls.h            | 17 ++++++++
>  3 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 289d380e2cf0..ce728c757eaf 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3383,6 +3383,49 @@ enum v4l2_mpeg_video_vp9_profile -
>      * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_3``
>        - Profile 3
>  
> +.. _v4l2-mpeg-video-vp9-level:
> +
> +``V4L2_CID_MPEG_VIDEO_VP9_LEVEL (enum)``
> +
> +enum v4l2_mpeg_video_vp9_level -
> +    This control allows selecting the level for VP9 encoder.
> +    This is also used to enumerate supported levels by VP9 encoder or decoder.
> +    More information can be found at
> +    `webmproject <https://www.webmproject.org/vp9/levels/>`__. Possible values are:
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_0``
> +      - Level 1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_1``
> +      - Level 1.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_0``
> +      - Level 2
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_1``
> +      - Level 2.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_0``
> +      - Level 3
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_1``
> +      - Level 3.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_0``
> +      - Level 4
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_1``
> +      - Level 4.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_0``
> +      - Level 5
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_1``
> +      - Level 5.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_2``
> +      - Level 5.2
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_0``
> +      - Level 6
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_1``
> +      - Level 6.1
> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_2``
> +      - Level 6.2
> +
>  
>  High Efficiency Video Coding (HEVC/H.265) Control Reference
>  ===========================================================
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 73f3d65957ff..bd7f330c941c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -475,6 +475,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"3",
>  		NULL,
>  	};
> +	static const char * const vp9_level[] = {
> +		"1",
> +		"1.1",
> +		"2",
> +		"2.1",
> +		"3",
> +		"3.1",
> +		"4",
> +		"4.1",
> +		"5",
> +		"5.1",
> +		"5.2",
> +		"6",
> +		"6.1",
> +		"6.2",
> +		NULL,
> +	};
>  
>  	static const char * const flash_led_mode[] = {
>  		"Off",
> @@ -694,6 +711,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return vp8_profile;
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>  		return vp9_profile;
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
> +		return vp9_level;
>  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
>  		return jpeg_chroma_subsampling;
>  	case V4L2_CID_DV_TX_MODE:
> @@ -950,6 +969,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
>  
>  	/* HEVC controls */
> @@ -1307,6 +1327,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>  	case V4L2_CID_DETECT_MD_MODE:
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 053827cda8e6..a184c4939438 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -651,6 +651,23 @@ enum v4l2_mpeg_video_vp9_profile {
>  	V4L2_MPEG_VIDEO_VP9_PROFILE_2				= 2,
>  	V4L2_MPEG_VIDEO_VP9_PROFILE_3				= 3,
>  };
> +#define V4L2_CID_MPEG_VIDEO_VP9_LEVEL			(V4L2_CID_MPEG_BASE+513)
> +enum v4l2_mpeg_video_vp9_level {
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_1_0	= 0,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_1_1	= 1,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_2_0	= 2,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_2_1	= 3,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_3_0	= 4,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_3_1	= 5,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_4_0	= 6,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_4_1	= 7,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_0	= 8,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_1	= 9,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_2	= 10,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_0	= 11,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_1	= 12,
> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_2	= 13,
> +};
>  
>  /* CIDs for HEVC encoding. */
>  
> 

