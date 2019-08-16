Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727D88FB96
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 08:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfHPG7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 02:59:21 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45973 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbfHPG7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 02:59:21 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yWCfh0dBGzaKOyWCkhl85p; Fri, 16 Aug 2019 08:59:19 +0200
Subject: Re: [PATCHv2 11/12] media: docs-rst: Document m2m stateless video
 decoder interface
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Francois Buergisser <fbuergisser@google.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-12-hverkuil-cisco@xs4all.nl>
 <CAPBb6MWMeepMw=f=4DL5Qgx-H+cpsyCehyNuV5PVimEAN6nJZg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0b947ac2-6d2e-cdc9-4c0b-6eb3d5a45fbe@xs4all.nl>
Date:   Fri, 16 Aug 2019 08:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPBb6MWMeepMw=f=4DL5Qgx-H+cpsyCehyNuV5PVimEAN6nJZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfExVNYMhbEYby91DTWXXU2/IU9VaZQNoiZTWDg/izklZo7k5DXhTzB7/LBMtJnocIOPJ8mLFsDT0kQ5WYX8tNtE1WXSgn1ye3/f/mvljrISRhR/lxa9Z
 JjXIGecOMHZxTdqMRDcUsG2kAkEG41b8dOlZmXE4guh+Qlou0JOR0an/IkZHGc7X7/1vYQixbz3E0jPD3BUrLkCxoV+zXb+vVHJPm8gKKvqAGoAKIi0Tu0re
 yFZMYy42Wo/NEAlc6sf42XbeTZu9Xh1moj4SJL8Fa4LhDLcyZhWDWXfYCZtvPRBdtTigd4LE0jwA7n/hwxEjEjGpHUH9oE2zd76DfIktcJb5wwVYKBNrLMvK
 iDjU3yY4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/16/19 7:49 AM, Alexandre Courbot wrote:
> On Mon, Aug 12, 2019 at 8:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> From: Alexandre Courbot <acourbot@chromium.org>
>>
>> Documents the protocol that user-space should follow when
>> communicating with stateless video decoders.
>>
>> The stateless video decoding API makes use of the new request and tags
>> APIs. While it has been implemented with the Cedrus driver so far, it
>> should probably still be considered staging for a short while.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> ---
>>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
>>  .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++++++++
>>  2 files changed, 425 insertions(+)
>>  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
>>

<snip>

>> +Dynamic resolution change
>> +=========================
>> +
>> +If the client detects a resolution change in the stream, it will need to perform
>> +the initialization sequence again with the new resolution:
>> +
>> +1. If the last submitted request resulted in a ``CAPTURE`` buffer being
>> +   held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, then the
>> +   last frame is not available on the ``CAPTURE`` queue. In this case, a
>> +   ``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the driver
>> +   dequeue the held ``CAPTURE`` buffer.
>> +
>> +2. Wait until all submitted requests have completed and dequeue the
>> +   corresponding output buffers.
>> +
>> +3. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPTURE``
>> +   queues.
>> +
>> +4. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` on the
>> +   ``CAPTURE`` queue with a buffer count of zero.
>> +
>> +5. Perform the initialization sequence again (minus the allocation of
>> +   ``OUTPUT`` buffers),
> 
> We have just hit an issue on the Hantro driver related to this. At the
> moment, Hantro will reject calls to VIDIOC_S_FMT on the OUTPUT queue
> if buffers are allocated. And indeed, the documentation for
> VIDIOC_S_FMT mentions this behavior:
> 
>     EBUSY
>       The device is busy and cannot change the format. This could be
> because or the device is streaming or buffers are allocated or queued
> to the driver.
> 
> However in our case it does not make much sense to force reallocating
> the OUTPUT buffers if user-space knows that the current ones are still
> large enough for the new resolution. Should Hantro be adapted to allow
> this, or shall we reword the specification?
> 
> Note that if we allow this, we may also allow OUTPUT buffers to be
> allocated before the CAPTURE format is set during the initialization
> sequence (i.e. move step 6. somewhere after step 2.).
> 
> Thoughts?

Drivers can allow S_FMT while buffers are allocated. But it needs to be
done carefully: for MMAP streaming mode the driver will have to check
that the allocated buffers are large enough for the new format (you
probably want to make a helper function for this check), for USERPTR and
DMABUF this needs to be checked in the buf_prepare vb2 callback. This
probably happens already.

Calling S_FMT while streaming is probably not a good idea and should
still result in a EBUSY. Mostly because it is not clear whether a S_FMT
should take immediate effect (thus affecting all already queued buffers)
or only with newly queued buffers. Let's just avoid this situation for
now.

It was always the intention to relax the rules of when you can call S_FMT,
but in most cases it is easier to just prohibit calling S_FMT when buffers
are allocated.

Regards,

	Hans
