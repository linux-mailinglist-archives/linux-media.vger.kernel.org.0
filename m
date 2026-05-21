Return-Path: <linux-media+bounces-62415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH/TMI28DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:04:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7755A09D8
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA2AA30DB33B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91388385D9A;
	Thu, 21 May 2026 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCpNOv5A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB155394797
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350355; cv=none; b=l2FgwUAy6a0vtMsf54otQR9lpGHTnORJUjU0o74n1TkLB3f/P/9ECqC9OwhnPbZ6zPQ/bJVl6A179NVmXudkdzx/blS0fHGIIvtgNcslYKZoXtOE6IAaAdJt0qQMIYst7Gjc+fj5kEQNjTVPOyjWXIe6v67rxrLVQvLAR3qr4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350355; c=relaxed/simple;
	bh=/1x4coy+EhRxr4G74Byh3jOJGsE6QncBFV+p/Hi25m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT1nFpcd9gBRMVeVdozMTV1VztA8hZauC0eB/6ng4sQquqioWs0R7txyDeaI6tcDU1WKQhYE1pJpCSoJFJ5yE7Ndtan2IrWQPWSzOwaL4Zmt4RNjoKHGf5FjnABJvVs1BE0HruOI6oighsg12MPAOM+F850/wnX0PPE/JcO7pTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCpNOv5A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso76341645e9.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350352; x=1779955152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=tCpNOv5A8HdCnQTC2YO6ZmPUIap2OWuVg6KtEdVlpXcpKiO/YpeIEsNE09QOC0vPcp
         mbkj5o0ucQMdZBIgSSBrhyC/5QY7B47hG7LDVU9TFDXSzpHKknB4pvMZaTz13AtS7g8D
         BDej5suWOmQEY1V2jTm/nLuzsxDmemRcGY3F3BsoCEQm3TZqKL7//xBS/cYch4hNkR+L
         s3pr2Vw+4nE0uzPECzfz3ZBPiU7WNMyEj6Xu711+lGijH909MMqqhvwK7DJhjsS/BZfo
         9CNxpVPVl792FLvzHh6sTfal8LBre/LuucO8+uBxwPHGogDvoGMGQWWey9guSQZqvaI8
         OArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350352; x=1779955152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=ICIu95xvmhRXQFYN4XmKsBjzIpLzPMrShXUhgNf5lWyXfMc4fmnxCet9qId983aDz2
         B9d3Cj0MW+Z44X6XyAthe3nGR+GCH0gdDF8DDYrmeV0LcqQz3uMi2F60W85WaKbgCFy3
         b0TmwMEGt52YgbqDU3v+YDelCx1qi4psi+Bz/N1K1SY0q+H5jNqWEknezQOMaBMmreX+
         sCYtZU8N7z21HZQtis0AEiJKJqOWiMD8MF7PRWfs0EIJ8whalSmstO4DA3cJcPfceMNz
         U/5BxiPjd3NRruuN3FIug2HkKpgiZVdpIGWdWyHX1VdBMR/4fVykFiUlTtHo/Rb48u7e
         5tJA==
X-Forwarded-Encrypted: i=1; AFNElJ/HUk0CZYqBpoXUUIL/2mzpYjM2V92KFVupR69JrXudZqeyss4svWz1FehF0anVzpjKvSZ3GuO5Om5+Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw37MW5vujDnf2IvEy9zjNTfiepGF1vW+jvYLpsiCL0r6OQjcW7
	23xDoZ34s4rhgaXDP4ez+NKOG367eBWkVUJZV4Fps27a5DApTOIwj/qL
X-Gm-Gg: Acq92OEome491xMKcx4Yqv25RnLoFjswhAB7M1FZoMo7SeL06c5aTVe/keeUw8gtSF2
	sxhH9+VMSi6qqKHurk0LlSvxIv0fmSRn/g5CBwjiDasISxUgi9CVShTdveSUOZ9onOYefKtCwC5
	gh6zOTLmVCy7nld0D7CLEYDPhxdfw2Rkxe4CMI3MUhr+pTJhJoNHTbyCwFpaCLzrgNSjZkvcOAd
	kdjfeL83gdcznDx344eRQS1hAtzTYfvt8qlUVze7aBvOipZ3fnFC1qeLqWTCdv6DJhl5X6UQ5vX
	PsGZZCJDgUJxGMHeaA0UUjW7J46EiaQTetIiihugktdVmXTeApmFVcUMppChSZKhOW6jtHutpDF
	5fXqw9S8cCm3ZYivdxeNxao1mbDob4gLnisp87mXDO8W20Sy4hDPwvruPYdVlfH4WL93fSAxQna
	R6xzU4AxK7WQW0ZOuYIiwd62fRMjlKXPHLGfbLoAQ/BArAyiqAhGAHZCRRwZgMxs2/6ChTJVqFc
	x8HVwe1gpyyRw==
X-Received: by 2002:a05:600c:30d3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-4903605d86bmr12514805e9.9.1779350351689;
        Thu, 21 May 2026 00:59:11 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490387d16basm5521255e9.35.2026.05.21.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:59:09 -0700 (PDT)
Date: Thu, 21 May 2026 09:59:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
Message-ID: <ag67FStKnQcvNOrP@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4bqtknoba4e2ooc"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-62415-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3C7755A09D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--o4bqtknoba4e2ooc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)

Mathias, Greg,

can you ack this so I can pick it up into the Tegra tree for simple
dependency resolution?

Thanks,
Thierry

--o4bqtknoba4e2ooc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu0oACgkQ3SOs138+
s6HRkRAAqo5/UZ1fUVfF67PnLxU9m4v7JcLF4Ytf/Z7v087AEjfB1FXekO/SfEUl
dvex3+uqG9CIaSIQtQ8rxWgfEyOZeFirJloIENzJtaXACdsld465AHpQKBNbI5xU
/euNFiOwGTIgOHGhhxAIurS7F5Ag0WgWOTDN2uBlYGiDeuZShkW3Ek3M1WHSF2ey
Ai6uDC6tf03sgZla9uXS+eOZHkVaTx9pRDE1oxxHHLMtwgfkkl9BEHKxJ4ZqTYk8
6G5Bdz88LVtn4VWK2v/B+E6LiY5FJWuS2bM0PeRI2KpkB3F1jUy0rnC3OjdcMBjE
zyezSJsdMXkgODfA1zpIjGaAWjJ/wkU3ptsQ2EHq2+uTAji5OBUP/fquL+uOI+xH
WIHngd8r7BaBvygQpvVPl3YAC26qyRDmRqptWTXY/uISmcwmRZ6BaQTBsx1WOPmM
mFdZE0rVwRSfMws0GpPu6Atz++gerVHz/2EAFKPrntor6zUjSTbF3B42XCtIwpyO
T1Wmpfdvpt02fe1SjJvhkFCHzCv2sHvUqshC79KoN0gavq9732DOpJdn8aN8YTfe
GK4ekoKpjRZr5MUhTWGmRL0wrDNysBgOur97daSMrtrJNs+s8wlXA+9CP9nyICzs
2bbPfHWWQ78FiSSH8IOW/xAAFxM7aEh2UcHuajcX9pBLFwOnveo=
=ByYw
-----END PGP SIGNATURE-----

--o4bqtknoba4e2ooc--

