Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF130B1D9
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 22:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBAVDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 16:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhBAVDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 16:03:48 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00F7C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 13:03:08 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id t17so13405413qtq.2
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 13:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8k+54hdZU4bIMIuE/qB/uIoqqs2NrOQg3MOYc8JAwIA=;
        b=VmKk8nJ8618Xbxb/H896bZfhXIhO+dDFeUnBicg0JgMCZ2SFsaM6lJiSTgdnLMu79D
         fgKtrmUK5R3fe7Yl0eGTceLLC1GTeGVawyYLpw6NwDpWply35TF6br9QZ6olQ8kVvGpy
         wO6bCOtQ+xDPXWW6eFg27XfF7zy563tAIUsT781IJQD2I41Yr7aHKUPQzkf7COO8FXIc
         xvu2Ew+57rxCD3DCWw+JgekQy8f+aEcLR4rkRqxbH8g84l1W4x6REWxjjezelEiJt5kP
         ktSgklhXzDh78n5AWCjez+Se6nMTNaHgXldwBmPqqHOMSGaVZF6kOfVim4cFAH6JBh1u
         Tgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8k+54hdZU4bIMIuE/qB/uIoqqs2NrOQg3MOYc8JAwIA=;
        b=h7a1s8iDljOcaNnYBb1eaDNMxd8tZ5xD5cSMzgZyJqEjXKXaXQ04hW0RnIWRApekvg
         5dDYwgtrdrNfsQlV+rnv9B7VtoROP1ytGBXPQ5tCKf0/yD+cjCYaQ5uHDgo6B693CLot
         A2CkK6O9RpGNS822wpGdlstrL7EzXg2E+reu7nDLVXeUpop6RQ1+UY0FveqBTnTQDG3q
         O/HWFdCsJ3YIAnSOW8+h/jdO/0xn6ZZXaVNK3WZTQYz12v6yItXv5HdcaPI2AEIwdc+D
         GM8OcqpQWGbUY7Ua+bqr6jcXYaNAB4yG3cBL1bfwMHW956NZ4OmGmZ/Xb2r7rbRMte+P
         Ckow==
X-Gm-Message-State: AOAM531wKU69CbhG9mJqRSYXEFqNhb6dB0P9jnuHyGo9Pze7pqnMbl/M
        hXAcpdwf6EWGboxZeUpNfhL9Tk5kutY6QJFMuLHJHA==
X-Google-Smtp-Source: ABdhPJwcbm4gK4H7fyyIpRz0Xl6GxfAIdJhHRhQfSbWaVCyeQXVfpohXRpRnF7hSKYvQ5FYmbHVO0UY5sH4BSFkJ1OE=
X-Received: by 2002:ac8:6f0f:: with SMTP id g15mr3296448qtv.322.1612213387657;
 Mon, 01 Feb 2021 13:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
In-Reply-To: <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Mon, 1 Feb 2021 13:02:30 -0800
Message-ID: <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 1, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.org> wr=
ote:
> >
> > On Thu, 28 Jan 2021 at 17:23, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> > > > Hi Hridya,
> > > >
> > > > On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> > > >> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> > > >>> This patch allows statistics to be enabled for each DMA-BUF in
> > > >>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > >>>
> > > >>> The following stats will be exposed by the interface:
> > > >>>
> > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid=
>/device
> > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid=
>/map_counter
> > > >>>
> > > >>> The inode_number is unique for each DMA-BUF and was added earlier=
 [1]
