Return-Path: <linux-media+bounces-51614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK1KALV/eGkFqQEAu9opvQ
	(envelope-from <linux-media+bounces-51614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:04:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E209177C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D333063B7B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54492331222;
	Tue, 27 Jan 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qWjB13lq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133FD32BF47;
	Tue, 27 Jan 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504368; cv=none; b=G8EB4vY7INVaI+l4e8uJX/eOFo/ZVQFTUVQx4bsRLWHYPZUcD+jEQQNIp+BYE6jUU22ARLIt3kJgiDcyNieEKlx6OYCDN1yzvJKA9a61qkRoCxayU25jXcdevIyaRl2JCoTvacrOSPbNPVLGT9TLuZAUrzWFugHrKGHV5VJfJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504368; c=relaxed/simple;
	bh=NKkZ3zm8NODoT/x6DlsGB1ENcssuKfeQJk25tEeiOv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXnrmaDimQxyIXxvNSm+G8CFh8KPbBdA5UEYqNes/ElQMhrXI+S7Z6xqmUmstsZeSmtwD/7uxiI4dpZmGFGQNCnyZf4ioTtlgrvFxFfXn1t7O5IltFa5FT+DkIKtvZoTgNp/C3PGRDc5nNXfP18OL/gkt0t3zqpAhFQa5DWS4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qWjB13lq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56DED186F;
	Tue, 27 Jan 2026 09:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769504328;
	bh=NKkZ3zm8NODoT/x6DlsGB1ENcssuKfeQJk25tEeiOv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWjB13lqSG17+n4OVX9/jZPQkdJnP5jdPzRkujSyPm64PyE7Fq6Incdv+zJWOo3tb
	 AOKxwfhyFk6g/Nm6F8nSki9KvQ6ABheZTA85E9kDJa7ZJP8cFUvGNRQ3D3ZQ9ibwao
	 SULeGXr3+StomlE4vxolvgEqiCEKichU7ir4vmIk=
Message-ID: <4d1556bc-7a57-407a-a124-a83accc7afc8@ideasonboard.com>
Date: Tue, 27 Jan 2026 10:59:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
 <9878845f-c403-492c-a673-90c91472ecc2@ideasonboard.com>
 <20260126193929.GB3751370@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260126193929.GB3751370@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51614-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86E209177C
X-Rspamd-Action: no action

Hi,

On 26/01/2026 21:39, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for digging in this.
> 
> On 2026-01-26 16:01:36 +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 31/12/2025 11:57, Niklas Söderlund wrote:
>>> Hi Tomi,
>>>
>>> Thanks for your persistent work on this series!
>>>
>>> On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
>>>> Add streams support to Renesas rcar platform driver.
>>>>
>>>> The series keaps compatibility with the current upstream for a single
>>>> stream use case. However, in upstream there's a limited custom
>>>> multi-stream support implemented to the rcar driver, which will be
>>>> replaced with the upstream's Streams API.
>>>>
>>>> I have tested this series on Sparrow-Hawk board, with a few different
>>>> setups:
>>>>
>>>> IMX219 connected to the CSI0 connector
>>>> - The following patches applied to my test branch in addition to this
>>>>   series:
>>>>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
>>>>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
>>>>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
>>>>      breaks RAW8
>>>
>>> That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
>>> you see RAW8 breaking?
>> I think I found it. It's broken for all formats and resolutions, based
>> on luck:
>>
>> VNIS_REG has the lowest 4 bits always 0. From the doc: "These bits
>> specify the width of the transfer destination memory in 16-pixel
>> unit."
>>
>> We do nothing to comply with that.
> 
> Yes we do, but maybe not enough?
> 
> In rvin_format_bytesperline() we align for this, we even consider the 
> special cases for NV12 and NV16.
> 
> The value written to VNIS_REG is vin->format.bytesperline / fmt->bpp, 
> and the value writen to vin->format.bytesperline is ALIGN(pix->width, 
> align) * fmt->bpp. And for all formats (not NV12 or NV16) is 0x10, so we 
> do align it to the 16-pixel unit no?
> 
> Maybe their is a corner case I have missed or maybe I'm missing some 
> other angle? And I agree adding and removing the fmt->bpp multiplier is 
> not the best here. As we have finally moved this driver to media graph 
> only there are lots of areas things can be cleaned up and improved as we 
> no longer need to consider all that Gen2 special cases. I bet this can 
> likely be cleaned up.
Right, but if we have the stride / 2 code in, we will get strides not
aligned to 16 bytes unless the bytesperline happened to be aligned to 32
bytes.

I sent "[PATCH] media: renesas: vin: Fix RAW8 (again)". I still don't
understand exactly how the RAW8 processing goes in the hardware, but
afaics the stride / 2 is required, I cannot get any proper images
without that. The documentation doesn't really describe it so I'm not
totally content with all this.

Anyway, please test the new patch on your end, perhaps we'll finally
have a conclusion on the RAW8 =).

 Tomi


