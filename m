Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F20A1038B7
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbfKTL3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:29:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55641 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728376AbfKTL3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574249376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/frTHLbEQLohoDTF5sxBdeuJOInXS8sOQJQOPC6Pjrc=;
        b=PluPlnuSelR90sGyGcHxeRmGLagQOLfbShl3fpX6JKuvvUIEYuCU2u9Il6eo0+ikr5/Lro
        +te1B2rL0TpYf1w7FwLViWw9fB8sc7NsFGF7C4sN/J/FZfXEHWsxwzAEAbCS9kjzDv+pdj
        rg+FN2c+GKijrskizyz68EsTuQzl5O4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-54jo2sElOAWEP-651707iw-1; Wed, 20 Nov 2019 06:29:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D20781074FB2;
        Wed, 20 Nov 2019 11:29:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 570392A18A;
        Wed, 20 Nov 2019 11:29:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 35FC616E08; Wed, 20 Nov 2019 12:29:29 +0100 (CET)
Date:   Wed, 20 Nov 2019 12:29:29 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
 <1573181413.STYvEGL1rf@os-lin-dmo>
 <CAAFQd5CkTxCYhn70o5oiR4uLA7QyRMUw-XrRWorwZnwXGK0pDQ@mail.gmail.com>
 <20191108090506.jw4t46d3o4ooy7ns@sirius.home.kraxel.org>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 54jo2sElOAWEP-651707iw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > > > 3. No support for getting plane requirements from the device (sg vs=
 contig,
> > > > size, stride alignment, plane count).
> > >
> > > There is actually a bigger difference that results in that. Vdec
> > > assumes host-allocated buffers coming from a different device, e.g.
> > > virtio-gpu and the host having the right knowledge to allocate the
> > > buffers correctly. This is related to the fact that it's generally
> > > difficult to convey all the allocation constraints in a generic
> > > manner.
> >
> > Yep, buffer handling is tricky, especially when it comes to decoding
> > directly to gpu buffers and also when supporting playback of
> > drm-protected streams where the guest might not be allowed to access
> > the stream data.

> Also, if we decide to have a buffer sharing device as Gerd suggested
> in a different thread,
> we'll get less overlaps between video codec feature and camera feature.
> e.g. VIRTIO_VIDEO_T_RESOURCE_* would be simplified. (or removed?)

Disclaimer: Havn't found the time yet to go over both virtio-video and
virtio-vdec in detail.

> As Tomasz said, I think virtio-vdec can be modified to support
> encoding as well without big changes.  I'm happy to update our
> protocol and driver implementation to support encoding if needed.

I think it makes sense to have a rough plan first ;)
Is there a virtio-video implementation too?

When it comes to buffer handling:  I don't like that virtio-vdec depends
on virtio-gpu for buffer handling.  Allowing sharing buffers between
virtio-vdec and virtio-gpu (and possibly other devices) makes sense as
an optional extension.  But IMO the encoder/decoder device should be
able to operate as stand-alone device.

cheers,
  Gerd

