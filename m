Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A2A6D2F10
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 10:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbjDAIRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 04:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbjDAIRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 04:17:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789AB7ED9
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 01:17:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 270BFB8336C
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F34BC433EF;
        Sat,  1 Apr 2023 08:17:15 +0000 (UTC)
Message-ID: <6dabaf27-1d68-b6e5-12c3-cbef79867fc1@xs4all.nl>
Date:   Sat, 1 Apr 2023 10:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Extremely long delay between CEC image-view-on an standby.
Content-Language: en-US
To:     Shawn Lindberg <shawn.lindberg@gmail.com>,
        linux-media@vger.kernel.org
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
 <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl>
 <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
 <CAC6x6it0_DU1dTO4-F-6_4akyL-ZO-JwS5CQOmaM3+k+Kon07A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAC6x6it0_DU1dTO4-F-6_4akyL-ZO-JwS5CQOmaM3+k+Kon07A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 22:23, Shawn Lindberg wrote:
> On Wed, Mar 29, 2023 at 2:56 PM Shawn Lindberg <shawn.lindberg@gmail.com> wrote:
>>
>> On Tue, Mar 28, 2023 at 2:58 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>
>>>> cec-ctl -d0 --tv --cec-version-1.4
>>>
>>> That's wrong, the RPi is a Playback device, not a TV. So use --playback instead.
>>>
>>> You should also add this line to the config.txt:
>>>
>>> hdmi_ignore_cec=1
>>>
>>> otherwise the RPi's firmware tries to process CEC messages as well.
>>
>> Oh, I thought that the TV/playback command was indicating what sort of
>> device the connected device is. This wasn't clear from the man page,
>> either. Thank you for that. I made the change to config.txt and
>> strangely when the RPi rebooted (I have it set to do this
>> automatically once a day) the projector automatically turned on. I
>> have never experienced this before.
> 
> Further update on this. I continue to see the projector automatically
> power on every time the RPi does its daily reboot, so I think I may
> have to remove the hdmi_ignore_cec from the config.txt. Especially
> since I can't figure out how to reliably shut the projector back off
> again.

From what I can tell, the Raspberry Pi doesn't transmit anything over CEC
at boot time, regardless of whether hdmi_ignore_cec is present or not.
That's with a Raspberry Pi 4B. It might be different for an RPi 3.

> 
>>>> During this time, if I try to poll the projector, it will succeed.
>>>> However, if I monitor events, after a significant amount of time
>>>> (appears to be greater than 20 minutes, although this is difficult to
>>>> verify because of how long it takes) I go will eventually see the
>>>> following:
>>>>
>>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
>>>>     Timestamp: 30981.428s
>>>
>>> Now it appears to be able to read the EDID again and it has a valid
>>> physical address.
>>>
>>>> Transmitted by Specific to Specific (14 to 14): POLL
>>>>     Tx, Not Acknowledged (4), Max Retries
>>>>     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), Max Retries
>>>>
>>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
>>>>     Timestamp: 30981.561s
>>>> Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x84):
>>>>     phys-addr: 1.0.0.0
>>>>     prim-devtype: tv (0x00)
>>>>     Sequence: 22 Tx Timestamp: 30981.696s
>>>> Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
>>>>     vendor-id: 3075 (0x00000c03)
>>>>     Sequence: 23 Tx Timestamp: 30981.835s
>>>> Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
>>>>     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
>>>>     reason: invalid-op (0x03)
>>>>     Sequence: 0 Rx Timestamp: 30981.949s
>>>> Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
>>>>     Sequence: 0 Rx Timestamp: 30982.026s
>>>> Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
>>>>     name: TV
>>>>     Sequence: 24 Tx Timestamp: 30982.137s
>>>>
>>>> After this point in time the standby command will succeed and the
>>>> projector will turn off. It's quite inconvenient to have to wait over
>>>> 20 minutes to turn the projector back off again. Any idea how I can
>>>> shorten this delay?
>>>
>>> There is something weird about your setup and EDID. I can't really tell
>>> what it is.
>>
>> After making the above changes and retesting, the behavior didn't
>> change. I still get the device not connected message and the invalid
>> physical address when I try to do standby. I should also note that one
>> way around this issue is to reboot the RPi. For some reason that seems
>> to get around the long delay in getting the physical address.
>>
>> I don't know what would be strange about my set up other than the
>> projector itself and a couple of lines I uncommented in the config.txt
>> to set the RPi to use HDMI even if the projector is not on at the time
>> of booting. Is there more information I can provide that would allow
>> us to figure out what's going on? If you are correct that for some
>> reason it is just not reading the EDID, is there a way to manually
>> provide that? I don't know much about it, but it's a static property
>> of the device (the projector in this case), right?
> 
> Since I noticed that the physical address is populated properly when
> the RPi is booted while the projector is turned on, I did that and
> then tried using the get-edid utility to see if I could read the EDID
> block and save it to a file. Unfortunately, this didn't work, as the
> utility reports that there was no EDID available on any of the buses.
> So once again I am out of ideas.

The EDID also appears in /sys:

/sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid
/sys/devices/platform/gpu/drm/card1/card1-HDMI-A-2/edid

get-edid works fine on my RPi 4B, so if that doesn't work, then it really
looks like there is something weird going on with your projector.

Regards,

	Hans
