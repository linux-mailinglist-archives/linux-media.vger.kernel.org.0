Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645393BD9CC
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 17:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhGFPPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 11:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhGFPPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 11:15:31 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32019C0613E1
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 06:54:54 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id w13so14485678qtc.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F7pVFly65mtrw4yvfSLy/OKy9AWKG24c85UMsxt0WZw=;
        b=gYf94+BMIGsQpJS3uV3ohuMRMLOEFz0kdysTKDKnloRFgs0LhgoRcqPW98PUrU+dx6
         E3OOKrVJV1BTd2elUyjb8G6xfJzPFdvehJAilfpTM9RS4gfQVAvkYNKGiyCJGug87J6k
         YPq+yFMHPSe1tFJNbPKeZAhUsLvOhG/JZZZww+IcGnL/e9f9w8Z2RP4h4m2+YNHDT4Xi
         aRg/PM4bau3ZfwjJIhVR625Zv1Lq+m19yfd3/4kopcBskBTAcwccdEdO9LAmSJrnc844
         kpItX9Ulfg4csgBtST5Xn7ZpOiEeWyWeCZZL/jYKlVlhcziFr98+RBkzrzJm3IFtppAf
         vOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F7pVFly65mtrw4yvfSLy/OKy9AWKG24c85UMsxt0WZw=;
        b=gxmZWIs/HRH0Su8hn6LyBGZ727F9xQD/9v3OevmjOoRE9gzqzZz1ofKx+De+h0Btci
         M9I4Ew1acArrRtTglDPGPG+EQC6KaU/rlxwR2MEi/4RZZui0fmIp/WBerOitFOwThHTz
         sRJlyoxSSgCL/viNNutkYjdqwq4hNAS9yaOSvKh/ZCOo7FtZA6OSIKEL8ogLTr12zlpn
         F9SLmw8KMMwY9IbxkyM9ntGmTLG837VKFDo3mPPsNyx3lXMUImB+fDkKMCXu236fSHQg
         kWBl1NfRbJzxcHbEOFtjAmla84grFPguDe5UVF3hE9Yta6dCiPhDPqa5SORvR3EDoy2o
         7xRw==
X-Gm-Message-State: AOAM532XfS3oYYR1BECMVqwRw6jPe0F178eSqDm5bawOpfbI/7Mh1YUM
        mwJESUl+KUULFi77J1E+LBsmtQ==
X-Google-Smtp-Source: ABdhPJz13olZ+JJKFkbBuIPKQTyNwX1MXRn+mR8LaT47LKm2ZWHADKQroBueZGYoVGCTJKDq+xeMwA==
X-Received: by 2002:ac8:5045:: with SMTP id h5mr17280817qtm.178.1625579693287;
        Tue, 06 Jul 2021 06:54:53 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id t20sm1900660qtx.48.2021.07.06.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 06:54:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1m0lXH-004QmP-Kc; Tue, 06 Jul 2021 10:54:51 -0300
Date:   Tue, 6 Jul 2021 10:54:51 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20210706135451.GM4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <20210705130314.11519-3-ogabbay@kernel.org>
 <20210705165226.GJ4604@ziepe.ca>
 <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 06, 2021 at 12:44:49PM +0300, Oded Gabbay wrote:

> > > +     /* In case we got a large memory area to export, we need to divide it
> > > +      * to smaller areas because each entry in the dmabuf sgt can only
> > > +      * describe unsigned int.
> > > +      */
> >
> > Huh? This is forming a SGL, it should follow the SGL rules which means
> > you have to fragment based on the dma_get_max_seg_size() of the
> > importer device.
> >
> hmm
> I don't see anyone in drm checking this value (and using it) when
> creating the SGL when exporting dmabuf. (e.g.
> amdgpu_vram_mgr_alloc_sgt)

For dmabuf the only importer is RDMA and it doesn't care, but you
certainly should not introduce a hardwired constant instead of using
the correct function.

Jason
