Return-Path: <linux-media+bounces-64381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aLaZBoMfKWooRAMAu9opvQ
	(envelope-from <linux-media+bounces-64381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:25:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6066720E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=NKJLD4un;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64381-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64381-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD6F3294EAC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E5A3A544C;
	Wed, 10 Jun 2026 08:18:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DE38D6A2;
	Wed, 10 Jun 2026 08:18:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079528; cv=none; b=erg/dohq/F4kJADg4Q+N06YgwO79Za9o79dyR3zZFy0xX4EhZ1UGUSfxj/VTANltbyvMKc4KyIilWZ2oaK1LChV7KQev2UC88VoWmhEgjIEjqlBlEEOUYpiEylr5mAtl65Gkgvgkzwxbmv9hDohHUQs0KTaB/4rSy8I25Ud2teg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079528; c=relaxed/simple;
	bh=dFWV170uGcGTNRXt5fX8cWxKq6oMa2XSGSL/KVli6B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR/bukXczLstFwE94nBuWgdsUBMZI7uvmg6eMD8itpC4LsTWBR/9Z5CoMdHPb7h3hcu47wIxawv4AvKJXCUi4KhWkDPXh6SJ0e8J+fDFTZ1bKq2Y/sfHWJBOBBaoc2bwqu1cEosPsntQ/V2zM/GBcvFq0oEiWKoIjsABtgzRLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NKJLD4un; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 925EF9D1;
	Wed, 10 Jun 2026 10:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781079496;
	bh=dFWV170uGcGTNRXt5fX8cWxKq6oMa2XSGSL/KVli6B0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NKJLD4uncIgZ1+JbXL4rtTJDgyWQsF3iRP5htr28v3WaGDMXPK3L/dtO0E2y9DQQ8
	 AKliG+f6E30Z90tnV7yXFLiTXhmqGqKRRLzFrC723tUBdO37TcRsaxE1FfhO2pkU9D
	 UBfRkyG6AgaGG2uGaWOLRGrVShhPdOoe774xPnuo=
Message-ID: <d327a464-6a8d-4f36-884e-52f3e396762a@ideasonboard.com>
Date: Wed, 10 Jun 2026 09:18:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Fix AEXP IHIST disable bit shift
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Carlier <devnexen@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260609053231.24855-1-devnexen@gmail.com> <aie1vqkd96-8uCmA@zed>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <aie1vqkd96-8uCmA@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:devnexen@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64381-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE6066720E



On 09/06/2026 07:42, Jacopo Mondi wrote:
> Hi David
> 
> On Tue, Jun 09, 2026 at 06:32:31AM +0100, David Carlier wrote:
>> The post-Iridix auto-exposure histogram disable bit in
>> MALI_C55_REG_METERING_CONFIG is bit 16, but MALI_C55_AEXP_IHIST_DISABLE
>> was defined with a shift of 12, copied from the AEXP_HIST definition
>> above it. As the value is masked with the BIT(16) disable mask when it
>> is programmed, the result is always zero and the disable bit is never
>> set. The IHIST can therefore never be disabled, neither at ISP init nor
>> via a parameters block flagged V4L2_ISP_PARAMS_FL_BLOCK_DISABLE, and the
>> hardware keeps producing histogram statistics that userspace believes
>> are switched off.
>>
>> Use a shift of 16 so the disable request takes effect.
>>
>> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
>> Cc: stable@vger.kernel.org
>> Assisted-by: Claude:claude-opus-4-8
>> Signed-off-by: David Carlier <devnexen@gmail.com>
>> ---
>>   drivers/media/platform/arm/mali-c55/mali-c55-registers.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> index f098effde..4cd13b702 100644
>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> @@ -173,7 +173,7 @@ enum mali_c55_interrupts {
>>   #define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
>>   #define MALI_C55_AEXP_HIST_SWITCH(x)			((x) << 13)
>>   #define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
>> -#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 12)
>> +#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 16)
> 
> Thanks, this indeed was a bad copy and paste I presume
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Yup, looks like it to me

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
>>   #define MALI_C55_AEXP_SRC_MASK				BIT(24)
>>
>>   #define MALI_C55_REG_TPG_CH0				0x18ed8
>> --
>> 2.53.0
>>


