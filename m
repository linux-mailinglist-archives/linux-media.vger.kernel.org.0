Return-Path: <linux-media+bounces-61981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJkpNqsFC2rd/QQAu9opvQ
	(envelope-from <linux-media+bounces-61981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:27:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0BD56C9E0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F292E30C64A1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164ED3FFAB2;
	Mon, 18 May 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WhDsoxB7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pJBVJPui"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81B3FFAAC
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106617; cv=pass; b=hOclkW6we3/gdlsXiJaCdeTJRnbc11AtnSI4mQhKYH5DDkbw1ua+s/cohiwhV/GIbIpILY1QspO6Vav4cR7+28nUsU0jCD77lP7xFrt3A8j3AzfGEBDkakBEBBvtu8wN0bhFYRCitsOwguHpx8gmfdItkGH7yN53LIh8KMjfIGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106617; c=relaxed/simple;
	bh=GxTu0NfteCWY6YUdX16wT/N4BvT3hXjpZN7hbF/PIrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVSOG1Sy1dx3kdSBGz9I45dtVdC3bIKhfOhIfna8mfAUsCIL7mW6ZnmYN3EkbSOcTK9DdwbqbwNCyU8JzJjSu0bRyzAMFBCNmvmtzGuKdfnQyEVvZXVG9I321foTpHLQ0+YTY+n1cQCsmF8WIKvyhi84RcTlUErxox7D43LuGaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WhDsoxB7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pJBVJPui; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779106614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
	b=WhDsoxB7L47W8xbX7MDJn5xFkPS7vFUBxSLsjTkdQHpCUvfrZ2macQHMWB5Me9Oz4xFfRy
	rU83cKpB8CWTcAbKWSg8hKQKNCQ8hlhIYhDmkzl2awUlsQhJES36YB3UMNZPoB3GfPhtaw
	3OcK3btvZLxFKGwZt6Fh6qdu7EOZEMI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Qzm1zwHSPH2YgujfaXdqOA-1; Mon, 18 May 2026 08:16:53 -0400
X-MC-Unique: Qzm1zwHSPH2YgujfaXdqOA-1
X-Mimecast-MFC-AGG-ID: Qzm1zwHSPH2YgujfaXdqOA_1779106612
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd795b6288so25758657b3.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106612; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlVmHEgk37vBVBtp634p0EUnp/nSt+O9Ypi0Oc2QD19rjDJAC47ppsJy37vU+GtuAa
         NWIEQNyURNlmZoOzj5otCHVT6zun/WUSj8Vmtk+H0buZJrrmtTyYxMe1QW8oiCtjlNRv
         ojjj9BTNuHOtio+JcsIPv2Lq3qJz3YewHZnYJ0p4SMFQI4S5S8Gt6mRiOp0HW3LaVvKg
         jLNbogquMSSQs75EkWw9JshjdxBDSjcwtLOAW2p46EB6hdq+5ZotU+jt5m5OToyjwyt7
         HdL8axGCjzEm6ZYrzSiO8VorY5s/0sPJFfJAlWxZKAxWjymEQas5SXiDE2L7PprfOSyD
         K1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        fh=3dPN4pp8kPQRSEs54GxC8s6FCZACt0KaX/lWWQQrvUY=;
        b=jvcd2He1l4i35BqvvPEaeiKmeud2OClTqpUwkSGZR3ZLgt84AqqbDY1IdlpkXZbWt6
         1Xs2eUSqF2HdwdlfCKmLkwFksNSzxPN3bbCwYOR0dbCsu+8Z1ArhF3vNzcHvKv+w4U/8
         qDAjmo9OMTSd/Y67mlernK11zSj5gDYDaGzG8QKnCK5mTOrV990Xan7Yu2BYr5AdQsL2
         jahtvQjs7PNYYJkCSOb8KUH3HH5rBT+YOaTmpORMPjVLLXCBMfHsO7N3/oKO3tJ38/9B
         /KBPSO9RJ6hTAXEDwJiMgWHT30sKNepxRLxAPL7Y3te2kkzhHy+snMh/195RnCqwTSrK
         bStQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779106612; x=1779711412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        b=pJBVJPuiJ9TppGffJ7/vAPnD/Z2mIYqgiML0AkBYA1lmD/96RwCBB8DnmO7WT60GyV
         jW3ZI87unkDZDW1xghetk6urrRbI8jcT3MHbs4F036uHvin3DbJvk0wV4UVYhrjx+7OO
         hJpJgv6Kpa+Voxr33d9/uf64uTHm3+FVc7FyztyY/lG1ypsZBNQLT4nlkOXQDotGpVvw
         /O6OQltvdVdc9xB5Yh0uKHN4cq1059lXmi/dghfpxCuqIbhEgXnMAVhwkqPbZCvdhj/0
         K25FscMl+T1/3s0pDQ1A8+NmNuixSyESlMeW/b/5L46HmwbaMFwq3CKrmfq/VEc/wZp2
         D7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106612; x=1779711412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        b=CSwZV0ZINXsTXt/PQbxQFcLfZ0nxJQe+2nfVD8ibWqiR5lXslHScPwGMCiAQPpLCih
         ssQk2bxZYsdb++vuHU4TrP1kVkxdYjU5pxE3FSXrNqCzfWl+HXcbf0lFicbfQH+6BBOv
         2UsyM3ZNpCGfUYhGI270ARkJwXw2JQbyG+7CgUfmjkLsEfNJ14qchRbhe9RVFYBypbJP
         ouB1B9a4lDXFI65xFaC8BdlYV8fm/8B6ykwQ1TzSDiarHgaLeXQPxYBI212vfU/jpeOY
         TqWEF843Q5z1LjUZp2UdA6LUIvlw2Z3CLtFr+nrMSRbHYG9BCNQk4Cef5rGx/0c68Q4s
         +ilA==
X-Forwarded-Encrypted: i=1; AFNElJ81cH+6fPHTt3tDeDCNLYerswIxiYtV3/eDiz/SJOocQgL4P4NTQBbFerLFwVRw3Nh+Ob3XrTqsnwPpTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9RCd52AfvDWJaw6TdZtVfajwmD0QnPSyPXvYXqbO9V5xIpKby
	0qvzEYqlVsAU9NExjvZtDNdFpYCcsRk8Uczdeu8iWSuFe5jfTfY+XeLRjcBYyUP1uo8TPuV+iFm
	X7YiQhipjkv9d5Vgc3xcpu59q/WAzfLH/zYk4B566Bxk39sRA+ZzCnQmlJ19WK3e2yq7QJ4wRS2
	9Y+zJ4a8/YSdu7QW/UUDyuYzVCoiutmRhBolQBilg=
X-Gm-Gg: Acq92OFQafkhwXRrzWz4/g3kgAfBAUI43kMP8gpXX/4kW//7xsK1Duj/RMYQ5bxNnIG
	rU9dPeJQwPvhzQKXtnBQpeUIpJhm10BWlJjdesSPfte9VMLTaHpHymFzIAiQBJT/ELTnfC74j1w
	4cDRE+fd7GuyIuY/9RE6adORjdvyCOlOHpY9AUwulyw11aGQ8Ti6Wom2XDCGlggkNial0XVxeDI
	XwZKw==
X-Received: by 2002:a05:690c:18:b0:79a:b440:5c8d with SMTP id 00721157ae682-7c94765b6ecmr126201037b3.11.1779106612321;
        Mon, 18 May 2026 05:16:52 -0700 (PDT)
X-Received: by 2002:a05:690c:18:b0:79a:b440:5c8d with SMTP id
 00721157ae682-7c94765b6ecmr126200267b3.11.1779106611396; Mon, 18 May 2026
 05:16:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com> <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
In-Reply-To: <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 18 May 2026 14:16:37 +0200
X-Gm-Features: AVHnY4KtxiMU87dVIS1J63myR0LimTeIXsyDKnE3-mVGrbnQ2cunkdBN5oMYBbg
Message-ID: <CADSE00LjJcL8P5M-UPEpzZijU70uEmUirnin29N8YR5W5D-oFg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3D0BD56C9E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,amd.com,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,redhat.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61981-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 9:37=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 12, 2026 at 5:18=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On embedded platforms a central process often allocates dma-buf
> > memory on behalf of client applications. Without a way to
> > attribute the charge to the requesting client's cgroup, the
> > cost lands on the allocator, making per-cgroup memory limits
> > ineffective for the actual consumers.
> >
> > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > the mem_accounting module parameter enabled, the buffer is charged
> > to the allocator's own cgroup.
> >
> > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account for
> > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and route
> > all accounting through a single MEMCG_DMABUF path.
> >
> [...]
>
> > -               if (mem_accounting)
> > -                       flags |=3D __GFP_ACCOUNT;
>
> Hi Albert,
>
> would it be better to move this and its description to patch 1? It
> looks like patch 1 already introduces the double accounting changes,
> and patch 2 is mainly just supporting remote charging.

Hi Barry,

Thanks for looking into this series! Yes, in my head I was trying to
keep patch 1, which was taken from a previous, different series, and
then diverge from it starting with patch 2. This would clarify the
difference between the two. But I can see it just added some confusion
(for example, patch 1 charges on dma_buf_export() and then it is moved
to dma_heap_buffer_alloc() in patch 2). I will reorganize it better
for the next version, including your suggestion.

>
> Also, mem_accounting is only used by system_heap.c; has this patchset
> also eliminated its need?

No, mem_accounting is still handled in this patch for the general case
where no `charge_pid_fd` is used. See dma_heap_buffer_alloc() code:

+       if (memcg)
+               css_get(&memcg->css);
+       else if (mem_accounting)
+               memcg =3D get_mem_cgroup_from_mm(current->mm);

>
> Thanks
> Barry
>


