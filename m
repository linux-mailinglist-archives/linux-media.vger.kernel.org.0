Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73A5EFBDF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 11:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfKEKzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 05:55:05 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48071 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727262AbfKEKzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 05:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572951303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=sIQ1jZwoR2tUq12TbfN95oJSdxSRsIhx/PvNCM2nGQQ=;
        b=Zqx/YjJL72Y+/Y99P4pUosfASu8QX76Bu9AWI3DslZmObASFLkyVz6hDhrjDr/Tv1Nf/Ds
        bG+63b3EYEeaUlSUm0q1lkWOqvTodR5GqCxT9i8Tl8OgV2Ct9/ervFHU0Qi4alhAuIov1i
        LCxkhpHo0kzAsA2O4OFFkEHES1hd9G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-q3y6bil_Nw-sp9D_30H07Q-1; Tue, 05 Nov 2019 05:55:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45A818017DD;
        Tue,  5 Nov 2019 10:54:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9130F46;
        Tue,  5 Nov 2019 10:54:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id AB9F317535; Tue,  5 Nov 2019 11:54:56 +0100 (CET)
Date:   Tue, 5 Nov 2019 11:54:56 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     David Stevens <stevensd@chromium.org>,
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
Subject: guest / host buffer sharing ...
Message-ID: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: q3y6bil_Nw-sp9D_30H07Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi folks,

The issue of sharing buffers between guests and hosts keeps poping
up again and again in different contexts.  Most recently here:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg656685.html

So, I'm grabbing the recipient list of the virtio-vdec thread and some
more people I know might be interested in this, hoping to have everyone
included.

Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
resources" is really a good answer for all the different use cases
we have collected over time.  Maybe it is better to have a dedicated
buffer sharing virtio device?  Here is the rough idea:


(1) The virtio device
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Has a single virtio queue, so the guest can send commands to register
and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
has a list of memory ranges for the data.  Each buffer also has some
properties to carry metadata, some fixed (id, size, application), but
also allow free form (name =3D value, framebuffers would have
width/height/stride/format for example).


(2) The linux guest implementation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

I guess I'd try to make it a drm driver, so we can re-use drm
infrastructure (shmem helpers for example).  Buffers are dumb drm
buffers.  dma-buf import and export is supported (shmem helpers
get us that for free).  Some device-specific ioctls to get/set
properties and to register/unregister the buffers on the host.


(3) The qemu host implementation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

qemu (likewise other vmms) can use the udmabuf driver to create
host-side dma-bufs for the buffers.  The dma-bufs can be passed to
anyone interested, inside and outside qemu.  We'll need some protocol
for communication between qemu and external users interested in those
buffers, to receive dma-bufs (via unix file descriptor passing) and
update notifications.  Dispatching updates could be done based on the
application property, which could be "virtio-vdec" or "wayland-proxy"
for example.


commments?

cheers,
  Gerd

