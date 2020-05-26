Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE2A1E218C
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 14:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgEZMEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 08:04:09 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54259 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727844AbgEZMEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 08:04:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dYJOjUxmMDazBdYJRjez8h; Tue, 26 May 2020 14:04:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590494646; bh=ZJRHLdH65QTe0LzHqDsb/auan6tSbiuai6V8Gy8IYlg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=puk3ljc951wv6gx5XchY+j+r8hJI8krBkX2EqYFTsliSYavMkaJr0TJa4Glne094Q
         dyNQ7XzxWYD0rEysWH+Q8GS2hAFxMh7dHDdcBZqKLI+1OfyZQgVdGv055bbrQDSyPU
         qSGMZi9RAw8PTSpp7PZOaIl5jgbkmscDXr4twhJ0xPI0q7qWecuwMpjB2FwuI5H9Dl
         EIAqBUk3Hukk141o1Y5IHM7AtMd0N2KHGoqdkvtjdqVyiKijqkT79z1UGDNlF/W2WW
         6cnijVTnamztJK9GEZpMHdkSd4koHdKOOpZ1f8LZAO9MDQm91rd7NNccG2bDly95oy
         ZpJqzJfccVu1g==
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl>
Date:   Tue, 26 May 2020 14:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHtfGHcI4z1iDxNNRvy7Vk3zCXqAP/jZEdISbwP2jj4EfS5OdK6uhu+6gYszfRxHyMvMSlDk0+Ru7VdX1Stpr7+Zwgr8JKBwrzDEHympXRCBCGd7WusI
 x3smJPNF5Ek46qGDwZ4vN0Rg0qY6ZFDe098efF77/W5Qegzf3W4j2ng+UsEd1sugtam2oa+Xdwojt7Ybgsp78Ryz1FgzEwyK434b+rekbTMucGVgGmUKXXut
 YoceBa6np8BeloAHj4IiNccuIau13f/I7gESAm/rUEveKoXTviUdm+sPvqtvuEp5lbcEi75RJHOco2ovcHECrRCvBN2B9PICm0TpfohZJLc7JwX5DCHBqBci
 lDIzyESmFI1tyQ8GPk3g2iac2gF1iZQdbUxTZ4t+mLH03nog+u9pExVvRV9mOvwsRtwaDyZUyF5oq77qJYHOHZNvXS0ogQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2020 10:54, Stanimir Varbanov wrote:
> Add v4l2 control for decoder thumbnail.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..e838e410651b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      disables generating SPS and PPS at every IDR. Setting it to one enables
>      generating SPS and PPS at every IDR.
>  
> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
> +    Instructs the decoder to produce immediate output. The decoder should
> +    consume first input buffer for progressive stream (or first two buffers
> +    for interlace). Decoder should not allocate more output buffers that it
> +    is required to consume one input frame. Usually the decoder input
> +    buffers will contain only I/IDR frames but it is not mandatory.

This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
but more importantly it doesn't explain how this relates to normal decoding.

I.e. if you are decoding and 'press' this control, what happens then?

What exactly is the use-case?

Regards,

	Hans

> +
>  .. _v4l2-mpeg-hevc:
>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_SPS (struct)``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index b188577db40f..cb2554404c63 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -991,6 +991,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
> +	case V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL:		return "Thumbnail generation";
>  
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1234,6 +1235,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_AUTO_FOCUS_START:
>  	case V4L2_CID_AUTO_FOCUS_STOP:
>  	case V4L2_CID_DO_WHITE_BALANCE:
> +	case V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL:
>  		*type = V4L2_CTRL_TYPE_BUTTON;
>  		*flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
>  			  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 62271418c1be..7e44a2779863 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -743,6 +743,8 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
>  
> +#define V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL		(V4L2_CID_MPEG_BASE + 645)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_MPEG_CX2341X_BASE+0)
> 

