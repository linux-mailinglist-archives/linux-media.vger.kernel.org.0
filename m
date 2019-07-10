Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B924643B7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 10:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfGJInV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 04:43:21 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36275 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726198AbfGJInV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 04:43:21 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id l8C5hsbyG0SBql8C6h6boc; Wed, 10 Jul 2019 10:43:18 +0200
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
 <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a2fb2846-2c29-d4ec-f3d9-9dedf497dd87@xs4all.nl>
Date:   Wed, 10 Jul 2019 10:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCNTf5FA/DlxN97qi5Wo0zoNLh9tVCKH2NSPgmh3fuB670lFCrnxqouF6bZjjvT+6fF034mxA0AjpcGUF2CAVUK08jFv0kzpt5Oj64jdFl2/OZ2leS5a
 N1VrNbr/BIpveJBbK3w4GIXy9uMnpf52off27JWCDa6Q1yiJT0uINQJfKWg/n4jYzVGeoGlKNZpEYO3UZv2Ocqo/9CpYgAnHsZ5pgggV0WjZB02d8rDzdphI
 BEtwgjtX2nw7Cmk5WCpBesxDPdPjcZmFY6WrI+Xevo8bTe8zXyDLJC/9p/JwVcR0Fdt2bcWXNxiZ5UX/KJ2Ml9NMe9hzWZYPkA05oM1DYo1XJuWo9kUktu3O
 DEl11QIfWvJi50tzO4e1tweNpGes/ONlTKAI4N7gwXKSrP/f9kokzViGCrHR/AA9XXNYqqF1hg3N88GTtauUIven312cUtfGWH3iIU3yo7j2kUiu6b+abn0/
 SHv5N2lmrfVpPW0iu5U23+GXUQYgGsAYcSO2k8Yv5uaHTaL7SQ1/rl2q0Unr9BfO71GA1naTEPiaFjKfbUl1mXjv9f+dIDoMIzZhApYR4YmfPAQIXfa3KkSx
 uGMJa+in+a+CRORQpFyI01kfpj6lhVI9iteKGFLLjdGoG0Tk+MAhX5vDPcbqHYYMHRo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/19 8:09 PM, Nicolas Dufresne wrote:
> Le vendredi 28 juin 2019 à 16:34 +0200, Hans Verkuil a écrit :
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
>>
>> For decoders it is more complicated. The stateful decoder spec is written with
>> the assumption that userspace can just fill each OUTPUT buffer to the brim with
>> the compressed bitstream. I.e., no need to split at frame or other boundaries.
>>
>> See section 4.5.1.7 in the spec.
>>
>> But I understand that various HW decoders *do* have limitations. I would really
>> like to know about those, since that needs to be exposed to userspace somehow.
>>
>> Specifically, the venus decoder needs to know the resolution of the coded video
>> beforehand and it expects a single frame per buffer (how does that work for
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
> Hans though a summary of what existing userspace expects / assumes
> would be nice.
> 
> GStreamer:
> ==========
> Encodes:
>   fwht, h263, h264, hevc, jpeg, mpeg4, vp8, vp9
> Decodes:
>   fwht, h263, h264, hevc, jpeg, mpeg2, mpeg4, vc1, vp8, vp9
> 
> It assumes that each encoded v4l2_buffer contains exactly one frame
> (any format, two fields for interlaced content). It may still work
> otherwise, but some issues will appear, timestamp shift, lost of
> metadata (e.g. timecode, cc, etc.).

When you say 'each encoded v4l2_buffer contains exactly on frame',
does that include H.264 SPS/PPS headers? Or are those passed in
a separate v4l2_buffer? Ditto for FFMPEG.

Regards,

	Hans

> 
> FFMpeg:
> =======
> Encodes:
>   h263, h264, hevc, mpeg4, vp8
> Decodes:
>   h263, h264, hevc, mpeg2, mpeg4, vc1, vp8, vp9
> 
> Similarly to GStreamer, it assumes that one AVPacket will fit one
> v4l2_buffer. On the encoding side, it seems less of a problem, but they
> don't fully implement the FFMPEG CODEC API for frame matching, which I
> suspect would create some ambiguity if it was.
> 
> Chromium:
> =========
> Decodes:
>   H264, VP8, VP9
> Encodes:
>   H264
> 
> That is the code I know the less, but the encoder does not seem
> affected by the nal alignment. The keyframe flag and timestamps seems
> to be used and are likely expected to correlate with the input, so I
> suspect that there exist some possible ambiguity if the output is not
> full frame. For the decoder, I'll have to ask someone else to comment,
> the code is hard to follow and I could not get to the place where
> output buffers are filled. I thought the GStreamer code was tough, but
> this is quite similarly a mess.
> 
> Nicolas
> 
> 
> 
> 
> 
> 

