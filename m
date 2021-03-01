Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51598327826
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 08:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhCAHSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 02:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbhCAHS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 02:18:29 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369D9C06174A;
        Sun, 28 Feb 2021 23:17:49 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id g20so9299263plo.2;
        Sun, 28 Feb 2021 23:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gONCc0ixoRKjPUJ0zP8hmFkWFvyDxygh0qJOWZmcFdU=;
        b=N/8qgwXtE/G/fdawu/Fmb4mJBx6ezmXyU21jAUzWM6K/79Lrri652nxJ472KigfrE/
         VURa7PizmidkddaH4izsdfcMqcr5v6p2X3pFUDQegRATUcnZO/lMjJzs6cjCBlSFo+jt
         r7ZsPHlSVhYG8ejRDtmG+UT4Epzy/QzbTxFLB9U0U8TiiI5nQPHxz4PLaY9WXATtFRIQ
         ftr1hyefCK1dsRM+ko6czzc1Kx3N8isfrl2h+t5brWYvS6lqplvSn89WHL2bfFvxfvN6
         Gu3mzywhSyX2AGEtW/n+Egp/qJzvKrlwXmSwPuBNPI7GcyxW6lVq4yIyJ/HT9cCULa/n
         y5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gONCc0ixoRKjPUJ0zP8hmFkWFvyDxygh0qJOWZmcFdU=;
        b=nIqIRrco1we0BQMkpbXMuyuCNvpPpjQzJfDf7Yl7/jwQ72MGtUvVjIdYKFTJfFCtEd
         mXcdFsu8ecRpH09Tp/WBuboA8cbVwVGa1efa2UN8aKzYANi4IeCxpHyrXDELPWAFOtT2
         wXutXKOMy3/FaW9WMuULOdPTqUBOnb7vXQPoFCshwpFY3HzSP8DW1sAdgDnP8M9rL6Fy
         Uvx4kVHqzGSsSGoXrS801maBw9gcM6+04BTQxZtwWanGpw0ng2H+EdiKClWdKizh3fwX
         rSiGCf6Og0nLIJAhskZrrGXUbJWrhwCV9zyIhmLGb9KYybiay0DsjLoA67yfulsxHaFB
         c+UQ==
X-Gm-Message-State: AOAM533W6g3bNnGdK8AZOIzQx1thBh+gJ3xtCMAT0Wh6qifZ8OmGE0EP
        9Q+3RXkYBUUnU8TrkvYhHjY=
X-Google-Smtp-Source: ABdhPJwsIHRc09CGc3LHIDlq4x0PhiyRF7geKl4Fls4ZybTN+ojHynqyozoqUa+9wweO0267NYAUoQ==
X-Received: by 2002:a17:902:8d95:b029:e2:c956:f085 with SMTP id v21-20020a1709028d95b02900e2c956f085mr14054151plo.35.1614583068826;
        Sun, 28 Feb 2021 23:17:48 -0800 (PST)
Received: from google.com ([2409:10:2e40:5100:b0d4:9de6:fcfc:43a8])
        by smtp.gmail.com with ESMTPSA id u129sm16185037pfu.219.2021.02.28.23.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 23:17:48 -0800 (PST)
Date:   Mon, 1 Mar 2021 16:17:42 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <YDyVFi26RPz5RrJB@google.com>
References: <20210202095110.1215346-1-hch@lst.de>
 <20210202095110.1215346-7-hch@lst.de>
 <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
 <20210216084947.GA23897@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216084947.GA23897@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/02/16 09:49), Christoph Hellwig wrote:
> > When working on the videobuf2 integration with Sergey I noticed that
> > we always pass 0 as DMA attrs here, which removes the ability for
> > drivers to use DMA_ATTR_ALLOC_SINGLE_PAGES.
> > 
> > It's quite important from a system stability point of view, because by
> > default the iommu_dma allocator would prefer big order allocations for
> > TLB locality reasons. For many devices, though, it doesn't really
> > affect the performance, because of random access patterns, so single
> > pages are good enough and reduce the risk of allocation failures or
> > latency due to fragmentation.
> > 
> > Do you think we could add the attrs parameter to the
> > dma_alloc_noncontiguous() API?
> 
> Yes, we could probably do that.

I can cook a patch, unless somebody is already looking into it.

	-ss
