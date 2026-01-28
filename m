Return-Path: <linux-media+bounces-51721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHQRHEfbeWkg0QEAu9opvQ
	(envelope-from <linux-media+bounces-51721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:47:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AA9F010
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C773300D313
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5766D34D4EC;
	Wed, 28 Jan 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7ICIGUw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988934CFBB;
	Wed, 28 Jan 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593633; cv=none; b=DHye5cDgw2D+3NbKTBBdBeVqbHhzDzAWx8dNA5K23o9HjCZcqqT9KVmsGPrtbFhWBJroMzj6MWp25EUNVVGPYBe4POVgjDWjyIId8r5RyIp+FAJPKoGWIST4t+TO1T4L2zgvwUEI5F0C74vovvNt00vjDXp0Qe+cuCDti4UP4J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593633; c=relaxed/simple;
	bh=Q6azG1vWq1WpeiNInU90UPoiaAsKiqcUe9jUJhuU6mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7WVIayKu/q2leKvVa7eYsLmmO28P/DGqAoTyJYZqpd6ngJQzJaJbdsBktRJmOG8fJiizMVv9GE+3ohGY0PZzwEHTdZb2qPZSaV63u39At0i630njUsRLlYWcMbHg0WfYpTUk42tYfHnKaJFVodK8g0Uu3h616LIEEmsM/3k1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7ICIGUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA56DC4CEF1;
	Wed, 28 Jan 2026 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769593633;
	bh=Q6azG1vWq1WpeiNInU90UPoiaAsKiqcUe9jUJhuU6mQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E7ICIGUw2BkNw+pJJZxA/ia7RhW19i7NjqihWjuHuR+BDI7BDxarkamUW8MCUO+bC
	 IkyAZnuTykvjLEN4Ie5QG9uz1vdtTyA7WVCr8SPS0fthvVkWtE+f3ELWPFd+J3QrXR
	 Pwx9lcjuq3E2OxEzQsAEx79iqKc3JARLWdproOf70n1j4m83wdZu+SsjNzbtBisIT4
	 7BTdTzJ30/b8PsHekgfR4GrFXITwM5JNlawnLK8C0ksMNbLYLU29038aqR1C2GC1nD
	 xzzieVIEDXkdytgnqZ0qzr4mwO0ND1ZFNeMY9Py62Nk3g6odpVm1cXtqHAWPcf533z
	 AF01O8Xmn39VQ==
Message-ID: <92131a67-471e-41e8-83d6-4f802103db7b@kernel.org>
Date: Wed, 28 Jan 2026 09:47:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Saikiran B <bjsaikiran@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 vladimir.zapolskiy@linaro.org, hansg@kernel.org, mchehab@kernel.org,
 stable@vger.kernel.org
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
 <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain>
 <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
 <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
 <MZajBkG4hU2kIZFDZbpq0WZOF_tJmASpmGr-7IH_qheO0We0Z45KNZPrQY4UmoqsWKOX3lSx1W_hnLtfKocXPw==@protonmail.internalid>
 <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51721-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF3AA9F010
X-Rspamd-Action: no action

On 28/01/2026 03:41, Saikiran B wrote:
> Hi Bryan,
> 
>  > Does this reset fix the problem for you though?
> 
> The reset cleanup in this patch (v4) is for correctness (to match T1), 
> but the
> primary stability fix for my platform is indeed handling the regulator 
> brownout.

Hmm. Still not sure I agree with you that its browning out.

>  > It is also possible active-discharge is not set on the LDOs ... I 
> guess one way
>  > to know for sure ... is to never turn the regulators off.
> 
> You are spot on. My testing confirms exactly this: if the rail doesn't 
> toggle -
> (or is given enough time to discharge) tested and proven in v2 patchset 
> where I kept the regulator on after initial toggle and just handled the 
> camera via software reset, the sensor worked perfectly.

Just to be difficult - I'm specifically asking to test never switching 
the regulator off - not having a long delay.


>   The failure only occurs if we toggle the regulator off and on again 
> too fast for
> the bulk capacitors to discharge (passive discharge).

A statement I still don't believe is supported by the available evidence 
have you tested.

- The CCI pin change ?
   This is to see if the CCI pins are inadvertently supplying voltage

- The XSHUTDOWN pin floating change ?


> Regarding Active Discharge: The `qcom-rpmh-regulator` driver currently lacks
> support for the `regulator-pull-down` property (it doesn't send the required
> RPMh resource commands). I plan to investigate adding that support 
> separately,
> as it would be the ideal long-term fix.

I'm not sure RPMh supports that.

What I've done in previous email is show you how we should go about 
determining the setup and the state of the LDOs.

Linux -> RPMh -> SPMI -> LDOs

We can also do

Linux -> SPMI -> LDOs to look at the register state directly.

I have to say I am 100% against adding random delays in the order of 
_seconds_ without getting a good hard look at the LDOs, testing the CCI 
changes and/or testing to see if XSHUTDOWN is floating.

> For now, I have submitted a patch series to `linux-regulator` to add
> `regulator-off-on-delay-us` support to the `qcom-rpmh-regulator` driver.
> Mark Brown has already reviewed it and I have just sent v3.
> 
> Once that lands, the Yoga Slim 7x DTS will enforce the physical delay at the
> regulator level, which resolves the brownout cleanly.

I again.

- Do not believe we have root caused a regulator brown out
- Believe we should interrogate the LDO settings
   We can look at the bits and see if active-discharge is set.

Please do that !

> This media series (v4) is now purely to ensure the OV02C10 driver follows
> the datasheet power-up sequence correctly, independent of the platform- 
> specific
> brownout.

I have the data-sheet so while I think XSHUTDOWN at the start of 
power_on() would be justified IF it fixed the problem for you, we've 
established it does _not_ fix the problem for you.

Please, please, please - re-read the asks I have for you on debugging 
this and engage with them !

---
bod

