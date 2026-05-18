Return-Path: <linux-media+bounces-62055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FeQBj+jC2ooKQUAu9opvQ
	(envelope-from <linux-media+bounces-62055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:39:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D2575094
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B7C303D139
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 23:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B52C339847;
	Mon, 18 May 2026 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkjI2+F7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D33368A3
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147558; cv=pass; b=IB+oDfIy/c7p77ObocXkhfP/7acQN1x/DqwdvzF1hiSa3qjYah5rNIJFDutGAAi8nInDY5+9NZaDoNXiklVR/VyAONcuQepWjGKArWgpEbZUPnfLUrCQMk8Cnz7KrnNfji1QiY6P7Sxat1IeEyXFag2X8XJI0LkSJdh3SOQ24i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147558; c=relaxed/simple;
	bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXxUcPm61GXOOUkWA++TCKaQ7JlNVO++tdUBMRGrdAzT39HiEOZnzXEpnqF7TeaLO/evgxPryTvNPGFnBOMeVcPldawHPZxtmTlr7JznxKPWOn5rU8UNvXc1URrFeJIF6cWo/ERTMktlv2mReOQC+j5+VNrgZhjMadTd0kOmD/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dkjI2+F7; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d1c670255so535e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147555; cv=none;
        d=google.com; s=arc-20240605;
        b=JsV+jVNEQKa7eSOedHHTaVG6oRvV07XLwGDlC2KpwaXkRjh9kNGkY5KNfvBpJXLI6s
         Q8wHlNMMZlzxaWRDsGTsJyz/AsYlN/z4cigBqoYm1HWKkinXWBC9eAeKFf5LWVNO7DXC
         uZhjjeENQNwVeej3YfSwYTDkghnd/ZuOOc+CmXbtPo6iRE3LlEFvujs1xFR92VD5j8bx
         //+TEH5OJgGWUVffm0WVpKIgL1lDdVuPzFOm37sDzCBWp4A0TMn7A8vqiCv0gj59xyaj
         EIsPsdz0bqKC4HD0JwLRnNS06JwVDyPPxc3YkVgJIarzTNT92pq4x63Dtywh3zRE/LL+
         RqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        fh=sAL9sgZRCxmfqhk0fs6nqsmoC6JAERRUAXEKmbn89tU=;
        b=ObCGWY8FS1i7O6p4jc4nVuDB19dYAC7VtjfXWQ1AK+VSCtnCsEgogIRA8T+NuBf2bj
         ZZppI0rOEUipvkZsZT7HB8SXgzU7AvDzVXbD9yYKlw16Iov+GvhC/X7Pc9kA0WbtzNvG
         dbDwulznWILlB9Xny56u0uCHKNS9QDKZEn5DnNiJjFcI3Q3XOrR8YCerURtO7aSiNLwb
         E29fFGbKkmm/FYuIfXYASS9hy2JY6E4xIccsYfG+RDj0Gf6y2L/eLu+F4HSNoelEMXOt
         zOL5hV9xRj6FdiENQENJ/jmktc2lTxkD3t2jEDgknqEBsXUGYY4p1+dBOgYykZPGBZDs
         8ZUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147555; x=1779752355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        b=dkjI2+F7xyeNSzdsRkisNqvLDdT+z1hxl9TqH+vTr9fo+IMNw4yxxGDpchnWUChTMr
         yMsT+EFry89MDfnSEnxXSx7sE6owGiucGUvDKOMygt/POfNsImvmtpSE0oxGyFblsp4d
         exXs7zkZnaXIVunKRILF63382NxZrY7yv7/H6C9WS3dTfhBZcOheGfH9wS6KnDtxCBfl
         j/UZZputPk4x0gnpNbY+uRoS2W1bMVEYrMhGdl8h97Prs1A5v4Cx8UEfUSozQChCEUQ+
         KCyvWab1sW6A5ShyoBXx88D5J+60TP8b5gz24B4aybyFPTXTkI56d6Fckz5g3cyUsQAb
         SG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147555; x=1779752355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        b=Jeu94846LF2Ep8v8+jPdbyNQZa4uUIZqAlgveARPafu5Qc8zpzU1Q9uiSbFcNmt3jh
         TiqehXrD+/DCx1+UQEoA9iiBMxMt8Iu5ZF8OkHtQe1A9WbiJk8LmVF8TGXlHtHLIDV4E
         V+60FzBLcRsoqIx1PB2qjhPetmBpSN8IbnieGZg4qFQI8IN7+XASxje35OZ9PMUDpJL0
         8ZVRn2N0RXR1DAoWVpHw6L3WT2Gj4uFNjb88WG4yz0TyC38ipWz248Q7v1h+sCHoyH9j
         RezSOL+0VJRcJjKHTx4RWhXT8BUV2FO+sJHSGT1N7YymAGGczKemCt66c1S2RKTnm8PP
         NqkA==
X-Forwarded-Encrypted: i=1; AFNElJ8HTIGoC+YCvIX1Yifp7g4YjUiB1nGEIYWiQI1AB1PfujYZazUb59kkEO+uyftFHPsZilkndshBPDgN2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvM4W8ks32nk2mzZK94mJmHX/vjDC9gvCXliQeSp4gJvXeM3RZ
	HPm0VroTwjs6Iu3BJ7Mc5pCR4YQLM5LZgOmuvqIG5PEWkPJ74Xs+3RxZCBloFF98C7Bmhy3mrts
	Q34zKLfCNNNWh9p/CbrcSUEiSwLpVxUCuWGg6/Jj1
X-Gm-Gg: Acq92OFzjYbHsemVuzkSWIOmIR3Dj2DPA0pdXTN4bVQJtcZbgHNklu/U/CeJ7Fi+a5Q
	c3bHC1fhjaFs9+atxGzw2vKv3C1hHZ1ilqo/n42Uotqpnowm9dmizYZwq7Z6zBSspWKQOntVmZZ
	9Dnba43x5NGGWxjQtiZG5hqdiNCmzmu0a8TYExEBOP/83bNTw7nE02IExpNSNjeeFlsGoQLmB1F
	/VSgsYQ9sSJVii7EKu6sUJL8fp4dWxM/QDmMFl8bzwMKAZcmV/QXV5AJefQaYC0lWHOlROLDFcI
	LrRI9NWV+H10SOKynY/q+zBi+8ypWE6xzUiKmEOzJF9TDNzu
X-Received: by 2002:a05:600c:83c4:b0:48a:56fa:36dd with SMTP id
 5b1f17b1804b1-48ffd85790amr3271995e9.11.1779147554173; Mon, 18 May 2026
 16:39:14 -0700 (PDT)
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
 <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com>
In-Reply-To: <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 16:39:02 -0700
X-Gm-Features: AVHnY4K5WzHxjnmBKK1J4Ij9G3s1JmujGOC18rtfp3AXYH6mFeA4fkV1W-efX6I
Message-ID: <CABdmKX3yZubjDKbVqwrjHAiKyj_ioHzOoxd0wzFbJK=PAGOqcQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62055-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AE8D2575094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 7:07=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:50, Albert Esteve wrote:
> > On Mon, May 18, 2026 at 9:20=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/15/26 19:06, T.J. Mercier wrote:
> >>> On Fri, May 15, 2026 at 6:53=E2=80=AFAM Christian Brauner <brauner@ke=
rnel.org> wrote:
> >>>>
> >>>> On Tue, May 12, 2026 at 11:10:44AM +0200, Albert Esteve wrote:
> >>>>> On embedded platforms a central process often allocates dma-buf
> >>>>> memory on behalf of client applications. Without a way to
> >>>>> attribute the charge to the requesting client's cgroup, the
> >>>>> cost lands on the allocator, making per-cgroup memory limits
> >>>>> ineffective for the actual consumers.
> >>>>>
> >>>>> Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> >>>>
> >>>> Please be aware that pidfds come in two flavors:
> >>>>
> >>>> thread-group pidfds and thread-specific pidfds. Make sure that your =
API
> >>>> doesn't implicitly depend on this distinction not existing.
> >>>
> >>> Hi Christian,
> >>>
> >>> Memcg is not a controller that supports "thread mode" so all threads
> >>> in a group should belong to the same memcg.
> >>
> >> BTW: Exactly that is the requirement automotive has with their native =
context use case.
> >>
> >> The use case is that you have a deamon which has multiple threads were=
 each one is acting on behalve of some other process.
> >>
> >> At the moment we basically say they are simply not using cgroups for t=
hat use case, but it would be really nice if we could handle that as well.
> >>
> >> Summarizing the requirement of that use case: You need a different cgr=
oup for each thread of a process.
> >
> > Hi Christian,
> >
> > Thanks for sharing this atuomotive usecase. If I understand correctly,
> > the actual requirement is attributing dma-buf charges to the right
> > client, not putting each daemon thread in a different cgroup?
>
> Nope, exactly that's the difference.
>
> The thread acts as a filtering agent for both memory allocation and comma=
nd submission for somebody else, the process on which behalve the daemon do=
es things can even be in a client VM, completely remote over some network o=
r even something like a microcontroller.
>
> Everything the thread does regarding CPU time, GPU driver memory allocati=
on as well as resources like GPU processing and I/O time etc.. needs to be =
accounted to one client which can be different for each thread of the proce=
ss.
>
> The only thing which is shared with the main process thread is CPU memory=
 resources, e.g. malloc() because that is basically just needed for houseke=
eping and pretty much irrelevant for this kind of use case.
>
> The problem is now you can't do that with cgroups at the moment but unfor=
tunately only the kernel has the information you need to know to do this.
>
> So what you end up with is to define tons of interfaces just to get the n=
ecessary information from the kernel into userspace and then essentially du=
plicate the same infrastructure cgroup provides in the kernel in userspace =
again.
>
> > If so,
> > the `charge_pid_fd` approach achieves this directly by passing the
> > client's `pid_fd`, without needing to add per-thread cgroup
> > infrastructure.
>
> Well it's already a massive improvemt, we could basically stop doing the =
whole duplication part for the GPU driver stack and just use cgroups for th=
is part.
>
> Doing that automatically for CPU and I/O time would just be nice to have =
additionally.
>
> Regards,
> Christian.

Hopefully I'm following correctly here.... So you are duplicating the
GPU driver stack to achieve remote accounting on a per-thread basis?
Does this mean for GPU allocations you currently have some GFP_ACCOUNT
magic in your driver to attribute GPU memory to the correct remote
client? So this series would close the gap for dma-buf allocations,
but what about private GPU driver memory allocated on behalf of a
client?

