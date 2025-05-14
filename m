Return-Path: <linux-media+bounces-32500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33841AB7004
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAA617721C
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768CC2040B0;
	Wed, 14 May 2025 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7vG4182"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B8191F6C
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237099; cv=none; b=R7oxmbKGsEY4CzTjn9V3wlBA50T6zPubMz9HNwpv8p2SSJ+DziPCohOLUC26PiDQI+TD2jCWJDnq24JSW/yIcWZwoc0AkoZKF1NtJsCHXfpIoxtQhg3yZlwTfH98ab8/Bn0L0hFesIs1z9co1txL7yqNPEibWSpuRZkBXp0K9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237099; c=relaxed/simple;
	bh=Yqv6j/DTwHzT6e1vqmA3Wj/Jj19GTKOtAtt1p+yaoJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZoKDl8NLEasI7en0HGlcnXCJsr/vxHyR9L8vTe/Vpqe5gQrsz+L9q55xq8vdWklKNvB8O4VIygSehR4whwR/nIadfIPt2H+JsZFXrY34mqvSF4pvWsDzeRJWx/H9YfHYN3pMF09WYQvrE8TUc9aw7IgBBX4ayq6pQnkp5x+yEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7vG4182; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso26482915ab.1
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747237097; x=1747841897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LoXk61oIPBafF9IIlAcC3BA14YR2/yu0PVLlM3XziM=;
        b=b7vG4182CTkKJ5JSIHaYiZGEmLa4fp+T3VxoPQgBgP6Sd1ekk48j3ZajJsu8lUqiDv
         SBdpJUcNL9GLrhL8vVWqmi3pJgfrd/n50YuH32neRQz8X5KbqlAHFil1OKJILdQ9JTVZ
         1Q5Mvbhnu2n8zwW96ykzjQBgKu0MD9YT+1s9AIg2qsxwvX1ypM8neIICD1nIcnFzNkR0
         FYkAlHweMDWl2Q80BANbRpFaXYdTjx0sW/RSRcGycWOMG8sitrFLz4l2KA0atSLwMG0S
         976B8JYNn7Lf2/obMrcQKy/A2YVO/I0q/6g7kPfy/QXFccNUeYR3Bj28UqvvI4kBgoQk
         ZPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747237097; x=1747841897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LoXk61oIPBafF9IIlAcC3BA14YR2/yu0PVLlM3XziM=;
        b=MORAt7iB4jPd0Jp9WXNDyHTUhcuagv/ZeeFwbuAgQAAJ/GXhfk39fJ5o9pMovvaCr/
         rd+1yZJE2aSK0O14BXhAOqTnOrr1XO7/8zpdBRo4q01HQ+04tzkZ+qCKCDSfZTGu5TI2
         JgidV+nN8fn0AaFT2oFM70Fik0N7pGr5BZMmgYvc+9CnBeHJuG6v8W0Sxqg7gUzlDN34
         eRf/AG9KZopaYZjOoy4/YMLjyoCamciLGoc61i03xoP/OXvE+rgF9MsJCNNa3F8RJhr0
         bA5rnEF+fl0XhOSbIQ/lS797YkFgKcutAMjlBdczWP/mn8q+J5qbiodXuMg/enVHGb5w
         iKRg==
X-Forwarded-Encrypted: i=1; AJvYcCXfTXjbSFX7lINaRwYSUZKxVbVpL+29to+Ki7KQWuMsH7i2/FU1W2c9H7dMY1t4ampN9YK1QkzJuNOr3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxtC9cxN0Av3A1decOiHhdYsllq9/+EkNfniHy8yq8NTis8IU7
	2MyZM/HXN3LvSm99DAa6pL4O7Err26G4tbO/S3x46Pi3N1G0u8jWcalxuSeGL1QLau0+YZ93YJP
	j3QEwVlr8QtQo1zmb6zdENhMWLZ0=
X-Gm-Gg: ASbGncvXkQIQzRW9Q9JbtBEJvULMtdPeWdxvjSaCXjlCm2s1xOaNBN6rQQZej4CNtlv
	BYDoqle+CPJa0CS8IQ1oqzeVzn6uw+XyNZJoHsqJk+xOBHlutPSv9tSA0FxBniJ274zCCwv7FdI
	TUQy3TApCv+ri5zloDHnOPDw7A7nvbaekztj415do8Spx6/XsEJQUJi+4F2kOcjA==
X-Google-Smtp-Source: AGHT+IEsKXRO4rCv7VVmECVH6gnJsI6ggcy/26/VlehMp48QAKyy00D5SvWKHExtpRWv4vkYvb6OQnmMaz28ZHbU0CA=
X-Received: by 2002:a05:6e02:1605:b0:3d9:6cd9:5074 with SMTP id
 e9e14a558f8ab-3db6f7f19cfmr41036615ab.16.1747237096796; Wed, 14 May 2025
 08:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com> <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
 <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com> <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
 <3cdf8bf9-1807-496e-baf4-8c069df3fdc1@igalia.com>
