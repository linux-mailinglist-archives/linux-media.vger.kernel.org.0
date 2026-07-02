Return-Path: <linux-media+bounces-66361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f9BdJJlgRmqkSAsAu9opvQ
	(envelope-from <linux-media+bounces-66361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 14:59:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B556F8053
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 14:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kO4usZ5Q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66361-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66361-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A764A301FF3F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 12:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881C7495509;
	Thu,  2 Jul 2026 12:58:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D106F492522;
	Thu,  2 Jul 2026 12:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997117; cv=none; b=rbbgvI1yJKi+BdqmKGDx0feVDDh4sQ4hqU1LxAidrPjsvNCDH57gmsnWQh+d/BnB+kFOmGtuOR0auNnG5fkae3aK4qAac5JyIb+91NkANLKcVMsKQPYu+T36KNRpwkNT4rXXI4CEVHMNxWJdSPwcZkpKwwEebZy3GVE1cd32gUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997117; c=relaxed/simple;
	bh=ShsbAZ+6W71qAbfGXVC0TvICNAKnIcCP/PU8K2kCMHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI2FPfFps6xwl9YeMpdk2NehX0ip4NOJR6tuotz4hWqkmjjSL8HOiPbBYiC2KX4UPKcE9mamceyZ0q7FksYs53Vyabk8pc8in/6JW3I44WKcPZioVf4lTriwB65YtxfrKakK74FKIJn8l9ZV9P54TUfgZDoSP0sNOveJVNgaLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kO4usZ5Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC311F000E9;
	Thu,  2 Jul 2026 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782997116;
	bh=E/1DCNOv6BvGR9MJ9FvUvqyYS0lnKrQcbwU1VR2yiNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kO4usZ5QxTv0KTmHTZC/qASNpRJK/tbL1yjometAkq37XaVoiPj9yYNJYSMa/miOy
	 WDumAgPKPoA6O+ZAhZknNP5uy3myN2YtroWwxIDDh/D9adoYaQBir+NbjrazmpzPB/
	 G26xcrXk1KhYilWa5NJdthwc2uJy3iDeefPoHZlhdFDGTm+nZ6/SJsuST7sAsnkvJn
	 dXE7Zj7K2yahM8tyC7aM0z9NdoTfrtRX0iFx9IZ2s+glDcBGyXLo+A5UHqZ60T2grQ
	 plqvfAsOE08WmETjdkeuGfJSTD3aYifZvi/nV1eTiyVSnRKxXP1QYtapabLU1eTAKw
	 hZ6pAM4+B/9zQ==
Date: Thu, 2 Jul 2026 14:58:33 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org, 
	David Hildenbrand <david@kernel.org>, Yury Norov <yury.norov@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-trace-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-mm@kvack.org, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	David Airlie <airlied@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linaro-mm-sig@lists.linaro.org, 
	Heiko Carstens <hca@linux.ibm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thierry Reding <treding@nvidia.com>, Maxime Ripard <mripard@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Michal Hocko <mhocko@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Suren Baghdasaryan <surenb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, devicetree@vger.kernel.org, 
	"Liam R. Howlett" <liam@infradead.org>, linux-tegra@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"T.J. Mercier" <tjmercier@google.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	iommu@lists.linux.dev, Mike Rapoport <rppt@kernel.org>, 
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: reserved-memory: Document Tegra VPR
Message-ID: <akZde-8lFvf8rPji@orome>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-1-d80f7b871bb4@nvidia.com>
 <178293558945.1610040.13281502080616690110.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jt3c4zsxeledpb4t"
Content-Disposition: inline
In-Reply-To: <178293558945.1610040.13281502080616690110.robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66361-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:borntraeger@linux.ibm.com,m:linux@rasmusvillemoes.dk,m:dri-devel@lists.freedesktop.org,m:david@kernel.org,m:yury.norov@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robin.murphy@arm.com,m:simona@ffwll.ch,m:linux-trace-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:christian.koenig@amd.com,m:linux-mm@kvack.org,m:linux@armlinux.org.uk,m:will@kernel.org,m:mhiramat@kernel.org,m:airlied@gmail.com,m:gor@linux.ibm.com,m:benjamin.gaignard@collabora.com,m:linaro-mm-sig@lists.linaro.org,m:hca@linux.ibm.com,m:sumit.semwal@linaro.org,m:treding@nvidia.com,m:mripard@kernel.org,m:thierry.reding@gmail.com,m:jstultz@google.com,m:luca.ceresoli@bootlin.com,m:vbabka@kernel.org,m:Brian.Starkey@arm.com,m:mperttunen@nvidia.com,m:mhocko@suse.com,m:rostedt@goodmis.org,m:jonathanh@nvidia.com,m:maarten.lankhorst@linux.intel.com,m:skomatineni@nvidia.com,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m
 :devicetree@vger.kernel.org,m:liam@infradead.org,m:linux-tegra@vger.kernel.org,m:catalin.marinas@arm.com,m:m.szyprowski@samsung.com,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:akpm@linux-foundation.org,m:gerald.schaefer@linux.ibm.com,m:agordeev@linux.ibm.com,m:ljs@kernel.org,m:tjmercier@google.com,m:mathieu.desnoyers@efficios.com,m:iommu@lists.linux.dev,m:rppt@kernel.org,m:svens@linux.ibm.com,m:yurynorov@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,rasmusvillemoes.dk,lists.freedesktop.org,kernel.org,gmail.com,vger.kernel.org,arm.com,ffwll.ch,amd.com,kvack.org,armlinux.org.uk,collabora.com,lists.linaro.org,linaro.org,nvidia.com,google.com,bootlin.com,suse.com,goodmis.org,linux.intel.com,lists.infradead.org,infradead.org,samsung.com,suse.de,linux-foundation.org,efficios.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,orome:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20B556F8053


--jt3c4zsxeledpb4t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/11] dt-bindings: reserved-memory: Document Tegra VPR
MIME-Version: 1.0

