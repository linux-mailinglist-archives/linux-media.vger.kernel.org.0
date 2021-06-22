Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB37C3B0406
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 14:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhFVMSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 08:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhFVMSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 08:18:06 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C669FC061756
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 05:15:48 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id f16so8240766qvs.7
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 05:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KjofJoQyUwiIAacJkE1UxWn3Mo9VplV7FtMGlU0RWLM=;
        b=h97BE10eQvAs7iuAp3KSz/AKkEBSJK+RWgPE2bKUnLoQdvOUv3nQXFBCT3PEWlx2Sl
         E/e2cYiumFAEGqj4jTurYIMnn2zsv1UeEuBl9zhKLEnlbb/EkISQicJQPDbtplfY7NkM
         co8/vN6NEYxfoOaungf0V4XWEA/Cmf7QBmCZBDNRHWHAx6heTvyghfkmTuWnPgQqEDpW
         mESlAUjUeEAGF0vwR/v1AwASBsRjSyjZOYhs7r1/kwL3GwXPKGLxfpNXjMb/amd4m48L
         RTR9a5HRMe1vZ+UVKk7QU3T0ut/x3x7ci4FJwEzm6Jq6XV4LXljZKU5h4jBZaF4LdabI
         BUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KjofJoQyUwiIAacJkE1UxWn3Mo9VplV7FtMGlU0RWLM=;
        b=GHaXrEn/EbhQMlJciC6qcP+99IuEQTDvHHc0tiRrbQyp8r2T1/IOw2BdITKdPBm0O1
         OfTPhDO9QR7RValGRK/cjzKDdV5tBPuSVAy5daKJpxhHNRUbK/QR8hicniMabDhuALm5
         X/yZYxTPJpVQffPQ4V4JcuPpGDhkOaK91MpsOwhJGVdytlu6a/as3uD8PtX4yroY2JPl
         PNmiWMelapEH/dRxpEZF97IQWX8PWt0bZXyy2RjrqBBeAJjXcwf/WePPGeOlluvVFSp7
         6WgH2oLc/RG+gV5SMYsOE9wpuEZ+HnIup/xaOTOAfKjiDfA62qxFf3fEvjQjZ0lgIZaA
         pNew==
X-Gm-Message-State: AOAM5328mU25770fomll1fwozr1kwEDKkXIKoLiolIcwrzj2nAwc1X3E
        MTKzjDCbjN9qxtOTtlfqKzbjPg==
X-Google-Smtp-Source: ABdhPJy23RwHWwohPH/Gr7a/6x+XnMYskE5GrjrV3VrRGHji6PDv+ikMUtwLNa4CYmg0qZGAziatcw==
X-Received: by 2002:a0c:aacd:: with SMTP id g13mr1227641qvb.22.1624364148049;
        Tue, 22 Jun 2021 05:15:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id l123sm5662330qke.10.2021.06.22.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:15:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lvfJj-00A9d2-05; Tue, 22 Jun 2021 09:15:47 -0300
Date:   Tue, 22 Jun 2021 09:15:46 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Tomer Tayar <ttayar@habana.ai>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622121546.GN1096940@ziepe.ca>
References: <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 03:04:30PM +0300, Oded Gabbay wrote:
> On Tue, Jun 22, 2021 at 3:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> > > On Tue, Jun 22, 2021 at 9:37 AM Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >
> > > > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > > > >
> > > > >> Another thing I want to emphasize is that we are doing p2p only
> > > > >> through the export/import of the FD. We do *not* allow the user to
> > > > >> mmap the dma-buf as we do not support direct IO. So there is no access
> > > > >> to these pages through the userspace.
> > > > > Arguably mmaping the memory is a better choice, and is the direction
> > > > > that Logan's series goes in. Here the use of DMABUF was specifically
> > > > > designed to allow hitless revokation of the memory, which this isn't
> > > > > even using.
> > > >
> > > > The major problem with this approach is that DMA-buf is also used for
> > > > memory which isn't CPU accessible.
> >
> > That isn't an issue here because the memory is only intended to be
> > used with P2P transfers so it must be CPU accessible.
> >
> > > > That was one of the reasons we didn't even considered using the mapping
> > > > memory approach for GPUs.
> >
> > Well, now we have DEVICE_PRIVATE memory that can meet this need
> > too.. Just nobody has wired it up to hmm_range_fault()
> >
> > > > > So you are taking the hit of very limited hardware support and reduced
> > > > > performance just to squeeze into DMABUF..
> > >
> > > Thanks Jason for the clarification, but I honestly prefer to use
> > > DMA-BUF at the moment.
> > > It gives us just what we need (even more than what we need as you
> > > pointed out), it is *already* integrated and tested in the RDMA
> > > subsystem, and I'm feeling comfortable using it as I'm somewhat
> > > familiar with it from my AMD days.
> >
> > You still have the issue that this patch is doing all of this P2P
> > stuff wrong - following the already NAK'd AMD approach.
> 
> Could you please point me exactly to the lines of code that are wrong
> in your opinion ?

1) Setting sg_page to NULL
2) 'mapping' pages for P2P DMA without going through the iommu
3) Allowing P2P DMA without using the p2p dma API to validate that it
   can work at all in the first place.

All of these result in functional bugs in certain system
configurations.

Jason
