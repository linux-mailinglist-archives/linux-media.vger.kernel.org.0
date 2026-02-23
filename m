Return-Path: <linux-media+bounces-53156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHYvDHcRnGna/QMAu9opvQ
	(envelope-from <linux-media+bounces-53156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:36:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1317319C
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C36C302D0A8
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 08:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3FE34D3BE;
	Mon, 23 Feb 2026 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RsvOxmIP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333334D391;
	Mon, 23 Feb 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835678; cv=none; b=DuUopyyb9Jt3AzqEmSvKK31qtHIDxaN2NCzGl5mplvBRNmc/WMShJ4/MTscj7HVMMjRy6DTo7WYnMLDm0dC9zmlXdzowAbGsNM94hiap7+PqUns1rvD0dAioEI6jSg6ezRL7TLv+CdKYhbZcPfa8DciVJyxgktWxQR7U6/6MV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835678; c=relaxed/simple;
	bh=HgnF5tDwRYa49IuzkllILutdowcp+R2+WL0ITLYsyzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+vyCLTns5V0OTfrnlI3MgL7FZbhseOsfAdfv2g/x30cPjGUtDfosHbzJJz+Kba8tOAA5AOB9qDCLC5D8I/RaDzoQuCowaRFrRANWkl/PEXHDiiI0utSuSJnkqKXXHiPtmMv0xBBK0x3VAtrB7/o0hyBexwWwlCLIuz7m3mPrSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RsvOxmIP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771835674;
	bh=HgnF5tDwRYa49IuzkllILutdowcp+R2+WL0ITLYsyzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RsvOxmIPCAAsWfy/MmMLC3P6ewoc2hDPBLOMM8CSW/8jT4fB6+DHwO+0YHNcysFd5
	 OSHBHT3gQnI7c6GibCJMocOkd2p4W4ByDYX0McD1QfCKxPR9WTgNkLRY+GeWqKXTDY
	 +4wSH9XXJlaAri4l/RzQ9TSi2c5jK+lFn5yOvvexBgyrUZQz9KL87+O0F2thGBCqPy
	 3sqjREvihHK3XA+Nt4ruQwaPYDZxfXpQ8RZDGfrWjMSMVd0VSUrRMOmlklxknn/WZ9
	 /yBV8beQf53q5jLMuOKGkIXqAWu1FR0aEgH76pg7uF7Gb0zlrSNtVSR1l917LbJ02W
	 WiUwLRyOA+QHQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 471AD17E043F;
	Mon, 23 Feb 2026 09:34:34 +0100 (CET)
Message-ID: <7dd95c39-99b4-4b95-822e-464ea04a41ca@collabora.com>
Date: Mon, 23 Feb 2026 09:34:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
To: Frank Li <Frank.li@nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
 <fb697f64-1f2f-4a9b-b430-23867f205f12@collabora.com>
 <aZiBwmPos318nW9g@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aZiBwmPos318nW9g@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53156-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BE1317319C
X-Rspamd-Action: no action

Hi Frank,

On 2/20/26 16:46, Frank Li wrote:
> On Fri, Feb 20, 2026 at 10:01:01AM +0100, Michael Riesch wrote:
>> Hi Frank,
>>
>> Thanks for your patches.
>>
>> On 2/10/26 22:42, Frank Li wrote:
>>> Add the helper API v4l2_async_pad_init_and_register_subdev(), which
>>> combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
>>> v4l2_async_register_subdev() into a single call.
>>
>> I think this is a good idea, but can you extend that to offer variants
>> for v4l2_async_register_subdev_sensor and v4l2_device_register_subdev too?
>>
>> The function names are awfully long, though. Can we call this
>>     media_register_subdev{_async,_sensor,}
>> maybe?
> 
> How about media_async_register_subdev()? which basic align other API
> naming. I want to add more helper APIs.

This would work for me.

> drivers/media/platform/synopsys/dw-mipi-csi2rx.c have about 600 lines code
> but related hardware register codes are below 20 line, only few registers.
> 
> I just post this simple version to gather feedback from maintainers and
> reviewers on the overall approach.

Sure, that's reasonable.

Just saying that if you plan to provide more helpers, there may be a
smart way to do so without copying the new helper function code three
times. Maybe

int helper(struct v4l2_subdev* sd, u16 num_pads, struct media_pad *pads,
	   struct module *module,
	   int (*cb)(struct v4l2_subdev *, struct module *))

and

#define media_async_register_subdev(sd, num_pads, pads) \
	helper(sd, num_pads, pads, THIS_MODULE,
	__v4l2_async_register_subdev)

or so?

Best regards,
Michael

> 
> Frank
> 
>>
>> Best regards,
>> Michael
>>
>>>
>>> Reduce code duplication and simplify error handling in drivers.
>>>
>>> Only change dwc and cdns. If agree add API, more driver can be simplified.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> Frank Li (3):
>>>       media: v4l: async: add helper API v4l2_async_pad_init_and_register_subdev()
>>>       media: synopsys: Use v4l2_async_pad_init_and_register_subdev() to simplify code
>>>       media: cadence: cdns-csi2rx: Use v4l2_async_pad_init_and_register_subdev() to simplify code
>>>
>>>  drivers/media/platform/cadence/cdns-csi2rx.c     | 18 ++++----------
>>>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++---------
>>>  drivers/media/v4l2-core/v4l2-async.c             | 30 ++++++++++++++++++++++++
>>>  include/media/v4l2-async.h                       | 18 ++++++++++++++
>>>  4 files changed, 55 insertions(+), 26 deletions(-)
>>> ---
>>> base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
>>> change-id: 20260210-v4l2_init_register-0e6d0adcfa21
>>>
>>> Best regards,
>>> --
>>> Frank Li <Frank.Li@nxp.com>
>>>
>>


