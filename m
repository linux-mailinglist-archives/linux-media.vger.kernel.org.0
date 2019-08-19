Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA3894934
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 17:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfHSPxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 11:53:49 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49717 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbfHSPxt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 11:53:49 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zjyXhIMM8zaKOzjybhsEwV; Mon, 19 Aug 2019 17:53:46 +0200
Subject: Re: [PATCH v7 02/11] media: uapi: h264: Rename pixel format
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190816160132.7352-1-ezequiel@collabora.com>
 <20190816160132.7352-3-ezequiel@collabora.com>
 <20190819124110.GB32182@aptenodytes>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e618bf01-3f82-ff06-1842-9d21a379d7ee@xs4all.nl>
Date:   Mon, 19 Aug 2019 17:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819124110.GB32182@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLSJAj/rDwoyBQh8QJ0WKMTeCggqoSOqIj+0x32nTjKPJ7c0WpJYdAy9fu62xRI4TGb8PUpkE/HJrv5WzA4xfCcBo2dpkBsitEjg7tzzu+z1ezY/mgme
 +p05/vXXregGSH1mCwY6KHZV3o6yHcEiVfBYgGJXoaCo/1Xu9tKciwwu8qAxFnwa7Kzbr7z3jBgvxF9SjpbjzDpVNR/HKAgNVXhagig27AWvRLCH1a3ojzOs
 WCeutyZ6DN5SWz9Xio8QeWY2TjYmyGdS6c/oYd/nZvoDR+XDoORZKH2apIg7+ubHXs/Tgse+mKO1BwcXJK1Fiuq5Rha8ISY3wcp2NdzcMn1u/sOG1hm+2NQt
 qs0LnFdMplq0PEtHXDSK1p2w1THwHXaqHPKnMmSmfkIVLAntUZlqCJQ7RAlQIOqCHF8TNbFuBNc7+R8EUJbRnHzudTktl40QPrqxJeP+tY8AJk+7yCVaLTjW
 ttK7z02JzqZdwwrs/gQ2gPFrEJYhxCg88aqWcMUz2KgMCCFCoHHmjkGCSEg4Gcd5mLDHLyvsVw7t2fT1JJflSUYS42/EBTZr2CQNC0iOa8XYr/bxUgR+suAB
 NVSAmLJeP8tm5/aUFKyAoGMnqvDYcq5wbrJq7DoPEMfpLng38S/yAoRUpNUr/tBrfvw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 2:41 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri 16 Aug 19, 13:01, Ezequiel Garcia wrote:
>> The V4L2_PIX_FMT_H264_SLICE_RAW name was originally suggested
>> because the pixel format would represent H264 slices without any
>> start code.
>>
>> However, as we will now introduce a start code menu control,
>> give the pixel format a more meaningful name, while it's
>> still early enough to do so.
> 
> I definitely agree that SLICE_RAW is not the suffix we are looking for, but I'm
> not sure that _SLICE is self-describing given that we can operate either
> per-frame or per-slice, and _SLICE sort of implies the latter. Also, VP8 uses
> _FRAME to clearly indicate that it operates per-frame.

Well, VP8 doesn't support slices at all.

> 
> In addition, the _SLICE suffix is used by MPEG-2 in the stable API. Since we

Regarding MPEG-2: while it has a concept of slices, it is my understanding
that you never process slices separately, but only full pictures. I may be
wrong here.

> certainly want MPEG-2 to allow per-slice and per-frame decoding as well as
> H.264 and that the _SLICE format is specified to be the broken "concatenated
> slices" that cedrus expects, we probably want to use another suffix. This way,
> we could deprecated MPEG2_SLICE and introduce a new format for MPEG-2 that would
> have consistent naming with the other mpeg formats.

I actually think that H264_SLICE is a decent name.

I'm less sure about MPEG2_SLICE since I am not sure if it means the same as
a H264 slice.

> 
> One suggestion I had was to call it H264_PARSED (and apply this to MPEG-2 and
> HEVC when similar controls to H.264 are set in place for them). I think Hans had
> another suggestion for the name but I don't recall what it was at this point.

I can't remember it either. In any case, I'm not that keen on _PARSED.

I think for H264 and HEVC the _SLICE suffix is good enough.

Regards,

	Hans

