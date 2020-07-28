Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6939230DD2
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 17:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbgG1Paa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 11:30:30 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54467 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730637AbgG1Paa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 11:30:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0RYektQJguuXO0RYgkIzhk; Tue, 28 Jul 2020 17:30:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595950227; bh=TynTaWgR2tMTn1GpUZCyjSes5QGI2eH81bm7hPcJT9M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vjuLjQnna34qo2WqwrfD0aMrgcIyIjIhOhoQZM6HcmVoKams82Sg/KhP2H8IIg3Ym
         ZSsMOQm5KTjpUau6AfRpJYIrlqkeSwFqaCBYjPxKKUh77LCx9iFOM6nwWHtB1zKEXQ
         nXqK3v7HYJGnkGJzyG/GNeU0+oN9gyAExBQJgui10gozGKJs5d3Q4eNNT42+e91oSS
         /I/VRSVEttrhQh5cVdx0xcfLm3dFyTWT/EtWanSbaxXoKp79ltIKddYSVcBltDBfql
         F+qp+LRfUPi7zD9YIoJzlHCLj3VgQIPuczIQqGTPoP9L8riqaL6m6aRLXMDgUFn1l1
         w3f3718L2LpGA==
Subject: Re: [PATCH v4 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-2-helen.koike@collabora.com>
 <c08eb020-d09c-8046-be73-4b146f9a0d5b@xs4all.nl>
 <a145652b-6ae7-1071-b598-e2cd905e5531@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eba48459-595d-57a4-dd0d-f2cb82fe62d3@xs4all.nl>
Date:   Tue, 28 Jul 2020 17:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a145652b-6ae7-1071-b598-e2cd905e5531@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFKMH3+6QEGU5Q9IdHjxENVpLIWNHy+kbrFro6KsiPPPaFclY5e1vms2Ft6I4ooIGdjYYsHDMEBQk+0zAwbehYWOIR7XS0DPIdQedWoNAIzVIGZnP/3d
 u+k+1D6iCKlmVfW/186FNyV2HY8kphyCx4MEvtjYJvAS1HWUeGsniLv60uhsDNvAMtn2sgtjoqKBEJJIjCR77zPPSXe4LTcAy2pFe+ZcwhX1cbo1i8RuD5Ef
 XuNgNHvJ43xvYqpmEchogMqLILiCkNosiC5I/o/Uc3aGmIfH8Zd1GvsZ56DloKZw70+8ffyeSwQ4IQG7i2kkVh5NeVwgzJb613lsvUvlepWP6SOUj1nyiLhU
 QF5bh3ZVF+JrMj/YoZOsXEJhdf2IQTgsqX7CkQTbr6IJLc6ck16HVitBKNg3HRbb2hRKfSIjgdERXmuUi9BKEUS9ATJVhW/uuvw6WrYKmdkPw0mDCkXFCa4v
 zWV61Tn05tuop1Hh/OArAxnL2Sivvl6QbAXIrMvSPTFYma7SgndRPPDiAOzdLZHWbTRDc3bB6A01Uj2R7YqWENk3IAabknri4bE0oqA7vGj8AgrhfIcTU5+v
 8MqFftAYiwGf+Lsnb+VEjJ/3b0hJUsPq7/3JGm/nndFA9rGh027wLgM3riCSsAOcpSFu0oPGNnanr3YSCTDNZeZjuuBqLFpi6MJpfBNlfUH/VqgODm61q2tZ
 61Qdylp2PJYgw9HswEk3itV6h+fLz8tRM24GwPtL3dlrsnQMX1xwnh/87ie29N7Pzt9qJyIzrSac6XejkwIcrLCrvXB9UA9xb8ZnTPsdfMzpCqAodLKISr1x
 tmaueYFiR4muxeqoiLg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2020 17:18, Helen Koike wrote:
> Hi Hans,
> 
> On 7/21/20 7:37 AM, Hans Verkuil wrote:
>> On 17/07/2020 13:54, Helen Koike wrote:
>>>  
>>> +/**
>>> + * struct v4l2_plane_ext_pix_format - additional, per-plane format definition
>>> + * @sizeimage:		maximum size in bytes required for data, for which
>>> + *			this plane will be used
>>> + * @bytesperline:	distance in bytes between the leftmost pixels in two
>>> + *			adjacent lines
>>> + * @reserved:		extra space reserved for future fields, must be set to 0
>>> + */
>>> +struct v4l2_plane_ext_pix_format {
>>> +	__u32 sizeimage;
>>> +	__u32 bytesperline;
>>> +	__u32 reserved;
>>> +} __attribute__ ((packed));
>>> +
>>> +/**
>>> + * struct v4l2_ext_pix_format - extended single/multiplanar format definition
>>> + * @type:		type of the data stream; V4L2_BUF_TYPE_VIDEO_CAPTURE or
>>> + *			V4L2_BUF_TYPE_VIDEO_OUTPUT
>>> + * @width:		image width in pixels
>>> + * @height:		image height in pixels
>>> + * @field:		enum v4l2_field; field order (for interlaced video)
>>> + * @pixelformat:	little endian four character code (fourcc)
>>> + * @modifier:		modifier applied to the format (used for tiled formats
>>> + *			and other kind of HW-specific formats, like compressed
>>> + *			formats)
>>> + * @colorspace:		enum v4l2_colorspace; supplemental to pixelformat
>>> + * @plane_fmt:		per-plane information
>>> + * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
>>> + * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
>>> + * @quantization:	enum v4l2_quantization, colorspace quantization
>>> + * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
>>> + * @reserved:		extra space reserved for future fields, must be set to 0
>>> + */
>>> +struct v4l2_ext_pix_format {
>>> +	__u32 type;
>>> +	__u32 width;
>>> +	__u32 height;
>>> +	__u32 field;
>>> +	__u32 pixelformat;
>>> +	__u64 modifier;
>>> +	__u32 colorspace;
>>
>> This struct has holes and is not the same for 32 and 64 bit architectures.
> 
> This would be true if this struct wasn't packed, but I believe we can remove the
> packed attribute, unless I'm missing something.
> What was the reason for other format structs to have __attribute__ ((packed)) ?

I've never really analyzed it. For new structs you want to avoid messing with that.

> 
>>
>> Moving modifier to before pixelformat will help a lot.
>>
>>> +	struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];
>>> +	union {
>>> +		__u8 ycbcr_enc;
>>> +		__u8 hsv_enc;
>>> +	};
>>> +	__u8 quantization;
>>> +	__u8 xfer_func;
>>
>> I'd change u8 to u32 for these fields for easier alignment.
> 
> Wouldn't it be better to add more reserved fields instead? So we can use this space
> latter in case we need them?
> 
> Without __attribute__ ((packed)), moving modifiers and changing reserved, I have
> from pahole in both 32 and 64 architectures:
> 
> struct v4l2_ext_pix_format {
> 	__u32                      type;                 /*     0     4 */
> 	__u32                      width;                /*     4     4 */
> 	__u32                      height;               /*     8     4 */
> 	__u32                      field;                /*    12     4 */
> 	__u64                      modifier;             /*    16     8 */
> 	__u32                      pixelformat;          /*    24     4 */
> 	__u32                      colorspace;           /*    28     4 */
> 	struct v4l2_plane_ext_pix_format plane_fmt[8];   /*    32    96 */
> 	/* --- cacheline 2 boundary (128 bytes) --- */
> 	union {
> 		__u8               ycbcr_enc;            /*   128     1 */
> 		__u8               hsv_enc;              /*   128     1 */
> 	};                                               /*   128     1 */
> 	__u8                       quantization;         /*   129     1 */
> 	__u8                       xfer_func;            /*   130     1 */
> 	__u8                       _reserved;            /*   131     1 */

This additional _reserved field is just what you want to avoid.

Just stick to u32 as much as possible with a u32 reserved array at the end.

> 	__u32                      reserved[5];          /*   132    20 */

[5] is definitely not enough. But that's something we can ignore until this
struct is finalized.

Regards,

	Hans

> 
> 	/* size: 152, cachelines: 3, members: 13 */
> 	/* last cacheline: 24 bytes */
> };
> 
> 
> What do you think?
> 
> Regards,
> Helen
> 
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	__u32 reserved[4];
>>> +} __attribute__ ((packed));
>>> +
>>>  /**
>>>   * struct v4l2_sdr_format - SDR format definition
>>>   * @pixelformat:	little endian four character code (fourcc)
>>> @@ -2569,6 +2620,10 @@ struct v4l2_create_buffers {
>>>  
>>>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>>>  
>>> +#define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
>>> +#define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
>>> +#define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
>>> +
>>>  /* Reminder: when adding new ioctls please add support for them to
>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>>  
>>>
>>
>>

