Return-Path: <linux-media+bounces-24309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F4A033C6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 01:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A781621AE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 00:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3B58F6E;
	Tue,  7 Jan 2025 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="OU4Xrsrb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BB53AC;
	Tue,  7 Jan 2025 00:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208503; cv=none; b=nQUTCj0uE5KMkTmEguJqQaOa0VW95zEDPmFCksHhcGvd3BCGg+syEEkwepvyq2XVVmVwUTQCgF9L7c4WBKAupGtyFHcm01L8jtTzEzX+wcMBVy4F+Gm3pqF8/KGQoE7nQm1zJcRR/DIbLqpvkZM4ffl7DUDy+iDpl1U5Yn6BkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208503; c=relaxed/simple;
	bh=6cA+bP88r+xrQNQLl83g62AXenRkt39/3hl2c0w7gYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2ExKlLOisqDF/AvY3igediPgj5BTajnvukuOUhr+Fhyer6oCZd7uPOL/CtjVnBpQ0js2OlYFDE4HI8ahN0atE9wh1Ui9P3G+f23jJFbFKinWlmp36HS98vb7JQHmDZaPjFau1J8MGzfuBGTBOUPdtU5bJURM3aYStOkTtZY34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=OU4Xrsrb; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YRrwt4ZMmz9sdQ;
	Tue,  7 Jan 2025 01:08:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1736208494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BumHPRnrYrdKW/Ic+24BWv5+zL59cBJOtuFj5cevjs4=;
	b=OU4XrsrbWs9vcf2e19/jiPqNgKYH3UHzjaCzxv/dan3sRB6e/fJ4Y041Ba+qewt0BsmnRE
	4qriNDlldbPOBQu7tB1ST4p2eBmO5AqC9VxGtbgnl4Unhf57oVaHBxzgk+F47VZ19LZM9i
	67/hY94UOle+T88knGv1GmzUba7oU/On1d1Krt0y5edcsfHV6LSLqDn5P9JszuwaQQc1Aj
	942h7YG9kFBgh+udiWw+ZUQecroM8nlBdm+yQiSPEObspMeqAmmOQXSQrjXIppwYQVMqae
	6+3YkYgnXEt11CLDp7/aXkiKyPdI3K44td89qllGN15pM7QzTkwX7OwdQubL0g==
Message-ID: <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
Date: Tue, 7 Jan 2025 01:08:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4YRrwt4ZMmz9sdQ

Hi Dmitry,

that was my fault, my build script did not copy over the new ATF properly.

Now it works, I will update with test results with many different 
resolutions/formats here soon.

Best regards,
Tim


On 1/6/25 12:22, Dmitry Osipenko wrote:
> Hi,
> 
> On 1/6/25 03:16, Tim Surber wrote:
>> I applied your patch to rockchip/next on an FriendlyElec CM3588 device with arm-
>> trusted-firmware 2.12. This is the same hardware/cable/sources I used previously
>> Sadly I could not get it to work at all.
>>
>> After connection to a HDMI source I get the following error with all devices and
>> resolutions I tested
>> # dmesg
>> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_controller_init wait timer base lock
>> failed
>> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_write wait cr write done
>> failed (repeating multiple times)
> 
> Sounds like interrupt may be not working for you. Interrupt won't work
> using downstream version of AT-F, though I assume you're using vanilla
> version of the AT-F. Could you please show output of `cat
> /proc/interrupts | grep rk_hdmirx` after plugging the HDMI cable.
> 


