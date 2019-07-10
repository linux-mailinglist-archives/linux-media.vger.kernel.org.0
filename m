Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C8764430
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 11:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfGJJOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 05:14:21 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45507 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726580AbfGJJOV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 05:14:21 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id l8g5hsrEO0SBql8g6h6n2X; Wed, 10 Jul 2019 11:14:19 +0200
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
 <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1d07312a-bff0-9274-6aeb-2d85c3eee61a@xs4all.nl>
Date:   Wed, 10 Jul 2019 11:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKLJ05Vp325wYbpXAKeSWoIy3xL2gzeIoLF7Fna9HlU5okoTWyBwwn0mrpaZPU9T+ngCyyWATkIeGD/5AdExocs+opGFoSiAfdzIGESoWP7S7j4lQCXb
 eQjHXfPjywxbREOChDXV1tPfz1Z11shOVZknmVHonu6b0BQzdUJLbOuvsI3LOrj49WaquPU6M7uQJMLqD6VUSbd/JO1D0s7FJbbQY5JpPCEWvlmCKLrLkRtn
 eMZsu4sEJsTAepn5fhVFF6DFznB39yyAJlbdmuah+HA+aqvp024qHOOtp/uryoQ/4TSuUcRJcN6i5tXgqdrNzVjYLk06sd4CC0TilFbf4Hw//WzjcryPh4pf
 9XSxJgJnCfGkCPVZCtYYXOSWUZiAFlMQWx4t3YYv6UffTxHA27sTU10rlaj8jTS3wRayxwK96qehjTpG8JvQLUI34giS3AX0Oa+I4mzxPMpD51TwM7WBbmBx
 oDyn5z3IY2RVyHXNJzofNW1+hG9sI9qCeVYYHovSgAZTmZ/Zis1nWHjRjM86+z7Y+UYWlr/OL3LTj/pPvfKDoqmGIlyvZrhgE6O97GMUt03TI7M6i+LkmVQN
 +AD0+uJrp42N5gJ280sR6L51oMd05LF//e8MlCFLY2/gvr/aFCIdq8qR8sLAc6muy6w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/3/19 10:32 AM, Tomasz Figa wrote:
> Hi Hans,
> 
> On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi all,
>>
>> I hope I Cc-ed everyone with a stake in this issue.
>>
>> One recurring question is how a stateful encoder fills buffers and how a stateful
>> decoder consumes buffers.
>>
>> The most generic case is that an encoder produces a bitstream and just fills each
>> CAPTURE buffer to the brim before continuing with the next buffer.
>>
>> I don't think there are drivers that do this, I believe that all drivers just
>> output a single compressed frame. For interlaced formats I understand it is either
>> one compressed field per buffer, or two compressed fields per buffer (this is
>> what I heard, I don't know if this is true).
>>
>> In any case, I don't think this is specified anywhere. Please correct me if I am
>> wrong.
>>
>> The latest stateful codec spec is here:
>>
>> https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
>>
>> Assuming what I described above is indeed the case, then I think this should
>> be documented. I don't know enough if a flag is needed somewhere to describe
>> the behavior for interlaced formats, or can we leave this open and have userspace
>> detect this?
>>
> 
> From Chromium perspective, we don't have any use case for encoding
> interlaced contents, so we'll be okay with whatever the interested
> parties decide on. :)
> 
>>
>> For decoders it is more complicated. The stateful decoder spec is written with
>> the assumption that userspace can just fill each OUTPUT buffer to the brim with
>> the compressed bitstream. I.e., no need to split at frame or other boundaries.
>>
>> See section 4.5.1.7 in the spec.
>>
>> But I understand that various HW decoders *do* have limitations. I would really
>> like to know about those, since that needs to be exposed to userspace somehow.
> 
> AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
> separate buffers. I believe it also needs 1 buffer to contain exactly
> 1 frame and 1 frame to be fully contained inside 1 buffer.
> 
> Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
> be fully contained inside 1 buffer. It used to have some specific
> requirements regarding SPS and PPS too, but I think that was fixed in
> the firmware.
> 
>>
>> Specifically, the venus decoder needs to know the resolution of the coded video
>> beforehand
> 
> I don't think that's true for venus. It does parsing and can detect
> the resolution.
> 
> However that's probably the case for coda...
> 
>> and it expects a single frame per buffer (how does that work for
>> interlaced formats?).
>>
>> Such requirements mean that some userspace parsing is still required, so these
>> decoders are not completely stateful.
>>
>> Can every codec author give information about their decoder/encoder?
>>
>> I'll start off with my virtual codec driver:
>>
>> vicodec: the decoder fully parses the bitstream. The encoder produces a single
>> compressed frame per buffer. This driver doesn't yet support interlaced formats,
>> but when that is added it will encode one field per buffer.
>>
>> Let's see what the results are.
> 
> s5p-mfc:
>  decoder: fully parses the bitstream,
>  encoder: produces a single frame per buffer (haven't tested interlaced stuff)
> 
> mtk-vcodec:
>  decoder: expects separate buffers for SPS, PPS and full frames
> (including some random stuff like SEIMessage),

Do you mean that the SPS/PPS etc. should all be in separate buffers? I.e.
you can't combine SPS and PPS in a single buffer?

Regards,

	Hans

>  encoder: produces a single frame per buffer (haven't tested interlaced stuff)
> 
> Best regards,
> Tomasz
> 

