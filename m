Return-Path: <linux-media+bounces-53283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PQYEEhznWmAQAQAu9opvQ
	(envelope-from <linux-media+bounces-53283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:45:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FF184E15
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1404530FB5FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CBD36D51A;
	Tue, 24 Feb 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAYzSEBu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rpqum+Ky"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132E3EBF33
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926224; cv=none; b=VRZU+wSYSFhHVLFBV7rJsKSpqIIH0SonZgKA4//v48v6mjfgEee7DmQuB/nV3YyjPIvoMlSKd/MezxhY3niV2CGAa2lLiSZf1AMNrdndn6iUeNNL7V8N5oPhqmLw1RoVmCzWAW1Msy4vDDoZ0ONNZIM/bpPbaGyoqumqJhHZ8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926224; c=relaxed/simple;
	bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXBc60M7z0SvwoNgPOpntd1AYTZ30Uj/N/s86kZwUkNUB2ufBTaG5Cpx6g4Sv+wzZzH8O6/u92NA2FhGWFfHmn8GUrtLbrD7m5k0P0a/OVgTywr0o8gni39WcrDbEbBY4wXyv6vyPfK0HflDes6vOUPaKsWg9FrruVXjiiCNyXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAYzSEBu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rpqum+Ky; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771926222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
	b=RAYzSEBudNaJRBuL3PlbMRjQX9UnKjMaRmF2dJbz5rbB1kPIY+Kh42caLJ1eQSiJ2m/mmM
	TkgV4OT12+xfF9P9jKyEgewscj+87andWrUHxc/C1Lu3kaPtCwmNX+ypwxU8yx3mPMMWcJ
	fLScCZ/LNxXeQTYcnhHqPPEsJuSxNHg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-cc1Uo9DWNOq_GpgP_suf1w-1; Tue, 24 Feb 2026 04:43:39 -0500
X-MC-Unique: cc1Uo9DWNOq_GpgP_suf1w-1
X-Mimecast-MFC-AGG-ID: cc1Uo9DWNOq_GpgP_suf1w_1771926219
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-483786a09b1so54409065e9.3
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 01:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771926218; x=1772531018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
        b=rpqum+Kyv92pTSQXV0jMxzxy1OTaOUpJK9dX1t4vc0aoDDqkT29Ix2pR/rUOD2OIO7
         3Pq3eIiqJG+fDISE5hvQL9iH236SPQRzxiwMLNsGH7NHz76CI8H5LfC1z//WMLgNRlMz
         NDsZYA6KnPYhk6osaUxRhJ7K2qqJS9nrWoMUK40jO3981L/WYnrAWzMZjpwtsMG8dqc/
         EO3P8OWVfnJ5Rp2z/x6Ki1HhqgP1VFwAIj0hbp9HVQGzE8qngXBp2fvozs+GshuSO3Pj
         VFqii2djh9UYHEWSL7znkG9L6nqoHo5kqfYPw402TZEzvIj+43ddVFzKdh/E9+vxuYZA
         CrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926218; x=1772531018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
        b=BAN4oZrw9CDCMk7qB0VHFB0b7Zi7/vllx+3z6hCAzHgrWYxUogXhC7M3QlKbUdJ5M4
         ok3wbUChpcP0Nh4xPl7vUrGSwN0SuI5mN/46ay5dn4hyOE7Xex4mgrh6EUNJX+Z3hCCN
         yhfXEfbKcDAvjXntRGUu9P+8qaYGCKVTfJp8J4FQ7cUFj2ocLqP8uEWcAI/sq5sYO73H
         OBRqsuhbU62QRoObWJdN0R8Nwk4NSs2UdVfFFACfOgrA8VtqYQBrhWIkn4FiX4IlaWam
         vDvwQOdY83KWT/u105mDDuYMDiGVNaypDv9LlKyiwkLGgUvHg3tnsxE5fcGshAbRDqPT
         yVjw==
X-Forwarded-Encrypted: i=1; AJvYcCWLdhHFh4cs4b5WpEzA4nRQAFiBmypdZgRPzpIAtbduRlqV19fFrn2qasaDzdqY8JMafGbbJeHs3Bl2Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvL1obZBya+3vklXcRcBcJYTORWSjFxxKlxn5915AqcxxHNj/
	MtqlVTmjzEZRZIWOLZNl2fSW0IIJFlZFCHOgDiLTgijazuM4hJIcRuetxG/8qLDuciSca8Ykfcb
	sJhURzAvtlKHqnkAfX44w3wUCG5zAP1gF0WG0U4Bs9+hCo8RhAEVscVy7cC6LZ50x
X-Gm-Gg: AZuq6aJPwl4WCShEXp11UywrwW4+QJ2Ge/xqWc4Huk0xWDJn1UjUw37y5EV9z9pP/sl
	o6KbXeV0L0Ws7UQmN96uFE3SELw2nWIoTLzc4zr9eCFU9MzYNmOT/BlGxEBefRL/Ivlvd7v5nna
	dCmaw5clV4q5kW49H54GxUrl2f3FFpNMsd+jaAAh0xiX1oBEIx/txapjZZOLIVYUxeGQTeapcnx
	gqHTMKnpPPO85KGiqr1iQBum4/AccFVcm96nBKWiUNE7XiumS9Krlfp6Oo97sRmAYnMTOAP4GQy
	EryrBAYRcbbJqB/il76ldeLHVLQFJlSM/UO8dIHDQ3EM8gJpPoRNN+bF2Ry/6Yz2W7a0KgR4XA=
	=
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483afbba1e8mr88663275e9.29.1771926218450;
        Tue, 24 Feb 2026 01:43:38 -0800 (PST)
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483afbba1e8mr88662945e9.29.1771926217928;
        Tue, 24 Feb 2026 01:43:37 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f9584sm14864105e9.12.2026.02.24.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:43:37 -0800 (PST)
Date: Tue, 24 Feb 2026 10:43:36 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
	Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
	linux-mm@kvack.org, Yosry Ahmed <yosryahmed@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <20260224-solemn-spider-of-serendipity-0d8b94@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yylhp6jgdgqsuz5g"
Content-Disposition: inline
In-Reply-To: <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53283-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB7FF184E15
X-Rspamd-Action: no action


--yylhp6jgdgqsuz5g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
MIME-Version: 1.0

Hi Christian,

On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian K=C3=B6nig wrote:
> On 2/20/26 02:14, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> >=20
> > Hi Eric,
> >=20
> >> An earlier series[1] from Maxime introduced dmem to the cma allocator =
in
> >> an attempt to use it generally for dma-buf. Restart from there and app=
ly
> >> the charge in the narrower context of the CMA dma-buf heap instead.
> >>
> >> In line with introducing cgroup to the system heap[2], this behavior is
> >> enabled based on dma_heap.mem_accounting, disabled by default.
> >>
> >> dmem is chosen for CMA heaps as it allows limits to be set for each
> >> region backing each heap. The charge is only put in the dma-buf heap f=
or
> >> now as it guaranties it can be accounted against a userspace process
> >> that requested the allocation.
> >=20
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> >=20
> > How do you envision using this combination of different controllers?
>=20
> Yeah we have this problem pretty much everywhere.
>=20
> There are both use cases where you want to account device allocations
> to memcg and when you don't want that.
>=20
> From what I know at the moment it would be best if the administrator
> could say for each dmem if it should account additionally to memcg or
> not.
>=20
> Using module parameters to enable/disable it globally is just a
> workaround as far as I can see.

That's a pretty good idea! It would indeed be a solution that could
satisfy everyone (I assume?).

Maxime

--yylhp6jgdgqsuz5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ1yyAAKCRAnX84Zoj2+
doacAX9OV+qF5kysBD7VpKcr5kj6qlD3tVyHVcMdeBEkYAtzN36MFGozyNSliCjA
/lA6uL0BfiAOlFg02H8ElnCXHrx1z+Noa4YFNUJ9SeZZcTsz4JPvSJFejlvUlYrT
iKqij7gXqQ==
=qfni
-----END PGP SIGNATURE-----

--yylhp6jgdgqsuz5g--


