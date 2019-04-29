Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69E4CDE27
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 10:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfD2IlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 04:41:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53737 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727692AbfD2IlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 04:41:12 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L1qThJXtOb8gSL1qWh7BXJ; Mon, 29 Apr 2019 10:41:09 +0200
Subject: Re: [PATCH v4] media: docs-rst: Document m2m stateless video decoder
 interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190306080019.159676-1-acourbot@chromium.org>
 <371df0e4ec9e38d83d11171cbd98f19954cbf787.camel@ndufresne.ca>
 <da5aa9ab957923a72e30b169a3c242c4fe6260f1.camel@bootlin.com>
 <c07703459c7e48904bd7fd83be1e675c70eee83c.camel@ndufresne.ca>
 <d81d0112b99feba0a1899f3722077a4aeec9860c.camel@bootlin.com>
 <439b7f57aa3ba2b2ed5b043f961ef87cb83912af.camel@ndufresne.ca>
 <59e23c5ca5bfbadf9441ea06da2e9b9b5898c6d7.camel@bootlin.com>
 <0b495143bb260cf9f8927ee541e7f001842ac5c3.camel@ndufresne.ca>
 <CAPBb6MVG+3jQcw3AuhYDYCZ0YJ0aX=TmEuM5izh12GLw9V6B8Q@mail.gmail.com>
 <793af82c-6b37-6f69-648e-2cd2a2e87645@xs4all.nl>
 <f30f69af184cc80d5c56853b517943f45c90d9d9.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0a39c613-440d-c7a9-a078-b4688874f9e6@xs4all.nl>
Date:   Mon, 29 Apr 2019 10:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f30f69af184cc80d5c56853b517943f45c90d9d9.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBRLhf5tqSv8VaYA3ixorJmXS8iCUlBuJIN1DR9zT/o90mpo6g77yUt+VcTlq2Cv4NO4AtqwGDuAT/bGbaKNvi46ZrzD52baz0/JzAhKJn0zqJ5I+QDR
 Atk0T3xqvPh4XLZXULiCliWo9BLJR45P+hrS8/B4/b9d/mEVcd4F5XBb8dMpmy2u4fwjy+GBjBQDPccvyE7ScnPoIbLro9PBamKm8SpcPCYUNQXIYv0boP/D
 5hW2SLUf2mPbXOre3TLo9axUpFy4VE9Prp02v9ovRqIXUtTYNMjlMkZM02on4gj63T1IDdcHf5vwUvmZdjHmaNgHHLjK/jhmyaXwmCpq9gDdCDViIO4whyhs
 X7rgj0SS48X+3L6oDQvlhUEeCk1oneN8+CciglFpDJeuoGvpKhoR9dFOIZkfRkg277dR9bjSCPhal9PomfL3+oI1e+8++Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/27/19 2:06 PM, Nicolas Dufresne wrote:
