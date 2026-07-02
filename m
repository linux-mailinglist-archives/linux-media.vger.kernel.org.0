Return-Path: <linux-media+bounces-66290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sX/fFNbvRWqkGwsAu9opvQ
	(envelope-from <linux-media+bounces-66290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 06:57:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70186F37E1
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 06:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=IcGYTzxT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66290-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66290-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA7C8303CA5B
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 04:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F314B3672B8;
	Thu,  2 Jul 2026 04:56:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073CC364EB2
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 04:56:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968217; cv=pass; b=oNB1/sw4Udj47DwAn5JV2cKgXeYyvZabGGel3rJtmMCulVv8NE3MJ+tb6fJn7inIMihW1ZCBlhe5Qv9lhgLcQAXidenYGOLEDzDamhLqMbVoGEcK3bEmzTvFB+D9k+SCvv4nI9xBSpv/GVgyMbWIZmWiIzYOfwZ5USZwObb5dkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968217; c=relaxed/simple;
	bh=s65isEOLkWD56800G/UwzuLsNE2vVm3cYxQLdhlGrm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ud6Maos6AUxPEvZ1QlCVnzI6nVuQf4I7mjJ/sMr94+Hp7cDeGyboVMehi09vxauQc0Tem/AoiX6fCsefAo/XEIg75ZyhUjpIqz7u4XKCSVS00r3bWukgQ5B6FkvdsFsGbY+DXpkDQDctD96BcYE+pOHc17f26bEjFoBxnVpecgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IcGYTzxT; arc=pass smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so19474e87.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 21:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782968213; cv=none;
        d=google.com; s=arc-20260327;
        b=ep/0VqBn7Uq0RMGD1OVqeZWgkz5XGeAftJ0N/SpJuabR032t28xAOGhOCjiZmaymtu
         j4pskEQ3Ng4sUi9gSPjqkBduWRqqnsO03f7uggVEFQhaYU+vAb0JjSCDT4BrQE6T5NQ8
         nXLTH4VM2HoOGAoEUb6NsXN5qFrypwoAA3TQETSlWB30H0vCtROwMWc2x1SzPJZkbkd6
         QUzndNOmHg8gj5zdwZHbzRY2Ev3Nn93SBq2kpP++2QXJgQR3gkIIOLhRGLxbSjZC/Iej
         VoTc03m6ne95uWUuoWcWGlwF0+VPucx8IltPZbAth9Cm9dPsuxMfnH7y+BqZ9U6+e0Bt
         VKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R/pb0b0doa3XFteGoKySEQfP8Mo6hx3U4+0voSqDAH0=;
        fh=ERRd3eQMqtutMNvd6k5UUQuC36n/rEZHouCSEMtmB1M=;
        b=bOgk5UgWWuaz2BypfqfQQ0n2y3fnCSSOjS6RFqX0WH98o/IZd/k0tNnMo2f9qcMJfH
         878kgh0Yt/TSEFUtZvE7LiDEQi9D/Z+17Wrc4muC4BAZvBkkGwq9Is0eoAOUFirXUnLi
         QgLTEtFlYCxw24o9yJO6q8uX/QxkRssIu0J+4NP/+SAVRnvzgX6s6WPV4QJUyijTHaYF
         BHYbsVXS55fuyAMMJRJn529QfG/v1GRIIu0RNhW8BP5ah/Okn19x+KbHjLKLZjX2LaMv
         ttcmQgIRpuTaFpE4tQ8QLJIIjuZfX7g43NchAsDHM1KAjIl0exsrcOpVNTnZDZIr6yTb
         NKEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782968213; x=1783573013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R/pb0b0doa3XFteGoKySEQfP8Mo6hx3U4+0voSqDAH0=;
        b=IcGYTzxTrVa88w07rOjCJrKkEt6dwztGc2tb3XaZBZn7XKf7BTNtm393I6p09Z3yIB
         k8WidCtzBqdakvnidlb31NxcFCPjW3/9b23xwJV+BtA/ePwzWYRUK2tk8KdYBktyVxfC
         BAmmpHijvWmEtZG9W7I/es50e7bHE9fIPSl2niaGVjajYGQWd8W7OhfiEuPRZBdmgSxG
         nIHIISqNlfw769Y88cCaa33+6WvHhouiMfGbkA5BM518pIcfLqNd1QoHPoKj7rkDPkVA
         Afg19gLsmRU1kqgMeDzJvggUbrxwp1d/8zZHbVIZxlfNYeLwbfwdqhBQ/jowUef6MJtE
         eJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968213; x=1783573013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/pb0b0doa3XFteGoKySEQfP8Mo6hx3U4+0voSqDAH0=;
        b=EDKTtHSjh1BOHVIEdlc7Fsg9EwZEMMJr56YYzudJCf4189Yle2ic/kotyDdbRqNw58
         xwTFcmTzPp1nd6Vr/r/JCFqyTRMHCBn9QwpDaJfshpMGGALgiUJ7Qa4oR0Qtv1YjDiaZ
         iJtW9hp/CBJalfzG7k0OAx2bYp+uXXR1H5Uyx5D7///omGoLvo/sCmVEIob5Owdm87xj
         i2ObNK2x9KP+/Rgj9357gh+7Zuo5ezLXZXB04uNU52EafaonlX707NUIasVFsLSZObnz
         uMKaM4VHjRqDKd10uMj3pj8py+6QoIHP1TH3tvHZx2q+bMAZKdXwoJ9j6uQ1XkELqZNA
         ymkA==
X-Forwarded-Encrypted: i=1; AHgh+RpK78H5MYX2Y40VY9LmABZGY/ngkwH7jPSjC1i8mhzQUWH6bBunXduLPi218R9yCEynLgKHQLeEUSHthQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8B/IDgDdKe08fhrsSMGLQSJixBQ6Vzp2rmla5+MkUdkvAP3qE
	4Sp7RO/XHVEoT48hrckC1aIuKvLunkhvTV0G4bDQYDNpG9KRnJripXjwO3xxyJP7QnwEjZ0BUqL
	MrSwlATmqoMgyXkFvUnmprYV0ef6DoYDZhUMYVU8=
X-Gm-Gg: AfdE7ckMhv+5X27wujUjgGPBiGoB9gqsOs2+BRDRt2bnnhNaKvRrYBqgnpoFuAXXgEw
	piUK7zUGkTueZ2nHE56WJUVgupcQwZN4umEB5MnJdesIp2VG0ZwIyG6YW/JMVJw6de6xSdhHt9Z
	z5uIevz6+3AmmB7XfVhhERSXKtNjuH6HTvL/6o1OwyD1Tc0G7UACuTFPmZyUxiPWt4yADyDH9m/
	CJROgJ/ZTvNfh14Ki45VZrew8z2ZpfYUWRtAUQ2FKZfy7D9KB69Yth9xjik3JQcOr89xQ8sgNqz
	cAdGzT0niEa4HHe2njzjxC404zwqQA==
X-Received: by 2002:a05:6512:2243:b0:5ae:b843:9470 with SMTP id
 2adb3069b0e04-5aecc237a55mr33635e87.5.1782968212825; Wed, 01 Jul 2026
 21:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621222130.1667453-1-xuehaohu@google.com> <20260623015459.1153884-1-xuehaohu@google.com>
 <20260623094446.4a8fc2ed@pumpkin> <ajryxMaT5evDUxaq@google.com>
 <20260623235350.6540eaa2@pumpkin> <20260630124252.GD7525@ziepe.ca>
In-Reply-To: <20260630124252.GD7525@ziepe.ca>
From: David Hu <xuehaohu@google.com>
Date: Thu, 2 Jul 2026 00:56:40 -0400
X-Gm-Features: AVVi8CdtQ5k1Gu0I7l3KP5nC_hRlM4qrUkGZrb3FkW53eA2H-q-z2clu4KZkrHc
Message-ID: <CAPd9Lg9uY1RZvYUtcbKUg=VdWM61M2f3aqmS5veUg_8M_Ce80g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Laight <david.laight.linux@gmail.com>, Pranjal Shrivastava <praan@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	kpberry@google.com, chriscli@google.com, sashiko-bot@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:david.laight.linux@gmail.com,m:praan@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66290-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,linaro.org,amd.com,nvidia.com,kernel.org,intel.com,shazbot.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A70186F37E1

On Tue, Jun 30, 2026 at 8:42=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Jun 23, 2026 at 11:53:50PM +0100, David Laight wrote:
>
> > > If we restrict incoming dmabuf transfers to fit within VFS-centric
> > > limits (2GB), we impose unnecessary overhead on the RDMA stack, forci=
ng
> > > it to manage a significantly higher number of memory registrations. B=
y
> > > cleanly splitting these massive contiguous device buffers into
> > > page-aligned SGL entries, we directly improve the efficiency of P2P
> > > transfers and memory registration.
> >
> > But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think affec=
ts
> > a lot of io) when the quotient is always 1.
> > Splitting into 2G chunks is a lot cheaper.
>
> Doesn't matter this isn't fast path stuff. It is better to use fewer
> SGL entries, IHMO.
>
> > > Since this change doesn't seem to have a negative impact on standard =
file
> > > I/O or break existing VFS constraints, I'm curious why we shouldn't
> > > support splitting these >4GB P2P transfers? Am I missing something?
> >
> > I was only wondering whether it was needed...
> > It does bring up the question of why the >4GB transfers even need split=
ting.
> > But that is another question.
>
> SGL can only store an unsigned int size, so any large physical range
> has to be split down.
>
> rdma now a days has code to process the sgl and restore back the > 4G
> sizes since mode RDMA HW can accept that.
>
> commit 486055f5e09df959ad4e3aa4ee75b5c91ddeec2e
> Author: Michael Margolin <mrgolin@amazon.com>
> Date:   Mon Feb 17 14:16:23 2025 +0000
>
>     RDMA/core: Fix best page size finding when it can cross SG entries
>
> So whatever this produces needs to be compatible with that to undo it.

Thank you everyone. It looks like most open issues are sorted out.
I'll wait for maintainers to weigh in before sending out v3 (which
will remove the type cast for min() per David L.'s feedback, and
revert to ALIGN_DOWN(UINT_MAX, PAGE_SIZE) per Jason's feedback).

Hi Jason,

Thank you for your feedback. I took a closer look at the commit to
ensure compatibility. This patch is perfectly complementary, and
actually prevents a failure in an edge case for the latest
`ib_umem_find_best_pgsz` [1].

Regards,
David

[1] For dma-buf split with `0xFFFFFFFF`, in case of a discontinguity
in later buffers, we will hit this code path in
`ib_umem_find_best_pgsz`

```
if (i !=3D 0)
    mask |=3D va;
```
(*After `va` had been incremented by `0xFFFFFFFF`, due to `va +=3D
sg_dma_len(sg) - pgoff`)
(*Which will set the lowest bit of `mask` to 1)

Because `count_trailing_zeros(mask) returns 0`,
`ib_umem_find_best_pgsz()` will always return 0 in such cases.

