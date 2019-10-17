Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3132EDA5AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 08:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389397AbfJQGeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 02:34:14 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34617 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389081AbfJQGeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 02:34:14 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KzMNiMzSYPduvKzMQitJDd; Thu, 17 Oct 2019 08:34:11 +0200
Subject: Re: [PATCH] Documentation:media:v4l2:Add vivid metadata doc
To:     Vandana BN <bnvandana@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191004115514.31259-1-bnvandana@gmail.com>
 <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
 <20191016164503.01b9f037@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b7e7bf31-c170-9b36-a7fb-b2ff699feb79@xs4all.nl>
Date:   Thu, 17 Oct 2019 08:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016164503.01b9f037@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEMkGgYxUsyASAmwOR8fYiLwHlf9xAbOekGhGyHKIWCEypwFcEQXTBFkJwuOihyIKHhYcvz2Y7qpz4R0Lrfo1C9+i7lOKM81Q87SAHKcV5oQ3il+0/6L
 29CKRcukDcozWIZiqbmmjcNDk5gQmfemVx5NQGJJsXeBYQdilHQECpyVSPtzhIWs03HeT69JxbgGNnMUbrEo244y55zPo8zfvyMhaF2V97/ybGVI67S4Ip9o
 Td5fFSJe5U5CXcx+RGMm0AYy0Wgq7eBRy/cxcYBUaTGxV6J2K1rX2XAOHf4PuOHIqsUzJqU8ZW1i9PX7hHldDw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vandana,

Can you post a v3 with this proposed license?

Thanks!

	Hans

On 10/16/19 9:45 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 4 Oct 2019 13:59:00 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 10/4/19 1:55 PM, Vandana BN wrote:
>>> Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.
>>>
>>> Signed-off-by: Vandana BN <bnvandana@gmail.com>
>>> ---
>>>  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
>>>  .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 43 +++++++++++++++++++
>>>  2 files changed, 44 insertions(+)
>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
>>>
>>> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
>>> index b10ca9ee3968..74c8659ee9d6 100644
>>> --- a/Documentation/media/uapi/v4l/meta-formats.rst
>>> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
>>> @@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
>>>      pixfmt-meta-uvc
>>>      pixfmt-meta-vsp1-hgo
>>>      pixfmt-meta-vsp1-hgt
>>> +    pixfmt-meta-vivid
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
>>> new file mode 100644
>>> index 000000000000..e6c349fadf30
>>> --- /dev/null
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
>>> @@ -0,0 +1,43 @@
>>> +.. Permission is granted to copy, distribute and/or modify this
>>> +.. document under the terms of the GNU Free Documentation License,
>>> +.. Version 1.1 or any later version published by the Free Software
>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>> +.. Documentation/media/uapi/fdl-appendix.rst.
>>> +..
>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> 
> Could you please re-license it with dual GFDL and GPL?
> 
> See for example:
> 	Documentation/media/uapi/mediactl/media-request-ioc-queue.rst
> 
> For the text we're adding to all new documentation files on media.
> 
> Regards,
> Mauro
> 
>>> +
>>> +.. _v4l2-meta-fmt-vivid:
>>> +
>>> +*******************************
>>> +V4L2_META_FMT_VIVID ('VIVID')  
>>
>> That's a fivecc instead of a fourcc :-)
>>
>>> +*******************************
>>> +
>>> +VIVID Metadata Format
>>> +
>>> +
>>> +Description
>>> +===========
>>> +
>>> +This format describes metadata in vivid driver.  
>>
>> Say: ...describes the metadata format used by the vivid driver.
>>
>>> +
>>> +It sets Brightness, Saturation, Contrast and Hue, each of which maps to
>>> +corresponding control in vivid driver with respect to its range and default values.  
>>
>> ...controls of the...
>> ...respect to the range...
>>
>>> +
>>> +It contains the following fields:
>>> +
>>> +.. flat-table:: VIVID Metadata
>>> +    :widths: 1 4
>>> +    :header-rows:  1
>>> +    :stub-columns: 0
>>> +
>>> +    * - Field
>>> +      - Description
>>> +    * - u16 brightness;
>>> +      - Image brightness, value can be in range 0 to 255, with default value as 128.  
>>
>>       - Image brightness, the value is in the range 0 to 255, with the default value as 128.
>>
>>> +    * - u16 contrast;
>>> +      - Image contrast, value can be in range 0 to 255, with default value as 128.
>>> +    * - u16 saturation;
>>> +      - Image color saturation, value can be in range 0 to 255, with default value as 128.
>>> +    * - s16 hue;
>>> +      - Image color balance, value can be in range -128 to 128, with default value as 0.
>>>   
>>
>> Ditto.
>>
>> Regards,
>>
>> 	Hans
> 
> 
> 
> Thanks,
> Mauro
> 

