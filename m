Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF722D5836
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgLJK2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbgLJK2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:28:12 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95703C0613D6
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 02:27:31 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id w206so2488410wma.0
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 02:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=l92zaKGCsUqQ/gxEstrfL6NDn1q+kjEay4OgM6ksKek=;
        b=lZnohFRO2aVOHIRtc3z7i6lGYCNLnPZdXaB3qWvhukrz58enBHe7EHIJSqX/nuzAHW
         yCJOYIELLDkG00HMP/i9sB90hTKotuEEX6XtZ6vbPgpiCE8od//LiE17cKbqsGFu6+WI
         k8DYSm7F76nBrjKCaWmwkM3P9FtvSoRRTYJ2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=l92zaKGCsUqQ/gxEstrfL6NDn1q+kjEay4OgM6ksKek=;
        b=qnr4oRq0xl2Up426Z/pkJor+7LiEQ9zDBU/rdBl3/F07geQUgO9awmN00pcG+PdFit
         q1blVI3YdDh+cNwANaTtssVbGVKR1U/oFVfSdm/1EQ9FABAZDC+bDubqU6knXr89/MZh
         dDNrlj6zZCap8tDFkHhY4CTQMgEfUEQpg5oyRm9JqUfr9eAru7MirilCT7RKth3RtDpQ
         qzd1bwmZl7oC4MFlYpSORRsmyiOEskACxCjIGyV36CwnthMwWXoOrL1uWptmuuscfEx8
         Ef4B6J7M3rkFQiRoyQZ2HlumgXLOW+Y7ARFl9J+6jiJqq4T+VNkw/Xgp+xz67IQ/iof4
         ezbw==
X-Gm-Message-State: AOAM532Xdsj2C2xBTn/KNcesbpPFGJ1WwJGtiPrCzksKixYIvYzK+phC
        zw68XUqjEimnB2YylyM00S633Q==
X-Google-Smtp-Source: ABdhPJy6LrEU5I4bHa6NTCpIKzGWxUmYOzrDc8WN0RwYWzeap6wdM7DkzQUMvCNV9lfiw29hflZUpw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr7288798wma.93.1607596050214;
        Thu, 10 Dec 2020 02:27:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z64sm8259746wme.10.2020.12.10.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 02:27:29 -0800 (PST)
Date:   Thu, 10 Dec 2020 11:27:27 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        surenb@google.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <20201210102727.GE401619@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        surenb@google.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
        linux-media@vger.kernel.org
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X9H0JREcdxDsMtLX@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian König wrote:
> > In general a good idea, but I have a few concern/comments here.
> > 
> > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > This patch allows statistics to be enabled for each DMA-BUF in
> > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > 
> > > The following stats will be exposed by the interface:
> > > 
> > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > /sys/kernel/dmabuf/<inode_number>/size
> > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > 
> > > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > > in order to allow userspace to track DMA-BUF usage across different
> > > processes.
> > > 
> > > Currently, this information is exposed in
> > > /sys/kernel/debug/dma_buf/bufinfo.
> > > However, since debugfs is considered unsafe to be mounted in production,
> > > it is being duplicated in sysfs.
> > 
> > Mhm, this makes it part of the UAPI. What is the justification for this?
> > 
> > In other words do we really need those debug information in a production
> > environment?
> 
> Production environments seem to want to know who is using up memory :)

This only shows shared memory, so it does smell a lot like $specific_issue
and we're designing a narrow solution for that and then have to carry it
forever.

E.g. why is the list of attachments not a sysfs link? That's how we
usually expose struct device * pointers in sysfs to userspace, not as a
list of things.

Furthermore we don't have the exporter device covered anywhere, how is
that tracked? Yes Android just uses ion for all shared buffers, but that's
not how all of linux userspace works.

Then I guess there's the mmaps, you can fish them out of procfs. A tool
which collects all that information might be useful, just as demonstration
of how this is all supposed to be used.

Finally we have kernel internal mappings too. Not tracked.

There's also some things to make sure we're at least having thought about
how other things fit in here. E.d. dma_resv attached to the dma-buf
matters in general a lot. It doesn't matter on Android because
everything's pinned all the time anyway.

Also I thought sysfs was one value one file, dumping an entire list into
dev_info_map with properties we'll need to extend (once you care about
dma_resv you also want to know which attachments are dynamic) does not
smell like sysfs design at all.

So yeah, why? worksformeonandroidweneeditthere not good enough for uapi of
something this core to how the gpu stack works on linux in general, at
least imo.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
