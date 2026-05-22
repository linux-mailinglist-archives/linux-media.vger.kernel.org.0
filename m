Return-Path: <linux-media+bounces-62576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HpJJ1cuEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:22:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 536105B1FB5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E43A1300F962
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE9E3C7DF0;
	Fri, 22 May 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3xQEC3n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8E352F87
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444939; cv=none; b=IuampLcNipR194E3Yk7mP9qxsYjZ7NGGs6Rl8gx3FFWUce5NENnjzYXA0UfIc3Fl12F0Hr7jSoi1A1s6WpetHYuITsjs7vHN+ahfp5c5K/AsQ3uthF/nXBRbRQ090z1ThRyyQ2qE+0BXDKinv9xd0unK3kf6bwsJL8hL1CaAXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444939; c=relaxed/simple;
	bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSpWA7eRhfCmE22rSEaoY/eflx5GySjiq5BvnirI/sfl2aRy6330eYXPx4TUOpRnHb40G68ednOwhmHUTCB13O2Ze9FqG9dXC14ElZmo5b5RwzNUt/NOM4NiotHu9mUJRkXHHh/1GtO4wWS35J19Kquf4LEnVWJVK2myYzN6nQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3xQEC3n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49041e84237so5734125e9.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444936; x=1780049736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
        b=T3xQEC3nEmnuLNZ3gZBTSC6yv6J03YL5MQt5irY5+v0SH1VGr2ThripFTNPGJzedAy
         1NBFLUpwv/1+E5Er5joEdIxPy32+FRJHLV5Sa27SYP3SzRSDbQcj0XQzOxfQACrQqL5O
         9B0NVhsHm2ZWwdr2mgqHeHKPxK9sSEphmgbk43ut5rXFH4bPIuqWsGm2UaddkUVcHpxO
         sB9CchfsQaVOCQzcTWgOexjNztzauzE5fj+CjuW9PgT3QedCCzSCy7aXY+V+PnSAG7Qw
         YKrrI8mT+KjHtdr0lP2oZklUNhqKn8WudBpWzJUBepA9VX0wjBrT+Fk9qblPZhIpkF6y
         KMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444936; x=1780049736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
        b=OPvesEPTxyW/Wo4OwW+xdfBhhRg1OmtPYxWyfO1t1PU/t0uBH753HX+H2SUsdn7pKE
         N8DXDUGiN36ogYlPPPQVBK2hg5q/RRvurIg38itXJx9pSxE5eMC0Bwqt2RQQ/WvBgvDl
         mlGJhscmLPLAS1issM7I0g6foLV07OhLTvDRjQWbYnxcbSCO1mg12Zs1kJVBCMcv3KQS
         DXfLIPhYnZhOJO6aG+jq0zKB64ezYbamtbhXsLAV0c8q/5RVPuqAxHw8XU4Q2zvx6ODD
         8vYnAwLlqNTS8PHtk/6p2xAXg0lntUe9fAzuipOEqoPGXOGaHtlHsH4C+6As+6rORxrK
         Gocw==
X-Forwarded-Encrypted: i=1; AFNElJ8K2G4NmHwJPdeUo1G+sWBQ9Mz4kbmqvv15+F91h/fzUAa35OzvNv/Kf3b3WlMDhL7SPZZhSTq5lV8Emw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHZk6ZPs8BJRqCJtaripLgQtJloLdOict79hhYkuzBh6FbheeZ
	2DwF3qVj44pKtr9/VuLhVOOM9vSA8Umd8BdBSNVd2R7x7lv9YEre0Zjf
X-Gm-Gg: Acq92OEvHfZhsONKWR7Eyc/KHmWG/n3mjzZTBhg2wI1R5OD2kIESlf33hI8hCYfPxnp
	iLI8kUNCnPNx6UQfB8Wq2GYnseIO50cXwKWQabmPknr+GJwnQsg7d8RydaYEAGpaHdd1lH8CiOl
	3HNMcAVU+0VzQC76Ei+df0MEIOLYoWAssXfSrCkzgaIWm1/yxXl6tR+wAU3XohfApN9Vd4LrupV
	O5G0fS8F78nLKVjRQn85NINbyVv7SgkwSqjwlw9X/XmoYFwLBS61qmFjqTzmi1u7kORtxkoZwey
	AFJJVTer9lytvflFulqI0bmWCV47l/zVqJUEfpZK0FhRFq56llF7aQRZD6xtfqkoVKZCQCOxLtS
	SLmqMkSsUALRd0w3wx0JrAxNZmKS/kCHtsKsT8M1OrcM04GAWe3y4hyDKEha1NIQt0eFge42ucI
	PGEOWfSte4eClwZ2FCxHrANMWSpjF/Md8vYqvzakus3Si82+fXj/bxS+/8GKTkeQYIUiDOXd0uZ
	ruWfiJv9eOKR3nMAw/S5zR8
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490426b0c92mr24655565e9.16.1779444935807;
        Fri, 22 May 2026 03:15:35 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527dbf3sm30624875e9.6.2026.05.22.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:15:29 -0700 (PDT)
Date: Fri, 22 May 2026 12:15:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
Message-ID: <ahAst802sjuJr7-l@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
 <ag67dmFtSDBC6aPK@orome>
 <f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtz3f4pwlb7uchwq"
Content-Disposition: inline
In-Reply-To: <f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-62576-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 536105B1FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qtz3f4pwlb7uchwq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
MIME-Version: 1.0

On Thu, May 21, 2026 at 04:04:28PM +0200, Danilo Krummrich wrote:
> On 5/21/26 10:00 AM, Thierry Reding wrote:
> > would any of you mind giving an Acked-by so I can pick this up into the
> > Tegra tree with the rest of the series?
> Sorry, I thought I already replied to this.
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

Thierry

--qtz3f4pwlb7uchwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQLL0ACgkQ3SOs138+
s6G6mg//ZTSVOV0O5XnlSqUo1fdyiV44Qxo3ysbWUv2+O3w+r5WwMjgdyUM9yAbS
cdsRz3LHOAYcXBxYZhtdkLh5KhhvjdkUk4e1fdo/5QSGjRPARHPS3bQAZbnpZy46
tWvdiKwj2fM2rZ5JQHvYEjGCSQ9hGa/9Ri3OnGti51rcUbCJhJS/J1KgyJ/UOmyn
ZKLr/2FfTbmC8w0Ukki+CV3d4JV/pxY1UNjyt7x568o6JlebDPK6M7PKMI/IM6GW
fHt0U+f335ljan2LD8HZfSia4sa2nZJnbJDtIEj1ov6suhrowY9Mne4JQTEwjuLX
db6abSI9ox3O3vkx7Zd1G795TZUWTXKlw2SHr5vMyOBXhJHtipm7y0bAwj4ZJiAp
5ghmBQzl9HdBVy8x8x8SjmVCygxrt2rOVocYDG1/Uc5DSZWa8aa3VQJMK6WZy9gB
9G47X1VZPs9B/KeqE5TWRwB05OHuLeCIVQz8Nd06DjN0IEUStecgDWXm0bs4UNWZ
zMwz/HPgK4zp59HRlVqgoYRNrIRXCd5wmz5t+JdqDwbytna2YVTV7u/3FOGgn/rD
HgxwYqtJsO3KosQ3UN/HKPoEk67noCBWMrSzZbwFhw/DziZwEn4mr+slHKizUvrF
40Ir94vEC6DhMDCNJClxmU6S9zhRoKUOqW3FLyPgC1Ghfp5RQrQ=
=MZIt
-----END PGP SIGNATURE-----

--qtz3f4pwlb7uchwq--

