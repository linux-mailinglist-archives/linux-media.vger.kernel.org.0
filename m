Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AA930D775
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 11:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhBCK1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 05:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbhBCK0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 05:26:32 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2555FC0613ED
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 02:25:52 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d16so23498567wro.11
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q8rg9C2aokhN+dfp78nPAipw2efrtf8qQOfb3+Ijz6o=;
        b=UWbdvd8Fx9pDmSMJhAAJlfsfVW41c/5a4i+hkYbLdEmZT29UqtBxqlWoWnD/D5izAz
         bKPzP8n7hCw+G/CDtq6gFZVBkmn0KFONhIwBYvn9fVNbpTWpTNwLT+/SlMVZJg4A4cKp
         hO5pR8+uCY07sdoDQnnzNm8q1N/vZZyLe3XMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=q8rg9C2aokhN+dfp78nPAipw2efrtf8qQOfb3+Ijz6o=;
        b=IDkm3gOnjhtnt0kJ7o1M52m2sFfcr9aStzX/GMC2w4mn2fVWP9du5St3L2Yn403rFg
         TXy8wb+VxbknNIffLUw0YZYMnwCwt6EMpQGWE1sqOm6ypXyTifjDyxK+mgeDn9cp0URO
         /zR8ltZST0HX4x7WbotVtwxPEJiBfvFfl22Jp6NqKEHqCecsaw1AxsPkUsrTSmXvh2kK
         LXEZ8HWZ/1+Ysgz4YKLrWaqc1YhFguJV9fzKas4vqLgMj1e4tnPMNQEF5lPWWrOZdyeR
         UOAiHu9AawC/8DBdvgZ5+KK2S29zDdNsj2kCBxZxsdqPypFiOHcBEq1VUFwgJaYv4tLJ
         6piQ==
X-Gm-Message-State: AOAM531FrsKPEs1rBuxDgDrdqY3s1N6AphigN7xqspvZWUSrbH6Uacuy
        Y8lz3aiUCGTzp6RgLBypaqnovA==
X-Google-Smtp-Source: ABdhPJyphqZ2NUWMTT86jBdIqEiY+JiFMaXE9v2zI6m/eDoXTBOwVEZUwc1SCS1qZMZ3DxVO152L+w==
X-Received: by 2002:adf:81e4:: with SMTP id 91mr2723103wra.161.1612347950868;
        Wed, 03 Feb 2021 02:25:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j17sm2112012wmc.28.2021.02.03.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 02:25:50 -0800 (PST)
Date:   Wed, 3 Feb 2021 11:25:48 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
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
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
Message-ID: <YBp6LJhg6mTN1U5G@phenom.ffwll.local>
Mail-Followup-To: Hridya Valsaraju <hridya@google.com>,
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
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
 <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 01, 2021 at 01:02:30PM -0800, Hridya Valsaraju wrote:
