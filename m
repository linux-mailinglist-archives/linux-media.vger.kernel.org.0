Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E00C10AB59
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 08:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfK0H6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 02:58:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41231 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726240AbfK0H6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 02:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574841494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WdcPJ0Dwg19OMCk56up1PNjeYkMKncWwty2/pCthIu0=;
        b=BpsFZlzED/vUSdFucMqV/NuVEFJQTeZsVyGuQyHEmP91i2PYfBhQhRHjDEEkMB+7Oieu9k
        I2EPvLvLCnBYTN6HiarcNUwOOA8klqRD4bxaBqx1SfYlx/QZZ6T4SUg4zcq0ewX4+PKIyM
        t0+t5gi1PGLO1njNB6JdMhlN/ovbSzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-HLqzj73PNTm1dOZITTNkCQ-1; Wed, 27 Nov 2019 02:58:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B34107ACE4;
        Wed, 27 Nov 2019 07:58:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8F560BE2;
        Wed, 27 Nov 2019 07:58:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 5BCF416E18; Wed, 27 Nov 2019 08:58:03 +0100 (CET)
Date:   Wed, 27 Nov 2019 08:58:03 +0100
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
Message-ID: <20191127075803.e5i72nzayi4t6aw2@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
 <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
 <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
 <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
 <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
 <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
 <20191120095349.oobeosin3lujgcja@sirius.home.kraxel.org>
 <296b7d844a283996a16769ecf3daade5198ae307.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <296b7d844a283996a16769ecf3daade5198ae307.camel@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: HLqzj73PNTm1dOZITTNkCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > I'm not convinced this is useful for audio ...
> >=20
> > I basically see two modes of operation which are useful:
> >=20
> >   (1) send audio data via virtqueue.
> >   (2) map host audio buffers into the guest address space.
> >=20
> > The audio driver api (i.e. alsa) typically allows to mmap() the audio
> > data buffers, so it is the host audio driver which handles the
> > allocation.=20
>=20
> Yes, in regular non VM mode, it's the host driver which allocs the
> buffers.
>=20
> My end goal is to be able to share physical SG pages from host to
> guests and HW (including DSP firmwares).=20

Yep.  So the host driver would allocate the pages, in a way that the hw
can access them of course.  qemu (or another vmm) would mmap() those
buffer pages, using the usual sound app interface, which would be alsa
on linux.

Virtio got support for shared memory recently (it is in the version 1.2
draft), virtio-pci transport uses a pci bar for the shared memory
regions.  qemu (or other vmms) can use that to map the buffer pages into
guest address space.

There are plans use shared memory in virtio-gpu too, for pretty much the
same reasons.  Some kinds of gpu buffers must be allocated by the host
gpu driver, to make sure the host hardware can use the buffers as
intended.

> >  Let the audio hardware dma from/to userspace-allocated
> > buffers is not possible[1], but we would need that to allow qemu (or
> > other vmms) use guest-allocated buffers.
>=20
> My misunderstanding here on how the various proposals being discussed
> all pass buffers between guests & host. I'm reading that some are
> passing buffers via userspace descriptors and this would not be
> workable for audio.

Yep, dma-buf based buffer passing doesn't help much for audio.

cheers,
  Gerd

