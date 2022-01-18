Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2042B492DEA
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 19:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348457AbiARSyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jan 2022 13:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348449AbiARSyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jan 2022 13:54:53 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F605C06161C
        for <linux-media@vger.kernel.org>; Tue, 18 Jan 2022 10:54:53 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id v186so58959633ybg.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jan 2022 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QuweckTQS4ipVDvmzbXJd32fRhDvTN+WDj7gwwJ5UoU=;
        b=jQFQQg8xNBNZ796rZm7JSGtcgk/RVRlUMQOrW3OprZAwIy/2ezKxTUPzerHa5MEWoA
         +kfQjBOqWihjoI8v514cV21UvUHS5JntgpKuZ/16liMkZGbbSOZYF4w1r6JCuqamghHv
         vowP4DYmSxtE//fgZqRAITszSqg91cqu9Gg64FsXe9W1savFkk2plmXtLm5fBBA0jF0b
         oImfjSzLxxePgVhSUZSsFU9ZJ84ZiyGtkbd0T7VyhnxMEoyDyxlSw/pOQe3BAymEfuQ2
         L/UK5sx9cvQq7XnTqbleIw48nFYsStzQLbt2Y29R65fkhq5UTeKah55mvbCMv7n+zmyV
         rtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QuweckTQS4ipVDvmzbXJd32fRhDvTN+WDj7gwwJ5UoU=;
        b=iXm2ERbCW/oxAHS8VbR2OD5jMqgsA5Wm0H92kQOQexzHKyceplmHchMROsgK+Q2hYB
         BGEb8t3P7pW9GUUJbCEV/45kuJwVpQEPr7iNZF5+f4CneS87qayVtwHQ/5S9HG/EDKup
         kAXY7yu8qyTCraKc+ZQKuDi8wmr7+M2ufRNwl3kmgh1nf4w7b5Fsu0fSSP9unCRNq9rq
         EqImMiQiJCGy3FUO1mNapx29XSw+/k8LGGpbTS6l8xiWn4JDD0hMy2ntEiGoURXi9QwO
         qF5Wv90AJDeFolmH8wAhrzt30SoMt4QPD16kIIEKcbaAtdbd4OYByhkgPFrjfGzyZgWc
         sSeg==
X-Gm-Message-State: AOAM532lggIi/YNGafid5F+DkML9BdqelBfmQuvaJIPsv7nX1H7aHKsc
        uLEiT2n/wjhWI4Oe/Q3S1wnGBH2qqh+g8AeSxIUP5Q==
X-Google-Smtp-Source: ABdhPJwmF0diEuNSgYDq6VwVG2sEv2wSXB4R4GhA8CrKDHbQBq+Cp6d2D+RYzxyanPD1WMMgcwbQ0BJ4awu2dbq2mt8=
X-Received: by 2002:a25:388a:: with SMTP id f132mr35653202yba.102.1642532092017;
 Tue, 18 Jan 2022 10:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com> <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
In-Reply-To: <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Tue, 18 Jan 2022 10:54:16 -0800
Message-ID: <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to
 a cgroup.
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 16, 2022 at 11:46 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> > The optional exporter op provides a way for processes to transfer
> > charge of a buffer to a different process. This is essential for the
> > cases where a central allocator process does allocations for various
> > subsystems, hands over the fd to the client who
> > requested the memory and drops all references to the allocated memory.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >   include/linux/dma-buf.h | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 7ab50076e7a6..d5e52f81cc6f 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -13,6 +13,7 @@
> >   #ifndef __DMA_BUF_H__
> >   #define __DMA_BUF_H__
> >
> > +#include <linux/cgroup_gpu.h>
> >   #include <linux/dma-buf-map.h>
> >   #include <linux/file.h>
> >   #include <linux/err.h>
> > @@ -285,6 +286,23 @@ struct dma_buf_ops {
> >
> >       int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > +
> > +     /**
> > +      * @charge_to_cgroup:
> > +      *
> > +      * This is called by an exporter to charge a buffer to the specif=
ied
> > +      * cgroup.
>
> Well that sentence makes absolutely no sense at all.
>
> The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
> behalves of the importer and never by the exporter itself.
>
> I hope that this is just a documentation mixup.

Thank you for taking a look Christian!

Yes, that was poor wording, sorry about that. It should instead say
that the op would be called by the process the buffer is currently
charged to in order to transfer the buffer's charge to a different
cgroup. This is helpful in the case where a process acts as an
allocator for multiple client processes and we would like the
allocated buffers to be charged to the clients who requested their
allocation(instead of the allocating process as is the default
behavior). In Android, the graphics allocator HAL process[1] does
most of the graphics allocations on behalf of various clients. After
allocation, the HAL process passes the fd to the client over binder
IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
uncharge the buffer from the HAL process and charge it to the client
process instead.

[1]: https://source.android.com/devices/graphics/arch-bq-gralloc

Regards,
Hridya


>
> Regards,
> Christian.
>
> >   The caller must hold a reference to @gpucg obtained via
> > +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it =
is
> > +      * currently charged to before being charged to @gpucg. The calle=
r must
> > +      * belong to the cgroup the buffer is currently charged to.
> > +      *
> > +      * This callback is optional.
> > +      *
> > +      * Returns:
> > +      *
> > +      * 0 on success or negative error code on failure.
> > +      */
> > +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpu=
cg);
> >   };
> >
> >   /**
>
