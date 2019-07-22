Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DFC70927
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 21:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbfGVTAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 15:00:23 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51619 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728089AbfGVTAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 15:00:23 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pdXkhdhUM0SBqpdXohsQtE; Mon, 22 Jul 2019 21:00:20 +0200
Subject: Re: [PATCH v3 2/3] media: uapi: h264: Add the concept of decoding
 mode
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
 <20190703122849.6316-3-boris.brezillon@collabora.com>
 <41031ffb-3c40-9492-5aa2-8c7b738fbc65@xs4all.nl>
 <20190722195432.09667355@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d84dcc42-f0b6-9e6d-e1a9-0cdebdc12597@xs4all.nl>
Date:   Mon, 22 Jul 2019 21:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190722195432.09667355@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPr+b37i7bi4EP1y+wZqS2hyvpTVpFgjNZeXI8d4sLjIqxxb97FATh5lypG84JWwmfM4E0km65vC8LTCSRGDJdbYhbg6Io/4syiL8AlCWm4YwkydcuNm
 7s3gh/lHj1ywvaJPLqlylMavAAr6wfyJ2IH0jh0bHeFjxQSQ1ME3dcIyY61XSEtzfD/XYMkMQWsGtAGa3nmwpGTA5HpHWXGOKXZHzxJ+x3PSo7qCvHIPdy5N
 DnhcKfdsABUzGvZBZjYgJ6f73w5+czS3DY4Mwk8hQG2izHL9JVna+g6cZDF1CzDwpOI112BHdsAh5dNursKsGZrDHWhV9oqNd8+rsQ2O3u57pLh2A80rc4K0
 7H8L3d9oEsAc6Dy8iDU0DbgPdEjaUH3BlGvycvGsnKHNs/pRUXagyfhgExyVX1pgt1FBsFQfPli6/pRtrdPAGar0xgojTJTuQ//tw3UQFakYWz7w5stwAOtt
 0AJw0NYzMUiu1/tdrDY+TeKxhhqSsGhMkllCHa6JHkfilVckIIi9YUZGDHS57XsU0vwyezYY14BJrIZDCiYtqzoJyoklkgQARBDaDYwC1OQiXoLlva8XY2iI
 B+mvRjcqUUs10gkQ0J2OrHOwPd5xTLKAu1ppuuI4XuNAuW1uEgeu8YG57WkEpvyow7GilRNRa4GtkNkcOvcJiEhMPJ1SRA6fq32+YCfLdN+Y+A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/22/19 7:54 PM, Boris Brezillon wrote:
