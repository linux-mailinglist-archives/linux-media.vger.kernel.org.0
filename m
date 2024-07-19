Return-Path: <linux-media+bounces-15147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3E9377C5
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3017281D9D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5413A87A;
	Fri, 19 Jul 2024 12:31:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA7127B56;
	Fri, 19 Jul 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721392319; cv=none; b=qM5x4eJCgPlLLSNMSbrq02o3l5i6QFhNP58HUu3cBJMGFYcptaetBLB77zgBOeZYCGnQBewQ6R3XpBuzwQZnWcojGIkXQakkbRia9cKxL4kfoZrQJnAsbe/MiucSu2eDKbLiIviLh1lbhfNU1rDwA8oF8HtBOK2oiUL2ZiP2pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721392319; c=relaxed/simple;
	bh=WMBUqQCYMwP3xZyQaOz6+ylqD28wFZLdaxROs3OTmQk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OZeZAeMPbzXNojFjj27pSPkrkc7DpqAmJHjmKCzsfVmTcNgMM78nNhnMfyCpc2aU01PXhrGXLxLH8jY5lO+3OHtPIVyi3Z8E8cnmyOo1yNtfsjNkA1xJJispSCfcaqoim2OucGITAxJr2+TLPS5BA3kkpriAqKmcPUY8bvInBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3CA0461E5FE01;
	Fri, 19 Jul 2024 14:31:33 +0200 (CEST)
Message-ID: <518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de>
Date: Fri, 19 Jul 2024 14:31:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux logs error `Failed to query (GET_CUR) UVC control X on unit
 Y: -75 (exp. 1).` (75 == EOVERFLOW?)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de>
 <2024071939-wrought-repackage-f3c5@gregkh>
 <20240719093819.GE12656@pendragon.ideasonboard.com>
 <2a2cac3c-f9cd-4b20-ae53-9e6963c7889f@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <2a2cac3c-f9cd-4b20-ae53-9e6963c7889f@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

#regzbot ^introduced: b2b5fcb1c5b645d5177ef3e3f41c7a706fc2688d

Dear Laurent, dear Greg, dear Ricardo,


Am 19.07.24 um 13:33 schrieb Paul Menzel:


> Am 19.07.24 um 11:38 schrieb Laurent Pinchart:
>> (CC'ing Ricardo)
>>
>> On Fri, Jul 19, 2024 at 08:05:35AM +0200, Greg KH wrote:
>>> On Fri, Jul 19, 2024 at 07:22:54AM +0200, Paul Menzel wrote:
> 
>>>> Today, starting the Intel Kaby Lake laptop Dell XPS 13 9360/0596KF, 
>>>> BIOS
>>>> 2.21.0 06/02/2022 with
>>>>
>>>>      Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
>>>>
>>>> Linux “6.11-rc0” (v6.10-8070-gcb273eb7c839) logged UVC errors:
>>>
>>> Does 6.10-final have the same issue?
> 
> No, it does not. Linux 6.10-04829-ge2f710f97f35 (Merge tag 'ata-6.11-rc1' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux) does also 
> not show this, and 6.10-rc3-00148-g8676a5e796fa (media: uvcvideo: Fix 
> integer overflow calculating timestamp) neither.
> 
>>> If not, can you use 'git bisect' to track down the offending commit?
> 
> I am on it. I tried to pass the USB device through to a VM and try to 
> reproduce there. Thank you for the comment, that reloading the module is 
> (of course) also possible. That avoids rebooting the system.

The hard way found commit:

commit b2b5fcb1c5b645d5177ef3e3f41c7a706fc2688d
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon Jun 10 23:09:54 2024 +0000

     media: uvcvideo: Probe the PLF characteristics

     The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
     60Hz and Auto. But it does not clearly define if all the values must be
     implemented or not.

     Instead of just using the UVC version to determine what the PLF control
     can do, probe it.

     Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
     Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
     Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Looking at it, it’s plausible as new `uvc_query_ctrl()` calls are added.

>>> There have not been any USB changes in Linus's tree yet, but there have
>>> been a bunch of media changes, so perhaps something in the uvc driver is
>>> causing this?
>>
>> We've merged quite a few changes for the uvcvideo driver recently.
>> Bisecting the problem would help greatly. It could also be helpful to
>> set the uvcvideo module 'trace' parameter to 0xffff (e.g. add
>> `uvcvideo.trace=0xffff` to the kernel command line, or unload and reload
>> the uvcvideo module with the parameter set to 0xffff) and give us the
>> additional messages printed to the kernel log.
> 
> ```
> [   10.688580] usb 1-5: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2
> [   10.689134] usb 1-5: Failed to query (GET_CUR) UVC control 2 on unit 2: -75 (exp. 1).
> [   10.689209] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/3 to device 5 entity 2
> [   10.691085] usb 1-5: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3
> [   10.691645] usb 1-5: Failed to query (GET_CUR) UVC control 3 on unit 2: -75 (exp. 1).
> [   10.691709] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/6 to device 5 entity 2
> [   10.692729] usb 1-5: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6
> [   10.693530] usb 1-5: Failed to query (GET_CUR) UVC control 6 on unit 2: -75 (exp. 1).
> [   10.693604] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/7 to device 5 entity 2
> [   10.698164] usb 1-5: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7
> [   10.699621] usb 1-5: Failed to query (GET_CUR) UVC control 7 on unit 2: -75 (exp. 1).
> [   10.699708] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/8 to device 5 entity 2
> [   10.700676] usb 1-5: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8
> [   10.701263] usb 1-5: Failed to query (GET_CUR) UVC control 8 on unit 2: -75 (exp. 1).
> [   10.701325] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/9 to device 5 entity 2
> [   10.702991] usb 1-5: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9
> [   10.705787] usb 1-5: Failed to query (GET_CUR) UVC control 9 on unit 2: -75 (exp. 1).
> [   10.705860] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/10 to device 5 entity 2
> [   10.707036] usb 1-5: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10
> [   10.708098] usb 1-5: Failed to query (GET_CUR) UVC control 10 on unit 2: -75 (exp. 1).
> [   10.708150] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/1 to device 5 entity 2
> [   10.709279] usb 1-5: Adding mapping 'Backlight Compensation' to control 00000000-0000-0000-0000-000000000101/1
> [   10.710748] usb 1-5: Failed to query (GET_CUR) UVC control 1 on unit 2: -75 (exp. 1).
> [   10.711147] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/4 to device 5 entity 2
> [   10.713670] usb 1-5: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4
> [   10.714623] usb 1-5: Failed to query (GET_CUR) UVC control 4 on unit 2: -75 (exp. 1).
> [   10.715104] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/5 to device 5 entity 2
> [   10.803567] usb 1-5: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5
> [   10.803573] usb 1-5: Added control 00000000-0000-0000-0000-000000000101/11 to device 5 entity 2
> [   10.804683] usb 1-5: Adding mapping 'White Balance, Automatic' to control 00000000-0000-0000-0000-000000000101/11
> ```
> 
> Full log attached.
> 
>> Could you also provide the output of `lsusb -v -d 0c45:670c` (running as
>> root if possible) ?
> 
> Attached.


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2b5fcb1c5b645d5177ef3e3f41c7a706fc2688d

