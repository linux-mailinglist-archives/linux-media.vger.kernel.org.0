Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0741D182DA1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgCLK3q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Mar 2020 06:29:46 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:58259 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgCLK3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:29:46 -0400
Received: from spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116])
        by plasma.jpberlin.de (Postfix) with ESMTP id EF12EBBF62;
        Thu, 12 Mar 2020 11:29:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id gHerBSLszxZn; Thu, 12 Mar 2020 11:29:39 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 478A4BD71D;
        Thu, 12 Mar 2020 11:29:39 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 12 Mar
 2020 11:29:38 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        <virtio-dev@lists.oasis-open.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
Date:   Thu, 12 Mar 2020 11:29:38 +0100
Message-ID: <1799967.VLH7GnMWUR@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <1ac18708-262f-c751-d955-267931270028@xs4all.nl>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com> <1ac18708-262f-c751-d955-267931270028@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I'm not sure about crosvm, for us it is probably still feasible to implement 
FWHT in the device (but it is unfortunately not supposed to be upstreamed 
yet).

The main question is what would be the proper user-space tool to test that? Is 
v4l2-ctl OK for that? As for gstreamer, AFAIK it does not respect the v4l2 
Video Decoder Interface Spec and we have seen some issues with it.

Best regards,
Dmitry.

On Donnerstag, 12. März 2020 10:54:35 CET Hans Verkuil wrote:
> On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
> > Hi Hans,
> > 
> > On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >> Hi Dmitry,
> >> 
> >> On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> >>> Hi all,
> >>> 
> >>> This is a v4l2 virtio video driver for the virtio-video device
> >>> specification v3 [1].
> >>> 
> >>> The first version of the driver was introduced here [2].
> >>> 
> >>> Changes v1 -> v2:
> >>> * support the v3 spec (mostly)
> >>> * add a module parameter to ask for pages from ZONE_DMA
> >>> 
> >>> What is not implemented:
> >>> * Plane layout flags should be used to propagate number of planes to
> >>> 
> >>>   user-space
> >>> 
> >>> * There is no real use of stream creation with bitstream format in the
> >>> 
> >>>   parameter list. The driver just uses the first bitstream format from
> >>>   the list.
> >>> 
> >>> * Setting bitrate is done in a different way compared to the spec. This
> >>> 
> >>>   is because it has been already agreed on that the way the spec
> >>>   currently describes it requires changes.
> >>> 
> >>> Potential improvements:
> >>> * Do not send stream_create from open. Use corresponding state machine
> >>> 
> >>>   condition to do this.
> >>> 
> >>> * Do not send stream_destroy from close. Do it in reqbufs(0).
> >>> * Cache format and control settings. Reduce calls to the device.
> >> 
> >> Some general notes:
> >> 
> >> Before this can be merged it needs to pass v4l2-compliance.
> >> 
> >> I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
> >> allow testing with the vicodec emulation driver. This will also
> >> allow testing all sorts of corner cases without requiring special
> >> hardware.
> > 
> > I agree that it's great if we could test virtio-video with vicodec,
> > but I wonder if supporting FWHT is actually needed for the initial
> > patch.
> > Though it wouldn't be difficult to support FWHT in the driver, we also
> > needs to support it in the host's hypervisor to test it. It's not easy
> > for our hypervisor to support FWHT, as it doesn't talk to v4l2 driver
> > directly.
> > Without the host-side implementation, it makes no sense to support it.
> > Also, if we support FWHT, we should have the format in a list of
> > supported formats in the virtio specification. However, I'm not sure
> > if FWHT is a general codec enough to be added in the spec, which
> > shouldn't be specific to Linux.
> 
> Good point, I didn't know that.
> 
> Is it possible to add support for FWHT under a linux debug/test option?
> 
> It's really the main reason for having this, since you would never use
> this in production code. But it is so nice to have for regression testing.
> 
> Regards,
> 
> 	Hans
> 
> > Best regards,
> > Keiichi
> > 
> >> Regards,
> >> 
> >>         Hans
> >>> 
> >>> Best regards,
> >>> Dmitry.
> >>> 
> >>> [1] https://markmail.org/message/dmw3pr4fuajvarth
> >>> [2] https://markmail.org/message/wnnv6r6myvgb5at6


