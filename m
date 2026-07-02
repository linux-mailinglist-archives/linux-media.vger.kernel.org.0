Return-Path: <linux-media+bounces-66412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DbXzDqa7RmqhcQsAu9opvQ
	(envelope-from <linux-media+bounces-66412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 21:27:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C836FC867
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 21:27:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UtNszblP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66412-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66412-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65C343055901
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 19:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73347370D56;
	Thu,  2 Jul 2026 19:21:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DF36E48E;
	Thu,  2 Jul 2026 19:21:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020103; cv=none; b=XL2vy9EiS9fnPC5xNBWjFdhzXlbY8uIdXkRfnquFodSWbThRLDu9Aff9Mg3OnF3zvMXHFsaGcuGpekeXc+peUT0AFKdiXDMeg0JMQQ8oGJ73i7/fc8v0YWsxFojjTnVO/i7/Kioz5wzMWe+yggbwQ50nMYCcg/eH1eT1rpboHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020103; c=relaxed/simple;
	bh=k50U4zlsDGzT2KXPhlrmIfaS5AHmmXlOEjBNZpjjVMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoGHMfE7VcNiEeTP7TOFbEdXKl09Xrx2VvesWQBHj38TRNSetQeYfbpqxtt3bhCu5Ms3RGJjPJ67v/HreKiu1RkMO2QP1FIzClLv4YDt4GLfx/E2rbMQYPHEnajiRiRPP6lWVBKcntOOMFhaPCaVP5Zg0+vzJftpHd+QOlCJevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtNszblP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9771F000E9;
	Thu,  2 Jul 2026 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783020102;
	bh=k50U4zlsDGzT2KXPhlrmIfaS5AHmmXlOEjBNZpjjVMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UtNszblPkgWzKj5vm2aSf30naBpgQqFI84gvMUhxhMBsGj/mzUuOo4s5Ypv0jnwmN
	 RJnD2pS6OttrfcftdhsI0vNgUn/jBEOgDKifPlw4yMGEKgtz0iw1Zivj8aOaN2MEQn
	 DvWPMvYuxuYKYyU1+qUmrTjMRwAKdn6DWJqm57MKanflG5+D3AWPaeuReTF7FBvBe4
	 XCOUeXz/Hfd7QOw0gS13tIVZ0kYhmtgfVoxDFehf9Nlc3d2He4yswoISsGxA44/tWH
	 slymMM9oFs70x4VsFRQA9h572GQHDpxQWTQ/dZiwFWfXD0ldkFCgPvLooHytJARlmw
	 QPj763+ompbFA==
Date: Thu, 2 Jul 2026 20:21:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Message-ID: <20260702-judge-erased-99ecf9976be0@spud>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ndhK0BzZGXmiKb2"
Content-Disposition: inline
In-Reply-To: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66412-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,spud:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C836FC867

--+ndhK0BzZGXmiKb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+ndhK0BzZGXmiKb2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka6QgAKCRB4tDGHoIJi
0j6eAP9w2iL+rZx7al1VvdH6D2EMjyWTpQYcwIfVDpL5nDuNfQD/VyjO3APXkD6t
HXeQNBvpjYi882cs4bhwdvxA7yA4OwE=
=f5PB
-----END PGP SIGNATURE-----

--+ndhK0BzZGXmiKb2--

