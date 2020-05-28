Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62431E5B24
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 10:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgE1Is6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 04:48:58 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60851 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726612AbgE1Is5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 04:48:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eEDajH4o7FjnUeEDdji9oU; Thu, 28 May 2020 10:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590655733; bh=zjO35w0aUjU8UAKWf4wi0AUIv1H4ls382wF25UvqVrE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bEgyB8ShCujpND3edcUbxuYaFHwiUtBmk5Oynnn3BBNbolvkCuwLRUekACCmtBmts
         Mrdwei79TyRJVhKoQfj0YMFb9TeCTOQClvJJfg116glNCAG5tbXXobyl3FYbM9jYE/
         BhXZrCoWn59gaweRcwnBIBCIl+kkPOFkrfskvL+s8Z3fao+JnThqWZDmyPaThSfSCk
         f/1wJwlOPLYkid16Xo6YW3ogw8lwiHtNGgP7FRcJsBUhtJlZqV79/fjqo+da9QH8AF
         yJlrOKfz0uVCj3mC2OhBPaepkNaKoKFtETGGeiKOjNCFrThY5cv1wxtu8N9RjGzI0k
         oOImfEt8A90SA==
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
 <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
 <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl>
 <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
 <20200528074428.GB19211@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <16137a65-923b-b131-f95a-7c2d185a3612@xs4all.nl>
Date:   Thu, 28 May 2020 10:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200528074428.GB19211@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKvgxzZsRCW/Bhp7/RbS9KMpZkiBBwqCNHTHzVTtsZetscmgzR+stT3UXxdjs6rjoC7t6beNCNwGcURC5NK5Yanham+Tyd5DKBdpmbm6MqxNge86X8O5
 n8W+5Mnr1Z4kjU31odbibc0ed3medKPUhMAYxqGtBhVuzQkl6fc8kBslI0xpcD2jKjP5Z5fmS5Fzr7FOGwQ6c23FxN4vvH0Rly7MQkSelGIBYenWwt3g6Nw8
 XQCCBYHAzAzwugFWsEFsRg8obaRlvttSjZwqwLhlmz0JDxZAwP5H0NEOiWHQ595e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/05/2020 09:44, Michael Tretter wrote:
> On Tue, May 26, 2020 at 06:01:35PM +0200, Tomasz Figa wrote:
>> On Tue, May 26, 2020 at 10:32 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> On 20/05/2020 22:32, Nicolas Dufresne wrote:
>>>> Le mercredi 20 mai 2020 à 12:01 +0200, Hans Verkuil a écrit :
>>>>> From: Tomasz Figa <tfiga@chromium.org>
>>>>>
>>>>> Due to complexity of the video encoding process, the V4L2 drivers of
>>>>> stateful encoder hardware require specific sequences of V4L2 API calls
>>>>> to be followed. These include capability enumeration, initialization,
>>>>> encoding, encode parameters change, drain and reset.
>>>>>
>>>>> Specifics of the above have been discussed during Media Workshops at
>>>>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>>>>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>>>>> originated at those events was later implemented by the drivers we already
>>>>> have merged in mainline, such as s5p-mfc or coda.
>>>>>
>>>>> The only thing missing was the real specification included as a part of
>>>>> Linux Media documentation. Fix it now and document the encoder part of
>>>>> the Codec API.
>>>>>
>>>>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> ---
>>>>>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>>>>>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>>>>>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>>>>>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>>>>>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>>>>>  5 files changed, 766 insertions(+), 20 deletions(-)
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
>>>
>>> <snip>
>>>
>>>>> +5. **Optional** Set the coded frame interval on the ``CAPTURE`` queue via
>>>>> +   :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded frame
>>>>> +   interval is different from the raw frame interval, which is typically
>>>>> +   the case for off-line encoding.
>>>>> +
>>>>> +   * ** Required fields:**
>>>>> +
>>>>> +     ``type``
>>>>> +     a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
>>>>> +
>>>>> +     ``parm.capture``
>>>>> +     set all fields except ``parm.capture.timeperframe`` to 0.
>>>>> +
>>>>> +     ``parm.capture.timeperframe``
>>>>> +     the desired coded frame interval; the encoder may adjust it to
>>>>> +     match hardware requirements.
>>>>> +
>>>>> +   * **Return fields:**
>>>>> +
>>>>> +     ``parm.capture.timeperframe``
>>>>> +     the adjusted frame interval.
>>>>> +
>>>>> +   .. important::
>>>>> +
>>>>> +      Changing the ``CAPTURE`` frame interval sets the framerate for the
>>>>> +      coded video. It does *not* set the rate at which buffers arrive on the
>>>>> +      ``CAPTURE`` queue, that depends on how fast the encoder is and how
>>>>> +      fast raw frames are queued on the ``OUTPUT`` queue.
>>>>> +
>>>>> +   .. important::
>>>>> +
>>>>> +      ``timeperframe`` deals with *frames*, not fields. So for interlaced
>>>>> +      formats this is the time per two fields, since a frame consists of
>>>>> +      a top and a bottom field.
>>>>> +
>>>>> +   .. note::
>>>>> +
>>>>> +      Not all drivers support this functionality, in that case just set
>>>>> +      the desired coded frame interval for the ``OUTPUT`` queue.
>>>>
>>>> There is a slight contorsion in the resulting user-space API. When I
>>>> read this, the logical thing to do for live streams would be to just
>>>> set the OUTPUT and the driver will take care of CAPTURE for me.
>>>>
>>>> While if I want to do offline, I don't know if this is supported or
>>>> not. So the flow would be a bit special:
>>>>
>>>>   S_PARM(OUTPUT) with coded video frame rate
>>>>   S_PARM(CAPTURE) width coded video
>>>>   if ^ worked:
>>>>      S_PARM(OUTPUT) with fastest rate possible
>>>>
>>>> Ideally I would have preferred if there was a more straight forward way
>>>> to configure offline encoding for fastest performance with specific
>>>> coded framerate. I don't think it's a blocker though, performance is
>>>> not critical at all here. Maybe I'm missing something that allow to
>>>> check if this is supported or not without trying it ?
>>>
>>> Good point. I considered adding a flag for the v4l2_fmtdesc struct that
>>> reports whether you can set the capture framerate independently from the
>>> OUTPUT framerate. Perhaps V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL?
>>>
>>> I actually think it would be best if that's added. It is not enough to
>>> rely on whether S_PARM(CAPTURE) works to determine this feature since
>>> at least one encoder drivers supports both OUTPUT and CAPTURE with S_PARM,
>>> but CAPTURE does the same as OUTPUT, so that would be a red herring.
>>>
>>> I'll add this flag for v3.
>>
>> Now if I think of it again, this behavior might be problematic for
>> existing userspace, which I believe assumes encoding as fast as
>> possible, because of how mem2mem devices were expected to behave.
>> Could we define this to always default to as fast as possible?
>> Otherwise we could end up regressing the encoding latency on latency
>> sensitive applications, such as video conferencing.
> 
> I see your point regarding the latency, but I don't think that this justifies
> "as fast as possible" as a default in the API. Adjusting the encoding speed
> based on a user space hint is usually a trade-off that the driver must make.
> If the trade-off results in a reduced latency, it is a regression in the
> individual driver and the trade-offs must be discussed per driver.

