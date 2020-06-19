Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97022008D8
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 14:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgFSMjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 08:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgFSMjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 08:39:10 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9B1C0613EE
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 05:39:09 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f18so8753240qkh.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jS9Cx48KxvyLj4sEdC/4ikdQnELSNwkqzFpXAm2s44w=;
        b=GHb2tJFIzWdBnMTKTlBJYZ/jbvDCcFIL08zyDDiOOLIooFN2jtNK2vQCzX1jR7qxlb
         LEZLEf4Toqc6AOaT6k80vZvqR2/666M4jmSiKsDW/T3z34uELwUPRqSepX0EIIekUiqj
         MmWPwQDoLjYgxZuxKhbyibG8QeYFHwHFfFwwo2QsXbkoMmfSW1a5++5ZNBmiKGvfrqiY
         hW9rtQORDQjFlEjPjMbYF6v7/BC+Dp9Bi0YP0pyiOizh9dNv6tr38+RK3hKVAJQ+gwPe
         y86icKWuq/4VTDDteTieZje7CSOH6MobjiVlJK9f/mNcp65nziNLDN4fFIgbwHLzcph1
         pxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jS9Cx48KxvyLj4sEdC/4ikdQnELSNwkqzFpXAm2s44w=;
        b=SQb00uJ3LERc22VxLDH4IGtJyOxgMS3au1raud7np8KG8fVoiJLHYbbxJzQ2Vcz/Jz
         3qkNL4TTw7TH67ouJFJqaQ9BBm6IWCY7qyp/2AwwFZmy8pSX8qfNdP2i2SZN0oidoK0d
         2Bznd0dCRg6uueVnX8Jzn24+jQzOuE+K0Z0zGBWoPaL2u39P8gaRNTM1x/2DlmL2rln/
         hM8Zb3B12UwVGP+xUTRG9YhNDG9STZcS1i5k9xDuqhCjU4CyPFZiUzZRg8P2VQoVZjnd
         GeQ1DcDf3jcfhyNBE3iLoo8qnxB2h3IBpYw/+OhGmMLL5cxpPfLyJ8Wcm9eIN2Rm/cI3
         aHCg==
X-Gm-Message-State: AOAM5314Nbak3czzi0rWP+i6UeCB+LXyR3lGhBJ7ACFot7hC4AWzfc1M
        7SS0fXYouiRp36TrhAnZTraldw==
X-Google-Smtp-Source: ABdhPJyRBAIWwslNfa6GQwpEXR/EmtXc5kObKKUOQaAOlhKKorBr5wMy2rmwwIGhrJIYOcxD6iMc2w==
X-Received: by 2002:ae9:e647:: with SMTP id x7mr3262880qkl.70.1592570348755;
        Fri, 19 Jun 2020 05:39:08 -0700 (PDT)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id u205sm6026879qka.81.2020.06.19.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 05:39:08 -0700 (PDT)
Message-ID: <a0ee566a587c28ffce97224abfa901520af5c83f.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] v4l2-ctrl: Add control for intra only decode
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Fri, 19 Jun 2020 08:39:07 -0400
In-Reply-To: <20200616123001.11321-4-stanimir.varbanov@linaro.org>
References: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
         <20200616123001.11321-4-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 16 juin 2020 à 15:30 +0300, Stanimir Varbanov a écrit :
> This adds a new decoder control to instruct the decoders to
> produce on its output intra frames only. Usually in this mode
> decoders might lower the count of output decoder buffers and
> hence reduce memory usage.

Perhaps I missed some discussion, would be nice if you could remind the
rationale from going away from a SKIP_MODE menu to adding dedicated boolean
control for each mode.

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 9 +++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                     | 2 ++
>  include/uapi/linux/v4l2-controls.h                       | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index b9d3f7ae6486..d7f34596f95b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -652,6 +652,15 @@ enum v4l2_mpeg_video_bitrate_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY (boolean)``
> +    If enabled the decoder should start decoding only intra frames. The
> +    decoder consume first input buffer for progressive stream (or first
> +    two buffers for interlace). Decoder might not allocate more output
> +    buffers than it is required to consume one input frame. Usually the
> +    decoder input buffers will contain only intra frames but it is not
> +    mandatory. This control could be used for thumbnails generation.
> +    Applicable to the decoder, all codecs.

This imply that number of allocated buffers might be smaller (no references
buffer are needed), but I think it should actually be more explicit that this
must be set prior to reading MIN_BUFFER* and/or allocating buffers (since it's
userspace that allocates buffers).

What if a HW support live switching of this mode on key frames ? And if so, how
do we configure and control that ?

> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-
> core/v4l2-ctrls.c
> index bc00d02e411f..2b1fb8dcd360 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -846,6 +846,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264
> MB Level Rate Control";
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return
> "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max
> Number of Reference Pics";
> +	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:	return "Decode
> intra frames only";
>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame
> QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame
> QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame
> QP Value";
> @@ -1197,6 +1198,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum
> v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> +	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:
>  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
>  	case V4L2_CID_IMAGE_STABILIZATION:
>  	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
> controls.h
> index 0f7e4388dcce..c64471e64aa7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -744,6 +744,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE +
> 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE +
> 644)
>  #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE +
> 645)
> +#define V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY	(V4L2_CID_MPEG_BASE +
> 646)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2
> */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS
> _MPEG | 0x1000)

