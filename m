Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F1C1202AD
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfLPKcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:32:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51839 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727229AbfLPKcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576492363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+Tv9lz/9aRTWSuFWFHPRLE9sszc/GHULK3m7iE15C3w=;
        b=GjFenZ+Vs3Ps1ftckjp3JuzVPU/DD2qcC7CSFcDgz4s3fuHdUrT0/etIQflacc170+LwZC
        xSlRXvRN/9H/gQxmguukvZsYmOgSWCYd4H1OXsQYmOfthzY246a9ThdS+tzoAlBXmaqrAa
        06dX7YARjpimbZNqwTWMMsgOk6r/Wcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Uf4wU8zTOEeNf_eoge7EZw-1; Mon, 16 Dec 2019 05:32:40 -0500
X-MC-Unique: Uf4wU8zTOEeNf_eoge7EZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401B4800D41;
        Mon, 16 Dec 2019 10:32:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 811C95D9C5;
        Mon, 16 Dec 2019 10:32:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id B51049DA3; Mon, 16 Dec 2019 11:32:36 +0100 (CET)
Date:   Mon, 16 Dec 2019 11:32:36 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191216103236.ugjorzq5pntc7gtt@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
 <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
 <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Hmm, modern GPUs support both encoding and decoding ...
> 
> Many SoC architectures have completely separate IP blocks for encoding
> and decoding. Similarly, in GPUs those are usually completely separate
> parts of the pipeline.

In the OS there is one driver per GPU handling both ...

> > I don't think we should bake that restriction into the specification.
> > It probably makes sense to use one virtqueue per function though, that
> > will simplify dispatching in both host and guest.
> >
> 
> Wouldn't it make the handling easier if we had one virtio device per function?

I don't think there is much of a difference between one device per
function and one virtqueue per function.  You'll probably have a single
driver for both anyway, to share common code for buffer management etc.

> > Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?
> 
> I'd specifically avoid FourCC here, as it's very loosely defined and
> could introduce confusion.

I don't think using fourcc is a problem, and given that both drm and
v4l2 use fourcc already this would be a good choice I think.

But the definition should be more specific than just "fourcc".  Best
would be to explicitly list and define each format supported by the
spec.

cheers,
  Gerd

