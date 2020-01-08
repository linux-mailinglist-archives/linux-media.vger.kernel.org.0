Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D19134741
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 17:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgAHQJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 11:09:39 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49271 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726922AbgAHQJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 11:09:39 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pDtjiXEm4pLtbpDtmiHdt5; Wed, 08 Jan 2020 17:09:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578499775; bh=kmsCylMQnvNLljjtH/5R6Qd+4IWFqilvWA3W0idMQLA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fTMbiHxB2zt4MZxGlsWVKDEqwXrLP8SZBRCUGfA9Jpe4MA0p0Qvap7o0A7x/DejNn
         cjYXCYUzfs2TKzFqemb9CrkLroMmWjmbP033MuWFNVCzDVlRgpn0My0/f9LWUwzN6i
         R4gM9jw+nwd+DcT9FExDM5POEFKAu2IwFRPREezB9//v8D+AQjqe/+o/dH0GgyWAxM
         VJOcrb4X6R4PrkXFuvFw6Xi3E/rjX+epyGNOWw3nMEWRP/Z8XOKGas0ppH21UIqcAV
         M/33YPRt3n97/V00gygIvTsnS99tQK+UTGi2jiGhd+MbtOpXuVkHzcKt43V5fO9XnT
         Qe/4rE1R383Qg==
Subject: Re: [PATCH v4 04/12] v4l: Add source event change for bit-depth
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-5-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
Date:   Wed, 8 Jan 2020 17:09:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200106154929.4331-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLZOPd7nEc6mtz3KkR3z8WAv5nebYzc6GaZPifyqG8SDLEYK+/cZcgiZj1m8Mp2HsvqxYBIh6PDz+ME2Wm31Ob0+/Pt4jCULg9nqdbDtyOWlZf89Flgn
 wHJe3KHP6oEFsyqoJIbiDfk0lalpJahBN8ZGTAkXJVFW60qQlMiSEownruBt7/WJfQo1IeRwuNhNBCm19ldTcQd7+7s3tdPLrX5hWj2+4ZC3wmsoDHyoZnGp
 WVpp9IxdbqmtNOapjPTnkroI6ks6CCIwe/vRR7AA+7HRZeiwXLjeDYuKiqh7bev+uPkKIUOZ4tPWyqTao9RYreTkiRBLt4UQNbq1sRxU2lwyzvsQglv3Gwix
 IusukogpwVb+GvIeGMTxwXMsg1mEdoOrGYYmsfRtV29mS+SYlHgVFDrwRt0Yl+CzJV/gZtby
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/6/20 4:49 PM, Stanimir Varbanov wrote:
> This event indicate that the source color bit-depth is changed
> during run-time. The client must get the new format and re-allocate
> buffers for it. This can usually happens with video decoder (encoders)
> when the bit-stream color bit-depth is changed from 8 to 10bits
> or vice versa.
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>  include/uapi/linux/videodev2.h                  | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> index 42659a3d1705..fad853d440cf 100644
> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> @@ -402,7 +402,13 @@ call.
>  	that many Video Capture devices are not able to recover from a temporary
>  	loss of signal and so restarting streaming I/O is required in order for
>  	the hardware to synchronize to the video signal.
> -
> +    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
> +      - 0x0002
> +      - This event gets triggered when color bit-depth change is detected
> +	from a video decoder. Applications will have to query the new pixel
> +	format and re-negotiate the queue. In most cases the streaming must be
> +	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
> +	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).

I think this is too specific for decoders. Something similar to the
CH_RESOLUTION description would be more appropriate:

      - This event gets triggered when a color bit-depth change (but not a
	resolution change!) is detected	at an input. This can come from an
	input connector or from a video decoder. Applications will have to query
	the new pixel format and re-negotiate the queue.

	For stateful decoders follow the guidelines in :ref:`decoder`.
	Video capture devices will in most cases have to stop and restart
	streaming (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` followed by
	:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).

And update dev-decoder.rst where needed with this new event flag.

As to your question on irc: once I've acked this patch it can be merged
via a venus PR.

Regards,

	Hans

>  
>  Return Value
>  ============
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index cb6ccf91776e..209709114378 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -490,6 +490,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>  
>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> +replace define V4L2_EVENT_SRC_CH_COLOR_DEPTH src-changes-flags
>  
>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5f9357dcb060..1d349c9d57a7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2332,6 +2332,7 @@ struct v4l2_event_frame_sync {
>  };
>  
>  #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
> +#define V4L2_EVENT_SRC_CH_COLOR_DEPTH		(1 << 1)
>  
>  struct v4l2_event_src_change {
>  	__u32 changes;
> 

