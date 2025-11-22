Return-Path: <linux-media+bounces-47616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA8AC7D507
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 18:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 033B334D243
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 17:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E673C288505;
	Sat, 22 Nov 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="LUWookV8";
	dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="PyzY4J4A"
X-Original-To: linux-media@vger.kernel.org
Received: from vidala.pars.ee (vidala.pars.ee [116.203.72.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B91A316E
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.72.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763834318; cv=none; b=p6ebT6NZqyyLw0apDwK5HqGRCveV8kmkfN32aVYBK13z2Ne3my5E0uzn119ecmobCBbCJT8Dsrir/6Ggf+jZzlDUeaE2lalXFnAl3i58uCp3Lan472yg/+2Bv4ev7cZYUb9Xr9jhK4c3sxz/7iS8Dx293FQlqN3jXZNRFYOxOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763834318; c=relaxed/simple;
	bh=K7jDgQ2WyAAl++lqgXYV9u9iZnts19qhz3ffc3p8NHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCbNyfyCBkEFeANj3HGR6rV3sPuDDvIf+1kBAd1xbAv6IsqajO41g9D1UJdhtUtuBoOU626YJekm5t/75kQCNP9PL32GiJRfFkeSHMRvGrl0jA8krltrq450AgVtQDZj3oUwWR4fZfNFC1jV5WFKiU4NEtRQ7R4aE83VRD12piM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee; spf=pass smtp.mailfrom=lynne.ee; dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=LUWookV8; dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=PyzY4J4A; arc=none smtp.client-ip=116.203.72.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lynne.ee
DKIM-Signature: v=1; a=rsa-sha256; s=202405r; d=lynne.ee; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763834308; bh=yEHBaBqVPS7A6JX3zVtKSGP
	AS9E7qW/86seNQqx9a/M=; b=LUWookV8BkYfpHHwUQ6+37AzVT+Kxu+cAbXEQDqT6sHejgxoi+
	GEq0w7UbsCfp3nLSNIfLo+PN/o43+9RHu8/xd+Xq/J1UjMxZz2FgQSIL4jpbSXWcEr7Hfmgdw+a
	8E/a4ukb8xuxhCtkDU1AcSq3FLA56tJo+aKZd25KlDFID2dSYKk/RSKWhizMDNw9yKeWsqkzC7Z
	ezx5472CxDcTRLObc+tT9KjAoO/p+UkbGDsK6DiEkUiIS/3b1p/63LteS9FR3gRlVoCH1d6cCRt
	m9jxDZUjOmPoixQAYsUCjEDTpVG2tSAK7Ho6+WYGJmO7og6Xc1t2xiajOznCCwW/zoQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202405e; d=lynne.ee; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763834308; bh=yEHBaBqVPS7A6JX3zVtKSGP
	AS9E7qW/86seNQqx9a/M=; b=PyzY4J4A0bx94LDw68rnglak27zWA5r/edPOQJJZ/NZ23J2q1+
	mYO0Vyp4lNk3YilLEcMGpPhsRQ7zlaVCKxAQ==;
Message-ID: <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
Date: Sat, 22 Nov 2025 18:58:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
 <20251122151401.GC15447@pendragon.ideasonboard.com>
Content-Language: en-US
From: Lynne <dev@lynne.ee>
In-Reply-To: <20251122151401.GC15447@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2025 16:14, Laurent Pinchart wrote:
> Hi Lynne,
> 
> On Sat, Nov 22, 2025 at 12:28:48PM +0100, Lynne wrote:
>> The issue I'd like to report is that the kernel fails to initialize the
>> Panasonic S1II DSLR camera in webcam mode as a webcam.
>> Seems like most queries time out or error out with a generic protocol
>> error return.
>> I tried increasing UVC_CTRL_CONTROL_TIMEOUT just in case, but it did not
>> seem to help.
> 
> I see in the log that the USB audio driver fails as well. There are
> quite a few devices that exhibit issues in the interactions between the
> audio and video interfaces. Could you test blacklisting the
> snd_usb_audio module to prevent it from loading (and unloading it if
> it's loaded already), and replug your camera ?

Hi,
I dug around some more. When the device is first connected, everything 
runs fine, actually. Upon unplugging and plugging it back in, I get the 
log I posted initially. Unloading the uvcvideo/uvc moedule and loading 
it makes the camera work again.
Disabling snd_usb_audio did not help.

Here's the log of the device being plugged in for the first time.
<same as before>
[  +0.000001] usb 2-3: SerialNumber: 00000Z12FB009251
[  +0.094425] videodev: Linux video capture interface: v2.00
[  +0.017217] usb 2-3: Found UVC 1.10 device DC-S1M2 (04da:2385)
[  +0.000493] usb 2-3: Failed to query (GET_INFO) UVC error code control 
2 on unit 2: -32 (exp. 1).
[  +0.000264] usb 2-3: Failed to query (GET_INFO) UVC error code control 
2 on unit 1: -32 (exp. 1).
[  +0.000407] usbcore: registered new interface driver uvcvideo
[  +0.007960] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 2: -32 (exp. 1).
[  +0.000004] usb 2-3: UVC non compliance: permanently disabling control 
980900 (Brightness), due to error -32
[  +0.000425] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 1: -32 (exp. 1).
[  +0.000001] usb 2-3: UVC non compliance: permanently disabling control 
9a0901 (Auto Exposure), due to error -32
[  +1.091011] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 2: -32 (exp. 1).
[  +0.000442] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 1: -32 (exp. 1).
[  +0.000762] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 2: -32 (exp. 1).
[  +0.000426] usb 2-3: Failed to query (GET_DEF) UVC error code control 
2 on unit 1: -32 (exp. 1).
[Nov22 18:50] usb 2-3: USB disconnect, device number 2

Maybe some state gets corrupted?

>> Full log is below:
>>
>> [Nov22 12:11] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 10 using xhci_hcd
>> [  +0.017315] usb 4-4: New USB device found, idVendor=04da, idProduct=2385, bcdDevice= 1.00
>> [  +0.000008] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> [  +0.000004] usb 4-4: Product: DC-S1M2
>> [  +0.000002] usb 4-4: Manufacturer: Panasonic
>> [  +0.000002] usb 4-4: SerialNumber: 00000Z12FB009251
>> [  +0.019222] usb 4-4: Found UVC 1.10 device DC-S1M2 (04da:2385)
>> [  +5.127335] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 2: -110 (exp. 1).
>> [  +5.119884] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 1: -110 (exp. 1).
>> [ +10.239937] usb 4-4: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
>> [  +0.008264] uvcvideo 4-4:1.1: Failed to query (GET_CUR) UVC probe control : -71 (exp. 34).
>> [  +0.000013] uvcvideo 4-4:1.1: Failed to initialize the device (-71).
>> [  +0.000026] uvcvideo 4-4:1.0: probe with driver uvcvideo failed with error -71
>> [  +0.103095] usb 4-4: 3:1: cannot set freq 48000 to ep 0x83
>> [  +0.359825] usb 4-4: 3:1: usb_set_interface failed (-71)
>> [  +0.320056] usb 4-4: 3:1: usb_set_interface failed (-71)


