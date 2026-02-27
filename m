Return-Path: <linux-media+bounces-53743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIRwJQ/RoWkfwgQAu9opvQ
	(envelope-from <linux-media+bounces-53743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:14:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE91BB4AA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F10393006932
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9630356A2B;
	Fri, 27 Feb 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNIKcC4n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19889347FD7;
	Fri, 27 Feb 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212444; cv=none; b=vGVYz00Ck9RoD4rEhWhx/y/PDkmw1WJAYCuc6cpTdHdjU6T1I40mfHoUu70TvJgdVFjSubOq+f0Y7iTtZT8C4Nb2oFFKwNoq18ojevgIkxAn/9nK/dxhqQxwV/Ww1O8YAaylau45LmFV2CrCkiqVzY1X7lBNgsapCf87iTBuEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212444; c=relaxed/simple;
	bh=bs6uKlJfn6XI1cj0Kv+3o21KatAk/mhEO4hzxEnlJq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqjiH2TByfux49q6ufsolDb0tnDCRz5E1C/tLfGplVFY+qOMnnPuJic2bfzKMCss7A7v1HdJGuFQ6nSyEP84ujtjoNfU7fdkPmEhqantZM6rVPAF9cwsIaVODVVRfmfR72B69kzO6hh7mrYjtQhgxOmKiTk45cxMorF4P9E2ldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNIKcC4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A603EC116C6;
	Fri, 27 Feb 2026 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772212444;
	bh=bs6uKlJfn6XI1cj0Kv+3o21KatAk/mhEO4hzxEnlJq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNIKcC4nu1duXqR52SQEghCQ0IOnX/CkD88r+a2DTdV/AkPXHApEdd/vE/TOFDsCY
	 eVCbM4stmW+O612jwVpWV2kHCKbyR1KnOVBq0KBJT3HYUZfxNKY3he5t5m9zSycbkf
	 ikRE9LswSgL689f5CAjkbKgHP9X1ckb6xXAga8qggeFITJSHbCB3gQy7Y9fW9vfl8L
	 rqWdjlFS0Qgmd+pqVPyAW5PumZAj9iicix19/lzYlzx/wrrJN+6Sqi5LoyBYEMKuKn
	 WBqxeInBzL87EbigWYndYnUDZADmL/MpDFPtiq22ShbBKDlvbzi1cVFVl1dvlGRQ2z
	 3xOeczFYPjx8g==
Date: Fri, 27 Feb 2026 17:13:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-omission-stoic-417d7109ad4d@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bShyYlHPkrpIht96"
Content-Disposition: inline
In-Reply-To: <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53743-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4BE91BB4AA
X-Rspamd-Action: no action


--bShyYlHPkrpIht96
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
> Hi Krzysztof, Conor,
>=20
> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
> > On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> >> With the introduction of the RK3588 SoC, and RK3576 afterwards, two mo=
re
> >> register blocks have been provided for the video decoder unit.
> >>
> >> However, the binding does not properly describe the new hardware layou=
t,
> >=20
> > As you shown me last time with excerpt of address spaces from
> > datasheet/manual, the binding correctly describes the hardware and above
> > sentence is not true.
> >=20
> >> as it breaks the convention expecting the unit address to indicate the
> >> start of the first register range, i.e. 'function' block is listed
> >=20
> > Imprecise wording. "start of the main or primary register range"
> >=20
> > (if you have 0x1000 with one reg and 0x20000000 with everything, the
> > unit address will be 0x20000000).
> >=20
> >> before 'link' instead of the opposite.
> >>
> >> Since the binding changes have been already released and a fix would
> >> bring up an ABI break, mark the current 'reg-names' ordering as
> >> deprecated and introduce an alternative 'link,function,cache' listing
> >> which follows the address-based ordering according to the TRM.
> >>
> >> Additionally, drop the 'reg' description items as the order is not fix=
ed
> >> anymore, while the information they offer is not very relevant anyway.
> >=20
> > This is fine for me.
>=20
> Thanks for the additional feedback!
>=20
> If I'm not mistaken (please correct me), the only remaining (hard)
> blocker for the series would be to improve this commit message.

No, you also need to fix the problem I pointed out about reg-names being
optional on the devices you're relying on reg-names for. The new commit
message I am happy with, provided you also add the information Nicolas
provided about the impact on users.

>=20
> How about the following:
>=20
>     With the introduction of the RK3588 SoC, and RK3576 afterwards, three
>     register blocks have been provided for the video decoder unit instead=
 of
>     just one, which are further referenced in the datasheet by 'link tabl=
e',
>     'function' and 'cache'.  The former is present at the top of the
>     listing, starting at video decoder unit base address.
>=20
>     However, while documenting RK3588, the binding broke the convention
>     expecting the unit address to indicate the start of the primary regis=
ter
>     range, i.e. the 'function' block got listed before the 'link' one.
>=20
>     Since the binding changes have been already released and a fix would
>     bring up an ABI break, mark the current 'reg-names' ordering as
>     deprecated and introduce an alternative 'link,function,cache' listing
>     which follows the address-based ordering according to the TRM.
>=20
>     Additionally, drop the 'reg' description items as the order is not fi=
xed
>     anymore, while the information they offer is not very relevant anyway.
>=20
> Regards,
> Cristian

--bShyYlHPkrpIht96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHQ1gAKCRB4tDGHoIJi
0vvlAP9kvdRU6UlsQZ5Wsfi4QGT5f4KCBum2htINzh1r/oPhrAEA8b+7Mek6yDP8
qKcKPbQm6I62YBafezuLQlaHjqzSxwE=
=HhTd
-----END PGP SIGNATURE-----

--bShyYlHPkrpIht96--

