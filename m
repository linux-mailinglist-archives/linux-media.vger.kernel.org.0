Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BCF30E3F0
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 21:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhBCUPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 15:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhBCUPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 15:15:31 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FDDC0613ED
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 12:14:45 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id s77so1060916qke.4
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 12:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=83Q5W7orHbD/o6+QYAIddRQu3q2yCiuA8v40vSD1hSQ=;
        b=IpOTKdaHrZSgn1IYXB7HTxcDe8LWLh2VY0ZQa1/73f8rM5qgsfCh8r/s7AtTP3UNic
         ELrS/ZbmLtSjTyjN4RRGr2MwpgwE5X3EdJKWekpBAyzLq4rjyA0qKrYUB+TKl5ot49F3
         78j6tvYRnE9ymwd/NDpPx0gGgbTZORLuNgM0THxsCa/GYeZbp4odJELEe6NyMcuPzVTp
         1v+G097nqi9imeB4gVk/FkzyDXR+IhyRGLQiUVDWz4bKE2LOvpemsn6N5Nsj0BSUSxbE
         OoWnwixniCN8SbvIlFdbphrA94dnjykhfsnLlOJ/tqKEWHCzeUOp5YU9vYmO2CoHfZv3
         V5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=83Q5W7orHbD/o6+QYAIddRQu3q2yCiuA8v40vSD1hSQ=;
        b=FpQbvquw/RKxAi1p9njYGCSXnf1b51pCsBJvs8P1KYfnL6dl3eisebM/prI98QtTkr
         bnkF2mxwIdkE67sspx8PL6bfFCslk56sG7R8Lbm7I8oyV9dBzOfvqVXRr30lQKiQSMLd
         ZPkQeosuYLcMIzgSApWFWwWWPPIvdMaoWTKO4e5LLwZyEVFlVoiIYTGD8QiX5CE5Hmdv
         gu/6m1/ZFO7Nq/mHe5T9/L+rXb+Wqn2KPnHwMEKGt2XBTiY1JjtYAH7BitENDJyr85Sx
         9uMYGyJco64ntqeHggwV/8rpzO9Pa/Q6nZJKpErFRdEfWnwVKoxFO58BmXArl0ylX1Or
         aNGA==
X-Gm-Message-State: AOAM531BUI5m9cnPO0t1XuVZs9de81wjcpY9YwXvFDw7651gwUWE4M/0
        yNXiwE6F0YrEutaEINJrbaxIGLoQh6bxe78/Yx0ejw==
X-Google-Smtp-Source: ABdhPJzyIWG/Gk7DHWVANkXHjC+clwdG+Xu7ij8I5xYL/ZjKedXyuzHMr0G05qhWL2kdsbv1J8rhfjJfrN+DF7M/Bd0=
X-Received: by 2002:a37:a5d0:: with SMTP id o199mr4503509qke.40.1612383284084;
 Wed, 03 Feb 2021 12:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
 <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com> <YBp6LJhg6mTN1U5G@phenom.ffwll.local>
In-Reply-To: <YBp6LJhg6mTN1U5G@phenom.ffwll.local>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 3 Feb 2021 12:14:04 -0800
Message-ID: <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 3, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Feb 01, 2021 at 01:02:30PM -0800, Hridya Valsaraju wrote:
> > On Mon, Feb 1, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.org=
> wrote:
> > > >
> > > > On Thu, 28 Jan 2021 at 17:23, Christian K=C3=B6nig
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > >
> > > > > Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> > > > > > Hi Hridya,
> > > > > >
> > > > > > On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> > > > > >> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wro=
te:
> > > > > >>> This patch allows statistics to be enabled for each DMA-BUF i=
n
> > > > > >>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > > >>>
> > > > > >>> The following stats will be exposed by the interface:
> > > > > >>>
> > > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach=
_uid>/device
> > > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach=
_uid>/map_counter
> > > > > >>>
> > > > > >>> The inode_number is unique for each DMA-BUF and was added ear=
lier [1]
> > > > > >>> in order to allow userspace to track DMA-BUF usage across dif=
ferent
> > > > > >>> processes.
> > > > > >>>
> > > > > >>> Currently, this information is exposed in
> > > > > >>> /sys/kernel/debug/dma_buf/bufinfo.
> > > > > >>> However, since debugfs is considered unsafe to be mounted in =
production,
> > > > > >>> it is being duplicated in sysfs.
> > > > > >>>
> > > > > >>> This information will be used to derive DMA-BUF
> > > > > >>> per-exporter stats and per-device usage stats for Android Bug=
 reports.
> > > > > >>> The corresponding userspace changes can be found at [2].
> > > > > >>> Telemetry tools will also capture this information(along with=
 other
> > > > > >>> memory metrics) periodically as well as on important events l=
ike a
> > > > > >>> foreground app kill (which might have been triggered by Low M=
emory
> > > > > >>> Killer). It will also contribute to provide a snapshot of the=
 system
> > > > > >>> memory usage on other events such as OOM kills and Applicatio=
n Not
> > > > > >>> Responding events.
> > > > > >>>
> > > > > >>> A shell script that can be run on a classic Linux environment=
 to read
