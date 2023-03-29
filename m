Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5C86CF0E9
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 19:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjC2RVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 13:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjC2RVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 13:21:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4131A6187
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 10:21:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9CB161DD2
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 17:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B50C433D2;
        Wed, 29 Mar 2023 17:21:00 +0000 (UTC)
Message-ID: <7bcc8593-a98d-6faa-2ec5-3cf59137cbcb@xs4all.nl>
Date:   Wed, 29 Mar 2023 19:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/03/2023 18:05, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for the patch.
> 
> I believe the user can fetch this info from lsusb, so this is kind of
> duplicated info, and this is why it was removed.

You got to set some description, so using the GUID this seems best.

> Is there an app that uses this unknown format code ? Or the only
> complaint is that WARN() is too loud for the user?

Normally drivers do not pass on unknown formats, but if a driver does,
then I want a WARN. If a driver does this legitimately (and I understand
that's the case for UVC), then the driver should fill in the description
to avoid this WARN.

> 
> Regards!
> 
> On Wed, 29 Mar 2023 at 14:39, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> If the fcc is 0 (indicating an unknown GUID format), then fill in the
>> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
>> ---
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index 7aefa76a42b3..2f1ced1212cd 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>>                 } else {
>>                         dev_info(&streaming->intf->dev,
>>                                  "Unknown video format %pUl\n", &buffer[5]);
>> +                       snprintf(format->name, sizeof(format->name), "%pUl\n",
>> +                                &buffer[5]);
> Don't we need at least 38 chars for this?

Yes. But all we have is 31 chars, so we take what we can :-)

This is what uvc did before this was removed.

Regards,

	Hans

> 
> https://docs.kernel.org/core-api/printk-formats.html#uuid-guid-addresses
> 
> 
>> +
>>                         format->fcc = 0;
>>                 }
>>
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index 35453f81c1d9..fc6f9e7d8506 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>>         fmt->pixelformat = format->fcc;
>> +       if (format->name[0])
>> +               strscpy(fmt->description, format->name,
>> +                       sizeof(fmt->description));
>> +
>>         return 0;
>>  }
>>
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 9a596c8d894a..22656755a801 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -264,6 +264,8 @@ struct uvc_format {
>>         u32 fcc;
>>         u32 flags;
>>
>> +       char name[32];
>> +
>>         unsigned int nframes;
>>         struct uvc_frame *frame;
>>  };
>>
> 
> 
> --
> Ricardo Ribalda

