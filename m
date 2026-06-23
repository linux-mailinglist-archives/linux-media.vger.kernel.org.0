Return-Path: <linux-media+bounces-65443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VjvJH/UnOmqr2wcAu9opvQ
	(envelope-from <linux-media+bounces-65443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:30:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BF6B47B3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nW7GIiVh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65443-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65443-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D69023018E9D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 06:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F313B992F;
	Tue, 23 Jun 2026 06:30:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0582E2286;
	Tue, 23 Jun 2026 06:30:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196202; cv=none; b=grTuC+coY7eQAKVqPDrgxbT2qp0qLfrcbOcZ0XvvQ3DUxqMgiRq5FVhjOiyyLOyi7Hegoy+xElt85t284CijXV4RcQDvrf2+V60nZ1g8oIAjKNdKxNu4IXFMyd6BCJZKSHzYWp5QcaTHdpF9Mhz+Rzk13fSj3+0Glz2txAPq2Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196202; c=relaxed/simple;
	bh=Qdx5a9iUQGebN3w+Fdbxk3jxOx4w6gNk08MSL47w9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zj4ZB1iJpbVIfXDduFmFIeqADhjSyY5s+mRqfvYWuh/riBHGRI8+61BhUZQHAEsWpCCEh2yzpsihCVH3PTfPGGuy/G8tpKau4X34hMKVcgFHBDnzstBYZajtoSnOFBhiiRKNqEXG4vxB80zvcl6HJmQonWX1IeiJJ4K448h8AxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW7GIiVh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19A11F000E9;
	Tue, 23 Jun 2026 06:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782196201;
	bh=3MiT/+6WIMBoDrjB7yxEcuzXbVSSLgfxY0V8WdRjNPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nW7GIiVh06KBGnfpCQFiJ1b4voiSB5lYKFzhFwz83m1qokLLcDx8rElhuI4VBvnjH
	 g+/mAs+YSgXe892UQlfMbnbzfRiM7eKDzi7aNnzUSdX4PgGEyZ0G6F4uagxct1NiHh
	 Ont5Spf65R/sCjPi6ZZoconydm3GkKI0V0EmP9Q8Y9qs8qZYUfwwJYqtB3fwgmrxiS
	 0/d3ScEnD3irUqBqNtB+bXFhTFYRKLkccCbkfLelRewUUN0lXkjbjYSblVsFhMLtxL
	 5vACdLPBNLDCv0Tg2/oJowe++mul33FcKU8YzQ1RzOgPlmjtsR15ODhf0x9QbRBljE
	 dyyKMDu1Nf55Q==
Message-ID: <83333146-f53c-4673-bab8-01edf97a819e@kernel.org>
Date: Tue, 23 Jun 2026 09:29:57 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] media: microchip-isc: fix pfe_cfg0_bps comment
To: Balakrishnan.S@microchip.com, mchehab@kernel.org
Cc: hverkuil@kernel.org, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-7-b23677fc5ab6@microchip.com>
 <6ffd489e-8f24-47b2-bbfb-ac464798883f@kernel.org>
 <ab562e26-2cb7-45ee-96fd-53103ed9001f@microchip.com>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <ab562e26-2cb7-45ee-96fd-53103ed9001f@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65443-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Balakrishnan.S@microchip.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C4BF6B47B3

On 6/22/26 14:32, Balakrishnan.S@microchip.com wrote:
> Hi Eugen,
> 
> On 21/06/26 11:57 am, Eugen Hristev wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/16/26 14:51, Balakrishnan Sambath wrote:
>>> The @pfe_cfg0_bps comment claimed the field holds the "number of
>>> hardware data lines connected to the ISC". It does not. The field
>>> stores the pre-shifted PFE_CFG0 BPS value (e.g. ISC_PFE_CFG0_BPS_EIGHT,
>>> which is 0x4 << 28) and is ORed straight into the PFE_CFG0 register
>>> word in microchip-isc-base.c.
>>>
>>> The old wording invites a reader to treat it as a small bit-depth
>>> integer (8, 10, 12) and compare or do arithmetic on it directly, which
>>> silently breaks since the value is shifted into bits 30:28. Document
>>> what the field really holds and how to read the bit-depth back out with
>>> FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...).
>>
>> In this commit message I would focus on the correct meaning of
>> pfe_cfg0_bps and stop inferring what a reader *might* have understood.
>> Let's just fix it to be right, explain the right way, and forget the
>> wrong way.
> 
> Sure. Will fix the comment to just say what the field holds.
> 
>>
>> But it looks like we could improve this to hold an actual meaningful
>> data here, instead of a preshifted value, and rather shift it to the
>> register when the hardware needs it.
> 
> Yes that seems better. Will store the actual bps value and shift it at 
> the PFE_CFG0 write where its needed, will that work ?

Try it out, and if it's better, yes, send it in the next version. If
it's not looking good, reply with a snippet/reason why

Eugen
> 
> If so will fix both in next version.
> 
> Thanks,
> Balakrishnan
> 
>>
>> Eugen
>>
>>>
>>> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
>>> ---
>>>   drivers/media/platform/microchip/microchip-isc.h | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
>>> index f5e322c2e36b..b084459f4583 100644
>>> --- a/drivers/media/platform/microchip/microchip-isc.h
>>> +++ b/drivers/media/platform/microchip/microchip-isc.h
>>> @@ -62,7 +62,11 @@ struct isc_subdev_entity {
>>>    * @mbus_code:               V4L2 media bus format code.
>>>    * @cfa_baycfg:              If this format is RAW BAYER, indicate the type of bayer.
>>>                        this is either BGBG, RGRG, etc.
>>> - * @pfe_cfg0_bps:    Number of hardware data lines connected to the ISC
>>> + * @pfe_cfg0_bps:    Pre-shifted ISC_PFE_CFG0 BPS field value (e.g.
>>> +                     ISC_PFE_CFG0_BPS_EIGHT), not a plain bit-depth integer.
>>> +                     OR it directly into the PFE_CFG0 register word, or use
>>> +                     FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...) to obtain the
>>> +                     3-bit BPS field value.
>>>    * @raw:             If the format is raw bayer.
>>>    */
>>>
>>>
>>
> 