Hmm, perhaps I need to do some more wordsmithing here.

Existing encoder drivers all support setting the framerate by calling
S_PARM(OUTPUT). This does not mean that the speed at which frames are
presents to the encoder for encoding is limited, instead it sets the
framerate embedded in the encoded stream (i.e., this is the rate which
is used together with the requested bitrates to determine the encoding
quality).

For live encoding this framerate matches the speed at which the frames
are queued to the encoder. For off-line encoding this can be different.

In the corner case (allegro) where there can be multiple encoders that
can run in parallel setting to OUTPUT framerate can be used to allocate
resources to each encoder, and then you need to be able to set the actual
coded framerate using S_PARM(CAPTURE).

> 
>>
>> For example, we could define the rates of both queues the other way
>> around. The OUTPUT queue, which seems to be where the existing user
>> space currently sets the desired stream frame rate, could be
>> interpreted as the frame rate of the video to be encoded, while the
>> CAPTURE queue would control the desired output rate of the encoded
>> video, which would kind of match the V4L2 definition of CAPTURE frame
>> interval.
> 
> Setting the desired stream frame rate on CAPTURE does not work with frame
> reordering. In that case driver returns the CAPTURE buffers, whenever a coded
> buffer is finished, and not necessarily at a certain frame rate. Strictly
> following the V4L2 definition for CAPTURE frame interval, the driver would
> need to produce repeated frames if the decode order differs from the display
> order.

The CAPTURE framerate for encoders has nothing to do with the rate at which
buffers are returned to userspace since that makes no sense. Instead, it sets
the framerate of the coded stream.

> 
> Setting the stream frame rate on the OUTPUT makes a lot of more sense to me,
> because that is the rate at which we can feed buffers to the encoder. This
> rate differs, if we use another V4L2 CAPTURE device as a live source or a file
> as an offline source for the frames to be encoded, and determines the maximum
> rate at which the encoder can produce CAPTURE buffers.

Ideally I would have preferred to use S_PARM(CAPTURE) to set the coded framerate
and S_PARM(OUTPUT) to give a hint of the rate at which raw frames are queued
(it's a hint only in order to help allocate resources to an encoder instance).

But unfortunately I am constrained by existing behavior.

Regards,

	Hans
