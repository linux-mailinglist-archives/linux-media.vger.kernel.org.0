Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E543B0CD4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 20:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbhFVS0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 14:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhFVS0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 14:26:52 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AE0C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 11:24:36 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 14so338496oir.11
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QnNjKnbGZ7GCakKJ0QRWcO3isBu6ee+iFzNt3JwiLrQ=;
        b=dqPmpji3/zleh1sSp3ECwtpB+rCeFmpJwfu48ICknDl4hPhbl4RJYchn4l7F/iei+f
         FJMQg+Xuap/VbhldFPL4BDYTcx8vhPBq7ReKyU4JKnxRRziTUmxgkzYIsiHM8hpLJJVa
         A6oo+pigack/3J3hxCiXFRcQwPRhBvNg707biv478ePFaEcpEToGyB7L3KXwVdf7tAB1
         bGdHUUXiR9Le3ssuzq16H5lPFRjfmDMlpeyXLfPJMSeCKwpmQD/8UbKkOsPK3E2Z9/gg
         BUvWzXPdqz2e9CfiiHQDSCweOtpvJT1oeu8yzDjwW74BHSjl5fN9EqClhJcduGvkw9e+
         m1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QnNjKnbGZ7GCakKJ0QRWcO3isBu6ee+iFzNt3JwiLrQ=;
        b=EXA1xLfvE8Vz7Qx8Sbel1zcDvM4/vzmZiUNkUOBDpA7xAqdmoIua1XH8ywTwNBM+XY
         Opcp8u0ybA4ClTP9GSvexunmi78II8mMRadYtg0NMynLTuNl12cbPGiQKYhb5AanXMfZ
         mqFPGvdYiFqDMqDemAFmlN2ITKOqqeHhySTZZc2eEer3bpM+J5djOk0S4RlMNoLjrUUj
         q0/TJRNHdQbsStHHqCKYv0LF7tBicElrHNAnWppea8TkOkF+sbtkhFELOpdPR1eJ0Pga
         byQb0rheBOuMmtacMXfI5iix6EMvKnJq169AsL+8nbsLACXyABFFY1mZqGhkxzo0Cp0R
         s9KQ==
X-Gm-Message-State: AOAM5301r/JJ1mBt+iG+YtJTHXlBmE3B3NV9SMvsBD1CjE4V0WprMyzB
        BE2xx6APKMAqu5nm+qrN5/SCpIQjsZ4BAw+klOw=
X-Google-Smtp-Source: ABdhPJxzuAriDmEVeAdrMJPYD/SJuKQM97c66cvLRZSBXLKm4X23QaNDIhTRCHyc4Kz7S3is47eENV+KomUGovpkSTU=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr85229oic.5.1624386275151;
 Tue, 22 Jun 2021 11:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch> <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 22 Jun 2021 14:24:24 -0400
Message-ID: <CADnq5_Mb28xV67FcQnG9wGYGUMi7ooN7g_UEeqsYJ8tJ15Ykvw@mail.gmail.com>
Subject: Re: [PATCH 02/15] dma-buf: Switch to inline kerneldoc
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Nirmoy Das <nirmoy.das@amd.com>,
        Chen Li <chenli@uniontech.com>,
        Dave Airlie <airlied@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 12:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> Also review & update everything while we're at it.
