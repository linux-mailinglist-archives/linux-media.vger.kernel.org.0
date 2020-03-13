Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9741F18446E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 11:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgCMKJU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 13 Mar 2020 06:09:20 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:43631 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgCMKJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 06:09:20 -0400
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id E1464BB971;
        Fri, 13 Mar 2020 11:09:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id Kx-_Q2A8IwME; Fri, 13 Mar 2020 11:09:13 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 7A89CBB23F;
        Fri, 13 Mar 2020 11:09:12 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 13 Mar
 2020 11:09:09 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Keiichi Watanabe <keiichiw@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <virtio-dev@lists.oasis-open.org>,
        "Alexandre Courbot" <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        "Frediano Ziglio" <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
Date:   Fri, 13 Mar 2020 11:09:11 +0100
Message-ID: <35350330.XM6RcZxFsP@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90VcZLD8keTBXKpK4u-E4st+B3_O1xkb7qgVZMc_ekBjwtCg@mail.gmail.com>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <75f3a24ac5cd4f656aadf4312bdbcb70a6803a6e.camel@ndufresne.ca> <CAD90VcZLD8keTBXKpK4u-E4st+B3_O1xkb7qgVZMc_ekBjwtCg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas, Keiichi,

On Freitag, 13. März 2020 08:54:13 CET Keiichi Watanabe wrote:
> Hi Nicolas,
> 
> On Fri, Mar 13, 2020 at 11:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> 
wrote:
> > Hi Dimitry,
> > 
> > Le jeudi 12 mars 2020 à 11:29 +0100, Dmitry Sepp a écrit :
> > > Hi Hans,
> > > 
> > > I'm not sure about crosvm, for us it is probably still feasible to
> > > implement FWHT in the device (but it is unfortunately not supposed to
> > > be upstreamed yet).
> > > 
> > > The main question is what would be the proper user-space tool to test
> > > that? Is v4l2-ctl OK for that? As for gstreamer, AFAIK it does not
> > > respect the v4l2 Video Decoder Interface Spec and we have seen some
> > > issues with it.> 
> > GStreamer element has been implemented to support what real drivers do,
> > not what the spec suggest should be done. AFAIC, not all drivers have
> > been updated with all the new features required by the spec. And the
> > new features are not compatible with drivers that are not ported, so it
> > creates a lot of complexity for userspace to stay backward compatible.
> > Though, the spec should allow drivers to stay backward compatible, if
> > not, we'd be very happy to learn why.
> > 
> > About the other issues, I'd be very happy to learn what they are, it's
> > the first feedback I get from your team thus far. Please feel free to
> > file issues or send me (or gstreamer-devel list) an email.
> > 
> > In term of userspace, please consider FFMPEG also, as it's support for
> > V4L2 Stateful CODECs has gained momentum. It is again implemented to
> > support real drivers, but started much more recently targetting the
> > Qualcomm/Venus driver, so it didn't have to suffer all the legacy and
> > directions changes in the V4L2 API since 2011.
> > 
> > As for the virtio video driver, it will remain useless to non-
> > chromeos/chrome users as long as it's not supported by any userspace.
> > I'd be very happy so see more contribution into FFMPEG and GStreamer to
> > implement the features that, for now, are only implemented in the
> > spec.
> > 
> > From your comment, bridging a Linux driver in the host through virtio-
> > video seems like a huge tasks. I believe this is an important issue to
> > address in the long term. If you could provide more details, I think it
> > would benefit to readers understanding.
> 
> Just to clarify, Dmitry is not working for ChromeOS but for another
> hypervisor (, which is not OSS?). So, users are not limited to
> ChromeOS.
> But, yeah, I agree that it's important to make it easy to use
> virtio-video driver without special hardware.
> 
> Let me explain what is the remaining task.
> To test virtio-video driver, we need to take care of four parts:
> Guest user application, guest virtio-video driver (this patch), host
> virtio-video device, and host video codec device.
> We have several options for each parts:
> 
> Guest userspace | Guest kernel | Host userspace hypervisor | Host video
> device
> ---------------------------------------------------------------------------
> - * FFMPEG      | virtio-video | virtio-video device in    | * real driver *
> GStreamer   |  driver      | * crosvm                  | * vicodec *
> v4l2-ctl    |              | * Dmitry's hypervisor     | * SW en/decoder
>                 |              | * QEMU?                   |
> 
> The remaining task I commented is implementation of virtio-video
> device in a host hypervisor.

Oh, there is no Dmitry's hypervisor unfortunately :) It is the COQOS 
Automotive hypervisor. And of course it does not use SW codecs on the host 
side. Yes, correct, the hypervisor is not OSS for obvious reasons.

For us one of the most important guest side users is Android's multimedia 
subsystem, so I'll update the table in this way:

