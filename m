Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA264D91C0
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 01:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343915AbiCOAvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 20:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343812AbiCOAvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 20:51:31 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BD012764
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 17:50:19 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q5so24363553ljb.11
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 17:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iu1dDKMiO58IJTgn0Y5YT/ep6c6PH/A2I1xn5i2OO4M=;
        b=A/QKF0mF9Rm2tSG6t2Q7FLiZsPmEh4wgSlnqrxSBzJTT18Tx/25nw5YitC+o5T1NIl
         dHsn3dewSXLFAeqA/+ODgjyTVd/Tx+QWjF8zqtLmD0tIAydAS7721bsNCRqIJbtKOJmx
         0AOy5rNA4qcgql5krqMhed3+t3qfYgcMOOsOjE3tnNwFKmr/qDH771GV9A5uGgXx8oaE
         Vj+L8eHW1IIPVnDdUjCH5rbstiX6McbtDPBKBdIhI8BKsO6vPZplxqdd24rIn7fSlSIs
         voa9xljon/WNiPC2LT2+MCpCtOQTHWC9qylrpk6wockoK/XRJO4YexgeGVa3vcONg4mj
         368Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iu1dDKMiO58IJTgn0Y5YT/ep6c6PH/A2I1xn5i2OO4M=;
        b=aQnd3oSEzD8X40AKz8ZFeSfYrt56wFT0SJ/Ht1JwxGYwUPtNr5Aj5voSVJxSCFMlHV
         6Ep39eO4ZBF+55OcPY2DybG+5ao+eiiJ7F6blWWb6z0GvlTCS2A9WK5WwBqrtPJsTSO6
         0PTVvJiarqEYHL923pR5uJJ7PkcxA6MEyMAQqE63uhqjXO3ntW8LnHrVQbeVoPiMqPC8
         4pAM0nvGQt8yWTPb0yNc2sufaE5n0t1ZQhqF9RVpUQS0T8fF2kDpd3FwWxfc0hkD6I2E
         x7E3TMJwW4VVSt6Eh5EoUBW0HnJ3KvkS/amO+QkmN3xRCxZYfMsaeBJ0M/SseiSrYqtg
         QPCg==
X-Gm-Message-State: AOAM531i3qFnmYl/m59xblFtVYqxhQCHaHn1uxUwcANdvoW/vxLkU+AC
        HwSoLSY3IFyQa1tSAY0o/KX47665q9r77YMsoy1GRw==
X-Google-Smtp-Source: ABdhPJwHgu6MX7NhAwd4EkLiDaUQTvRgHtgs0ltqyCQLgN417gcAMf2BCutJE3sfOkxZqjDgfOwUxWCmaE1PNMqduXs=
X-Received: by 2002:a2e:7c16:0:b0:244:be33:9718 with SMTP id
 x22-20020a2e7c16000000b00244be339718mr15092896ljc.467.1647305417826; Mon, 14
 Mar 2022 17:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com> <20220309165222.2843651-7-tjmercier@google.com>
In-Reply-To: <20220309165222.2843651-7-tjmercier@google.com>
From:   Todd Kjos <tkjos@google.com>
Date:   Mon, 14 Mar 2022 17:50:05 -0700
Message-ID: <CAHRSSEwY=1ns9LZSZi-yiYgx1UDE2_+L-+VFYPdWVqRuTSkYhw@mail.gmail.com>
Subject: Re: [RFC v3 6/8] binder: Add a buffer flag to relinquish ownership of fds
To:     "T.J. Mercier" <tjmercier@google.com>
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
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>, kaleshsingh@google.com,
        Kenny.Ho@amd.com, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 9, 2022 at 8:52 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> From: Hridya Valsaraju <hridya@google.com>
