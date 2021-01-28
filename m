Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F8D307582
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 13:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhA1MFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 07:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhA1MEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 07:04:13 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB280C0613D6
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 04:03:32 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id y11so6024571ljk.1
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 04:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zf1ySPanLvetljOt9qgQxmsEilLBns8xPwybgR85ftI=;
        b=aVSS9NeRyairw1rT+cVF7qopMxVBmNdPXma/Zlt8iNnlAJctcN76hRUHSEGD0idQb2
         zYw8DehMHX0EuyLu3bi69YJSpvfjwtAm9MYShHhu9mEbJPEJuzGe49qwnoXKOF2jcVZe
         ln5X07khbAhAXNwJU+flYEz9iAguyMcwrfcHy9mjRZESZY644mUUW/P7d74egjjzcMPc
         71uQKIMZFDoBbbnrLwST/ULL7r00XKa7oJFBx/y/TRGIGhR5vQUfPgTQyXJF9JzJvfJX
         jxAhvGcTMV06Uw6ENiuHuTf/tAOorwgScKj/MkMXOm4CEc8Q3L9oabBOXi2pfwEk4ga1
         MB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zf1ySPanLvetljOt9qgQxmsEilLBns8xPwybgR85ftI=;
        b=Qac0GrcSGltjpEMfkjBGs7+LdVe0sqBC2CO/S3nrfi36NdMH0CZfrYC6kNrwb8aVX0
         70p6AanWhGlfbQSy2eLtgljf1dAyMNXHG5AFMps21uC8ZmGfSkqBzs2+Rt+Gi+8MF75v
         Ie1w8Jz87W4fV9i/JaUYnKOR5T23EfbYCCVofUGfYSe/lEVYxsTqDo4Zi7uln7BMgYBx
         QRQ0caynZpieJSRT4wX8mr9Ep+GduarUkkiOvOPIZR3tTv/EzriDnarCO3L47YkIEPKH
         UfDMKDIVKQpMkWf6vg+K2VMeseNE5ZOb4KTKLoU4gYLlxQZSbN3Wj3B1Vn1UeboqrF9Y
         b1AQ==
X-Gm-Message-State: AOAM532kfXUJThRY9Md/9bXYLwm+qkbQPdSCFhxaCba3oFofhxJxAzhd
        4SCIB5wpI733qHtdT+HngP0TsEKn5tfbYlRGc3vpTg==
X-Google-Smtp-Source: ABdhPJxZNcQdkhhgFkJaqKcGjApXZD/eUnD40mn2WynsvZNNkDCNK3O+xqLpZOdoSj9eIRiYhKFhkCUSmPZUim3reVs=
X-Received: by 2002:a2e:3507:: with SMTP id z7mr7792289ljz.32.1611835411071;
 Thu, 28 Jan 2021 04:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com> <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
In-Reply-To: <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 28 Jan 2021 17:33:19 +0530
Message-ID: <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Christian Koenig <christian.koenig@amd.com>
Cc:     kernel test robot <lkp@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        hyesoo.yu@samsung.com, John Stultz <john.stultz@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hridya Valsaraju <hridya@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 Jan 2021 at 17:23, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> > Hi Hridya,
> >
> > On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> >> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> >>> This patch allows statistics to be enabled for each DMA-BUF in
> >>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >>>
> >>> The following stats will be exposed by the interface:
> >>>
> >>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> >>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/de=
vice
> >>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/ma=
p_counter
> >>>
> >>> The inode_number is unique for each DMA-BUF and was added earlier [1]
> >>> in order to allow userspace to track DMA-BUF usage across different
> >>> processes.
> >>>
> >>> Currently, this information is exposed in
> >>> /sys/kernel/debug/dma_buf/bufinfo.
> >>> However, since debugfs is considered unsafe to be mounted in producti=
on,
> >>> it is being duplicated in sysfs.
> >>>
> >>> This information will be used to derive DMA-BUF
> >>> per-exporter stats and per-device usage stats for Android Bug reports=
.
> >>> The corresponding userspace changes can be found at [2].
> >>> Telemetry tools will also capture this information(along with other
> >>> memory metrics) periodically as well as on important events like a
> >>> foreground app kill (which might have been triggered by Low Memory
> >>> Killer). It will also contribute to provide a snapshot of the system
> >>> memory usage on other events such as OOM kills and Application Not
> >>> Responding events.
> >>>
> >>> A shell script that can be run on a classic Linux environment to read
> >>> out the DMA-BUF statistics can be found at [3](suggested by John
> >>> Stultz).
> >>>
> >>> The patch contains the following improvements over the previous versi=
on:
> >>> 1) Each attachment is represented by its own directory to allow creat=
ing
> >>> a symlink to the importing device and to also provide room for future
> >>> expansion.
> >>> 2) The number of distinct mappings of each attachment is exposed in a
> >>> separate file.
> >>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> >>> inorder to make the interface expandable in future.
> >>>
> >>> All of the improvements above are based on suggestions/feedback from
> >>> Daniel Vetter and Christian K=C3=B6nig.
> >>>
> >>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> >>> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%=
22+(status:open%20OR%20status:merged)
> >>> [3]: https://android-review.googlesource.com/c/platform/system/memory=
/libmeminfo/+/1549734
> >>>
> >>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> > Thanks for the patch!
> >
> > Christian: If you're satisfied with the explanation around not
> > directly embedding kobjects into the dma_buf and dma_buf_attachment
> > structs, then with Greg's r-b from sysfs PoV, I think we can merge it.
> > Please let me know if you feel otherwise!
>
>  From the technical side it looks clean to me, feel free to add my
> acked-by while pushing.
>
> But I would at least try to convince Daniel on the design. At least some
> of his concerns seems to be valid and keep in mind that we need to
> support this interface forever.

Naturally.

Since he didn't comment over Hridya's last clarification about the
tracepoints to track total GPU memory allocations being orthogonal to
this series, I assumed he agreed with it.

Daniel, do you still have objections around adding this patch in?

>
> Regards,
> Christian.

Best,
Sumit.
>
> >
> >>> ---
> >>> Changes in v3:
> >>> Fix a warning reported by the kernel test robot.
> >>>
> >>> Changes in v2:
> >>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addit=
ion
> >>> of other DMA-BUF-related sysfs stats in future. Based on feedback fro=
m
> >>> Daniel Vetter.
> >>> -Each attachment has its own directory to represent attaching devices=
 as
> >>> symlinks and to introduce map_count as a separate file. Based on
> >>> feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you both!
> >>> -Commit messages updated to point to userspace code in AOSP that will
> >>> read the DMA-BUF sysfs stats.
> >>>
> >>>
> >>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> >>>   drivers/dma-buf/Kconfig                       |  11 +
> >>>   drivers/dma-buf/Makefile                      |   1 +
> >>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 +++++++++++++++=
+++
> >>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> >>>   drivers/dma-buf/dma-buf.c                     |  37 +++
> >>>   include/linux/dma-buf.h                       |  20 ++
> >>>   7 files changed, 468 insertions(+)
> >>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-bu=
ffers
> >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> >> I don't know the dma-buf code at all, but from a sysfs/kobject point o=
f
> >> view, this patch looks good to me:
> >>
> >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Best,
> > Sumit.
> > _______________________________________________
> > Linaro-mm-sig mailing list
> > Linaro-mm-sig@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
>


--
Thanks and regards,

Sumit Semwal
Linaro Consumer Group - Tech Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
