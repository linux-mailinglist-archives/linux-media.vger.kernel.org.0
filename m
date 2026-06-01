Return-Path: <linux-media+bounces-63225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOOJMIBLHWphYgkAu9opvQ
	(envelope-from <linux-media+bounces-63225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:06:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B461C199
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF95F302BCCE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26408385D88;
	Mon,  1 Jun 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F+FqqmdE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2E340407;
	Mon,  1 Jun 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304369; cv=none; b=AKkxwmC/OY/wNc1LPcJNI6UUAdF3umdbnEh6w3N66FlIJ/jF/2rZzZThCsxyMxA2x9ymKSmKgDlMmsZfiWhhzLZM22yDnvAh3sVOhTA4eS0jBaaSGz/SvViM03uETmJ3Kca2pTuNkafOSUaZsfxyv8qBa4ruvtmGELQkpuFRUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304369; c=relaxed/simple;
	bh=+Zl2JB/QGwYJG+yjS/7uTrrW17Je/rQwo1svYHzRjls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsvueO+zpFu1yihYTfPLGjgUAMBKe/x97sogv7FmyQZCFw4D9fgKDpZu6u3PX8wbjpJdEH1hQ77nhyiWKF4Abdbz0SN6YXGkELfrH9irZaphxHaRh9SPOmpXrr7+HKjBsAsCywJKmVIeSw4tntG73+wN8qaLD/qQr4yyp9TWmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F+FqqmdE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.71] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97E43268;
	Mon,  1 Jun 2026 10:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780304337;
	bh=+Zl2JB/QGwYJG+yjS/7uTrrW17Je/rQwo1svYHzRjls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F+FqqmdErg240MEGLTVQqYutc7iWyK+sEo4UNw+726xYjywntuhR35QYGFDnEKBlt
	 humRjuCR4wxNBHus3FqtvzJquNsca+qAx8S+qAgcIzobX5+rSWsuwCeuGp3y2ZpwYX
	 AeKbdVyyOXwvFxo3dyM1to9O+D0rn4EzSZr2oMQ8=
Message-ID: <d80db00a-42cf-4d97-93e6-de3226a89fc8@ideasonboard.com>
Date: Mon, 1 Jun 2026 09:59:16 +0100
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
References: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
 <20260530114643.12795-1-asmirnou@pinefeat.co.uk>
Content-Language: en-GB
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
In-Reply-To: <20260530114643.12795-1-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-63225-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 3E1B461C199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30/05/2026 12:46, Aliaksandr Smirnou wrote:
> On Thu, 28 May 2026 09:36:13 +0100, Alen Karnil wrote:
> 
>>> Could you please ensure you are using the Makefile provided in the cef168
>>> repository?
>> ```
>> $ make
>> make -C "/lib/modules/`uname -r`/build" M="/home/admin/work/cef168"
>> DTC_INCLUDE="/usr/src/linux-headers-`uname -r | sed
>> 's/rpt-.*/rpt-common-rpi/'`/include"
>> make[1]: Entering directory '/home/admin/linux'
>> make[2]: Entering directory '/home/admin/work/cef168'
>>     CC [M]  cef168.o
>> make[4]: *** No rule to make target 'imx477.dtbo', needed by
>> 'modules.order'.  Stop.
>> make[3]: *** [/home/admin/linux/Makefile:2024: .] Error 2
>> make[2]: *** [/home/admin/linux/Makefile:248: __sub-make] Error 2
>> make[2]: Leaving directory '/home/admin/work/cef168'
>> make[1]: *** [Makefile:248: __sub-make] Error 2
>> make[1]: Leaving directory '/home/admin/linux'
>> make: *** [Makefile:16: default] Error 2
>> ```
>>
>> This is what I got hung up on, which is why I moved onto copying the
>> .dts* and building it from the kernel directory, which lead into the
>> previous issue and me needing to roll my own .dts*
> 
> Could you pull the latest version of the main branch from the cef168
> repository? This issue was fixed recently, so it looks like the code
> you pulled was from before that fix was merged.
> 
> The fix involved using the dtb-y target instead of obj-m in the Makefile.

Just tested it, now it works, thanks.
> 
>>> Will do. Should I update the patch before or after your review?
>>
>> I would prefer if you were to update it before just so we are in sync,
>> thank you.
> 
> Will do.

I will continue the review once it's received.


