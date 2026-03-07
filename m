Return-Path: <linux-media+bounces-54850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPePOD8krGlHlwEAu9opvQ
	(envelope-from <linux-media+bounces-54850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 14:12:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5322BDBA
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 14:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FC99301F48C
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 13:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B24A3A1A52;
	Sat,  7 Mar 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td38+9D4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42227E06C;
	Sat,  7 Mar 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889126; cv=none; b=a2yDphVdNDEE8d2egnaLxlexZIJXCQLwQCkMgJQ8EOU07aHTFaIWZTy7oTLAaqt1cIbLVv5UiGXKns2ksaeUe8obDLeS/KkoLJ5db8d4lQNJ6D+kbfmfRhnG5cg3T2nVzgr2CLUcaqEoR0Ps6NFW8Qir4Gpnj8oy7qbPb419b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889126; c=relaxed/simple;
	bh=+9wJGWnO3qf8MzI6BlcZQNUv0vEbACN23iiyGPbhgYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7lz5Yx6Npse60XwPQT8LLxrGMUXp0sl+qhzee8nHAGd+zBSoW2FhtoLNIUDFoniNmaB2qopNisxWAZMp/15QiTKHzVF5mkm19TrKV4RSXQd83LM6K33qmx4Df4rbwEPYrtndPUIkrnHzu8EWOlBl4kHVR/6SHw/C7P7SZ3i+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td38+9D4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA364C2BC86;
	Sat,  7 Mar 2026 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889126;
	bh=+9wJGWnO3qf8MzI6BlcZQNUv0vEbACN23iiyGPbhgYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Td38+9D4eey5uXsHEJnFdjliNlLYRs7RzTJ8kGosVwoJNPHNQLzBgBKjb8sp/Jefh
	 JegYFLsAwag7EnhV9vokpANYYbyhhzNe7V1BZgq2wQbRITLdcCWdvjclh674aCZH2f
	 tF813nhKzxc8/cFB0fCgFot1r3bqI368j+Tzbr1igMjP9gdsIxOP3IennfmmhX/dFk
	 RQQD7Vs+nvlHxEYSevtkpeWwAUFUopTPo4HcDlrPMpTpjJiR/ZVrFBUHLYPi2rfclB
	 kRIbbWpGXYY/9bwbdIWFw3F+NQlb5JSdJ0ognUZ0Q/bct5vL9utLwqEGKDMj5NItcA
	 vBkxXnde1CmEg==
Date: Sat, 7 Mar 2026 14:12:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] media: iris: add support for purwa platform
Message-ID: <20260307-talented-civet-of-strength-356cb5@quoll>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
X-Rspamd-Queue-Id: 4FE5322BDBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	TAGGED_FROM(0.00)[bounces-54850-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:44:28PM +0800, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware=E2=80=91accelerated video encoding and decoding.
>=20
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
>=20
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
>=20
> Dependencies:
> https://lore.kernel.org/all/20260202-purwa-v5-0-1f5a93578802@oss.qualcomm=
=2Ecom/
> https://lore.kernel.org/all/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd=
6@oss.qualcomm.com/

I don't understand why you coupled them and added these as dependencies.
This only makes it difficult to test and technically your media patches
cannot be applied.

And I don't even see what is needed from these patchsets for the media
bits.

Best regards,
Krzysztof