>
> This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> that a process sending an fd array to another process over binder IPC
> can set to relinquish ownership of the fds being sent for memory
> accounting purposes. If the flag is found to be set during the fd array
> translation and the fd is for a DMA-BUF, the buffer is uncharged from
> the sender's cgroup and charged to the receiving process's cgroup
> instead.
>
> It is up to the sending process to ensure that it closes the fds
> regardless of whether the transfer failed or succeeded.
>
> Most graphics shared memory allocations in Android are done by the
> graphics allocator HAL process. On requests from clients, the HAL process
> allocates memory and sends the fds to the clients over binder IPC.
> The graphics allocator HAL will not retain any references to the
> buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for fd
> arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> correctly charge the buffers to the client processes instead of the
> graphics allocator HAL.
>
> Since this is a new feature exposed to userspace, the kernel and userspac=
e
> must be compatible for the accounting to work for transfers. In all cases
> the allocation and transport of DMA buffers via binder will succeed, but
> only when both the kernel supports, and userspace depends on this feature
> will the transfer accounting work. The possible scenarios are detailed
> below:
>
> 1. new kernel + old userspace
> The kernel supports the feature but userspace does not use it. The old
> userspace won't mount the new cgroup controller, accounting is not
> performed, charge is not transferred.
>
> 2. old kernel + new userspace
> The new cgroup controller is not supported by the kernel, accounting is
> not performed, charge is not transferred.
>
> 3. old kernel + old userspace
> Same as #2
>
> 4. new kernel + new userspace
> Cgroup is mounted, feature is supported and used.
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: Todd Kjos <tkjos@google.com>

>
> ---
> v3 changes
> Remove android from title per Todd Kjos.
>
> Use more common dual author commit message format per John Stultz.
>
> Include details on behavior for all combinations of kernel/userspace
> versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartman.
>
> v2 changes
> Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian K=C3=B6nig.
> ---
>  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
>  include/uapi/linux/android/binder.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8351c5638880..f50d88ded188 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -42,6 +42,7 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/dma-buf.h>
>  #include <linux/fdtable.h>
>  #include <linux/file.h>
>  #include <linux/freezer.h>
> @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,
>  {
>         binder_size_t fdi, fd_buf_size;
>         binder_size_t fda_offset;
> +       bool transfer_gpu_charge =3D false;
>         const void __user *sender_ufda_base;
>         struct binder_proc *proc =3D thread->proc;
> +       struct binder_proc *target_proc =3D t->to_proc;
>         int ret;
>
>         fd_buf_size =3D sizeof(u32) * fda->num_fds;
> @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,
>         if (ret)
>                 return ret;
>
> +       if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> +               parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> +               transfer_gpu_charge =3D true;
> +
>         for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
>                 u32 fd;
> +               struct dma_buf *dmabuf;
> +               struct gpucg *gpucg;
> +
>                 binder_size_t offset =3D fda_offset + fdi * sizeof(fd);
>                 binder_size_t sender_uoffset =3D fdi * sizeof(fd);
>
> @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,
>                                                   in_reply_to);
>                 if (ret)
>                         return ret > 0 ? -EINVAL : ret;
> +
> +               if (!transfer_gpu_charge)
> +                       continue;
> +
> +               dmabuf =3D dma_buf_get(fd);
> +               if (IS_ERR(dmabuf))
> +                       continue;
> +
> +               gpucg =3D gpucg_get(target_proc->tsk);
> +               ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> +               if (ret) {
> +                       pr_warn("%d:%d Unable to transfer DMA-BUF fd char=
ge to %d",
> +                               proc->pid, thread->pid, target_proc->pid)=
;
> +                       gpucg_put(gpucg);
> +               }
> +               dma_buf_put(dmabuf);
>         }
>         return 0;
>  }
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/and=
roid/binder.h
> index 3246f2c74696..169fd5069a1a 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -137,6 +137,7 @@ struct binder_buffer_object {
>
>  enum {
>         BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> +       BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
>  };
>
>  /* struct binder_fd_array_object - object describing an array of fds in =
a buffer
> --
> 2.35.1.616.g0bdcbb4464-goog
>
