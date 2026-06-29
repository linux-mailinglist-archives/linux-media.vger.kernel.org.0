Return-Path: <linux-media+bounces-65901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GN8NF/5SQmo34wkAu9opvQ
	(envelope-from <linux-media+bounces-65901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:11:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571F6D93BA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:11:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=q6uWWNmJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65901-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65901-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8207C30427F6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522DD36C9ED;
	Mon, 29 Jun 2026 11:08:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBD6338593;
	Mon, 29 Jun 2026 11:08:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731292; cv=none; b=gtR/YD8CTld5hmNM39VSMHU4RM43EULTq1OcHQ1Wio1cPzpj6KRdKwVQyK6b4Jgm1FJSz1LAf9Kr2YiC/yoBo0gNTIZ3y6iKy/tFocr1Qc0lwY9IR5EgMKlpPZPW4bEIie9wWz9hBgQTLsNeZkz/8rR9G/xsue37hVUz8/YYook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731292; c=relaxed/simple;
	bh=gs/lQN7S9TWkq/9hMF8GM6Fl7qkq9X6C7JCx31sbT6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zpg6groezF3EeIjKJixBmBOLqKhcRMP94fEOsolyqaHeld/H3ZAt+ClECLntsvatTEj2yCuLAT/sPtzbO7qVHeNzzKQhrF1bdSP4K3UjI+1R1j9PUwMf7uY0ko89va6wdvfwdFceWqAcUcN5TfH0PeYOX4Kfc+3whRt2GREwelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q6uWWNmJ; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817CF176C;
	Mon, 29 Jun 2026 04:08:06 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6032A3F905;
	Mon, 29 Jun 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731291; bh=gs/lQN7S9TWkq/9hMF8GM6Fl7qkq9X6C7JCx31sbT6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q6uWWNmJmjdPKDLBEIYktI5l1SR4FGnjAOS8/vHWT+lrTPm7fC24gvlEfgaYsLOA0
	 EXQ4GSHJAxd74FJPupnXLg4kW2W1w9TcTtHBBpLAcomJ1ylopVauqrYqiZ7W+EU/WX
	 UeiuVWFG15ceNnMCIe97fBV0rzXP6TxS61JUsRXU=
Message-ID: <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
Date: Mon, 29 Jun 2026 12:08:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260629095732.GC3054459@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65901-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime,ideasonboard.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9571F6D93BA

Hello Laurent,

On 29/06/2026 10:57, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Sat, Jun 27, 2026 at 04:29:14PM +0200, Jacopo Mondi wrote:
>> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>>
>> Implement validation of CCM block parameters.
>>
>> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
>> raw value cannot be higher than 8191 (BIT(13) - 1).
>>
>> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
>> value cannot be higher than 4095 (BIT(12) - 1).
>>
>> CCM offsets are 12 bits unsigned integers and their value cannot be
>> higher than 4095 (BIT(12) - 1).
>>
>> Validate the parameters provided by userspace using the .block_validate
>> callback of struct v4l2_isp_params_block_type_info.
> I don't think this is needed.
> 
> We need to validate parameters that can cause the ISP to malfunction in
> ways that requires a system reset, or in ways that cause malfunction of
> other system components (e.g. buffer overflows, memory bus lock ups,
> ...). The rest doesn't need to be validated.
> 
> If you want to be cautious, you can just mask the value when writing to
> registers, which I think you're doing in patch 1/4.

According to me here is not a matter of being cautious, but of honouring the
contract with the userspace.

If the userspace is doing something wrong it should be notified. The only
reasonable argument against this would be if this code is on a critical path and
the validations have a performance impact.

@Jacopo, can you please confirm if this is the case?


-- 
Regards,
Vincenzo


