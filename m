Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 171A011A6F3
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 10:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfLKJ0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 04:26:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59033 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728500AbfLKJ0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 04:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576056393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zUEA3DTpeyiTMO4yFUvbCE27cpRyI0YDYGh3YmWkd7U=;
        b=Qak2G5podDRIDFHapDDYvx+n5oM+vcEbjD/XSqGiZ9qglKYsySbCt6LCAl9M2JIKJefJKW
        5c53QFggSGD4NukFF8TF8dLqCxL8xoaPss+sMZ2Syu5ao25mFRg2WTsKAi3S4PlcXal+80
        fVOIgW5H6Uxor0G/Vg4iHAbeqVLSnHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-DXrrFDgMP86Y1baJfLsJvg-1; Wed, 11 Dec 2019 04:26:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48198107ACFA;
        Wed, 11 Dec 2019 09:26:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1695C1B5;
        Wed, 11 Dec 2019 09:26:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 9C6C416E05; Wed, 11 Dec 2019 10:26:25 +0100 (CET)
Date:   Wed, 11 Dec 2019 10:26:25 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org>
 <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
 <d65bec5074eda5f389668e28922c1609@hostfission.com>
 <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: DXrrFDgMP86Y1baJfLsJvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> None of the proposals directly address the use case of sharing host
> allocated buffers between devices, but I think they can be extended to
> support it. Host buffers can be identified by the following tuple:
> (transport type enum, transport specific device address, shmid,
> offset). I think this is sufficient even for host-allocated buffers
> that aren't visible to the guest (e.g. protected memory, vram), since
> they can still be given address space in some shared memory region,
> even if those addresses are actually inaccessible to the guest. At
> this point, the host buffer identifier can simply be passed in place
> of the guest ram scatterlist with either proposed buffer sharing
> mechanism.

> I think the main question here is whether or not the complexity of
> generic buffers and a buffer sharing device is worth it compared to
> the more implicit definition of buffers.

Here are two issues mixed up.  First is, whenever we'll go define a
buffer sharing device or not.  Second is how we are going to address
buffers.

I think defining (and addressing) buffers implicitly is a bad idea.
First the addressing is non-trivial, especially with the "transport
specific device address" in the tuple.  Second I think it is a bad idea
from the security point of view.  When explicitly exporting buffers it
is easy to restrict access to the actual exports.

Instead of using a dedicated buffer sharing device we can also use
virtio-gpu (or any other driver which supports dma-buf exports) to
manage buffers.  virtio-gpu would create an identifier when exporting a
buffer (dma-buf exports inside the guest), attach the identifier to the
dma-buf so other drivers importing the buffer can see and use it.  Maybe
add an ioctl to query, so guest userspace can query the identifier too.
Also send the identifier to the host so it can also be used on the host
side to lookup and access the buffer.

With no central instance (buffer sharing device) being there managing
the buffer identifiers I think using uuids as identifiers would be a
good idea, to avoid clashes.  Also good for security because it's pretty
much impossible to guess buffer identifiers then.

cheers,
  Gerd

