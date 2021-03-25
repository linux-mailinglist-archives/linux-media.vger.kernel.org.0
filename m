Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09B0349395
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 15:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhCYODj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 10:03:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36885 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231344AbhCYODe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 10:03:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PQa8lEOF0UzyrPQaClVqSF; Thu, 25 Mar 2021 15:03:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616681012; bh=ugUybBJc0SQbgRW4Y26f8ODe8SU5WYsUFSuPVm9YnJ8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DJYLsqN721Tbvj7826d1hlrYxR8wFiBbafgjuEoRy0vyCqohL3pNXdecMZdKqZVAF
         CmrTb1A8IzOgbbbjFVKn3ocKj+A36YPqO1LSRXqofdiv5P+KT0kBCR3q2s+KPkFPQb
         W6y+KFxN6WPfxN6UCi1gKCzBbkHogZ+UheE32I6cU8QB8T3l4D9u4OcSxrBHkgHsyb
         xsX54jJQcNoKmFTTUQLpHMMEyeetMZHjpVUEkfXj6Sg01GmTAGIgIFFDULoylc/sUg
         V24sipXleboIaKPqlawHd8ot67Y/LwpJ5ubDN1K8e4gXnLUe9XpNeMcMjsAWkNlewF
         eN3d+ira/MGDw==
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
 <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
 <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl>
 <CANiDSCvWG-iyj9wAaKKKT-6n=ngEW8dN0Mx0VcTWTktzt7nCdw@mail.gmail.com>
 <8a265a15-c9f6-bea4-1a38-df675a977e8c@xs4all.nl>
 <CANiDSCvy_FyxQXv+04u0b9vp1mF7TB_e6XGmSWYM6VoYVrDPHA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fa87cc48-db19-fa22-a7fe-4eb9d7483cfe@xs4all.nl>
Date:   Thu, 25 Mar 2021 15:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANiDSCvy_FyxQXv+04u0b9vp1mF7TB_e6XGmSWYM6VoYVrDPHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCt6VcVm+mv7PGc+UABJG5oDhvu6GIBw/zTf6iuA70iWroUVd/p5fSAgnfSGSavh6EqC8GIQK06mvq5k+pw9Sk3Zk1EMo/sEL29/hbVlNJj0eKb7ZYpP
 VXzOzkXq06QATVcEimSPyvx0upmZVqC2mC9Sv2wSIrF6KUuSiGbccfmgpywo1mE2HTFinWUiC/BEAmAjLt4aBLlvNZF8zCwDoWGFRb3GUPaOvPQcuk0o+v0v
 AzHtMptrUvLY8Xxq/YLJxRY7Xbc9Iaj8n7+TUiRn4Ek=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2021 15:02, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Thu, Mar 25, 2021 at 2:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 25/03/2021 14:54, Ricardo Ribalda wrote:
