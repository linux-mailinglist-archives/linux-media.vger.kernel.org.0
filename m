Return-Path: <linux-media+bounces-53426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJDJMGyJn2nMcgQAu9opvQ
	(envelope-from <linux-media+bounces-53426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 00:44:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A719EF62
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 00:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B87D30626EF
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 23:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E46538552F;
	Wed, 25 Feb 2026 23:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dahg0zFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C9319601
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 23:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063038; cv=pass; b=Ll/MFT981zI9NPtXhSEZOIaCX7zKfFUaDpecrdobNq+CBuF43aOYZRjp3sWQ4ZZT134s0O8E/N8mR7zd3J0K9fglEliXys38zVV33bBOFOxy89PbguzowPVHaakcAz4BasHY+f5EPD0ELHj08Hr+Td6X6hk8wdMgAyfsCm0MxNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063038; c=relaxed/simple;
	bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCo0qYDawBJxvW4Z7fUTyTpat5XQz2L44NqLyik7z/wuESTj+7c75xXV/pyJRQFaqM8C3Ilbr0hCKmFEXEUZxik1LSVyIm9tAH8jkHinCbdUvlpQ/BshpAkn0NYOtL0GYoeVZutXKC70qkLxVoTquAr0pXmap7mlfmJsbUqKAPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dahg0zFS; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-897002b7576so4270966d6.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772063036; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFpYTXWNdMynNzURN7LEzEzFdpTjjvuJrZe3ZPHiDfiU6i47qCkGtx9veXKQfhLz+g
         VTML3XAR69oxfhDgY8Mjo+j1358jh5/vDMKnIujyeUp0fbGQjOr/iEs13ig8KAwGZJa6
         e2o+Zs8x7dVL6zxjT88s9MfM/s86zA394TMeJ1HTVsQXxxvqLhY8hkVWszN3t3H9hSEJ
         zXturQdQqVp5ODLwH7qKLJJs1F94ria1wafXysUUbtQmAVJ3Xin7u7bsnWa+KaUH8P7N
         Q/tCPehVYZxgY5jJMdohbs+6OhmjgN7C+JeVBK0ZHc37jVwCDbFabHm3OW4rFtZhmUMu
         X2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
        fh=AEmYJHw6NSLcudukFuE06C9nYqDzFNzijQXnn8NMo34=;
        b=Kg8SOAXpHjsPx0/MxmjBGSvwcFkISSBx4hSMmk+sVTHDjwlJqks/cHWBFS22IRv8mv
         580NRqFDmb/Y92LIjNk91GMz5ppmuZZX+gGQjncDlbTUBCs07REb5pFcDFpjR2+jdy03
         at+6+48DFHt7I9WWIgTknGzXcDk5ERRJ7voPEkq4atzIFJ59pnZ121PeuSphKdXraz8/
         M/KmAiJJvZ0camG1BOXQV59mrfN0pbjASjcyCLAbt9c5mMWH5UYe0ajSXeN92cWKYfR1
         mN5kNaen1quA3V+/4hP2UaPz7IdbQSxe8BzAQsB1Zke2mWGEveG+MBrArtSCTtc+fTLT
         3UwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772063036; x=1772667836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
        b=Dahg0zFS1DOmOfiNx6ls6bPR7pzz5w0RNtdiEXVdl/3vMxxVjlt9UTS/R0wh0a3LEA
         mR5Gr8dhbEy2/yyJbVnRVUVp6dLP/Vzmaa56M0427Fwc1RaZm72iGB5yqDwwk+3X59/o
         OWqCSnSDibB2k3157SDqQooJHKtCYZxw80CT3VqyMN4y9cenkozs8k3dsa0TMYyFUj8c
         mf3HrAQIb8dkJoOfUvJstVphJHoliyv1nALMQXhvizDFEG9TGEfZ5ahiG8yTuksWQsQ4
         bKr35qycrXVn6xRq6Zt82BMM36s7DhEOXvqNvvaXkKgCYJOgIKIupmxzmfZimUg7Z7SP
         S3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772063036; x=1772667836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
        b=pT4iy88sGmYDIVRCLxL2gFaJQTih4kEKmXCFMUWOgKtK/lWt8J5/4cPsDFR6TYm1DI
         ++/fTvpOOFkDTGjTlRp06mCtQMAJQkBBHtSM5HPVMObPQtb+3lMKGGDaMZOsM9Ha1AIB
         kJa+7DuSy/m1RrR2vU2SOMpbaxuEUGR8fBsT0y9WeDdjQOgvjVWvnzoLwW1Ywab0D4Ho
         rCFVAuSuiaEpipzjfDcLo9hbHzRp/cK5YMUwh/6eioyon2jf5VX/IPEMvKoAJGqggLuj
         QWiAwT7uO/IUa2+azktfo6PXwScbunK8mogUajEV+O0IjYoS4sYGuk4YmVhNB654OhDr
         FQUA==
X-Forwarded-Encrypted: i=1; AJvYcCXfTGeKWcHd25BhUc1KYfIReEQM4/ARlwpOXSTN9IXCGseqPcSsgth4ObbCMDmb1TzWBwt6EILNGGemSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYPuXVSA1r76GR9JRaW40id64dqu09p1M33iRr1xX0FXWKrHw
	GHFwBERBfVWZEpWwreTnRt3pXmfchwykm6sDuTdKC0ND0jee++9+ndoEwCRq4EDvbMlhJ4/wY9j
	HyzJhzvW+dvEq+MDJL+dWjQkpiOKTP2s=
X-Gm-Gg: ATEYQzzfoOMb96FMAh4xQvHclCxKltpji6IECqkpGK757VJxHHIXUru4wc3MEfE45Ee
	n0IWsm1gWzrC7LKWyq/rgAuvhcc/4eW74bdqbE67V3LJ16BBR1TOaTa5a5+rjCyazQt9otqZPFJ
	Gn3QTSl04XsQUSpbXHCQIBGbkyjq0tWkdc3S0p3OKdPYG6Pt4r3YZHSu7JQacqb8uN9K8Acg0oh
	gncOMEjKI/baooH7HrNzurqCRcX8EOuCajy6NDuzXKMULRcy6fGO3SeL4kVzH5jXa2K+er5nvp6
	q4Auvu8bOrkxC1R498D429r1geU9sSFFMcwqDrN4Jlfc5ti3ql+O1Mf3/9A0aR0DRgg=
X-Received: by 2002:a05:6214:dc5:b0:899:ac2b:6ddc with SMTP id
 6a1803df08f44-899c8065c8emr3236056d6.62.1772063035679; Wed, 25 Feb 2026
 15:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com> <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
In-Reply-To: <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 26 Feb 2026 09:43:43 +1000
X-Gm-Features: AaiRm50TeEvqc50OnpAEgaAX78C2joyWBAyYfH_ecZDl20ZLik30HZzrg2UNE4M
Message-ID: <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53426-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C0A719EF62
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 20:32, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 2/24/26 10:43, Maxime Ripard wrote:
> > Hi Christian,
> >
> > On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian K=C3=B6nig wrote:
> >> On 2/20/26 02:14, T.J. Mercier wrote:
> >>> On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redha=
t.com> wrote:
> >>>
> >>> Hi Eric,
> >>>
> >>>> An earlier series[1] from Maxime introduced dmem to the cma allocato=
r in
> >>>> an attempt to use it generally for dma-buf. Restart from there and a=
pply
> >>>> the charge in the narrower context of the CMA dma-buf heap instead.
> >>>>
> >>>> In line with introducing cgroup to the system heap[2], this behavior=
 is
> >>>> enabled based on dma_heap.mem_accounting, disabled by default.
> >>>>
> >>>> dmem is chosen for CMA heaps as it allows limits to be set for each
> >>>> region backing each heap. The charge is only put in the dma-buf heap=
 for
> >>>> now as it guaranties it can be accounted against a userspace process
> >>>> that requested the allocation.
> >>>
> >>> But CMA memory is system memory, and regular (non-CMA) movable
> >>> allocations can occur out of these CMA areas. So this splits system
> >>> memory accounting between memcg (from [2]) and dmem. If I want to put
> >>> a limit on system memory use I have to adjust multiple limits (memcg =
+
> >>> dmems) and know how to divide the total between them all.
> >>>
> >>> How do you envision using this combination of different controllers?
> >>
> >> Yeah we have this problem pretty much everywhere.
> >>
> >> There are both use cases where you want to account device allocations
> >> to memcg and when you don't want that.
> >>
> >> From what I know at the moment it would be best if the administrator
> >> could say for each dmem if it should account additionally to memcg or
> >> not.
> >>
> >> Using module parameters to enable/disable it globally is just a
> >> workaround as far as I can see.
> >
> > That's a pretty good idea! It would indeed be a solution that could
> > satisfy everyone (I assume?).
>
> I think so yeah.
>
> From what I have seen we have three different use cases:
>
> 1. local device memory (VRAM), GTT/CMA and memcg are completely separate =
domains and you want to have completely separate values as limit for them.
>
> 2. local device memory (VRAM) is separate. GTT/CMA are accounted to memcg=
, you can still have separate values as limit so that nobody over allocates=
 CMA (for example).
>
> 3. All three are accounted to memcg because system memory is actually use=
d as fallback if applications over allocate device local memory.
>
> It's debatable what should be the default, but we clearly need to handle =
all three use cases. Potentially even on the same system.


Give me cases where 1 or 3 actually make sense in the real world.

I can maybe take 1 if CMA is just old school CMA carved out preboot so
it's not in the main memory pool, but in that case it's just equiv to
device memory really

If something is in the main memory pool, it should be accounted for
using memcg. You cannot remove memory from the main memory pool
without accounting for it. Now we can add gpu limits to memcg, that
was going to me a next step in my series.

Whether we have that as a percentage or a hard limit, we would just
say GPU can consume 95% of the configured max for this cgroup.

3 to me just sounds like we haven't figured out fallback or
suspend/resume accounting yet, which is true, but I'm not sure there
is a reason for 3 to exist outside of the we don't know how to account
for temporary storage of swapped out VRAM objects.

Like it might be we need to have it so we have a limited transfer pool
of system memory for VRAM objects to "live in" but we move them to
swap as soon as possible once we get to the limit on that. Now what we
do on systems where no swap is available, that gets into I've no idea
space.

Static partitioning memcg up into a dmem and memcg isn't going to
solve this, we should solve it inside memcg.

Dave.

