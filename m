Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1140D103703
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 10:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbfKTJyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 04:54:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40326 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726450AbfKTJyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 04:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574243640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PSNLpSLgx5w3Dbhz4nM58lFypQMHwE8ihrCJxNop32Q=;
        b=G0bXUotgAOO3cqshudTUgYPvJT6jwmXzh9MT5beRdROnuqIcZbGvxtNAAeG+81zkclIRod
        iYgj0Ry0z4rU6qjho9nFSUn4vK+FIuJSafr4KHqDMclKGmJkCsV3AlNLivR0IIHecZdy/y
        ybcjmvN2WWVW1L6RnHS/DgQBNSl7eJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-qWi47eunMXOdSOcEtNu-ag-1; Wed, 20 Nov 2019 04:53:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731B3107ACC4;
        Wed, 20 Nov 2019 09:53:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BBA5328DCB;
        Wed, 20 Nov 2019 09:53:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 8157316E05; Wed, 20 Nov 2019 10:53:49 +0100 (CET)
Date:   Wed, 20 Nov 2019 10:53:49 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Liam Girdwood <liam.r.girdwood@linux.intel.com>
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
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
Message-ID: <20191120095349.oobeosin3lujgcja@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
 <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
 <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
 <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
 <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
 <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qWi47eunMXOdSOcEtNu-ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > > DSP FW has no access to userspace so we would need some additional
> > > API
> > > on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?
> >=20
> > The dma-buf api currently can share guest memory sg-lists.
>=20
> Ok, IIUC buffers can either be shared using the GPU proposed APIs
> (above) or using the dma-buf API to share via userspace ? My preference
> would be to use teh more direct GPU APIs sending physical page
> addresses from Guest to device driver. I guess this is your use case
> too ?

I'm not convinced this is useful for audio ...

I basically see two modes of operation which are useful:

  (1) send audio data via virtqueue.
  (2) map host audio buffers into the guest address space.

The audio driver api (i.e. alsa) typically allows to mmap() the audio
data buffers, so it is the host audio driver which handles the
allocation.  Let the audio hardware dma from/to userspace-allocated
buffers is not possible[1], but we would need that to allow qemu (or
other vmms) use guest-allocated buffers.

cheers,
  Gerd

[1] Disclaimer: It's been a while I looked at alsa more closely, so
    there is a chance this might have changed without /me noticing.

