Return-Path: <linux-media+bounces-32494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1FAB6DB0
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 16:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB89B1892D35
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71FB283FC9;
	Wed, 14 May 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6USRxUR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631127C842
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231040; cv=none; b=L6duR1b1D+Ndp2naC5h0MCYf20AoD1cQr58pnJh6tWWEuhsp8O+/21SHKroJNHhORiNDS8gK/+5hEykkEW4/f5TPYvra12KJnIp9hjkf56ZarpfqbuJvr+baXkn9t+UBp3bf2XC5nYIR5057f6EAS4DlzoKGYs64dmOWPXLhz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231040; c=relaxed/simple;
	bh=8A1MIKies3v05GWHexCSoQKXzmcBRK0fANLcnhf7aO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baa3tz4sujeuYsMuidGu+O1HswktHAFH1Wm8+IlH/Qx/9z4Ge1971zyGfh+LZCPhkodFH8sDyUxgK97slYQ1A4sPpJVocjGkv/t5WNX/ItBCHWJoT5xJe4rDG9xJIZ9SnZvxApnfwQY4bnXdCJ/f0YS/S5s+I7mfi68TaXzhlA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6USRxUR; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3da831c17faso12236125ab.3
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231033; x=1747835833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgCmvbU22TlHNQI/j8glSzzRZPdd5Tz37NOzI6EnK/c=;
        b=A6USRxURqmAa0QBPkFdYIm1VADH5p3Pykq1jfv+Lh/ioEhKtLKD8uJk+u0/jMP+ifN
         Zt25u4lsPU5MzH/OIhZZ9nT5rP3fUcH14jnSCfWsyI/xmhbCRF1Uu8tg49fgk8esQO+r
         LhDaMPfzMCLVhSOfWeMAO1qpYdqFvyAMHbh2HIMsQBbg9hmDksTFACXciwpXd1Hj0s1f
         bKhLArzIam8+90torusLT8e+J3XRtMtmMgYonLYJcSFqTXANpv4r7U4GsWvvyeLm+Fuu
         /3djMuGRgLudktfzivdimq1FlyRgxNoLdqVc0zgSktzxebWxWYx6l0yqamO9ZzpDP+IW
         IetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231033; x=1747835833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgCmvbU22TlHNQI/j8glSzzRZPdd5Tz37NOzI6EnK/c=;
        b=fkc+eietFusABEeTIl4UdfcmtIBvf6C8AtX5I9jPSqcVT5D4lv0Td0rvJZFH9OHvgC
         xJawgLnz0S90Y0d/ctZF4rYoT3+U4hyem+E/zvhBd+o3t5RJT/65I1NzubvxS3wXcOKP
         C+Ke+M1wy4EF022BXArxK4Tc0nfJzxb7w6VBpOyAhaL6naFMJI+jZBRjywHM4MSS4LTx
         VqFGeMjBEKP3Qk7Cdao7N3fPWtZBo+1megQ6OYkaJ0nl9N5wmn0b+aAZGioJTff6xkzP
         hMxOx23tjuGsl7ybLlZbV1uNGZIsQ2OlEqDzRiREW7Y7Xacrc+v8s6lRVvUusjQqjYhk
         MTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9fz+fkjBEy8l1UVxl3+IK3gjlzlATVLnTO1NFlH42RGQ0CfLjS5JX4U+K2nKO0IXk6RMgetSOdR+4SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzjM2uxWvfvG4G5+QEQWsylgZ7q2HJYpdESaOSaprzt7HiHr2
	d37Hz3XLjp1zjyM4aDSJeuFmgTI9zaFeofJLTs8beigPd8HZ0EtEevAqmyWN5BMoJqkCQXAR0O+
	KJ+old6a5+QTgnmsUi7Lfk2tOcZE=