> 
> Either way, if this has to be some debate, we could perhaps take it off your
> series and stay with SLICE_RAW for now, as long as we do rename it before making
> the API stable.
> 
> What do you think?
> 
> Cheers,
> 
> Paul
> 
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
>> ---
>> Changes in v7:
>> * None.
>> Changes in v6:
>> * None.
>> Changes in v5:
>> * None.
>> Changes in v4:
>> * New patch.
>> ---
>>  Documentation/media/uapi/v4l/pixfmt-compressed.rst | 4 ++--
>>  drivers/media/v4l2-core/v4l2-ioctl.c               | 2 +-
>>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c    | 2 +-
>>  drivers/staging/media/sunxi/cedrus/cedrus_video.c  | 6 +++---
>>  include/media/h264-ctrls.h                         | 2 +-
>>  5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> index f52a7b67023d..9b65473a2288 100644
>> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
>> @@ -52,9 +52,9 @@ Compressed Formats
>>        - ``V4L2_PIX_FMT_H264_MVC``
>>        - 'M264'
>>        - H264 MVC video elementary stream.
>> -    * .. _V4L2-PIX-FMT-H264-SLICE-RAW:
>> +    * .. _V4L2-PIX-FMT-H264-SLICE:
>>  
>> -      - ``V4L2_PIX_FMT_H264_SLICE_RAW``
>> +      - ``V4L2_PIX_FMT_H264_SLICE``
>>        - 'S264'
>>        - H264 parsed slice data, without the start code and as
>>  	extracted from the H264 bitstream.  This format is adapted for
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index bb5b4926538a..39f10621c91b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1343,7 +1343,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
>>  		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
>>  		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
>> -		case V4L2_PIX_FMT_H264_SLICE_RAW:	descr = "H.264 Parsed Slice Data"; break;
>> +		case V4L2_PIX_FMT_H264_SLICE:	descr = "H.264 Parsed Slice Data"; break;
>>  		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
>>  		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
>>  		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> index bdad87eb9d79..56ca4c9ad01c 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> @@ -46,7 +46,7 @@ void cedrus_device_run(void *priv)
>>  			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
>>  		break;
>>  
>> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
>> +	case V4L2_PIX_FMT_H264_SLICE:
>>  		run.h264.decode_params = cedrus_find_control_data(ctx,
>>  			V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
>>  		run.h264.pps = cedrus_find_control_data(ctx,
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> index 681dfe3367a6..eeee3efd247b 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> @@ -38,7 +38,7 @@ static struct cedrus_format cedrus_formats[] = {
>>  		.directions	= CEDRUS_DECODE_SRC,
>>  	},
>>  	{
>> -		.pixelformat	= V4L2_PIX_FMT_H264_SLICE_RAW,
>> +		.pixelformat	= V4L2_PIX_FMT_H264_SLICE,
>>  		.directions	= CEDRUS_DECODE_SRC,
>>  	},
>>  	{
>> @@ -104,7 +104,7 @@ static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>>  
>>  	switch (pix_fmt->pixelformat) {
>>  	case V4L2_PIX_FMT_MPEG2_SLICE:
>> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
>> +	case V4L2_PIX_FMT_H264_SLICE:
>>  		/* Zero bytes per line for encoded source. */
>>  		bytesperline = 0;
>>  
>> @@ -449,7 +449,7 @@ static int cedrus_start_streaming(struct vb2_queue *vq, unsigned int count)
>>  		ctx->current_codec = CEDRUS_CODEC_MPEG2;
>>  		break;
>>  
>> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
>> +	case V4L2_PIX_FMT_H264_SLICE:
>>  		ctx->current_codec = CEDRUS_CODEC_H264;
>>  		break;
>>  
>> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
>> index e1404d78d6ff..6160a69c0143 100644
>> --- a/include/media/h264-ctrls.h
>> +++ b/include/media/h264-ctrls.h
>> @@ -14,7 +14,7 @@
>>  #include <linux/videodev2.h>
>>  
>>  /* Our pixel format isn't stable at the moment */
>> -#define V4L2_PIX_FMT_H264_SLICE_RAW v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>> +#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>>  
>>  /*
>>   * This is put insanely high to avoid conflicting with controls that
>> -- 
>> 2.22.0
>>
> 

