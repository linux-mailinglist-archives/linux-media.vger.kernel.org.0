Return-Path: <linux-media+bounces-62414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEwgDwK8DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:02:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFEF5A0946
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7F2230B1A2E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BF439E6FD;
	Thu, 21 May 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQOH2x0O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA224A06A
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350259; cv=none; b=WjacNoLwaq77fTkM92KW0316ZZmTvyyINGRRkqFi02LZdngTQ8gUVY7kxPR2qjvdPmvR8b72PS5OeaqAqP4EJbm+o+MlfirBa8EWa+/+KFFATblEm8gaZLtnXL8/8hC720hUG+NivKXLTDvbrmVlugwz9GxiHVhb+bQPF9w7HKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350259; c=relaxed/simple;
	bh=01uWqmyLFzd8H4CBvINTSYaToSHFeAsBFz1Y1xtMczw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuAPkCH2z1SxE3ZlkkSu6Fnst8qzOX7pYkzmIA9Qe8MQ5S56Y9Vm8UfZFKEjO9tX3yMtgdGImxZvWn2KgEA34zaoZ7iPFO7oxxYP+450ZU29yMXZ0o93puLPddwfTkderDEPb+NJ1rSE4Csb5XQIwMXTQkzOiXXzT3MIjF8shLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQOH2x0O; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3327294f8f.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350253; x=1779955053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=OQOH2x0OZmEHxHHry4BcFu9isGLq7beTOFb9yC45lwiqzRwafosbDvCQccvcpI4Hxe
         eNbwvw1744HGpcNiJAsDBkrw0MOq6sGds1NNjqKKdU7XNpyaBOBKjmtpsUX6V4wjZR5k
         Q6cOhRbs/2kg7mNG7JGrw5Mv0KyRQWrK0BBill59rSboOl2hNYGNkFbj5C1VgnaY/O71
         6h9qm+zQaGuSOpXX61yXVpOm24hFxKD7lHIZx8i8qrG4CTHkTNB6DjkIkfahhE9yQYdC
         fT/M6Md7fplyvntgzvkItb2GO0f2QUjGrMGYcskzmZdYFpJSrhLb7NDmnIMIqlEa7t0y
         k+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350253; x=1779955053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=g45dylO4onwPAJWTA598Ef4/aBI1QV4KaDOAm5D8e8nSaG4+JArAnH+rJQnk4xplxg
         gT2Dq9HX7YjnU0UpwAVyrVU5F2GM6zj8L1Wod+K7tXipCDGXrK4lludIRmRVZISsAanL
         tTk2u0NcOt+VF3vfARfcwisLxzqARyjRpEWwh7jerRnhOl4G5qpSqjBAvA/dWhXSh5mV
         KmPCsMEBq7GdKpWoAYjIlb7RBQ37OdWLHvSZt8hdw9Y5ey4crpfC081m4e2ilzgm+P8B
         dgdUTtN8LxMZj3kry9U+Vq3zeF2jgZHqyhgvJMLj8bBV0dUflEtRZYfN2ovQyzdH+6xI
         w4mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UxspqhNjmqBOWxH/Vv77c2gvT5RPFdHMogqp9xPzJy9jxDdK8hzHJ3S4LPYZFr04muGFJQl1oSDJSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtnjFRwjHPI57xsc8Xe1dPj1fle78MKqlWZDoodUucFLXdNExN
	WiJSok9gQnPL86hdJ9eglPKSPKWjj+5qDxshrapcTE+yajhZ5HoU4Co/
X-Gm-Gg: Acq92OH6xLMY1jQW4YuUGN/ZyLD0Ophc1mVNkOLQxqqyYzO/gLuLOpnQ2C6fdh5dav4
	WnEudTtBbxAxCsKQYvf4wsbe6yaIOe31T9OpY5aDl2CeG1zZ7hgbyaNd9DaXSKSobEy0hOy2R4s
	efjvw/q0mkMMg1enyopZHB4SMyNgOPLu3JxiwTppI/1CjbbvwqyWLlQHb8SMz/KutToD1KBY9Di
	yRF2+iNQ7ovhRYqT/QijRiM7pziod5ToU9B8ShXliCaKHcvoCg2ObRbrhUfklgBGgbjY4bm4QA2
	KMekEFMLVCqovdlL4bj1OPduQ/DN/IHxcrM6WxgortRe0ReKeN9WeNUDzqm3xDPcCzZOUL7TgfK
	aMu6FIHc/bharX3FDlyOn0ibeUnqp0OK8ni5ziJovnAQUEHx75SM7vfL1jX7ClTVr4b2XDBUioL
	IuHTWIayCuTUf6Kc6W9zaQGzbTnpGiTK/I6H8K2KPla3kNWyXw5mnrr+UDQtuaVaDDvR8AtQYC2
	C0dNdVZTPIRCA==
X-Received: by 2002:a05:6000:2583:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-45ea4141e17mr2803411f8f.38.1779350252817;
        Thu, 21 May 2026 00:57:32 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd50asm821152f8f.15.2026.05.21.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:57:30 -0700 (PDT)
Date: Thu, 21 May 2026 09:57:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
Message-ID: <ag66qZ6rLOeUTWV7@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufnilbb7pbo55sdz"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62414-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 8FFEF5A0946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ufnilbb7pbo55sdz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/vde.c | 15 +++++++++++----
>  drivers/media/platform/nvidia/tegra-vde/vde.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)

Hi Mauro,

would you mind providing an Acked-by on this so I can take it through
the Tegra tree? That'd make the dependency handling a bit simpler.

Thanks,
Thierry

--ufnilbb7pbo55sdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuugACgkQ3SOs138+
s6FbKQ//aRQbgwr4ztzl8XykZ3VwYpBsUA5hzUjDURQkJFNdwnkt6k1kBPuF6tMI
joUObtuboDDZBD6T1W1CWvCKqzBPwDlmD5hdckRGlbau3ug5Z4HYFpTEoO2VPhr8
kW6mO+oE+5Jq2I4kEfCg9WfotOOP15ehuSzn2JRbKZDLC9l8/Fyo/7nglXyjmoJk
qgD47vfx8/zgrE/Fv9M+eGdeJzh0XxvRrqWYxe6wJqlFCETYNH38hb+CBfIWa8HR
Tzoa0rmTS4YRP2+p6yeckAN5IWgSx7ZTbCMLLoJfyjEbCUf9Y3ymi7DNWHey2gi1
SY1ue+l/i2UNavChYqtuBV9YOfSyM0PWRQja4YeSMSIK1M7mLfta20LOo37A112O
BN5tR5zmtwiKW5ZnAReOMcWJFLobWu9+ZlbkiyQ4yiONh1truDHgwBOssPfCK+/Y
ejeJGgdzWnlgonVwEp80tLQsNZN4Nccrmnn5JPaH1maEC+eJBtP1Y6V+io/28QFP
YE+W8gXUwm2BK81TcpIw6qswfWiBu8WdGeCx9j5X+mbo/jNWboIo2l0AQxtbCyGm
LiYJV+w1iEWO3WWQKymgmwRdhT/QfeS4VcUikTrZG/NrcIEpVwuVk4syKobUx9Cx
DuSlIPt97hHCjwAaF6HZwg809a+jTrqXPBq4VlYvkjefZNJAiMA=
=2vYi
-----END PGP SIGNATURE-----

--ufnilbb7pbo55sdz--