>>> hi Hans
>>>
>>> On Thu, Mar 25, 2021 at 1:18 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> On 23/03/2021 16:25, Ricardo Ribalda Delgado wrote:
>>>>> Hi Hans
>>>>>
>>>>> Thanks for the patch. I like how uvc is ending :)
>>>>>
>>>>> On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>>>
>>>>>> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
>>>>>>   report that with dev_err. If an error code is obtained, then
>>>>>>   report that with dev_dbg.
>>>>>>
>>>>>> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
>>>>>>   EACCES is a much more appropriate error code. EILSEQ will return
>>>>>>   "Invalid or incomplete multibyte or wide character." in strerror(),
>>>>>>   which is a *very* confusing message.
>>>>>>
>>>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>> ---
>>>>>> Ricardo, this too can be added to the uvc series.
>>>>>> ---
>>>>>>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
>>>>>>  1 file changed, 24 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>>>>>> index b63c073ec30e..3f461bb4eeb9 100644
>>>>>> --- a/drivers/media/usb/uvc/uvc_video.c
>>>>>> +++ b/drivers/media/usb/uvc/uvc_video.c
>>>>>> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>>>>>>                         u8 intfnum, u8 cs, void *data, u16 size)
>>>>>>  {
>>>>>>         int ret;
>>>>>> -       u8 error;
>>>>>> +       u8 error = 0;
>>>>>>         u8 tmp;
>>>>>>
>>>>>>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
>>>>>> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>>>>>>         if (likely(ret == size))
>>>>>>                 return 0;
>>>>>>
>>>>>> -       dev_dbg(&dev->udev->dev,
>>>>>> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>>>>>> -               uvc_query_name(query), cs, unit, ret, size);
>>>>>> +       ret = ret < 0 ? ret : -EPIPE;
>>>>>>
>>>>>> -       if (ret != -EPIPE)
>>>>>> -               return ret;
>>>>>> -
>>>>>> -       tmp = *(u8 *)data;
>>>>>> +       if (ret == -EPIPE) {
>>>>>> +               tmp = *(u8 *)data;
>>>>>>
>>>>>> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>>>>>> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>>>>>> -                              UVC_CTRL_CONTROL_TIMEOUT);
>>>>>> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>>>>>> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>>>>>> +                                      UVC_CTRL_CONTROL_TIMEOUT);
>>>>>>
>>>>>> -       error = *(u8 *)data;
>>>>>> -       *(u8 *)data = tmp;
>>>>>> +               if (ret == 1)
>>>>>> +                       error = *(u8 *)data;
>>>>>> +               *(u8 *)data = tmp;
>>>>>> +               if (ret != 1)
>>>>>> +                       ret = ret < 0 ? ret : -EPIPE;
>>>>>> +       }
>>>>>>
>>>>>> -       if (ret != 1)
>>>>>> -               return ret < 0 ? ret : -EPIPE;
>>>>>> +       if (error)
>>>>>> +               dev_dbg(&dev->udev->dev,
>>>>>> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
>>>>>> +                       uvc_query_name(query), cs, unit, error);
>>>>>> +       else
>>>>>> +               dev_err(&dev->udev->dev,
>>>>>> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>>>>>> +                       uvc_query_name(query), cs, unit, ret, size);
>>>>>
>>>>> If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
>>>>> error is 0. And I think that you want to show a dev_err in that case.
>>>>> Maybe we can initialize error to 7 ?
>>>>
>>>> I'm confused, if error == 0, then it does show dev_err.
>>>
>>> My bad.
>>>
>>> Ignore the message.
>>>
>>> Can we write it as ?:
>>>
>>> if (!error) {
>>>   dev_dbg(&dev->udev->dev,
>>>  "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
>>>  uvc_query_name(query), cs, unit, error);
>>>  return ret;
>>> }
>>>
>>> dev_err(&dev->udev->dev,
>>> "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>>> uvc_query_name(query), cs, unit, ret, size);
>>
>> Sure! Just take this patch as inspiration :-)
> 
> Do you mind if I modify it before resend?

No problem, feel free!

	Hans

>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>
>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
>>>>>> +       if (!error)
>>>>>> +               return ret;
>>>>> I think we do not want these two lines (read next comment)
>>>>>>
>>>>>>         switch (error) {
>>>>>> -       case 0:
>>>>>> -               /* Cannot happen - we received a STALL */
>>>>>> -               return -EPIPE;
>>>>>>         case 1: /* Not ready */
>>>>>>                 return -EBUSY;
>>>>>>         case 2: /* Wrong state */
>>>>>> -               return -EILSEQ;
>>>>>> +               return -EACCES;
>>>>>>         case 3: /* Power */
>>>>>>                 return -EREMOTE;
>>>>>>         case 4: /* Out of range */
>>>>>
>>>>> Maybe we want a dev_dbg if the error code is unknown and return ret?
>>>>
>>>> Make sense.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>
>>>
>>>
>>
> 
> 