In-Reply-To: <3cdf8bf9-1807-496e-baf4-8c069df3fdc1@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 08:38:04 -0700
X-Gm-Features: AX0GCFt70bRGIXZRzMncV2__PoGPpZ3VBD_5macze4QWiN-31Y70AxZWgBtjrvk
Message-ID: <CAF6AEGumRDD0n+S4U1pmjXbpttzw1K4fJhpHuAzF-bB9wRCtDw@mail.gmail.com>
Subject: Re: [RFC v2 10/13] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	Gustavo Padovan <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 7:58=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 14/05/2025 14:57, Rob Clark wrote:
> > On Wed, May 14, 2025 at 3:01=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@igalia.com> wrote:
> >>
> >>
> >> On 13/05/2025 15:16, Rob Clark wrote:
> >>> On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin=
@igalia.com> wrote:
> >>>>
> >>>> Dma-fence objects currently suffer from a potential use after free p=
roblem
> >>>> where fences exported to userspace and other drivers can outlive the
> >>>> exporting driver, or the associated data structures.
> >>>>
> >>>> The discussion on how to address this concluded that adding referenc=
e
> >>>> counting to all the involved objects is not desirable, since it woul=
d need
> >>>> to be very wide reaching and could cause unloadable drivers if anoth=
er
> >>>> entity would be holding onto a signaled fence reference potentially
> >>>> indefinitely.
> >>>>
> >>>> This patch enables the safe access by introducing and documenting a
> >>>> contract between fence exporters and users. It documents a set of
> >>>> contraints and adds helpers which a) drivers with potential to suffe=
r from
> >>>> the use after free must use and b) users of the dma-fence API must u=
se as
> >>>> well.
> >>>>
> >>>> Premise of the design has multiple sides:
> >>>>
> >>>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> >>>> signalling a fence and freeing the driver private data associated wi=
th it.
> >>>>
> >>>> The grace period does not have to follow the signalling immediately =
but
> >>>> HAS to happen before data is freed.
> >>>>
> >>>> 2. Users of the dma-fence API marked with such requirement MUST cont=
ain
> >>>> the complete access to the data within a single code block guarded b=
y the
> >>>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> >>>>
> >>>> The combination of the two ensures that whoever sees the
> >>>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to =
a
> >>>> valid fence->lock and valid data potentially accessed by the fence->=
ops
> >>>> virtual functions, until the call to dma_fence_access_end().
> >>>>
> >>>> 3. Module unload (fence->ops) disappearing is for now explicitly not
> >>>> handled. That would required a more complex protection, possibly nee=
ding
> >>>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout=
(),
> >>>> where race between dma_fence_enable_sw_signaling, signalling, and
> >>>> dereference of fence->ops->wait() would need a sleeping SRCU context=
.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>> ---
> >>>>    drivers/dma-buf/dma-fence.c | 69 ++++++++++++++++++++++++++++++++=
+++++
> >>>>    include/linux/dma-fence.h   | 32 ++++++++++++-----
> >>>>    2 files changed, 93 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence=
.c
> >>>> index dc2456f68685..cfe1d7b79c22 100644
> >>>> --- a/drivers/dma-buf/dma-fence.c
> >>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
> >>>>           struct dma_fence *fence =3D
> >>>>                   container_of(kref, struct dma_fence, refcount);
> >>>>
> >>>> +       dma_fence_access_begin();
> >>>>           trace_dma_fence_destroy(fence);
> >>>>
> >>>>           if (WARN(!list_empty(&fence->cb_list) &&
> >>>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
> >>>>                   fence->ops->release(fence);
> >>>>           else
> >>>>                   dma_fence_free(fence);
> >>>> +
> >>>> +       dma_fence_access_end();
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_release);
> >>>>
> >>>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
> >>>>     */
> >>>>    void dma_fence_describe(struct dma_fence *fence, struct seq_file =
*seq)
> >>>>    {
> >>>> +       dma_fence_access_begin();
> >>>>           seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> >>>>                      dma_fence_driver_name(fence),
> >>>>                      dma_fence_timeline_name(fence),
> >>>>                      fence->seqno,
> >>>>                      dma_fence_is_signaled(fence) ? "" : "un");
> >>>> +       dma_fence_access_end();
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_describe);
> >>>>
> >>>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, con=
st struct dma_fence_ops *ops,
> >>>>           __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_init64);
> >>>> +
> >>>> +/**
> >>>> + * dma_fence_driver_name - Access the driver name
> >>>> + * @fence: the fence to query
> >>>> + *
> >>>> + * Returns a driver name backing the dma-fence implementation.
> >>>> + *
> >>>> + * IMPORTANT CONSIDERATION:
> >>>> + * Dma-fence contract stipulates that access to driver provided dat=
a (data not
> >>>> + * directly embedded into the object itself), such as the &dma_fenc=
e.lock and
> >>>> + * memory potentially accessed by the &dma_fence.ops functions, is =
forbidden
> >>>> + * after the fence has been signalled. Drivers are allowed to free =
that data,
> >>>> + * and some do.
> >>>> + *
> >>>> + * To allow safe access drivers are mandated to guarantee a RCU gra=
ce period
> >>>> + * between signalling the fence and freeing said data.
> >>>> + *
> >>>> + * As such access to the driver name is only valid inside a RCU loc=
ked section.
> >>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE b=
lock guarded
> >>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >>>> + */
> >>>> +const char *dma_fence_driver_name(struct dma_fence *fence)
> >>>> +{
> >>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >>>> +                        "rcu_read_lock() required for safe access t=
o returned string");
> >>>> +
> >>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >>>> +               return fence->ops->get_driver_name(fence);
> >>>> +       else
> >>>> +               return "detached-driver";
> >>>> +}
> >>>> +EXPORT_SYMBOL(dma_fence_driver_name);
> >>>> +
> >>>> +/**
> >>>> + * dma_fence_timeline_name - Access the timeline name
> >>>> + * @fence: the fence to query
> >>>> + *
> >>>> + * Returns a timeline name provided by the dma-fence implementation=
.
> >>>> + *
> >>>> + * IMPORTANT CONSIDERATION:
> >>>> + * Dma-fence contract stipulates that access to driver provided dat=
a (data not
> >>>> + * directly embedded into the object itself), such as the &dma_fenc=
e.lock and
> >>>> + * memory potentially accessed by the &dma_fence.ops functions, is =
forbidden
> >>>> + * after the fence has been signalled. Drivers are allowed to free =
that data,
> >>>> + * and some do.
> >>>> + *
> >>>> + * To allow safe access drivers are mandated to guarantee a RCU gra=
ce period
> >>>> + * between signalling the fence and freeing said data.
> >>>> + *
> >>>> + * As such access to the driver name is only valid inside a RCU loc=
ked section.
> >>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE b=
lock guarded
> >>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >>>> + */
> >>>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> >>>> +{
> >>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >>>> +                        "rcu_read_lock() required for safe access t=
o returned string");
> >>>> +
> >>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >>>> +               return fence->ops->get_driver_name(fence);
> >>>> +       else
> >>>> +               return "signaled-timeline";
> >>>
> >>> This means that trace_dma_fence_signaled() will get the wrong
> >>> timeline/driver name, which probably screws up perfetto and maybe
> >>> other tools.
> >>
> >> Do you think context and seqno are not enough for those tools and they
> >> actually rely on the names? It would sound weird if they decided to
> >> index anything on the names which are non-standardised between drivers=
,
> >> but I guess anything is possible.
> >
> > At some point perfetto uses the timeline name to put up a named fence
> > timeline, I'm not sure if it is using the name or context # for
> > subsequent fence events (namely, signalled).  I'd have to check the
> > code and get back to you.
>
> If you can it would be useful. Presumably it saves the names from the
> start edge of fence lifetime. But again, who knows.

Ok, it looks like perfetto is ok... mostly..
DrmTracker::GetFenceTimelineByContext() will try to lookup the
timeline by context #, and then if that fails, create a new timeline
with the name from the trace event, and add it to the hashmap.

It might be that "signaled-timeline" shows up if the first event seen
is the fence-signaled event.

> > There is also gpuvis, which I guess does something similar, but
> > haven't looked into it.  Idk if there are others.
>
> I know GpuVis uses DRM sched tracepoints since Pierre-Eric was
> explaining me about those in the context of tracing rework he did there.
> I am not sure about dma-fence tracepoints.
>
> +Pierre-Eric on the off chance you know from the top of your head how
> much GpuVis depends on them (dma-fence tracepoints).
>
> >>> Maybe it would work well enough just to move the
> >>> trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> >>> if some things will start getting confused if they see that trace
> >>> multiple times.
> >>
> >> Another alternative is to make this tracepoint access the names
> >> directly. It is under the lock so guaranteed not to get freed with
> >> drivers which will be made compliant with the documented rules.
> >
> > I guess it would have been better if, other than dma_fence_init
> > tracepoint, later tracepoints didn't include the driver/timeline
> > name.. that would have forced the use of the context.  But I guess too
> > late for that.  Perhaps the least bad thing to do is use the locking?
>
> You mean this last alternative I mentioned? I think that will work fine.
> I'll wait a little bit longer for more potential comments before re-spi
> ning with that.

yes

> Were you able to test the series for your use case? Assuming it is not
> upstream msm since I don't immediately see a path in msm_fence which
> gets freed at runtime?

Not yet, but I think it should because it is the exact same problem
your igt test triggers.

This is with my VM_BIND series, which will dynamically create/teardown
sched entities

BR,
-R

