Return-Path: <linux-media+bounces-32392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8DAB56DC
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D135A189FAC0
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F2E2BD028;
	Tue, 13 May 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlH5RuDO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47E20E032
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145828; cv=none; b=Ewyz3LxCOkjaAbENxmkHHhs+DeZtDXXQTzsGLFLyUxZQ1dIBJINPgZ5N8kJIT0qeRiN1vukBeYk8qWAJE63+JSprDVvE0pRs+2MNUTjeGAE4BP8Bf7gqQidoAx7xlW7fVysI0+2/zfcyXrVNnFjTsfY5MaWT7i5jQR3VHFuccNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145828; c=relaxed/simple;
	bh=Kur86ck0LSEfqwlIR6bDHgd1Qe60BFNE6Z8NjBTV24U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzTiDMwiGbJ/6CU8wYTkKRa0tbg9pxHnZAsh2Po4LaljS78Js3/3iRfBjJxVB3Q0dnjw8aqeRgLPr4vBAcDugMP1SuRILRlUfDJcI4N8dnneNxCM66n0ZIwDgOQPsFYkNwJtoWsYqz1iFK7muRYzK4rSmG8GajMcTCkEiaQ0KPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlH5RuDO; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so25675205ab.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747145826; x=1747750626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7JvgoF1myyPp51kXMFO7KeBiBPtIqWZF4DhsDiCmkU=;
        b=YlH5RuDO3/E/741DXUT7Ll1FC5EQudSlN/oblWzlOGntm68gbvpFQhJf9FS/rIVIAy
         LrSWSmaeO2EQIt419qZN2vuZMFh1i06082Bwe9FDwSzuLZRkXEhNI0OKg+TelT+ICf/g
         0bqqFRNDdNVtLSioogkrDzqmid+8wStw2/bS9oAC6u2sZpqcLEpiB+CZXnQrKPvmESeK
         20MVZaOJUN6yx7SWnHmTj0wVA076I/k7Ih+vNB480dgszaCgsASfjnWq/B+ECe7uIJZM
         dLY/OQxwzE8iOSDEyf/9lQE/T4HSns7AAsBSNLWiMmJ7J5eITuUi9qv0flIV5IVDRwM8
         aJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145826; x=1747750626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7JvgoF1myyPp51kXMFO7KeBiBPtIqWZF4DhsDiCmkU=;
        b=C5HjoqDhSXN69vlWoZPvYPdjmk8lGfQ9/CFSbASv8re0xJBNMNnu0z7HXZhFQXU/45
         kUw7AlktSrkJ5Sv5fBnmuzwQ8kPv31y8+tOErniCtUCdlmHbGKwQqEnekb6yHIsqMCCY
         tau/2i/v4fEP03VXDCHsb88rSrFdT0XE3syz0xxVw5iTys7c3Nf+tQ1suBcIEU0x5D0G
         eGskZ7vITQ7CG2lSsp1+2F8XTz8KF0hcTXJb2WLkUUtrxzvk6KB30Pl0ffSJcjOzzU+T
         N4F0yEr4qBsdmP+FbN7ZFCyfSc2Xll3BGvsVlmDwbHAYW5UGNLfcHyA7KsM+Lv/08wdp
         2PBw==
X-Forwarded-Encrypted: i=1; AJvYcCWuwA2o3oBhfFrECYXTM9SC4ZeIH00JcU/ZhXFY1bEUQU0A2yXhGIPcjBoQzEIHUlyPZwTCGN4OolNB1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAmTPLKMwwQtey2tStCzQMX56PD52oXzMq30VqoCD4UvCp5ZHD
	VUXivPY0LUb8nU3mL55faAYQLiBUunaOv+H0+5TYPDDtHR0sqGgfvGe3GoVBoYN60l2L+Sr1mcE
	CtcoaBeV5nV9FLhV5m9rcuYrlQCg=
X-Gm-Gg: ASbGncsy5caFY4J0Rt4uCzeWrUhfRf+9BMhfCB8h7gyUpu53GyxX9gVs5e5w7/vkJTj
	t3l9OxqmgJ8ZiuakcpXa1lisIhjIenxs1uIl45ZbDD4S+yeb2nLSDhX/h84ZmlsatK/5v7BgMrR
	oWCP5G/jSYyacKqvV5NrstQ6Obwi4Er4aTvM4eJS0m6YCx9vpBT8GGKFygKIuaT6s=
X-Google-Smtp-Source: AGHT+IGiTGnKZsysreFCsBlhWepL/hQV58J2zh5LT1gGazMVzNwO9kv9W4HW2fzPjKZ0XABsGEeKFoY6ux7cVV7hQFM=
X-Received: by 2002:a05:6e02:2292:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3da7e21658cmr209314645ab.22.1747145825748; Tue, 13 May 2025
 07:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com> <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 07:16:53 -0700
X-Gm-Features: AX0GCFuH1j40yQO1HsIKDsTCJ5uHO4NcgonBSju0wMc3XxKpk3t9K9r-1vi2EhU
Message-ID: <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
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

