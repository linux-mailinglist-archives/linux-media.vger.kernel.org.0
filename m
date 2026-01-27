Return-Path: <linux-media+bounces-51624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLeYDE+YeGkWrQEAu9opvQ
	(envelope-from <linux-media+bounces-51624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:49:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2293261
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBBAB307C978
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7164334405E;
	Tue, 27 Jan 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqJ0cCW3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459C33CE9B;
	Tue, 27 Jan 2026 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510663; cv=none; b=KajwtUm4JBhTClru6y246Z/mLC79Af61YZhW4RxpxH/zETXziFqvlJ4yAo1iEgD9XP6KgeftHa+RG0zUKArz3mn+ML9HMrd8JJ9Khf40+tZia/v8CsCXPmZ4XoSDp2GstNtCI6o3FS1JlFMP0cai46l2tf3Um77c9KJDpr1yem0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510663; c=relaxed/simple;
	bh=fe6jsoP6wiwv9sD2TLG8dlXjbtoFP2vey4oFqzHNg+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoKiwDea2D9rUEwAU8d1G9oLfo2aPQyIAlELyQqtDkkMEWEg2LDwdkOSCsMhtmh+N4CTsMEgSVNTSJBc3xOp/piuY3bNaSS89b/isEswuj6aEu83KvGSXXy7rEgU0hwzesbSrA2LKOhRDTgpSzbqMYIuMetOhI2il5w7qHfSexI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqJ0cCW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741BEC116C6;
	Tue, 27 Jan 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510663;
	bh=fe6jsoP6wiwv9sD2TLG8dlXjbtoFP2vey4oFqzHNg+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mqJ0cCW38jdZM+ndfpp01/k4OxkE03o7a5iaTSCnipPIjbevKLI033Ga4KlUrjse6
	 bIA5OVsYYgusLaIVu1t47AWk11DCaG7sy2j4D2bq+vyLm1l75HAY2OKa4qp6f4/8ff
	 GbMx09moY4XDnlDZB60eXfz2/3uP0J2pt0YTmTJU16RTK+qBsyZMQh83Rw2Yjrk8xF
	 tZxjLIV1zP7H+nCxdBOGmhuf8xy3/aY/Nhh7p0FL1ZFsMqmykRPKa+l+owutKDeT1z
	 QuZuNhB+H83vpfI7ZhL8MCgFyvOuJMgs/oBoKyODEhqPJMVtyXF3um/sJnbBJTupZx
	 t/fYrTrztywgA==
Message-ID: <a51dd748-ae3d-4790-abe9-ec99a35a3152@kernel.org>
Date: Tue, 27 Jan 2026 11:44:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-4-bjsaikiran@gmail.com>
 <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51624-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87E2293261
X-Rspamd-Action: no action

On 27-Jan-26 10:46, Bryan O'Donoghue wrote:
> On 26/01/2026 17:34, Saikiran wrote:
>> On Qualcomm X1E80100 platforms, the OV02C10 sensor experiences brownouts
>> if power-cycled too quickly (< 2.3s) due to slow passive discharge of
>> regulator rails.
>>
>> Implement Runtime PM Autosuspend with a delay of 1000ms. This keeps the
>> regulators enabled for a short duration after the device is closed,
>> preventing costly power-off/power-on cycles during rapid user
>> interactions (e.g., browser permission checks).
> 
> But if you try to power the sensor 1.1 seconds later what happens ?
> 
> With this commit log this submission is a NAK, for example why do I want this change on an x86 machine ?
> 
> We need to root-cause the failure not paper over it.

p.s.

I also agree that the actual problem with stop + start stream in
calls quickly after each other still needs to be properly figured
out and fixed.

Regards,

Hans



