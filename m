Return-Path: <linux-media+bounces-51623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BW1MEyXeGkWrQEAu9opvQ
	(envelope-from <linux-media+bounces-51623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:45:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B293166
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7330F305D0DC
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64938343D76;
	Tue, 27 Jan 2026 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzpujCWt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387734106A;
	Tue, 27 Jan 2026 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510596; cv=none; b=pY2lUdhNQ+X6l5dyKoOtcU8+j+nFvUq05r3dCD2ph1+KQrK+kF9sOANGWBSXV0EoE9cE9CUarHw8Ns9hlsGUYhZ38j7SgdIEkw0O3yZTXZnMWX/1iXwjkZCkML+V0ahEXChIhrRcfDAeS3cfLD60Nn0/wi7ZqqjFpxdm+K8TwRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510596; c=relaxed/simple;
	bh=jyobfJ96OlW3K4tTEPQRzR6fuXN3a0yGmEi2N6tUdq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncpUH6P8qYSf2fKyT+r1oWcj+jGSDCYuim1ZOajHFjmJZ0DkyTWwHXIWSpTmW24tIHBJpDD7xmxXlc2/1b0TW7vmu6EucwY3n8smHwpw2itz+t/MYysMZ1XBcm2CED9EFFNuCYV0fXqeku49QVXjOXdxL9QrUF2Ck5PPDaLcdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzpujCWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475F6C16AAE;
	Tue, 27 Jan 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510596;
	bh=jyobfJ96OlW3K4tTEPQRzR6fuXN3a0yGmEi2N6tUdq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LzpujCWtRfwnE1AK1SESY8tr7XywPhiA0ZixYwF55yoG9RiBkg0vj35Yu73nAbpFj
	 iH3NUk2CnLG/g3Ot5+P4aYKTiFyiBvcjacIWnIXWSvEc+lETjeeznIgyjsGYHTTlv9
	 gIV7i/oQt3fcpigu8p057W6PshSnrMdh2Ew1rjO3g6DdvBLBrwiu1Ch0xg0N+qxgw5
	 thofwu+CYHx6pA7bVksUZsEaZyFAKF2wYBXuS6WlwbbdHQroCRqxb3NvMav0bxrZD4
	 6b2qrkcllsNEf4gZhgKgpJAtOryAGowu3MCHq/dNCUtKiQPIMmIbZ+QqVMvS6R+cF2
	 AW+yTt+lqdy9g==
Message-ID: <2ecfd6ff-8599-442e-aa9b-9e3d1e6c509f@kernel.org>
Date: Tue, 27 Jan 2026 11:43:12 +0100
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51623-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 332B293166
X-Rspamd-Action: no action

Hi,

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

I agree the commit message needs work.

This is overall a useful change to have though. Even on x86_64
it is better to keep the sensor enabled when userspace
does a stop + start stream in quick succession rather then
needlessly powercycle it.

But the commit message needs to explain that this is generally
a good thing to have to avoid unnecessary delays related to
power-sequencing when userspace does a stop + start stream in quick
succession.

Regards,

Hans


