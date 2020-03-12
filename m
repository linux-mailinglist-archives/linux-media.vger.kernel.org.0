Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F32182BD5
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 10:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCLJEJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Mar 2020 05:04:09 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:39081 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgCLJEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 05:04:08 -0400
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id 5D23FBDBE9;
        Thu, 12 Mar 2020 10:04:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id Rqa_x91R7uHK; Thu, 12 Mar 2020 10:03:59 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id C879CBDA56;
        Thu, 12 Mar 2020 10:03:58 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 12 Mar
 2020 10:03:58 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
CC:     <virtio-dev@lists.oasis-open.org>, <acourbot@chromium.org>,
        <alexlau@chromium.org>, <daniel@ffwll.ch>, <dgreid@chromium.org>,
        <dstaessens@chromium.org>, <egranata@google.com>,
        <fziglio@redhat.com>, <keiichiw@chromium.org>, <kraxel@redhat.com>,
        <marcheu@chromium.org>, <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>, <stevensd@chromium.org>,
        <tfiga@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
Date:   Thu, 12 Mar 2020 10:03:58 +0100
Message-ID: <3182728.aeNJFYEL58@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for reviewing.

Sure, we understand the driver must pass v4l2-compliance. But the spec is not 
finalized yet, so it was a bit out of the scope.

Best regards,
Dmitry.

On Mittwoch, 11. März 2020 14:26:46 CET Hans Verkuil wrote:
> Hi Dmitry,
> 
> On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> > Hi all,
> > 
> > This is a v4l2 virtio video driver for the virtio-video device
> > specification v3 [1].
> > 
> > The first version of the driver was introduced here [2].
> > 
> > Changes v1 -> v2:
> > * support the v3 spec (mostly)
> > * add a module parameter to ask for pages from ZONE_DMA
> > 
> > What is not implemented:
> > * Plane layout flags should be used to propagate number of planes to
> > 
> >   user-space
> > 
> > * There is no real use of stream creation with bitstream format in the
> > 
> >   parameter list. The driver just uses the first bitstream format from
> >   the list.
> > 
> > * Setting bitrate is done in a different way compared to the spec. This
> > 
> >   is because it has been already agreed on that the way the spec
> >   currently describes it requires changes.
> > 
> > Potential improvements:
> > * Do not send stream_create from open. Use corresponding state machine
> > 
> >   condition to do this.
> > 
> > * Do not send stream_destroy from close. Do it in reqbufs(0).
> > * Cache format and control settings. Reduce calls to the device.
> 
> Some general notes:
> 
> Before this can be merged it needs to pass v4l2-compliance.
> 
> I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
> allow testing with the vicodec emulation driver. This will also
> allow testing all sorts of corner cases without requiring special
> hardware.
> 
> Regards,
> 
> 	Hans
> 
> > Best regards,
> > Dmitry.
> > 
> > [1] https://markmail.org/message/dmw3pr4fuajvarth
> > [2] https://markmail.org/message/wnnv6r6myvgb5at6


