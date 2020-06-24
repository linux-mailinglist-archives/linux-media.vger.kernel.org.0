Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D9E2074D7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 15:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391079AbgFXNq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 09:46:29 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51681 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390933AbgFXNq2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 09:46:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o5jJjhY5wNb6lo5jMjtarX; Wed, 24 Jun 2020 15:46:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593006385; bh=ZuV4OmcavInlJN2jxK6OSIjKBVUQtZBJPsSNmNf4VtE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HjKIqEjrG/WADHDRB48Q5wBZwrHcFhHpvNLciTynquKm5yE6KvY+jk7CyoRme4jb8
         gaJT3ok7Z4BifCV3Jwn5eynDB2z56kl+urp+ayU0Qm5OK7bydZG+wrDbF2BEx7W7gw
         JVnaEvVZzasnlU/EXmjvnhS3KMy/ZUYLKw0Idrbj54dlYr6DJVc99wRnbEoBFSNorA
         jbf5jmDAYSlHRD/da9yTJbPPp5OfF6lfD6ktENp6VRQFd/sYf7lIkwRyRPU198A6oU
         FDlg6Zr5tQuO9GpJ9I3pF8P4D/PgrrQwPpz/hVQqTYNySLo6byf1J1Ww6SrZtgu9PC
         HmYaDnNC96neA==
Subject: Re: [PATCH v11 13/13] dt-bindings: Add media properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-14-jacopo@jmondi.org>
 <6a8add4e-c1f6-bd08-8928-3c8884eeda2c@xs4all.nl>
 <20200520075217.zxpirx5migumekwx@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <982aab4d-3214-564e-467f-087ecc9241d8@xs4all.nl>
Date:   Wed, 24 Jun 2020 15:46:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200520075217.zxpirx5migumekwx@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLP9AbVPTh4Suhogb0uTVq+ZuTuA/ufGXSNoJyr4fqOfZjF0kpircmmzUWD6iQ/mBwGJm0eliL0JazH4sqFiQZLHq3k26TeMP1ZSOVMF9TAuCtoX/fNe
 e1OCMTKkBLmTLJt5ZTezPCq6wEqg7+4R1rOwL1Dapz+V3D41XWWMMwmqbkj3ck/E4g2uve8gNmRIlujBxNTIaJGuibYK6qlpG1/QJelvdzOHH8/t6ehOIRtI
 4oEIZzCdItuaC/RFhJ8PVsHop+k4Lh9WHcS519m+Yo1Jl5W6O6her+vAMQwdWRXvCXBBzI2v9Cr6OfJrkRTlKk6hFzJ8crsq+0FDoKV0qBylgf3hkVYRAo8p
 LL3+uwJx2QNjHEswX4XANMYHrYzvNLypj/aJ2oge4WBlQGXRqpA+pEALd8WuO8Q4GdaERg3bgjaRJpwA88AT4u6Ny/pu2o8Tm8kiUbtTgnn9Fngo/WIhv65/
 wZiWd2KsWJ6VVvi8Q/txkcgmjkVH++ZdtY9peQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/05/2020 09:52, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Mon, May 11, 2020 at 09:27:57AM +0200, Hans Verkuil wrote:
>> On 09/05/2020 11:04, Jacopo Mondi wrote:
>>> Add a DT header file to contain definitions for standard media properties.
>>>
>>> The file is named after:
>>> Documentation/devicetree/bindings/media/video-interfaces.txt
>>> which contains the standard media properties definitions.
>>>
>>> Initially add three macros to define the supported 'orientation'
>>> property values.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>
>>> I currently don't have users in mainline for this, I understand this implies
>>> this is probably not going to be accepted. At the same time we don't have a
>>> common place for media-related definitions, which support properties defined in
>>> video-interfaces.txt
>>>
>>> I leave it here at the end of the series for discussions, but I'm fine dropping
>>> it from the series.
>>>
>>> Thanks
>>>   j
>>>
>>> ---
>>>  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>  create mode 100644 include/dt-bindings/media/video-interfaces.h
>>>
>>> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
>>> new file mode 100644
>>> index 0000000000000..404c697d6bd6e
>>> --- /dev/null
>>> +++ b/include/dt-bindings/media/video-interfaces.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * include/dt-bindings/media/video-interfaces.h
>>> + *
>>> + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
>>> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
>>> +
>>> +#define FRONT_CAMERA		<0>
>>> +#define BACK_CAMERA		<1>
>>> +#define EXTERNAL_CAMERA		<2>
>>
>> Uh, shouldn't that be 0, 1 and 2 instead of <0>, <1> and <2> ?
> 
> I used that notation to be able to write
>         orientation = FRONT_CAMERA
> in place of
>         orientation = <FRONT_CAMERA>
> 
> Do you think it's wrong ?

Yes, I think that's wrong :-)

From what I can see in existing device tree files you do not hide the '<>'.

Regards,

	Hans

> 
> Thanks
>   j
> 
>>
>> I'm skipping this patch for the PR.
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
>>> --
>>> 2.26.1
>>>
>>