On Wed, Jul 01, 2026 at 02:53:10PM -0500, Rob Herring (Arm) wrote:
>=20
> On Wed, 01 Jul 2026 18:08:12 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
> > region of memory that is protected from CPU accesses. It is used to
> > decode and play back DRM protected content.
> >=20
> > It is a standard reserved memory region that can exist in two forms:
> > static VPR where the base address and size are fixed (uses the "reg"
> > property to describe the memory) and a resizable VPR where only the
> > size is known upfront and the OS can allocate it wherever it can be
> > accomodated.
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - add examples for fixed and resizable VPR
> > ---
> >  .../nvidia,tegra-video-protection-region.yaml      | 76 ++++++++++++++=
++++++++
> >  1 file changed, 76 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
eserved-memory/nvidia,tegra-video-protection-region.example.dtb: protected@=
2a8000000 (nvidia,tegra-video-protection-region): reg: [[2, 2818572288], [0=
, 1879048192]] is too long
> 	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,te=
gra-video-protection-region.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
eserved-memory/nvidia,tegra-video-protection-region.example.dtb: protected@=
2a8000000 (nvidia,tegra-video-protection-region): Unevaluated properties ar=
e not allowed ('no-map', 'reg' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,te=
gra-video-protection-region.yaml

Any ideas why that second error shows up? It turns out that it goes away
when the first one is fixed (which admittedly is a stupid mistake), but
I spent quite a bit of time looking for a fix before realizing that it's
only a side-effect of the first.

Thierry

--jt3c4zsxeledpb4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpGYHcACgkQ3SOs138+
s6FXSg/8DETX0ZuK2IIeUJbIHp/syjqHI0/Rww4Pal6HHyPG1Nmh7Mw8aUeTurgJ
joGwb1v3IfLcjn3lMb2FCqe/oBcRBhmc8WlGWIiqiFfoTtXAPo8Rg64dg0l2ndIV
u9BZrRKqkWLAjjq8uSoXf/8ub0GjtRGMSEiRqa4adYKV0VAUPUbQjEzfikHg91aU
kSrCvilTLa1KSh268wVWvSEKjraNsiSBq+IoZ3L641ddHo9unPIuXnoFTZzFam4o
xj7cgpnuBO79MYgpv5vlyz3Rz9W1twGkNdysDqEVRuh8kHJLNsaFrWhMEOeoTcMX
iCyp3WySjGD1yBTs7VM2RXj9RvBllF0DYKc142VSpEPhsy49wMcjv8Bag05Zwzys
LHSKvs1SF/dN62tw1x2kZs+Jd4+QcwlTfGDQbtf3Xtf88MP6QcXUUWXB+VMcWumA
K4mrmfHiRpBrk7IW3c+b4lGwZ6Tl72Z1c6LI07ju7x3DohTXat7hYT2+iDZI1xfA
s47ub8HQS6xthrn9/xco8ZPWOOjizZiMRSe7l/2gbvrymb1LINSe8uL0W6CFPCJ6
G37Ad7PfTI1b60hHNGhEGteQtvty4ZuUr126ehR9qrhkvpzYWRUT/ml5MeCYjsOY
hJrS/jVvbJcphwokdb+6MUfkHN1EC7gbyLCALmMVjSqAec+7Ds0=
=yG1A
-----END PGP SIGNATURE-----

--jt3c4zsxeledpb4t--

