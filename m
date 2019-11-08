Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8041BF43E7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfKHJvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 04:51:48 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:57367 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfKHJvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:51:48 -0500
Received: from spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116])
        by plasma.jpberlin.de (Postfix) with ESMTP id 8E74FB6E53;
        Fri,  8 Nov 2019 10:51:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id a3wDQb5qABfB; Fri,  8 Nov 2019 10:51:42 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 75F54A0694;
        Fri,  8 Nov 2019 10:51:42 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 8 Nov 2019
 10:51:41 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     <virtio-dev@lists.oasis-open.org>, <linux-media@vger.kernel.org>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>,
        <acourbot@chromium.org>, <alexlau@chromium.org>,
        <dgreid@chromium.org>, <marcheu@chromium.org>,
        <posciak@chromium.org>, <stevensd@chromium.org>,
        <hverkuil@xs4all.nl>, <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Fri, 8 Nov 2019 10:51:41 +0100
Message-ID: <2495905.H3tntR4Av4@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191108074955.t7mtqks4dfmrdzod@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <1573181413.STYvEGL1rf@os-lin-dmo> <20191108074955.t7mtqks4dfmrdzod@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Gerd,

Please see the answer below.

On Freitag, 8. November 2019 08:49:55 CET Gerd Hoffmann wrote:
> On Thu, Nov 07, 2019 at 02:09:34PM +0100, Dmitry Sepp wrote:
> > Hello Gerd,
> > 
> > Thank you for your feedback.
> > 
> > There is no relationship between those. As I mentioned earlier. we have
> > also been working on a virtio video device at the same time. And there is
> > no relationship between the two specs.
> 
> Keiichi, have you looked at the spec?
> 
> I think it is useful to have a single device specification for all video
> functions given that there is a bunch of common stuff.  Both encoder and
> decoder must negotiate video frame and video stream parameters for
> example.  Also the virtio-video spec looks like a superset of
> virtio-vdec.
> 
> Is there any important feature in video-vdec which is missing in
> virtio-video?
> 
> > virtio-video:
> > 1. Uses the 'driver requests - device responses' model.
> > 2. Does not  have the logical split of bitstreams and framebuffers, has
> > only a generic buffer object.
> 
> Can you give a quick summary on buffer object management?
Buffer objects are implemented in a similar way to how it was done for virtio-
gpu. The driver allocates a resource (descriptor) on the device.  Than the 
driver allocates/imports backing pages and attaches those to the resource.

When a buffer is ready for processing from the driver's point of view, the 
driver queues it to the device (please see struct 
virtio_video_resource_queue). Within this structure the driver provides 
required metadata (number of data bytes in the buffer, timestamp/counter and so 
on).

The nice thing about this is that there is no real decode or encode requests. 
The device just fetches the buffer from the input queue, applies some 
transformation according to its function and settings, fetches an output buffer 
from the respective queue, and stores the result in the output buffer (or -s, 
if needed).

The device keeps buffer requests until the respective buffer has been processed 
(i.e. input is consumed or output is written). When the buffer is not needed 
anymore, the virtio_video_resource_queue request completes asynchronously. 
This also makes it possible to easily handle different frame types that are 
decoded out-of-order.

Regards,
Dmitry.

> 
> thanks,
>   Gerd


