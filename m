Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D681F1557
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 11:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgFHJ04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 05:26:56 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56413 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728022AbgFHJ0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 05:26:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iE3FjPmHFCKzeiE3IjlJjA; Mon, 08 Jun 2020 11:26:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591608412; bh=PpFwGAPmdlyGPTX8U2mQmWfV0t76Txr3GSa+LJ+jIkE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a59jseDgaUfyCmcsSfq4iTWn/fJcaw9nD2dZjbYJH8TAsJirLI680PmdOCKcN+duc
         Bttek/fu5PBb7PfGen5CZCTwbvt9UgBGBPkFuAePtsBQPiMvNk/DJNLOR4fXIuxueq
         xEqDz8ZFF6dg2l0o5PmGk8UUlXqZcFrth+fG/E+Ywd2idXMeYOlUvQg9ORyLQJd76f
         2WDj4XsdPn+4dk6poFyD23Thu0x3o/A8srQ5veu1x1SJY82uAhVsvCiXLB19IenMmj
         mJKECkO0jihmcRRzy+Y08pJ2ams+E6CmQAq7IEdeAlpTMQlunJ4Dmw78WdMQMjUqJv
         LAt4ceM+DodcA==
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel
 formats
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
 <20200604135317.9235-2-narmstrong@baylibre.com>
 <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
 <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a15dea55-3ca4-2a65-5c56-6c1edd2de405@xs4all.nl>
Date:   Mon, 8 Jun 2020 11:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFMAIH4XTFcp0UvS6gvlUy/sf5utcQPAAQUM/NAmiyjoXxTvfnDlfZIUdwVqZXw/D/j+u/9aoK1Z7eEC50nnKBp7rTuIHlgYYZCfi9PMTWORWXOTkmtd
 i+LFYZW9e2esVQOfZ5baeC1oFfajYLO6DY5KfkyC3Fn1kT4ab8pfzw4nH2RU91RBeR+NhRLe2XTaVeeXb5o9Z6d9cE3VByKmZ/sfplGmxSQl/OgWGtsyxcYg
 +tAHynkwfNZ+VtXe2PILMT2oqIIozEI5LBBCfZ+77pNEvAMl8Pfzg2QnpedAjEt+4vARkxL9BoNxMLsCvleMcT0FUyraFCaT5InqbBnisJ4R4zSD1f/tC94i
 Wbmlm+v7FfCmMt2+6U/trpBgPvcnCl2Zg/kq8OjS0L0Pifyw5Dg1EoVxCNrf2F0g7RvQDczCLPQRwi1S9cYcQ0f94IRkab8GiSuA39OZ1AMQxPMtcMg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2020 10:16, Neil Armstrong wrote:
> Hi Nicolas,
> 
> On 05/06/2020 17:35, Nicolas Dufresne wrote:
>> Le jeudi 04 juin 2020 à 15:53 +0200, Neil Armstrong a écrit :
>>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>>
>>> Add two generic Compressed Framebuffer pixel formats to be used
>>> with a modifier when imported back in another subsystem like DRM/KMS.
>>>
>>> These pixel formats represents generic 8bits and 10bits compressed buffers
>>> with a vendor specific layout.
>>>
>>> These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
>>> used to describe the underlying compressed buffers used for ARM Framebuffer
>>> Compression. In the Amlogic case, the compression is different but the
>>> underlying buffer components is the same.
>>>
>>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>>>  include/uapi/linux/videodev2.h       | 9 +++++++++
>>>  2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index 2322f08a98be..8f14adfd5bc5 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>>>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>>> +		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
>>> +		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;
> 
> Seems we are totally on-par with the following :-)
> 
>>
>> When I read the DRM documentation [0], I'm reading that YUV420_8BIT
>> definition matches V4L2_PIX_FMT_YVU420 and V4L2_PIX_FMT_YVU420M fully.
>> In fact, on DRM side, to represent that format you want to expose here,
>> they will strictly combine this generic format (documented un-
>> compressed) with a modifier generated with the macro
>> DRM_FORMAT_MOD_ARM_AFBC(*). And only the combination represent a unique
>> and share-able format.
> 
> Yes, and this is exactly my goal here, and matches the Amlogic Framebuffer as
> described in patch 4. The modifier patchset is at [1].
> 
>>
>> In absence of modifier in V4L2 API, this compressed format should be
>> named accordingly to the compressed algorithm used (something like
>> FMT_YUV420_8BIT_AML_FBC). 
> 
> It's even more complex, the modifier depends on the SoC revision, so we can
> have up to6 different unique pixel format instead of 2 with a variable
> modifier.
> 
>> So I believe these format name cannot be
>> copied as-is like this, as they can only introduce more ambiguity in
>> the already quite hard to follow naming of pixel formats. In fact, it
>> is very common to see multiple different vendor compressions on the
>> same SoC, so I don't really believe a "generic" compressed format make
>> sense. To site one, the IMX8M, which got Verrisillicon/Vivante DEC400
>> on the GPU, and the Hantro G2 compression format. Both will apply to
>> NV12 class of format so in DRM they would be NV12 + modifier, and the
>> combination forms the unique format. Now, in term of sharing, they must
>> be differiented by userspace, as support for compression/decompression
>> is heterogeneous (in that case the GPU does not support Hantro G2
>> decompression or compression, and the VPU does not support DEC400).
>>
>> I'll remind that the modifier implementation has great value and is
>> much more scalable then the current V4L2 approach. There has been some
>> early proposal for this, maybe it's time to prioritize because this
>> list will starts growing with hundred or even thousands or format,
>> which is clearly indicated by the increase of modifier generator macro
>> on the DRM side.
> 
> Yes, but until the migration of drm_fourcc and v4l2 fourcc into a common one
> is decided, I'm stuck and this is the only intermediate solution I found.

We can safely assume that drm fourcc and v4l2 fourcc won't be merged.

There is too much divergence and not enough interest in creating common
fourccs.

But we *do* want to share the modifiers.

> 
> We have a working solution with Boris's patchset with ext_fmt passing the
> modifier to user-space.
> 
> but anyway, since the goal is to merge the fourcc between DRM & V4L2, these YUV420_*BIT
> will still be needed if we pass the modifier with an extended format struct.

We tried merging fourccs but that ran into resistance. Frankly, I wouldn't
bother with this, it is much easier to just create a conversion table in the
kernel docs.

So don't block on this, I would really prefer if the ext_fmt series is picked
up again and rebased and reposted and then worked on. The stateless codec support
is taking less time (it's shaping up well) so there is more time to work on this.

I believe we really need this since v4l2_buffer and v4l2_format are a real mess.

Regards,

	Hans

> 
>>
>>>  		default:
>>>  			if (fmt->description[0])
>>>  				return;
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index c3a1cf1c507f..90b9949acb8a 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -705,6 +705,15 @@ struct v4l2_pix_format {
>>>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>>>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>>>  
>>> +/*
>>> + * Compressed Luminance+Chrominance meta-formats
>>> + * In these formats, the component ordering is specified (Y, followed by U
>>> + * then V), but the exact Linear layout is undefined.
>>> + * These formats can only be used with a non-Linear modifier.
>>> + */
>>> +#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
>>> +#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
>>> +
>>>  /*  Vendor-specific formats   */
>>>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
>>>  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
>>
> 
> [1] https://patchwork.freedesktop.org/series/73722/#rev7
> 

