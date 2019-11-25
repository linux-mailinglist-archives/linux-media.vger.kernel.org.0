Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EE410921E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 17:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbfKYQq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 11:46:57 -0500
Received: from mga18.intel.com ([134.134.136.126]:21041 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728871AbfKYQq5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 11:46:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 08:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; 
   d="scan'208";a="202419454"
Received: from mpawlows-mobl2.ger.corp.intel.com ([10.252.20.57])
  by orsmga008.jf.intel.com with ESMTP; 25 Nov 2019 08:46:48 -0800
Message-ID: <296b7d844a283996a16769ecf3daade5198ae307.camel@linux.intel.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
From:   Liam Girdwood <liam.r.girdwood@linux.intel.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Gurchetan Singh <gurchetansingh@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
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
Date:   Mon, 25 Nov 2019 16:46:49 +0000
In-Reply-To: <20191120095349.oobeosin3lujgcja@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
         <20191106084344.GB189998@stefanha-x1.localdomain>
         <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
         <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
         <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
         <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
         <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
         <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
         <20191120095349.oobeosin3lujgcja@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-11-20 at 10:53 +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > > DSP FW has no access to userspace so we would need some
> > > > additional
> > > > API
> > > > on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?
> > > 
> > > The dma-buf api currently can share guest memory sg-lists.
> > 
> > Ok, IIUC buffers can either be shared using the GPU proposed APIs
> > (above) or using the dma-buf API to share via userspace ? My
> > preference
> > would be to use teh more direct GPU APIs sending physical page
> > addresses from Guest to device driver. I guess this is your use
> > case
> > too ?
> 
> I'm not convinced this is useful for audio ...
> 
> I basically see two modes of operation which are useful:
> 
>   (1) send audio data via virtqueue.
>   (2) map host audio buffers into the guest address space.
> 
> The audio driver api (i.e. alsa) typically allows to mmap() the audio
> data buffers, so it is the host audio driver which handles the
> allocation. 

Yes, in regular non VM mode, it's the host driver which allocs the
buffers.

My end goal is to be able to share physical SG pages from host to
guests and HW (including DSP firmwares). 

>  Let the audio hardware dma from/to userspace-allocated
> buffers is not possible[1], but we would need that to allow qemu (or
> other vmms) use guest-allocated buffers.

My misunderstanding here on how the various proposals being discussed
all pass buffers between guests & host. I'm reading that some are
passing buffers via userspace descriptors and this would not be
workable for audio.

> 
> cheers,
>   Gerd
> 
> [1] Disclaimer: It's been a while I looked at alsa more closely, so
>     there is a chance this might have changed without /me noticing.
> 

Your all good here from audio. Disclaimer: I'm new to virtio.

Liam 