Guest userspace | Guest kernel | Host userspace hypervisor | Host video device
----------------------------------------------------------------------------
  * FFMPEG      | virtio-video | virtio-video device in    | * real driver
  * GStreamer   |  driver      | * crosvm                  | * vicodec
  * Codec2 HAL  | virtio-video | * COQOS hypervisor        | * Platform Codecs
                |              | * QEMU?                   |

> What a virtio-video device does is forwarding guest driver's
> virtio-video commands to host's video decoder/encoder, and vice versa.
> If we use vicodec as a backend host video device, this part's task is
> protocol translation between virtio-video and V4L2 stateful API.
> 

There is some translation anyway, so from my point of view the problem to 
implement this is not that difficult, it just requires some more time. This 
could be a foundation for some QEMU codec device.

Best regards,
Dmitry.

> Though there are two virtio-video device implementation in the world
> at least (one in crosvm and the other in Dmitry's team's hypervisor),
> I guess both hypervisor implementations are not easy to use without
> special devices.
> So, we might want to have one more virtio-video device implementation
> in QEMU in the long term.
> It will be somehow similar to virtio-gpu device that is already
> implemented in QEMU:
> https://github.com/qemu/qemu/blob/master/hw/display/virtio-gpu.c
> 
> Best regards,
> Keiichi
> 
> > > Best regards,
> > > Dmitry.
> > > 
> > > On Donnerstag, 12. März 2020 10:54:35 CET Hans Verkuil wrote:
> > > > On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
> > > > > Hi Hans,
> > > > > 
> > > > > On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> 
wrote:
> > > > > > Hi Dmitry,
> > > > > > 
> > > > > > On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> > > > > > > Hi all,
> > > > > > > 
> > > > > > > This is a v4l2 virtio video driver for the virtio-video device
> > > > > > > specification v3 [1].
> > > > > > > 
> > > > > > > The first version of the driver was introduced here [2].
> > > > > > > 
> > > > > > > Changes v1 -> v2:
> > > > > > > * support the v3 spec (mostly)
> > > > > > > * add a module parameter to ask for pages from ZONE_DMA
> > > > > > > 
> > > > > > > What is not implemented:
> > > > > > > * Plane layout flags should be used to propagate number of
> > > > > > > planes to
> > > > > > > 
> > > > > > >   user-space
> > > > > > > 
> > > > > > > * There is no real use of stream creation with bitstream format
> > > > > > > in the
> > > > > > > 
> > > > > > >   parameter list. The driver just uses the first bitstream
> > > > > > >   format from
> > > > > > >   the list.
> > > > > > > 
> > > > > > > * Setting bitrate is done in a different way compared to the
> > > > > > > spec. This
> > > > > > > 
> > > > > > >   is because it has been already agreed on that the way the spec
> > > > > > >   currently describes it requires changes.
> > > > > > > 
> > > > > > > Potential improvements:
> > > > > > > * Do not send stream_create from open. Use corresponding state
> > > > > > > machine
> > > > > > > 
> > > > > > >   condition to do this.
> > > > > > > 
> > > > > > > * Do not send stream_destroy from close. Do it in reqbufs(0).
> > > > > > > * Cache format and control settings. Reduce calls to the device.
> > > > > > 
> > > > > > Some general notes:
> > > > > > 
> > > > > > Before this can be merged it needs to pass v4l2-compliance.
> > > > > > 
> > > > > > I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
> > > > > > allow testing with the vicodec emulation driver. This will also
> > > > > > allow testing all sorts of corner cases without requiring special
> > > > > > hardware.
> > > > > 
> > > > > I agree that it's great if we could test virtio-video with vicodec,
> > > > > but I wonder if supporting FWHT is actually needed for the initial
> > > > > patch.
> > > > > Though it wouldn't be difficult to support FWHT in the driver, we
> > > > > also
> > > > > needs to support it in the host's hypervisor to test it. It's not
> > > > > easy
> > > > > for our hypervisor to support FWHT, as it doesn't talk to v4l2
> > > > > driver
> > > > > directly.
> > > > > Without the host-side implementation, it makes no sense to support
> > > > > it.
> > > > > Also, if we support FWHT, we should have the format in a list of
> > > > > supported formats in the virtio specification. However, I'm not sure
> > > > > if FWHT is a general codec enough to be added in the spec, which
> > > > > shouldn't be specific to Linux.
> > > > 
> > > > Good point, I didn't know that.
> > > > 
> > > > Is it possible to add support for FWHT under a linux debug/test
> > > > option?
> > > > 
> > > > It's really the main reason for having this, since you would never use
> > > > this in production code. But it is so nice to have for regression
> > > > testing.
> > > > 
> > > > Regards,
> > > > 
> > > >     Hans
> > > > > 
> > > > > Best regards,
> > > > > Keiichi
> > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > >         Hans
> > > > > > > 
> > > > > > > Best regards,
> > > > > > > Dmitry.
> > > > > > > 
> > > > > > > [1] https://markmail.org/message/dmw3pr4fuajvarth
> > > > > > > [2] https://markmail.org/message/wnnv6r6myvgb5at6