X-Gm-Gg: ASbGncsgbMEpR5DNGCSvrBGxzbdw90UZ+boDxuE7L7D+FFUtxDN2wwhcVwPpENnFIzY
	58YILkFeeh3tcnFQ13XZWGPLr0oyebp9S9LBlj72YHMYMvZ68dgMcoiofv2hUsKipoHYaR2U8jq
	q7odmDyvXLoWI1FlcHFFXxCRASfDnltDVi
X-Google-Smtp-Source: AGHT+IE42TmblYaLtD0IQrSrhpiLKxuUdkN+txUzkzbyrrbRU6Tz+L9MbbrnGz7ZIIHPzBwsN83m/OUcsivazuYW8nw=
X-Received: by 2002:a05:6e02:2503:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3db6f7fa09fmr40763325ab.21.1747231032651; Wed, 14 May 2025
 06:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com> <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
 <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
In-Reply-To: <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 06:57:01 -0700
X-Gm-Features: AX0GCFu9_cD6xBE41jTXRzOPv3Dbpx1RYAvoYeJn3S6DUuFSDJFfxf64WuPvA44
Message-ID: <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
Subject: Re: [RFC v2 10/13] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	Gustavo Padovan <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:01=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 13/05/2025 15:16, Rob Clark wrote:
> > On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@i=
galia.com> wrote:
> >>
> >> Dma-fence objects currently suffer from a potential use after free pro=
blem
> >> where fences exported to userspace and other drivers can outlive the
> >> exporting driver, or the associated data structures.
> >>
> >> The discussion on how to address this concluded that adding reference
> >> counting to all the involved objects is not desirable, since it would =
need
> >> to be very wide reaching and could cause unloadable drivers if another
> >> entity would be holding onto a signaled fence reference potentially
> >> indefinitely.
> >>
> >> This patch enables the safe access by introducing and documenting a
> >> contract between fence exporters and users. It documents a set of
> >> contraints and adds helpers which a) drivers with potential to suffer =
from
> >> the use after free must use and b) users of the dma-fence API must use=
 as
> >> well.
> >>
> >> Premise of the design has multiple sides:
> >>
> >> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> >> signalling a fence and freeing the driver private data associated with=
 it.
> >>
> >> The grace period does not have to follow the signalling immediately bu=
t
> >> HAS to happen before data is freed.
> >>
> >> 2. Users of the dma-fence API marked with such requirement MUST contai=
n
> >> the complete access to the data within a single code block guarded by =
the
> >> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> >>
> >> The combination of the two ensures that whoever sees the
> >> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> >> valid fence->lock and valid data potentially accessed by the fence->op=
s
> >> virtual functions, until the call to dma_fence_access_end().
> >>
> >> 3. Module unload (fence->ops) disappearing is for now explicitly not
> >> handled. That would required a more complex protection, possibly needi=
ng
> >> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout()=
,
> >> where race between dma_fence_enable_sw_signaling, signalling, and
> >> dereference of fence->ops->wait() would need a sleeping SRCU context.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> ---
> >>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++=
++
> >>   include/linux/dma-fence.h   | 32 ++++++++++++-----
> >>   2 files changed, 93 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> >> index dc2456f68685..cfe1d7b79c22 100644
> >> --- a/drivers/dma-buf/dma-fence.c
> >> +++ b/drivers/dma-buf/dma-fence.c
> >> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
> >>          struct dma_fence *fence =3D
> >>                  container_of(kref, struct dma_fence, refcount);
> >>
> >> +       dma_fence_access_begin();
> >>          trace_dma_fence_destroy(fence);
> >>
> >>          if (WARN(!list_empty(&fence->cb_list) &&
> >> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
> >>                  fence->ops->release(fence);
> >>          else
> >>                  dma_fence_free(fence);
> >> +
> >> +       dma_fence_access_end();
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_release);
> >>
> >> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
> >>    */
> >>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *se=
q)
> >>   {
> >> +       dma_fence_access_begin();
> >>          seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> >>                     dma_fence_driver_name(fence),
> >>                     dma_fence_timeline_name(fence),
> >>                     fence->seqno,
> >>                     dma_fence_is_signaled(fence) ? "" : "un");
> >> +       dma_fence_access_end();
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_describe);
> >>
> >> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const=
 struct dma_fence_ops *ops,
