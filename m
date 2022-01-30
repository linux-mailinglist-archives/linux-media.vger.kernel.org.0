Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E73E4A3800
	for <lists+linux-media@lfdr.de>; Sun, 30 Jan 2022 19:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236788AbiA3SM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 13:12:59 -0500
Received: from mx1.librem.one ([138.201.176.93]:57648 "EHLO mx1.librem.one"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233487AbiA3SM7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 13:12:59 -0500
Received: from smtp.librem.one (unknown [192.241.214.14])
        by mx1.librem.one (Postfix) with ESMTPS id D756F81E79;
        Sun, 30 Jan 2022 10:12:56 -0800 (PST)
Authentication-Results: name mx1.librem.one; dmarc=fail (p=none dis=none) header.from=librem.one
Authentication-Results: mx1.librem.one;
        dkim=pass (2048-bit key; unprotected) header.d=librem.one header.i=@librem.one header.b="VNPo1Roo";
        dkim-atps=neutral
Subject: Re: Get j5 WebCam JVCU100 supported by Linux UVC driver
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=librem.one; s=smtp;
        t=1643566374; bh=qgfa7HdMHVnXikJUOCJHojLNv9aoPp/DLUl1/NiCyOw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VNPo1RooxaP3eUTx6t1txIoSrBJASGTlTeLm9gXyNC+pJpP5XITTeop5pABPw4DJs
         kjkH2jxcvb/7xPu0u+T2WBzxK9CDSypX9hMsXu0YrqnGeXHh11VcJrxhldZEXZfhVg
         vGc2KKk2tvZKRzceSmpt77HUf8srsTqYUdwyUM2u1QJ5xyEch97yvgsKFFE/upA7bI
         5uD788XVHAbtuS/6vIO9h7/GLNGK5ZHE66uSqgpGEFg7Z+5KpchoJmF/+ncnGgSqlr
         iEVLjJ3R+ps0UWlC0OHqk9ObBpHhiBgnk/BsprRxpVW5nHbtg2cKuL1tZwjHmIvcei
         72DJBc1iLQoag==
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org
References: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
 <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
 <CANiDSCuLQWFxMLKj9no7-qdZMRp3AJdgZ=u8356hc7mf-6fQyA@mail.gmail.com>
 <YfPJree+wFQ1869W@pendragon.ideasonboard.com>
From:   Mohammad <moin@librem.one>
Message-ID: <38609c2c-8b15-4aa1-a1a1-c219d4ff4e83@librem.one>
Date:   Sun, 30 Jan 2022 12:12:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YfPJree+wFQ1869W@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Is there a way around this problem?  Would I have to reach out to the
device manufacturer?

On 1/28/22 4:47 AM, Laurent Pinchart wrote:
> On Fri, Jan 28, 2022 at 09:31:43AM +0100, Ricardo Ribalda wrote:
>> I received out of list the dmesg output from Mohammad
>>
>> It looks like a hardware error to me:
>>
>> [   48.729618] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
>> [   48.749361] uvcvideo: Found UVC 1.00 device j5 WebCam JVCU100 (0711:3108)
>> [   48.751876] uvcvideo: Failed to query (129) UVC probe control : -32 (exp. 26).
> A GET_CUR failure on the video probe control is indeed fairly bad. If I
> had to guess, I would suspect either an issue at the USB level, or a
> firmware bug in the webcam.
>
>> [   48.751879] uvcvideo: Failed to initialize the device (-5).
>> [   48.751930] usbcore: registered new interface driver uvcvideo
>>
>>
>> On Wed, 26 Jan 2022 at 17:23, Ricardo Ribalda wrote:
>>> Hi Mohammad
>>>
>>> Could you share the output of dmesg when you connect the device?
>>>
>>> And also lsusb -vvvv -d 0711:3108
>>>
>>>
>>> Thanks!
>>>
>>> On Wed, 26 Jan 2022 at 17:20, Mohammad wrote:
>>>> Greetings,
>>>>
>>>> I have been trying to use the j5 WebCam JVCU100 on Linux and it doesn't
>>>> function properly.  Cheese cannot seem to find it, and I did not see it
>>>> listed on your list of supported devices, so I thought I would bring it
>>>> to your attention.  Here is what I see from running lsusb:
>>>>
>>>> Bus 001 Device 006: ID 0711:3108 Magic Control Technology Corp. j5
>>>> WebCam JVCU100
>>>>
>>>> Also, running lsusb -d 0711:3108 -v | grep "14 Video" returns
>>>>
>>>> Couldn't open device, some information will be missing
>>>>       bFunctionClass         14 Video
>>>>       bInterfaceClass        14 Video
>>>>       bInterfaceClass        14 Video
>>>>       bInterfaceClass        14 Video
>>>>       bInterfaceClass        14 Video
>>>>
>>>> So, looks like the Linux UVC driver at least recognizes the webcam.
>>>> Please let me know if you can help with this, thanks!
>>>>
>>>> Regards,
>>>>
>>>> Mohammad
