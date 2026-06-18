Return-Path: <linux-media+bounces-65189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xPIMBmvgM2pgHgYAu9opvQ
	(envelope-from <linux-media+bounces-65189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:11:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFC69FF0A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:11:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ixit.cz header.s=dkim header.b=eyfWH5jA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65189-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65189-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ixit.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21C813019567
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06583F412B;
	Thu, 18 Jun 2026 12:11:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AA3F44D4;
	Thu, 18 Jun 2026 12:11:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784677; cv=none; b=EyTzB13/O9Ae5xLAknI7tLQr918B9PGw3XaUxlUXNK0nJpb4gA6kdww2Y+LgZwisHjMU6javGp6hEDO+wHOvPU0gpwczKWfqtSpNO/ltWX0Em5CLtNA5zQa5O6bUL3jfBjnj3BXnlruqSTdnlzck7YYHruCVee0GjpPhamJQRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784677; c=relaxed/simple;
	bh=CgT5b7iffy91V1bn6yhWYZFkuNsBc2KV3ijRnSrocVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPqgsVis7bK9jZ9zx0yj3a+gqoKDrXHsE0ARTObXuyBGnc2bZzMbj0+Y8v+miEO0GrD3zsIWeHrhOULRI9PpL4F1/FV0YuGQXAKuWDFWjV+EvH0c917/Wo/TJ8GR53gaQAdBwWOtMhzRnTMcDMbxqfHRRXpMAiMTSKhoWoMV0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=eyfWH5jA; arc=none smtp.client-ip=185.100.197.86
Received: from [192.168.88.251] (ip-94-112-130-239.bb.vodafone.cz [94.112.130.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 381E553403FC;
	Thu, 18 Jun 2026 14:11:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1781784661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gHlSSXBO96COOx8v/VBWvwLdrliB4UTqaxOYaQD4+Rg=;
	b=eyfWH5jAsTZ7rrYyYOu3GXuHErmn0hPCfB46da3Uc0yi3T6+6YbvW5/JQ7hw1BDZ5Qm1oO
	w9e62HgwL+C7BXlUG3stMKS4QUbHgVpC8qcruTgwhxgUIUT3qyimGetpOl9jt9jyBDR6x6
	k63RPnoCdcRfPQ5qnX15Qxf+iuP/sqE=
Message-ID: <effcf731-4325-4e27-9330-afa1ea709c9f@ixit.cz>
Date: Thu, 18 Jun 2026 14:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
 <CAPY8ntBrQaSn8bvw76qW1MF1=xcA+5u3XVvhGwO9AOO1nONu=Q@mail.gmail.com>
 <CAPY8ntA=1EK20GmqWJzzW7Tp8Mh8aXNad8+ZBG2xVcxrAkwVSA@mail.gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <CAPY8ntA=1EK20GmqWJzzW7Tp8Mh8aXNad8+ZBG2xVcxrAkwVSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65189-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ixit.cz:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ixit.cz:dkim,ixit.cz:email,ixit.cz:mid,ixit.cz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6DFC69FF0A

On 17/06/2026 19:40, Dave Stevenson wrote:
> Hi David
> 
> On Thu, 16 Apr 2026 at 12:26, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>>
>> Hi David
>>
>> On Tue, 14 Apr 2026 at 11:17, David Heidelberg via B4 Relay
>> <devnull+david.ixit.cz@kernel.org> wrote:
>>>
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> The IMX355 sensor supports multiple external clock frequencies,
>>> including 19.2 MHz and 24 MHz. The driver currently supports only
>>> fixed 19.2 MHz input clock.
>>>
>>> Refactor the clock handling to make the PLL configuration dependent
>>> on the external clock frequency and add support for 24 MHz. Introduce
>>> a table of clock parameter sets and program the corresponding EXTCLK
>>> frequency and PLL multipliers to maintain consistent internal VCO
>>> frequencies across supported inputs.
>>>
>>> The PLL settings are adjusted so that:
>>>    - VT VCO remains at 1152 MHz
>>>    - OP VCO remains at 720 MHz
>>>
>>> This preserves existing timing characteristics while allowing systems
>>> using a 24 MHz clock to operate correctly.
>>
>> I happened to have someone asking for this same requirement, so tried
>> out your patch.
>>
>> I don't have a datasheet for IMX355, but the patterns very closely
>> follow IMX477 and IMX708 for which I do.
>> Those both have a single PLL and a dual PLL mode selected via register
>> PLL_MULT_DRIV (0x0310). The imx355 driver is setting that to 0 for
>> single PLL mode, which means that the PREDIV_IVT (0x0305) and MPY_IVT
>> PLL (0x0306/7) settings do nothing as the IVT block is driven from
>> IOPCK.
> 
> I now have the datasheet and software reference manual for IMX355.
> 
> It says that dual PLL mode is not available.
> "In PLL single mode, IOP_PREPLLCK_DIV and IOP_PLL_MPY are applied to
> IOPCK PLL, and IVT_PREPLLCK_DIV and IVT_PLL_MPY are ignored".
> So there is no need to have alternate pll_vt_mpy values for 24MHz.
> 
> I have no idea why Sony say that dual PLL mode isn't available. When I
> was adding the 2 lane support I used it without any issues. I'm now
> reworking those patches to avoid dual PLL mode.

Maybe there is some ERRATA which makes it unstable or problematic?

> Then again the datasheet also says that LINE_LENGTH_PCK is constrained
> to 3672 in full res and 4x4 binning mode, and 1836 in 2x2 binned modes
> "to avoid sensor internal interference (FPN)", so they obviously hit
> some odd behaviours and just added constraints.
> 
> Do you wish to send a V2 dropping pll_vt_mpy, or shall I pull it into my series?

What works for you better (since u sending bigger changes than I do).

David

> 
> Thanks
>    Dave
> 
>> Your patch therefore works, but does more than is necessary - you
>> really can set pll_vt_mpy to any value and it works exactly the same.
>> I guess changing the unconnected IVTCK clock within the sensor could
>> feasibly change EMC emissions, but that feels pretty unlikely.
>> Possibly add a comment to your existing comment of "VT VCO = 1152 MHz"
>> to say that it's unused to avoid others going down the rabbit hole I
>> encountered.
>>
>> (For those referencing the other datasheets, the description for
>> single PLL mode lists configuring IVT_PREPLLCK_DIV and IVT_PLL_MPY,
>> but the diagram shows that IOP is always driven from IOPCK, and IVT is
>> muxed between IOPCK and IVTCK)
>>
>>> No functional change for existing 19.2 MHz users.
>>>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>
>> Whilst useful comments could be added, it does what it says and works:
>>
>> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>>> ---
>>> Known users: Pixel 3 and 3a.
>>> ---
>>>   drivers/media/i2c/imx355.c | 114 +++++++++++++++++++++------------------------
>>>   1 file changed, 54 insertions(+), 60 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
>>> index 27a5c212a527f..f9ec13bb27d10 100644
>>> --- a/drivers/media/i2c/imx355.c
>>> +++ b/drivers/media/i2c/imx355.c
>>> @@ -25,6 +25,11 @@
>>>   #define IMX355_REG_CHIP_ID             0x0016
>>>   #define IMX355_CHIP_ID                 0x0355
>>>
>>> +/* PLL registers that depend on the external clock frequency */
>>> +#define IMX355_REG_EXTCLK_FREQ         0x0136
>>> +#define IMX355_REG_PLL_VT_MUL          0x0306
>>> +#define IMX355_REG_PLL_OP_MUL          0x030e
>>> +
>>>   /* V_TIMING internal */
>>>   #define IMX355_REG_FLL                 0x0340
>>>   #define IMX355_FLL_MAX                 0xffff
>>> @@ -63,7 +68,6 @@
>>>
>>>   /* default link frequency and external clock */
>>>   #define IMX355_LINK_FREQ_DEFAULT       360000000LL
>>> -#define IMX355_EXT_CLK                 19200000
>>>   #define IMX355_LINK_FREQ_INDEX         0
>>>
>>>   /* number of data lanes */
>>> @@ -100,6 +104,33 @@ struct imx355_mode {
>>>          struct imx355_reg_list reg_list;
>>>   };
>>>
>>> +struct imx355_clk_params {
>>> +       u32 ext_clk;
>>> +       u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
>>> +       u16 pll_vt_mpy; /* VT system PLL multiplier */
>>> +       u16 pll_op_mpy; /* OP system PLL multiplier */
>>> +};
>>> +
>>> +/*
>>> + * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
>>> + * so the multipliers are adjusted to produce the same VCO frequencies:
>>> + *   VT VCO = 1152 MHz, OP VCO = 720 MHz
>>> + */
>>> +static const struct imx355_clk_params imx355_clk_params[] = {
>>> +       {
>>> +               .ext_clk = 19200000,
>>> +               .extclk_freq = 0x1333,  /* 19.2 MHz */
>>> +               .pll_vt_mpy = 120,      /* 19.2 / 2 * 120 = 1152 MHz */
>>> +               .pll_op_mpy = 75,       /* 19.2 / 2 * 75  = 720 MHz */
>>> +       },
>>> +       {
>>> +               .ext_clk = 24000000,
>>> +               .extclk_freq = 0x1800,  /* 24.0 MHz */
>>> +               .pll_vt_mpy = 96,       /* 24.0 / 2 * 96  = 1152 MHz */
>>> +               .pll_op_mpy = 60,       /* 24.0 / 2 * 60  = 720 MHz */
>>> +       },
>>> +};
>>> +
>>>   struct imx355_hwcfg {
>>>          unsigned long link_freq_bitmap;
>>>   };
>>> @@ -125,6 +156,7 @@ struct imx355 {
>>>          const struct imx355_mode *cur_mode;
>>>
>>>          struct imx355_hwcfg *hwcfg;
>>> +       const struct imx355_clk_params *clk_params;
>>>
>>>          /*
>>>           * Mutex for serialized access:
>>> @@ -144,8 +176,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
>>>   };
>>>
>>>   static const struct imx355_reg imx355_global_regs[] = {
>>> -       { 0x0136, 0x13 },
>>> -       { 0x0137, 0x33 },
>>>          { 0x304e, 0x03 },
>>>          { 0x4348, 0x16 },
>>>          { 0x4350, 0x19 },
>>> @@ -231,12 +261,8 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -280,12 +306,8 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -329,12 +351,8 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -378,12 +396,8 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -427,12 +441,8 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -476,12 +486,8 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -525,12 +531,8 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -574,12 +576,8 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -623,12 +621,8 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -672,12 +666,8 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -721,12 +711,8 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -770,12 +756,8 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -819,12 +801,8 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x00 },
>>>          { 0x0701, 0x10 },
>>> @@ -868,12 +846,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
>>>          { 0x0301, 0x05 },
>>>          { 0x0303, 0x01 },
>>>          { 0x0305, 0x02 },
>>> -       { 0x0306, 0x00 },
>>> -       { 0x0307, 0x78 },
>>>          { 0x030b, 0x01 },
>>>          { 0x030d, 0x02 },
>>> -       { 0x030e, 0x00 },
>>> -       { 0x030f, 0x4b },
>>>          { 0x0310, 0x00 },
>>>          { 0x0700, 0x02 },
>>>          { 0x0701, 0x78 },
>>> @@ -1422,6 +1396,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
>>>                  return ret;
>>>          }
>>>
>>> +       /* Set PLL registers for the external clock frequency */
>>> +       ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
>>> +                              imx355->clk_params->extclk_freq);
>>> +       if (ret)
>>> +               return ret;
>>> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_VT_MUL, 2,
>>> +                              imx355->clk_params->pll_vt_mpy);
>>> +       if (ret)
>>> +               return ret;
>>> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
>>> +                              imx355->clk_params->pll_op_mpy);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>>          /* set digital gain control to all color mode */
>>>          ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
>>>          if (ret)
>>> @@ -1749,7 +1737,13 @@ static int imx355_probe(struct i2c_client *client)
>>>                                       "failed to get clock\n");
>>>
>>>          freq = clk_get_rate(imx355->clk);
>>> -       if (freq != IMX355_EXT_CLK)
>>> +       for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
>>> +               if (freq == imx355_clk_params[i].ext_clk) {
>>> +                       imx355->clk_params = &imx355_clk_params[i];
>>> +                       break;
>>> +               }
>>> +       }
>>> +       if (!imx355->clk_params)
>>>                  return dev_err_probe(imx355->dev, -EINVAL,
>>>                                       "external clock %lu is not supported\n",
>>>                                       freq);
>>>
>>> ---
>>> base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
>>> change-id: 20260414-imx355-24mhz-b8ccfab3adfb
>>>
>>> Best regards,
>>> --
>>> David Heidelberg <david@ixit.cz>
>>>
>>>
>>>

-- 
David Heidelberg


