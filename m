Return-Path: <linux-media+bounces-44065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11360BC8636
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 008054E468E
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F96A2D7DF6;
	Thu,  9 Oct 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yzq/EWTt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90952D7D2F
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003974; cv=none; b=IwQgNDGd2V9tW+30Nm/Jc6UOoSChSFKk0XTfh4rb+08VSlDMFVR3tls6SErb5k4N9H3+CSwAM1u+vUdcTpsx/KVA5+prx9wZOzuWOmBxbyFGTdpXoLGZxIcuLWt0n6nt9ARb0VD40nVwC7eGxaXWleShbCF+3Vbw6TfjWE7/qoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003974; c=relaxed/simple;
	bh=ZZiz3ejaziLOFyJ0phNmywysuz9f4dFKZweYQx7vqHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl4TSILe28eGffHthFhz366y0ORKy6r+/A4U1uJYz/VPuLtY8VF3WQ8IMSFXchdD4C5QsHZwl/zhhnZIWkitalQNG82BOKtNp4CSm4NDUwvgVzh51UqfVJZQHyvKcrv+NKKUYFTl4uKEWCqI9eoINyZ6Jmz5c1rOWyZ/MGZsUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yzq/EWTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBB7C4CEE7;
	Thu,  9 Oct 2025 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760003974;
	bh=ZZiz3ejaziLOFyJ0phNmywysuz9f4dFKZweYQx7vqHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yzq/EWTtlMAhGYToIEwefKZR5biE+ljUXHk4ltnozicb/oFahd8SoXzA1tZHNwrz+
	 HnplxqAxMtTl2Saxab3ZnYuqihGdDGHzckChGNxIEF7vfdehWknZ7QSSJAzXhRCSI4
	 3NvQcrEyuMQUrniW2iA/jpDSuHUeEVRpAGuD06jSewacG4arNbIc53U7YOTIVEswAN
	 nOAKCle1yw6xZ2UI9iEZFngLwPZxBeN3SYr0F2cLcSatD8yO51zHjn01xPbBwSWg0D
	 KJe+TQEbRStC5F+ELpNjGZTjnIVidQDZqB/ZGoYtMTXKKz/gVfDLqFFWQ2z9zTF7JW
	 /FIH5VrfDq0IQ==
Message-ID: <b2ffa6cf-4d7e-48ca-94ce-2dd814a45692@kernel.org>
Date: Thu, 9 Oct 2025 11:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
To: Angel4005 <ooara1337@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
 <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
 <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Angel,

On 9-Oct-25 11:22 AM, Angel4005 wrote:
> Hello,
> 
> Thank you very much for your quick and helpful responses!
> 
> I confirm that the problem seems to be related to duplicate IDs in the
> descriptor of my Grandstream GUV3100 device.
> 
> Unfortunately, I was unable to test the proposed patch, as kernel
> building is beyond my current capabilities. I am not experienced in
> such matters and do not want to risk the stability of my system.

Can you perhaps ask for help on the forum of your distribution?

Chances are someone can help by building and providing 6.12.51
kernel-pkgs for your distribution with the suggested patch added
to the build. Then you can just install these pkg with your
regular distro package manager which should be easy and safe
to do.

Regards,

Hans



> The exact breaking point when the camera stopped working was found:
> 
> * Last known WORKING kernel (GOOD): 6.12.50-1-lts
> * First known NON-WORKING kernel (BAD): 6.12.51-1-lts
> 
> I hope this information will help pinpoint the commit that caused the
> regression.
> 
> Thank you very much for your help, guidance, and understanding!
> 
> чт, 9 жовт. 2025 р. о 09:55 Ricardo Ribalda <ribalda@chromium.org> пише:
>>
>> Hi Angel
>>
>> Thank you very much for the detailed report.
>>
>> Your device has two entities with the same id:
>> VideoControl Interface Descriptor:
>>         bLength                31
>>         bDescriptorType        36
>>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>>         bUnitID                 4
>>
>>
>> ideoControl Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType        36
>>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>         bTerminalID             4
>>         wTerminalType      0x0101 USB Streaming
>>         bAssocTerminal          0
>>         bSourceID               3
>>         iTerminal               0
>>
>> And that confuses the code. We have recently introduced a change that
>> has probably triggered the regression
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc?id=0e2ee70291e64a30fe36960c85294726d34a103e
>>
>> Do you know the commercial name of the device and if it is available to buy?
>>
>> Could you try this patch and let me know if it fixes the issue?
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c
>> b/drivers/media/usb/uvc/uvc_driver.c
>> index fa61f1d0ea2c..81937501fb0c 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -167,11 +167,23 @@ static struct uvc_entity
>> *uvc_entity_by_reference(struct uvc_device *dev,
>>
>>  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
>>  {
>> -       struct uvc_streaming *stream;
>> +       struct uvc_streaming *stream, *last_entry;
>> +       unsigned int count = 0;
>>
>>         list_for_each_entry(stream, &dev->streams, list) {
>>                 if (stream->header.bTerminalLink == id)
>>                         return stream;
>> +               count += 1;
>> +               last_entry = stream;
>> +       }
>> +
>> +       /*
>> +        * If the streaming entity has an invalid id, but it is the only
>> +        * one available, use it.
>> +        */
>> +       if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
>> +               dev_err(&dev->intf->dev, "Heuristics triggered\n");
>> +               return last_entry;
>>         }
>>
>>         return NULL;
>>
>>
>> Thanks


