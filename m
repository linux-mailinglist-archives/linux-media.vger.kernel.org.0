Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA2D10281F
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 16:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfKSPbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 10:31:36 -0500
Received: from mga14.intel.com ([192.55.52.115]:4773 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727505AbfKSPbf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 10:31:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Nov 2019 07:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; 
   d="scan'208";a="209227174"
Received: from sstrehla-mobl1.ger.corp.intel.com ([10.252.16.202])
  by orsmga003.jf.intel.com with ESMTP; 19 Nov 2019 07:31:28 -0800
Message-ID: <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
From:   Liam Girdwood <liam.r.girdwood@linux.intel.com>
To:     Gurchetan Singh <gurchetansingh@chromium.org>
Cc:     David Stevens <stevensd@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 19 Nov 2019 15:31:27 +0000
In-Reply-To: <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
         <20191106084344.GB189998@stefanha-x1.localdomain>
         <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
         <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
         <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
         <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
         <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-11-12 at 14:55 -0800, Gurchetan Singh wrote:
> On Tue, Nov 12, 2019 at 5:56 AM Liam Girdwood
> <liam.r.girdwood@linux.intel.com> wrote:
> > 
> > On Mon, 2019-11-11 at 16:54 -0800, Gurchetan Singh wrote:
> > > On Tue, Nov 5, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com>
> > > wrote:
> > > > Each buffer also has some properties to carry metadata, some
> > > > fixed
> > > > (id, size, application), but
> > > > also allow free form (name = value, framebuffers would have
> > > > width/height/stride/format for example).
> > > 
> > > Sounds a lot like the recently added DMA_BUF_SET_NAME ioctls:
> > > 
> > > https://patchwork.freedesktop.org/patch/310349/
> > > 
> > > For virtio-wayland + virtio-vdec, the problem is sharing -- not
> > > allocation.
> > > 
> > 
> > Audio also needs to share buffers with firmware running on DSPs.
> > 
> > > As the buffer reaches a kernel boundary, it's properties devolve
> > > into
> > > [fd, size].  Userspace can typically handle sharing
> > > metadata.  The
> > > issue is the guest dma-buf fd doesn't mean anything on the host.
> > > 
> > > One scenario could be:
> > > 
> > > 1) Guest userspace (say, gralloc) allocates using virtio-
> > > gpu.  When
> > > allocating, we call uuidgen() and then pass that via
> > > RESOURCE_CREATE
> > > hypercall to the host.
> > > 2) When exporting the dma-buf, we call DMA_BUF_SET_NAME (the
> > > buffer
> > > name will be "virtgpu-buffer-${UUID}").
> > > 3) When importing, virtio-{vdec, video} reads the dma-buf name in
> > > userspace, and calls fd to handle.  The name is sent to the host
> > > via
> > > a
> > > hypercall, giving host virtio-{vdec, video} enough information to
> > > identify the buffer.
> > > 
> > > This solution is entirely userspace -- we can probably come up
> > > with
> > > something in kernel space [generate_random_uuid()] if need
> > > be.  We
> > > only need two universal IDs: {device ID, buffer ID}.
> > > 
> > 
> > I need something where I can take a guest buffer and then convert
> > it to
> > physical scatter gather page list. I can then either pass the SG
> > page
> > list to the DSP firmware (for DMAC IP programming) or have the host
> > driver program the DMAC directly using the page list (who programs
> > DMAC
> > depends on DSP architecture).
> 
> So you need the HW address space from a guest allocation? 

Yes.

>  Would your
> allocation hypercalls use something like the virtio_gpu_mem_entry
> (virtio_gpu.h) and the draft virtio_video_mem_entry (draft)?

IIUC, this looks like generic SG buffer allocation ?

> 
> struct {
>         __le64 addr;
>         __le32 length;
>         __le32 padding;
> };
> 
> /* VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING */
> struct virtio_gpu_resource_attach_backing {
>         struct virtio_gpu_ctrl_hdr hdr;
>         __le32 resource_id;
>         __le32 nr_entries;
>       *struct struct virtio_gpu_mem_entry */
> };
> 
> struct virtio_video_mem_entry {
>     __le64 addr;
>     __le32 length;
>     __u8 padding[4];
> };
> 
> struct virtio_video_resource_attach_backing {
>     struct virtio_video_ctrl_hdr hdr;
>     __le32 resource_id;
>     __le32 nr_entries;
> };
> 
> > 
> > DSP FW has no access to userspace so we would need some additional
> > API
> > on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?
> 
> The dma-buf api currently can share guest memory sg-lists.

Ok, IIUC buffers can either be shared using the GPU proposed APIs
(above) or using the dma-buf API to share via userspace ? My preference
would be to use teh more direct GPU APIs sending physical page
addresses from Guest to device driver. I guess this is your use case
too ?

Thanks

Liam

> 
> > 
> > Liam
> > 
> > 
> > 
> > -----------------------------------------------------------------
> > ----
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: 
> > virtio-dev-help@lists.oasis-open.org
> > 
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 

