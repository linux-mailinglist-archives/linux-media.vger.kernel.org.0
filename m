Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73276E7381
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 08:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjDSGtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 02:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjDSGtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 02:49:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCFD113
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 23:48:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A7FC62C43
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 06:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BE3C433EF;
        Wed, 19 Apr 2023 06:48:56 +0000 (UTC)
Message-ID: <85954ff0-4165-43a4-37ec-610d06668ee7@xs4all.nl>
Date:   Wed, 19 Apr 2023 08:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        regressions@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
 <7bcc8593-a98d-6faa-2ec5-3cf59137cbcb@xs4all.nl>
 <20230405064020.GZ9915@pendragon.ideasonboard.com>
 <20230419062359.GA13848@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230419062359.GA13848@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2023 08:23, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Apr 05, 2023 at 09:40:20AM +0300, Laurent Pinchart wrote:
>> On Wed, Mar 29, 2023 at 07:20:59PM +0200, Hans Verkuil wrote:
>>> On 29/03/2023 18:05, Ricardo Ribalda wrote:
>>>> Hi Hans
>>>>
>>>> Thanks for the patch.
>>>>
>>>> I believe the user can fetch this info from lsusb, so this is kind of
>>>> duplicated info, and this is why it was removed.
>>>
>>> You got to set some description, so using the GUID this seems best.
>>>
>>>> Is there an app that uses this unknown format code ? Or the only
>>>> complaint is that WARN() is too loud for the user?
>>>
>>> Normally drivers do not pass on unknown formats, but if a driver does,
>>> then I want a WARN. If a driver does this legitimately (and I understand
>>> that's the case for UVC), then the driver should fill in the description
>>> to avoid this WARN.
>>
>> In hindsight we shouldn't have added a text description to formats :-)
>>
>>>> On Wed, 29 Mar 2023 at 14:39, Hans Verkuil wrote:
>>>>>
>>>>> If the fcc is 0 (indicating an unknown GUID format), then fill in the
>>>>> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
>>>>> ---
>>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>>>> index 7aefa76a42b3..2f1ced1212cd 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>>>> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>>>>>                 } else {
>>>>>                         dev_info(&streaming->intf->dev,
>>>>>                                  "Unknown video format %pUl\n", &buffer[5]);
>>>>> +                       snprintf(format->name, sizeof(format->name), "%pUl\n",
>>>>> +                                &buffer[5]);
>>>> Don't we need at least 38 chars for this?
>>>
>>> Yes. But all we have is 31 chars, so we take what we can :-)
>>>
>>> This is what uvc did before this was removed.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> https://docs.kernel.org/core-api/printk-formats.html#uuid-guid-addresses
>>>>
>>>>> +
>>>>>                         format->fcc = 0;
>>>>>                 }
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> index 35453f81c1d9..fc6f9e7d8506 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>>>>>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>>>>>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>>>>>         fmt->pixelformat = format->fcc;
>>>>> +       if (format->name[0])
>>>>> +               strscpy(fmt->description, format->name,
>>>>> +                       sizeof(fmt->description));
>>>>> +
>>>>>         return 0;
>>>>>  }
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>>>> index 9a596c8d894a..22656755a801 100644
>>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>>>> @@ -264,6 +264,8 @@ struct uvc_format {
>>>>>         u32 fcc;
>>>>>         u32 flags;
>>>>>
>>>>> +       char name[32];
>>>>> +
>>
>> I'd not really nice to have to store the name for every format, when we
>> know it will very rarely be used.
>>
>> One alternative option would be to store the GUID, which would halve the
>> amount of memory. Another option would be to stop reporting those
>> formats to userspace in uvc_ioctl_enum_fmt(). They can't be selected
>> anyway, they have no unique 4CC.
> 
> Any opinion on this ? I'm increasingly tempted by not reporting
> unsupported formats to userspace.

Since they cannot be selected, I think that is the best approach.
Perhaps only show them in the kernel log if debugging is enabled.

Regards,

	Hans

> 
>>>>>         unsigned int nframes;
>>>>>         struct uvc_frame *frame;
>>>>>  };
> 