>
> This is prep work to smash a ton of stuff into the kerneldoc for
> @resv.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  include/linux/dma-buf.h | 107 +++++++++++++++++++++++++++++++---------
>  1 file changed, 83 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 92eec38a03aa..6d18b9e448b9 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -289,28 +289,6 @@ struct dma_buf_ops {
>
>  /**
>   * struct dma_buf - shared buffer object
> - * @size: size of the buffer; invariant over the lifetime of the buffer.
> - * @file: file pointer used for sharing buffers across, and for refcount=
ing.
> - * @attachments: list of dma_buf_attachment that denotes all devices att=
ached,
> - *               protected by dma_resv lock.
> - * @ops: dma_buf_ops associated with this buffer object.
> - * @lock: used internally to serialize list manipulation, attach/detach =
and
> - *        vmap/unmap
> - * @vmapping_counter: used internally to refcnt the vmaps
> - * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
> - * @exp_name: name of the exporter; useful for debugging.
> - * @name: userspace-provided name; useful for accounting and debugging,
> - *        protected by @resv.
> - * @name_lock: spinlock to protect name access
> - * @owner: pointer to exporter module; used for refcounting when exporte=
r is a
> - *         kernel module.
> - * @list_node: node for dma_buf accounting and debugging.
> - * @priv: exporter specific private data for this buffer object.
> - * @resv: reservation object linked to this dma-buf
> - * @poll: for userspace poll support
> - * @cb_excl: for userspace poll support
> - * @cb_shared: for userspace poll support
> - * @sysfs_entry: for exposing information about this buffer in sysfs.
>   * The attachment_uid member of @sysfs_entry is protected by dma_resv lo=
ck
>   * and is incremented on each attach.
>   *
> @@ -324,24 +302,100 @@ struct dma_buf_ops {
>   * Device DMA access is handled by the separate &struct dma_buf_attachme=
nt.
>   */
>  struct dma_buf {
> +       /**
> +        * @size:
> +        *
> +        * Size of the buffer; invariant over the lifetime of the buffer.
> +        */
>         size_t size;
> +
> +       /**
> +        * @file:
> +        *
> +        * File pointer used for sharing buffers across, and for refcount=
ing.
> +        * See dma_buf_get() and dma_buf_put().
> +        */
>         struct file *file;
> +
> +       /**
> +        * @attachments:
> +        *
> +        * List of dma_buf_attachment that denotes all devices attached,
> +        * protected by &dma_resv lock @resv.
> +        */
>         struct list_head attachments;
> +
> +       /** @ops: dma_buf_ops associated with this buffer object. */

For consistency you may want to format this like:
/**
  * @ops:
  *
  * dma_buf_ops associated with this buffer object.
  */

>         const struct dma_buf_ops *ops;
> +
> +       /**
> +        * @lock:
> +        *
> +        * Used internally to serialize list manipulation, attach/detach =
and
> +        * vmap/unmap. Note that in many cases this is superseeded by
> +        * dma_resv_lock() on @resv.
> +        */
>         struct mutex lock;
> +
> +       /**
> +        * @vmapping_counter:
> +        *
> +        * Used internally to refcnt the vmaps returned by dma_buf_vmap()=
.
> +        * Protected by @lock.
> +        */
>         unsigned vmapping_counter;
> +
> +       /**
> +        * @vmap_ptr:
> +        * The current vmap ptr if @vmapping_counter > 0. Protected by @l=
ock.
> +        */

Same comment as above.

>         struct dma_buf_map vmap_ptr;
> +
> +       /**
> +        * @exp_name:
> +        *
> +        * Name of the exporter; useful for debugging. See the
> +        * DMA_BUF_SET_NAME IOCTL.
> +        */
>         const char *exp_name;
> +
> +       /**
> +        * @name:
> +        *
> +        * Userspace-provided name; useful for accounting and debugging,
> +        * protected by dma_resv_lock() on @resv and @name_lock for read =
access.
> +        */
>         const char *name;
> +
> +       /** @name_lock: Spinlock to protect name acces for read access. *=
/
>         spinlock_t name_lock;
> +
> +       /**
> +        * @owner:
> +        *
> +        * Pointer to exporter module; used for refcounting when exporter=
 is a
> +        * kernel module.
> +        */
>         struct module *owner;
> +
> +       /** @list_node: node for dma_buf accounting and debugging. */

and here.

>         struct list_head list_node;
> +
> +       /** @priv: exporter specific private data for this buffer object.=
 */

and here.

>         void *priv;
> +
> +       /**
> +        * @resv:
> +        *
> +        * Reservation object linked to this dma-buf.
> +        */
>         struct dma_resv *resv;
>
> -       /* poll support */
> +       /** @poll: for userspace poll support */

here.

>         wait_queue_head_t poll;
>
> +       /** @cb_excl: for userspace poll support */
> +       /** @cb_shared: for userspace poll support */

Here.

Either way,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>         struct dma_buf_poll_cb_t {
>                 struct dma_fence_cb cb;
>                 wait_queue_head_t *poll;
> @@ -349,7 +403,12 @@ struct dma_buf {
>                 __poll_t active;
>         } cb_excl, cb_shared;
>  #ifdef CONFIG_DMABUF_SYSFS_STATS
> -       /* for sysfs stats */
> +       /**
> +        * @sysfs_entry:
> +        *
> +        * For exposing information about this buffer in sysfs. See also
> +        * `DMA-BUF statistics`_ for the uapi this enables.
> +        */
>         struct dma_buf_sysfs_entry {
>                 struct kobject kobj;
>                 struct dma_buf *dmabuf;
> --
> 2.32.0.rc2
>
