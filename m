Return-Path: <linux-media+bounces-28265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB83A61D1D
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 21:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C37E7AA30C
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 20:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845C1A83E7;
	Fri, 14 Mar 2025 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="p/o5pkzq"
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315716DED2;
	Fri, 14 Mar 2025 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741985328; cv=none; b=rmtj5pEgEt6hELCPbLCKV3B+YDKVNSrv9NHXtTb0VAU+AzZu+SSgYFupkOdi2cQkPsYMYQFoLJ5xsKluLObOVAS6BpvTd0mQ6NRdWtDMVl45uvNb0IR0c07pX65OAbCORjPouhjmuJ+Fy/+Z8BAklaIGzE0YyvxK4UKalEDWWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741985328; c=relaxed/simple;
	bh=hb+j22OLJfbyikJ7HtNDHq4frjzAGP3W5g1S+Tq6vBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpI8YNL5ofDuhmk99vy6p3npBpSfXB3unXg4gpm+dfu4XA0DD2/+jriJiD1LtsBfntNvn4lGc6G/QdieO8TvEV9emUqmmfxh3SuJ6LGPugT+tqMxLwVr82yWq8PrE9PnfZp4/dCpXfiWwrGNYgHBd0sN2kIOqfrmbWVyngYgoWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=p/o5pkzq; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 01CDC1C013F; Fri, 14 Mar 2025 21:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1741985323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=agBWb0L435hF7qWd2hGkcc2Wd0nw5fdjW1N6ZFvPe6U=;
	b=p/o5pkzqywPXrLEnMTzoV+i6h8NrUkt+Nju/phgeIqnSJm7za2R/gzQokAiUgEWz1Ltthc
	ADXZ86xwQSjxAjGIYQo3u9nr5WDN3JmHAQYys1D/kKs2GRSZxaMR8aeOPVt95kyqAvbYN+
	QOdO3QMzcMMC6OCR74JF5c9wPqQzN8w=
Date: Fri, 14 Mar 2025 21:48:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: david@ixit.cz
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <Z9SWKqtnpBGZokJl@duo.ucw.cz>
References: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+rF7RP1KY17rheuH"
Content-Disposition: inline
In-Reply-To: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>


--+rF7RP1KY17rheuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-03-14 20:58:27, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> Convert the Analog Devices ad5820 to DT schema format.
>=20
> Add the previously undocumented io-channel-cells property,
> which can be omitted. If present, it must be set to 0,
> as the device provides only one channel.
>=20
Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--+rF7RP1KY17rheuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ9SWKgAKCRAw5/Bqldv6
8kkXAJ0Y2ueeFfa0qnTi36Afpe2clLTImQCfYo1CfahtRdBI8z0KG6jM2o+DQio=
=8ghC
-----END PGP SIGNATURE-----

--+rF7RP1KY17rheuH--

