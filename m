Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286A3139225
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 14:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgAMN1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 08:27:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20638 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726277AbgAMN1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 08:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578922024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Vykt4k4qo/INxJ6O9wmCyfd7P58Y/nieoYyULTzMm3E=;
        b=KwLq3BNcV5sKkHdDQBN0HtrXQdE202FO0YkRg3n9h5WuASyGRvQvgfF8WKwotyQxwb+AXh
        dKHSLSSey1CpjtI9zcOlPxZpA0p6mOyw1Kt4bnqOKgeCwpZ50M9vJ2HWLqNkxjhRUt8dTX
        wf9HamIpICOW5qbjhO5RJz7QERpW/N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-O64qwIR7OV-8kJcWPu0KEA-1; Mon, 13 Jan 2020 08:27:01 -0500
X-MC-Unique: O64qwIR7OV-8kJcWPu0KEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF49E800A02;
        Mon, 13 Jan 2020 13:26:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF76C60C63;
        Mon, 13 Jan 2020 13:26:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id E0E5931E49; Mon, 13 Jan 2020 14:26:54 +0100 (CET)
Date:   Mon, 13 Jan 2020 14:26:54 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
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
Message-ID: <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo>
 <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo>
 <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Well, no.  Tomasz Figa had splitted the devices into three groups:
> >
> >   (1) requires single buffer.
> >   (2) allows any layout (including the one (1) devices want).
> >   (3) requires per-plane buffers.
> >
> > Category (3) devices are apparently rare and old.  Both category (1)+(2)
> > devices can handle single buffers just fine.  So maybe support only
> > that?
> 
> From the guest implementation point of view, Linux V4L2 currently
> supports 2 cases, if used in allocation-mode (i.e. the buffers are
> allocated locally by V4L2):
> 
> i) single buffer with plane offsets predetermined by the format, (can
> be handled by devices from category 1) and 2))
> ii) per-plane buffers with planes at the beginning of their own
> buffers. (can be handled by devices from category 2) and 3))
> 
> Support for ii) is required if one wants to be able to import buffers
> with arbitrary plane offsets, so I'd consider it unavoidable.

If you have (1) hardware you simply can't import buffers with arbitrary
plane offsets, so I'd expect software would prefer the single buffer
layout (i) over (ii), even when using another driver + dmabuf
export/import, to be able to support as much hardware as possible.
So (ii) might end up being unused in practice.

But maybe not, was just an idea, feel free to scratch it.

cheers,
  Gerd

