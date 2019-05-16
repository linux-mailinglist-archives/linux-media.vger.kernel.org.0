Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5EF203C1
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 12:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfEPKkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 06:40:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42829 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbfEPKkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 06:40:53 -0400
Received: from [IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919] ([IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RDobhFLI43qlsRDofhJXO9; Thu, 16 May 2019 12:40:51 +0200
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl>
 <ca0e2c94-cca9-567f-5376-f302f79f4ba7@linaro.org>
 <CAAFQd5DBUUAPV0_=thmRBTFqJE+Nd4LZRzZE20rR0D8d7Cjz5g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cd7baea0-3893-7471-2e86-9cc6730843e3@xs4all.nl>
Date:   Thu, 16 May 2019 12:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DBUUAPV0_=thmRBTFqJE+Nd4LZRzZE20rR0D8d7Cjz5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC+pZ2cLL5l2NoiBDT5OW7alsgmlwSoHeajG/jN5qLCRulIzhbjF3XyUAcun4KZfinyIJJuo39QnHsIYprgmoq21cRVYRrpfT0gKF18m++gZp+JB1Szf
 5iShmic5kPvsHGh6BbNgf4g3h7nVs2sfWfhYssh9ui8ZiNftgsMQ6K9L9FlxITHoBTpRyOXEiOGpV2vsNktg7QkSoUxeFduhQoAPg5vAv0sf36FZgeLpv2M/
 7gXmfjzJ+IK0TIDkPl9wpCRFLrBuc8/GA10BPah1a1N85xJhPtCqICMguyzxXH2Er+l31K0GXsZPvYEo53hvDarqvhnHsuzCgmJdRtUWY1iPa6SrjiUJvVfR
 hTY2ncAtJlA3F3RhY52TCQvCuIVuEUmMYDYeu46loTn7zJJf/pMaqrDFxyt9ebZmWDBvdXawhW8MbziQRSwfzmunREFGHpk9c3r+AX1xHK5tn1Oe/3avuKe5
 NrKitm6MFNYjDEPU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/16/19 11:56 AM, Tomasz Figa wrote:
> On Thu, May 16, 2019 at 5:09 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Hans,
>>
>> On 5/14/19 11:54 AM, Hans Verkuil wrote:
>>> Hi Stanimir,
>>>
>>> On 4/12/19 5:59 PM, Stanimir Varbanov wrote:
>>>> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
>>>> field description to allow v4l clients to set bigger image size
>>>> in case of variable length compressed data.
>>>
>>> I've been reconsidering this change. The sizeimage value in the format
>>> is the minimum size a buffer should have in order to store the data of
>>> an image of the width and height as described in the format.
>>>
>>> But there is nothing that prevents userspace from calling VIDIOC_CREATEBUFS
>>> instead of VIDIOC_REQBUFS to allocate larger buffers.
>>
>> Sometimes CREATEBUFS cannot be implemented for a particular fw/hw.
>>
>> CC: Tomasz for his opinion.
>>
> 
> Thanks Stanimir.
> 
> Actually, if called at the same point in time as REQBUFS, CREATE_BUFS
> doesn't really differ to much, except that it gives more flexibility
> for allocating the buffers and that shouldn't depend on any specific
> features of hardware or firmware.
> 
> Actually, one could even allocate any buffers any time regardless of
> hardware/firmware support, but the ability to use such buffers would
> actually depend on such.
> 
> Perhaps we should just let the drivers return -EBUSY from CREATE_BUFS
> if called at the wrong time?
> 
>>>
>>> So do we really need this change?
>>>
> 
> Yes, because this has worked like this all the time, but it was just
> not documented. Disallowing this would break quite a bit of existing
> userspace.

Which drivers allow this today? I think that would be useful information
for the commit log of a v4 of this patch.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>> The more I think about this, the more uncomfortable I become with this change.
>>>
>>> Regards,
>>>
>>>       Hans
>>>
>>
>> <cut>
>>
>> --
>> regards,
>> Stan

