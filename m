Return-Path: <linux-media+bounces-51571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELzMByxud2mMgAEAu9opvQ
	(envelope-from <linux-media+bounces-51571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:37:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5788EE9
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58F42305DEE2
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403DE33A6F2;
	Mon, 26 Jan 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXDqnxO2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57173321DE;
	Mon, 26 Jan 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434277; cv=none; b=NwCw+VYOVA9o/1hbonhIpvWphxpDjMuEe+tD+7k/807Td9NDtLEvfnObdz6BIS8Gq7S7XY2zG79sjKqtA/7KGQ42Gs0deoNNPRV8PPHH0t821xuJkdgVKE08P0RrVZrHXHo1I0grGw1aPA5QWpiePOE9YQGpurfQ3aXN0EwUygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434277; c=relaxed/simple;
	bh=2aOW7HVJlk6fN9U9mdJ3suhxWjIdlE+8eYNBG3if8K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbqLw5/fJPn38ROhgA+kbRTIAvBgVbKB1cLSTJ32jw9+6tJ9suwKF5buJZmJrXg2fE/f9V1WdXlsQ2Yh+sHF9pbYZb659XPHhlpqGDqTecLNDZZ0V5sSZee57iOQJL57WdepJjVCWIM3e40olLkJaL52BXjzYzBl67GKu2wLid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXDqnxO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43896C16AAE;
	Mon, 26 Jan 2026 13:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769434277;
	bh=2aOW7HVJlk6fN9U9mdJ3suhxWjIdlE+8eYNBG3if8K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXDqnxO2CjDrNzskSpdEdQ7rYgYavFsu8rYzjyXbgIq2DVRVjmUUwOBvB6ghLnalq
	 rj/ojZrTMS01hBYrpyL1XE5O68KhM211Qf3Uu3i7sDv7mEp9aRsbVsdYMQDaeukqx+
	 tRmyXdOptRx9M4spwkdRfUWG+mPvRXIimvH81fhahUBA+7pCpECHyFDSeML2qiioXu
	 6ZpMAVKNG3sqUXQmRDxTCkc+zCFDZPSoopIA9IJWJIOfAcWGyuhN4brsOoqeaqXUXQ
	 SPMbzVBV5XoSpXdsKJ1S+8b6IhVLolUzTcSYSMkKB0FsDc5oDdEV1wNQybeNuDK70X
	 eXgM32OLcLRXA==
Message-ID: <2084a247-053b-41c0-84ef-c56af640aa74@kernel.org>
Date: Mon, 26 Jan 2026 14:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: Saikiran B <bjsaikiran@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
 <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
 <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
 <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51571-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60B5788EE9
X-Rspamd-Action: no action

Hi,

On 26-Jan-26 13:48, Saikiran B wrote:
> I used a 2ms delay for the initial reset assertion.

I think that what Bryan means is you need a 5ms delay between
asserting reset/xshutdown and enabling the regulators to make
sure that the sensor sees the reset signal high before
the regulators are enabled.

Regards,

Hans




> On Mon, Jan 26, 2026 at 6:11 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 26/01/2026 12:24, Saikiran B wrote:
>>> Yes, I implemented your suggested sequence in power_on():
>>>
>>> Assert XSHUTDOWN (Reset GPIO = 1)
>>
>> +5 milliseconds
>>
>>> Enable Regulators
>>> Enable Clock
>>> Wait 2ms+
>>> Release XSHUTDOWN (Reset GPIO = 0)
>>>
>>> Even with this sequence, the brownout prevents detection if the
>>> off-time was ~2.3s (I got this 2.3s number by conducting extensive
>>> stress tests on the platform starting from 50ms to 3s. At 2.3s the
>>> success rate was 100%. Anything below 2.3s, the sensor entered a
>>> brownout state atleast once.)
>>>
>>> Thanks & Regards,
>>> Saikiran
>>
>> ?
>>
>> ---
>> bod


