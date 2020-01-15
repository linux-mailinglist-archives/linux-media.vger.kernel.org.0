Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072CD13BE56
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 12:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgAOL0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 06:26:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51155 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729758AbgAOL0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 06:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579087610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M2RZ532dIHiKDmmc62InNHe1TcnMw7QS/16K/1tw3pQ=;
        b=KBsFbYyJebaZOjjrrgGu2OG3nmxHMfzW3MNahmfIo8JO6+nfKivc7PlSLMdyNK7I7DK4Os
        UtxNTvjM9blAaANDh/3F+qqT8LcT54Y0B2WThHZzrZpt5ata4rs+RTgZhaHSJgeU7PBiBD
        Q7AdruhHp2IY1xNWj1J4EqG+t7YvtZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-YNwSp5V_P7WhS1KwJ1M5Bg-1; Wed, 15 Jan 2020 06:26:47 -0500
X-MC-Unique: YNwSp5V_P7WhS1KwJ1M5Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437F0800D41;
        Wed, 15 Jan 2020 11:26:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0DCC560BE0;
        Wed, 15 Jan 2020 11:26:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 2F03A9DB3; Wed, 15 Jan 2020 12:26:40 +0100 (CET)
Date:   Wed, 15 Jan 2020 12:26:40 +0100
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
Message-ID: <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo>
 <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo>
 <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
 <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > If you have (1) hardware you simply can't import buffers with arbitrary
> > plane offsets, so I'd expect software would prefer the single buffer
> > layout (i) over (ii), even when using another driver + dmabuf
> > export/import, to be able to support as much hardware as possible.
> > So (ii) might end up being unused in practice.
> >
> > But maybe not, was just an idea, feel free to scratch it.
> 
> That's true, simple user space would often do that. However, if more
> devices are in the game, often some extra alignment or padding between
> planes is needed and that is not allowed by (1), even though all the
> planes are in the same buffer.
> 
> My suggestion, based on the latest V4L2 discussion on unifying the
> UAPI of i) and ii), is that we may want to instead always specify
> buffers on a per-plane basis. Any additional requirements would be
> then validated by the host, which could check if the planes end up in
> the same buffer (or different buffers for (3)) and/or at the right
> offsets.

Hmm, using (ii) the API, then check whenever your three plane buffers
happen to have the correct layout for (1) hardware looks somewhat
backwards to me.

I'd suggest to use (i) API and allow the device specify alignment
requirements.  So (1) hardware would say "need_align=0", whereas (3)
hardware would probably say "need_align=PAGE_SIZE" so it can easily
split the single buffer into three per-plane buffers.

cheers,
  Gerd

