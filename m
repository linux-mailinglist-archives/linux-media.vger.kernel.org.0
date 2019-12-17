Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96357123140
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 17:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfLQQOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 11:14:06 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:46513 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfLQQOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 11:14:06 -0500
Received: from spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122])
        by plasma.jpberlin.de (Postfix) with ESMTP id 8C821B78B7;
        Tue, 17 Dec 2019 17:14:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id c-2r51Z0mv7E; Tue, 17 Dec 2019 17:14:00 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 069ECB6E4B;
        Tue, 17 Dec 2019 17:13:59 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 17:13:59 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
CC:     Gerd Hoffmann <kraxel@redhat.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <virtio-dev@lists.oasis-open.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Tue, 17 Dec 2019 17:13:59 +0100
Message-ID: <15520793.X85Ks0aH1j@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90VcaXDXgmJ1-aDMu-o_zFCaJ4+rxN0FxHh7x6Q8MTPAr-jw@mail.gmail.com>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <20191217133945.oxnassyjr6hwtjbf@sirius.home.kraxel.org> <CAD90VcaXDXgmJ1-aDMu-o_zFCaJ4+rxN0FxHh7x6Q8MTPAr-jw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Dienstag, 17. Dezember 2019 15:09:16 CET Keiichi Watanabe wrote:
> Hi,
> 
> Thanks Tomasz and Gerd for the suggestions and information.
> 
> On Tue, Dec 17, 2019 at 10:39 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   Hi,
> >   
> > > On the host side, the encode and decode APIs are different as well, so
> > > having separate implementation decoder and encoder, possibly just
> > > sharing some helper code, would make much more sense.
> > 
> > When going down that route I'd suggest to use two device ids (even when
> > specifying both variants in one spec section and one header file due to
> > the overlaps) instead of feature flags.
> 
> Sounds good. It makes sense to use different device IDs for different
> devices.
Does this mean one driver handles both? Or we have two separate drivers?

> > > > I don't think using fourcc is a problem, and given that both drm and
> > > > v4l2 use fourcc already this would be a good choice I think.
> > > 
> > > Both DRM and V4L2 use two mutually incompatible sets of FourCCs, so
> > > I'm not sure how it could be a good choice. At least unless we decide
> > > to pick a specific set of FourCC. It doesn't help that Windows/DirectX
> > > has its own set of FourCCs that's again slightly different than the
> > > two mentioned before.
> > 
> > Ouch, wasn't aware of that.  That makes reusing fourcc codes much less
> > useful.
> > 
> > > > But the definition should be more specific than just "fourcc".  Best
> > > > would be to explicitly list and define each format supported by the
> > > > spec.
> > > 
> > > Why not be consistent with virtio-gpu and just define new formats as
> > > we add support for them as sequential integers?
> > 
> > Yes, lets do that.
> 
> It makes sense. I seems to have overestimated FourCC.
This is what was actually done in the driver code already (it is a bit ahead 
of the spec, but I guess no one has looked at it so far).

Regards,
Dmitry.

> 
> Best,
> Keiichi
> 
> > cheers,
> > 
> >   Gerd