> Le vendredi 26 avril 2019 à 16:18 +0200, Hans Verkuil a écrit :
>> On 4/16/19 9:22 AM, Alexandre Courbot wrote:
>>
>> <snip>
>>
>>> Thanks for this great discussion. Let me try to summarize the status
>>> of this thread + the IRC discussion and add my own thoughts:
>>>
>>> Proper support for multiple decoding units (e.g. H.264 slices) per
>>> frame should not be an afterthought ; compliance to encoded formats
>>> depend on it, and the benefit of lower latency is a significant
>>> consideration for vendors.
>>>
>>> m2m, which we use for all stateless codecs, has a strong assumption
>>> that one OUTPUT buffer consumed results in one CAPTURE buffer being
>>> produced. This assumption can however be overruled: at least the venus
>>> driver does it to implement the stateful specification.
>>>
>>> So we need a way to specify frame boundaries when submitting encoded
>>> content to the driver. One request should contain a single OUTPUT
>>> buffer, containing a single decoding unit, but we need a way to
>>> specify whether the driver should directly produce a CAPTURE buffer
>>> from this request, or keep using the same CAPTURE buffer with
>>> subsequent requests.
>>>
>>> I can think of 2 ways this can be expressed:
>>> 1) We keep the current m2m behavior as the default (a CAPTURE buffer
>>> is produced), and add a flag to ask the driver to change that behavior
>>> and hold on the CAPTURE buffer and reuse it with the next request(s) ;
>>> 2) We specify that no CAPTURE buffer is produced by default, unless a
>>> flag asking so is specified.
>>>
>>> The flag could be specified in one of two ways:
>>> a) As a new v4l2_buffer.flag for the OUTPUT buffer ;
>>> b) As a dedicated control, either format-specific or more common to all codecs.
>>>
>>> I tend to favor 2) and b) for this, for the reason that with H.264 at
>>> least, user-space does not know whether a slice is the last slice of a
>>> frame until it starts parsing the next one, and we don't know when we
>>> will receive it. If we use a control to ask that a CAPTURE buffer be
>>> produced, we can always submit another request with only that control
>>> set once it is clear that the frame is complete (and not delay
>>> decoding meanwhile). In practice I am not that familiar with
>>> latency-sensitive streaming ; maybe a smart streamer would just append
>>> an AUD NAL unit at the end of every frame and we can thus submit the
>>> flag it with the last slice without further delay?
>>>
>>> An extra constraint to enforce would be that each decoding unit
>>> belonging to the same frame must be submitted with the same timestamp,
>>> otherwise the request submission would fail. We really need a
>>> framework to enforce all this at a higher level than individual
>>> drivers, once we reach an agreement I will start working on this.
>>>
>>> Formats that do not support multiple decoding units per frame would
>>> reject any request that does not carry the end-of-frame information.
>>>
>>> Anything missing / any further comment?
>>>
>>
>> After reading through this thread and a further irc discussion I now
>> understand the problem. I think there are several ways this can be
>> solved, but I think this is the easiest:
>>
>> Introduce a new V4L2_BUF_FLAG_HOLD_CAPTURE_BUFFER flag.
>>
>> If set in the OUTPUT buffer, then don't mark the CAPTURE buffer as
>> done after processing the OUTPUT buffer.
>>
>> If an OUTPUT buffer was queued with a different timestamp than was
>> used for the currently held CAPTURE buffer, then mark that CAPTURE
>> buffer as done before starting processing this OUTPUT buffer.
> 
> Just a curiosity, can you extend on how this would be handled. If there
> is a number of capture buffer, these should have "no-timestamp". So I
> suspect we need the condition to differentiate no-timestamp from
> previous timestamp. What I'm unclear is to what does it mean "no-
> timestamp". We already stated the timestamp 0 cannot be reserved as
> being an unset timestamp.

For OUTPUT buffers there is no such thing as 'no timestamp'. They always
have a timestamp (which may be 0). The currently active CAPTURE buffer
also always has a timestamp as that was copied from the first OUTPUT buffer
for that CAPTURE buffer.

> 
>>
>> In other words, for slicing you can just always set this flag and
>> group the slices by the OUTPUT timestamp. If you know that you
>> reached the last slice of a frame, then you can optionally clear the
>> flag to ensure the CAPTURE buffer is marked done without having to wait
>> for the first slice of the next frame to arrive.
>>
>> Potential disadvantage of this approach is that this relies on the
>> OUTPUT timestamp to be the same for all slices of the same frame.
>>
>> Which sounds reasonable to me.
>>
>> In addition add a V4L2_BUF_CAP_SUPPORTS_HOLD_CAPTURE_BUFFER
>> capability to signal support for this flag.
>>
>> I think this can be fairly easily implemented in v4l2-mem2mem.c.
>>
>> In addition, this approach is not specific to codecs, it can be
>> used elsewhere as well (composing multiple output buffers into one
>> capture buffer is one use-case that comes to mind).
>>
>> Comments? Other ideas?
> 
> Sounds reasonable to me. I'll read through Paul's comment now and
> comment if needed.

Paul's OK with it as well. The only thing I am not 100% happy with is
the name of the flag. It's a very low-level name: i.e. it does what it
says, but it doesn't say for what purpose.

Does anyone have any better suggestions?

Also, who will implement this in v4l2-mem2mem? Paul, where you planning to do that?

Regards,

	Hans
