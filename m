Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC683F2383
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 01:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhHSXGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 19:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhHSXGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 19:06:41 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3830AC061757
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 16:06:04 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id p22so8989495qki.10
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 16:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lUX7epF7foRJPnJW8zAvGrpG9sbsCy+8eUVnLXUioaw=;
        b=k/GgjG+KGvsRHDTaR/VlVvRNrfg9uPX5JU23M6lnlFazEhBaLpFG2yLgIA5DjuqITc
         ZtITYZTtiD4QoA9YVBs+h0X1AVz3p2dPiahcKu4x64AcrhVQXiJIob4kXZsFDqfHLPEH
         MDAy0kMdT7vfNS453Pn3keQ8XOV6pBw+XrZ9JH3zS6LTaGidh2NOFMUyf6POnFxjJjMV
         dteg7esI3k4ovVAkSAOQhtzZ0/kyjPmh1I1TnfpWjWVKuXx7m8P9gtlyRFtfWMupn+rj
         +p4DvEIaviEiwP7Tg+vxG/hXWAG9QrvF2o7GcnaIaJ8USAjvXaOGmBneEWy8U7uYSyyp
         KRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lUX7epF7foRJPnJW8zAvGrpG9sbsCy+8eUVnLXUioaw=;
        b=Pn/AgD9/2RVmZ5+1S3J5tvQmC7U6czeD2Ga0Lq67pAYaloZPc2RzZ+eN5HQ/z5cF+D
         9gwJmr/zEs1yWwLTo+vmiMjGFPpHs9lo/lWPCIZk9PM+x+CJvpuwrinvcFP54toazqsV
         XWEaeqPdnvVorKEOa+t3wEeldVAceBx1FDAWUTz30RwkuNN9Hrp9XZP/RTTDqnPT2Qz3
         UvI1J/qqbn6S3wEEfI2/S7Ucprm568KBXPHSUSc3l2ZhBMwBQlcRtCAY0DG0Z3xEj3Gq
         2EKRb9GS4lfMN5ciR1ZCGDtlVl/Cb0ILsOfZMPbxaN8skDow5FfSdiO0JpFv0ZQK52VB
         IiCw==
X-Gm-Message-State: AOAM531g5DF8F6XM86hormTBLr1180+9oJgdFa9QOHDU483ztqthsvSZ
        njSQNTjCNYbaxUoIpWZQpo0A3g==
X-Google-Smtp-Source: ABdhPJy/ltQJWz3bEvwivJHVegVN2SJG5oJXKMzn032Cjp7qnG0C8JFFt9RanDCCQRXqWfZ4YPIPmA==
X-Received: by 2002:a37:2753:: with SMTP id n80mr5973504qkn.223.1629414363407;
        Thu, 19 Aug 2021 16:06:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id n20sm2401213qkk.135.2021.08.19.16.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 16:06:02 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mGr6o-001dOi-8m; Thu, 19 Aug 2021 20:06:02 -0300
Date:   Thu, 19 Aug 2021 20:06:02 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Gal Pressman <galpress@amazon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Doug Ledford <dledford@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Yossi Leybovich <sleybo@amazon.com>,
        Alexander Matushevsky <matua@amazon.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        John Hubbard <jhubbard@nvidia.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210819230602.GU543798@ziepe.ca>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 11:34:51AM +0200, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 9:45 AM Gal Pressman <galpress@amazon.com> wrote:
> >
> > Hey all,
> >
> > Currently, the RDMA subsystem can only work with dynamic dmabuf
> > attachments, which requires the RDMA device to support on-demand-paging
> > (ODP) which is not common on most devices (only supported by mlx5).
> >
> > While the dynamic requirement makes sense for certain GPUs, some devices
> > (such as habanalabs) have device memory that is always "pinned" and do
> > not need/use the move_notify operation.
> >
> > The motivation of this RFC is to use habanalabs as the dmabuf exporter,
> > and EFA as the importer to allow for peer2peer access through libibverbs.
> >
> > This draft patch changes the dmabuf driver to differentiate between
> > static/dynamic attachments by looking at the move_notify op instead of
> > the importer_ops struct, and allowing the peer2peer flag to be enabled
> > in case of a static exporter.
> >
> > Thanks
> >
> > Signed-off-by: Gal Pressman <galpress@amazon.com>
> 
> Given that habanalabs dma-buf support is very firmly in limbo (at
> least it's not yet in linux-next or anywhere else) I think you want to
> solve that problem first before we tackle the additional issue of
> making p2p work without dynamic dma-buf. Without that it just doesn't
> make a lot of sense really to talk about solutions here.

I have been thinking about adding a dmabuf exporter to VFIO, for
basically the same reason habana labs wants to do it.

In that situation we'd want to see an approach similar to this as well
to have a broad usability.

The GPU drivers also want this for certain sophisticated scenarios
with RDMA, the intree drivers just haven't quite got there yet.

So, I think it is worthwhile to start thinking about this regardless
of habana labs.

Jason
