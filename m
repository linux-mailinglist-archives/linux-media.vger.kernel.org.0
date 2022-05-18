Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A0952AF97
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 03:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbiERBEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 21:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiERBEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 21:04:11 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA52954035
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 18:04:08 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 850CD240026
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 03:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1652835846; bh=Yzj2jfQTSnlvNtQCnHTE+LNOwDjLaI2iPbYzvKLwPdY=;
        h=Date:Subject:From:To:Cc:From;
        b=T29WModXAHBLJFMiVf7rJpghFHKTGxfZcGs+e8bANtxYYlw2XLQM8G0OMuuyhpFZl
         27z3RS/7OKY2uZm//wdEm0jYGEAB6RkyPn412vzW5YWQX7fR7+F7qhRnhYxfCINGNY
         GcdxDqFO4OTcb9Ry7Z5uArey2M2vrciOe8wZzjHBkGIsGRXPbx8o4UVax3FHn6bsXz
         qXD6RF9d+LhiOMKgI9dHx843kJrYh1F4qZVM92RgAzJXrdMIi6NRsPCJwY2Xb6WBqi
         kw/bs321/w5sfl6IUCjJAPDBiMFi3H1BE4l+brceV+XsTnm4vaeF68H1Gf1zI05mD5
         Ekj7E5ASTLwUw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4L2vrk024gz6tnw;
        Wed, 18 May 2022 03:04:05 +0200 (CEST)
Message-ID: <08922b18-87af-eb3b-0e8e-67d33fbbebe4@posteo.de>
Date:   Wed, 18 May 2022 01:04:05 +0000
MIME-Version: 1.0
Subject: Re: game capture usb device stops working
Content-Language: en-US
From:   =?UTF-8?Q?Alexander_Wipperf=c3=bcrth?= <wpprfrth@posteo.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <dc489dbf-fbd0-db97-009d-df3eb94860fb@posteo.de>
 <YoQv1CTNTInprDXd@pendragon.ideasonboard.com>
 <7412d089-1276-5fda-bfb6-ea90a6b5c15b@posteo.de>
In-Reply-To: <7412d089-1276-5fda-bfb6-ea90a6b5c15b@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_NOVOWEL,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I want to add a more detailed description now that I monitored the log a 
bit.

I am running Linux 5.17.7.

This is what happens after the device stopped responding at all and when 
I reconnected it to my front usb 3.0 port, this would not stop and 
continue until I disconnected the device completely from the port.

#plug in

[19742.491916] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 24 ep 0
[19742.491920] xhci_hcd 0000:02:00.0: @000000010a170060 ec931000 
00000001 04000008 18018000
[19742.491966] usb 2-3: Device not responding to setup address.
[19742.699447] usb 2-3: device not accepting address 19, error -71
[19742.702600] usb usb2-port3: attempt power cycle
[19743.125915] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 26 ep 0
[19743.125920] xhci_hcd 0000:02:00.0: @000000010a170700 ec931000 
00000001 04000008 1a018000
[19743.125999] usb 2-3: Device not responding to setup address.
[19743.331914] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 27 ep 0
[19743.331919] xhci_hcd 0000:02:00.0: @000000010a1700e0 ec931000 
00000001 04000008 1b018001
[19743.331999] usb 2-3: Device not responding to setup address.
[19743.539448] usb 2-3: device not accepting address 20, error -71
[19743.718913] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 29 ep 0
[19743.718916] xhci_hcd 0000:02:00.0: @000000010a1703d0 ec931000 
00000001 04000008 1d018000
[19743.718997] usb 2-3: Device not responding to setup address.
[19743.923912] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 30 ep 0
[19743.923915] xhci_hcd 0000:02:00.0: @000000010a170ac0 ec931000 
00000001 04000008 1e018000
[19743.923997] usb 2-3: Device not responding to setup address.
[19744.131451] usb 2-3: device not accepting address 21, error -71
[19744.134606] usb usb2-port3: unable to enumerate USB device
[19744.718911] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 32 ep 0
[19744.718916] xhci_hcd 0000:02:00.0: @000000010a170830 ec931000 
00000001 04000008 20018000
[19744.718962] usb 2-3: Device not responding to setup address.
[19744.923910] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 33 ep 0
[19744.923913] xhci_hcd 0000:02:00.0: @000000010a170870 ec931000 
00000001 04000008 21018000
[19744.923958] usb 2-3: Device not responding to setup address.
[19745.131456] usb 2-3: device not accepting address 22, error -71
[19745.311909] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 35 ep 0
[19745.311913] xhci_hcd 0000:02:00.0: @000000010a1708e0 ec931000 
00000001 04000008 23018000
[19745.311959] usb 2-3: Device not responding to setup address.
[19745.523910] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 36 ep 0
[19745.523913] xhci_hcd 0000:02:00.0: @000000010a170920 ec931000 
00000001 04000008 24018000
[19745.523959] usb 2-3: Device not responding to setup address.
[19745.731462] usb 2-3: device not accepting address 23, error -71
[19745.734620] usb usb2-port3: attempt power cycle
[19746.157909] xhci_hcd 0000:02:00.0: ERROR Transfer event for disabled 
endpoint slot 39 ep 0
[19746.157913] xhci_hcd 0000:02:00.0: @000000010a1709a0 ec931000 
00000001 04000008 27018000
[19746.157958] usb 2-3: Device not responding to setup address.
[19746.363831] usb 2-3: Device not responding to setup address.
[19746.571468] usb 2-3: device not accepting address 24, error -71

