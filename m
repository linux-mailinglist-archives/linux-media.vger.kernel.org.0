Return-Path: <linux-media+bounces-62416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDN+InS9Dmr+BwYAu9opvQ
	(envelope-from <linux-media+bounces-62416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:08:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B405A0B8D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E274830A474B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3972C3A48F6;
	Thu, 21 May 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVVZVySJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3062B314D21
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350475; cv=none; b=CGEQSFrps17exkoJVIkBG0tn2GyQLkRQx22jV3WaNKJLEDs24k68iiNor6nV6C97QhEQgfs2e5zs7cySYHeV703xvP+TYttgUWu2Hu17WglujUexS4qGKrkILQ57o8YEqL8TB8uMAORpFe7YghQZYJJ8Bz7xsBNmBcObV/+yOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350475; c=relaxed/simple;
	bh=jyOUkIh5U4Jq5jhU7z2i3GFpsJ91ALGPm6dGho+irzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo+v6ibhMfZZTjYonEgSY1nDiXRdm+qxle236jcnXqlDz7U98th2DmntwrgjE3MWu3woIavwwDE08MpAKl/NlF1H2XhlVNTlJJawztNyTsmUDDYmIVEd/oCkUqBpW55VVN5D5AzU2Iiy8grDGDlj9qJ6TqWpCH0kF5Y7S7sB1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVVZVySJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so2836233f8f.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350473; x=1779955273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=aVVZVySJmrn+BiIUydUWCsvJnn6a2TM2YIuYb+LCOieUVpvOeb0wc/HgC4X+OOfb1l
         4X7TvEc8NUgKRZo0/clcD4HSJqeHKAVzXEYEnBEGIQD8xVukvmQiBdZYzynxEi/pe5io
         dkLIryFeUlDfay5yyqvkWMXfgaOFGUgnaMx41QN5ELuUSX4cah4ZRJkmD7I+RQTcpJz6
         QXuwfYQ2viteGe7II2zP4PLcX6IYIyfbZCdcDa4AvCn9iDSzgaFloCgsYd6XLFLMYhoO
         KZ1aQpB8kMYHpES4DrfitPYK/VocyYbb92atSwL/dHiHtSxBZadQ5T8qRHjtHe0coGmU
         4xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350473; x=1779955273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=DUF52NSVXupJfF3aFDSUzgQVENBScTtO63BFJDWaRuq+awpqJ3iNy/dsopp/bX2c6M
         TB+BKtlddT9z4LncVY/DH5rt+IQ1GdJItPE8p1rwPnjcJLsTFvw/VfTBRO0ljqaFpzFs
         9lyvSrYyPmY59iWRvTv3P3FmJQWtFS02dCfgyp8w9KDPZysQAxv5fUCdMcWgcDa46hVS
         EMGgEovxgNnrB4zRktOKdaCVGubKnjcfhw4tNmx/Zk0e9zD34Jhs0WnVVlrxVI1EswcW
         JqLUkS5GPZBaBq/hue9AvoxSl5YukmVd1uzWYEU2MZwyI0Oo5zYjZQp9mF89m0LQpMoa
         LUDw==
X-Forwarded-Encrypted: i=1; AFNElJ9qfpQTrLUS6q8zNGJEf5w5J8rOYnqLweZXwuUGLmXF4/6KaQCSCZMP/8Iklh1i3IzUdW04JoLvMG15SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0NUm6SQvykXZdvtOtloITl6U4GYvpUUcWghmfFLOy7xptFP9
	8nVJMXlTk3al38F4Jb0n9h9PJTQds7bLwQxwUHDFoMgpBQuuWh5tEZjL
X-Gm-Gg: Acq92OHLZ0afPJtqZAZiNs2e/IaTUnte87mlxWESzqZfIw4NOMd4aNTt1BGuF3VDnGo
	qxvWDrwZR2BCGrPC/2FFxkjjt8ecx/HzZy0XP78601Epf/CIgxGwOB+52sWMkC4m47d/yxsDav8
	4mCYGdEvrrkTvkZX3+AOtczGVeSM9iUHhM7dya9/SIkmGZ/aOaVL4ymyQQhDVDZi/XPL3pAQvQO
	r0AkZQLivhitNgKfp8NUNy7CoaOXRmarL34VhDS4v3iiHVNWKj93TDHvsg0JX8S14oI/RC3gze+
	BYENVF1rskIGbePvvZ6JQCyXz/cdx5lOlkxbIedHlVuG6MZ6pQ/TDM7nlxF9jZq3T0XrIYvoOqB
	SsrQi2i99CFuZeYepzTOZM7YTyaSq/rfH1NPuaxdlF+CkaQ7CfVCqPXCfT9spv74GIf0IpQXAbU
	SHA/rOzZLFvOi4Z7Q5GxJz5M1is6JzTXBdedYzzJ8QYUd/QMDKBI0X2uaJMk8C3ZfxfufBcgVzo
	CXA+2I6q56PxLqZRjVEjLbH
X-Received: by 2002:a05:6000:4027:b0:45e:a0ab:8bc9 with SMTP id ffacd0b85a97d-45ea3dead2amr2513624f8f.41.1779350445635;
        Thu, 21 May 2026 01:00:45 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm857662f8f.16.2026.05.21.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:00:44 -0700 (PDT)
Date: Thu, 21 May 2026 10:00:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
Message-ID: <ag67dmFtSDBC6aPK@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5oal4jl4ykfwr5c4"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62416-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E2B405A0B8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5oal4jl4ykfwr5c4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Danilo, Lyude, Maarten,

would any of you mind giving an Acked-by so I can pick this up into the
Tegra tree with the rest of the series?

Thanks,
Thierry

--5oal4jl4ykfwr5c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu6kACgkQ3SOs138+
s6FK8BAAgs0A7wFYJOVZxTTW6MNa4zXSjm64uXobpTYaWzKll6wOHDvn6C9dcp/v
MLtSLfP1p1SW/dO74lgYcFcwNaDIZdDsJZmNba+3Jf6PpFLkFdvor5IxklQDCq7p
CTff6BCXl8nTZkHm57wdzn9MMiduUUlKEc1foNpP34dKfb148QjLYdxi/2hFY/ap
VNo3Lr54eMkr3RXicgdgDHq5TXk2gKfSdy+Tve1QiUcemkc36olxR3tcgVSLxPJC
Q66EiKj9g3bjK+fEzB7hA/GeAQOfpuUIObaCdcASbPeCBTyZJY23WbYAF5XMMRDs
LjCs2r/E0EtZLwKY0NGBEZjwzWxF8PddUoqi3TngTTfv/EJ4qx3QzqvAf2DIVKsA
xJgxWd1rDD2HclOQ4GojKyO7CYLt4Xa8hWXPt4V7ajU03l8bOCvKOBNmg6hRD5jp
vHxVRmM/KOteKe7c9VJCMmxmo1oi9lE3e6BCB/VAGm7tzXHK9/43ug3tlh4A4Yk/
ad3eKm3kJxNa4FvJor3dadP6+6C0HUwZkk40TGgkYubsdPfR2kyGI3YZlr1J7cBI
jdRqcYoo/S+HmsreQgBpPXcTUhKqLsTU9/eqQ7V+9SItN6mvX8pPWmUaf+UexFht
1fkm9VtVD/H5bQ0QeOiRpJMXOe/ozNGH0hUKOEywfy7W8syQACc=
=YTdM
-----END PGP SIGNATURE-----

--5oal4jl4ykfwr5c4--

