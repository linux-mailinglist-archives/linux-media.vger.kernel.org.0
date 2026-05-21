Return-Path: <linux-media+bounces-62497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKbiFOYKD2omEgYAu9opvQ
	(envelope-from <linux-media+bounces-62497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:38:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE85A60AE
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5DE331609B6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EA33D7D66;
	Thu, 21 May 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxrI1RPw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="diUyF/eV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D2226863
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368494; cv=pass; b=LPex6ZhFxIJy3T4nR0UqIhqAYmps6iMY8cXbBbAAU+AgG4QjKMcv9edQpu7hAWPge68BI3zQqDhVXj8tAqMC3aHPo9eGZw+SAid7U9GjTkeclM1o1knjbHjVNAhcZVdHobeMSJ7iWg1RcplaoKEZseG1VGJPzj1aUPo9yl9Mg1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368494; c=relaxed/simple;
	bh=s/LhWOJ82A/Il7Fwfsi+/4LPTb+4kNKDQTmAaQ9VC64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X19Gm9u7qTYVibEono2EgXU1iuURtRpKJyNbNidUaPTJ8Yxwa24M5UelvqbfDNuHXB7/YST6uShRJy9edoiTXRem/XReX2J2Hxs1u6azis8YwDm6veCJ68EFBhFHgrrpbnEpk2BLA+9g/3CaYgh27rW8qTDQ+ptjpmKH38JY4WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxrI1RPw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=diUyF/eV; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779368491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
	b=OxrI1RPwhVeaoFNNn9BmIFIvKgUPnSaJ2diRLZJItmw1EkyR60Ud4dz4qUFUA6tNxkpXrv
	vLHM47e6KQFujMSpBqp/2EdlexxUmM+d5H7U1EvqMrrKWwoLnqBvAV2yHX6cjWuTWv5EW+
	1qvoc9AlYE+j+M4s1vT7t1IBuJ7bsxQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-dp8P9JtxNyeUwblhMC506A-1; Thu, 21 May 2026 09:01:29 -0400
X-MC-Unique: dp8P9JtxNyeUwblhMC506A-1
X-Mimecast-MFC-AGG-ID: dp8P9JtxNyeUwblhMC506A_1779368489
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7c9e610f273so79417977b3.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 06:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368489; cv=none;
        d=google.com; s=arc-20240605;
        b=BIuFHwqc8IAF5nGwVorEjTYhr0P5OHhjr3xt5nvU7M/Tpr+giHTr7DUc1hG+VS9FAr
         +DlKvyhQvZwW5y3O5b/orT/A+4xzuxUcT0QaMnC1Z3clpPGCVO1lCxr+otuBNNbcYorh
         sCz3n1ZCfgbxiv6Oxp0CzvS8fAoVWJ1NHSGknmX883IdYquc5Uom2/vTnN5EphTkUbJR
         p/ZpDQw7k9BrjgJqLomEvum8rIsunx9fd/9wkeihnuSryBU391V/w85xOt8xkbTfxzCE
         D3nb4CzR45BHeUPdoUEukPbqE1NvsanXr1ExA/Wtnps23Vuq6VELMUi1/nJolL5QH6Ls
         Pnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        fh=VHwbaDsAzDBbTVwwG2WwufoBrAoLQjkbgR68Tvd67m4=;
        b=iYvLO4z9/LBIryjzVKLZcpcjSxuuaGIUJ88vDbDHDTOF/26ofQctAs0MGqYHSrSSUD
         RN4RwXhciXSUrOuqKQ4G1Fgup+g1g4Z2sn31kwCuxqC9CwKBvFXFaC/ZNaaymeKncggv
         vcksrDPlYy9I+/Bma/MCJy1hxgjouPHFjn3q7Rtc1TH8wt65bOVOUaqfoPnvE+y+GjuM
         93NLuUEY/+yq8sQ5Bwgio+NcZhOzpCsXhJKHbWnYi8CsgLObaE8CsWaQ6pDo3GRy5aKu
         D+TLDF2ygcAZ2A2Wkvvuhux9fnivgYw5q8BCXpREb4t+qBWdzkJvnJoEqpKBPZo98nWI
         vZfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779368489; x=1779973289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        b=diUyF/eVXhQW3OMlnjN+OHIw0yGM/7C1Nd0c4UA3QPRGdHerd/v34IJFv/ISPyfwK2
         cTH1tQJKe+vtoTC3IzM08D3zvbNWRManXxwjq7J3gyM2DuoFdzIFBXRt4qyV1veBPauV
         nTSEGqxDBL6SoUetZoxkcTSIaWUz9xY+a3ZXa/cVCu+8EDdk5qRc35R9lyW1jxpNCGvX
         Afj21cu7PrMuEClG3wY8NVmsyFFf9hX2XoN4/E5sFHjxWNhqEICPWxqsm8qvDy9UQL0B
         VqPODck5FEJ4q6vd5hgG9RjAKlMts9UI3ycjWhxmL6Ih6SbtvKs+9+tWSKCRZmqI6iGH
         eonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368489; x=1779973289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmwC58HJBimxH19t4ZPSn9X111oVOA5kpRJyuTfhJLQ=;
        b=oR8pK4j0iq7NdSSXJyYbKBt7SmWwCLufGgcGjdFZB3F5tGXKPwlos+bhTCrhItlI1s
         NwKiwxXydPjfg5hMeMkiaCHLFwdr2JuRMvJ8k3cQHGREDzaN47ajYPcUTj+I8zjIADee
         35GWsxLXEJTQD2kpQUa82e2Hmki1MvwmWzj5dXYbvjRFeEcOMWfBW872d6Xzqsahz2od
         ZNx8+HrdO0/CeRpxLfUtGDjc/xQvJaZoY/fZGl0NeI0AtBsSzP+wTRhEOhl503ZYdI7w
         mcFnif2TvELV+tYc3kLPDUFVHg8Vs2I+zMu/0I1d2UPwugyQyGn0u/IlCQbYjUl/dE7q
         vpoA==
X-Forwarded-Encrypted: i=1; AFNElJ/GWH5p0ShAtWfwOLKHqGtYENSfnpQXNGkzyIckF+Dr2uMuJlfXZ+EcHtys2krMRocL+pM/6YCEiMD5wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwuZMuTIAvKJIH0xjBkbF6LWTvGOGV+I7qo6RckyhOkNz5KCS
	KBRMsT9bHaHnBAL4FKFxbFDG0eD9dYOyYDmjioEQAbNy3+FTVzOwrOZ2lgd1FGQhlWkpxt3JsK1
	S2NVvXqEa5MtNYexh8jNaVhC/AnCdvXmpwJ7EeLUtun06+eSlvP/XtglSUSvrJciaTpYCTjvce6
	NggOoCNSOZdf1JDhU/LNSZU43CoSTbn/jeSgwh+24=
X-Gm-Gg: Acq92OHM40zcEaDzNlAoMzzymhFKACfjVT3n/OcZH2ycJUiVnpA1IL+oa1z2swR1Qq5
	85BV3k1lLviyZRYygEESPuX6YUXYQlhzUYH1kCOb7JRY29hzLZQzr/1qgFHjXf1nc36wWaXHv1+
	0V/62KwrytGWw/G9lUBO7j/pl2lkqzs9858Gp5wWuH9vJ3mCR8o5k1eqH++8WlAzq8I+k4ExWug
	+FlVQ==
X-Received: by 2002:a05:690c:2701:b0:798:5213:d90e with SMTP id 00721157ae682-7d21458c414mr20821377b3.25.1779368487410;
        Thu, 21 May 2026 06:01:27 -0700 (PDT)
X-Received: by 2002:a05:690c:2701:b0:798:5213:d90e with SMTP id
 00721157ae682-7d21458c414mr20820547b3.25.1779368486638; Thu, 21 May 2026
 06:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com> <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
In-Reply-To: <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 21 May 2026 15:01:15 +0200
X-Gm-Features: AVHnY4LBiwiMio4g-NMYwHAheob8lHj03QTb2KFQDfp0pjJRm1wTbuvqILl5JEg
Message-ID: <CADSE00J1+V4=qFZPOL8Cr8hYw6d=hf_XcDPezjYGkcxAwLYGyw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
 reduced-permission aliases
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62497-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BDBE85A60AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

On Thu, May 21, 2026 at 2:28=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/21/26 11:10, Albert Esteve wrote:
> > When sharing a dma-buf between components of different trust levels, th=
e
> > allocator may need to hand a consumer a read-only view of a buffer it
> > holds with read-write access. An example is a camera pipeline where the
> > capture component writes frames into a buffer and needs to pass a
> > read-only handle to a downstream processing component that should not b=
e
> > able to modify the data.
> >
> > However, no such mechanism exists today. The access mode of a dma-buf
> > file descriptor is fixed at export time, and the standard POSIX
> > interfaces for duplicating or changing file descriptors (i.e., dup(2),
> > dup3(2), and fcntl(F_SETFL)) cannot alter the read/write access mode of
> > the copy.
> >
> > One natural candidate would be reopening via /proc/self/fd/<N> with
> > O_RDONLY, which works for regular files. For dma-buf this would fail
> > (that is, if we were to add a new handler for open f_op) with ENXIO
> > because the dmabuf pseudo-filesystem carries SB_NOUSER, which prevents
> > the VFS from opening its files through path-based resolution from
> > userspace.
>
> OH MY GOD! This is the like the sixth time I had to clarify that in the l=
ast few weeks, I'm really wondering where that is suddenly coming from.

Sorry! I do not know where others came from. But my interest comes
from automotive, safety, and mixed criticality scenarios. I kind of
hinted at that in the opening when referring to "different trust
levels".

>
> Creating the DMA-buf with O_RDONLY does *NOT* make the DMA-buf itself rea=
d only!
>
> That's a really common misconception. The flag only controls if mmap() ca=
n be done read/write or read-only to handle cache coherency issues.
>
> It is still perfectly possible for a device to write into a DMA-buf creat=
ed with O_RDONLY with DMA!
>
> So long story short there is not such feature as a read only DMA-buf, and=
 putting read-only pages into a DMA-buf and then expecting that nobody can =
write to them is an absolutely clear No-Go.
>
> If we would want to implement a read-only DMA-buf feature we would need t=
o go over all the different DMA-buf importers in the kernel and add securit=
y checks.

This clarifies a lot. Too bad, but it makes sense. I will abandon the
series then.

Thanks for the review and the explanation!

BR,
Albert

>
> Regards,
> Christian.
>
>
> >
> > Alternatively, exporting the buffer twice would produce two independent
> > dma_buf instances, which breaks fence synchronization.
> >
> > Therefore we add a new DMA_BUF_IOCTL_DERIVE ioctl, which produces a new
> > file descriptor for an existing dma-buf with a caller-specified subset
> > of the original permissions:
> >
> > ```
> >   struct dma_buf_derive { __u32 flags; __s32 fd; };
> >
> >   struct dma_buf_derive req =3D { .flags =3D O_RDONLY | O_CLOEXEC };
> >   ioctl(rw_fd, DMA_BUF_IOCTL_DERIVE, &req);
> >   /* req.fd is now a read-only alias of the same buffer */
> > ```
> >
> > Permission escalation is rejected with -EACCES. The new fd aliases the
> > same struct dma_buf as the original, same dma_resv, same exporter ops,
> > same underlying memory; so importers attaching to either fd see the sam=
e
> > fence timeline and operate on the same object. Access control for which
> > components may receive or pass on restricted descriptors can be layered=
 on
> > top via SELinux file:read and file:write permissions.
> >
> > A shared writable mapping (PROT_WRITE | MAP_SHARED) on the read-only fd=
 is
> > rejected with -EACCES in dma_buf_mmap_internal().
> >
> > Two small internal adjustments accompany the ioctl:
> > - __dma_buf_list_del() is moved to dma_buf_release() so it fires exactl=
y
> >   once on dentry destruction rather than on every file close.
> > - dma_buf_file_release() is updated to call dma_buf_put() only for
> >   files that are not the primary dma-buf file.
> >
> > This may not be the best approach, but after considering different
> > options and alternatives (as described above), we decided to raise the
> > discussion upstream. Thus, we welcome any alternative proposal or ideas=
.
> >
> > The series is structured as:
> > - Patch 1 adds the new ioctl implementation.
> > - Patch 2 adds selftests covering the new ioctl.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> > Albert Esteve (2):
> >       dma-buf: add DMA_BUF_IOCTL_DERIVE for reduced-permission aliases
> >       selftests: dma-buf: add DERIVE ioctl tests
> >
> >  drivers/dma-buf/dma-buf.c                          |  58 ++++++++++-
> >  include/uapi/linux/dma-buf.h                       |  28 +++++
> >  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 +++++++++++++=
+++++++-
> >  3 files changed, 198 insertions(+), 2 deletions(-)
> > ---
> > base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
> > change-id: 20260520-dmabuf-limit-access-73261353841a
> >
> > Best regards,
>


