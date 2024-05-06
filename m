Return-Path: <linux-media+bounces-10899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CC8BD2BE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4CC91C20C6A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E90156658;
	Mon,  6 May 2024 16:25:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C31552F7;
	Mon,  6 May 2024 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012740; cv=none; b=FHwQe+HXFUtWHcoV1I2z9es3xCEez4tGXLRECom8ci0Ml2jzYMkH/z+xQALdIjIS+Tx6fwryTLJz+Q/PURri/Y2wGBMRx9tKYrdU+idvYJqRu9Zk8zZqlrgrQH+rIRFTzhcPAH1xfciu3Le/HQkdcni9l2Q8SrXF29QqVfEWKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012740; c=relaxed/simple;
	bh=HwXXvnTSAjBtb3nUUNbI1pXc+fvdXm2U1A1Utn5FKys=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ww55/WEy6B4BsqFFAcgIwUFBLg2DeH+NWedLdVu6ffbVaa1J5ZQtB7QwUm6T9DOgntUVciNAx8AMa2p5WJfNYFvFtkurr5KAgJkcqT5te43ijXiVXKoLqTZr5y19qwFLEcY1vmZjWjyvglxKGKyco8T589GKdvccL/O8/6DOhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 6 May
 2024 19:25:43 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 6 May 2024
 19:25:25 +0300
Message-ID: <3f1de1c6-e7bb-4132-a4cb-b80252d3f8b3@fintech.ru>
Date: Mon, 6 May 2024 09:25:23 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: usb: siano: fix endpoint checks in
 smsusb_init_device()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dongliang Mu <dzm91@hust.edu.cn>,
	Andrew Morton <akpm@linux-foundation.org>, Alan Stern
	<stern@rowland.harvard.edu>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<syzbot+12002a39b8c60510f8fb@syzkaller.appspotmail.com>
References: <20240409143634.33230-1-n.zhandarovich@fintech.ru>
 <20240503165833.4781fb4a@sal.lan>
 <4069e01b-09d1-49e6-b053-3f6b99dd9405@fintech.ru>
 <20240503222054.45ed636f@sal.lan>
Content-Language: en-US
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <20240503222054.45ed636f@sal.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi Mauro,

