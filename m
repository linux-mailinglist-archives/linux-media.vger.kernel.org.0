Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C10493DB6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 16:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238625AbiASPyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 10:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352667AbiASPyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 10:54:05 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC6CC06161C
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:54:05 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso571641wmh.4
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0wqlG/hTKmwc1qlTFRNgFAeCCLQtJYdgJJ7JVZ30KiM=;
        b=e3Pr/dvFruT2iN6cAa0XHKtiGXwO9ueK+tpw6WUP4dtdEWHBBmgavmSQF8CU9J+UcN
         Hz8qBhrHQ1Vt/k5htfjwnT1NUI2SOss2Xgrkvlggt0Lb//TD0mBdhSnopsXNee83qc/w
         W1zJllJJxCEqEHZ8Wdd6DgeaZC8r9Yvd0MdkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=0wqlG/hTKmwc1qlTFRNgFAeCCLQtJYdgJJ7JVZ30KiM=;
        b=Q0P7n3ZOWH2L1QrPzfSdmo2rVKJy2qdG9ABNOR6Jlbe7T7CbfIk6rKPII03N9gRaGs
         JPzL+3CmnUGDI1oID7hgOJNxU2MJF1N0VyykeBe7fMWx5qvh2pUoxxMKpX8RaqmUueib
         IYU4FoOLfpMRMX6hUiPFSXJmRQE2loZPQn/0A715Xm6fOU0NYt1HqGjpoOZxwc/0Ut0X
         uRiRZr8zsgvD0sjr0u4Z3DknuSC0fwsz+wpY7vAelwFJ/6Hn91faQyr3tgKMexoGHXvm
         vWHJGnBddZ64naD6X1GKr1lTEMiDwqBoze0zpVRHkc3+ObCD7fP3r5oEOTa3LJKQEIJI
         Hvxg==
X-Gm-Message-State: AOAM532Po7g7Gz1MsKwnkRgnmuNEpG6mjWaUXBA0lza+vA7sGueQi8BO
        DmpqgEEo8DHae+so9Qolpzzu9g==
X-Google-Smtp-Source: ABdhPJwYR2kHuXIdMjbo//urPLyFiKmcuB+F1hAH4j6/NzToi8Ft7emFD9AOoL2abPOHJyc76IPrBA==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr18768876wrf.431.1642607643845;
        Wed, 19 Jan 2022 07:54:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w9sm6382224wmc.36.2022.01.19.07.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 07:54:02 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:54:00 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Dave Airlie <airlied@redhat.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Matthew Auld <matthew.auld@intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Hang Lu <hangl@codeaurora.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Chris Down <chris@chrisdown.name>,
        Vipin Sharma <vipinsh@google.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        cgroups@vger.kernel.org, Kenny.Ho@amd.com, daniels@collabora.com,
        kaleshsingh@google.com, tjmercier@google.com
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF
 to a cgroup.
Message-ID: <Yeg0GGi0tdnnCLHg@phenom.ffwll.local>
Mail-Followup-To: Hridya Valsaraju <hridya@google.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Dave Airlie <airlied@redhat.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Matthew Auld <matthew.auld@intel.com>,
        Matthew Brost <matthew.brost@intel.com>, Li Li <dualli@google.com>,
        Marco Ballesio <balejs@google.com>, Miguel Ojeda <ojeda@kernel.org>,
        Hang Lu <hangl@codeaurora.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Chris Down <chris@chrisdown.name>,
        Vipin Sharma <vipinsh@google.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
        Kenny.Ho@amd.com, daniels@collabora.com, kaleshsingh@google.com,
        tjmercier@google.com
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
 <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 18, 2022 at 10:54:16AM -0800, Hridya Valsaraju wrote:
> On Sun, Jan 16, 2022 at 11:46 PM Christian König
> <christian.koenig@amd.com> wrote:
> >
> > Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> > > The optional exporter op provides a way for processes to transfer
> > > charge of a buffer to a different process. This is essential for the
> > > cases where a central allocator process does allocations for various
> > > subsystems, hands over the fd to the client who
> > > requested the memory and drops all references to the allocated memory.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > ---
> > >   include/linux/dma-buf.h | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > index 7ab50076e7a6..d5e52f81cc6f 100644
> > > --- a/include/linux/dma-buf.h
> > > +++ b/include/linux/dma-buf.h
> > > @@ -13,6 +13,7 @@
> > >   #ifndef __DMA_BUF_H__
> > >   #define __DMA_BUF_H__
> > >
> > > +#include <linux/cgroup_gpu.h>
> > >   #include <linux/dma-buf-map.h>
> > >   #include <linux/file.h>
> > >   #include <linux/err.h>
> > > @@ -285,6 +286,23 @@ struct dma_buf_ops {
> > >
> > >       int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > >       void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > > +
> > > +     /**
> > > +      * @charge_to_cgroup:
> > > +      *
> > > +      * This is called by an exporter to charge a buffer to the specified
> > > +      * cgroup.
> >
> > Well that sentence makes absolutely no sense at all.
> >
> > The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
> > behalves of the importer and never by the exporter itself.
> >
> > I hope that this is just a documentation mixup.
> 
> Thank you for taking a look Christian!
> 
> Yes, that was poor wording, sorry about that. It should instead say
> that the op would be called by the process the buffer is currently
> charged to in order to transfer the buffer's charge to a different
> cgroup. This is helpful in the case where a process acts as an
> allocator for multiple client processes and we would like the
> allocated buffers to be charged to the clients who requested their
> allocation(instead of the allocating process as is the default
> behavior). In Android, the graphics allocator HAL process[1] does
> most of the graphics allocations on behalf of various clients. After
> allocation, the HAL process passes the fd to the client over binder
> IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
> uncharge the buffer from the HAL process and charge it to the client
> process instead.
> 
> [1]: https://source.android.com/devices/graphics/arch-bq-gralloc

For that use-case, do we really need to have the vfunc abstraction and
force all exporters to do something reasonable with it?

I think just storing the cgrpus gpu memory bucket this is charged against
and doing this in a generic way would be a lot better.

That way we can also easily add other neat features in the future, like
e.g. ttm could take care of charge-assignement automatically maybe, or we
could print the current cgroups charge relationship in the sysfs info
file. Or anything else really.

I do feel that in general for gpu memory cgroups to be useful, we should
really have memory pools as a fairly strong concept. Otherwise every
driver/allocator/thing is going to come up with their own, and very likely
incompatible interpretation. And we end up with a supposed generic cgroups
interface which cannot actually be used in a driver/vendor agnostic way at
all.
-Daniel

> 
> Regards,
> Hridya
> 
> 
> >
> > Regards,
> > Christian.
> >
> > >   The caller must hold a reference to @gpucg obtained via
> > > +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it is
> > > +      * currently charged to before being charged to @gpucg. The caller must
> > > +      * belong to the cgroup the buffer is currently charged to.
> > > +      *
> > > +      * This callback is optional.
> > > +      *
> > > +      * Returns:
> > > +      *
> > > +      * 0 on success or negative error code on failure.
> > > +      */
> > > +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpucg);
> > >   };
> > >
> > >   /**
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
