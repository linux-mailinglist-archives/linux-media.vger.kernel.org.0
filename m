Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A471BE2B3
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 18:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439616AbfIYQnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 12:43:08 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45343 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732923AbfIYQnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 12:43:08 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id DANaiLbsHz6EADANdiBgjX; Wed, 25 Sep 2019 18:43:06 +0200
Subject: Re: [PATCH] media: vidioc-queryctrl.rst: clarify combining READ_ONLY
 with WRITE_ONLY
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20190925150945.27706-1-helen.koike@collabora.com>
 <211b3d26-ffbc-3245-6613-7fd42c65cc80@xs4all.nl>
 <a7e82545-141b-7496-f0f1-dadbe05565f0@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e9ba320a-75bb-2a0d-cd26-617f61c8a2af@xs4all.nl>
Date:   Wed, 25 Sep 2019 18:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a7e82545-141b-7496-f0f1-dadbe05565f0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfERSPoQyAvf5cEaQ19pJx+nQOpyDj770YEWzMb6Rn499daZnpOJjrGH3s8dOHl2ItwJAb/kLHAT81WqgjkM4yqDcTIyWxq1yBCMiInQ4kupACO4El6Iw
 sK5GRr2Baio8DUxpJqHB80zUsi/x9j17KFqjEaYHhNoRE6yhgfs712g/xYQiYCwaNiyD7KLsktIl7CQMUP2kJMdmz8C6I38YPwONp/7a1hS7g+QwCOAhryF5
 M4gjf14NiLj8c6Gu+rIyD9AVQ3ENgp6AjvsPzluV0psnRlzojxnIHPzZuh9KiJUDLhy1fqCUUaH1GZCNu+E6RzXLXn2RuawS4bnk/QqWNDs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/25/19 6:29 PM, Helen Koike wrote:
> Hi Hans
> 
> On 9/25/19 12:17 PM, Hans Verkuil wrote:
>> On 9/25/19 5:09 PM, Helen Koike wrote:
>>> Make it clear in the documentation that V4L2_CTRL_FLAG_READ_ONLY doesn't
>>> conflict with V4L2_CTRL_FLAG_WRITE_ONLY. Also make it clear that
>>> if both are combined then the control has read and write permissions.
>>
>> That doesn't look right.
>>
>> This is the test in v4l2-compliance:
>>
>> __u32 rw_mask = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
>>
>> if ((fl & rw_mask) == rw_mask)
>> 	return fail("can't read nor write this control\n");
>>
>> If both flags are set, then a fail is reported.
>>
>> Did you mis-read?
>>
>> Setting both flags makes no sense.
> 
> Maybe I misunderstood the V4L2_CTRL_TYPE_CTRL_CLASS, from v4l2-compliance:
> 
> 	case V4L2_CTRL_TYPE_CTRL_CLASS:
> 		if (fl != (V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY))
> 			return fail("invalid flags for control class\n");
> 
> I was confused why vivid was using both flags in vivid_ctrl_class (and also the debayer patch that was following this model).
> 
> Why both flags are expected when this type is used?

Ah, now I understand. This is specific to control classes: such controls cannot
be read nor written. They just provide a name for the control class, but both
G_CTRL and S_CTRL should fail.

So this specific combination of flags is specific to control classes only.

This works because a 'get' will fail if WRITE_ONLY is set, and a 'set' will fail
if READ_ONLY is set. Setting both flags will cause both 'get' and 'set' to fail.

It is admittedly a bit confusing.

Regards,

	Hans

> 
> Thanks,
> Helen
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>
>>> ---
>>> Hi,
>>>
>>> v4l2-compliance expects both flags for read and write permissions, so I
>>> would like to make it clear in the docs.
>>> Please let me know if this is not the case.
>>>
>>> Thanks
>>> Helen
>>> ---
>>>  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> index a3d56ffbf4cc..1d3aecdf679f 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> @@ -500,6 +500,11 @@ See also the examples in :ref:`control`.
>>>        - 0x0004
>>>        - This control is permanently readable only. Any attempt to change
>>>  	the control will result in an ``EINVAL`` error code.
>>> +
>>> +	.. note::
>>> +
>>> +	   If combined with ``V4L2_CTRL_FLAG_WRITE_ONLY``, then both, read
>>> +	   and write are allowed.
>>>      * - ``V4L2_CTRL_FLAG_UPDATE``
>>>        - 0x0008
>>>        - A hint that changing this control may affect the value of other
>>> @@ -523,6 +528,11 @@ See also the examples in :ref:`control`.
>>>  	where writing a value will cause the device to carry out a given
>>>  	action (e. g. motor control) but no meaningful value can be
>>>  	returned.
>>> +
>>> +	.. note::
>>> +
>>> +	   If combined with ``V4L2_CTRL_FLAG_READ_ONLY``, then both, read
>>> +	   and write are allowed.
>>>      * - ``V4L2_CTRL_FLAG_VOLATILE``
>>>        - 0x0080
>>>        - This control is volatile, which means that the value of the
>>>
>>

