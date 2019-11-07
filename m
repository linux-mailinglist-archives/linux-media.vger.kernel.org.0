Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B1CF27C2
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 07:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfKGGsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 01:48:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43228 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725763AbfKGGsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 01:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573109310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CN2ulGtul0X2pd3Lw/bT87JsQKQsHK/UR87J4cDQl/k=;
        b=ZteAsuAvkH7Tjja8RIMyJS50GVUYcDYaPcgcEgqHwQN3ENuEcORALC7V6TqCFFKTzZwBVk
        9d4MTiIc5lm1Beuhgz8z176Q0LpkYZlKQQ1oKVJHQNcmT6vcxLDI2o3zKMTCIL1baceeM8
        CxV2B7Y4lCUYTgG44xf8fczvMoVWIPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-0cipqxXqMOu9hvOV8Hxp6w-1; Thu, 07 Nov 2019 01:48:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057661800D6B;
        Thu,  7 Nov 2019 06:48:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE6C1A7E2;
        Thu,  7 Nov 2019 06:48:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 0397416E08; Thu,  7 Nov 2019 07:48:18 +0100 (CET)
Date:   Thu, 7 Nov 2019 07:48:17 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Geoffrey McRae <geoff@hostfission.com>
Cc:     David Stevens <stevensd@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191107064817.j3sfzl6viea4qigc@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org>
 <72712fe048af1489368f7416faa92c45@hostfission.com>
MIME-Version: 1.0
In-Reply-To: <72712fe048af1489368f7416faa92c45@hostfission.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0cipqxXqMOu9hvOV8Hxp6w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2019-11-06 23:41, Gerd Hoffmann wrote:
> > On Wed, Nov 06, 2019 at 05:36:22PM +0900, David Stevens wrote:
> > > > (1) The virtio device
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > Has a single virtio queue, so the guest can send commands to regist=
er
> > > > and unregister buffers.  Buffers are allocated in guest ram.  Each =
buffer
> > > > has a list of memory ranges for the data. Each buffer also has some
> > >=20
> > > Allocating from guest ram would work most of the time, but I think
> > > it's insufficient for many use cases. It doesn't really support thing=
s
> > > such as contiguous allocations, allocations from carveouts or <4GB,
> > > protected buffers, etc.
> >=20
> > If there are additional constrains (due to gpu hardware I guess)
> > I think it is better to leave the buffer allocation to virtio-gpu.
>=20
> The entire point of this for our purposes is due to the fact that we can
> not allocate the buffer, it's either provided by the GPU driver or
> DirectX. If virtio-gpu were to allocate the buffer we might as well forge=
t
> all this and continue using the ivshmem device.

Well, virtio-gpu resources are in guest ram, like the buffers of a
virtio-buffers device would be.  So it isn't much of a difference.  If
the buffer provided by the (nvidia/amd/intel) gpu driver lives in ram
you can create a virtio-gpu resource for it.

On the linux side that is typically handled with dma-buf, one driver
exports the dma-buf and the other imports it.  virtio-gpu doesn't
support that fully yet though (import is being worked on, export is done
and will land upstream in the next merge window).

No clue how this looks like for windows guests ...

> Currently IVSHMEM is used by two projects that I am aware of, Looking
> Glass and SCREAM. While Looking Glass is solving a problem that is out of
> scope for QEMU, SCREAM is working around the audio problems in QEMU that
> have been present for years now.

Side note: sound in qemu 3.1+ should be alot better than in 2.x
versions.

cheers,
  Gerd

