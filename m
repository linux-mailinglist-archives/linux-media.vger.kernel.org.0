Return-Path: <linux-media+bounces-28553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391FA6B611
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 09:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AFB37A83DD
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 08:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1501EFF99;
	Fri, 21 Mar 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfdPMNmM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965A17C210;
	Fri, 21 Mar 2025 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742545794; cv=none; b=iAlav6qt9BX0zIaKeLhbnl/JPK06sP24VRBJhLdfmX9wrghFOSRVqZ7Mp4u946xv0pxm5v5HrnwpUj7LSFQ/piSvI/KX8Ve9IdE5WKfmppGTqCIPp9OVz6r71jbKXjDBz3MhmlelQqdzYFvXA39TUwIuzrpCpAg0SE0ZECFhpeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742545794; c=relaxed/simple;
	bh=tFTHM2RfGa+9ZilHqFk4mBtlQxBhVVTEjxZP6+s5It8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g10AptGrQXSWRYZ097TDHXfyLpfO2jX7wZVckILnSpJIwm3q2ERUY1K04Ftr/FhT2mZEC6RMU96+uqlrSu/WALHj/ONFhpngA6JyS3Q/AerXwk+GcjkbkZfAo3JRrWMHOJwIhBmgc563gJBu0QwatSwuIJY11iNlMoiav7dV2Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfdPMNmM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30b83290b7bso17711951fa.1;
        Fri, 21 Mar 2025 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742545791; x=1743150591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTmc+7B7r3Ct9Gn3PyZkUnvw0YMub17N1opATrNTSr4=;
        b=ZfdPMNmMMg82E5fs8kLXfTly9TGTT5/PCokrE/7eCWbjv1D64gF88G0FlOcqLj8KJT
         Vx0r69Io7qcA2D5F5Pl3eBkvUFxAL2L7KhSfHN9xUZn4jmt6Cbzmqkd7ZTI/MGM2v1qT
         +wuKM8qZ1FZBRq4zQOsunN9ckv054LGQvywYoGKRqDxfN5w8eUnjqp6xN7tt17NVy+3h
         RYAzpeFL+kakmwHLJtdMHT2hR1DMiT+DL9vsjsqzuIX5ht2nNeVZSPR7EZSGytO4XQ6d
         4taXd4RfJhxF7AuFxyu+qCdH99qfQKQkEGFujyxgi04c50Er8cel/X2GoKsOr5JddG7g
         MzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742545791; x=1743150591;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTmc+7B7r3Ct9Gn3PyZkUnvw0YMub17N1opATrNTSr4=;
        b=xBp4mAaULcn4C5Zjn4MfhUg1UkurebDJRztCquYSKEJIFVsj9QU/IEEUiOeU7RWn5y
         UJMicNw2NwFcgQ6vpjaJHP4rXhr9ZYFD5IJtJWn6q3GHjjqgZ/UZpRlG+/u8WxuC5I1/
         LvFOE+mj1zVoUZ2Uh67+PPhrqidS/U95TYDCHzTUhMS9YT9g1ltx+pnRekc8/9fu4fy4
         u7CiIq8mA0gHAAjhyGg7FqAMMFTfcqWj1SnSRjrTDGSNC6PIV/5jOS+WMTFPD7Bx+NjB
         lucPjDQyqZ/WhlS9yQ6QXli9XFpGirmarhCSBrqSBzLWcPPEzkvlHufebS+wr5p8YlRr
         733w==
X-Forwarded-Encrypted: i=1; AJvYcCVhsqd5Ncjuzt/hdk0DcDO3d5VqxcMsToNoD2kWmeYafi7vaYOh1//lJqs/Ht952XaOfhE/srUlb8cSk8s=@vger.kernel.org, AJvYcCXs7NZFpBPo3ef66+jQr56MDn6qssn1AzCZpl47wkMRoXRfI6CtlQj48jepcGlBZ88ysoQn9sGE+EI/HSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9BNge8E12ilB0NyZwgo+kR80piVkGzJQ6In5yYtXgRIzRYKD
	wMP31JIpr4FbR3moz+Z+4SQy3IZFNBcGAGwim4qxtm3kxVh+ZkP4SRoDOQ==
