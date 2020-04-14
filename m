Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4071A7FC4
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 16:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390878AbgDNO2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 10:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390871AbgDNO2M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 10:28:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 911E7206D5;
        Tue, 14 Apr 2020 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586874492;
        bh=AUCP5LBXtPGJHjbn/Oope7bBN8YqMNL+wwsvw4qP3kg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H3IYucfMVmoo+un3KX+EOcHYqVdDOVrDLZRI2LvpvT48wGw3GAG383C3V6cHD8c6n
         IftZ5V3CcP1AL1DtUz8dWDECPuGtky0eivrzBKEODddbpefvrUrwHnTMj5S7Lo2vEY
         WlixpeUCffKCDY4igxJYWeEsjBILC5sBgzc2S70Y=
Date:   Tue, 14 Apr 2020 16:28:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
Cc:     nd@arm.com, anders.pedersen@arm.com, john.stultz@linaro.org,
        Laura Abbott <labbott@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200414142810.GA958163@kroah.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200414141849.55654-1-orjan.eide@arm.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 14, 2020 at 04:18:47PM +0200, Ørjan Eide wrote:
> Only sync the sg-list of an Ion dma-buf attachment when the attachment
> is actually mapped on the device.
> 
> dma-bufs may be synced at any time. It can be reached from user space
> via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
> syncs may be attempted, and dma_buf_end_cpu_access() and
> dma_buf_begin_cpu_access() may not be paired.
> 
> Since the sg_list's dma_address isn't set up until the buffer is used
> on the device, and dma_map_sg() is called on it, the dma_address will be
> NULL if sync is attempted on the dma-buf before it's mapped on a device.
> 
> Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> into the dma_direct code")) this was a problem as the dma-api (at least
> the swiotlb_dma_ops on arm64) would use the potentially invalid
> dma_address. How that failed depended on how the device handled physical
> address 0. If 0 was a valid address to physical ram, that page would get
> flushed a lot, while the actual pages in the buffer would not get synced
> correctly. While if 0 is an invalid physical address it may cause a
> fault and trigger a crash.
> 
> In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
> merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> dma-api to use the page pointer in the sg_list, and (for Ion buffers at
> least) this will always be valid if the sg_list exists at all.
> 
> But, this issue is re-introduced in v5.3 with
> commit 449fa54d6815 ("dma-direct: correct the physical addr in
> dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> behaviour and picks the dma_address that may be invalid.
> 
> dma-buf core doesn't ensure that the buffer is mapped on the device, and
> thus have a valid sg_list, before calling the exporter's
> begin_cpu_access.
> 
> Signed-off-by: Ørjan Eide <orjan.eide@arm.com>
> ---
>  drivers/staging/android/ion/ion.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> Resubmit without disclaimer, sorry about that.
> 
> This seems to be part of a bigger issue where dma-buf exporters assume
> that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
> certain guaranteed behavior, which isn't ensured by dma-buf core.
> 
> This patch fixes this in ion only, but it also needs to be fixed for
> other exporters, either handled like this in each exporter, or in
> dma-buf core before calling into the exporters.
> 
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 38b51eace4f9..7b752ba0cb6d 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c

Now that we have the dma-buff stuff in the tree, do we even need the
ion code in the kernel anymore?  Can't we delete it now?

thanks,

greg k-h
