Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AFD3491C2
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 13:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCYMTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 08:19:23 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45257 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229617AbhCYMS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 08:18:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id POwvlc3h2FRvvPOwzlTE1a; Thu, 25 Mar 2021 13:18:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616674737; bh=JgK2eVmdPRsEDzvbV8SrG+ld1diXibhvRPi88fT4GUg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=B/HUVKjPr9v8zBJ80vLEf41fuPnuZ5lKQxzyz5s1turEGVOr5UtWrZA1AgJyeMwgb
         ThDI8+hthL40qNnztZdfC5eX8pC1UnhFarRE1Jay+/wNInqdd1npRZv+1Tt+c6EVw7
         Yw8Jw6Cibt5zhQvcoRXXDgBDgqd72l/Unsje3Nr0vcVoaJWfrEWdjZRju7Bnzm2VPU
         Jv8I1WGZ4oNji6urxULBf+U8rIIWkq1igLDrWw4LCaXZFiqBZ7zFhq9U+p7oQ4784X
         3s+hQskDY+r/f6WpeC85p5IwXBbQEyU0A2hWT66Q6uCgazXDEEGrLDm98YETc6qHXc
         ob9vTBZbH5NhA==
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
 <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl>
Date:   Thu, 25 Mar 2021 13:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIy++4uZUp3NDvDZ+dXrJ9mZa2eReACnoU7yxmk+/XXu5d3KHhf64mpCTxS5NPzNq7C393zOnrC09RdWWT3CzZ9sYFcfgFgEBKJzgtbKqXiK69X5ONNG
 t+YqxiQUSm0rrxOqFcAWD1E424jveD4EIsIt+GhG07Ub+MglovJv+GG+rz4v7Uk0HCR0TlTjc5/OegME6BoaexAfX9gwcBDkPaHN9WjXORkREXvyxrJKnXxG
 9cqTl+qtRUoGudN3zvLr2BAyt0VqjGg2ziimVMl6Sxk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 16:25, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> Thanks for the patch. I like how uvc is ending :)
> 
> On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
>>   report that with dev_err. If an error code is obtained, then
>>   report that with dev_dbg.
>>
>> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
>>   EACCES is a much more appropriate error code. EILSEQ will return
>>   "Invalid or incomplete multibyte or wide character." in strerror(),
>>   which is a *very* confusing message.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> ---
>> Ricardo, this too can be added to the uvc series.
>> ---
>>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
>>  1 file changed, 24 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>> index b63c073ec30e..3f461bb4eeb9 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>>                         u8 intfnum, u8 cs, void *data, u16 size)
>>  {
>>         int ret;
>> -       u8 error;
>> +       u8 error = 0;
>>         u8 tmp;
>>
>>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
>> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>>         if (likely(ret == size))
>>                 return 0;
>>
>> -       dev_dbg(&dev->udev->dev,
>> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>> -               uvc_query_name(query), cs, unit, ret, size);
>> +       ret = ret < 0 ? ret : -EPIPE;
>>
>> -       if (ret != -EPIPE)
>> -               return ret;
>> -
>> -       tmp = *(u8 *)data;
>> +       if (ret == -EPIPE) {
>> +               tmp = *(u8 *)data;
>>
>> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>> -                              UVC_CTRL_CONTROL_TIMEOUT);
>> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>> +                                      UVC_CTRL_CONTROL_TIMEOUT);
>>
>> -       error = *(u8 *)data;
>> -       *(u8 *)data = tmp;
>> +               if (ret == 1)
>> +                       error = *(u8 *)data;
>> +               *(u8 *)data = tmp;
>> +               if (ret != 1)
>> +                       ret = ret < 0 ? ret : -EPIPE;
>> +       }
>>
>> -       if (ret != 1)
>> -               return ret < 0 ? ret : -EPIPE;
>> +       if (error)
>> +               dev_dbg(&dev->udev->dev,
>> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
>> +                       uvc_query_name(query), cs, unit, error);
>> +       else
>> +               dev_err(&dev->udev->dev,
>> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>> +                       uvc_query_name(query), cs, unit, ret, size);
> 
> If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
> error is 0. And I think that you want to show a dev_err in that case.
> Maybe we can initialize error to 7 ?

I'm confused, if error == 0, then it does show dev_err.

> 
> 
>>
>> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
>> +       if (!error)
>> +               return ret;
> I think we do not want these two lines (read next comment)
>>
>>         switch (error) {
>> -       case 0:
>> -               /* Cannot happen - we received a STALL */
>> -               return -EPIPE;
>>         case 1: /* Not ready */
>>                 return -EBUSY;
>>         case 2: /* Wrong state */
>> -               return -EILSEQ;
>> +               return -EACCES;
>>         case 3: /* Power */
>>                 return -EREMOTE;
>>         case 4: /* Out of range */
> 
> Maybe we want a dev_dbg if the error code is unknown and return ret?

Make sense.

Regards,

	Hans
