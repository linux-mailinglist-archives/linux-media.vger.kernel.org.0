Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE216529961
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 08:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbiEQGNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 02:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbiEQGNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 02:13:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919B443C6;
        Mon, 16 May 2022 23:13:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1E96B816EA;
        Tue, 17 May 2022 06:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B4BC385B8;
        Tue, 17 May 2022 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652768008;
        bh=OluTkCLxVeKSfegoojJgsJodih/APBSYOWtV2jU6qDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0lYCqDwjr5OYoqicVtqSeJAN0ZLbYKsMFKfl9UaOceG2HPSbwvA854qd10G0b87b/
         Kv0pMNwDnZ8EI0snXGxoHXBin+GcRbqOe6rNeFHvZhJc4a5MhXftkPvEiJhD4y5Twm
         TGtN9umVRlTw08eUyq2RPakU5ZNvxFrXIASNpOl0=
Date:   Tue, 17 May 2022 08:13:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "T.J. Mercier" <tjmercier@google.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Kalesh Singh <kaleshsingh@google.com>,
        Minchan Kim <minchan@google.com>,
        Greg Kroah-Hartman <gregkh@google.com>,
        John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Message-ID: <YoM9BAwybcjG7K/H@kroah.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
> On Mon, May 16, 2022 at 12:21 PM Christian K�nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> > > On Mon, May 16, 2022 at 10:20 AM Christian K�nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> > >>> Recently, we noticed an issue where a process went into direct reclaim
> > >>> while holding the kernfs rw semaphore for sysfs in write (exclusive)
> > >>> mode. This caused processes who were doing DMA-BUF exports and releases
> > >>> to go into uninterruptible sleep since they needed to acquire the same
> > >>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> > >>> blocking DMA-BUF export for an indeterminate amount of time while
> > >>> another process is holding the sysfs rw semaphore in exclusive mode,
> > >>> this patch moves the per-buffer sysfs file creation to the default work
> > >>> queue. Note that this can lead to a short-term inaccuracy in the dmabuf
> > >>> sysfs statistics, but this is a tradeoff to prevent the hot path from
> > >>> being blocked. A work_struct is added to dma_buf to achieve this, but as
> > >>> it is unioned with the kobject in the sysfs_entry, dma_buf does not
> > >>> increase in size.
> > >> I'm still not very keen of this approach as it strongly feels like we
> > >> are working around shortcoming somewhere else.
> > >>
> > > My read of the thread for the last version is that we're running into
> > > a situation where sysfs is getting used for something it wasn't
> > > originally intended for, but we're also stuck with this sysfs
> > > functionality for dmabufs.
> > >
> > >>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> > >>> Originally-by: Hridya Valsaraju <hridya@google.com>
> > >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > >>>
> > >>> ---
> > >>> See the originally submitted patch by Hridya Valsaraju here:
> > >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C794614324d114880a25508da37672e4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883213566903705%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bGlA2FeubfSeL5XDHYyWMZqUXfScoCphZjjK4jrqQJs%3D&amp;reserved=0
> > >>>
> > >>> v2 changes:
> > >>> - Defer only sysfs creation instead of creation and teardown per
> > >>> Christian K�nig
> > >>>
> > >>> - Use a work queue instead of a kthread for deferred work per
> > >>> Christian K�nig
> > >>> ---
> > >>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
> > >>>    include/linux/dma-buf.h               | 14 ++++++-
> > >>>    2 files changed, 54 insertions(+), 16 deletions(-)
> > >>>
> > >>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > >>> index 2bba0babcb62..67b0a298291c 100644
> > >>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > >>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > >>> @@ -11,6 +11,7 @@
> > >>>    #include <linux/printk.h>
> > >>>    #include <linux/slab.h>
> > >>>    #include <linux/sysfs.h>
> > >>> +#include <linux/workqueue.h>
> > >>>
> > >>>    #include "dma-buf-sysfs-stats.h"
> > >>>
> > >>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
> > >>>        kset_unregister(dma_buf_stats_kset);
> > >>>    }
> > >>>
> > >>> +static void sysfs_add_workfn(struct work_struct *work)
> > >>> +{
> > >>> +     struct dma_buf_sysfs_entry *sysfs_entry =
> > >>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
> > >>> +     struct dma_buf *dmabuf = sysfs_entry->dmabuf;
> > >>> +
> > >>> +     /*
> > >>> +      * A dmabuf is ref-counted via its file member. If this handler holds the only
> > >>> +      * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
> > >>> +      * optimization and a race; when the reference count drops to 1 immediately after
> > >>> +      * this check it is not harmful as the sysfs entry will still get cleaned up in
> > >>> +      * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
> > >>> +      * is released, and that can't happen until the end of this function.
> > >>> +      */
> > >>> +     if (file_count(dmabuf->file) > 1) {
> > >> Please completely drop that. I see absolutely no justification for this
> > >> additional complexity.
> > >>
> > > This case gets hit around 5% of the time in my testing so the else is
> > > not a completely unused branch.
> >
> > Well I can only repeat myself: This means that your userspace is
> > severely broken!
> >
> > DMA-buf are meant to be long living objects
> This patch addresses export *latency* regardless of how long-lived the
> object is. Even a single, long-lived export will benefit from this
> change if it would otherwise be blocked on adding an object to sysfs.
> I think attempting to improve this latency still has merit.

Fixing the latency is nice, but as it's just pushing the needed work off
to another code path, it will take longer overall for the sysfs stuff to
be ready for userspace to see.

Perhaps we need to step back and understand what this code is supposed
to be doing.  As I recall, it was created because some systems do not
allow debugfs anymore, and they wanted the debugging information that
the dmabuf code was exposing to debugfs on a "normal" system.  Moving
that logic to sysfs made sense, but now I am wondering why we didn't see
these issues in the debugfs code previously?

Perhaps we should go just one step further and make a misc device node
for dmabug debugging information to be in and just have userspace
poll/read on the device node and we spit the info that used to be in
debugfs out through that?  That way this only affects systems when they
want to read the information and not normal code paths?  Yeah that's a
hack, but this whole thing feels overly complex now.

thanks,

greg k-h