> >>          __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_init64);
> >> +
> >> +/**
> >> + * dma_fence_driver_name - Access the driver name
> >> + * @fence: the fence to query
> >> + *
> >> + * Returns a driver name backing the dma-fence implementation.
> >> + *
> >> + * IMPORTANT CONSIDERATION:
> >> + * Dma-fence contract stipulates that access to driver provided data =
(data not
> >> + * directly embedded into the object itself), such as the &dma_fence.=
lock and
> >> + * memory potentially accessed by the &dma_fence.ops functions, is fo=
rbidden
> >> + * after the fence has been signalled. Drivers are allowed to free th=
at data,
> >> + * and some do.
> >> + *
> >> + * To allow safe access drivers are mandated to guarantee a RCU grace=
 period
> >> + * between signalling the fence and freeing said data.
> >> + *
> >> + * As such access to the driver name is only valid inside a RCU locke=
d section.
> >> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE blo=
ck guarded
> >> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >> + */
> >> +const char *dma_fence_driver_name(struct dma_fence *fence)
> >> +{
> >> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >> +                        "rcu_read_lock() required for safe access to =
returned string");
> >> +
> >> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >> +               return fence->ops->get_driver_name(fence);
> >> +       else
> >> +               return "detached-driver";
> >> +}
> >> +EXPORT_SYMBOL(dma_fence_driver_name);
> >> +
> >> +/**
> >> + * dma_fence_timeline_name - Access the timeline name
> >> + * @fence: the fence to query
> >> + *
> >> + * Returns a timeline name provided by the dma-fence implementation.
> >> + *
> >> + * IMPORTANT CONSIDERATION:
> >> + * Dma-fence contract stipulates that access to driver provided data =
(data not
> >> + * directly embedded into the object itself), such as the &dma_fence.=
lock and
> >> + * memory potentially accessed by the &dma_fence.ops functions, is fo=
rbidden
> >> + * after the fence has been signalled. Drivers are allowed to free th=
at data,
> >> + * and some do.
> >> + *
> >> + * To allow safe access drivers are mandated to guarantee a RCU grace=
 period
> >> + * between signalling the fence and freeing said data.
> >> + *
> >> + * As such access to the driver name is only valid inside a RCU locke=
d section.
> >> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE blo=
ck guarded
> >> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >> + */
> >> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> >> +{
> >> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >> +                        "rcu_read_lock() required for safe access to =
returned string");
> >> +
> >> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >> +               return fence->ops->get_driver_name(fence);
> >> +       else
> >> +               return "signaled-timeline";
> >
> > This means that trace_dma_fence_signaled() will get the wrong
> > timeline/driver name, which probably screws up perfetto and maybe
> > other tools.
>
> Do you think context and seqno are not enough for those tools and they
> actually rely on the names? It would sound weird if they decided to
> index anything on the names which are non-standardised between drivers,
> but I guess anything is possible.

At some point perfetto uses the timeline name to put up a named fence
timeline, I'm not sure if it is using the name or context # for
subsequent fence events (namely, signalled).  I'd have to check the
code and get back to you.

There is also gpuvis, which I guess does something similar, but
haven't looked into it.  Idk if there are others.

> > Maybe it would work well enough just to move the
> > trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> > if some things will start getting confused if they see that trace
> > multiple times.
>
> Another alternative is to make this tracepoint access the names
> directly. It is under the lock so guaranteed not to get freed with
> drivers which will be made compliant with the documented rules.

I guess it would have been better if, other than dma_fence_init
tracepoint, later tracepoints didn't include the driver/timeline
name.. that would have forced the use of the context.  But I guess too
late for that.  Perhaps the least bad thing to do is use the locking?

BR,
-R

