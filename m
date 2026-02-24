Return-Path: <linux-media+bounces-53282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DpAGo5ynWmAQAQAu9opvQ
	(envelope-from <linux-media+bounces-53282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:42:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3C184D42
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D13AB301FD5F
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5C336E46D;
	Tue, 24 Feb 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXG+c0Jz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0v/qSPp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016836E462
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926141; cv=none; b=s9AuwqjXprUEAZx1DObVIB4sZanE3HgK1MxK89Af0xC0odY29BGnlk7Wr3iCv26gO7qGsBTwfoEh5weaRCSJRO4H+GmdmS6KHXWFbh6gtp4fI7MSIgsrJEfQvFnbhwZOHtt7k5kDkNQwHWLDys60JbRT21rFDYtC9g5lRfcXc0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926141; c=relaxed/simple;
	bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aozBWKvkbiIHbDkPdgt9qfw9lK30qvu6c6xmsAv2PVKPDnjubjHk6UGuUG8kZ1mXfgDH/oJc5cABXX24nUAdm5jRUMibp5auDkzFzGCW7ku7vMetLusdGIWDYTJK3ul5I7E1B6GKoy0zgdSJRiVSf5c2MSyGYHeeuoc7xUx6GuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXG+c0Jz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0v/qSPp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771926137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
	b=AXG+c0JzrpIYpVv4X+ilfAWMx3MP2MdQA5AD7kKX1uPg0W33Ms2+sFq8wiwS6bJxTGNEEg
	h+TtxVhl5bFBrx2lpYO8fcrNi4COu9OFxCtN1eHSD0tND8EF43MDMY/xJRH21kHjvbztOf
	auDF7VjUqkuxmeCTIVJGVMk9+BtGWg8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-0T4qJSdUOu-eJrW2vdm_EQ-1; Tue, 24 Feb 2026 04:42:15 -0500
X-MC-Unique: 0T4qJSdUOu-eJrW2vdm_EQ-1
X-Mimecast-MFC-AGG-ID: 0T4qJSdUOu-eJrW2vdm_EQ_1771926134
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso6769575e9.2
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771926134; x=1772530934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
        b=A0v/qSPpgXwXyOBrDdm73vRgWcKKriuL3O+otokvaPwHQRTNe5fjh3qoseYl0U1pyG
         sAugxaqDuBFPTvTeIZGSVa57QTvEH9PKC0K7AE8poyah3V5vaWh3lUaNl7ccyH5T6DHO
         FJBY1Y+XSWNgwMcXhXBAJvsjHiheSxj5VrM4wgkLqFTjsFzXYWFBpbbYszYhodYXNdm4
         N8RLl8ksEH/sIKj0X0nPc0PPHO1yZFvDpwpeKvmzWCjzKp46ySwv+yol1xD+uXKl3pms
         7drqLn60HlqaWbRuw5kTAbPEjFr6icAsPTOoqPWbP+7Pka7BF3K8UYI+ttF6MnJmmTiz
         TXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926134; x=1772530934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
        b=X0BzdbwDIGJ75ByiZsOK6/rYJPaoaZ6DWqVTckxwlEtUvxGbRUsY1pKANV1K70aR4Q
         clV68KakRM5d0hCavENfRiNeZ59HlRUW1ppuglVZr7mxuarAXov7uEpndKcGWINJKky0
         /c/Ppd03DwDYOPq/cufHLYVECecRQB+/7YyFnZjxfXdEnSGPjpKex/yxq+uFY5aErlyG
         MwghO11v/XOQ5fDODDRNeO1SaFOz/hbgRZhfjR1cOmsBSEZeBQeHecD754Ri0lgSfGpd
         w3eJPFvwxUfvBzx8MREGGGmeTGhFEqDbEPVNg00AzQh7xaFm5FBUxdZFKL8ZnqKuTlzD
         C4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXlB9Jy+gQH+w5DMCy9tG+VDC/SYQJu88qJcpRa9BNnLMgkWJFk7N4Tx+O+l7oL318FOM0AvfCY8fIwig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Y24RN5flXVdYi1Luy4145Zx2wSLH+Wk33M20jc87MYfxWvJe
	9X+BYTc3RWd6GwPiN1Vv6WNUdO5cgKG5zS6zf0wrU/nwnd8of7pRyMYDw40KAFvfKmOpFHkvIT+
	dJ+btxTkkv14cfmu8kfSo1kKMeWKiDTl1YDbAs+xmCk85VHCg4j9b1EFWHrifIj1f
X-Gm-Gg: AZuq6aKRduV8F+YTeBww0FYegZJKdN3RY/Qim7jlC6YCBGwq4O+RWiqcbqHb/IofVXD
	+AqjjT8JS22lEAMVq15qXdrLRV2j0+bYES5n85V+pI0k45YVm5NwrWOSKcrTfZCeBQidzi4P1yy
	xeJo4uXcn3E7X/BGsIirdB93B8aIu27wCCnnP4Bxvu8htNEdJ13guOBamAaHrIrYm7BTyNi5JNX
	fHBRe62sK1rOUoN2YyR0K+kMXYzdcpgpEXmnpD0rlkvRyep/2iYtPMTukivg+sDR+Twlv6Je/vS
	WDCT/ctsKmhVvUHQ4THQ8x+xHyCXj6EasxBDAlT8xTCx7R1054anRnrEMOwH0aeuWdfBfIB+Mw=
	=
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483a95aaeb9mr191397825e9.4.1771926134360;
        Tue, 24 Feb 2026 01:42:14 -0800 (PST)
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483a95aaeb9mr191397375e9.4.1771926133815;
        Tue, 24 Feb 2026 01:42:13 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b7fddbsm253006935e9.8.2026.02.24.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:42:12 -0800 (PST)
Date: Tue, 24 Feb 2026 10:42:12 +0100
From: Maxime Ripard <mripard@redhat.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
	linux-mm@kvack.org, Yosry Ahmed <yosryahmed@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zryjcv333aysdxbr"
Content-Disposition: inline
In-Reply-To: <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53282-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BEE3C184D42
X-Rspamd-Action: no action


--zryjcv333aysdxbr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
MIME-Version: 1.0

Hi TJ,

On Thu, Feb 19, 2026 at 05:14:42PM -0800, T.J. Mercier wrote:
> On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.co=
m> wrote:
> > An earlier series[1] from Maxime introduced dmem to the cma allocator in
> > an attempt to use it generally for dma-buf. Restart from there and apply
> > the charge in the narrower context of the CMA dma-buf heap instead.
> >
> > In line with introducing cgroup to the system heap[2], this behavior is
> > enabled based on dma_heap.mem_accounting, disabled by default.
> >
> > dmem is chosen for CMA heaps as it allows limits to be set for each
> > region backing each heap. The charge is only put in the dma-buf heap for
> > now as it guaranties it can be accounted against a userspace process
> > that requested the allocation.
>=20
> But CMA memory is system memory, and regular (non-CMA) movable
> allocations can occur out of these CMA areas. So this splits system
> memory accounting between memcg (from [2]) and dmem. If I want to put
> a limit on system memory use I have to adjust multiple limits (memcg +
> dmems) and know how to divide the total between them all.
>=20
> How do you envision using this combination of different controllers?

I feel like it can be argued either way, and I don't really see a way
out of supporting both.

Like you pointed out, CMA can indeed be seen as system memory, but it's
also a limited pool that you might want to place arbitrary limits on
since, unlike system memory, it can't be reclaimed, will not trigger the
OOM killer, and more generally is a much more sparse resource.

Maxime

--zryjcv333aysdxbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ1ycwAKCRAnX84Zoj2+
dm9VAX9JuCh6S7GJf/wUUY2RPjeN5/Hr5cmqHNDJmY78HFfnpCUW4mFYqDeZaoeP
aK99/MkBf0bRStrApFYWF5JgHSK2oeVEEzJ9MxforcaAQ09KVjoG4RckJH53I57/
PQy+P4+J5A==
=fLNZ
-----END PGP SIGNATURE-----

--zryjcv333aysdxbr--


