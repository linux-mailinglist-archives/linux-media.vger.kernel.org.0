Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260547A21B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 09:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbfG3HWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 03:22:20 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36089 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727527AbfG3HWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 03:22:19 -0400
Received: from [IPv6:2001:983:e9a7:1:3159:f139:4aff:7185] ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sMSMhAcbWqTdhsMSNhks1p; Tue, 30 Jul 2019 09:22:17 +0200
Subject: Re: [PATCH 02/14] videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
To:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-3-hverkuil-cisco@xs4all.nl>
 <20190727093745.GB16618@aptenodytes>
 <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
 <20190729131229.GB24269@aptenodytes>
 <CAAFQd5Au5+AZvSG-5p9Zp32aUUANyEi-b68wHf=g_diBw-+2BQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2d8e8a7f-144c-5ce2-8dd0-3c82248a3a83@xs4all.nl>
Date:   Tue, 30 Jul 2019 09:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Au5+AZvSG-5p9Zp32aUUANyEi-b68wHf=g_diBw-+2BQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMkHegeF1K43t4NqMYdEL+GddwiojQH3+pNgOeLeppAoHQVe7FnD5olIzr0Pldx1LlxeEr6mjhhykynTCsa5QgKvM400t5ymV0I8OiJDud/la+QMVuUh
 2R/7aSioOHXTXLM5pFrq7f8sraIH1IfuI0cyxBaygvZxfih80bw3Cea3YusoYgxXc/kQSLrO7qRl+LuRftcAGM0tSj8J8aDeuLnS05vkWfngw3v7eYhQSidX
 DYd5NcC4lEIxcjc8VWW62i98spU49d3z6Nb5FbHElSTRAPJJmmmxPopEdjN+f+lu8oINCtlMJUpADIhkyIjJSj5lkmEjrKl0wPvxGBnX+BERnovJcoqBu2O8
 8ETu7kysaVa7IrVYwymyx5i7ScXe5HZevXoco12P7Cv9lQPOiiWpRvXAfAeaiapGL+VoA6pRgwVbt+4XDWX+IND/XJmwRtbXtSRL/IEHVM+2dKaHZFwmv7Bn
 h+uvCL9N87//Sf0PlmZKtByZGIFuaXmNt4C4s4eLUQ6MYXE3Icn1X2hSSX+ZTsNOSnZvzh+N8oyILF8D0r39QorJidzMiK7SGoq3z7xFHG3lrcEfaJJilSeZ
 k7pQa4i9Bo3PWj3/4IZdZCyCzS0QqEHGrIlrMis41ELqFZo/xO01qPQF2d4sQKTJNbJDLHipVFNo3MTV6whGofX0np1l6gV3Cca7K6v+Zyaovg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/29/19 3:18 PM, Tomasz Figa wrote:
> On Mon, Jul 29, 2019 at 10:12 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>>
>> Hi,
>>
>> On Sun 28 Jul 19, 23:05, Tomasz Figa wrote:
>>> On Sat, Jul 27, 2019 at 6:37 PM Paul Kocialkowski
>>> <paul.kocialkowski@bootlin.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
>>>>> Add an enum_fmt format flag to specifically tag coded formats where
>>>>> full bitstream parsing is supported by the device.
>>>>>
>>>>> Some stateful decoders are capable of fully parsing a bitstream,
>>>>> but others require that userspace pre-parses the bitstream into
>>>>> frames or fields (see the corresponding pixelformat descriptions
>>>>> for details).
>>>>>
>>>>> If this flag is set, then this pre-parsing step is not required
>>>>> (but still possible, of course).
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> ---
>>>>>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>>>>>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>>>>>  include/uapi/linux/videodev2.h                   | 5 +++--
>>>>>  3 files changed, 12 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>> index 822d6730e7d2..4e24e671f32e 100644
>>>>> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>> @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
>>>>>        - This format is not native to the device but emulated through
>>>>>       software (usually libv4l2), where possible try to use a native
>>>>>       format instead for better performance.
>>>>> +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
>>>>> +      - 0x0004
>>>>> +      - The hardware decoder for this compressed bitstream format (aka coded
>>>>> +     format) is capable of parsing the bitstream. Applications do not
>>>>> +     need to parse the bitstream themselves to find the boundaries between
>>>>> +     frames/fields. This flag can only be used in combination with the
>>>>> +     ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
>>>>> +     formats only.
>>>>
>>>> Should this flag be set for stateless codecs as well? It seems a bit over-kill
>>>> for this case. I am not sure whether "compressed bitstream format" clearly only
>>>> covers the formats used by stateful decoders and not the ones for stateless
>>>> decoders.
>>>
>>> I'd suggest using a different name for the flag, because "bitstream
>>> parser" is actually one of the core differences between stateful and
>>> stateless. All stateful decoders have bitstream parsers, the only
>>> difference between the implementations is the unit on which the parser
>>> operates, i.e. full stream, frame, NALU.
>>>
>>> Perhaps V4L2_FMT_FLAG_CONTINUOUS_BITSTREAM (as opposed to discrete,
>>> framed/sliced chunks)?
>>
>> Sure, that seems like a more explicit name regarding what it's supposed to
>> describe in my opinion.

I like that name. And this flag is valid for stateful decoders only.

>>
>>> Regardless of that, it doesn't make sense for a stateless decoder to
>>> set this flag anyway, because the userspace needs to parse the whole
>>> stream anyway and the whole stateless API is based on the assumption
>>> that the userspace splits the bitstream into frames (or slices).
>>
>> Indeed, I agree that it doesn't make sense, but I thought that the name of the
>> flag could be confusing. Since there is no direct equivalency between
>> "stateless" and "doesn't parse the bitstream" (as we've seen with the rockchip
>> decoder needing to parse the slice header on its own), that could have been
>> ambiguous. I think the name you're suggesting mostly solves this concern.
>>
>> I'm still a bit unsure about what "compressed formats" entails or not, so it
>> could be good to explicitly mention that this applies to stateful decoders only
>> (but it's just a suggestion, advanced users of the API will probably find it
>> straightforward).
> 
> My understanding is that a compressed format is any format that
> doesn't have a directly accessible 2D pixel matrix in its memory
> representation, so all the bitstream formats should have it set.

Correct.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 

