Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6A32D59FF
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 13:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732048AbgLJMHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 07:07:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:54830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgLJMG6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 07:06:58 -0500
Date:   Thu, 10 Dec 2020 13:07:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607601977;
        bh=7+XUs0NKgoibxWSzN421h7xPCAuuCw7byH4TQnvEGNw=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=oLeFeqt1pFET44DeiiSlhpvd2a6K2KZr6n0cBqcNsNx771+9H5PVIOkPbJucQu4u/
         tqbg1OacZoFarVqzvGXDaM3wAp3VMknJUO2TG5c+1KksB3zFrWz7f6ra6xII51BqSz
         sT8IhGsd63xCbp3XdM5LTVkVLgdSi4atIBmDoym0=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hridya Valsaraju <hridya@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <X9IPhEkcZO+Ut5RH@kroah.com>
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com>
 <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 12:26:01PM +0100, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > > On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> > > > On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian König wrote:
> > > > > In general a good idea, but I have a few concern/comments here.
> > > > >
> > > > > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > > > > This patch allows statistics to be enabled for each DMA-BUF in
> > > > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > > >
> > > > > > The following stats will be exposed by the interface:
> > > > > >
> > > > > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > > > > /sys/kernel/dmabuf/<inode_number>/size
> > > > > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > > > >
> > > > > > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > > > > > in order to allow userspace to track DMA-BUF usage across different
> > > > > > processes.
> > > > > >
> > > > > > Currently, this information is exposed in
> > > > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > > > However, since debugfs is considered unsafe to be mounted in production,
> > > > > > it is being duplicated in sysfs.
> > > > >
> > > > > Mhm, this makes it part of the UAPI. What is the justification for this?
> > > > >
> > > > > In other words do we really need those debug information in a production
> > > > > environment?
> > > >
> > > > Production environments seem to want to know who is using up memory :)
> > >
> > > This only shows shared memory, so it does smell a lot like $specific_issue
> > > and we're designing a narrow solution for that and then have to carry it
> > > forever.
> >
> > I think the "issue" is that this was a feature from ion that people
> > "missed" in the dmabuf move.  Taking away the ability to see what kind
> > of allocations were being made didn't make a lot of debugging tools
> > happy :(
> 
> If this is just for dma-heaps then why don't we add the stuff back
> over there? It reinforces more that the android gpu stack and the
> non-android gpu stack on linux are fairly different in fundamental
> ways, but that's not really new.

Back "over where"?

dma-bufs are not only used for the graphics stack on android from what I
can tell, so this shouldn't be a gpu-specific issue.

confused,

greg k-h