> > > > > >>> out the DMA-BUF statistics can be found at [3](suggested by J=
ohn
> > > > > >>> Stultz).
> > > > > >>>
> > > > > >>> The patch contains the following improvements over the previo=
us version:
> > > > > >>> 1) Each attachment is represented by its own directory to all=
ow creating
> > > > > >>> a symlink to the importing device and to also provide room fo=
r future
> > > > > >>> expansion.
> > > > > >>> 2) The number of distinct mappings of each attachment is expo=
sed in a
> > > > > >>> separate file.
> > > > > >>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/bu=
ffers
> > > > > >>> inorder to make the interface expandable in future.
> > > > > >>>
> > > > > >>> All of the improvements above are based on suggestions/feedba=
ck from
> > > > > >>> Daniel Vetter and Christian K=C3=B6nig.
> > > > > >>>
> > > > > >>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > > > > >>> [2]: https://android-review.googlesource.com/q/topic:%22dmabu=
f-sysfs%22+(status:open%20OR%20status:merged)
> > > > > >>> [3]: https://android-review.googlesource.com/c/platform/syste=
m/memory/libmeminfo/+/1549734
> > > > > >>>
> > > > > >>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > > > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Thanks for the patch!
> > > > > >
> > > > > > Christian: If you're satisfied with the explanation around not
> > > > > > directly embedding kobjects into the dma_buf and dma_buf_attach=
ment
> > > > > > structs, then with Greg's r-b from sysfs PoV, I think we can me=
rge it.
> > > > > > Please let me know if you feel otherwise!
> > > > >
> > > > >  From the technical side it looks clean to me, feel free to add m=
y
> > > > > acked-by while pushing.
> > > > >
> > > > > But I would at least try to convince Daniel on the design. At lea=
st some
> > > > > of his concerns seems to be valid and keep in mind that we need t=
o
> > > > > support this interface forever.
> > > >
> > > > Naturally.
> > > >
> > > > Since he didn't comment over Hridya's last clarification about the
> > > > tracepoints to track total GPU memory allocations being orthogonal =
to
> > > > this series, I assumed he agreed with it.
> > >
> > > The tracepoint being orthogonal didn't really look convincing to me,
> > > since I do expect we'll need that at a much more generic level, at
> > > allocators. Whether that's dma-buf heaps or in drm or wherever. And w=
e
> > > probably also need that to somehow align with cgroups accounting.
> > >
> > > But I guess for this it should be easy to extend however we see fit,
> > > so retrofitting allocator sources and anything else we want/need for
> > > the overall gpu memory account shouldn't be a problem. Also, it's
> > > first, so the proof for showing it all works together is more on the
> > > tracepoints :-)
> > >
> > > > Daniel, do you still have objections around adding this patch in?
> > >
> > > Needs docs (especially the uapi I think would be useful to document),
> > > igt tests, that kind of stuff still I think? It's meant to be generic
> > > uapi across drivers, generally we're a pile stricter for that (and ye=
s
> > > dma-buf heaps I think didn't do all that, so maybe there's an argumen=
t
> > > for doing this a bit more sloppy or at least "the testsuite is
> > > somewhere else").
> >
> > Thank you for taking another look Daniel!
> >
> > I will try adding an IGT test for the sysfs files. Other than the
> > documentation in
> > Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers(included in the
> > patch), is there another place you would like to see the documentation
> > copied to?
>
> So just read the other thread, and sounds like Christian K=C3=B6nig broug=
ht up
> a solid concern with dma-buf fds generally not staying around for much.

Thank you for the reply Daniel! Could you please elaborate on the
connection with the other thread you mentioned? I am a little confused
since this patch does not deal with tracking DMA-BUF fds.

Regards,
Hridya

>
> So I'm leaning more towards "this sounds like it's going to be useful for
> Android only, nothing else" concern.
> -Daniel
>
> >
> > Regards,
> > Hridya
> >
> > >
> > > But I think it would be good to have this all done.
> > > -Daniel
> > >
> > > >
> > > > >
> > > > > Regards,
> > > > > Christian.
> > > >
> > > > Best,
> > > > Sumit.
> > > > >
> > > > > >
> > > > > >>> ---
> > > > > >>> Changes in v3:
> > > > > >>> Fix a warning reported by the kernel test robot.
> > > > > >>>
> > > > > >>> Changes in v2:
> > > > > >>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to all=
ow addition
> > > > > >>> of other DMA-BUF-related sysfs stats in future. Based on feed=
back from
> > > > > >>> Daniel Vetter.
> > > > > >>> -Each attachment has its own directory to represent attaching=
 devices as
> > > > > >>> symlinks and to introduce map_count as a separate file. Based=
 on
> > > > > >>> feedback from Daniel Vetter and Christian K=C3=B6nig. Thank y=
ou both!
> > > > > >>> -Commit messages updated to point to userspace code in AOSP t=
hat will
> > > > > >>> read the DMA-BUF sysfs stats.
> > > > > >>>
> > > > > >>>
> > > > > >>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> > > > > >>>   drivers/dma-buf/Kconfig                       |  11 +
> > > > > >>>   drivers/dma-buf/Makefile                      |   1 +
> > > > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 +++++++=
+++++++++++
> > > > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > > > > >>>   drivers/dma-buf/dma-buf.c                     |  37 +++
> > > > > >>>   include/linux/dma-buf.h                       |  20 ++
> > > > > >>>   7 files changed, 468 insertions(+)
> > > > > >>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-d=
mabuf-buffers
> > > > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > > >> I don't know the dma-buf code at all, but from a sysfs/kobject=
 point of
> > > > > >> view, this patch looks good to me:
> > > > > >>
> > > > > >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > Best,
> > > > > > Sumit.
> > > > > > _______________________________________________
> > > > > > Linaro-mm-sig mailing list
> > > > > > Linaro-mm-sig@lists.linaro.org
> > > > > > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> > > > >
> > > >
> > > >
> > > > --
> > > > Thanks and regards,
> > > >
> > > > Sumit Semwal
> > > > Linaro Consumer Group - Tech Lead
> > > > Linaro.org =E2=94=82 Open source software for ARM SoCs
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
