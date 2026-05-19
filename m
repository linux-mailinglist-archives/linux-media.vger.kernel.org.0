Return-Path: <linux-media+bounces-62178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CTELOumDGrskQUAu9opvQ
	(envelope-from <linux-media+bounces-62178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:07:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D4A5836D6
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5286F3032994
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9DE324B33;
	Tue, 19 May 2026 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VyNnfYft"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98731E825
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214030; cv=pass; b=ofSolqJgkrg4V4Hlb7SWWcxkfPw4h635gfH05nLWcF3UzRtfMI2u/w3ECTLP0LFKMwuuXpw7yjEHJaYxiwYfZeFYlLaFb7DEfpGGKeu1mjv2yvtPdVZLaKcHIewtwLpiG7JJfTtqEcya6pcZPbhQu1ggK4SUUJfB0xt2jXgQhpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214030; c=relaxed/simple;
	bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kd/w98KmiCDPslH+MiPGbworInHewCnfS4DUB6LihZ9yJ6smZKHSunjMFsRwxCsjRxHTVfe3DmYG1vwlvdDdLdnS0/8gxKSuyQMGJedYhv4dlNh/fy3IKq3K+0vpLgQooOFzCrMIB8kYLPW1xDfk4iZsmAjY9+LApu6HXWr8nP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VyNnfYft; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d1c670255so445e9.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214027; cv=none;
        d=google.com; s=arc-20240605;
        b=PfazCav8tFeFINraPi3pDs47XI77eKnyy4OIi9UxNYNXi+A2iwwoj83m26VR/+96sv
         D703nkwwWUIRAhD5H22JBLCO+tganGhUPm20lchR8OuqjXPE8ZMaCtMe+Vlnbl5ak0cs
         +MDIS63abWTqBNh6hgqEx+YeToT/JBy/ikPkfG00DUPxdLsQ+hOGbx6gMplmoDiPcSbU
         PNJ23xG3t8BRun6tX7DJlG6ruwMimRbn44j8NNw2myQjdJ0/kTqXgxBLgobsnDmiLhT1
         nqFREE2v035Gu83vmdfhuk1ro0p8eNi6bbV4uGCM5+l9toJhnAhrS0zfaWt/sftcRT58
         Zl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        fh=SFDPZVAeteritSut7kc3GvjVeCEqZgnWSzjeMObeMk4=;
        b=awk0HzFo0gdm4hMra1ig7++yXJQBM2JGETtGjRW2Xsu8bx6vZfKvVy+zBXWsefVo5D
         DzXo4Qev7Tlp7z7tOtglST4N3+uZUJ7R93AelmsOJRwQR130I9gqPF2U3+aYVGnKL5hQ
         oBk3v/KT+mjsschmT0BV2kuBMJ1dYMDe7Png/3O/0SwcRaOcXLb/yj81BJwYSwvbD+zq
         QisBsd2/ulsy1d3Ks4zjBrh3GOkWKpm3WGlQKpmf/ypMUtfX5itSRs08IctI8wkD5pYT
         tcNhOFZG5vR9hgeOGh4b9x52m2mTwcjX1+Vc5VO1jOs/Y49Qm0wV6oHHmqpmofM2KwMj
         geHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214027; x=1779818827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        b=VyNnfYftN5Zm7O1g2zyDlanIBedjkc47HlTLcNZ8DlZPYbkSWMxSMsRf/CSz/2X/qd
         tkFfv1f0AYulKDrFrLqicAKcw20yqGpc2OkOBAEpUtwyIzNd1kxo64awQjdv3IrxYX1t
         Oh+W9sZAKcEkARL23u68EYToymkAIudI8ZmkttSx9pxJS/AqQ1pWHFuufcC7lDArQGOi
         0NRrUBPaWOWepg197ofEZXkMKb85xn4S3yqEm78eNuhF88mLGEM2VqYLO4A2nCiyhX+7
         0r8nJ5g0e60NJsAhHU7/NimQjv7wvNc6d/BhMwDku/SKQrdBipRznT+XwjDJFvO2rL8f
         GU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214027; x=1779818827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        b=M1HGNxmEoIHfPVOS88ibyA74F32udQGhg6lKdokCm4XkEc/TToI8vV+fbi3xecPCuN
         lDaNvhwad8EEaH5sD2roFJO0x0ZMRr0hBxlGuUZBsN0rnV4ZlCm40UURcmmtmnQDg5iK
         9M4kyN1Llp2a+ezuIWyaZAcCMVtkVO3d4xjbVvFc8+qlTeS7kouwnYTb+SUydhRK7ych
         gHUIRl3ukvmu3WVy/9y3dBoMauWGwjYxfcsNlVV9Hn2UPr5CajPoWXgtrgWjyDySMY5C
         T6qzx0BYa17zHs0pihYjCuKrBSX5SBVq6iEpwSsLpbOlwVzXNFuoBnLplAAqSTM1H+JL
         jrBw==
X-Forwarded-Encrypted: i=1; AFNElJ8u9batwzaa9DGNKHPPOnMdjPXg5bQ7QdAhtj9ZKRLtfW0xvouzlJnGFQm8W4MDj6fYAP0OzewhFEeJ7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyswxSwzyYOkbuo3Y6xhwEJKhn9K7lQ69Gqhv3FoVJ7JTOKJ3na
	YU8qz5nQoSrZUtgcl7Kmjgrrtq51f6ilx793YxXSn6EK8hOEJ8d7EYXkubiNcHOYSJKPWKcDpsb
	Gfihdxim80+8mqVjYCbacuu0ortyCddwSrnLhWUGN
X-Gm-Gg: Acq92OHO5vKiZ7cFJlMgJ3YfvjHOcYZUOsyBtof833/DFBZmaKbnWJSULuZVpNELm2Z
	JNcu2ytrvDHqgIq47rMqFv7hFI8Pq21xc4lqqqE8QWPgkrk7Xzsu0dearTZ1hZ3M2/sVi85dM3y
	cY+oMwToxV6xSuSELFz+mV6o7AKgaBRm6l2h47ekvkJy4o1oWVOXdE1igSQ+O8cHtSBbZQw+Rdp
	Kt9cnVybXWwKyDgqGgBVlLHk/mlC1fb2TrMBtHFA9GkKoc7fXOawJIQ7XVveuns5lr1lt5eQOrK
	VA2tQy2msxCCODTZkXwW7Yazbt0WCpak2vBZjY9wgcr51nq7B93bgONXkIA=
X-Received: by 2002:a05:600c:828f:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48ffa06d607mr4555145e9.0.1779214026686; Tue, 19 May 2026
 11:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CADSE00Jq_uvNgvxgPze0mEdUd+hF4-DPZkHy0KroWHZzygf4WA@mail.gmail.com>
 <CABdmKX3DhejYBis9htLDnzPrG7vuF3R3URLVNEbnyd61SSsx=g@mail.gmail.com>
 <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com>
 <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com> <CAGsJ_4z121v4tK_3+j-hkD7HH0gH3w8tWD8nk0CwRhFE5T+4Og@mail.gmail.com>
 <8a13b1ad-f1be-4ef4-905e-0d9828ae8cb5@amd.com>
In-Reply-To: <8a13b1ad-f1be-4ef4-905e-0d9828ae8cb5@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 19 May 2026 11:06:53 -0700
X-Gm-Features: AVHnY4ILqt3aAhuKzQVtfjO_TWAUc-lBkfBsfy8pZGOgOTZtrN6Xce9TENH_RxE
Message-ID: <CABdmKX1o5FeR697DGdExhSDAzdLBN=y4ijpA2SZyisC6ThYKbQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 2/5] dma-heap: charge dma-buf
 memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Barry Song <baohua@kernel.org>, Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri- <devel@lists.freedesktop.org>, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62178-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 40D4A5836D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:10=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/19/26 01:00, Barry Song wrote:
