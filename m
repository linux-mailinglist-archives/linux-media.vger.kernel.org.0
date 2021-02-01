Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E9C30AF94
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 19:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhBASin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 13:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhBASiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 13:38:10 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D29C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 10:37:30 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id d7so17320872otf.3
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 10:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OK3/yMIGSV86DUvu0dfJ5TR43VEdRRr2kp7r5QmuJMg=;
        b=SqoymMDvywSVy60i1yydFlMnRr6P1zz7cWovIo5AorDgsrF4DGEc/PU3NRtCbAkjAL
         X6cAbWktocFq1320H7gStljcXXpuJ+un57AgMJDW/STkwFYzZbou6R71onFSn0S1+X0f
         VhQDGyf9DvwKspvxgiZ4u1+zZ8+izN6s6FD+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OK3/yMIGSV86DUvu0dfJ5TR43VEdRRr2kp7r5QmuJMg=;
        b=QBl1DEaSceg99lSLAq4zhKQA2l1iL91MPs2cPzOmOdeUa8Tr+WtVSyutmn3BiNvFLM
         ekwC4MiFWx7U1Q7uSC6Y37ryon344efdApXfMqsutoIfOOGBPQLKp6rp3UVJedkZZaA2
         4J9lPhyGYB3X35KaNf7Oaos6amRufsVhumCkZpNtvMvLveWgbW+1xHY2e69BkQg1sKgd
         d+08m4Oj0lbRbpmQamtoqib5ddDB7I7BPmHmNyRqfIA6V9fiC03A5ZgTT9TBnzz+tFNX
         BqpXNCZgWSlPIRlCLilzVIZWWkUL5CLNsCrLWO40AOdUcukCcGarunxT5UqKVkQZZ2lG
         eWEQ==
X-Gm-Message-State: AOAM531q8E3yY7kWNE2rpdJJhwatPky/q+FVqjaVgmwr7wdDEjAFPiJs
        oIZVbBm8/sxn0KkL7E+PvoiJVSKb2T1uHCf2IKj/Jw==
X-Google-Smtp-Source: ABdhPJyhEU8xX3mT6PUHT8uMARuTiEksa8FqEw+sjMX8pGPH0y8wnnnhVvVYSun/7uCYlAxpPfgBn8zW4WpFbe/JEys=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr12345078otr.303.1612204649387;
 Mon, 01 Feb 2021 10:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
In-Reply-To: <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 1 Feb 2021 19:37:18 +0100
Message-ID: <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        hyesoo.yu@samsung.com, Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.org> wrot=
e:
>
> On Thu, 28 Jan 2021 at 17:23, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> > > Hi Hridya,
> > >
> > > On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wr=
ote:
> > >> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> > >>> This patch allows statistics to be enabled for each DMA-BUF in
> > >>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > >>>
> > >>> The following stats will be exposed by the interface:
> > >>>
> > >>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > >>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/=
device
> > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/=
map_counter
> > >>>
> > >>> The inode_number is unique for each DMA-BUF and was added earlier [=
1]
> > >>> in order to allow userspace to track DMA-BUF usage across different
> > >>> processes.
> > >>>
> > >>> Currently, this information is exposed in
> > >>> /sys/kernel/debug/dma_buf/bufinfo.
> > >>> However, since debugfs is considered unsafe to be mounted in produc=
tion,
> > >>> it is being duplicated in sysfs.
> > >>>
> > >>> This information will be used to derive DMA-BUF
> > >>> per-exporter stats and per-device usage stats for Android Bug repor=
ts.
> > >>> The corresponding userspace changes can be found at [2].
> > >>> Telemetry tools will also capture this information(along with other
> > >>> memory metrics) periodically as well as on important events like a
> > >>> foreground app kill (which might have been triggered by Low Memory
> > >>> Killer). It will also contribute to provide a snapshot of the syste=
m
> > >>> memory usage on other events such as OOM kills and Application Not
> > >>> Responding events.
> > >>>
> > >>> A shell script that can be run on a classic Linux environment to re=
ad
> > >>> out the DMA-BUF statistics can be found at [3](suggested by John
> > >>> Stultz).
> > >>>
> > >>> The patch contains the following improvements over the previous ver=
sion:
> > >>> 1) Each attachment is represented by its own directory to allow cre=
ating
> > >>> a symlink to the importing device and to also provide room for futu=
re
> > >>> expansion.
> > >>> 2) The number of distinct mappings of each attachment is exposed in=
 a
