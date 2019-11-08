Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0404CF42D6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfKHJFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 04:05:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37952 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726072AbfKHJFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573203913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mD4A52lsah+cOzVZ1YpXrVrAFd/eMh2/t+H8qY9zj2w=;
        b=Jn85xCegY4+S43sqk+ksW13Y3A2yiA4uoXjzL0gwkxFexFWaKJd5T1rmChM9K1pnzUX6T+
        p5rM64dd8ugrpaqeySN/Cha81LBCj2RK1T6aZS3tNRztQo0W+Te5NYrnhsrYCHhzYAL0pz
        75IIZoTWEjJtqxaSDnkSIiD5dBSrSjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-qWp3b1K1OFiP1rRdQrcJeg-1; Fri, 08 Nov 2019 04:05:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3F53107ACC3;
        Fri,  8 Nov 2019 09:05:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F111E5C3FD;
        Fri,  8 Nov 2019 09:05:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 2150517535; Fri,  8 Nov 2019 10:05:06 +0100 (CET)
Date:   Fri, 8 Nov 2019 10:05:06 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191108090506.jw4t46d3o4ooy7ns@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
 <1573181413.STYvEGL1rf@os-lin-dmo>
 <CAAFQd5CkTxCYhn70o5oiR4uLA7QyRMUw-XrRWorwZnwXGK0pDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CkTxCYhn70o5oiR4uLA7QyRMUw-XrRWorwZnwXGK0pDQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: qWp3b1K1OFiP1rRdQrcJeg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > 1. Both the device and the driver submit requests to each other. For ea=
ch
> > request the response is sent as a separate request.
>=20
> To be more precise, in vdec there are no responses. The guest sends
> commands to the host using one virtqueue. The host signals
> asynchronous events, which might not have the exact earlier guest
> request associated to them.

How do you report errors?  Is there an error event for that?

> An example of such special case could be
> H.264 framebuffer reordering, where one might end up with a few decode
> requests not resulting in any frames being output and then one decode
> request that would trigger multiple accumulated frames to be returned.

Note: this can be done with a request/response model too, by simply
completing the decode request when there is frame data, so in that case
multiple decode requests simply complete at the same time.  Yes, you can
have multiple outstanding requests in virtio.  Out-of-order completion
is also allowed btw.

> > 2. No support for getting/setting video stream parameters. For example
> > (decoder): output format (NV12, I420), so the driver cannot really sele=
ct the
> > output format after headers have been parsed.
>=20
> Getting video stream parameters is there, but they are currently left
> fully in control of the host video decoder. Ability to select between
> multiple possible formats could be worth adding, though.

Nice to see you agree on that one ;)

> > 3. No support for getting plane requirements from the device (sg vs con=
tig,
> > size, stride alignment, plane count).
>=20
> There is actually a bigger difference that results in that. Vdec
> assumes host-allocated buffers coming from a different device, e.g.
> virtio-gpu and the host having the right knowledge to allocate the
> buffers correctly. This is related to the fact that it's generally
> difficult to convey all the allocation constraints in a generic
> manner.

Yep, buffer handling is tricky, especially when it comes to decoding
directly to gpu buffers and also when supporting playback of
drm-protected streams where the guest might not be allowed to access
the stream data.

> > 5. Decoder only: new devices will be needed to support encoder, process=
or or
> > capture. Currently input is always a bitstream, output is always a vide=
o
> > frame. No way set input format (needed for encoder, see 2).
>=20
> The rationale for this was that this is a point of contact with the
> host and a possible attack surface, so having a protocol as specific
> as possible makes the attack surface smaller and is easier to validate
> in the device implementation.

I think it certainly makes sense to support both video encoding and
video decoding with a single device spec.

For capture (especially camera) and processor things are less clear,
although there is at least some overlap too.  IIRC most of the spec is
"TBD" for those anyway, so I'd suggest to drop them from the spec for
now and focus on the video parts.

cheers,
  Gerd

