Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F62143738
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 07:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgAUGot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 01:44:49 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31396 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725789AbgAUGot (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 01:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579589087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p1ciCsgpvdQJimUGOQLkhk5HqlTe0BRjeWb3MvBbv84=;
        b=TQ0JYGNsLOxoMYm84xVPk+1pvXqMGbv1uyFM5J+GcMUkK7KlmPHiSHHul3gaL22Hr8wwVu
        c6TEvyPpuh70pKteHbzG4Von6k6J11+P9n1AJ6SS0bANpLQ3U6BLw70ZpPB0vRNXKYpsxH
        DbP5bAz+2FT6D+zBaTUVrmBEHCnkjwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418--0EYtVwyOSymFcHfE3EhFw-1; Tue, 21 Jan 2020 01:44:44 -0500
X-MC-Unique: -0EYtVwyOSymFcHfE3EhFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A154100551A;
        Tue, 21 Jan 2020 06:44:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 12DA55C21B;
        Tue, 21 Jan 2020 06:44:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 196AD16E36; Tue, 21 Jan 2020 07:44:37 +0100 (CET)
Date:   Tue, 21 Jan 2020 07:44:37 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
Message-ID: <20200121064437.jryf3lq72bucs6rr@sirius.home.kraxel.org>
References: <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo>
 <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
 <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
 <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org>
 <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
 <20200120104755.3hhxlx6x6o32bagf@sirius.home.kraxel.org>
 <CAD90Vcak0iohLny9UjkqtBmM0px7Rz1mqQE6jw1wdu66QB4U3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD90Vcak0iohLny9UjkqtBmM0px7Rz1mqQE6jw1wdu66QB4U3Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > > Can't this problem be solved by adding "offset" field in virtio_video_mem_entry?
> > >
> > > struct virtio_video_mem_entry {
> > >   le64 addr;
> > >   le32 length;
> > >   le32 offset;
> > >   u8 padding[4];
> > > };
> > >
> > > Here, "addr" must be the same in every mem_entry for (1) hardware.
> >
> > No.  virtio_video_mem_entry is basically a scatter list entry, you use
> > an *array* of these entries to describe your buffer (unless you are
> > using CMA due to hardware requirements, in this special case you have
> > only one entry in your array).
> 
> I see. I forgot about scatter list.
> However, I'm still not sure about the usage for CMA.
> if we're using CMA for a multiplanar format, how can the device know
> where the second plane start from?
> In my understanding, the number of entries in this case should be the
> same with the number of planes and
> "entries[0].addr + entries[0].length == entries[1].addr" should hold.

With the one-buffer-per-frame model you could add a plane_offsets[4]
field to virtio_video_resource_create.

The virtio_video_mem_entry array describes the whole buffer for all
planes, the plane_offsets array says where the individual planes start
inside the buffer.

cheers,
  Gerd

