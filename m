Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A336A125C38
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 08:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLSHqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 02:46:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47468 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbfLSHqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 02:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576741613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2qMUuEdHbCyE5LmQaU7+dO3dylUln+w0m/kNdNRwPUM=;
        b=guD/BA1c/QfJkwZxZg1C+CD5XtAz/3L7j9jTOtwTtH6jA/k2MKPLojXLVau7J+VqVxta/m
        /4Eihy/ZwLdraZyZ2bUCWNlo0+rscZke9O6cFAhTTIGll1Te0RmEALBvRzCau/95kG8y2H
        sCZPj3ah87kjqh5hdKgOlPDptaEQc38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-tCqENUe0O2uu0fCG-VWlUA-1; Thu, 19 Dec 2019 02:46:45 -0500
X-MC-Unique: tCqENUe0O2uu0fCG-VWlUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22895800D41;
        Thu, 19 Dec 2019 07:46:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 24D2360C81;
        Thu, 19 Dec 2019 07:46:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 3908811AAA; Thu, 19 Dec 2019 08:46:39 +0100 (CET)
Date:   Thu, 19 Dec 2019 08:46:39 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Enrico Granata <egranata@google.com>, fziglio@redhat.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
Message-ID: <20191219074639.kdkrqxwb6fdb67hu@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org>
 <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
 <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 18, 2019 at 11:08:37PM +0900, Tomasz Figa wrote:
> On Wed, Dec 18, 2019 at 10:40 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > +The device MUST mark the last buffer with the
> > > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > > +sequence.
> >
> > No, that would build a race condition into the protocol.  The device
> > could complete the last buffer after the driver has sent the drain
> > command but before the device saw it.  So the flag would not be
> > reliable.
> >
> > I also can't see why the flag is needed in the first place.  The driver
> > should know which buffers are queued still and be able to figure
> > whenever the drain is complete or not without depending on that flag.
> > So I'd suggest to simply drop it.
> 
> Unfortunately video decoders are not that simple. There are always
> going to be some buffers on the decoder side used as reference frames.
> Only the decoder knows when to release them, as it continues decoding
> the stream.

Not clearly defined in the spec:  When is the decoder supposed to send
the response for a queue request?  When it finished decoding (i.e. frame
is ready for playback), or when it doesn't need the buffer any more for
decoding (i.e. buffer can be re-queued or pages can be released)?

> How we defined this in the V4L2 stateful decoder interface is that if
> the decoder happened to return the last framebuffer before the drain
> request arrived, it would return one more, empty.

Ok.  That is not clear from the spec.  I've read the drain request as as
"please stop decoding and complete all queue requests which are in the
virtqueue, even when you didn't process them yet".  In which case
completing the last pending queue request would clearly indicate the
draining request is complete.  Also completing the drain request should
only happen when the operation is finished.

I think the various states a buffer can have and how queuing & deciding
& draining changes these states should be clarified in the
specification.

cheers,
  Gerd

