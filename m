Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E139847A70B
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 10:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbhLTJbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 04:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhLTJbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 04:31:32 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FB6C061574
        for <linux-media@vger.kernel.org>; Mon, 20 Dec 2021 01:31:31 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r17so18401200wrc.3
        for <linux-media@vger.kernel.org>; Mon, 20 Dec 2021 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Htm2M/1UPb5WYk7y28mkq1tTi0RGZ2Jp48YbGwwH0kA=;
        b=ZF/MduX4/4cT+oBmR4T+v8wQ+QDwsxOJuqK9/wRsJS6zcgT2AKpV/tkvOsOZ5L5v6m
         6lR2L48gW5VYExLPAmgVcEuReMeF3qKNn0fEl4cDu9N7mwYe03+7XG7yhhRMXGiShQAG
         VuATgjbbmIZ4i7mM+4AGwwVET8Ejjexw+StR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Htm2M/1UPb5WYk7y28mkq1tTi0RGZ2Jp48YbGwwH0kA=;
        b=5fMpTvgqG4zVDQK96sxnUyLuECguMl7ZlUR73AtQYQG+PJxCmcpyWoRt0J6Ta6q+pn
         D8L/QCVdJHLlbNp8mvc4dLu/XpZHsPTZ4Sl4gyIgQfg1KevnoCgvx7jjuvZwERWBrryS
         QbPyqmkEPpqM3sP9q6nJilH0OWT3WHHolAf9VUdCji/8wc0FBU2W6oa8yQ/74Ap8gekM
         62w6LoXQjq5Yuyg1VAuuEaqwhFkzDldID+S99V9mHm7s1ZaJcP22Nn/OVMEm2MeXBWV9
         Q+shMELKokQmQxnqw69S++JqfeEsSpFr0MAag/lWxAEhAohgZQ+vOkAayvbhP+mmGKzR
         HZZg==
X-Gm-Message-State: AOAM533D6NrYq5d6pi7b2r4vrtj2Gv6c0F/1QsSsbxc+g1II7n/5yIhA
        4iHs3mekibMArqWnLLCdVQOz3A==
X-Google-Smtp-Source: ABdhPJzIKEWyHUlLuEcrr0JV7s9D8oMvc34Me/oLD7Mq3UMFLkvWeDwegpHqyN1hAZyC9N8Yil8rXg==
X-Received: by 2002:a05:6000:148:: with SMTP id r8mr11746823wrx.333.1639992690397;
        Mon, 20 Dec 2021 01:31:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r17sm15109035wmq.11.2021.12.20.01.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:31:29 -0800 (PST)
Date:   Mon, 20 Dec 2021 10:31:27 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Shunsuke Mie <mie@igel.co.jp>,
        Zhu Yanjun <zyjzyj2000@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Doug Ledford <dledford@redhat.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Sean Hefty <sean.hefty@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>,
        Takanari Hayama <taki@igel.co.jp>,
        Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
Message-ID: <YcBNbypJT3UJ0RG6@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Doug Ledford <dledford@redhat.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
        Sean Hefty <sean.hefty@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>,
        Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
 <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
 <20211210132656.GH6467@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211210132656.GH6467@ziepe.ca>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 10, 2021 at 09:26:56AM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 10, 2021 at 01:47:37PM +0100, Christian König wrote:
> > Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
> > > On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
> > > > Hi Jason,
> > > > Thank you for replying.
> > > > 
> > > > 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
> > > > > On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> > > > > > Hi maintainers,
> > > > > > 
> > > > > > Could you please review this patch series?
> > > > > Why is it RFC?
> > > > > 
> > > > > I'm confused why this is useful?
> > > > > 
> > > > > This can't do copy from MMIO memory, so it shouldn't be compatible
> > > > > with things like Gaudi - does something prevent this?
> > > > I think if an export of the dma-buf supports vmap, CPU is able to access the
> > > > mmio memory.
> > > > 
> > > > Is it wrong? If this is wrong, there is no advantages this changes..
> > > I don't know what the dmabuf folks did, but yes, it is wrong.
> > > 
> > > IOMEM must be touched using only special accessors, some platforms
> > > crash if you don't do this. Even x86 will crash if you touch it with
> > > something like an XMM optimized memcpy.
> > > 
> > > Christian? If the vmap succeeds what rules must the caller use to
> > > access the memory?
> > 
> > See dma-buf-map.h and especially struct dma_buf_map.
> > 
> > MMIO memory is perfectly supported here and actually the most common case.
> 
> Okay that looks sane, but this rxe RFC seems to ignore this
> completely. It stuffs the vaddr directly into a umem which goes to all
> manner of places in the driver.
> 
> ??

dma_buf_map is fairly new and we haven't rolled it out consistently yet.
In the past 10 years we simply yolo'd this :-)

Just an explanation, not an excuse for new code to not use dma_buf_map
consistently now that we fixed this mistake.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
