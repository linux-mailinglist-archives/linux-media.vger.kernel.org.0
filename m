Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FC41F1B2E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 16:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgFHOnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 10:43:19 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34969 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729948AbgFHOnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 10:43:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iIzYjRwAsCKzeiIzbjmpDv; Mon, 08 Jun 2020 16:43:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591627395; bh=pNmlUcaLydVQs8c0KPtxW18ChQ+9wIDu23I5D8PG9ns=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lXCo703uwISHHqPVb6LTcqFk1zNpzIkdhr02b5dliC8MlC2/rjrPwyE2XU608Nt09
         xZ9RfHLMOUST+ISspnRMwOMIvx+pg+q+zx8hWQ4pghyAFQkpQ3I+IYdWx/xwRUtmg8
         49UW5n/YV9yqxbKA+r/688nnMTIp4XIUmbCfPT94ixhwsPr1uKVYdqMaweA2Evx0bU
         xjpsPkQ3qcSuJh9PhpOjXemxrCAHPwjKS7k8JOi+3q27ZsKc0Bssx41HDEZAXS5awd
         QUc1lJsv6deDzJ1Z2dZwe6ovg+I7Kk795sKZHv9gMUmZc03XJctF4lmWq1WLk61tZb
         8XCblszNv+ZWA==
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
 <a15dea55-3ca4-2a65-5c56-6c1edd2de405@xs4all.nl>
 <a4c5ae79-1d4d-4c1e-1535-c6c8b02d4b6f@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2a0db0a4-9d04-f20c-39d8-ff25e07e64b7@xs4all.nl>
Date:   Mon, 8 Jun 2020 16:43:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a4c5ae79-1d4d-4c1e-1535-c6c8b02d4b6f@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLyiiimZ6YdsUbH2tz9gxpGCvK/fKk/xvLXfYWzoiateyJhQ0WV54t8begnlvmJru1Ht1bY5+UvW1rQaAFymDZhRDME3mQSFAKi18y7URqpcxn9hWHrG
 P9tgUzo/h6059EbdQo08Kgs/7fr/iP57hoJxgK3gP4AlNaIbXwX4mAT1H2vFaDcLEh69CeeBgg5q9Hc3GBwD9my05rakpAaB54pCYOSGYbYxZuaqjiXqBqcZ
 Wv4IB38oR84t4kT17uZEFyXPkJUP4omGWaZaFB+bK10JKirQzctsRn6H4l+PZdr2eiqDM2AbSlK5SxKdCx2PDlbrWdGe8dSuZZPfx86evzb8UWkQddtQhFOp
 MOQO/ayVZSY2I+/gJX308rbxogdZkMyjLJJDR9qwHrUTrVRmruRCyjxpQVapx8hwGCi6Vzls/pbZmgoUC0TU9vK8xu81Icgni5oQpm9tuZC1XszVBXw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2020 16:14, Neil Armstrong wrote:
> On 08/06/2020 11:26, Hans Verkuil wrote:
>> On 08/06/2020 10:16, Neil Armstrong wrote:
>>> Hi Nicolas,
>>>
>>> On 05/06/2020 17:35, Nicolas Dufresne wrote:
>>>> Le jeudi 04 juin 2020 à 15:53 +0200, Neil Armstrong a écrit :
>>>>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>>>>
>>>>> Add two generic Compressed Framebuffer pixel formats to be used
>>>>> with a modifier when imported back in another subsystem like DRM/KMS.
>>>>>
>>>>> These pixel formats represents generic 8bits and 10bits compressed buffers
>>>>> with a vendor specific layout.
>>>>>
>>>>> These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
>>>>> used to describe the underlying compressed buffers used for ARM Framebuffer
>>>>> Compression. In the Amlogic case, the compression is different but the
>>>>> underlying buffer components is the same.
>>>>>
>>>>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>> ---
>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>>>>>  include/uapi/linux/videodev2.h       | 9 +++++++++
>>>>>  2 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index 2322f08a98be..8f14adfd5bc5 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>>>>>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>>>>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>>>>> +		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
>>>>> +		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;
> 
> [..]
> 
>>>>
>>>> I'll remind that the modifier implementation has great value and is
>>>> much more scalable then the current V4L2 approach. There has been some
>>>> early proposal for this, maybe it's time to prioritize because this
>>>> list will starts growing with hundred or even thousands or format,
>>>> which is clearly indicated by the increase of modifier generator macro
>>>> on the DRM side.
>>>
>>> Yes, but until the migration of drm_fourcc and v4l2 fourcc into a common one
>>> is decided, I'm stuck and this is the only intermediate solution I found.
>>
>> We can safely assume that drm fourcc and v4l2 fourcc won't be merged.
>>
>> There is too much divergence and not enough interest in creating common
>> fourccs.
>>
>> But we *do* want to share the modifiers.
>>
>>>
>>> We have a working solution with Boris's patchset with ext_fmt passing the
>>> modifier to user-space.
>>>
>>> but anyway, since the goal is to merge the fourcc between DRM & V4L2, these YUV420_*BIT
>>> will still be needed if we pass the modifier with an extended format struct.
>>
>> We tried merging fourccs but that ran into resistance. Frankly, I wouldn't
>> bother with this, it is much easier to just create a conversion table in the
>> kernel docs.
>>
>> So don't block on this, I would really prefer if the ext_fmt series is picked
>> up again and rebased and reposted and then worked on. The stateless codec support
>> is taking less time (it's shaping up well) so there is more time to work on this.
> 
> Ok, I already starting discussing with Helen Koike about the ext_fnt re-spin.
> 
> Should I re-introduce different v4l2 pixfmt for these DRM YUV420_*BIT or I can keep this
> patch along the new ext_fmt and shared modifiers ?

So to be clear the DRM_FORMAT_YUV420_8BIT/10BIT fourccs define that this is a
buffer containing compressed YUV420 in 8 or 10 bit and the modifier tells userspace
which compression is used, right?

And we would add V4L2_PIX_FMT_YUV420_8BIT/_10BIT that, I assume, use the same
fourcc values as the DRM variants?

Since these fourccs are basically useless without V4L2 modifier support it would
only make sense in combination with the ext_fmt series.

Regards,

	Hans

> 
> Neil
> 
>>
>> I believe we really need this since v4l2_buffer and v4l2_format are a real mess.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>
>>>>>  		default:
>>>>>  			if (fmt->description[0])
>>>>>  				return;
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index c3a1cf1c507f..90b9949acb8a 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -705,6 +705,15 @@ struct v4l2_pix_format {
>>>>>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>>>>>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>>>>>  
>>>>> +/*
>>>>> + * Compressed Luminance+Chrominance meta-formats
>>>>> + * In these formats, the component ordering is specified (Y, followed by U
>>>>> + * then V), but the exact Linear layout is undefined.
>>>>> + * These formats can only be used with a non-Linear modifier.
>>>>> + */
>>>>> +#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
>>>>> +#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
>>>>> +
>>>>>  /*  Vendor-specific formats   */
>>>>>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
>>>>>  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
>>>>
>>>
>>> [1] https://patchwork.freedesktop.org/series/73722/#rev7
>>>
>>
> 

