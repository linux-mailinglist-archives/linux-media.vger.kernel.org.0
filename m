Return-Path: <linux-media+bounces-66774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hPq/CjXFS2r+ZwEAu9opvQ
	(envelope-from <linux-media+bounces-66774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:09:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710071265A
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=i0h5ujtI;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66774-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66774-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CDB137CC824
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAB431ED93;
	Mon,  6 Jul 2026 13:49:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6DD42088B;
	Mon,  6 Jul 2026 13:49:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345768; cv=none; b=TPA8eF1CbmxULKdX6bSx1Y7fzWrDzYG814pra930jlNHAL4KHMsCKLN41xh19TBDwTuy4m4k0jM8h9AI6WkaqclMBZUVHUTQp2q6MkBgCnX076KKvd5tsgYOFmH3Jr8KZ1Ip8zDeR0pKiJ7qf+ZufPU8kaIlT9yWeIWhVwXB5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345768; c=relaxed/simple;
	bh=n2XIM2CQ/NysWLV70KA17o1xrRADPboha/A2J5wScPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUC8O5ZCFgerr7PImHsUX18ZKQZrJFyC9YWNecxB4ytK7QEJaQIV9xyGf9lPVnnqSZf9lpovHuGbQaJyA7GTz0zhXnHqQHqBmVyLSLBRjY+OTiYypG/9xLsbRleFWkacOw4Y11/33kzd5ecfbnElop/r84XO3lYLYXo8IABDGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0h5ujtI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D786C1F00A3A;
	Mon,  6 Jul 2026 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783345766;
	bh=n2XIM2CQ/NysWLV70KA17o1xrRADPboha/A2J5wScPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i0h5ujtIHJf8JcmNUZYbVaz2XCJNa+558wUqGLmQJ6IUGVggW/DloLPLWuhO1R2J4
	 CIOvWervclMAC+t4YHzYZNeUGQs8n5RQhD5+pX7FGLeY/rM5aE9jpEapugictLRSjy
	 U6beDhWeB8OPkhoDVSPRejb9WdNMKzAExXxlUyKhgS+dMwIADqpoFT/nQ2cCpoW9eC
	 K73pyNMp9AVnJTvgF51xaXwNZ1O5AGEmdncXHGxK1cdbGJD4OTUcEagkrNS0kpfl92
	 eL06YmfDi9opIB9rvfLfMV/X8yRpROG+gLsnpOyp/R1Z2OC3JwzKq8tEhICv5cqzGn
	 dck7DrRmZHnng==
Date: Mon, 6 Jul 2026 15:49:24 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Russell King <linux@armlinux.org.uk>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Chun Ng <chunn@nvidia.com>
Subject: Re: [PATCH v3 04/11] arm64/mm: Add set_memory_device() and
 set_memory_normal()
Message-ID: <akuvyu1Pq0ZVMZV0@orome>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-4-d80f7b871bb4@nvidia.com>
 <akYs91INHMXMTI-t@willie-the-truck>
 <akZkuwktaXFTrASP@orome>
 <akaSJ5D98w2cHqb6@orome>
 <akftuw9NyRy36fXA@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eye62g5djwewlpln"
Content-Disposition: inline
In-Reply-To: <akftuw9NyRy36fXA@willie-the-truck>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66774-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:catalin.mar
 inas@arm.com,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:treding@nvidia.com,m:chunn@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,samsung.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,orome:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8710071265A


--eye62g5djwewlpln
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/11] arm64/mm: Add set_memory_device() and
 set_memory_normal()
MIME-Version: 1.0

On Fri, Jul 03, 2026 at 06:13:31PM +0100, Will Deacon wrote:
> On Thu, Jul 02, 2026 at 06:41:23PM +0200, Thierry Reding wrote:
> > On Thu, Jul 02, 2026 at 03:46:44PM +0200, Thierry Reding wrote:
> > > On Thu, Jul 02, 2026 at 10:18:47AM +0100, Will Deacon wrote:
> > > > On Wed, Jul 01, 2026 at 06:08:15PM +0200, Thierry Reding wrote:
> > > > > From: Chun Ng <chunn@nvidia.com>
> > > > >=20
> > > > > Add helpers to swap PROT_NORMAL and PROT_DEVICE_nGnRnE protection=
 bits