> Hi Hans,
> 
> On Mon, 22 Jul 2019 17:29:21 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> On 7/3/19 2:28 PM, Boris Brezillon wrote:
>>> Some stateless decoders don't support per-slice decoding (or at least
>>> not in a way that would make them efficient or easy to use).
>>> Let's expose a menu to control and expose the supported decoding modes.
>>> Drivers are allowed to support only one decoding but they can support
>>> both too.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>> ---
>>> Changes in v3:
>>> * s/per-{slice,frame} decoding/{slice,frame}-based decoding/
>>> * Add Paul's R-b
>>>
>>> Changes in v2:
>>> * Allow decoding multiple slices in per-slice decoding mode
>>> * Minor doc improvement/fixes
>>> ---
>>>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 47 ++++++++++++++++++-
>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
>>>  include/media/h264-ctrls.h                    | 13 +++++
>>>  3 files changed, 68 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> index 3ae1367806cf..47ba2d057a92 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>      * - __u32
>>>        - ``size``
>>>        -
>>> +    * - __u32
>>> +      - ``start_byte_offset``
>>> +      - Where the slice payload starts in the output buffer. Useful when
>>> +        operating in frame-based decoding mode and decoding multi-slice
>>> +        content. In this case, the output buffer will contain more than one
>>> +        slice and some codecs need to know where each slice starts. Note that
>>> +        this offsets points to the beginning of the slice which is supposed to  
>>
>> offsets -> offset
>>
>>> +        contain an ANNEX B start code  
>>
>> Add . at the end of the sentence.
>>
>> I think this is a bit awkward. How about:
>>
>> "Note that the slice at this offset shall start with an ANNEX B start code."
> 
> Definitely better.
> 
>>
>> I'm assuming it has to actually start with an ANNEX B code? Or should it
>> just 'contain' an ANNEX B code?
> 
> It has to start with an ANNEX B code.
> 
>>
>> When in sliced-based decoding mode, what should be used here? I assume that in
>> that case start_byte_offset would be 0, and that the slice shall still begin
>> with an ANNEX B start code?
> 
> The first slice should have start_byte_offset set to 0 and should start
> with an ANNEX B start code, but even in slice-based decoding mode, the
> driver can be passed several slices in the same buffer, in which case,
> the second slice will have start_byte_offset > 0.
> 
> 
>>
>>>      * - __u32
>>>        - ``header_bit_size``
>>>        -
>>> @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>        -
>>>      * - __u16
>>>        - ``num_slices``
>>> -      - Number of slices needed to decode the current frame
>>> +      - Number of slices needed to decode the current frame/field. When
>>> +        operating in slice-based decoding mode (see
>>> +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
>>> +        should always be set to one  
>>
>> Add . at the end of the sentence.
>>
>>>      * - __u16
>>>        - ``nal_ref_idc``
>>>        - NAL reference ID value coming from the NAL Unit header
>>> @@ -2022,6 +2033,40 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>        - 0x00000004
>>>        - The DPB entry is a long term reference frame
>>>  
>>> +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
>>> +    Specifies the decoding mode to use. Currently exposes slice-based and
>>> +    frame-based decoding but new modes might be added later on.
>>> +
>>> +    .. note::
>>> +
>>> +       This menu control is not yet part of the public kernel API and
>>> +       it is expected to change.
>>> +
>>> +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
>>> +
>>> +.. cssclass:: longtable
>>> +
>>> +.. flat-table::
>>> +    :header-rows:  0
>>> +    :stub-columns: 0
>>> +    :widths:       1 1 2
>>> +
>>> +    * - ``V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING``
>>> +      - 0
>>> +      - The decoding is done at the slice granularity.
>>> +        v4l2_ctrl_h264_decode_params->num_slices can be set to anything between
>>> +        1 and then number of slices that remain to fully decode the  
>>
>> then -> the
>>
>>> +        frame/field.
>>> +        The output buffer should contain
>>> +        v4l2_ctrl_h264_decode_params->num_slices slices.
>>> +    * - ``V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING``
>>> +      - 1
>>> +      - The decoding is done at the frame granularity.
>>> +        v4l2_ctrl_h264_decode_params->num_slices should be set to the number of
>>> +        slices forming a frame.
>>> +        The output buffer should contain all slices needed to decode the
>>> +        frame/field.
>>> +
>>>  .. _v4l2-mpeg-mpeg2:
>>>  
>>>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index 471ff5c91f43..70d994be27e1 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -394,6 +394,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>>  		"Explicit",
>>>  		NULL,
>>>  	};
>>> +	static const char * const h264_decoding_mode[] = {
>>> +		"Slice-based",
>>> +		"Frame-based",  
>>
>> based -> Based
>>
>>> +		NULL,
>>> +	};
>>>  	static const char * const mpeg_mpeg2_level[] = {
>>>  		"Low",
>>>  		"Main",
>>> @@ -625,6 +630,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>>  		return h264_fp_arrangement_type;
>>>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>>>  		return h264_fmo_map_type;
>>> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>>> +		return h264_decoding_mode;
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>>>  		return mpeg_mpeg2_level;
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>>> @@ -844,6 +851,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
>>>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>>>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>>> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mode";
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
>>> @@ -1212,6 +1220,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>>>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>>>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>>> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
>>> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
>>> index e1404d78d6ff..206fd5ada620 100644
>>> --- a/include/media/h264-ctrls.h
>>> +++ b/include/media/h264-ctrls.h
>>> @@ -26,6 +26,7 @@
>>>  #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
>>>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>>>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
>>> +#define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
>>>  
>>>  /* enum v4l2_ctrl_type type values */
>>>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
>>> @@ -33,6 +34,12 @@
>>>  #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
>>>  #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
>>>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
>>> +#define V4L2_CTRL_TYPE_H264_DECODING_MODE	0x0115
>>> +
>>> +enum v4l2_mpeg_video_h264_decoding_mode {
>>> +	V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
>>> +	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
>>> +};
>>>  
>>>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>>>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
>>> @@ -111,6 +118,8 @@ struct v4l2_h264_pred_weight_table {
>>>  	struct v4l2_h264_weight_factors weight_factors[2];
>>>  };
>>>  
>>> +#define V4L2_H264_MAX_SLICES_PER_FRAME			16  
>>
>> Are there arrays in these compound control structs where this define can be used?
> 
> No, slices_params is a separate control, but I initialize
> slices_params_ctrl_cfg.dims[0] to this value.
> 
>> Is this define standards-based or a restriction of V4L2?
> 
> It's defined by the standard.

OK, can you add a comment before the V4L2_H264_MAX_SLICES_PER_FRAME define
mentioning this? Perhaps with a reference to the standard as well.

> 
> Will fix the other typos you reported.
> 
> Thanks for the review.

My pleasure,

	Hans