> > >>> separate file.
> > >>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> > >>> inorder to make the interface expandable in future.
> > >>>
> > >>> All of the improvements above are based on suggestions/feedback fro=
m
> > >>> Daniel Vetter and Christian K=C3=B6nig.
> > >>>
> > >>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > >>> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysf=
s%22+(status:open%20OR%20status:merged)
> > >>> [3]: https://android-review.googlesource.com/c/platform/system/memo=
ry/libmeminfo/+/1549734
> > >>>
> > >>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > Thanks for the patch!
> > >
> > > Christian: If you're satisfied with the explanation around not
> > > directly embedding kobjects into the dma_buf and dma_buf_attachment
> > > structs, then with Greg's r-b from sysfs PoV, I think we can merge it=
.
> > > Please let me know if you feel otherwise!
> >
> >  From the technical side it looks clean to me, feel free to add my
> > acked-by while pushing.
> >
> > But I would at least try to convince Daniel on the design. At least som=
e
> > of his concerns seems to be valid and keep in mind that we need to
> > support this interface forever.
>
> Naturally.
>
> Since he didn't comment over Hridya's last clarification about the
> tracepoints to track total GPU memory allocations being orthogonal to
> this series, I assumed he agreed with it.

The tracepoint being orthogonal didn't really look convincing to me,
since I do expect we'll need that at a much more generic level, at
allocators. Whether that's dma-buf heaps or in drm or wherever. And we
probably also need that to somehow align with cgroups accounting.

But I guess for this it should be easy to extend however we see fit,
so retrofitting allocator sources and anything else we want/need for
the overall gpu memory account shouldn't be a problem. Also, it's
first, so the proof for showing it all works together is more on the
tracepoints :-)

> Daniel, do you still have objections around adding this patch in?

Needs docs (especially the uapi I think would be useful to document),
igt tests, that kind of stuff still I think? It's meant to be generic
uapi across drivers, generally we're a pile stricter for that (and yes
dma-buf heaps I think didn't do all that, so maybe there's an argument
for doing this a bit more sloppy or at least "the testsuite is
somewhere else").

But I think it would be good to have this all done.
-Daniel

>
> >
> > Regards,
> > Christian.
>
> Best,
> Sumit.
> >
> > >
> > >>> ---
> > >>> Changes in v3:
> > >>> Fix a warning reported by the kernel test robot.
> > >>>
> > >>> Changes in v2:
> > >>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow add=
ition
> > >>> of other DMA-BUF-related sysfs stats in future. Based on feedback f=
rom
> > >>> Daniel Vetter.
> > >>> -Each attachment has its own directory to represent attaching devic=
es as
> > >>> symlinks and to introduce map_count as a separate file. Based on
> > >>> feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you bot=
h!
> > >>> -Commit messages updated to point to userspace code in AOSP that wi=
ll
> > >>> read the DMA-BUF sysfs stats.
> > >>>
> > >>>
> > >>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> > >>>   drivers/dma-buf/Kconfig                       |  11 +
> > >>>   drivers/dma-buf/Makefile                      |   1 +
> > >>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 +++++++++++++=
+++++
> > >>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > >>>   drivers/dma-buf/dma-buf.c                     |  37 +++
> > >>>   include/linux/dma-buf.h                       |  20 ++
> > >>>   7 files changed, 468 insertions(+)
> > >>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-=
buffers
> > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > >> I don't know the dma-buf code at all, but from a sysfs/kobject point=
 of
> > >> view, this patch looks good to me:
> > >>
> > >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Best,
> > > Sumit.
> > > _______________________________________________
> > > Linaro-mm-sig mailing list
> > > Linaro-mm-sig@lists.linaro.org
> > > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> >
>
>
> --
> Thanks and regards,
>
> Sumit Semwal
> Linaro Consumer Group - Tech Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
