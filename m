Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F31DF12E9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 10:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730975AbfKFJvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 04:51:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35038 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726143AbfKFJvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 04:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573033889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H07O5MhifX+SyOo7deyM1HCJTFRz437wQNK/NQ47qqU=;
        b=VNw1p/gyo52WzY4H0xKTAvWYRzVz6vI+wzc0AJiI3oMywAYkcL++rJ1Y+Dy39fJOwY21Pb
        52N3ogUoew78cuq3gBURsec3AHEZwa6X1lM1xSpdvJGFwJhiz96ITKtWZ5hvjqQgNQTs2m
        6aOXHtu9nOC0uqP56rATgiE51sad9bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-D2z0XxgJPDqcbsTxn64f0Q-1; Wed, 06 Nov 2019 04:51:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D64A107ACC3;
        Wed,  6 Nov 2019 09:51:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C049627064;
        Wed,  6 Nov 2019 09:51:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id CEB7E17535; Wed,  6 Nov 2019 10:51:22 +0100 (CET)
Date:   Wed, 6 Nov 2019 10:51:22 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Stefan Hajnoczi <stefanha@gmail.com>
Cc:     geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191106084344.GB189998@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: D2z0XxgJPDqcbsTxn64f0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> > resources" is really a good answer for all the different use cases
> > we have collected over time.  Maybe it is better to have a dedicated
> > buffer sharing virtio device?  Here is the rough idea:
>=20
> My concern is that buffer sharing isn't a "device".  It's a primitive
> used in building other devices.  When someone asks for just buffer
> sharing it's often because they do not intend to upstream a
> specification for their device.

Well, "vsock" isn't a classic device (aka nic/storage/gpu/...) either.
It is more a service to allow communication between host and guest

That buffer sharing device falls into the same category.  Maybe it even
makes sense to build that as virtio-vsock extension.  Not sure how well
that would work with the multi-transport architecture of vsock though.

> If this buffer sharing device's main purpose is for building proprietary
> devices without contributing to VIRTIO, then I don't think it makes
> sense for the VIRTIO community to assist in its development.

One possible use case would be building a wayland proxy, using vsock for
the wayland protocol messages and virtio-buffers for the shared buffers
(wayland client window content).

It could also simplify buffer sharing between devices (feed decoded
video frames from decoder to gpu), although in that case it is less
clear that it'll actually simplify things because virtio-gpu is
involved anyway.

We can't prevent people from using that for proprietary stuff (same goes
for vsock).

There is the option to use virtio-gpu instead, i.e. add support to qemu
to export dma-buf handles for virtio-gpu resources to other processes
(such as a wayland proxy).  That would provide very similar
functionality (and thereby create the same loophole).

> VIRTIO recently gained a shared memory resource concept for access to
> host memory.  It is being used in virtio-pmem and virtio-fs (and
> virtio-gpu?).

virtio-gpu is in progress still unfortunately (all kinds of fixes for
the qemu drm drivers and virtio-gpu guest driver refactoring kept me
busy for quite a while ...).

> If another flavor of shared memory is required it can be
> added to the spec and new VIRTIO device types can use it.  But it's not
> clear why this should be its own device.

This is not about host memory, buffers are in guest ram, everything else
would make sharing those buffers between drivers inside the guest (as
dma-buf) quite difficult.

> My question would be "what is the actual problem you are trying to
> solve?".

Typical use cases center around sharing graphics data between guest
and host.

cheers,
  Gerd

