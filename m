Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD021F3A46
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728796AbgFIMAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 08:00:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53593 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727903AbgFIMAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 08:00:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id icv8jYwBtCKzeicvCjrB6T; Tue, 09 Jun 2020 14:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591704002; bh=3ecFIY/XYufh0xO3+60Kog3lmNXGTQHqQpTGAYffZto=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=siAhLnZI/sgI20Qr6qu/sgWu8jGyKhfYLHOHop8QbvKUwkqr39Ix67CayRalbR4ur
         e2Hw0EfbdP4PsbV9J2JlDH0rK0emiAK61SfdZcz9M2bLQc7Vv0DFaN28BnUmFYjI9S
         EnnJa3s3x0IwR3Jv56YyOiWaj3qJyfLoYt2LFreeSmxIJCmFN+PFclHABXAjClbVeh
         q018oiMCU2QMWNIrHn1p1K1/cLWo+w04TMGia1qtWJ2qtp361WXc8oCXPHMoBRH9tR
         IH4zS/x1otZLnKNExpiTClf2bCs0x+c4rF8RdTgveRcxQjoZLWMEqJLgDqajTWudgp
         FT9Wu31ZrUH7w==
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
 <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
 <dab8ac0c-3d9b-dc31-5880-8eacce948a0b@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <738dfcca-d391-6491-1217-6f5bad1398eb@xs4all.nl>
Date:   Tue, 9 Jun 2020 13:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dab8ac0c-3d9b-dc31-5880-8eacce948a0b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEqa+W25IvP4P8B9HwSMuQ7PScZ2JNt8863mPDR0MnHyrbfB3NCbVNfMlFvu1sExNwxQ4xJGV2gq1uHr64rrVnNIyktmKORBrnknJ3OnsOGtwUoz0Yeo
 0TWtk+ekkG5S+2rRoYZyIHyGvD7iZNIQ05Sr5CcrU5HGB1HWLJhCk0/1tjHahYP56cqZ0+J2wV6u1fm3bLVXBZiGi2OxBT0wPh5snXwnRunzireKKTWcvcJT
 oXBHN5k2ONvNmT9fWdmzopxFfZMl8KPxiBD2nrH5UTSKCaS3amxdEy2Bw5gU76o6Wp13f9JG0yUQUDQX8UmyxQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/06/2020 11:44, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 5/26/20 1:26 PM, Hans Verkuil wrote:
>> On 30/04/2020 13:38, Stanimir Varbanov wrote:
>>> Here we add two more reasons for dynamic-resolution-change state
>>> (I think the name is misleading espesially "resolution" word, maybe
>>
>> espesially -> especially
>>
>>> dynamic-bitstream-change is better to describe).
>>>
>>> The first one which could change in the middle of the stream is the
>>> bit-depth. For worst example the stream is 8bit at the begging but
>>> later in the bitstream it changes to 10bit. That change should be
>>> propagated to the client so that it can take appropriate  action. In
>>> this case most probably it has to stop the streaming on the capture
>>> queue and re-negotiate the pixel format and start the streaming
>>> again.
>>>
>>> The second new reason is colorspace change. I'm not sure what action
>>> client should take but at least it should be notified for such change.
>>> One possible action is to notify the display entity that the colorspace
>>> and its parameters (y'cbcr encoding and so on) has been changed.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> index 606b54947e10..bf10eda6125c 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>>>  
>>>  * visible resolution (selection rectangles),
>>>  
>>> -* the minimum number of buffers needed for decoding.
>>> +* the minimum number of buffers needed for decoding,
>>> +
>>> +* bit-depth of the bitstream has been changed,
>>> +
>>> +* colorspace (and its properties) has been changed.
>>
>> For this I want to have a new source change flag:
>>
>> V4L2_EVENT_SRC_CH_COLORIMETRY
>>
>> Changing colorimetry without changing resolution/bit depth does not
>> require buffers to be re-allocated, it just changes how the pixel
>> data is interpreted w.r.t. color. And that is important to know.
> 
> I'm going to create a patch for this event, but I started to wonder do
> we need new buffer flag for this?
> 
> Something like below sequence:
> 
>  - client receive SRC_CH_COLORIMETRY event
>  - client issue G_FMT(CAPTURE queue)
>  - at that point the client has to know the last buffer with previous
> colorimetry and thus the buffer with new colorimetry
> 
> How the client will know the buffer with new colorimetry?
> 

You still need to drain the capture queue, so only after draining and a
V4L2_DEC_CMD_START (or a STREAMOFF/ON pair) will the new colorimetry become
active. But the big difference with CH_RESOLUTION is that no new capture
buffers have to be allocated for just a colorimetry change.

Regards,

	Hans
