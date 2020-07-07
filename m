Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CF32179BC
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 22:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728796AbgGGUx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 16:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgGGUx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 16:53:26 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B67CC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 13:53:26 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 6so7599559qtt.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gVwyaiMqcfGbS600r67tXUN/Mh1ymbebPktZ0iNyAv8=;
        b=x8kgdAMi4yziKrr1m6MqTMNrrNV/FBHrOGIO8Fl9jJzyaH6NicPXmekV2gY8dse7KU
         65hGnYCllVL9JRoaHECH9YRpyAhOl1ICNQiBvdk5jY252vlmjJt4VHHy1cLWZkp1zcoB
         lpk8W3y0P11xN6BI1YkxxcExh44ZswP8UGAarNYPVshNhinMQjjw/ru3+Qy7If+picrt
         P56ZETR3nAQWrZpOL4amYYklVoAB6I6cRsBy4q5wISfSy7CVzPgonrigxUU3lee3gBfh
         PM435qdK2q96dCxoJS/S4Qoc7mFkrVFmQo1KzkYPpbio1/qWmXRB0cWk5vG6KuZ2mwrf
         d03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gVwyaiMqcfGbS600r67tXUN/Mh1ymbebPktZ0iNyAv8=;
        b=U2Hnp48ef3jdN+z9fRtv1eAt3+MnxbhPvv5oFVQb42aDCOGbsWGXcICUTM2JPHmW9s
         8M/PVuxWGejlPjXqXDDFHxbSKGMUfH7WoGSQHvSDOsID93HQnQFzWOkihnaFYwYYuDzd
         l4qr2f6DF87chQCQYPSYSg08ysiB/7dkfHBjXZG8TuNUG+6hCpNhqZkMXoAxsoguQYIU
         JXiBxhnqkVvPP/zS8uK6qpGSpYT4674oSmrvzhhtKSSPScWLzuGG7t4oIscLcOMg4xzL
         NfkAWOzjhT3I8V9CHiZ83zgG4a9x2LfUnvH8j+aNRHl+NUpoGjSIRkrneQt3aMdwUCLf
         3JXQ==
X-Gm-Message-State: AOAM533IaCbqQY90GSlWB3aZQa8d4TTVXNp0QNHBDwPW70AxXW2vF8S1
        MqBlRQq9juHkUAn6wpg5guuRZw==
X-Google-Smtp-Source: ABdhPJzdtSLRhZBaASMAhuILnWWGKdU7vh+lCfymS/JvG2R3j/dlE/NjZWrDLUzBTaYP9M4xbsdXxw==
X-Received: by 2002:ac8:7208:: with SMTP id a8mr59313451qtp.355.1594155205372;
        Tue, 07 Jul 2020 13:53:25 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id p186sm25121241qkf.33.2020.07.07.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:53:24 -0700 (PDT)
Message-ID: <e9ce36f9de4ef216028832dd78fd7ebc88d6ecb1.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: v4l2-ctrl: Add frame-skip std encoder control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>
Date:   Tue, 07 Jul 2020 16:53:23 -0400
In-Reply-To: <20200705121128.5250-2-stanimir.varbanov@linaro.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
         <20200705121128.5250-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 05 juillet 2020 à 15:11 +0300, Stanimir Varbanov a écrit :
> Adds encoders standard v4l2 control for frame-skip. The control
> is a copy of a custom encoder control so that other v4l2 encoder
> drivers can use it.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
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

I have nothing against this API, in fact it's really nice to generalize
as this is very common. Though, I think we are missing two things. This
documentation refer to the "chosen data limit". Is there controls to
configure these *chosen* limit ? The other issue is the vagueness of
the documented mode, see lower...

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

At least for H.264, a level is compose of 3 limits. One is the maximum
number of macroblocks, this is is evidently not use for frame skipping
and already constrained in V4L2 (assuming the driver does not ignore
the level control of course). The two other limits are decoded
macroblocks/s and encoded kbits/s. Both are measure over time, which
means the M2M encoder needs to be timing aware. I think the time source
should be documented. Perhaps it is mandatory to set a frame interval
for this to work ? Or we need some timestamp to allow variable frame
interval ? (I don't think the second is really an option without
extending the API again, and confusingly, since I think we have used
the timestamp for other purpose already)

> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
> +      - Frame skip mode enabled and buffer limit is set by the VBV
> +	(MPEG1/2/4) or CPB (H264) buffer size control.

The notion of VBV an CPB is unlikely well known. If my memory is right,
these are constrained in buffering: in bytes (VBV) or bits per frame
over a window of n-frames (or the gop size for some less flexible
encoder) (CPB). I think these should be somehow chosen by application
(with controls), directly or indirectly, and documented here to ensure
we get consistent implementation across drivers.

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
> +enum v4l2_mpeg_video_frame_skip_mode {
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
> +};
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)