> > > >>> in order to allow userspace to track DMA-BUF usage across differe=
nt
> > > >>> processes.
> > > >>>
> > > >>> Currently, this information is exposed in
> > > >>> /sys/kernel/debug/dma_buf/bufinfo.
> > > >>> However, since debugfs is considered unsafe to be mounted in prod=
uction,
> > > >>> it is being duplicated in sysfs.
> > > >>>
> > > >>> This information will be used to derive DMA-BUF
> > > >>> per-exporter stats and per-device usage stats for Android Bug rep=
orts.
> > > >>> The corresponding userspace changes can be found at [2].
> > > >>> Telemetry tools will also capture this information(along with oth=
er
> > > >>> memory metrics) periodically as well as on important events like =
a
> > > >>> foreground app kill (which might have been triggered by Low Memor=
y
> > > >>> Killer). It will also contribute to provide a snapshot of the sys=
tem
> > > >>> memory usage on other events such as OOM kills and Application No=
t
> > > >>> Responding events.
> > > >>>
> > > >>> A shell script that can be run on a classic Linux environment to =
read
> > > >>> out the DMA-BUF statistics can be found at [3](suggested by John
> > > >>> Stultz).
> > > >>>
> > > >>> The patch contains the following improvements over the previous v=
ersion:
> > > >>> 1) Each attachment is represented by its own directory to allow c=
reating
> > > >>> a symlink to the importing device and to also provide room for fu=
ture
> > > >>> expansion.
> > > >>> 2) The number of distinct mappings of each attachment is exposed =
in a
> > > >>> separate file.
> > > >>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffer=
s
> > > >>> inorder to make the interface expandable in future.
> > > >>>
> > > >>> All of the improvements above are based on suggestions/feedback f=
rom
> > > >>> Daniel Vetter and Christian K=C3=B6nig.
> > > >>>
> > > >>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > > >>> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sy=
sfs%22+(status:open%20OR%20status:merged)
> > > >>> [3]: https://android-review.googlesource.com/c/platform/system/me=
mory/libmeminfo/+/1549734
> > > >>>
> > > >>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > > Thanks for the patch!
> > > >
> > > > Christian: If you're satisfied with the explanation around not
> > > > directly embedding kobjects into the dma_buf and dma_buf_attachment
> > > > structs, then with Greg's r-b from sysfs PoV, I think we can merge =
it.
> > > > Please let me know if you feel otherwise!
> > >
> > >  From the technical side it looks clean to me, feel free to add my
> > > acked-by while pushing.
> > >
> > > But I would at least try to convince Daniel on the design. At least s=
ome
> > > of his concerns seems to be valid and keep in mind that we need to
> > > support this interface forever.
> >
> > Naturally.
> >
> > Since he didn't comment over Hridya's last clarification about the
> > tracepoints to track total GPU memory allocations being orthogonal to
> > this series, I assumed he agreed with it.
>
> The tracepoint being orthogonal didn't really look convincing to me,
> since I do expect we'll need that at a much more generic level, at
> allocators. Whether that's dma-buf heaps or in drm or wherever. And we
> probably also need that to somehow align with cgroups accounting.
>
> But I guess for this it should be easy to extend however we see fit,
> so retrofitting allocator sources and anything else we want/need for
> the overall gpu memory account shouldn't be a problem. Also, it's
> first, so the proof for showing it all works together is more on the
> tracepoints :-)
>
> > Daniel, do you still have objections around adding this patch in?
>
> Needs docs (especially the uapi I think would be useful to document),
> igt tests, that kind of stuff still I think? It's meant to be generic
> uapi across drivers, generally we're a pile stricter for that (and yes
> dma-buf heaps I think didn't do all that, so maybe there's an argument
> for doing this a bit more sloppy or at least "the testsuite is
> somewhere else").

Thank you for taking another look Daniel!

I will try adding an IGT test for the sysfs files. Other than the
documentation in
Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers(included in the
patch), is there another place you would like to see the documentation
copied to?

Regards,
Hridya

>
> But I think it would be good to have this all done.
> -Daniel
>
> >
> > >
> > > Regards,
> > > Christian.
> >
> > Best,
> > Sumit.
> > >
> > > >
> > > >>> ---
> > > >>> Changes in v3:
> > > >>> Fix a warning reported by the kernel test robot.
> > > >>>
> > > >>> Changes in v2:
> > > >>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow a=
ddition
> > > >>> of other DMA-BUF-related sysfs stats in future. Based on feedback=
 from
> > > >>> Daniel Vetter.
> > > >>> -Each attachment has its own directory to represent attaching dev=
ices as
> > > >>> symlinks and to introduce map_count as a separate file. Based on
> > > >>> feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you b=
oth!
> > > >>> -Commit messages updated to point to userspace code in AOSP that =
will
> > > >>> read the DMA-BUF sysfs stats.
> > > >>>
> > > >>>
> > > >>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> > > >>>   drivers/dma-buf/Kconfig                       |  11 +
> > > >>>   drivers/dma-buf/Makefile                      |   1 +
> > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 +++++++++++=
+++++++
> > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > > >>>   drivers/dma-buf/dma-buf.c                     |  37 +++
> > > >>>   include/linux/dma-buf.h                       |  20 ++
> > > >>>   7 files changed, 468 insertions(+)
> > > >>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabu=
f-buffers
> > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > > >> I don't know the dma-buf code at all, but from a sysfs/kobject poi=
nt of
> > > >> view, this patch looks good to me:
> > > >>
> > > >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Best,
> > > > Sumit.
> > > > _______________________________________________
> > > > Linaro-mm-sig mailing list
> > > > Linaro-mm-sig@lists.linaro.org
> > > > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> > >
> >
> >
> > --
> > Thanks and regards,
> >
> > Sumit Semwal
> > Linaro Consumer Group - Tech Lead
> > Linaro.org =E2=94=82 Open source software for ARM SoCs
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