#plug out

Then I plugged it into a different usb 3.0 port but this time on the back

[19938.950687] usb 4-3: new SuperSpeed USB device number 2 using xhci_hcd
[19938.964090] usb 4-3: LPM exit latency is zeroed, disabling LPM.
[19938.964687] usb 4-3: New USB device found, idVendor=0fd9, 
idProduct=006a, bcdDevice= 0.01
[19938.964691] usb 4-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=4
[19938.964693] usb 4-3: Product: Game Capture HD60 S+
[19938.964695] usb 4-3: Manufacturer: Elgato
[19938.964697] usb 4-3: SerialNumber: 000451B08E000
[19939.056053] uvcvideo 4-3:1.1: Unknown video format 
30313050-0000-0010-8000-00aa00389b71
[19939.056059] usb 4-3: Found UVC 1.10 device Game Capture HD60 S+ 
(0fd9:006a)
[19939.085464] uvcvideo 4-3:1.0: Entity type for entity Input 1 was not 
initialized!
[19939.085518] input: Game Capture HD60 S+: Game Capt as 
/devices/pci0000:00/0000:00:08.1/0000:2d:00.3/usb4/4-3/4-3:1.0/input/input43
[19939.086225] hid-generic 0003:0FD9:006A.0019: hiddev103,hidraw13: USB 
HID v1.01 Device [Elgato Game Capture HD60 S+] on usb-0000:2d:00.3-3/input2
[20001.273966] xhci_hcd 0000:2d:00.3: WARN Event TRB for slot 3 ep 2 
with no TDs queued?
[20001.290966] xhci_hcd 0000:2d:00.3: WARN Event TRB for slot 3 ep 2 
with no TDs queued?
[20001.298312] uvcvideo 4-3:1.1: Non-zero status (-71) in video 
completion handler.

here I changed the setting for "Use Buffering" from on to off

[20007.762947] uvcvideo 4-3:1.1: Failed to set UVC probe control : -32 
(exp. 34).

uvcvideo 4-3:1.1: Failed to set UVC probe control : -32 (exp. 34) this 
is happening everytime I change a setting, I have to reconnect the 
device, open OBS one time, close it and reopen it until I can see video 
again.

Not sure if this helps, but this is what dmesg gives me


On 18.05.22 01:35, Alexander Wipperfürth wrote:
> Hi Laurent,
>
> Right now I have the following scenario, after re-plugging it in for 3 
> times it started working again as it should, then I changed the 
> setting for Video Format and I get the following in the kernel log:
>
> [15207.692208] uvcvideo 2-4:1.1: Failed to set UVC probe control : -32 
> (exp. 34).
>
> On 18.05.22 01:29, Laurent Pinchart wrote:
>> Hi Alexander,
>>
>> On Tue, May 17, 2022 at 08:34:18PM +0000, Alexander Wipperfürth wrote:
>>> Hello, today I got a usb capture card (Elgato HD60 S+) which is uvc
>>> compatible and the first time I connected it to my computer it was
>>> immediately recognized and the video from the game console was 
>>> displayed
>>> in OBS, but when I change any setting in the configuration menu the
>>> device stops working, no video will be displayed anymore, I have to 
>>> plug
>>> it in and out multiple times until it starts showing video again, I 
>>> hope
>>> with me stating this issue here someone maybe knows a solution or
>>> explanation why this could happen.
>>>
>>> Is there anything I should provide that may be useful?
>> Are there any messages printed to the kernel log when this occurs ?
>>
