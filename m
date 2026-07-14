Return-Path: <linux-media+bounces-67574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kliOBXNKVmrE2wAAu9opvQ
	(envelope-from <linux-media+bounces-67574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:40:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454A755F7C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b7paIVOD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67574-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67574-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D5563074B6C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D15947D935;
	Tue, 14 Jul 2026 14:33:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18C44BC9A
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:33:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039605; cv=none; b=CdLSqqD+5+Z+ET8zoO1oz69N0cfZr8q+1Z+19pmtsjylW8pyESFp9HthavgJdCG0ieaXgeR5B1WA+tQ5ZKwU7ibRGQrfEl04L2HXoEAoF0GsCCUbF+eav0bdOQLQtVyJ8586ZCoMka3zijnxst2/1mDvpg5X5iSCKwMCtEKzkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039605; c=relaxed/simple;
	bh=t3+FgGxIANUdTs4dodfcPA0vqCjpmZzzbODy8MT0F5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrSyeUqueIPjbITDMuXPYWeAyJkYRkpaLyuySIKsCz37qAt6/AM8LH2LXIxIZ7Q8T9hp+KjsWi8IrTDa6LeO5ZMuz5prJPqDQGgocXk4d1vMOFtP0tAwKjMDCVlfUYAxPaVe1qcJgPEImtrj+EJ5Sjj57tRj9xSd6df22qpLWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7paIVOD; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so17932885e9.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784039602; x=1784644402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqr76+rJ8iwHayK7NjLGqhPMmOMQyjm2NesJQTgS2Xo=;
        b=b7paIVODVxIpb40kzN5mRJBFqqVsZcioNrHpT1aNmYqxF8tVuz2kyfOREywwF1RHFQ
         7tEi//lXOT01O3qB0l/BU6dC55LcgsIScWk3TXPB8FxDnCVGCZxlu+Gbl0wBvweX/LIj
         zChGMtezvGI1H+DeGyD+toHJ1qteKG0Wq4EAiMZ8aXlTITdgcC5hpg7/a2ZwA4KiGRDu
         Cts/RJ1FcUJo0FybUBGRuiT/DGIbIVL/rgRiD7dnDig+Dc216f9HNuaUcWjxiwsbHXel
         UZcsedff2r/R2Sci3a2Be8y2Bul9M57oqQclxArFE54HcbUddHPFJ6KPkoVBlWAQm6JM
         6emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039602; x=1784644402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqr76+rJ8iwHayK7NjLGqhPMmOMQyjm2NesJQTgS2Xo=;
        b=PkrvO74UaTgUBuFpgff8sEMOxbh4MRX6UdLtm76CrNtKYSOSty6zsYINDC/KAsTrYZ
         PFXZfZuN6zMXPt+QJ6LbzWN8zPGjS01dY+VSZnLaEs42kMIIATi1WSRQQ5ZEZ1bPlnG+
         IjRFLasnzeVCGuQSOdv7vBNM02TXRuneNCb8ts6B5Qg63GIiSKh4S1APYZXhSDTaTS6h
         Bubia13ZDwefFOYqwYfiXrb32pYJelDzvmn3gvTgIieq51Q72cYM8VJ5lLAtiLdyEBjK
         X/MfyenpzySZVUFiBkaqa1cH+2xdOvCs2ocwqaxZz8/jdSBfcMmAm9HI3Gt8ICdfmkg7
         12lw==
X-Forwarded-Encrypted: i=1; AHgh+RpC+OE8b5Y/GVoCnOAGStPpRsVOkloTCWHpGELM4q1kw8kURRCxZADvb4a3zfpUjy7MCozw9WqwGTJByA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/z277n7My2kLiyhkH/fWdfRczGh7aSkX9Cy+hS25HKMS6LUo
	zkAnm4kL01OIlSCF/eB/NMy2zQpjjep2Ukvmx4e1KpKRdjEnVzSfcc6u
X-Gm-Gg: AfdE7cmRg4GqTz9bSguAeC53nS/yPpVpZelBCoYT5O+jC/5C2EInwF+NvnQ0iHOaCPy
	lBG1X4VcW16NQBSpY6iIi39WV9p/7VYBgiEk5x6K5i2s6M0Vwz34vXMCZybAhxDBIjGON80/rYh
	irWTRL1Zt89za4Ce3tHPxjTkQ+0Cp9v/kqYYYYZH2OaIhw4jnD6cwz/mclEqoyVjnTQjMFNQywM
	z95aoDVMQGTRHQfU/8w5p6nYyQaOIPUCPzDEjedA+O5tpd41GDOhEnhZb8W5wDkxrJ9MpwNc37e
	H9I/oIFbCwI1kKFVF9rfwHjl54KvrZk2MzV7fnYIUMTUIeeSiyRTIjQBtEr6ECMSZNA2uZmKcrx
	ZSBL1E1UdIBavZV3XRmKuGcpcEZ7CHhADu4Y2OLZFlolCtKtu61JSJjuRxsIn49B6dXz37CebCk
	0Y010tEoybw2OWno8MIB8JlTaQQN/grPNN3esTnftQ9EiEnEo3dA==
X-Received: by 2002:a05:600c:3e1b:b0:493:e890:9e0b with SMTP id 5b1f17b1804b1-493f883157bmr144382565e9.26.1784039601550;
        Tue, 14 Jul 2026 07:33:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e0f165sm270374515e9.0.2026.07.14.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:33:20 -0700 (PDT)
Date: Tue, 14 Jul 2026 15:33:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?5a+/5p+P6IO9?= <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "T . J . Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, Sandeep Patil
 <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla
 <srini@kernel.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
Message-ID: <20260714153319.07b2b1e1@pumpkin>
In-Reply-To: <CAGCp47zPkd6MWcMpxobphJp6giufpnJL46iFQMt9p76gb7OtKA@mail.gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
	<20260714114654.3885457-1-shoubaineng@gmail.com>
	<20260714114654.3885457-2-shoubaineng@gmail.com>
	<20260714141359.7758575d@pumpkin>
	<CAGCp47zPkd6MWcMpxobphJp6giufpnJL46iFQMt9p76gb7OtKA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67574-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9454A755F7C

On Tue, 14 Jul 2026 21:38:07 +0800
=E5=AF=BF=E6=9F=8F=E8=83=BD <shoubaineng@gmail.com> wrote:

> Hi David,
>=20
> Thanks for the feedback.
>=20
> The concern is not just about the EFAULT return =E2=80=94 it's about the =
race
> window between fd_install() and copy_to_user().  Once fd_install()
> returns, the fd is immediately observable by other threads in the same
> process (via /proc/self/fd, SCM_RIGHTS, etc.), even before
> copy_to_user() has a chance to fail.  The triggering condition is a
> deliberate mprotect() flip, not a corrupted heap.

That is what makes doing the close wrong.
But that is a program aggressively trying to hit the timing window,
not a normal program that has managed to pass an invalid pointer.
The most likely reason for a real program passing an invalid pointer
is a corrupted heap (assuming the stupid coding errors are fixed).

It is really no different from the sockopt code that receives
SCM_RIGHTS messages.
In that case once you've removed the FILE from the socket (or similar)
you really don't want to have to put it back because the write to the
sockopt buffer or length field fails.
The chance of correctly reverting the kernel state is small - and won't
be tested.

	David

>=20
> The fix itself is small and follows the standard kernel idiom:
> get_unused_fd_flags() reserves the fd without publishing it, so the
> window between reservation and install is entirely under kernel control.
>=20
> Baineng
>=20
> David Laight <david.laight.linux@gmail.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=
=8814=E6=97=A5=E5=91=A8=E4=BA=8C 21:14=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > On Tue, 14 Jul 2026 19:46:53 +0800
> > Baineng Shou <shoubaineng@gmail.com> wrote:
> > =20
> > > DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
> > > caller's fd table via dma_buf_fd() -> fd_install() before
> > > dma_heap_ioctl() copies the result back to userspace.  If the trailing
> > > copy_to_user() fails, userspace never learns the fd number, but the
> > > fd (and the underlying dma-buf reference) are already visible to
> > > other threads in the same process and are leaked for the lifetime of
> > > the process.
> > >
> > > The obvious "close it on the failure path" fix is unsafe: once
> > > fd_install() has run, another thread can already dup() the fd, send
> > > it via SCM_RIGHTS, or close() it and let its number be reused, so a
> > > subsequent close_fd() from the ioctl path can operate on an unrelated
> > > file.  This was pointed out by Christian K=C3=B6nig on v1 [1]. =20
> > ...
> >
> > My 2c:
> >
> > The other option is just to leave it as a 'problem for user space'.
> > No reasonable program is going to handle the EFAULT return by doing
> > anything other than exiting.
> > Even getting an EFAULT is really an indication that the application
> > is already in a real mess - most likely with a badly corrupted heap.
> >
> > Anything else leaves error recovery code in the kernel that is pretty
> > much never executed and open to a variety of bugs.
> > While the recovery here is probably ok, there are some sockopt calls
> > where it is all more complicated.
> >
> >         David
> > =20


