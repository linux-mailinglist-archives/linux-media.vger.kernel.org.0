Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92BAB0D71
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 13:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731358AbfILLAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 07:00:45 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58251 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731267AbfILLAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 07:00:45 -0400
Received: from [IPv6:2001:420:44c1:2577:24cc:d8f2:53a9:84b0] ([IPv6:2001:420:44c1:2577:24cc:d8f2:53a9:84b0])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8Mq4iPAMsV17O8Mq8iyD5g; Thu, 12 Sep 2019 13:00:43 +0200
Subject: Re: [PATCH v3 3/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-3-ribalda@kernel.org>
 <20190826074059.bby3k6vr25axfbqc@uno.localdomain>
 <CAPybu_290wASRs+LLLNup-MYb3W35Zj7W3_qBZSKYJrZCKUJ+g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b3935cde-3462-a7e6-a798-92bdd4ffcc45@xs4all.nl>
Date:   Thu, 12 Sep 2019 13:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_290wASRs+LLLNup-MYb3W35Zj7W3_qBZSKYJrZCKUJ+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPfwKjx4UD93SO0AmQcDSRpDqn25z+LAfiCPtU6lrI9mLrpvKynYotLckLYYMRXzoHMPNoWxURsuLQukMUM1LUech20mgvA0sUYvPHqO4lnifMYPT2ZZ
 pqNCXo36tL4JWn9jV47HqUWMekpX5k+YKksDc9L6CHLtljPiYRv+ryZXCLL0I+EzRdwq8IH/7YhBYTL2a+wNQI6ZPsqS5QcTaDsJRCPAFlIoFxreZZANa8wA
 dVwh+fydwxFC3w4he7J6Qfn7dR7qN5eP6wVtBaxxnWMBRYww25cRBx2GEyUJyMgVvPy/1cGYD5tRz7tZ1v/hWRernjXsjNm1yaNhKDIwwyiH4DP7qej+5hHR
 MPnUX9aXYYE8uPf4EITa80Q3GB/Pz20jwUB8/aGTlPCJjXrZgQubt3u7Snooe8Wr83FWn/yQ2dpq7gVZ/d5ORLSsr+hZSag+3QzMfYPuHO/NaMoHViidK0jv
 vnCYgFYW40daIKvV/WnO25XD6XPUpN49crIztA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 12:51 PM, Ricardo Ribalda Delgado wrote:
> HI Jacopo
> 
> (Sorry for the late reply, I have been in holidays plus with plenty of
> family matters)
> 
> On Mon, Aug 26, 2019 at 9:39 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>>
>> Hi Ricardo,
>>
>> On Fri, Aug 23, 2019 at 02:37:33PM +0200, Ricardo Ribalda Delgado wrote:
>>> A struct v4l2_area containing the width and the height of a rectangular
>>> area.
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>>  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> index a3d56ffbf4cc..c09d06ef2b08 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
>>> @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
>>>        - n/a
>>>        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
>>>       quantization matrices for stateless video decoders.
>>> +    * - ``V4L2_CTRL_TYPE_AREA``
>>> +      - n/a
>>
>> Can an area be negative ?
>> I would set these fields to ">= 0" ">= 1" and ">= 0" respectively.
>>
> 
> Dont min, max and step only make sense for integer controls?

It's up to us to define this :-)

I think it would make sense here as well where the range applies to both
width and height values. Obviously, the range will be a superset of the
range of each field separately, but it does help validation and prevent
negative values.

Regards,

	Hans

> 
>> Thanks
>>    j
>>
>>> +      - n/a
>>> +      - n/a
>>> +      - A struct :c:type:`v4l2_area`, containing the width and the height
>>> +        of a rectangular area.
>>>      * - ``V4L2_CTRL_TYPE_H264_SPS``
>>>        - n/a
>>>        - n/a
>>> --
>>> 2.23.0.rc1
>>>

