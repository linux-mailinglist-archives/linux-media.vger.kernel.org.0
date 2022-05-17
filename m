Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7046C5295D4
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 02:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiEQAIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 20:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235981AbiEQAIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 20:08:20 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC2DA18C
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 17:08:18 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l18so31574711ejc.7
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 17:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e3pOgRazDY2Kzx4v+ObBKa62idIS1rlzF20zCCjf3nY=;
        b=WfJd1cTw95TnlwN0Bfpn9901HkUPCTO4kX12YY98uci7bxJgmS1SWX54kSe0LYveWy
         Zqbmv8QYzSpGMP523iBmvjsWVDF4LVukdlmM3FZYG9CIbp8gFbbVOBHNvToFon6Qhvcl
         7FwL1UULC89FTzA9QXpUHeUhAw8HmvUV40aER9F/JvUMzAcgaQA3rf171zlp1df020Ct
         xpJvYqOzvlEEZnb9GYvdRM2I94ImiHQiyp+J0GBkVhMZplGPu5DA+TwIH8xyNjI15ITL
         UtGkdnQvKHnrU1e2ZgoDJ2IzMJa8+0TIF6hhjlk3PbSWj1ZHKkEgEIy4BFuCHNrxiyvW
         T2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e3pOgRazDY2Kzx4v+ObBKa62idIS1rlzF20zCCjf3nY=;
        b=4BhfecMwo5rU1zL0bvSBTFRj5KkLSLlRmisIor0LjvUQkud92TdGsAf/+W6DrKj4xM
         EIRb3PbuO551DGyvaTON2UKhcblt4sK0OXcXw7McpGzYdhd2LwHnwgcYWQTyI3gDQcE9
         w9/P2DDokNdwZ4lMnUsldH+khM8QI42yAAE6koY+OH6AAkGkfRVQhxrGiEJiffh6Xpp5
         pG/Wov5evTfWuLzJ2ie/HYqiVjkwNUJaSJZKXbismC1NjHOc1dzbHQxewcT2qW7aBC7E
         ev1kxOvWA6h7jtkcC64J/2vXWLHgpI5zME/qqrnlVeBwTKKCSslvOl2oZkl6sSfgqWdd
         TX0A==
X-Gm-Message-State: AOAM531WN9McFzEuQq8djBtWoKnQc+N7FQHaYEQ8dnz79MxVEeqHnh2Y
        kD7GOyBbHclmcu/AWBuM/OB3/+hzH7y6sHOb4MmVXQ==
X-Google-Smtp-Source: ABdhPJzfo66SgLgob+uydPt8SBavmvvCahE7ryqOMNvbzZZiPN7z6KGsq1R5EsbW37fQtmWmBFf7pNwyh4QFH2MKnKs=
X-Received: by 2002:a17:907:9813:b0:6fa:78b0:9be2 with SMTP id
 ji19-20020a170907981300b006fa78b09be2mr17752861ejc.159.1652746096711; Mon, 16
 May 2022 17:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com> <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
In-Reply-To: <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Mon, 16 May 2022 17:08:05 -0700
Message-ID: <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Kalesh Singh <kaleshsingh@google.com>,
        Minchan Kim <minchan@google.com>,
        Greg Kroah-Hartman <gregkh@google.com>,
        John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 16, 2022 at 12:21 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> > On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> >>> Recently, we noticed an issue where a process went into direct reclai=
m
> >>> while holding the kernfs rw semaphore for sysfs in write (exclusive)
> >>> mode. This caused processes who were doing DMA-BUF exports and releas=
es
> >>> to go into uninterruptible sleep since they needed to acquire the sam=
e
> >>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to =
avoid
> >>> blocking DMA-BUF export for an indeterminate amount of time while
> >>> another process is holding the sysfs rw semaphore in exclusive mode,
> >>> this patch moves the per-buffer sysfs file creation to the default wo=
rk
> >>> queue. Note that this can lead to a short-term inaccuracy in the dmab=
uf
> >>> sysfs statistics, but this is a tradeoff to prevent the hot path from
> >>> being blocked. A work_struct is added to dma_buf to achieve this, but=
 as
