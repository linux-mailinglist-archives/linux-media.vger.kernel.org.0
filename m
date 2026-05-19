Return-Path: <linux-media+bounces-62179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPViI1GnDGrskQUAu9opvQ
	(envelope-from <linux-media+bounces-62179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:09:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC1583727
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29A14305EABB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED1D32AABA;
	Tue, 19 May 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWeWeIWF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889D326D51
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214071; cv=pass; b=OWbLhjLgTdLhbRdV5oldz5gAcsPum5qENOFFaSr0Tl0c2MNzwnI48T2mWtzlGjiGG34bVRPoUwoK4Wg4Ko9ybu00FMg+9gFLgMLC1IoNu1XZJhcsaw2NYCTLkmO1bOx1E4/vfQX3eFqH5kh3MDcBmTUfO/G+DtE5d5/5fg7sVGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214071; c=relaxed/simple;
	bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFy0XRSQ4fXcl8Q/jCvZQUy0Jh5je6IaWFTR8MFPe7uB8ybYqxOoPBtPCBLjY/+T0r3i58WIU75TsmDdYeYngZR67nEXNK1NJ+AnrEkgwWdzp1CiYyySrKtbnEyQetnPuUgdEFUUxJ5fGYtx+j4/e/+hd0F4TjrrfFauNBmxuCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWeWeIWF; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso2075e9.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214069; cv=none;
        d=google.com; s=arc-20240605;
        b=e/HdytufkmcnFWPq7SHjEOPUuZ6GTSZpDN+BCVX4OXWu1VGvrF7ctHkHksSS5VKYy7
         jaxR7JinQesIhF55h/QBL9q44pXJUEnRF5sZHrXbR6tk+gzHX9QYKXcdciy1e87lYxqF
         AS6isRPptQdGNHPix91Z387ZWmHMJ/oxohcLFJXt1HHyUyg2PwinL9DOPLheYG6vtz9F
         nGOq9k1Q7Q9l2nlHBuNq0/Ycan1uyPOVsqSp+7NL+qniNpD+EhVGC4HLBMgPpUMseDmv
         CN8Kuv5eyMKyWq+cRVn2liKqoFmyRlwpcr7zyBt0JCIxCTVunFApjfLtGN7j62ie0sIC
         S90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        fh=NSMvjA8JCtRkpEclmgGclYZO9D3vn6YjRR0tmzSGeKo=;
        b=Zu0H8dIcu0QSGIlLQfBznyaRZ/9KAvix94ZNQzxwFG9l5VewiE9ikS9o4ttkh7iQMH
         nhtAc1VAuTZzR3Rab/3ervCZl3HZjeWW0tqb41vlDtUarOMgTruUcwcaUqApXZKcJBtQ
         2KfWY9rBgslNvXpTS9pWJ5fAa1zY1tRP1qsYNQ/BDDSPGqTN7zvSGoM6qb9ADaWkuTSK
         NBaDpovm+FRd6NsPOWcb1Vop4cGRQRycYYmJoW9MX1Xqh3R7g80ioF5iW2r4cfb9ay3M
         a+NScDxowofFQXys4HM8XqRkPuedrMXsp5Xs/UT4Mn2g8j88Dog6b1Jhog7Vf4MCzjSE
         1vDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214069; x=1779818869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=eWeWeIWFQkhgJUMtdPmPfch1gHn6y0RMODHat6KPHaMDF1OFqbY09x0XUxRQFve3Tw
         GKjCah7Z65qJy9VtD0Xk6PUxhM5gbnnmPIGPlCEpuxQohywyZ9YAuoDmCOa+72a1xeKs
         S5qZzMKHV2zKB0B9JpYcPsctQUH8Gb9XlVy0HShMsnSXwU9pIA+pP9rjSi9x+ZD9Bs3Y
         xBy3CLTe7d2Swwrnwd+u7NE7MUJinmvcZbLWYQOcJWO1eQ/orFirzO/2qg5Fq/nAfiyC
         1yInXJBRFkQP2HD67p/H19TSSyUE2k1fRPB2hpYAyVhjvkSF0KrJKlfI3BtcNnVD4Hai
         iiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214069; x=1779818869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=WNPD3LnB/NIHThgfqj+Zgijez2UodPOX5gN0BaW0oUgDJzy6uC4pQ6yBzndKuxg/oT
         ANNoTL3aI2zh5wOwDQfMJKPETTnHqZfQGH0xmQVRo5/UGFH1u5yLJFL+vZ2jvFuFJXxz
         tL87wiNnn5Uura7iMztH4RLV1EZYkTEZDtoRDEY1ODttP48RK4Ph9AnynN0G7KJHZyYs
         Tpm9jS4QGRWJZmOsj08oT/Rum14lx8aSKMGGIeTjS/HzC4zArkH4qoGad5v4fY4AmQE6
         Kw//KwPjt5V0f1YNbt57eVyT1lq9oxi5dV9bw3MoSBocqz3v4oM5WjoCCHWRgmrMqYyv
         hFGg==
X-Forwarded-Encrypted: i=1; AFNElJ/Vx/0cwAo4lWa4QTOlJwkrhf43mbxgbLZCNU9b8qWFF3LJszwP94v0/u7N7KJOxJmBkG414dODt/czvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywo1ide3i6QvRfkOHki9d10AxvM9/bd2Oxfrtoq1b9s/T0DUSF
	fE3VMifsH4GCd4WlYLEGzOsLdn9mKhP203XdTIg4xL27qaNyEeXPHMVQ+8WtoV51Y8v/qYqlYqe
	vweR04YGzNJK/5Tt35yz8my1x/xbu0w0IUGPwQZkR
X-Gm-Gg: Acq92OFtcLA812JiW9LvQbo4NJepOzc0tCi+TEZjyNIrLGOPcutaQlX2vNmobKHhUMP
	2LLSm5r9WWdz7wPZoKbNfPehG8gJCcxYuIWVdXR+rEtpUcjxiDtJJkwWS6iMlezgUvn4Sz29cS4
	4xR9crILex/T/xFvwjzodPfptqxvAGlSnvWbACu4iIC4P1/12GUStOV9ZzvxJs6Avxh2zEVIDwX
	Iov3P9cH9tM3U5DpLQ/+kZcMANdMsZNmB7EygjSpQ1sH/f7uh+XL+ixHNwAhpNepxKwLyXH7Mjn
	j729Hj8le9n25fW0w4MeYEBCy0d76nzTiL/VaPbXAPDzU8eC
X-Received: by 2002:a7b:cc8b:0:b0:48f:de33:777a with SMTP id
 5b1f17b1804b1-48ffd857abfmr3637845e9.11.1779214068422; Tue, 19 May 2026
 11:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <20260515-hinschauen-effizient-9e3a05a94f2e@brauner> <CABdmKX0d6Zsg+_TxXjB80UZR23ZvXzxYoWzORgwmx=ZiuE+Nzw@mail.gmail.com>
 <208fb820-d8eb-4832-a343-ef8b360e8120@amd.com> <CADSE00Lh95ygoXGKJGsYvQGEsFV8sVmwEC3uvh8M6r3ERzaJwg@mail.gmail.com>
 <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com> <CABdmKX3yZubjDKbVqwrjHAiKyj_ioHzOoxd0wzFbJK=PAGOqcQ@mail.gmail.com>
 <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
In-Reply-To: <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 19 May 2026 11:07:36 -0700
X-Gm-Features: AVHnY4JsuFzXOj8AzAQ7jEDe53JgzbJyOG548qhgZV3zTdsbu0QldI49eMqYz9w
Message-ID: <CABdmKX1wLoLuWPUEY3D7afQhO0AUnOE7c3iE-VkPuKdeQixBxA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Albert Esteve <aesteve@redhat.com>, Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Paul Moore <paul@paul-moore.com>, 
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
	TAGGED_FROM(0.00)[bounces-62179-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: E3CC1583727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/19/26 01:39, T.J. Mercier wrote:
> > On Mon, May 18, 2026 at 7:07=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/18/26 14:50, Albert Esteve wrote:
> >>> On Mon, May 18, 2026 at 9:20=E2=80=AFAM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> On 5/15/26 19:06, T.J. Mercier wrote:
> >>>>> On Fri, May 15, 2026 at 6:53=E2=80=AFAM Christian Brauner <brauner@=
kernel.org> wrote:
> >>>>>>
> >>>>>> On Tue, May 12, 2026 at 11:10:44AM +0200, Albert Esteve wrote:
> >>>>>>> On embedded platforms a central process often allocates dma-buf
> >>>>>>> memory on behalf of client applications. Without a way to
> >>>>>>> attribute the charge to the requesting client's cgroup, the
> >>>>>>> cost lands on the allocator, making per-cgroup memory limits
> >>>>>>> ineffective for the actual consumers.
> >>>>>>>
> >>>>>>> Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> >>>>>>
> >>>>>> Please be aware that pidfds come in two flavors:
> >>>>>>
> >>>>>> thread-group pidfds and thread-specific pidfds. Make sure that you=
r API
> >>>>>> doesn't implicitly depend on this distinction not existing.
> >>>>>
> >>>>> Hi Christian,
> >>>>>
> >>>>> Memcg is not a controller that supports "thread mode" so all thread=
s
> >>>>> in a group should belong to the same memcg.
> >>>>
> >>>> BTW: Exactly that is the requirement automotive has with their nativ=
e context use case.
> >>>>
> >>>> The use case is that you have a deamon which has multiple threads we=
re each one is acting on behalve of some other process.
> >>>>
> >>>> At the moment we basically say they are simply not using cgroups for=
 that use case, but it would be really nice if we could handle that as well=
.
> >>>>
> >>>> Summarizing the requirement of that use case: You need a different c=
group for each thread of a process.
> >>>
> >>> Hi Christian,
> >>>
> >>> Thanks for sharing this atuomotive usecase. If I understand correctly=
,
> >>> the actual requirement is attributing dma-buf charges to the right
> >>> client, not putting each daemon thread in a different cgroup?
> >>
> >> Nope, exactly that's the difference.
> >>
> >> The thread acts as a filtering agent for both memory allocation and co=
mmand submission for somebody else, the process on which behalve the daemon=
 does things can even be in a client VM, completely remote over some networ=
k or even something like a microcontroller.
> >>
> >> Everything the thread does regarding CPU time, GPU driver memory alloc=
ation as well as resources like GPU processing and I/O time etc.. needs to =
be accounted to one client which can be different for each thread of the pr=
ocess.
> >>
> >> The only thing which is shared with the main process thread is CPU mem=
ory resources, e.g. malloc() because that is basically just needed for hous=
ekeeping and pretty much irrelevant for this kind of use case.
> >>
> >> The problem is now you can't do that with cgroups at the moment but un=
fortunately only the kernel has the information you need to know to do this=
.
> >>
> >> So what you end up with is to define tons of interfaces just to get th=
e necessary information from the kernel into userspace and then essentially=
 duplicate the same infrastructure cgroup provides in the kernel in userspa=
ce again.
> >>
> >>> If so,
> >>> the `charge_pid_fd` approach achieves this directly by passing the
> >>> client's `pid_fd`, without needing to add per-thread cgroup
> >>> infrastructure.
> >>
> >> Well it's already a massive improvemt, we could basically stop doing t=
he whole duplication part for the GPU driver stack and just use cgroups for=
 this part.
> >>
> >> Doing that automatically for CPU and I/O time would just be nice to ha=
ve additionally.
> >>
> >> Regards,
> >> Christian.
> >
> > Hopefully I'm following correctly here.... So you are duplicating the
> > GPU driver stack to achieve remote accounting on a per-thread basis?
>
> Not quite, we are duplicating the handling cgroup provides in the kernel =
in userspace.
>
> For this memory usage information as well as execution times of the GPU k=
ernel driver is exposed in fdinfo for example.

Oh I see, thanks.

> > Does this mean for GPU allocations you currently have some GFP_ACCOUNT
> > magic in your driver to attribute GPU memory to the correct remote
> > client?
>
> No, we just expose what the kernel driver has allocated for itself. E.g. =
page tables, buffers etc...
>
> When userspace allocates something using memfd_create() for example we ju=
st ignore that.
>
> > So this series would close the gap for dma-buf allocations,
> > but what about private GPU driver memory allocated on behalf of a
> > client?
>
> Well we would need a cgroup which isn't associated with any process were =
we could charge the GPU driver allocations against.
>
> But good point, charging against a pid wouldn't work in this use case.

It would be pretty low overhead to put a process doing while(1)
pause(); in a separate cgroup for this purpose, but I guess a fd for
the actual cgroup would be a little cleaner in this case.

> Regards,
> Christian.

