Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B7E30744D
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 12:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhA1LB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 06:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhA1LBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 06:01:52 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AA2C061574
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 03:01:12 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e18so5761262lja.12
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 03:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5XLGbbRInjNpFaYOyf93b/4KiboBjefE69X6aMvc2Gc=;
        b=xhO1ZeCHT+ywXd9+utDLPL/+gBf7zS1UylpMh4g+3XDLWjTElNL8s5TeqzFQcx0xDU
         gMRGcGNjTt1vvhtH/o2QHPF0VYMjVyxlxpSyyvPN/1ATsuMag3a/JVN90vQNwdRbpnEJ
         yZX+oy7yQOv0n1ElGuClZd+69kOK/YFv+I+Bq2V6Zpe0sXj8zQ2O1Sfo9qjBXWtQrmNL
         RGMTeOsnN7o4EgrNhpU6taDoZLM43jqDGSA6fIOInyrCbIKaNnd7LYJlTvlhvxDfP7y3
         zFMbqjWzQ8mMLrdso+2X2fY4jG07lEP1Fiz97JwggzghoFlSWoUotJLaQXYybxQe7m3C
         Mf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5XLGbbRInjNpFaYOyf93b/4KiboBjefE69X6aMvc2Gc=;
        b=kx7W/UB+wiSJibHDTJTowr0FePoEKzUOt4Bpzl5eH8f+/b6Oi+BZxUda1Q/HjyATvl
         BBDb7X52fm1E/+yqtejsH8tMDe7IFGntNWyPIF4bicFdl4L/CvN3NUEwKqC/3okRAnNg
         JYkuB9InKbizWlZeZ0phZmkHCKWiM2IYRmiwc2i0zCnEy1mjpyu4Oq+c+FpywbovUavV
         Y5lHWi9wUS777SsHpbyjpf/ii4myzr4yOTF2MXsGMHFO08lBLrhz0mpziX3F8D/lAU1n
         cs0QJi5SYHGr9nw/uMDRGL73n8rIW36oWe6ZOc5YY9kj/8gcz5B1JtRAxgUsgyhG2wLg
         TmYw==
X-Gm-Message-State: AOAM5316mjCSNSeQNXiU6rfbk9zIAyAEy5J8sMaVFbO+6Sp8zpEcwtuR
        YhuYTAMaAnisu09rV59fL309AWfJztXDxz1sfj8NWQ==
X-Google-Smtp-Source: ABdhPJzr6xhUoaZmrh7rcdzCdBohPH7cYxvThi3xo4VCv2zMgI+T5v3TTFrGQa1YGe7klfK6WcuJsrW9BY1syMtY59I=
X-Received: by 2002:a05:651c:1206:: with SMTP id i6mr6913016lja.460.1611831670558;
 Thu, 28 Jan 2021 03:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
In-Reply-To: <YBFXPbePURupbe+y@kroah.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 28 Jan 2021 16:30:59 +0530
Message-ID: <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
Subject: Re: [PATCH v3] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Hridya Valsaraju <hridya@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        John Stultz <john.stultz@linaro.org>,
        Suren Baghdasaryan <surenb@google.com>, hyesoo.yu@samsung.com,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hridya,

On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> > This patch allows statistics to be enabled for each DMA-BUF in
> > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >
> > The following stats will be exposed by the interface:
> >
> > /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > /sys/kernel/dmabuf/buffers/<inode_number>/size
> > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/devi=
ce
> > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_=
counter
> >
> > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > in order to allow userspace to track DMA-BUF usage across different
> > processes.
> >
> > Currently, this information is exposed in
> > /sys/kernel/debug/dma_buf/bufinfo.
> > However, since debugfs is considered unsafe to be mounted in production=
,
> > it is being duplicated in sysfs.
> >
> > This information will be used to derive DMA-BUF
> > per-exporter stats and per-device usage stats for Android Bug reports.
> > The corresponding userspace changes can be found at [2].
> > Telemetry tools will also capture this information(along with other
> > memory metrics) periodically as well as on important events like a
> > foreground app kill (which might have been triggered by Low Memory
> > Killer). It will also contribute to provide a snapshot of the system
> > memory usage on other events such as OOM kills and Application Not
> > Responding events.
> >
> > A shell script that can be run on a classic Linux environment to read
> > out the DMA-BUF statistics can be found at [3](suggested by John
> > Stultz).
> >
> > The patch contains the following improvements over the previous version=
:
> > 1) Each attachment is represented by its own directory to allow creatin=
g
> > a symlink to the importing device and to also provide room for future
> > expansion.
> > 2) The number of distinct mappings of each attachment is exposed in a
> > separate file.
> > 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> > inorder to make the interface expandable in future.
> >
> > All of the improvements above are based on suggestions/feedback from
> > Daniel Vetter and Christian K=C3=B6nig.
> >
> > [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22=
+(status:open%20OR%20status:merged)
> > [3]: https://android-review.googlesource.com/c/platform/system/memory/l=
ibmeminfo/+/1549734
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Reported-by: kernel test robot <lkp@intel.com>

Thanks for the patch!

Christian: If you're satisfied with the explanation around not
directly embedding kobjects into the dma_buf and dma_buf_attachment
structs, then with Greg's r-b from sysfs PoV, I think we can merge it.
Please let me know if you feel otherwise!

> > ---
> > Changes in v3:
> > Fix a warning reported by the kernel test robot.
> >
> > Changes in v2:
> > -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow additio=
n
> > of other DMA-BUF-related sysfs stats in future. Based on feedback from
> > Daniel Vetter.
> > -Each attachment has its own directory to represent attaching devices a=
s
> > symlinks and to introduce map_count as a separate file. Based on
> > feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you both!
> > -Commit messages updated to point to userspace code in AOSP that will
> > read the DMA-BUF sysfs stats.
> >
> >
> >  .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> >  drivers/dma-buf/Kconfig                       |  11 +
> >  drivers/dma-buf/Makefile                      |   1 +
> >  drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 ++++++++++++++++++
> >  drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> >  drivers/dma-buf/dma-buf.c                     |  37 +++
> >  include/linux/dma-buf.h                       |  20 ++
> >  7 files changed, 468 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffe=
rs
> >  create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >  create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
>
> I don't know the dma-buf code at all, but from a sysfs/kobject point of
> view, this patch looks good to me:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Best,
Sumit.