> On Mon, Feb 1, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.org> wrote:
> > >
> > > On Thu, 28 Jan 2021 at 17:23, Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >
> > > > Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> > > > > Hi Hridya,
> > > > >
> > > > > On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> > > > >>> This patch allows statistics to be enabled for each DMA-BUF in
> > > > >>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > >>>
> > > > >>> The following stats will be exposed by the interface:
> > > > >>>
> > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
> > > > >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
> > > > >>>
> > > > >>> The inode_number is unique for each DMA-BUF and was added earlier [1]
> > > > >>> in order to allow userspace to track DMA-BUF usage across different
> > > > >>> processes.
> > > > >>>
> > > > >>> Currently, this information is exposed in
> > > > >>> /sys/kernel/debug/dma_buf/bufinfo.
> > > > >>> However, since debugfs is considered unsafe to be mounted in production,
> > > > >>> it is being duplicated in sysfs.
> > > > >>>
> > > > >>> This information will be used to derive DMA-BUF
> > > > >>> per-exporter stats and per-device usage stats for Android Bug reports.
> > > > >>> The corresponding userspace changes can be found at [2].
> > > > >>> Telemetry tools will also capture this information(along with other
> > > > >>> memory metrics) periodically as well as on important events like a
> > > > >>> foreground app kill (which might have been triggered by Low Memory
> > > > >>> Killer). It will also contribute to provide a snapshot of the system
> > > > >>> memory usage on other events such as OOM kills and Application Not
> > > > >>> Responding events.
> > > > >>>
> > > > >>> A shell script that can be run on a classic Linux environment to read
> > > > >>> out the DMA-BUF statistics can be found at [3](suggested by John
> > > > >>> Stultz).
> > > > >>>
> > > > >>> The patch contains the following improvements over the previous version:
> > > > >>> 1) Each attachment is represented by its own directory to allow creating
> > > > >>> a symlink to the importing device and to also provide room for future
> > > > >>> expansion.
> > > > >>> 2) The number of distinct mappings of each attachment is exposed in a
> > > > >>> separate file.
> > > > >>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> > > > >>> inorder to make the interface expandable in future.
> > > > >>>
> > > > >>> All of the improvements above are based on suggestions/feedback from
> > > > >>> Daniel Vetter and Christian König.
> > > > >>>
> > > > >>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > > > >>> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22+(status:open%20OR%20status:merged)
> > > > >>> [3]: https://android-review.googlesource.com/c/platform/system/memory/libmeminfo/+/1549734
> > > > >>>
> > > > >>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > > > Thanks for the patch!
> > > > >
> > > > > Christian: If you're satisfied with the explanation around not
> > > > > directly embedding kobjects into the dma_buf and dma_buf_attachment
> > > > > structs, then with Greg's r-b from sysfs PoV, I think we can merge it.
> > > > > Please let me know if you feel otherwise!
> > > >
> > > >  From the technical side it looks clean to me, feel free to add my
> > > > acked-by while pushing.
> > > >
> > > > But I would at least try to convince Daniel on the design. At least some
> > > > of his concerns seems to be valid and keep in mind that we need to
> > > > support this interface forever.
> > >
> > > Naturally.
> > >
> > > Since he didn't comment over Hridya's last clarification about the
> > > tracepoints to track total GPU memory allocations being orthogonal to
> > > this series, I assumed he agreed with it.
> >
> > The tracepoint being orthogonal didn't really look convincing to me,
> > since I do expect we'll need that at a much more generic level, at
> > allocators. Whether that's dma-buf heaps or in drm or wherever. And we
> > probably also need that to somehow align with cgroups accounting.
> >
> > But I guess for this it should be easy to extend however we see fit,
> > so retrofitting allocator sources and anything else we want/need for
> > the overall gpu memory account shouldn't be a problem. Also, it's
> > first, so the proof for showing it all works together is more on the
> > tracepoints :-)
> >
> > > Daniel, do you still have objections around adding this patch in?
> >
> > Needs docs (especially the uapi I think would be useful to document),
> > igt tests, that kind of stuff still I think? It's meant to be generic
> > uapi across drivers, generally we're a pile stricter for that (and yes
> > dma-buf heaps I think didn't do all that, so maybe there's an argument
> > for doing this a bit more sloppy or at least "the testsuite is
> > somewhere else").
> 
> Thank you for taking another look Daniel!
> 
> I will try adding an IGT test for the sysfs files. Other than the
> documentation in
> Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers(included in the
> patch), is there another place you would like to see the documentation
> copied to?

So just read the other thread, and sounds like Christian König brought up
a solid concern with dma-buf fds generally not staying around for much.

So I'm leaning more towards "this sounds like it's going to be useful for
Android only, nothing else" concern.
-Daniel

> 
> Regards,
> Hridya
> 
> >
> > But I think it would be good to have this all done.
> > -Daniel
> >
> > >
> > > >
> > > > Regards,
> > > > Christian.
> > >
> > > Best,
> > > Sumit.
> > > >
> > > > >
> > > > >>> ---
> > > > >>> Changes in v3:
> > > > >>> Fix a warning reported by the kernel test robot.
> > > > >>>
> > > > >>> Changes in v2:
> > > > >>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addition
> > > > >>> of other DMA-BUF-related sysfs stats in future. Based on feedback from
> > > > >>> Daniel Vetter.
> > > > >>> -Each attachment has its own directory to represent attaching devices as
> > > > >>> symlinks and to introduce map_count as a separate file. Based on
> > > > >>> feedback from Daniel Vetter and Christian König. Thank you both!
> > > > >>> -Commit messages updated to point to userspace code in AOSP that will
> > > > >>> read the DMA-BUF sysfs stats.
> > > > >>>
> > > > >>>
> > > > >>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> > > > >>>   drivers/dma-buf/Kconfig                       |  11 +
> > > > >>>   drivers/dma-buf/Makefile                      |   1 +
> > > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 ++++++++++++++++++
> > > > >>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > > > >>>   drivers/dma-buf/dma-buf.c                     |  37 +++
> > > > >>>   include/linux/dma-buf.h                       |  20 ++
> > > > >>>   7 files changed, 468 insertions(+)
> > > > >>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > >> I don't know the dma-buf code at all, but from a sysfs/kobject point of
> > > > >> view, this patch looks good to me:
> > > > >>
> > > > >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Best,
> > > > > Sumit.
> > > > > _______________________________________________
> > > > > Linaro-mm-sig mailing list
> > > > > Linaro-mm-sig@lists.linaro.org
> > > > > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> > > >
> > >
> > >
> > > --
> > > Thanks and regards,
> > >
> > > Sumit Semwal
> > > Linaro Consumer Group - Tech Lead
> > > Linaro.org │ Open source software for ARM SoCs
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
