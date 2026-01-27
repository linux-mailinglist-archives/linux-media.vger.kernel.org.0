Return-Path: <linux-media+bounces-51711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGoVFTY6eWkmwAEAu9opvQ
	(envelope-from <linux-media+bounces-51711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 23:20:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66D9AF90
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 23:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE0DB302B3A9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 22:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B11235CB94;
	Tue, 27 Jan 2026 22:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlJMTKxS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB5250BF2;
	Tue, 27 Jan 2026 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552426; cv=none; b=K96JALziVl/E7qu+J0tAjO3Stx52xGs0Mw3gEy0DgGJLtZchOZdqIl0lh0F/A4TIwt9k8Sh6OSZkJbzIo7uSBLgNfmwdxeOTAC4LmnZblS+B7QLwmzM1jMeSAe9CVg678uv78p+pPyAa0f3S6lg5/MKs2wcCbBCTgmUEbV9zlXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552426; c=relaxed/simple;
	bh=b+E5T+JsvzHJA1uOtmSg77EZOCjwOSjfDcHhDY0XUyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQzxoCsEJ9YlprE8rBrg1BQZJaNELCHrNYsnXyPJ5iUvHev3mjiccg6nt8lYqRdA+pVRqywqv918sC6Qji0R0/mnOniHioo0FoekxsJV46u6NREK7yUQxFcwWBKwLwncXqS7Yk/pGC1A4kfdpa+yxufr9FD7wGey/NCVUm8uR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlJMTKxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A308C116C6;
	Tue, 27 Jan 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552425;
	bh=b+E5T+JsvzHJA1uOtmSg77EZOCjwOSjfDcHhDY0XUyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HlJMTKxSfFSE8B9wnZf3B/e/rhBkc9HfWejPY+L//pyeJ+tjr8KY8mv6WOuf6Eyz9
	 eWOoxFuQF3Wbtb50Tr9xgU9O4GjcFZOSn9pScR7TTDv8KS1iPfNnic6wCDqgonsBd2
	 yDOmRWiM/AJCm0RTcJMYFWHBjoDiS1aofwg3Wwo7NI40pL8fhMcWBXqGQQ89U2wuAj
	 1BmCQHvZzzn99DKOlwdq+4si/l+Pn5qAX5d6Ofm6yOobFWsREoJ2FL4VJGxdtMyyBZ
	 Nqydg27DsSSynVUWSFIfXgOwvPm8hYnbLtP3w+THbcMqJNHE/cNhFoxZcJs6Gba4Ah
	 qhH7a/b2+Y6og==
Message-ID: <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
Date: Tue, 27 Jan 2026 22:20:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Saikiran B <bjsaikiran@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
 vladimir.zapolskiy@linaro.org, hansg@kernel.org, mchehab@kernel.org,
 stable@vger.kernel.org
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
 <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain>
 <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51711-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: EB66D9AF90
X-Rspamd-Action: no action

On 27/01/2026 17:11, Saikiran B wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On Tue, 27 Jan 2026 at 19:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>>> +     /* Assert reset for 5ms to ensure sensor is in reset state */
>>> +     if (ov02c10->reset) {
>>> +             gpiod_set_value_cansleep(ov02c10->reset, 1);
>> Is this needed? Isn't XSHUTDOWN already asserted here?
> 
> You are correct that "power_off()" asserts the reset line. However,
> Hans de Goede (Cc'd) suggested explicitly asserting it here to strictly
> enforce the datasheet's T1 timing requirement (Reset low > 5ms) during
> the power-on sequence. This ensures the sensor is in a known clean state
> before power rails are enabled, even if the prior state was inconsistent.

The data-sheet doesn't specify 5 milliseconds - it specifies T3 as 
infinite that is the period between XSHUTDOWN assert and VDD off is 
called "hardware standby"

Does this reset fix the problem for you though ?

We might try this to stop the reset pin floating

reset-n-pins {
     pins = "gpio237";
     function = "gpio";
     drive-strength = <2>;
     bias-pull-down;
};

> 
>>> +             usleep_range(5000, 6000);
>>> +     }
> 
>>> -             usleep_range(5000, 5100);
>>> +             usleep_range(5000, 5500);
>> According to the datasheet you seem to need 8192 XVCLK cycles after
>> deasserting XSHUTDOWN before proceeding with I2C access.
> 
> The 5ms delay covers this requirement with a safe margin.
> With a standard XVCLK of 19.2 MHz (or even 9.6 MHz), 8192 cycles
> takes approximately 0.4ms to 0.8ms.
> 
> The 5ms delay (usleep_range 5000-5500) ensures we are well beyond the
> 8192 cycle requirement for any supported clock frequency.
> 
> Thanks & Regards,
> Saikiran

Adding reset to power-on @ 5 milliseconds if it actually fixes the 
problem is defensible but, be careful about claiming it is being done 
because of hardware requirements, since the data-sheet doesn't mention that.

It sounds to me as if the reset added here isn't ? actually fixing the 
problem for you ?

If so we might try

- Setting bias-pull-down on the reset line

- Making sure the CCI lines aren't supplying voltage
   I may have missed but, did you give that a try

- And again interrogating the PMIC LDO register states
   to show if the LDO is on/off when we think
   Since the RPMh is a firmware which takes cast votes
   if we have messed up sharing say VDD somehow, it is
   possible power is on when we think it is not.

- It is also possible active-discharge is not set on the LDOs

I guess one way to know for sure if XSHUTDOWN or regulators is our 
problem is to never turn the regulators off.

bool enabled = false;

power_on() {
	if (!enabled) {
		regulator_bulk_set();
		enabled = true;
	}
}

power_off() {

}

If we leave all other delays out - nothing in DT, no changes in ov02c10 
and simply never switch the regulator off, once it has been switched on, 
we'd have some pretty conclusive evidence if brown-out was a thing.

How about it ?

---
bod

