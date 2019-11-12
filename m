Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3889BF9127
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 14:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfKLN4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 08:56:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:32849 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727201AbfKLN4u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 08:56:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 05:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="194319994"
Received: from hbenchen-mobl1.ger.corp.intel.com ([10.251.95.209])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2019 05:56:45 -0800
Message-ID: <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
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
Date:   Tue, 12 Nov 2019 13:56:43 +0000
In-Reply-To: <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
         <20191106084344.GB189998@stefanha-x1.localdomain>
         <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
         <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
         <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-11-11 at 16:54 -0800, Gurchetan Singh wrote:
> On Tue, Nov 5, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com>
> wrote:
> > Each buffer also has some properties to carry metadata, some fixed
> > (id, size, application), but
> > also allow free form (name = value, framebuffers would have
> > width/height/stride/format for example).
> 
> Sounds a lot like the recently added DMA_BUF_SET_NAME ioctls:
> 
> https://patchwork.freedesktop.org/patch/310349/
> 
> For virtio-wayland + virtio-vdec, the problem is sharing -- not
> allocation.
> 

Audio also needs to share buffers with firmware running on DSPs.

> As the buffer reaches a kernel boundary, it's properties devolve into
> [fd, size].  Userspace can typically handle sharing metadata.  The
> issue is the guest dma-buf fd doesn't mean anything on the host.
> 
> One scenario could be:
> 
> 1) Guest userspace (say, gralloc) allocates using virtio-gpu.  When
> allocating, we call uuidgen() and then pass that via RESOURCE_CREATE
> hypercall to the host.
> 2) When exporting the dma-buf, we call DMA_BUF_SET_NAME (the buffer
> name will be "virtgpu-buffer-${UUID}").
> 3) When importing, virtio-{vdec, video} reads the dma-buf name in
> userspace, and calls fd to handle.  The name is sent to the host via
> a
> hypercall, giving host virtio-{vdec, video} enough information to
> identify the buffer.
> 
> This solution is entirely userspace -- we can probably come up with
> something in kernel space [generate_random_uuid()] if need be.  We
> only need two universal IDs: {device ID, buffer ID}.
> 

I need something where I can take a guest buffer and then convert it to
physical scatter gather page list. I can then either pass the SG page
list to the DSP firmware (for DMAC IP programming) or have the host
driver program the DMAC directly using the page list (who programs DMAC
depends on DSP architecture).

DSP FW has no access to userspace so we would need some additional API
on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?

Liam


