Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C8159CB38
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 23:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbiHVV7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 17:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238118AbiHVV6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 17:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872461A836
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661205528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mQUeuV51GD+/Z3NmS3oF64vuc80M1JzNM209IAEm6Lo=;
        b=Kby6GlZKRfKvFpgBvTXdwNxIEFLwDvOcuNepxeOel4IiTxpwF5b3xD3E4bfSfHAEphM8AS
        w+XWwcnIDTZYZuT2RlGHzNJOzOOTc4xTI2zUaFlHHabSBdD38raVP57KwWJkW0Yapvlh7a
        W+4lo1ILH4LGv4AsSn5RCHf4zAT0mqM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-VQa9R2GuNT66oDzBJhEeSQ-1; Mon, 22 Aug 2022 17:58:47 -0400
X-MC-Unique: VQa9R2GuNT66oDzBJhEeSQ-1
Received: by mail-il1-f200.google.com with SMTP id n13-20020a056e02140d00b002dfa5464967so9170337ilo.19
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 14:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc;
        bh=mQUeuV51GD+/Z3NmS3oF64vuc80M1JzNM209IAEm6Lo=;
        b=FaVZrJzwpAzn6hMSi/FtwJzPwxAh0KjYRzGHRkJ9NJUnU80HDZW6gvdVsibWR5uPrA
         o4eYyegn/WvHiggjkljbbKVqdmt/fM8nW/6RohljEmfi7BZ1Uy0JV31rzFHe3Vo7hy1b
         Ba475B8tC0PVEN2nGFxQtPV5Ebi5EdS2MgsZbZJKJM9uXSw3ENmF0PcmbXa+QMfQ/G32
         B/edC4D6w9g5If9k2uhqFInoPg+84M2O+DQ5+4RqzIsooeP6gfTgtKTqLMT9vGUFdaaF
         Tbkq2GDAB/qUiOTcTZV8kzHDYEfNa5jtfcDxjgwvzXzsAxPUav3AyhXuPmJnpkw64zVp
         iUXA==
X-Gm-Message-State: ACgBeo14MMcsvi1/rR1EpjPdoGOjJ5Z7UPcAS0WXqmVUxj0zWbAZkjGZ
        +TOPNSeATUNTEsaNoLBXFWdK68TJkvkmBXEGFFpTjlgI9+m0BfJmZjULnyJ+YJ8Xz3quc2+HTDB
        hyPyeT8Ka6Wzx123LALWtw8U=
X-Received: by 2002:a05:6638:3892:b0:342:8aa5:a050 with SMTP id b18-20020a056638389200b003428aa5a050mr10967582jav.145.1661205511230;
        Mon, 22 Aug 2022 14:58:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ji5Aas470cfaDuYoFCQXCz8xDov2+WjpaEqjz4PP+196q6rswlxrWF7iO99xdkBAv+YQNFg==
X-Received: by 2002:a05:6638:3892:b0:342:8aa5:a050 with SMTP id b18-20020a056638389200b003428aa5a050mr10967567jav.145.1661205510943;
        Mon, 22 Aug 2022 14:58:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id g2-20020a05660203c200b006788259b526sm6276185iov.41.2022.08.22.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:58:30 -0700 (PDT)
Date:   Mon, 22 Aug 2022 15:58:28 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Cornelia Huck <cohuck@redhat.com>,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        Maor Gottlieb <maorg@nvidia.com>,
        Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <20220822155828.6fa6a961.alex.williamson@redhat.com>
In-Reply-To: <Yv4rBEeUMQyIdEzi@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
        <Yv4rBEeUMQyIdEzi@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Aug 2022 09:05:24 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Aug 17, 2022 at 01:11:38PM -0300, Jason Gunthorpe wrote:
> > dma-buf has become a way to safely acquire a handle to non-struct page
> > memory that can still have lifetime controlled by the exporter. Notably
> > RDMA can now import dma-buf FDs and build them into MRs which allows for
> > PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> > from PCI device BARs.
> > 
> > This series supports a use case for SPDK where a NVMe device will be owned
> > by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> > may directly access the NVMe CMB or directly manipulate the NVMe device's
> > doorbell using PCI P2P.
> > 
> > However, as a general mechanism, it can support many other scenarios with
> > VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> > generic and safe P2P mappings.
> > 
> > This series goes after the "Break up ioctl dispatch functions to one
> > function per ioctl" series.
> > 
> > This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf
> > 
> > Jason Gunthorpe (4):
> >   dma-buf: Add dma_buf_try_get()
> >   vfio: Add vfio_device_get()
> >   vfio_pci: Do not open code pci_try_reset_function()
> >   vfio/pci: Allow MMIO regions to be exported through dma-buf
> > 
> >  drivers/vfio/pci/Makefile           |   1 +
> >  drivers/vfio/pci/vfio_pci_config.c  |  22 ++-
> >  drivers/vfio/pci/vfio_pci_core.c    |  33 +++-
> >  drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++  
> 
> I forget about this..
> 
> Alex, do you want to start doing as Linus discused and I will rename
> this new file to "dma_buf.c" ?
> 
> Or keep this directory as having the vfio_pci_* prefix for
> consistency?

I have a hard time generating a strong opinion over file name
redundancy relative to directory structure.  By my count, over 17% of
files in drivers/ have some file name redundancy to their parent
directory structure (up to two levels).  I see we already have two
$FOO_dma_buf.c files in the tree, virtio and amdgpu among these.  In
the virtio case this is somewhat justified, to me at least, as the
virtio_dma_buf.h file exists in a shared include namespace.  However,
this justification only accounts for about 1% of such files, for many
others the redundancy exists in the include path as well.

I guess if we don't have a reason other than naming consistency and
accept an end goal to incrementally remove file name vs directory
structure redundancy where it makes sense, sure, name it dma_buf.c.
Ugh. Thanks,

Alex