On 5/3/24 14:20, Mauro Carvalho Chehab wrote:
> Em Fri, 3 May 2024 09:14:37 -0700
> Nikita Zhandarovich <n.zhandarovich@fintech.ru> escreveu:
> 
>> Hi
>>
>> On 5/3/24 08:58, Mauro Carvalho Chehab wrote:
>>> Em Tue, 9 Apr 2024 07:36:34 -0700
>>> Nikita Zhandarovich <n.zhandarovich@fintech.ru> escreveu:
>>>   
>>>> Syzkaller reported a warning [1] in smsusb_submit_urb() which occurs
>>>> if an attempt is made to send a bulk URB using the wrong endpoint
>>>> type. The current approach to perform endpoint checking does not
>>>> explicitly check if an endpoint in question has its type set to bulk.
>>>>
>>>> Fix this issue by using functions usb_endpoint_is_bulk_XXX() to
>>>> enable testing for correct ep types.
>>>>
>>>> This patch has not been tested on real hardware.
>>>>
>>>> [1] Syzkaller report:
>>>> usb 1-1: string descriptor 0 read error: -71
>>>> smsusb:smsusb_probe: board id=2, interface number 0
>>>> smsusb:siano_media_device_register: media controller created
>>>> ------------[ cut here ]------------
>>>> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
>>>> WARNING: CPU: 0 PID: 3147 at drivers/usb/core/urb.c:494 usb_submit_urb+0xacd/0x1550 drivers/usb/core/urb.c:493
>>>> ...
>>>> Call Trace:
>>>>  smsusb_start_streaming+0x16/0x1d0 drivers/media/usb/siano/smsusb.c:195
>>>>  smsusb_init_device+0xd85/0x12d0 drivers/media/usb/siano/smsusb.c:475
>>>>  smsusb_probe+0x496/0xa90 drivers/media/usb/siano/smsusb.c:566
>>>>  usb_probe_interface+0x633/0xb40 drivers/usb/core/driver.c:396
>>>>  really_probe+0x3cb/0x1020 drivers/base/dd.c:580
>>>>  driver_probe_device+0x178/0x350 drivers/base/dd.c:763
>>>> ...
>>>>  hub_event+0x48d/0xd90 drivers/usb/core/hub.c:5644
>>>>  process_one_work+0x833/0x10c0 kernel/workqueue.c:2276
>>>>  worker_thread+0xac1/0x1300 kernel/workqueue.c:2422
>>>>  kthread+0x39a/0x3c0 kernel/kthread.c:313
>>>>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>>>>
>>>> Reported-and-tested-by: syzbot+12002a39b8c60510f8fb@syzkaller.appspotmail.com
>>>> Fixes: 31e0456de5be ("media: usb: siano: Fix general protection fault in smsusb")
>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>>> ---
>>>>  drivers/media/usb/siano/smsusb.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
>>>> index 723510520d09..daaac121c670 100644
>>>> --- a/drivers/media/usb/siano/smsusb.c
>>>> +++ b/drivers/media/usb/siano/smsusb.c
>>>> @@ -405,10 +405,10 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
>>>>  		struct usb_endpoint_descriptor *desc =
>>>>  				&intf->cur_altsetting->endpoint[i].desc;
>>>>  
>>>> -		if (desc->bEndpointAddress & USB_DIR_IN) {
>>>> +		if (usb_endpoint_is_bulk_in(desc)) {
>>>>  			dev->in_ep = desc->bEndpointAddress;
>>>>  			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
>>>> -		} else {
>>>> +		} else if (usb_endpoint_is_bulk_out(desc)) {  
>>>
>>> Did you test it on what devices? I'm not sure if all siano devices
>>> are bulk. Why did you decide to use usb_endpoint_is_bulk_(in|out)
>>> instead of usb_endpoint_dir_(in|out)?  
>>
>> I did not have the hardware required to test it properly, I'm afraid.
>> I made sure to point that out in the patch description.
>>
>> As for siano devices possibly having different endpoints type apart from
>> bulk, I was relying on the rest of the driver code to determine just
>> that (which is maybe somewhat flawed in this case). 
> 
> Most digital TV devices also have ISOC endpoints. I'm not sure about
> Siano.
> 
>> Since
>> smsusb_submit_urb() (and some other functions like usb_rcvbulkpipe())
>> works exclusively with bulk types, I did not feel the need to even
>> expect int types, for instance.
> 
> The problem is not with int endpoints. Most media devices have isoc
> endpoints. There are even cases that different device models supported
> by the same driver have some bulk and some isoc endpoints. See em28xx 
> driver for instance: most devices are isoc only; some have both isoc
> and bulk; a few have just bulk.
> 
> In the specific case of siano, it supports 3 generations of devices
> (sms1000, sms11xx, sms22xx), each with several submodels. 
> Those 3 generations have different specs, and sms1000 even have one
> "boot" USB ID, and one "warm" USB ID, each one with different endpoints.
> 
> That's basically why I'm afraid of a patch like this could cause
> regressions if not properly tested, as it is changing the logic
> from just detecting the direction to also validate if the endpoint
> is not isoc.
> 
> Regards,
> Mauro

After doing a tiny bit of research I've had a couple more questions as
regards to dealing with ISOC endpoints in siano devices. I am still not
exactly versed in the subject, so forgive my ignorance.

Firstly, judging from the current state of siano driver I think that
sms1xxx devices do not actually deal with ISOC or some other "special"
endpoints apart from bulk ones. em28xx and at least a couple of other
drivers that may expect ISOC eps, check for their presence and prepare
URBs differently, checking for pipe types and filling URBs with
usb_rcvisocpipe() and usb_fill_int_urb() accordingly.

Since siano essentially uses only bulk functions, it either treats isoc
and bulk (and maybe other types) eps as bulk only - which seems wrong to
me and implies problems with devices as a result of this; or siano
driver doesn't actually require isoc-specific actions (or for other
types). I want to point out that I myself tend to agree with latter
option, once again judging by the way driver currently works with eps.

Which brings me to another question - if you could share an example of a
spec or datasheet for one of the smsxxxx devices that explicitly
confirms presence of other ep types, that would be much appreciated. For
some reason, I failed to find something meaningful on my own.

Also, I could use some direction on how to properly test my change on
real hardware. I am looking towards something along the lines of
https://linuxtv.org/wiki/index.php/Smart_Plus as a test subject. If
there are some examples/approaches you think are appropriate for this,
I'll gladly adopt them.

Thank you for your patience :)

Regards,
Nikita


