Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB13B125DA2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfLSJ0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:26:44 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:48947 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLSJ0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:26:44 -0500
Received: from spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123])
        by plasma.jpberlin.de (Postfix) with ESMTP id 25C60B9C33;
        Thu, 19 Dec 2019 10:26:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id KTstFXxyl3Vg; Thu, 19 Dec 2019 10:26:39 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 609A8B9C9D;
        Thu, 19 Dec 2019 10:26:38 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 19 Dec
 2019 10:26:37 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     Keiichi Watanabe <keiichiw@chromium.org>,
        <virtio-dev@lists.oasis-open.org>, <linux-media@vger.kernel.org>,
        <acourbot@chromium.org>, <alexlau@chromium.org>, <daniel@ffwll.ch>,
        <dgreid@chromium.org>, <egranata@google.com>, <fziglio@redhat.com>,
        <hverkuil@xs4all.nl>, <marcheu@chromium.org>,
        <posciak@chromium.org>, <spice-devel@lists.freedesktop.org>,
        <stevensd@chromium.org>, <tfiga@chromium.org>, <uril@redhat.com>
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device specification
Date:   Thu, 19 Dec 2019 10:26:37 +0100
Message-ID: <2570078.xtWa8k4VtA@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org> <20191218130214.170703-2-keiichiw@chromium.org> <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gerd,

On Mittwoch, 18. Dezember 2019 14:40:37 CET Gerd Hoffmann wrote:
>   Hi,
> 
> > +The device MUST mark the last buffer with the
> > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > +sequence.
> 
> No, that would build a race condition into the protocol.  The device
> could complete the last buffer after the driver has sent the drain
> command but before the device saw it.  So the flag would not be
> reliable.
No, then it means the device was not in drain, but, for example, hit a 
resolution change in the stream and tells us that this is the last buffer with 
the old resolution.

> 
> I also can't see why the flag is needed in the first place.  The driver
> should know which buffers are queued still and be able to figure
> whenever the drain is complete or not without depending on that flag.
> So I'd suggest to simply drop it.
This flag is used not for drain only. In marks the completion of whatever 
specific buffer sequence, like a full end-of-stream, resolution change, drain 
etc. We also need this to handle nested sequences. For instance, a resolution 
change event might happen while in drain.

Regards,
Dmitry.

> 
> That is the only issue I've spotted in the protocol on a first quick
> look.  There are a few places where the spec text could be improved.
> I'll try to set aside some time to go over this in detail, but I can't
> promise I'll find the time to do that before xmas and new year.
> 
> cheers,
>   Gerd


