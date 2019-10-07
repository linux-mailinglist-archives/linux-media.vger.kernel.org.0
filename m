Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBDFCE131
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 14:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfJGMGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 08:06:23 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56085 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727467AbfJGMGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 08:06:23 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HRmOiMO4ljZ8vHRmPi6b1B; Mon, 07 Oct 2019 14:06:21 +0200
Subject: Re: [PATCH v10 6/8] Documentation: media: Describe
 V4L2_CID_UNIT_CELL_SIZE
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
 <20191007113502.11746-7-ribalda@kernel.org>
 <494e3061-985d-8b8e-7728-9e72442ad9f7@xs4all.nl>
 <CAPybu_2Qm+1MxQXCXXq4zzhvnjew5awRSofkqiPrc2bMav=Jkg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5934d1ce-fb9e-1965-cff2-1c3cc70006df@xs4all.nl>
Date:   Mon, 7 Oct 2019 14:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_2Qm+1MxQXCXXq4zzhvnjew5awRSofkqiPrc2bMav=Jkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfImsdgBN2sNq3DcD0W9y9jdfVVd8Uu2jDdX6gK5t2AnJ41nIw6IZ1mUjo4QiCf5ZCpPyjWdX++jWCihUl0lakd5mQi9Q+6XlLFO7CL3posQVCF7Ky/Zv
 FF/8PEvM/0aNKM7hgA5vp3Aw6UCVyK00P/1DmbGLwg6Fe+Qd1Y6MUJxWrvLnHoccWdSxW69VQarNmFXUSF2kUEGkrSo0gzg31sRtHSEyy2mJIVBPSZAXkA+R
 wcS42veMdon1fQo7zLxq5/hFlu8W+aPbEfcg5lULrNARQc4saNwlLx/DIp8VH8w5fswVlR0oSIioH+S2AJrhILP/XUZlWfHixjlrLDQErrDcQr2SurQJyHTY
 EeRD6EDQlAUsMveDTCcf6UlEcyv09SlROiCt9wfiOyEahztrqO8j8g2u0MLu424pMkWdIwXe
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 2:03 PM, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> 
> 
> On Mon, Oct 7, 2019 at 2:01 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 10/7/19 1:35 PM, Ricardo Ribalda Delgado wrote:
>>> New control to pass to userspace the width/height of a pixel. Which is
>>> needed for calibration and lens selection.
>>>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>> ---
>>>  Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
>>> index 2c3ab5796d76..6388668855d0 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
>>> @@ -55,3 +55,12 @@ Image Source Control IDs
>>>
>>>  ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
>>>      Test pattern green (next to blue) colour component.
>>> +
>>> +``V4L2_CID_UNIT_CELL_SIZE (struct)``
>>> +    This control returns the unit cell size in nanometers. The struct
>>> +    :c:type:`v4l2_area` provides the width and the height in separate
>>> +    fields to take into consideration asymmetric pixels and/or hardware
>>> +    binning.
>>
>> This still states that this control takes binning into account. I understood that
>> we decided not to do that?
>>
> 
> Good catch, seems that at some point I changed my mind :).
> 
> Will fix this doc.
> 
> Can I resend only this patch to avoid spamming the list?

Yes, that's fine.

	Hans

> 
> 
>> Regards,
>>
>>         Hans
>>
>>> +    The unit cell consists of the whole area of the pixel, sensitive and
>>> +    non-sensitive.
>>> +    This control is required for automatic calibration of sensors/cameras.
>>>
>>

