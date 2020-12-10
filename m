Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E575D2D5778
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 10:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgLJJo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 04:44:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:46752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbgLJJo0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 04:44:26 -0500
Date:   Thu, 10 Dec 2020 10:45:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607593426;
        bh=tW8e+ZIMytQ67f0yQ5yA8t6EHe8cmb+Lh+QmxW6LBx8=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6/TTmEAydmbO5m1IjQqVv5WTsGFBBIl97FuFODGzM248Dw7oVpUk6nmSAWTU6tYP
         NVSG/WaqVlDa7iE1wG48Q2CyVbSAgAcVpkbZ5GNI/iLMEcyOD1ZExlJm23OHd+9SxF
         plDcqLf34ZbytFkCxi/KkkKgG9s8TXB+9y39JBh0=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-team@android.com, surenb@google.com, john.stultz@linaro.org
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <X9HuHFQntOEUNpst@kroah.com>
References: <20201210044400.1080308-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210044400.1080308-1-hridya@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 09, 2020 at 08:43:57PM -0800, Hridya Valsaraju wrote:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> 
> The following stats will be exposed by the interface:
> 
> /sys/kernel/dmabuf/<inode_number>/exporter_name
> /sys/kernel/dmabuf/<inode_number>/size
> /sys/kernel/dmabuf/<inode_number>/dev_map_info
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
> This information is intended to help with root-causing
> low-memory kills and the debugging/analysis of other memory-related issues.
> 
> It will also be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
> 
> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>

Thanks for adding all of this, nice work!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
