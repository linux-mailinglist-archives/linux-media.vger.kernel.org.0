Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493F7F2EE8
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388479AbfKGNJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:09:45 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:38127 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733250AbfKGNJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 08:09:45 -0500
Received: from spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115])
        by plasma.jpberlin.de (Postfix) with ESMTP id 5B46FA737C;
        Thu,  7 Nov 2019 14:09:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id zu6EsoSuWsQW; Thu,  7 Nov 2019 14:09:36 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 9D60CB8EBC;
        Thu,  7 Nov 2019 14:09:35 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 7 Nov 2019
 14:09:35 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     <virtio-dev@lists.oasis-open.org>, <linux-media@vger.kernel.org>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>,
        <acourbot@chromium.org>, <alexlau@chromium.org>,
        <dgreid@chromium.org>, <marcheu@chromium.org>,
        <posciak@chromium.org>, <stevensd@chromium.org>,
        <hverkuil@xs4all.nl>, <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Thu, 7 Nov 2019 14:09:34 +0100
Message-ID: <1573181413.STYvEGL1rf@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Gerd,

Thank you for your feedback.

There is no relationship between those. As I mentioned earlier. we have also 
been working on a virtio video device at the same time. And there is no 
relationship between the two specs.

I can point you to the differences I see:

virtio-vdec:
1. Both the device and the driver submit requests to each other. For each 
request the response is sent as a separate request.
2. No support for getting/setting video stream parameters. For example 
(decoder): output format (NV12, I420), so the driver cannot really select the 
output format after headers have been parsed.
3. No support for getting plane requirements from the device (sg vs contig, 
size, stride alignment, plane count).
4. In the vdec device Drain and Flush are not separate for each buffer queue. 
So seek and dynamic resolution change (adaptive playback) cannot be 
implemented because 'flush' can have different meaning for a resolution change 
and a seek.
5. Decoder only: new devices will be needed to support encoder, processor or 
capture. Currently input is always a bitstream, output is always a video 
frame. No way set input format (needed for encoder, see 2).

virtio-video:
1. Uses the 'driver requests - device responses' model.
2. Does not  have the logical split of bitstreams and framebuffers, has only a 
generic buffer object.
3. Generic: can support any type of video device right away due to flexibility 
of stream configuration. Both input and output buffer queues can accept 
bitstream and frame buffers and run independently. (more controls need to be 
defined for e.g. camera)
4. Supports seek, drain, dynamic resolution change using an API agnostic 
command set (no v4l2/vaapi or so on remoting).
5. Complex configuration (most likely cannot be simplified for such a complex 
device type).

Best regards,
Dmitry.

On Donnerstag, 7. November 2019 10:56:57 CET Gerd Hoffmann wrote:
> On Tue, Nov 05, 2019 at 08:19:19PM +0100, Dmitry Sepp wrote:
> > [Resend after fixing an issue with the virtio-dev mailing list]
> > 
> > This patch proposes a virtio specification for a new virtio video
> > device.
> 
> Hmm, quickly looking over this, it looks simliar to the vdec draft
> posted a few weeks ago, with other device variants added but not
> fully specified yet.
> 
> So, can you clarify the relationship between the two?
> 
> thanks,
>   Gerd


