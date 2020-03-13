Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43D81844DA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 11:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMK1H convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 13 Mar 2020 06:27:07 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:46265 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgCMK1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 06:27:07 -0400
Received: from spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116])
        by plasma.jpberlin.de (Postfix) with ESMTP id 3D7A1BAC95;
        Fri, 13 Mar 2020 11:27:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id 9NRdRVlKWcUP; Fri, 13 Mar 2020 11:27:02 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 1F33CBBA05;
        Fri, 13 Mar 2020 11:27:02 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 13 Mar
 2020 11:26:58 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <virtio-dev@lists.oasis-open.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>, <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
Date:   Fri, 13 Mar 2020 11:27:01 +0100
Message-ID: <6194402.K2JlShyGXD@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAAFQd5BdS2oT+vgM3Qg64wPqWdPRi1uE6ZmOPwXwudv==3JQVA@mail.gmail.com>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <12620787.dW097sEU6C@os-lin-dmo> <CAAFQd5BdS2oT+vgM3Qg64wPqWdPRi1uE6ZmOPwXwudv==3JQVA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Freitag, 13. März 2020 11:05:35 CET Tomasz Figa wrote:
> On Thu, Mar 12, 2020 at 12:48 PM Dmitry Sepp
> 
> <dmitry.sepp@opensynergy.com> wrote:
> > Hi Hans,
> > 
> > One more thing:
> > > GFP_DMA? That's unusual. I'd expect GFP_DMA32. All V4L2 drivers use
> > > that.
> > 
> > GFP_DMA32 had no effect for me on arm64. Probably I need to recheck.
> 
> What's the reason to use any specific GFP flags at all? GFP_DMA(32)
> memory in the guest would typically correspond to host pages without
> any specific location guarantee.
> 

Typically, but not always, especially for non x86. Say, some platforms don't 
have IOMMUs for codec devices and those devices require physically contig low 
memory. We had to find a way to handle that.

Best regards,
Dmitry.

> Best regards,
> Tomasz
> 
> > Best regards,
> > Dmitry.
> > 
> > On Donnerstag, 12. März 2020 11:18:26 CET Hans Verkuil wrote:
> > > On 3/12/20 11:15 AM, Dmitry Sepp wrote:
> > > > Hi Hans,
> > > > 
> > > > Thank you for your great detailed review!
> > > > 
> > > > I won't provide inline answers as your comments totally make sense.
> > > > There
> > > > is>
> > > > 
> > > > only one thing I want to mention:
> > > >>> + struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
> > > >> 
> > > >> Why is this virtio specific? Any reason for not using
> > > >> VIDEO_MAX_PLANES?
> > > > 
> > > > I'd say this is because VIDEO_MAX_PLANES does not exist outside of the
> > > > Linux OS, so for whatever other system we need a virtio specific
> > > > definition.
> > > 
> > > OK, good reason :-)
> > > 
> > > It's probably a good thing to add a comment where
> > > VIRTIO_VIDEO_MAX_PLANES is defined that explains this.
> > > 
> > > Regards,
> > > 
> > >       Hans


