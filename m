Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55791050E3
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 11:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfKUKzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 05:55:06 -0500
Received: from plasma31.jpberlin.de ([80.241.56.82]:44753 "EHLO
        plasma31.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfKUKzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 05:55:05 -0500
Received: from spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123])
        by plasma.jpberlin.de (Postfix) with ESMTP id 311E5100AAB;
        Thu, 21 Nov 2019 11:55:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.76])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id mWN6jxUF2glb; Thu, 21 Nov 2019 11:54:59 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 80B5D10077C;
        Thu, 21 Nov 2019 11:54:58 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 21 Nov
 2019 11:54:57 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>
CC:     Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Thu, 21 Nov 2019 11:54:57 +0100
Message-ID: <7736193.Whgddqjo8n@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com> <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gerd,

On Mittwoch, 20. November 2019 12:29:29 CET Gerd Hoffmann wrote:
>   Hi,
> 
> > > > > 3. No support for getting plane requirements from the device (sg vs
> > > > > contig,
> > > > > size, stride alignment, plane count).
> > > > 
> > > > There is actually a bigger difference that results in that. Vdec
> > > > assumes host-allocated buffers coming from a different device, e.g.
> > > > virtio-gpu and the host having the right knowledge to allocate the
> > > > buffers correctly. This is related to the fact that it's generally
> > > > difficult to convey all the allocation constraints in a generic
> > > > manner.
> > > 
> > > Yep, buffer handling is tricky, especially when it comes to decoding
> > > directly to gpu buffers and also when supporting playback of
> > > drm-protected streams where the guest might not be allowed to access
> > > the stream data.
> > 
> > Also, if we decide to have a buffer sharing device as Gerd suggested
> > in a different thread,
> > we'll get less overlaps between video codec feature and camera feature.
> > e.g. VIRTIO_VIDEO_T_RESOURCE_* would be simplified. (or removed?)
> 
> Disclaimer: Havn't found the time yet to go over both virtio-video and
> virtio-vdec in detail.
> 
> > As Tomasz said, I think virtio-vdec can be modified to support
> > encoding as well without big changes.  I'm happy to update our
> > protocol and driver implementation to support encoding if needed.
> 
> I think it makes sense to have a rough plan first ;)
> Is there a virtio-video implementation too?
Yes, of course. We will be ready to share the code very soon.

Regards,
Dmitry.

> 
> When it comes to buffer handling:  I don't like that virtio-vdec depends
> on virtio-gpu for buffer handling.  Allowing sharing buffers between
> virtio-vdec and virtio-gpu (and possibly other devices) makes sense as
> an optional extension.  But IMO the encoder/decoder device should be
> able to operate as stand-alone device.
> 
> cheers,
>   Gerd
> 
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org


