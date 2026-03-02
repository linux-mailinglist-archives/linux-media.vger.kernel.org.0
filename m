Return-Path: <linux-media+bounces-54039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEiwGIofpWnd3wUAu9opvQ
	(envelope-from <linux-media+bounces-54039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 06:26:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EC1D3149
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 06:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D5B13009835
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 05:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4312C314B95;
	Mon,  2 Mar 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTq1HzwC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434230EF7E
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 05:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772429179; cv=pass; b=r/GgLar50VahlYqDapfoVNokr/6QhpW4oy1OvUgS3EcNeUcg7Tywh9IYxjxRKnEFSYfHbbYgzRG7YT+s+tx/FCVrZ8heVdOW6IxSYNgOElI2BVx0EDMQFXosJOsikMsDUBcEJRCmtXhdAajwno7Y6dLnHm7TiOuIGeLbrAP+RSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772429179; c=relaxed/simple;
	bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWGk7TaR617RlHdWLk5Ytm3SxNDhlLdMcfCJMHWZInCfqX5jS+m208Xo1QRIR7cuS44l+w1kXzrp0xgkKxEljGdi5cJnw/dly4P2YL64bsz/E3iQF3ErQwHYSr2C3xAH0Ef47B2oEl4vonkI89dD76kpk8WYDhmnl6oSTbngdPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTq1HzwC; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899fa9610bbso9948116d6.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 21:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772429177; cv=none;
        d=google.com; s=arc-20240605;
        b=Y/ijB3+t6i00Jdc9HCDM0a+/SoPgEwtK/yaRYnQGgFQ0zwf7AhG//BVjAvGQkb4/ZN
         GX9gaU72EwZC6tlF948CrxAT867SrJEMLcQ/RoKTTmKXST6fgrJuWSQaQ+vPfc4muFee
         Rg/ZvdMq9HNhblO5bGPtj+C23HUu2oLwLHMWY6J73zc+P0BqX6c9sMaSPMxD4sORR07d
         vv7dZG/qXWNo6a5eGAhPOvaSbOpPr8lxLBrZnrMyfBeMWvSyjV1tjk2ejDB6rhaeRasO
         NeobseX5oxQbwXZw0CadNrk8LQOqoKs7Paj6FxQDKP8ASm5Dxi8TIeTWilHIrlCI4ZSt
         KxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
        fh=HrRY7YSEl23Vjw3hcn+nttmTbjp71uiQ2zOfDaycpkY=;
        b=j9rRzSSiFvuuAqTcEJozAFlMrfL2Iwc2kQBaJ8eGF6noWQP9wnGGKW99NjzZ4By9dU
         4YX3RvQY6WG4Lu2sC+9QVx9Ct0qCFAE5zGhAAmxMujqRJN9/vcG78gOdzypqBT6xDQ9g
         0oX86fGpeJlwfHdAdAvOFGM2AkbSZzomdueuBNxyljXVjV1rjmNrH6SLPLrnBadn4BVQ
         DpkEwnXVTOIZ4iEj3mnHi7kDeZh8LkwCvCNkVs2Wbs80brErTZBH6dZknTuxwFXVJj6m
         aez5a0pF3LWoUBYzlfdeaDwdumQYHvDtI62ODkFMUZ8gsjsgbPupOymV0J9VvfotTH0/
         gEYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772429177; x=1773033977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
        b=jTq1HzwCy/bbdjLy4vUq6ZZp6AKOAdoN0sv//pG76nOI9Il6X3llV1G8zgQ5zcIXDH
         dtvTluzbGu1GMRwyhaCXC04s7OLEEWFtmkGG+ooUr8+4SVyHubkFuiZs5FOWbdSvZJun
         LS1MKl5Y8AGw+40SgPOBbKvsfF7GZv3qQQtCsl8F6KgIatMY7NLZfrPRcts95yRuBbjq
         C5dJZ7sMJYG/qpbgYOgbg1Sw9oIPKckEPHgw6wG7bESwMAkcEWsFJCk1sPy5Y3HJeneZ
         sldC6IUuHKRYwRl5ZuOb34C69PQBjCJucCe2B7wMdfhV8+vGRXSQ52ViKYiV+ANzCzyp
         BTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429177; x=1773033977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
        b=BMXkJK/8tRuHPz2u9mBvutvRDN7MlPJ/o1Qj87oFr1BV5lZdNR17u81EeTrqiEzxaX
         U/EYxtS0bFteyKzh5ryJnFIKUFpFaKLW3nzN6hwAwQBR5cbZINC+ITedNZQ3E1QcKH19
         5NDKsLQcG/2ryanz/SSfkXQ8d1y4qPDDhjMU1JJVVCPact/syQZRkHS0YqSWMsBV4pNw
         TuyKVkcwObZK2q2vj7x6+2eqRe8rdhbjoQeiLY/znfeNRXF9vnHddpltG0zmpXLI1LPs
         QhUD7RLpkTExzz5BeZEDER4LubUATgIvoPXE2Pfmv8Ezcdcm1jYxukS+qbYq7SUaSk+9
         jnFg==
X-Forwarded-Encrypted: i=1; AJvYcCVqRu7AXVr2jS+n7NpzOWwvctIwD83xgEGmx28F2fqZfwB1SBUZAQOhlB8+sYQWCpLw+EX2ufeu8CvyPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xfPaTPMK78TtqJcgQa453FwY54KxPpryebwiH8a8gHNkjpdF
	5QPqAEa2/6KM09qDsQLNHDJlR+jNzuxz6KylVf9FfPSDQYY8wPKLbX5MIMkgeK1rlf6SDhsyPK+
	nOoPIOQiMEhMhLpKb/tcdboVjyzJOdkQ=
X-Gm-Gg: ATEYQzz92w/IKn1hErwHTo9snAPJU/nlbxioU8/O03Ro4uNopnEiAp4g5v7vsyi9QWH
	EpP1B+sKpO+FJG3fNaUSqP4buByBFql5gYtjv9lziMLr+K/hN8lUL2VBMJMkdDc7r6Z2l952xBo
	11111UA8pu+I6OJJGIDRy5VG1IAhGFyGlpcKEZ6Sh+k59DMC6g1USCIBMcMy5hZjS1sj5Srdyao
	DXuot61yMIk9ZrMxOfPB/ITPZErxS+ozAC5yntTI6GeF7njmdPmzAGbgIjhRBd3igc4F03GvXEy
	KRlDB3k1zRi0kzJHrysykkGlELg2DvOdX1MhapB9tksRkPOFJIBBoW12Cl8vNF0SwnQ=
X-Received: by 2002:ac8:7fd5:0:b0:506:9fd8:f65e with SMTP id
 d75a77b69052e-507528a59bdmr151673531cf.60.1772429177369; Sun, 01 Mar 2026
 21:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com> <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com> <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
 <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
In-Reply-To: <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 2 Mar 2026 15:26:05 +1000
X-Gm-Features: AaiRm50W0fvfAVhf0ruGga4uliXFXx9vNuU5MHSLrll0LdDEQpXsLFepA1L85R8
Message-ID: <CAPM=9twnKZYOGchQ0cziSt5yUQxCXNWoKyBiQib2XWvkMiN=GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, 
	Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54039-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 728EC1D3149
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 at 21:32, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 2/26/26 00:43, Dave Airlie wrote:
> >>>>
> >>>> Using module parameters to enable/disable it globally is just a
> >>>> workaround as far as I can see.
> >>>
> >>> That's a pretty good idea! It would indeed be a solution that could
> >>> satisfy everyone (I assume?).
> >>
> >> I think so yeah.
> >>
> >> From what I have seen we have three different use cases:
> >>
> >> 1. local device memory (VRAM), GTT/CMA and memcg are completely separa=
te domains and you want to have completely separate values as limit for the=
m.
> >>
> >> 2. local device memory (VRAM) is separate. GTT/CMA are accounted to me=
mcg, you can still have separate values as limit so that nobody over alloca=
tes CMA (for example).
> >>
> >> 3. All three are accounted to memcg because system memory is actually =
used as fallback if applications over allocate device local memory.
> >>
> >> It's debatable what should be the default, but we clearly need to hand=
le all three use cases. Potentially even on the same system.
> >
> >
> > Give me cases where 1 or 3 actually make sense in the real world.
> >
> > I can maybe take 1 if CMA is just old school CMA carved out preboot so
> > it's not in the main memory pool, but in that case it's just equiv to
> > device memory really
>
> Well I think #1 is pretty much the default for dGPUs on a desktop. That's=
 why I mentioned it first.

But I don't think it's what we would want, if someone allocate a
system memory object then we should memcg account it. But in this
scenario it's where we really have to face eviction, and maybe in this
scenarios it makes sense to state that we need to reserve memcg space
for swapping objects, both out of VRAM and into swap itself.

I'm starting to think there isn't another good way to deal with
dynamic power and suspend/resume if we don't have some accounting for
moving objects out of VRAM into system memory, it's just whether we
can do something special to account for it, but not destroy the
process on behalf of another process doing the wrong thing.

>
> > If something is in the main memory pool, it should be accounted for
> > using memcg. You cannot remove memory from the main memory pool
> > without accounting for it.
>
> That's what I'm strongly disagreeing on. See the page cache is not accoun=
ted to memcg either, so when you open a file and the kernel caches the back=
ing pages that doesn't reduce the amount you can allocate through malloc, d=
oesn't it?

So the page cache is accounted according to Shakeel, so can we find
some other example. I really think this is a bad idea, partitioning a
single resource into two competing pools isn't going to work that
well.

>
> In other words system memory becomes the swap of device local memory. Jus=
t think about why memcg doesn't limits swap but only how much is swapped ou=
t.

But we still need swap for system memory as well, but there are
systems with no swap configured, and on those I think we need to be
integrated with memcg anyways to make it work.

> For those use cases you want to have a hard static limit on how much syst=
em memory can be used as swap. That's why we originally used to have the pe=
r driver gttsize, the global TTM page limit etc...
>
> The problem is that we weakened those limitations because of the APU use =
case and that in turn resulted in all those problems with browsers over all=
ocating system memory etc....
>
> Now cgroups should provide an alternative and I still think that this is =
the right approach to solve this, but in this alternative I think we want t=
o preserve the original idea of separate domains for dGPUs.
>
> > Now we can add gpu limits to memcg, that
> > was going to me a next step in my series.
> >
> > Whether we have that as a percentage or a hard limit, we would just
> > say GPU can consume 95% of the configured max for this cgroup.
>
> That is only useful on APUs which don't have local memory because those m=
ake all of their allocations through system memory.
>
> dGPUs should be much more limited in that regard.

So you think we should limit the system memory allocations on dGPU.
I'm worried about GTT|VRAM allocations which once evicted, there might
be no reason to push back into VRAM and that ending up as a backdoor
to allocating a lot of system memory and bypassing memcg. I don't
really like the idea of bypassing memcg at all.

>
> > 3 to me just sounds like we haven't figured out fallback or
> > suspend/resume accounting yet, which is true, but I'm not sure there
> > is a reason for 3 to exist outside of the we don't know how to account
> > for temporary storage of swapped out VRAM objects.
>
> Mario has fixed or is at least working on the suspend/resume problems. So=
 I don't consider that an issue any more.
>
> The use case 3 happens on HPC systems where device local memory is basica=
lly just a cache. For example this one here: https://en.wikipedia.org/wiki/=
Frontier_(supercomputer)
>
> In this use case you don't care if a buffer is in device local memory or =
system memory, what you care about is that things are reliable and for that=
 your task at hand shouldn't exceeds a certain limit.
>
> E.g. you run computation A which can use 100GB of resources and when comp=
utation B starts concurrently you don't want A to suddenly fail because it =
now fights with B for resources.
>
> > Like it might be we need to have it so we have a limited transfer pool
> > of system memory for VRAM objects to "live in" but we move them to
> > swap as soon as possible once we get to the limit on that. Now what we
> > do on systems where no swap is available, that gets into I've no idea
> > space.
> >
> > Static partitioning memcg up into a dmem and memcg isn't going to
> > solve this, we should solve it inside memcg.
>
> Well it's certainly possible to solve all of this in memcg, but I don't t=
hink it's very elegant.
>
> Static partitioning between memcg and dmeme for the dGPU case and merged =
accounting for the APU case by default and then giving the system administr=
ator to eventually switch to use case 3 sounds much more flexible to me.
>
> At least the obvious advantage is that you don't start to add module para=
meters to TTM, DMA-buf heaps and drivers if they should or should not accou=
nt to memcg, but rather keep all the logic inside cgroups.

I don't think we should have to static partition at all here, it's
just asking for problems later, and it without proper accounting will
cause a bunch of reclaim unnecessarily.

Dave.

