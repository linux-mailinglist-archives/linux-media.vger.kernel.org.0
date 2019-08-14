Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD628CDB8
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfHNILl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:11:41 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:32803 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbfHNILl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:11:41 -0400
Received: from [IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96] ([IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xoN6hRmGlqTdhxoNAhCccS; Wed, 14 Aug 2019 10:11:37 +0200
Subject: Re: [PATCH v5 04/11] media: uapi: h264: Add the concept of start code
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190812193522.10911-1-ezequiel@collabora.com>
 <20190812193522.10911-5-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f88d144f-e0fe-6974-efe5-77b5ed5c6e09@xs4all.nl>
Date:   Wed, 14 Aug 2019 10:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190812193522.10911-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG8Jzg4iwcPYhjaE3e0D1MzS/fTJ/eDl4AEQI2qX+XOCPw8tnWB5Y+HXAymMpC8EyabKscl/GIMDy/RJARU23MJZNq76ZSSM/xEECsPalo31ZWSBNCQe
 OiVJ1xF4NFcmHOVZa9JLq/xylYBGiJZLhwKx6OEJ29QQLrY5H3YWgXdHMLYd+L+bjMVzzdMXXmUevf0w2cwmjB+eAmLcrkxPsXJ4Zh2V0WYULRIMVzE1a0Ze
 ta8b89PWo00P5NlPW/aeg2BDTGaJzXFuUnjWrhu37Pf+NtrYt917QYI1HD2LIpUwOhVzCX2FTyYBakPMz/jcIJbJ+4c4RVQQdmuO3923M7tS1kWNzTu2leBn
 HoC6MDyCFUrT9aLlVhta7saGxI5nJnqYGKNJkDmavufWEhoRp4eUV9lwf682O5YerUzuScE++kne0/gOuD7fLY4CH6ZrAsZwPS317wIUhJ/HIUAx8MZjCfIo
 SeucqXmdwOPDQ6eNUBpXsyvfKrwQRk4zXrCRlmTXRA58Xb94D+bbRvixzBtwlSrbeSbp8jlluguU6CIfKnq+TXRarsR+mKMvzP+tueYbunp00BqTpR1Gua7w
 479IGDcBjLac8AOsAMZVJ0zODF6y4kODYqZxBS/pFCcPiUJIBoYpiM5PSzIGlz6LXkoedT5fx4Pc9u15HRjD7j0EP0wu0bBXm5rqUfiNpwreDvPdIFEHjhhJ
 CixfdwKkLAt+KwA5kr3da35dbZPC/sATPI2z5zMIrsnmDN34sRdJoA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/12/19 9:35 PM, Ezequiel Garcia wrote:
> Stateless decoders have different expectations about the
> start code that is prepended on H264 slices. Add a
> menu control to express the supported start code types
> (including no start code).
> 
> Drivers are allowed to support only one start code type,
> but they can support both too.
> 
> Note that this is independent of the H264 decoding mode,
> which specifies the granularity of the decoding operations.
> Either in frame-based or slice-based mode, this new control
> will allow to define the start code expected on H264 slices.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes in v5:
> * Improve specification as suggested by Hans.
> Changes in v4:
> * New patch.
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 33 +++++++++++++++++++
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  3 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
>  include/media/h264-ctrls.h                    |  6 ++++
>  4 files changed, 50 insertions(+), 1 deletion(-)
> 

<snip>

> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e6c510877f67..31555c99f64a 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -27,6 +27,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
> +#define V4L2_CID_MPEG_VIDEO_H264_STARTCODE	(V4L2_CID_MPEG_BASE+1006)

I almost forgot: can you change this to _START_CODE? Since it is two words?

Thanks!

	Hans

>  
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -41,6 +42,11 @@ enum v4l2_mpeg_video_h264_decoding_mode {
>  	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
>  };
>  
> +enum v4l2_mpeg_video_h264_start_code {
> +	V4L2_MPEG_VIDEO_H264_NO_STARTCODE,
> +	V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE,
> +};
> +
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
>  #define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
> 

