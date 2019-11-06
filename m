Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EFCF1634
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 13:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbfKFMlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 07:41:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50118 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727652AbfKFMlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 07:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573044068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YeZ3omQisP6oIpWqk/fhXQ/wM3qN3OMPusz9yyInI1M=;
        b=V4xazEn1xZW+n4qRYm46G3mJu3fWdWy0qBdKBHTd3Dx7LH20/75B0LLhq3rc+3jVL9q43y
        IFCmxxHlPJbzb0WOVpX/mPe+fmdV0RJMiBQQ/CAeoS+rWrCVB1h1TmsEIf0to5uzc8N1K6
        ydw1AoLRFtM3TzTOMt6jDkJ0b+XtsQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-OGswn-lfP0CJnLCdUHihtw-1; Wed, 06 Nov 2019 07:41:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C38D477;
        Wed,  6 Nov 2019 12:41:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 05A69600C4;
        Wed,  6 Nov 2019 12:41:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 3089A9D23; Wed,  6 Nov 2019 13:41:01 +0100 (CET)
Date:   Wed, 6 Nov 2019 13:41:01 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>, geoff@hostfission.com,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: OGswn-lfP0CJnLCdUHihtw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 06, 2019 at 05:36:22PM +0900, David Stevens wrote:
> > (1) The virtio device
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Has a single virtio queue, so the guest can send commands to register
> > and unregister buffers.  Buffers are allocated in guest ram.  Each buff=
er
> > has a list of memory ranges for the data. Each buffer also has some
>=20
> Allocating from guest ram would work most of the time, but I think
> it's insufficient for many use cases. It doesn't really support things
> such as contiguous allocations, allocations from carveouts or <4GB,
> protected buffers, etc.

If there are additional constrains (due to gpu hardware I guess)
I think it is better to leave the buffer allocation to virtio-gpu.

virtio-gpu can't do that right now, but we have to improve virtio-gpu
memory management for vulkan support anyway.

> > properties to carry metadata, some fixed (id, size, application), but
>=20
> What exactly do you mean by application?

Basically some way to group buffers.  A wayland proxy for example would
add a "application=3Dwayland-proxy" tag to the buffers it creates in the
guest, and the host side part of the proxy could ask qemu (or another
vmm) to notify about all buffers with that tag.  So in case multiple
applications are using the device in parallel they don't interfere with
each other.

> > also allow free form (name =3D value, framebuffers would have
> > width/height/stride/format for example).
>=20
> Is this approach expected to handle allocating buffers with
> hardware-specific constraints such as stride/height alignment or
> tiling? Or would there need to be some alternative channel for
> determining those values and then calculating the appropriate buffer
> size?

No parameter negotiation.

cheers,
  Gerd

