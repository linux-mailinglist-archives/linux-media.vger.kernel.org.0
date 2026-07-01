Return-Path: <linux-media+bounces-66262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6QT+G/pKRWrT+AoAu9opvQ
	(envelope-from <linux-media+bounces-66262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:14:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0C6F03DF
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E6NVltWq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66262-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66262-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3256730A0E3A
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE47637881D;
	Wed,  1 Jul 2026 17:06:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BC379EDC;
	Wed,  1 Jul 2026 17:06:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925605; cv=none; b=LEX0f49HasjzzqnS/bO4vvTh+JMMG/5EvZrKsbn7T3TCQsYZyDlYXN3wjHezOT90FxXjVUpUjBnKjutPqwpVHA93WWs5HeMos6lauMOjKo1q1V9WW///iT+VgdIMOQ1yyuqTG06S8q4pMU3vuC+4xrEt715awHaZbdLg5An5wLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925605; c=relaxed/simple;
	bh=21H7aoLhZHneFF0SXyyRN9vo3BQfDQoYg4sqYzX4QPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZHo+AjW0RzqdoMNfor4E971yxNN+gsVNhu21pz7lkjWQxAvIUJSwJBq7KarBIILQqVBn2o8xEwSIgcPWIxujqY761yrGk5I2TndfTmvzh+0gUiwlqg2l0Dj2hMYVFhl1mWb/cP20ugZF2uXIH8ggXhi23wbUOo3821cpswsBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6NVltWq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED6D1F00A3A;
	Wed,  1 Jul 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925604;
	bh=21H7aoLhZHneFF0SXyyRN9vo3BQfDQoYg4sqYzX4QPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6NVltWqWbvIUpRDtHaBUrZBc4dttdN9on4CFmxs6qgHofyIjEKwJYBqJ4wK+qY/B
	 yem+6USo5kwgvRBMybOP/HAW5QfpANLwKI0rqBvEIY/y1seEhf4ahhgPRPsu1zJFsK
	 rp8C9MGc3IqfV+O6Kv2gI74Z+tWFh0bHo+tiZaRbb+j0ayRYV+g9O6Romx3MVSBt+k
	 FwZc4eiko1JdRv0UQlf7P8QvOGNyYu3n5W2DTFSYi2lyglOgLAhqbCrLCFSAN75ldU
	 tC4nwWKLTBfQ22HoBmSZqo73kPb/vUWMrCALH/oqyoPsX3DcHSdE9V3XcUTW/1O8Xg
	 f67dV+3MIqCuQ==
Date: Wed, 1 Jul 2026 18:06:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260701-clay-sleeve-c133875faa1d@spud>
References: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
 <20260701-hm1092-driver-v1-1-d1bd81e233b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hXiR048/qsb0TuVm"
Content-Disposition: inline
In-Reply-To: <20260701-hm1092-driver-v1-1-d1bd81e233b5@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66262-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8D0C6F03DF

--hXiR048/qsb0TuVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 02:25:23PM +0530, Ramshouriesh R wrote:
> Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
> near-infrared CMOS image sensor used as the face-authentication IR
> camera on laptops. The sensor streams 10-bit RAW over a single MIPI
> CSI-2 data lane.
>=20
> Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hXiR048/qsb0TuVm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVJHwAKCRB4tDGHoIJi
0jvFAQCbcADycv3e56G0sQFpf0YBUNgRtDjHzw7R1gu4252gNwD7BEuLlafP59xz
cs8dpydvrjX5VL0xn+rDDLa+O/LX8w0=
=9pEg
-----END PGP SIGNATURE-----

--hXiR048/qsb0TuVm--

