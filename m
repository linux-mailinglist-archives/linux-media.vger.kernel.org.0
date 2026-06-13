Return-Path: <linux-media+bounces-64776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +iOnJ3+fLWrshwQAu9opvQ
	(envelope-from <linux-media+bounces-64776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:20:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAD67F469
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KPosQfqG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64776-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64776-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22FCB3004DE2
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5CD384CEF;
	Sat, 13 Jun 2026 18:20:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51B6BB5B;
	Sat, 13 Jun 2026 18:20:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781374843; cv=none; b=ltW0PLWW7joW4X+s0jh6eLKigpx+z+VHKaisV+3Mhm/Qjx5QapqBJzIZX2qbRty1mYQffpFJJF4tJc/cndLdm8F8TZKeKEo2bF2SzBIei9J4LWlmwCsxOadwk46DohuIdElVwqCVNxX6EdWOBI/M/lLsIobVhR3RNGsYzJVbvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781374843; c=relaxed/simple;
	bh=nkOk4cv4TPBXAIK2hbUa9YuT+bfc3ZuhK2wi28MS8R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRzJR1KZap7bUYMQr06beTQJ8TNpD4G8BZGqWAxRoIulpGVtrgX+LghMsGdmBFjaspj0AqZd7qDRraOqt/kg1MjuZVCG/vhKCW6RNRJeUZ6AENGCivMwVmCXzx5PCx0M6OJipxzBTZtzVaXoc1cC5Qz+F3KdYNzdzPaszd9OODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPosQfqG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4791F000E9;
	Sat, 13 Jun 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374841;
	bh=Eud/G1Fl86jvawvMuS6QTDlOHo85kknsSJQpPdjorBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPosQfqG6ovGEAQl7kMEIPmlaWB93mmNPu0UBJFDzWW7DFopnFsHqSQtrAXJmtFwQ
	 igF5AXPbaCh4RKRdNlG+I49YeBGq0ev3alLzh8NS9JdnBg3RXwPWnGLHjqZfA1kDKr
	 K4XhRA52GLFd+v1GSRbja7pDKNA+7JnpSGPtaJkA0/SqeYVEmdkGHNX3eHAntC+bxE
	 ENv8roG0QneYzC21zP4DT3FMpmW8xe0c6Iwo4ta90ueW3+srF3GjbyvCsbgoR7koy2
	 u5ION/1rilgvevZ9K5+j0Sbk1ixNRXITz0SRgoBSceB9MC1zdYnp7L1+66/oOewUbE
	 CWUKUROpcDLiA==
Date: Sat, 13 Jun 2026 20:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM
 clocks to the public header
Message-ID: <20260613-dashing-phenomenal-capuchin-5d35ad@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-2-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-2-paulk@sys-base.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:yong.deng@magewell.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:mripard@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64776-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,magewell.com,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75EAD67F469

On Sat, Jun 13, 2026 at 05:26:50PM +0200, Paul Kocialkowski wrote:
> In order to declare a mbus node for the V3s, expose its associated
> clocks to the public header.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


