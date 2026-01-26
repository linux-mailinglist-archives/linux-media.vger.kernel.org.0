Return-Path: <linux-media+bounces-51558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LZgCNdYd2lneQEAu9opvQ
	(envelope-from <linux-media+bounces-51558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:06:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9087FFF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6FC8301738A
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F9E334C1C;
	Mon, 26 Jan 2026 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFPgtgwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9630ACE5;
	Mon, 26 Jan 2026 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429195; cv=none; b=MiwuyYIJO5KZNaTJXnXPVTITQ8UIbOGMpQ6E42q+bUNrgiFkusBkwUYhGOzadSUFhVJ4MG+pVtAIlOzRryAf3pmQX0LL3kqjkEr5/BJH3igUEkBN7vXOtJPrDzQ/u/DXBDtNq4/1ySKjjPdKFMlBxWbfubb4KW2YuvdQ9g+lEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429195; c=relaxed/simple;
	bh=Z4Veix6NtwpfiIxDAwJ3jCyGzKANeHY8XJrrxz48FSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ud5ewGHokJm0omI5Ad+bT/ICtkm99JaD8taLMpz9U3OrQiJ3VCpQ+xDutOW4sCe/7uUDRU2SZs7LUAQDL4kKs9IjOrB459BW25yJWTEXWXd72ccM2/d8js7pU+JI4fC0mk1yjLa3XOAIUIwN0POxTTlWZ18bN3cixqzPo93oft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFPgtgwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F0FC19422;
	Mon, 26 Jan 2026 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429195;
	bh=Z4Veix6NtwpfiIxDAwJ3jCyGzKANeHY8XJrrxz48FSo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fFPgtgwZJkVrOMC5Rrs3n3lRayaLmHCbpvj/2ILhqZr03LsBK0Z2L4hVCOcYQZb3D
	 mjvaUh+h7Ypl7/rSxsKdHGTDvlkp4HwDcoNn3HE+AvoyKBjXbTVrPXJqEDJ26wIqHy
	 mepxa5nVWknBeF1dUYsjbxZTu2sYv8nrnMkIbPIAHKOf3O/PQdDiKNxfrRUyzGgOou
	 yrUQlrU1VEkD1vHlICiE0eUvbZFr0U5ESRh3KqzwkRJCgQpGLiOyMGNbPCMpgVQkye
	 9Y6x6znTl4VwvT7ru/2eo1ZzNvBBxYwuC0Jfa2suT4CyuuEA4ePZESAu9gN9figsHT
	 f3HWLodOfNPXg==
Message-ID: <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
Date: Mon, 26 Jan 2026 12:06:30 +0000
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
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org,
 hansg@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
 <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
	TAGGED_FROM(0.00)[bounces-51558-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0D9087FFF
X-Rspamd-Action: no action

On 26/01/2026 11:58, Saikiran B wrote:
> "I don't think we've established the regulator is at fault. That's the
> feedback I'm giving you here. ... vreg_cam_1p8: regulator-cam-1p8 {
> compatible = "regulator-fixed";"
> 
> Just to clarify on the regulators: on the Slim 7x, the camera supplies
> (avdd, dvdd, dovdd) are all RPMh-controlled LDOs (pm8010 and pm8550),
> not generic fixed regulators.

Slim7x - not the Dell right ;)

> As I've confirmed that the qcom-rpmh-regulator driver doesn't natively
> support active discharge or parsing off-on-delay-us (generic
> property), which explains why the physical discharge constraint wasn't
> being respected.

No, the RPMh firmware should know how to do that. Not the Linux side, 
this is the part of your brown-out story that doesn't make sense.

BTW, did you try my given sequence - particularly the XSHUTDOWN in 
power_on(); ?

If the XSHUTDOWN pin is for example floating or not in the correct 
logical state when you power-on, the chip may not initialise correctly.

Which could lead you to conclude - you are having a regulator problem, 
when in fact you are having a sensor state-machine init problem.

?

---
bod

