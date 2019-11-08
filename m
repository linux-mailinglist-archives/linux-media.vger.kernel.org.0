Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F0CF413F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 08:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfKHHWb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 02:22:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24262 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbfKHHWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 02:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573197749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y/lLM9Z4Ow+LNPl/oIsVg/AjYSCnHzEPsAKYIkSK9z8=;
        b=exA5FOwZ+6dFj6HE16uS3RpccNWx2EE/oxoDxh97TEtHYwFal+bhvoo1C8oq7lOpzo9VVg
        13wxpaNm9+CGD1EisnV6YCrSkiP9etMpvY6jmZhGWhj5oHQ8S/JLEtBajrGIJHVwCETffQ
        j/uHA83BQ1OEEin85BU4KTp4z7w88X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-v1yQem93PpuTYIy_o1Hp-w-1; Fri, 08 Nov 2019 02:22:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3791005500;
        Fri,  8 Nov 2019 07:22:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBFC60850;
        Fri,  8 Nov 2019 07:22:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 7414111AAA; Fri,  8 Nov 2019 08:22:10 +0100 (CET)
Date:   Fri, 8 Nov 2019 08:22:10 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Stefan Hajnoczi <stefanha@gmail.com>
Cc:     geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
 <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: v1yQem93PpuTYIy_o1Hp-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Adding a list of common properties to the spec certainly makes sense,
> > so everybody uses the same names.  Adding struct-ed properties for
> > common use cases might be useful too.
>=20
> Why not define VIRTIO devices for wayland and friends?

There is an out-of-tree implementation of that, so yes, that surely is
an option.

Wayland needs (a) shared buffers, mostly for gfx data, and (b) a stream
pipe as control channel.  Pretty much the same for X11, except that
shared buffers are optional because the X protocol can also squeeze all
display updates through the stream pipe.

So, if you want allow guests talk to the host display server you can run
the stream pipe over vsock.  But there is nothing for the shared
buffers ...

We could replicate vsock functionality elsewhere.  I think that happened
in the out-of-tree virtio-wayland implementation.  There also was some
discussion about adding streams to virtio-gpu, slightly pimped up so you
can easily pass around virtio-gpu resource references for buffer
sharing.  But given that getting vsock right isn't exactly trivial
(consider all the fairness issues when multiplexing multiple streams
over a virtqueue for example) I don't think this is a good plan.

cheers,
  Gerd