On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
> Dma-fence objects currently suffer from a potential use after free proble=
m
> where fences exported to userspace and other drivers can outlive the
> exporting driver, or the associated data structures.
>
> The discussion on how to address this concluded that adding reference
> counting to all the involved objects is not desirable, since it would nee=
d
> to be very wide reaching and could cause unloadable drivers if another
> entity would be holding onto a signaled fence reference potentially
> indefinitely.
>
> This patch enables the safe access by introducing and documenting a
> contract between fence exporters and users. It documents a set of
> contraints and adds helpers which a) drivers with potential to suffer fro=
m
> the use after free must use and b) users of the dma-fence API must use as
> well.
>
> Premise of the design has multiple sides:
>
> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> signalling a fence and freeing the driver private data associated with it=
.
>
> The grace period does not have to follow the signalling immediately but
> HAS to happen before data is freed.
>
> 2. Users of the dma-fence API marked with such requirement MUST contain
> the complete access to the data within a single code block guarded by the
> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>
> The combination of the two ensures that whoever sees the
> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> valid fence->lock and valid data potentially accessed by the fence->ops
> virtual functions, until the call to dma_fence_access_end().
>
> 3. Module unload (fence->ops) disappearing is for now explicitly not
> handled. That would required a more complex protection, possibly needing
> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
> where race between dma_fence_enable_sw_signaling, signalling, and
> dereference of fence->ops->wait() would need a sleeping SRCU context.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-fence.h   | 32 ++++++++++++-----
>  2 files changed, 93 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index dc2456f68685..cfe1d7b79c22 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>         struct dma_fence *fence =3D
>                 container_of(kref, struct dma_fence, refcount);
>
> +       dma_fence_access_begin();
>         trace_dma_fence_destroy(fence);
>
>         if (WARN(!list_empty(&fence->cb_list) &&
> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>                 fence->ops->release(fence);
>         else
>                 dma_fence_free(fence);
> +
> +       dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_release);
>
> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> +       dma_fence_access_begin();
>         seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>                    dma_fence_driver_name(fence),
>                    dma_fence_timeline_name(fence),
>                    fence->seqno,
>                    dma_fence_is_signaled(fence) ? "" : "un");
> +       dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>
> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
>         __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
> +
> +/**
> + * dma_fence_driver_name - Access the driver name
> + * @fence: the fence to query
> + *
> + * Returns a driver name backing the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (da=
ta not
> + * directly embedded into the object itself), such as the &dma_fence.loc=
k and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbi=
dden
> + * after the fence has been signalled. Drivers are allowed to free that =
data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace pe=
riod
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked s=
ection.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block =
guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{
> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +                        "rcu_read_lock() required for safe access to ret=
urned string");
> +
> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               return fence->ops->get_driver_name(fence);
> +       else
> +               return "detached-driver";
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - Access the timeline name
> + * @fence: the fence to query
> + *
> + * Returns a timeline name provided by the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (da=
ta not
> + * directly embedded into the object itself), such as the &dma_fence.loc=
k and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbi=
dden
> + * after the fence has been signalled. Drivers are allowed to free that =
data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace pe=
riod
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked s=
ection.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block =
guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +                        "rcu_read_lock() required for safe access to ret=
urned string");
> +
> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               return fence->ops->get_driver_name(fence);
> +       else
> +               return "signaled-timeline";

This means that trace_dma_fence_signaled() will get the wrong
timeline/driver name, which probably screws up perfetto and maybe
other tools.

Maybe it would work well enough just to move the
trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
if some things will start getting confused if they see that trace
multiple times.

Maybe a better solution would be to add a new bit for this purpose,
which is set after the tracepoint in
dma_fence_signal_timestamp_locked().

(trace_dma_fence_destroy() will I guess be messed up regardless.. it
doesn't look like perfetto cares about this tracepoint, so maybe that
is ok.  It doesn't seem so useful.)

BR,
-R


> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index c814a86087f8..c8a9915eb360 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -387,15 +387,31 @@ bool dma_fence_remove_callback(struct dma_fence *fe=
nce,
>                                struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>
> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
> -{
> -       return fence->ops->get_driver_name(fence);
> -}
> +/**
> + * DOC: Safe external access to driver provided object members
> + *
> + * All data not stored directly in the dma-fence object, such as the
> + * &dma_fence.lock and memory potentially accessed by functions in the
> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been s=
ignalled
> + * because after that point drivers are allowed to free it.
> + *
> + * All code accessing that data via the dma-fence API (or directly, whic=
h is
> + * discouraged), MUST make sure to contain the complete access within a
> + * &dma_fence_access_begin and &dma_fence_access_end pair.
> + *
> + * Some dma-fence API handles this automatically, while other, as for ex=
ample
> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
> + * responsibility to the caller.
> + *
> + * To enable this scheme to work drivers MUST ensure a RCU grace period =
elapses
> + * between signalling the fence and freeing the said data.
> + *
> + */
> +#define dma_fence_access_begin rcu_read_lock
> +#define dma_fence_access_end   rcu_read_unlock
>
> -static inline const char *dma_fence_timeline_name(struct dma_fence *fenc=
e)
> -{
> -       return fence->ops->get_timeline_name(fence);
> -}
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
> --
> 2.48.0
>