> > On Mon, May 18, 2026 at 3:34=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/16/26 11:19, Barry Song wrote:
> >>> On Thu, May 14, 2026 at 12:35=E2=80=AFAM T.J. Mercier <tjmercier@goog=
le.com> wrote:
> >>> [...]
> >>>>>> I have a question about this part. Albert I guess you are interest=
ed
> >>>>>> only in accounting dmabuf-heap allocations, or do you expect to ad=
d
> >>>>>> __GFP_ACCOUNT or mem_cgroup_charge_dmabuf calls to other
> >>>>>> non-dmabuf-heap exporters?
> >>>>>
> >>>>> We're scoping this to dma-buf heaps for now. CMA heaps and the dmem
> >>>>> controller are on the radar for follow-up/parallel work (there will=
 be
> >>>>> dragons and will surely need discussion). For DRM and V4L2 the
> >>>>> long-term intent is migration to heaps, which would make direct
> >>>>> accounting on those paths unnecessary.
> >>>>
> >>>> Ah I see. GEM buffers exported to dmabufs are what I had in mind. I
> >>>> guess this would only leave the odd non-DRM driver with the need to
> >>>> add their own accounting calls, which I don't expect would be a big
> >>>> problem.
> >>>>
> >>>
> >>> sounds like we still have a long way to go to correctly account for
> >>> various v4l2, drm, GEM, CMA, etc. In patch 1, the charging is done in
> >>> dma_buf_export(), so I guess it covers all dma-buf types except
> >>> dma_heap, but the problem is that it has no remote charging support a=
t
> >>> all?
> >>
> >> No, just the other way around
> >>
> >> DMA-buf heaps can be handled here because we know that it is pure syst=
em memory and nothing special so memcg always applies.
> >>
> >> dma_buf_export() on the other hand handles tons of different use cases=
, ranging from buffer accounted to dmem, over special resources which aren'=
t even memory all the way to buffers which can migrate from dmem to memcg a=
nd back during their lifetime.
> >>
> >
> > Hi Christian,
> >
> > Thanks very much for your explanation. So basically it seems that
> > dma_buf_export() is not the proper place to charge, since it may end up
> > mixing in non-system-memory accounting?
>
> Yes, exactly that.
>
> > My question is also about the global view for both heap and non-heap ca=
ses.
> > After reading the discussion, I=E2=80=99ve tried to summarize it=E2=80=
=94please let me know
> > if my understanding is correct.
> >
> > for dma_heap, we have the ioctl DMA_HEAP_IOCTL_ALLOC, where users can p=
ass a
> > remote pidfd or similar information to indicate where the dma-buf shoul=
d be
> > charged, as in Albert's patchset.
>
> Well that's the current proposal, but I think we need to come up with som=
ething more general.
>
> > For non-dma_heap dma-bufs, we don=E2=80=99t have an obvious userspace e=
ntry point that
> > triggers the allocation. So we likely need other approaches. We could e=
ither
> > move more drivers over to dma-heap, or introduce something like
> > DMA_BUF_IOCTL_XFER_CHARGE, as you are discussing, to let userspace expl=
icitly
> > declare a charge.
>
> Yeah but that's not only for DMA-buf, we need that for file descriptors r=
eturned by memfd_create() as well.

memfds get charged on fault, so an allocator shouldn't currently be
charged just for creating the fd. Unlike system/CMA heap buffers, the
shmem backing a memfd / udmabuf is LRU memory, and swapping the memcg
owner of those pages is a more-involved process which is not supported
by memcg v2. There used to be some support in memcg v1, but it was
removed. Commit e548ad4a7cbf ("mm: memcg: move charge migration code
to memcontrol-v1.c ") said, "It's a fairly large and complicated code
which created a number of problems in the past." So I'm not sure how
much appetite there would be to support it in v2 for this.

