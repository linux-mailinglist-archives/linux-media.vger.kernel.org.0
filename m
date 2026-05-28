Return-Path: <linux-media+bounces-62948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDoFJ8EAGGrUYwgAu9opvQ
	(envelope-from <linux-media+bounces-62948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:45:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 058195EEE3C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 161C53299DC0
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AF63815E2;
	Thu, 28 May 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hX89qzva"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3916380FD5;
	Thu, 28 May 2026 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957383; cv=none; b=VyB9eujv8x8qXpzoJ4NJyZGi++n32Hs7EBAsxmsgohsH7gEIvDeBtcDPWcOFYqGkygd8nw2GiLBBsbk/cMBkDnJ1FNMwmgXQ+T5sZttkkAMOVdzOzVJetLAePrIdWh5c4tdaB5NK5YaqtfC+iVxb6VITXd7vZRMade4K9Lxeo28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957383; c=relaxed/simple;
	bh=ci7FpwYixqnK3a5PY4el2a9OOgOl+OZ3t+e5ywPykkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN2O2yA8inhZ2RB42b/LPgcRc7IvCtPiBAOB8g79e0xluklElofFWUJhIOHMpVtpV5vCAWS5bdSm2oqBKnbrqvFN61JNTm8+yL8sXbQO5mQINk73r2D4NI8JDm+E+twQ54NL0SHsJrAZ2VhbgO2sH33+YF3NyL1FXPY0KBI3vqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hX89qzva; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.83] (cpc89242-aztw30-2-0-cust469.18-1.cable.virginm.net [86.31.129.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CEAE57E;
	Thu, 28 May 2026 10:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779957356;
	bh=ci7FpwYixqnK3a5PY4el2a9OOgOl+OZ3t+e5ywPykkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hX89qzva3U3eGrGxmWjX9W8xH/3nEFkIa1QfyXS5Asg1Sw+NXkQWXX4mro4y8GQ/X
	 0oNGgakAcjdHX8oSa+SsPLZmODSVPvsMo3ejmiVtBb7SYFY2fqtPf2X5arh6Ry03+j
	 edthEmshvxjGSYZcUjcBf5mu9drdI80J/qFfABd4=
Message-ID: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
Date: Thu, 28 May 2026 09:36:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org
References: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
 <20260527194903.10296-1-asmirnou@pinefeat.co.uk>
Content-Language: en-US
From: Alen Karnil <alen.karnil@ideasonboard.com>
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20260527194903.10296-1-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-62948-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 058195EEE3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/05/2026 20:49, Aliaksandr Smirnou wrote:
> On Wed, 27 May 2026 12:45:26 +0100, Alen Karnil wrote:
> 
>>> Could you provide the build error logs and the overlay files generated
>>> by the tool before you modified them?
>> using the configure.sh tool with imx477
>> imx477_378-overlay.dtsi
>> ...
> 
> The files generated after running the configure.sh tool look correct and
> match mine exactly.
> 
>> If put these into my kernel build I get:
>>
>> $ make dtbs
>>     DTCO     arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo
>> arch/arm64/boot/dts/overlays/imx477_378.dtsi:26.20-31.3: ERROR
>> (duplicate_label): /fragment@200/__overlay__/pca@70/i2c@1/cef168@d:
>> Duplicate label 'vcm_node' on
>> /fragment@200/__overlay__/pca@70/i2c@1/cef168@d and
>> /fragment@200/__overlay__/pca@70/i2c@0/cef168@d
>> ERROR: Input tree has errors, aborting (use -f to force output)
>> make[3]: *** [scripts/Makefile.dtbs:142:
>> arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo] Error 2
>> make[2]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/overlays]
>> Error 2
>> make[1]: *** [/home/admin/linux/Makefile:1498: dtbs] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
> 
> It looks like a different Makefile is being used. In the cef168
> repository's Makefile, there is no dtbs target. Also, our Makefile is
> only 27 lines long, while the log output indicates the error occurs at
> line 1498.
> 
I was using the kernel's makefile, basically following
https://www.raspberrypi.com/documentation/computers/linux_kernel.html
The kernel I am running has a LOCALVERSION set so it is 6.18.32-v8-afk+
(for reference)
> Could you please ensure you are using the Makefile provided in the cef168
> repository?
```
$ make
make -C "/lib/modules/`uname -r`/build" M="/home/admin/work/cef168" 
DTC_INCLUDE="/usr/src/linux-headers-`uname -r | sed 
's/rpt-.*/rpt-common-rpi/'`/include"
make[1]: Entering directory '/home/admin/linux'
make[2]: Entering directory '/home/admin/work/cef168'
   CC [M]  cef168.o
make[4]: *** No rule to make target 'imx477.dtbo', needed by 
'modules.order'.  Stop.
make[3]: *** [/home/admin/linux/Makefile:2024: .] Error 2
make[2]: *** [/home/admin/linux/Makefile:248: __sub-make] Error 2
make[2]: Leaving directory '/home/admin/work/cef168'
make[1]: *** [Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/home/admin/linux'
make: *** [Makefile:16: default] Error 2
```

This is what I got hung up on, which is why I moved onto copying the 
.dts* and building it from the kernel directory, which lead into the 
previous issue and me needing to roll my own .dts*

> 
>>>> there needs to be some further discussions on how we could
>>>> improve the user experience when it comes to enabling the vcm with
>>>> camera sensors.
>>>
>>> I agree. I started the discussion on the Raspberry Pi forum, but the
>>> driver needs to be merged first before moving forward with that.
>> Sure that makes sense, lets focus on the driver for now.
>>>
>>> https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070
>>
>> Also you will most likely need to update the patch since the line
>> offsets have moved to work 6.18
> 
> Will do. Should I update the patch before or after your review?

I would prefer if you were to update it before just so we are in sync, 
thank you.