X-Gm-Gg: ASbGncsFICyReH0QcFbsF3Pmg1rE1mGIk32hvYuz7XDzmM4DfKzHW8Pnf5apUe9SbRC
	ghxRNqZ9d8PKIY2nr/CYfFMZTGE1WXHZilUTZbLr0R5n+6XZIQcdm4/nhiy/ccvOD8IBcT85WyP
	5e0yoxAYhLe0dv2rFWb9o9H2I06e/w+1ZZOYAe8gydVlmzHN5Mh7iDzyw+/3EVPWoxMkYjOQVZ9
	PsWkCtSQZQDubCqp2XgLWKqO5cINpKm5n1VVMT9j2lEocN7AgSyUzd1ZNBXfn5gAr34AYmIeIDK
	12d4TVmzQ0t0SgK1ZZ7g5xglKhqv23D+gzqHG8+D/8s/tBeI5hcbPbQUQrCYIVBf/1K7pWKmH/C
	QAGnIrxvGMs78ClN/Xle9DAFH3A==
X-Google-Smtp-Source: AGHT+IEJDE8JKnE3YsZE14EVbF+C3BriIXmFsOZUR4/ra5Oiuj296mslD90UTgcom+giEc/obQU4RQ==
X-Received: by 2002:a05:6512:3e0a:b0:549:9078:dd46 with SMTP id 2adb3069b0e04-54ad64fbda3mr803385e87.43.1742545790481;
        Fri, 21 Mar 2025 01:29:50 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad650b89bsm126790e87.208.2025.03.21.01.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 01:29:48 -0700 (PDT)
Message-ID: <7286121f-e3f4-48bb-9fea-1d14e695f203@gmail.com>
Date: Fri, 21 Mar 2025 10:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: thp7312: Don't require node availability
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z9vTV7tS2ZI3tM6m@mva-rohm>
 <20250320142635.GA14394@pendragon.ideasonboard.com>
 <ffa5ae6d-a925-41da-9826-4bb376ca0fbe@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <ffa5ae6d-a925-41da-9826-4bb376ca0fbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/2025 08:35, Matti Vaittinen wrote:
> Hi dee Ho Laurent,
> 
> On 20/03/2025 16:26, Laurent Pinchart wrote:
>> Hi Matti,
>>
>> On Thu, Mar 20, 2025 at 10:35:35AM +0200, Matti Vaittinen wrote:
>>> It appears that the concept of available firmware nodes is not really
>>> applicable to the scenarios where a specific name is required from a
>>> node.
>>>
>>> As explained[1] by Sakari:
>>> "OF only enumerates available nodes via the fwnode API, software nodes
>>> don't have the concept but on ACPI I guess you could have a difference
>>> in nodes where you have device sub-nodes that aren't available. Still,
>>> these ACPI device nodes don't have meaningful names in this context
>>> (they're 4-character object names) so you wouldn't use them like this
>>> anyway."
>>>
>>> Use the fwnode_for_each_child_node() instead of the
>>> fwnode_for_each_available_child_node() In order to make it clearly
>>> visible that the 'availability' of the nodes does not need to be
>>> considered here.
>>
>> Why not ? Node availability is a concept that exists in DT, and this
>> driver has only been tested on DT-based systems.
> 
> I admit I need to study this then. I just took what Sakari said for 
> granted, without taking any further look at this.
> 

I took a peek in the 'availability' concept and found:
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/of/base.c#L468

So, the availability indeed has a well defined meaning in the DT, 
boiling down to the value of the 'status' -property.

Then I took further look at the fwnode_for_each_child_node(), and if I'm 
not mistaken, it calls:

fwnode_for_each_child_node()
	fwnode_get_next_child_node()
		fwnode_call_ptr_op(fwnode, get_next_child_node, child);
			 of_fwnode_get_next_child_node() (dt-based)
				of_get_next_available_child() (dt-based)

where the of_get_next_available_child() skips all the disabled nodes.

So, in that regard I agree with Sakari. On DT based systems, the

fwnode_for_each_child_node() seems to equal the
fwnode_for_each_available_child_node().

And, since the 'thp7312' driver requires specific names for the nodes, 
it indeed seems to me that only the device-tree use-case needs to be 
considered.

After all this I'd say this patch is still valid - but the commit 
message is misleading. If no one objects I'll rewrite the commit msg and 
respin :)

Yours,
	-- Matti

