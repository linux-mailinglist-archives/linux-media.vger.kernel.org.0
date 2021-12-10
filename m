Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC7A470193
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 14:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241650AbhLJNae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 08:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235516AbhLJNae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 08:30:34 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1409AC061746
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 05:26:59 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id a2so8288062qtx.11
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1UYh94T9ayr7ysirWpvvFTZZFGzB6tr1mHpOwSD9y4s=;
        b=FiKJemIB2KPeLKoECRE6rGJYjv4hRdstnEroyo0FScAIfTVyX59gJElxLx877NPlYm
         PGFbBVh/8q1JC5yRjmmgvx1Jt6jcMl+SMzAeQH2jJMkiI4bpIezFCcHWm+e1EM2XxMpj
         IIokm8OzQ5UbI829syl2gTig/MQZVxTID2rB8nfDlNldoliEX7y0vsjjaQJKFBteILVF
         ZDK1LwZ0Cn1Ypt35t4Ws+HSeYRO/7hXvBT+B9OJLnzfVm6VCPDMWlXuWkmMtUnvX1sZv
         GABTFazWX6FxJ6piDOVari9DDuQ3CZ2xhygcHSLkRVSrej53bH/eYlLl3MnXhG2tLjxo
         1yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1UYh94T9ayr7ysirWpvvFTZZFGzB6tr1mHpOwSD9y4s=;
        b=JqN2f39XADZEzN2ZQEbPzEb9DuTaCDnOh+1Et2Us9r8iieGUWnflK8I6+6rU47bjK6
         hzqi85MiZqliMuOd+msXD9XKxcWj+ZbSu5zt37dxjXHN7P9mkrFPLXAOsbPrhEvDC3xg
         Xp691bR19P/xxXhGst/99GIBGbFpx5oAaiUH2e3TL7BfR1Abi7Vno4l4T6bGkEZmkWfh
         rTgyIy7k+vdG5MeS4oNkjwo3Y2WJrPpcPp4mqDQAMudZSUze2dlMUIK8ntGXbhyzNSq2
         ZPFhf5HFWgvyY/37jF5bWy5M9d4d+CYK0xlefj+BHdZP3Bjtcv7hbjZUgICD+idFZRG/
         wpXQ==
X-Gm-Message-State: AOAM5334VLEGv9MinRibf30mcEILTFqJkOP/2hFD/9Fj+3dMgzS2+FFI
        DxVSdc0NJXNMWrnL4kGWG6YtHQ==
X-Google-Smtp-Source: ABdhPJxbYEz5peMcGtph84C4nZca8EtKaKkJc+FDRjPqXZgIuFlQNdM0TU3m9QWUAhZY7R/hSUo/KQ==
X-Received: by 2002:ac8:5a53:: with SMTP id o19mr27107538qta.4.1639142818227;
        Fri, 10 Dec 2021 05:26:58 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id t15sm2031405qta.45.2021.12.10.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:26:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mvfvM-001fZP-B4; Fri, 10 Dec 2021 09:26:56 -0400
Date:   Fri, 10 Dec 2021 09:26:56 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>,
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
Message-ID: <20211210132656.GH6467@ziepe.ca>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
 <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 10, 2021 at 01:47:37PM +0100, Christian König wrote:
> Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
> > On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
> > > Hi Jason,
> > > Thank you for replying.
> > > 
> > > 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
> > > > On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> > > > > Hi maintainers,
> > > > > 
> > > > > Could you please review this patch series?
> > > > Why is it RFC?
> > > > 
> > > > I'm confused why this is useful?
> > > > 
> > > > This can't do copy from MMIO memory, so it shouldn't be compatible
> > > > with things like Gaudi - does something prevent this?
> > > I think if an export of the dma-buf supports vmap, CPU is able to access the
> > > mmio memory.
> > > 
> > > Is it wrong? If this is wrong, there is no advantages this changes..
> > I don't know what the dmabuf folks did, but yes, it is wrong.
> > 
> > IOMEM must be touched using only special accessors, some platforms
> > crash if you don't do this. Even x86 will crash if you touch it with
> > something like an XMM optimized memcpy.
> > 
> > Christian? If the vmap succeeds what rules must the caller use to
> > access the memory?
> 
> See dma-buf-map.h and especially struct dma_buf_map.
> 
> MMIO memory is perfectly supported here and actually the most common case.

Okay that looks sane, but this rxe RFC seems to ignore this
completely. It stuffs the vaddr directly into a umem which goes to all
manner of places in the driver.

??

Jason
