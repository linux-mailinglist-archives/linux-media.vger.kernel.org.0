Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298AD21F6C8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 18:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgGNQJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 12:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgGNQJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 12:09:56 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA39C061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 09:09:56 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o38so13204549qtf.6
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7jEn3zuLk36oYYZwJZX9GhU9ZvoJ77DkQbq9DGM/MOM=;
        b=0+uSjkFdVf22udT4i8ELLkG+3cUk7Pim4b8TT8jXVBK2VFAhKYsjGtN1F93iR0oMeY
         FOGqyfIOsqLLtfnYA7KRyjjnSeBTdD9g9QqwSECUMGvYE9Pu1fxEBQZkbYL/nZN+WsY8
         ebmiWKkdvyveKC2qCSWrihB0dYs24khYxZDskbVFlmA47YM9Pl2ZTYu+vLkNGeh9fbii
         I/JhV7ocLEr38rDVwiCBZr3LB6AM9WunMHuTqDF7ZuyHlLX3+YYf47FVbAdJrU1sU1S8
         tZlHX7M/Y6n/8Vkt1qFHEeNhVxNq7Hitmk9KzyxrXt+SinVnqu0mvaq9oT2mx78iYjel
         7gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7jEn3zuLk36oYYZwJZX9GhU9ZvoJ77DkQbq9DGM/MOM=;
        b=Cc8eHAuvivJ36opkBPdQJE7VpW8YB4jLJUMqQQpF8k2FhRlh6LUI7sZUmgsTD8SNnx
         2Yj3nyE72rk7G+h9MnwugQSQducYLPm84Pr5BBl2nN672536lFCnrFeQ5d5UN1INnolh
         5SAJDD7BJyWzf2/w70NL5fIjoD2JVivb2VWyrYYTorAM/B3KKw/BHW9nsTWRGHd+lrUQ
         bKRqsZRNCTmVj48qhQk286qfw877H5u0i+wgIgBxInVlqRlvBJma1WmUxSPOj6dZjBws
         4BBXYqv0qaGgjw+Rp7EYLlLxlf1OLmzw8UTcNcu406I/U/2eW3eRqE91E07D30Lc6RQq
         DqIA==
X-Gm-Message-State: AOAM533bDg19Lk4av16AUtDEtiBm4tJpoS5bUIreVyOI1oTtXfIQzpHn
        cI424z5J0uDbne8E9hRIopcsbw==
X-Google-Smtp-Source: ABdhPJzNfzghEsFOtOt3syv1MCuBZcvzJbpJuIhKOx57orrbIVp5vLMlFg3PlXnyRqmCfjy+co0XAA==
X-Received: by 2002:ac8:311d:: with SMTP id g29mr5438301qtb.54.1594742995844;
        Tue, 14 Jul 2020 09:09:55 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o187sm22967225qke.76.2020.07.14.09.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 09:09:54 -0700 (PDT)
Message-ID: <dade9f23deba2f12ad8ab2f277e08047af73f46c.camel@ndufresne.ca>
Subject: Re: [PATCH] v4l2-ctrl: Add VP9 codec levels
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Tue, 14 Jul 2020 12:09:53 -0400
In-Reply-To: <20200713081501.28609-1-stanimir.varbanov@linaro.org>
References: <20200713081501.28609-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 13 juillet 2020 à 11:15 +0300, Stanimir Varbanov a écrit :
> Add menu control for VP9 codec levels. A total of 14 levels are
> defined for Profile 0 (8bit) and Profile 2 (10bit). Each level
> is a set of constrained bitstreams coded with targeted resolutions,
> frame rates, and bitrates.

Looks good to me. Perhaps literally put the link in the message ?

https://www.webmproject.org/vp9/levels/

> 
> The definition has been taken from webm project.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 42 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 21 ++++++++++
>  include/uapi/linux/v4l2-controls.h            | 17 ++++++++
>  3 files changed, 80 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..d49bdafa768a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3316,6 +3316,48 @@ enum v4l2_mpeg_video_vp9_profile -
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
> +    Possible values are:

Shall we add some hint in the doc itself upon where these levels are
from so one can figure-out what constraints they impose.

Also, as for other levels (H264/HEVC), all drivers are mostly dummy and
don't validate any of this, shall we keep it this way ? Levels are in
fact complex, because some of the constraints are in image size, and
most of the other constraints are raw or compressed size over time, so
requires timing information for let's say a CBR encoder to enforce it,
for the S_FMT function for the raw constraints.

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
> index 3f3fbcd60cc6..359dc737053d 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -474,6 +474,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
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
> @@ -685,6 +702,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return vp8_profile;
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>  		return vp9_profile;
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
> +		return vp9_level;
>  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
>  		return jpeg_chroma_subsampling;
>  	case V4L2_CID_DV_TX_MODE:
> @@ -938,6 +957,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
>  
>  	/* HEVC controls */
> @@ -1294,6 +1314,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>  	case V4L2_CID_DETECT_MD_MODE:
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 62271418c1be..1b0bc79c1bc3 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -650,6 +650,23 @@ enum v4l2_mpeg_video_vp9_profile {
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

