Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2903A193AA7
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 09:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgCZIRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 04:17:02 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41681 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727821AbgCZIRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 04:17:01 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HNh9jRVkrLu1fHNhCj2KAP; Thu, 26 Mar 2020 09:16:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585210619; bh=IdHvLiex0OKHR3v/yq/bT44NRwc/GzOlOdVvGMv56YU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OC7eHg5//Kl6DYiIEwTog6H6Wi+FwYyD1qoYfbF1JoIdul10J/0Nh+t/EvgB9LTT0
         EBmCECyQ+Sp3F2xkGxsd6wp3gVFoFQTivqRYQsRcNPO8DwEFRj1cHr6JFeW76xhJlY
         so1URjc8OLI9vxMTdehbernUtK6P/s+OJsS11Dy233sGX2QAY5h8AYVP3Ymu3gbRkK
         4puTFTKL0heL4HmGxl5hovkPgrvPjDqkPMtv1NxJavCmwO6+/lhungAx48lWiho41O
         8gNbHc1ow5tEYxz0SDO+zxMLOmqEmBlagepzzJisjl+6e2fJIs47tsbV01A1lLb/+r
         MZyI8SCH7+nJw==
Subject: Re: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
To:     Seungchul Kim <sc377.kim@samsung.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20200323023045epcas2p12007502edd2a65efcccb00eb899d5532@epcas2p1.samsung.com>
 <000601d600bb$0e2d4320$2a87c960$@samsung.com>
 <1a0ad24c-e577-e6d2-32ca-514a645b008f@xs4all.nl>
 <007b01d60316$7e554690$7affd3b0$@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3e38fc75-f555-7d91-2561-9c95f76694d1@xs4all.nl>
Date:   Thu, 26 Mar 2020 09:16:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <007b01d60316$7e554690$7affd3b0$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMtHPk9IgeYpRmxlKLFIYSoByU7M3rcWzdealPyxlyt1KNs8SKdEEiW0sYY+3yHUViqvjEQzXM6c6hoUNXQAY7ZGub+nezIKIhYlQxA7TsGY8vX86CmS
 VT6VPkfj9SfLhTFPwUAMkqCxRc6OzHRWSJ9SWOFSS6nyWOO0gNhABCtGecZeQtb4cNQmo3BN67VS5Fa1rbA/4d7pyMrDOyEpGAKwo42ee1HVSOLdt0yzpHu1
 hbJVxPRbOPoyMqekQdcYgWQ3oX3/yzHTl6850R2t/SRdXM+wTPfKRWYg2icgvHY1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/26/20 3:30 AM, Seungchul Kim wrote:
> On 3/25/20 5:54 PM, Hans Verkuil wrote:
>> On 3/23/20 3:30 AM, Seungchul Kim wrote:
>>> v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
>>> If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make the
>>> mismatch of v4l2_fh sturct.
>>>
>>> By the mismatch, the following error occurs.
>>> ===============================
>>> [    7.533506] v4l2_mem2mem: disagrees about version of symbol
>> video_devdata
>>> [    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
>>> [    7.535319] v4l2_mem2mem: disagrees about version of symbol
>>> v4l2_event_pending
>>> [    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
>>> ===============================
>>>
>>> So v4l2_fh struct is modified to does not have dependency for
>>> CONFIG_V4L2_MEM2MEM_DEV.
>>>
>>> Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
>>> ---
>>>  include/media/v4l2-fh.h | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h index
>>> 53b4dbb..b5b3e00 100644
>>> --- a/include/media/v4l2-fh.h
>>> +++ b/include/media/v4l2-fh.h
>>> @@ -53,9 +53,7 @@ struct v4l2_fh {
>>>  	unsigned int		navailable;
>>>  	u32			sequence;
>>>
>>> -#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
>>>  	struct v4l2_m2m_ctx	*m2m_ctx;
>>> -#endif
>>
>> This is a good change, but please also remove the same #if from
>> v4l2_ioctl_get_lock() in drivers/media/v4l2-core/v4l2-ioctl.c. That is now
>> no longer needed there either and without removing that those vendor
>> drivers would be using the wrong lock.
>>
>> Regards,
>>
>> 	Hans
> 
> Thank you for your comment. I worried about the same thing with you.
> But vfh->m2m_ctx on v4l2_ioctl_get_lock() is always null
> without CONFIG_V4L2_MEM2MEM_DEV, because m2m_ctx of v4l2-fh
> is initialized only in v4l2_mem2mem.c.
> Therefore it doesn't have a problem using an wrong lock
> regardless of modification, so I did not fix it.

It is: if your out-of-tree driver sets CONFIG_V4L2_MEM2MEM_DEV, then
I assume it will set vfh->m2m_ctx, and so the v4l2 core should also
return the right lock for that out-of-tree driver.

But in any case, if m2m_ctx is always part of v4l2-fh.h, then that
#if in v4l2-ioctl.c has become pointless and should be removed in any
case.

Regards,

	Hans
