Return-Path: <linux-media+bounces-67191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZdeMJi/HT2oLoQIAu9opvQ
	(envelope-from <linux-media+bounces-67191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:07:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F457334B4
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:07:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RC+SN67W;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67191-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67191-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C261830EBAAD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389A742EEBE;
	Thu,  9 Jul 2026 15:59:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552E332917;
	Thu,  9 Jul 2026 15:59:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612757; cv=none; b=MdCamrvEElkcAErpZvVRkts9j+uQoPN9C7JuAoUAeLkL5/SQazWw1wNXbqbILvKyt1E9eJa+oySYT/IHIVHG1Jgc7VmtB7UPiGlx/8Phs/mZNW2hoJKTliHyR9D+8jhF2cXA7P412lNySmE6zRIedc3x95xblH/QtDiZxwPUq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612757; c=relaxed/simple;
	bh=aJbh9LElbrEI7E/P7mvmoKpzdOlw1yDQ59JtSNULaUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkqPKPu/lg5N2S3ELhLewsEkHXFGWfEttEj1hBfoo8kUpU9FxPEceEwuBfUeOhKMbYXOK7AADlMTFPTvwPBcsCCYMvDgTzpFTDVDnba1Cnuigvcl3Dt6o9RtEyJnZRQ4D7T64UXbikBm4RzMLIH8a4kyGaa8+xijyPPgXvGw7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RC+SN67W; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7221E1F000E9;
	Thu,  9 Jul 2026 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612756;
	bh=aJbh9LElbrEI7E/P7mvmoKpzdOlw1yDQ59JtSNULaUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC+SN67Wo1bRPHmk2A3aRNqpRIZs1vt054/wDbMqrDQX+h2TC1c2qOU/P+vZpdlhO
	 AGbczQTeBS/xYxBRav4immcCdk9NfNEvFoxtcbuJpR+9S08i4HqzmmxUf2mXM8hMj7
	 lXpkqf096CaOPzHCghkHjTNtD6G/fOZ8q4jHCFjUFlLP5HaCXiv4HJYAS5IZqtiACw
	 SFUrZULwFBv+H+0ToU32sDdtnyqRsHAorRSMSNXr8y2FRWFng0qncigrrOJt/3zqzq
	 3H/Ma20+f66D8Hr1nfijRAegJrkTFT+SYpIfq6Gx4gdnn9Z3ulZD77FcSZxNF6fYJs
	 u62hwfrMdO64Q==
Date: Thu, 9 Jul 2026 17:59:13 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Russell King <linux@armlinux.org.uk>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
Message-ID: <ak_E4UxfnFJywJa7@orome>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <CGME20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c@eucas1p1.samsung.com>
 <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
 <3f47aeab-33b1-4966-a5ce-5d6d5261e0e2@samsung.com>
 <e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
 <83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2boipej3wyu4mib"
Content-Disposition: inline
In-Reply-To: <83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:david@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:l
 inux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67191-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,orome:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5F457334B4


--j2boipej3wyu4mib
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 07:56:45AM +0200, Marek Szyprowski wrote:
> On 08.07.2026 10:35, David Hildenbrand (Arm) wrote:
> > On 7/7/26 12:02, Marek Szyprowski wrote:
> >> On 01.07.2026 18:08, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> There is no technical reason why there should be a limited number of =
CMA
> >>> regions, so extract some code into helpers and use them to create ext=
ra
> >>> functions (cma_create() and cma_free()) that allow creating and freei=
ng,
> >>> respectively, CMA regions dynamically at runtime.
> >>
> >> Well, the technical reason for not creating cma regions dynamically at
> >> runtime is that on some architectures (like 32bit ARM) the early fixup
> >> for the region is needed to make it functional for DMA.
> > Can you point me at the code that does that? Thanks!
> Check dma_contiguous_early_fixup() and dma_contiguous_remap() in=C2=A0
> arch/arm/mm/dma-mapping.c. Those functions ensures that the CPU mappings =
for
> the CMA reserved region in linear map are remapped with 4k pages instead
> of the 1M sections, so later, it will be=C2=A0possible to alter the mappi=
ngs and
> change them to coherent when needed (altering 1M sections is not possible,
> because each process has it's own level-1 array even for the kernel linear
> mapping).
>=20
>=20
>=20
> However, in the use case in this patchset the reserved region is only sha=
red
> with buddy allocator by using the CMA infrastructure, not registered to t=
he
> regular DMA-mapping API, so it would work fine. I'm not convinced that th=
is
> is the right API to use for this though.

Are you saying you're not convinced that CMA is the right API to use for
this? Or something else?

I certainly don't think we want to get the DMA-mapping API involved for
this because that always implies that we perform cache operations, which
we specifically don't want for this memory.

Thierry

--j2boipej3wyu4mib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpPxVEACgkQ3SOs138+
s6Eb0Q/+LDCagsX5c/5bbiHk3kITlOkkdqUCHLmicqkfr4LZXyuHnPZlygaoxrFM
pWQKdyKOOfpM0U1Z1cuOHjLwTv5iB98Ne5qANisu+FqK6xFJ4ccA5Y2pXRG+2cEG
YJS9S13i37EoR6iOHndhRxeZyxcx080fd7aAJdY9yKXL4+bAmW9W5/zS5XbLyBbt
9MEA8Ah3pUnnLdjfeEq0SH2diKgT9OHXRpP4MEEFJbBufctOLZKoBOBBYPuURxCJ
UxjR6KKyMObW2G6HP7fdgDzj5XYdbMEyHN+Cvom68auUKijpkjfOt5NUTQvxuuni
YbwzbmHnbB76VYY6E/4i8uUPDxlBxha2COauHTiiJvdhBoJtPWSKLEYRU7BFrqBr
SJY+OpLNROUP+oZLTyr7jmAoaJI0wLnBLxId6GjF0iID6w1BybeRRDX34o5+mkpE
TOQ703x0/ZpECHboXKqJgo9CX0XIWtiD+yEbn7/HnR/wvHjksGNrCGxYaR5mrIAv
N75RHCupJjA918YwITUGC0EtKUWOcwlVvLwS2G8gAUZd6goYWyEd/fV7G4VEj/4+
+GA2L/CzSK0TbN+Ktayav2Ec5EQy4mKHa47hkWmWGe+Lh22DNNiP2CS3LjnPGs2i
II6qTao1jGC6L0sqjSQAw8VxP4TpU/XHRW8zs9HCzUaNg0ZSnGs=
=xmpu
-----END PGP SIGNATURE-----

--j2boipej3wyu4mib--

