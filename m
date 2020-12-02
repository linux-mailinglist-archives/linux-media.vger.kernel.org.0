Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ABD2CBE9D
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgLBNnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:43:49 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:32991 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbgLBNnt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 08:43:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kSPPkENtwN7XgkSPSktI1z; Wed, 02 Dec 2020 14:43:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606916586; bh=E3Jd558pW7wNRnBul6/it+0K72KfT4aEhfZlQcXLP80=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J3AB/Q1VlBseI/babsBD2nEPamhEr+0/FUrFLDygf/x5LgaQO6G8+NbA38o+hZDUl
         LJxHGfIxKi55YZMEMrG5FOcYfVsDebIFiNTS07aHKek3avoukpRrYCHtmMxW072tgu
         ImWnLjlxZ3JJY0sXfVFXV2pyiQ9etPW6VTlL9dOpZGZClQLY8ASANTotlh/nN1SF50
         5LDoWGgpp8f2V9Ui+73hIN7QvnDbGGxCt6pBYcG+GwNvYUSLkagphbzsILa+mtaodk
         ZJnRUHY1gzyHr25paW7cck7op9typtVlPT6cv0LsgvVHsktsEn4UY0K9w4j3CmWTO4
         AD521eNr5aJqw==
Subject: Re: [PATCH v3] media: v4l2-ctrl: Add base layer priority id control.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1606121442-31074-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fda7e709-85bd-89c3-e910-72562016e835@xs4all.nl>
Date:   Wed, 2 Dec 2020 14:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1606121442-31074-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLau5zSc7yxNbLhMXzx2sWW1T8GLkQcqNashlyhRrOBCb4UIbyifLXHgZOdUBkKK9K0nXY+X4zeiDNLZP58EoD5TKDhnIrsRhTPc9pyUfvvr2l3g4OrX
 8WfSb8/j/t3vhKSaPGm4PKunK4ZVDzUMsXjeygmQ/zdstIQ2i8rCPabN/Z5mnpbYCXnofkeR2RJ4017xSS36/jjRsG/eLjp/wNAbXH9NCKFdDCv4S8srl2in
 D0nQomDAS3l2RM9eUUlOkUHa4QKiEVvD5VZ10z9Oi1IlAjjkdmGzfAc/sp6oldyAPDTG3Ssxyyy7QgguClD52bKA6//eyNYbj7EgvO+U6fbuHviPIhusa4wv
 EEYTi2916DrAM7lttKn25n8ABYEyKeLlvM9F0+pBDXLQC5tw6obl/lAJxN1LL7jynv4DCUEsVwhE+Fux8enCwCzZQMirag==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 09:50, Dikshita Agarwal wrote:
> This control indicates the priority id to be applied

id -> ID

(ditto in the subject)

> to base layer.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 9 +++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 22222ce..a518d4f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4467,3 +4467,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>         This provides a bitmask which consists of bits [0, LTR_COUNT-1].
>         This is applicable to H264 and HEVC encoder and can be applied using
>         Request Api.
> +
> +``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID (integer)``
> +    Specifies a priority identifier for the NAL unit, which will be applied to
> +    the base layer. By default this value is set to 0 for the base layer,
> +    and the next layer will have the priority ID assigned as 1, 2, 3 and so on.
> +    The video encoder can't decide the priority id to be applied to a layer,

id -> ID

> +    so this has to come from client.
> +    This is applicable to H264 and valid Range is from 0 to 63.
> +    Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 0b81b39..799ab85 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -961,6 +961,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frame(s)";
> +	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index b77fa7d..3c4fdc1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -424,6 +424,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
>  #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
>  #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             (V4L2_CID_MPEG_BASE+232)
> +#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID      (V4L2_CID_MPEG_BASE + 233)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
> 

Regards,

	Hans