> >>> it is unioned with the kobject in the sysfs_entry, dma_buf does not
> >>> increase in size.
> >> I'm still not very keen of this approach as it strongly feels like we
> >> are working around shortcoming somewhere else.
> >>
> > My read of the thread for the last version is that we're running into
> > a situation where sysfs is getting used for something it wasn't
> > originally intended for, but we're also stuck with this sysfs
> > functionality for dmabufs.
> >
> >>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF st=
ats in sysfs")
> >>> Originally-by: Hridya Valsaraju <hridya@google.com>
> >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >>>
> >>> ---
> >>> See the originally submitted patch by Hridya Valsaraju here:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
kml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchristian.koenig%=
40amd.com%7C794614324d114880a25508da37672e4b%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637883213566903705%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DbGlA2FeubfSeL5XDHYyWMZqUXfScoCphZjjK4jrqQJs%3D&amp;reserved=3D0
> >>>
> >>> v2 changes:
> >>> - Defer only sysfs creation instead of creation and teardown per
> >>> Christian K=C3=B6nig
> >>>
> >>> - Use a work queue instead of a kthread for deferred work per
> >>> Christian K=C3=B6nig
> >>> ---
> >>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++---=
----
> >>>    include/linux/dma-buf.h               | 14 ++++++-
> >>>    2 files changed, 54 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/=
dma-buf-sysfs-stats.c
> >>> index 2bba0babcb62..67b0a298291c 100644
> >>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>> @@ -11,6 +11,7 @@
> >>>    #include <linux/printk.h>
> >>>    #include <linux/slab.h>
> >>>    #include <linux/sysfs.h>
> >>> +#include <linux/workqueue.h>
> >>>
> >>>    #include "dma-buf-sysfs-stats.h"
> >>>
> >>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
> >>>        kset_unregister(dma_buf_stats_kset);
> >>>    }
> >>>
> >>> +static void sysfs_add_workfn(struct work_struct *work)
> >>> +{
> >>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> >>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_ad=
d_work);
> >>> +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> >>> +
> >>> +     /*
> >>> +      * A dmabuf is ref-counted via its file member. If this handler=
 holds the only
> >>> +      * reference to the dmabuf, there is no need for sysfs kobject =
creation. This is an
> >>> +      * optimization and a race; when the reference count drops to 1=
 immediately after
> >>> +      * this check it is not harmful as the sysfs entry will still g=
et cleaned up in
> >>> +      * dma_buf_stats_teardown, which won't get called until the fin=
al dmabuf reference
> >>> +      * is released, and that can't happen until the end of this fun=
ction.
> >>> +      */
> >>> +     if (file_count(dmabuf->file) > 1) {
> >> Please completely drop that. I see absolutely no justification for thi=
s
> >> additional complexity.
> >>
> > This case gets hit around 5% of the time in my testing so the else is
> > not a completely unused branch.
>
> Well I can only repeat myself: This means that your userspace is
> severely broken!
>
> DMA-buf are meant to be long living objects
This patch addresses export *latency* regardless of how long-lived the
object is. Even a single, long-lived export will benefit from this
change if it would otherwise be blocked on adding an object to sysfs.
I think attempting to improve this latency still has merit.

> and when you create and
> destroy it faster than a work item can create the sysfs entries than
> there is some serious design issue here.
>
> My suspicion is that your IOCTL to create the DMA-buf is somehow
> interrupted/aborted after it was already exported which results in it's
> immediate destruction.
>
This patch uses the default work queue, so this work function could be
blocked by any other user of the queue ahead, not just other dmabuf
exports. So this is independent of getting blocked on manipulating
sysfs.

I will look closer into the lifecycle of dmabufs during camera app
launches to see if there are buffers that have extremely short
lifetimes by design, but I would still like to get this change in to
improve the latency of export for all buffers.



> Regards,
> Christian.
>
> >   It's only 3 extra lines of actual
> > code. I'd prefer to keep it, but I'll remove it to reduce complexity.
> > This means doing work that we know is useless some of the time, and
> > adding contention for a global kernfs lock which this patch is aimed
> > at avoiding (on the hot path), but at least that work is on a worker
> > thread with this patch.
>
>
> >
> >>> +             /*
> >>> +              * kobject_init_and_add expects kobject to be zero-fill=
ed, but we have populated it
> >>> +              * (the sysfs_add_work union member) to trigger this wo=
rk function.
> >>> +              */
> >>> +             memset(&dmabuf->sysfs_entry->kobj, 0, sizeof(dmabuf->sy=
sfs_entry->kobj));
> >>> +             dmabuf->sysfs_entry->kobj.kset =3D dma_buf_per_buffer_s=
tats_kset;
> >>> +             if (kobject_init_and_add(&dmabuf->sysfs_entry->kobj, &d=
ma_buf_ktype, NULL,
> >>> +                                             "%lu", file_inode(dmabu=
f->file)->i_ino)) {
> >>> +                     kobject_put(&dmabuf->sysfs_entry->kobj);
> >>> +                     dmabuf->sysfs_entry =3D NULL;
> >>> +             }
> >>> +     } else {
> >>> +             /*
> >>> +              * Free the sysfs_entry and reset the pointer so dma_bu=
f_stats_teardown doesn't
> >>> +              * attempt to operate on it.
> >>> +              */
> >>> +             kfree(dmabuf->sysfs_entry);
> >>> +             dmabuf->sysfs_entry =3D NULL;
> >>> +     }
> >>> +     dma_buf_put(dmabuf);
> >>> +}
> >>> +
> >>>    int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >>>    {
> >>>        struct dma_buf_sysfs_entry *sysfs_entry;
> >>> -     int ret;
> >>>
> >>>        if (!dmabuf || !dmabuf->file)
> >>>                return -EINVAL;
> >>> @@ -181,25 +218,16 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >>>                return -EINVAL;
> >>>        }
> >>>
> >>> -     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP=
_KERNEL);
> >>> +     sysfs_entry =3D kmalloc(sizeof(struct dma_buf_sysfs_entry), GFP=
_KERNEL);
> >>>        if (!sysfs_entry)
> >>>                return -ENOMEM;
> >>>
> >>> -     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> >>>        sysfs_entry->dmabuf =3D dmabuf;
> >>> -
> >>>        dmabuf->sysfs_entry =3D sysfs_entry;
> >>>
> >>> -     /* create the directory for buffer stats */
> >>> -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype=
, NULL,
> >>> -                                "%lu", file_inode(dmabuf->file)->i_i=
no);
> >>> -     if (ret)
> >>> -             goto err_sysfs_dmabuf;
> >>> +     INIT_WORK(&dmabuf->sysfs_entry->sysfs_add_work, sysfs_add_workf=
n);
> >>> +     get_dma_buf(dmabuf); /* This reference will be dropped in sysfs=
_add_workfn. */
> >>> +     schedule_work(&dmabuf->sysfs_entry->sysfs_add_work);
> >>>
> >>>        return 0;
> >>> -
> >>> -err_sysfs_dmabuf:
> >>> -     kobject_put(&sysfs_entry->kobj);
> >>> -     dmabuf->sysfs_entry =3D NULL;
> >>> -     return ret;
> >>>    }
> >>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>> index 2097760e8e95..0200caa3c515 100644
> >>> --- a/include/linux/dma-buf.h
> >>> +++ b/include/linux/dma-buf.h
> >>> @@ -22,6 +22,7 @@
> >>>    #include <linux/fs.h>
> >>>    #include <linux/dma-fence.h>
> >>>    #include <linux/wait.h>
> >>> +#include <linux/workqueue.h>
> >>>
> >>>    struct device;
> >>>    struct dma_buf;
> >>> @@ -365,7 +366,7 @@ struct dma_buf {
> >>>         */
> >>>        const char *name;
> >>>
> >>> -     /** @name_lock: Spinlock to protect name acces for read access.=
 */
> >>> +     /** @name_lock: Spinlock to protect name access for read access=
. */
> >>>        spinlock_t name_lock;
> >>>
> >>>        /**
> >>> @@ -441,6 +442,7 @@ struct dma_buf {
> >>>
> >>>                __poll_t active;
> >>>        } cb_in, cb_out;
> >>> +
> >> Those changes are unrelated.
> >>
> > I included it here because I thought it was bad form to submit a
> > typo-only patch. Will remove.
> >
> >
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>>    #ifdef CONFIG_DMABUF_SYSFS_STATS
> >>>        /**
> >>>         * @sysfs_entry:
> >>> @@ -449,7 +451,15 @@ struct dma_buf {
> >>>         * `DMA-BUF statistics`_ for the uapi this enables.
> >>>         */
> >>>        struct dma_buf_sysfs_entry {
> >>> -             struct kobject kobj;
> >>> +             union {
> >>> +                     struct kobject kobj;
> >>> +
> >>> +                     /** @sysfs_add_work:
> >>> +                      *
> >>> +                      * For deferred sysfs kobject creation using a =
workqueue.
> >>> +                      */
> >>> +                     struct work_struct sysfs_add_work;
> >>> +             };
> >>>                struct dma_buf *dmabuf;
> >>>        } *sysfs_entry;
> >>>    #endif
>
