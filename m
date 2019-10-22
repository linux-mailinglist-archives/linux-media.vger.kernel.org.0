Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F37E05C7
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388877AbfJVODD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:03:03 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54489 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387965AbfJVODD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:03:03 -0400
Received: from [IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72]
 ([IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MukTi3IXtPduvMukWiMkLM; Tue, 22 Oct 2019 16:03:01 +0200
Subject: Re: [PATCH v8 3/3] media: cedrus: Add HEVC/H.265 decoding support
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
 <20190927143411.141526-4-paul.kocialkowski@bootlin.com>
 <20191017095751.5a229051@coco.lan> <20191022124012.GD2651@aptenodytes>
 <20191022131751.GE2651@aptenodytes>
 <62ddccd3-38c0-89c5-7f0c-35f24494c3f9@xs4all.nl>
 <20191022140129.GA1926725@aptenodytes>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <345a6781-a5b3-1408-40ec-580873720c4a@xs4all.nl>
Date:   Tue, 22 Oct 2019 16:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191022140129.GA1926725@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLyToBbJkvoNRLhYqBvZHVXfIm7iukgHkajVmC/txXYqaReY4el4wR3BxG5BTgxtiScGgBnV0kxhH6kDr/OEW3KJ+v+YsODAMwe5yEeEtS+FgbsHq7dV
 fdMG0VGNqYIhwjH7J7Sb+mXFSLzj4uPkGVG4X/JcZOw+OeFPvLRkzs5wJxPWAuzxPlOqry9K8/FLndsCmhzA0hYSRp/x7bP7eGayeRjAN7wu9urRBuySNMAT
 rpTuaQggdjanULe0u/fQM+fW9lb7FPpkjNuLW20PZ3ZCjRDSOdPEvMnmFWbsH3oGnI/KfL45Gi99Jdvvsn5LhBuiCxtz2/uiLE8ZTTuEPMdOPI8NWS14W+Sd
 OfoivH1DiUS0VaLSAsSbfZ0iM/q/LUE9JuCwlCWLZcVmEXv0hZ+IJzmMUiTIP0GPdwEYU3JXPstdFkz1oXZmizJhk7BzABSrYr3PM8q2I08RmiB6zgRdovHk
 lS27pzKhvOA4nbPJQDskKROYHec/bUkcDAs4xo0spMXqB70ExtmEnQpUq7oCQXCbsmvvv5SaYgnnOePA0YI3ngH2mlRuJrebfwZrJ8vPF4UHPtQT+dEGSpWw
 HpuMzANUMUE0Puthk1YVByV9ER72/ENKKACHrdmCiU89opg6jSk+365tsEvgse/moOebrKO/EyhqyTOUn5T3cTSXo6dTLb8ZCko9xT4WTOhx5obzgZcMpUzy
 SOq+0knuWhd4idM5xZhC/M2gEmyV+tPY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/22/19 4:01 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Tue 22 Oct 19, 15:37, Hans Verkuil wrote:
>> On 10/22/19 3:17 PM, Paul Kocialkowski wrote:
>>> Hi again,
>>>
>>> On Tue 22 Oct 19, 14:40, Paul Kocialkowski wrote:
>>>> Hi Mauro and thanks for the review,
>>>>
>>>> On Thu 17 Oct 19, 09:57, Mauro Carvalho Chehab wrote:
>>>>> Em Fri, 27 Sep 2019 16:34:11 +0200
>>>>> Paul Kocialkowski <paul.kocialkowski@bootlin.com> escreveu:
>>>>>
>>>>>> This introduces support for HEVC/H.265 to the Cedrus VPU driver, with
>>>>>> both uni-directional and bi-directional prediction modes supported.
>>>>>>
>>>>>> Field-coded (interlaced) pictures, custom quantization matrices and
>>>>>> 10-bit output are not supported at this point.
>>>>>>
>>>>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>>>>> ---
>>>>>
>>>>> ...
>>>>>
>>>>>> +		unsigned int ctb_size_luma =
>>>>>> +			1 << log2_max_luma_coding_block_size;
>>>>>
>>>>> Shifts like this is a little scary. "1" constant is signed. So, if
>>>>> log2_max_luma_coding_block_size is 31, the above logic has undefined
>>>>> behavior. Different archs and C compilers may handle it on different
>>>>> ways.
>>>>
>>>> I wasn't aware that it was the case, thanks for bringing this to light!
>>>> I'll make it 1UL then.
>>>>
>>>>>> +#define VE_DEC_H265_LOW_ADDR_PRIMARY_CHROMA(a) \
>>>>>> +	(((a) << 24) & GENMASK(31, 24))
>>>>>
>>>>> Same applies here and on other similar macros. You need to enforce
>>>>> (a) to be unsigned, as otherwise the behavior is undefined.
>>>>>
>>>>> Btw, this is a recurrent pattern on this file. I would define a
>>>>> macro, e. g. something like:
>>>>>
>>>>> 	#define MASK_BITS_AND_SHIFT(v, high, low) \
>>>>> 		((UL(v) << low) & GENMASK(high, low))
>>>>>
>>>>> And use it for all similar patterns here.
>>>>
>>>> Sounds good! I find that the reverse wording (SHIFT_AND_MASK_BITS) would be
>>>> a bit more explicit since the shift happens prior to the mask.
>>>
>>> Apparently the UL(v) macro just appends UL to v in preprocessor, so it won't
>>> work with anything else than direct integers.
>>>
>>> I'll replace it with a (unsigned long) cast, that seems to do the job.
>>
>> Shouldn't that be a (u32) cast? Since this is used with 32 bit registers?
> 
> This would work for cedrus, but I think that what Mauro had in mind was to
> migrate this macro to linux/bits.h, where everthing else (including GENMASK)
> is apparently defined in terms of unsigned long and not types with explicit
> numbers of bits. So I find it more consistent to go with unsigned long.
> 
> In our case, 64-bit platforms that use cedrus would calculate the macro on
> 64 bits and use it in 32-bit variables. Since we're never masking beyond the
> lower 32 bits, I don't see how things could go wrong and the situation looks
> fairly similar to the use of GENMASK in similar conditions.
> 
> Does that sound right to you or am I missing something here?

Ah, OK. Fair enough.

Regards,

	Hans

> 
> Cheers,
> 
> Paul
> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Cheers,
>>>
>>> Paul
>>>
>>>> Also we probably need to have parenthesis around "low", right?
>>>>
>>>>> The best would be to include such macro at linux/bits.h, although some
>>>>> upstream discussion is required.
>>>>>
>>>>> So, for now, let's add it at this header file, but work upstream
>>>>> to have it merged there.
>>>>
>>>> Understood, I'll include it in that header for now and send a separate patch
>>>> for inclusion in linux/bits.h (apparently the preprocessor doesn't care about
>>>> redefinitions so we can just remove the cedrus fashion once the common one is
>>>> in).
>>>>
>>>> What do you think?
>>>>
>>>> Cheers,
>>>>
>>>> Paul
>>>
>>>
>>>
>>
> 

