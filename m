Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D300B305AE2
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbhA0MJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:09:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:42484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237638AbhA0MHF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:07:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95D7920784;
        Wed, 27 Jan 2021 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611749184;
        bh=dVANB09LwALkp+sTk1/RHGXfqYtVo6LFn5maSabxK30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qDieFINuIfQ5HlI+Q7d4qhudf9ZCuiTBRaas2DMe7dboSfmIU5iWI+Qev11I7Xil8
         1ek08I89gKNZBTTj7gDXhuYErxetiuAhTydHkj1+ei+GCJl5hqUiIKCIsE3ht+Muml
         CLfsbz52X/gHRe7p5poUYUB6LM4yJOnB4UwjDXdA=
Date:   Wed, 27 Jan 2021 13:06:21 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-team@android.com, john.stultz@linaro.org, surenb@google.com,
        hyesoo.yu@samsung.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <YBFXPbePURupbe+y@kroah.com>
References: <20210126204240.418297-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126204240.418297-1-hridya@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> 
> The following stats will be exposed by the interface:
> 
> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> /sys/kernel/dmabuf/buffers/<inode_number>/size
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
> 
> The inode_number is unique for each DMA-BUF and was added earlier [1]
> in order to allow userspace to track DMA-BUF usage across different
> processes.
> 
> Currently, this information is exposed in
> /sys/kernel/debug/dma_buf/bufinfo.
> However, since debugfs is considered unsafe to be mounted in production,
> it is being duplicated in sysfs.
> 
> This information will be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
> The corresponding userspace changes can be found at [2].
> Telemetry tools will also capture this information(along with other
> memory metrics) periodically as well as on important events like a
> foreground app kill (which might have been triggered by Low Memory
> Killer). It will also contribute to provide a snapshot of the system
> memory usage on other events such as OOM kills and Application Not
> Responding events.
> 
> A shell script that can be run on a classic Linux environment to read
> out the DMA-BUF statistics can be found at [3](suggested by John
> Stultz).
> 
> The patch contains the following improvements over the previous version:
> 1) Each attachment is represented by its own directory to allow creating
> a symlink to the importing device and to also provide room for future
> expansion.
> 2) The number of distinct mappings of each attachment is exposed in a
> separate file.
> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> inorder to make the interface expandable in future.
> 
> All of the improvements above are based on suggestions/feedback from
> Daniel Vetter and Christian König.
> 
> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22+(status:open%20OR%20status:merged)
> [3]: https://android-review.googlesource.com/c/platform/system/memory/libmeminfo/+/1549734
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Changes in v3:
> Fix a warning reported by the kernel test robot.
> 
> Changes in v2:
> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addition
> of other DMA-BUF-related sysfs stats in future. Based on feedback from
> Daniel Vetter.
> -Each attachment has its own directory to represent attaching devices as
> symlinks and to introduce map_count as a separate file. Based on
> feedback from Daniel Vetter and Christian König. Thank you both!
> -Commit messages updated to point to userspace code in AOSP that will
> read the DMA-BUF sysfs stats.
> 
> 
>  .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
>  drivers/dma-buf/Kconfig                       |  11 +
>  drivers/dma-buf/Makefile                      |   1 +
>  drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 ++++++++++++++++++
>  drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
>  drivers/dma-buf/dma-buf.c                     |  37 +++
>  include/linux/dma-buf.h                       |  20 ++
>  7 files changed, 468 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
>  create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
>  create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h

I don't know the dma-buf code at all, but from a sysfs/kobject point of
view, this patch looks good to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