> > > > > on a kernel-linear-map range.
> > > >=20
> > > > That sounds like a really terrible idea. Why is this necessary and =
how
> > > > does it interact with things like load_unaligned_zeropad()?
> > >=20
> > > This is necessary because once the memory controller has walled off t=
he
> > > new memory region the CPU must not access it under any circumstances =
or
> > > it'll cause the CPU to lock up (I think technically it'll hit an SErr=
or
> > > but in practice that just means it'll freeze, as far as I can tell).
> > >=20
> > > Probably doesn't interact well at all with load_unaligned_zeropad().
> > >=20
> > > > I think you should unmap the memory from the linear map and memrema=
p()
> > > > it instead.
> > >=20
> > > Given that the memory can never be accessed by the CPU after the memo=
ry
> > > controller locks it down, I don't think we'll even need memremap(). T=
he
> > > only thing we really need is the sg_table we hand out via the DMA BUFs
> > > so that they can be used by device drivers to program their DMA engin=
es
> > > internally.
> > >=20
> > > Looking through some of the architecture code around this, shouldn't =
we
> > > simply be using set_memory_encrypted() and set_memory_decrypted() for
> > > this? While they might've been created for slightly other use-cases,
> > > they seem to be doing exactly what we want (i.e. remove the page range
> > > from the linear mapping and flushing it, or restoring the valid bit a=
nd
> > > standard permissions, respectively).
> >=20
> > Ah... I guess we can't do it because we're not in a realm world and so
> > the early checks in __set_memory_enc_dec() would return early and turn
> > it into a no-op.
> >=20
> > How about if I extract a common helper and provide set_memory_p() and
> > set_memory_np() in terms of those. Those are available on x86 and
> > PowerPC as well, so fairly standard. I suppose at that point we're
> > closer to set_memory_valid().
>=20
> Why not just call set_direct_map_invalid_noflush() +
> flush_tlb_kernel_range() for each page? We already have APIs for this.

Having a "standard" helper with a fixed and documented purposed seemed
like a preferable approach for this particular case. We also may want to
make the driver that uses this buildable as a module, in which case we'd
need to export these rather low-level APIs. And then there's also the
fact that we typically call this on a rather large region of memory
(usually something like 512 MiB), so doing it page-by-page is rather
suboptimal.

> The big challenge I see with any linear map manipulation, however, is
> that it will rely on can_set_direct_map() which likely means you need to
> give up some performance and/or security to make this work. Does memory
> become inaccesible dynamically at runtime? If not, the best bet would
> be to describe it as a carveout in the DT and mark it as "no-map" so
> we avoid mapping it in the first place.

VPR exists in two modes: static and resizable. For static VPR we do
exactly that: describe it as carveout in DT with no-map and deal with it
accordingly in the driver. Resizable VPR is for device that have small
amounts of RAM. Content-protected video playback will in the worst case
consume around 1.8 GiB of RAM, so we want to be able to reuse for other
purposes when VPR is unused on those devices. In that case, the memory
is also described as a reserved-memory region in DT, but it is marked as
reusable so that it can be managed by CMA.

The resize operation is fairly slow to begin with because we need to
stall the GPU and put it into reset before the operation, then take it
out of reset and resume it afterwards.

What kind of performance impact do you expect?

Thierry

--eye62g5djwewlpln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpLsl8ACgkQ3SOs138+
s6HxxA//d5TQAy9G9NF/ZbA14NpOegwi6/NUjnNgWvezWXjMqGI55A0c3bbPyVKd
tYgSNk/b86yED38u0/P4s6EilDp/WwgoM1xy7ibzv5tNhejc/YT343EeL6HiJWj1
qcNFmynHfWiDPj5sp0ZomDHIcYv6BB+Xvq2/xZqHiuID7m8rOKp9YSzvi+HJYvIf
gguy2ZdLlDr9S1NbQ+grzLpoFNE2QIhZn7Hch0JUwecNP7Yta44xzRKNhlFW+2m7
ZtOzsDQ7QKHbGy3tJ+e63Zn5NjOkbRZW5xYH2rkDFt5+RqxESCS3NMXuiQ3RoCIU
qRj7uZvZSTblbK4YNNf2ptTeEA8U0FBtJlTVZeaLp0QeIGVdgGbzC/hEySihrUCK
R7KUsnlh8WXP0vCIj892V+PJnT8EgOq8lzk2nq8Ymp6VxXwehgJeMd6z5pea5zS7
cZNrRSyCJFzPjmFKM5DOqo9brqwud8tYMRhaTWiNvPfvNqZtzP//TEA9OE+4Yizm
2Ol5NP4Y7puaiFApHu958LfbnVGus2qdGkbvu/w4f2nQxIbspoGfIOwOh1MQl0Vj
JOkcl65qwJhLAndx1wepYqOCa8NtBlSaeTagY/xxZ6/OePEgaPCKeMltWVNRFTb9
tuWdL+sDbBfd9LRNtKNu5v/4KPGqF7swq76dY5tmpLSfQ6qAWKc=
=gHEV
-----END PGP SIGNATURE-----

--eye62g5djwewlpln--

