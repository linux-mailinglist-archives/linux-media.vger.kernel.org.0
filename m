Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCD6213778
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 11:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgGCJSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 05:18:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47527 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725764AbgGCJSa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 05:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593767908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ss0IDIZEfKfA9xET1I+Is11l2/LEfuqsr911eEHBfhM=;
        b=EXyFX4GMUwbRFBkJUVEteeqCg5UY/DEY3r/SE/CL6gBUJNsWJ/PSIsfjWes/NM4G3F6A67
        kcTBx0K00L97vilOH1jALXAy0AUFGete20e4RV+UMCCT7kGkHSHlDX7BI9yAPU3qBC9nnt
        ohIs2MBISTEwKMk7kIA6t6CpzqolOaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-DK4eXQoYOxCKhbnytULWVA-1; Fri, 03 Jul 2020 05:18:26 -0400
X-MC-Unique: DK4eXQoYOxCKhbnytULWVA-1
Received: by mail-wr1-f71.google.com with SMTP id i10so31087623wrn.21
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 02:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ss0IDIZEfKfA9xET1I+Is11l2/LEfuqsr911eEHBfhM=;
        b=Kwm86U0dVTNzCGdXDKUAHTGowuFplLIp7jJtU1Bucslj0gf8HfrjeHVTbAYUuuaJOW
         tghQj9c8Ybo6okTmh9zKgD7+oSB1onGBsYsZZkRgYVdnl1KAonP8NI5uLxl9sXVqGqH3
         iZu4+qyUfRrsLl4iKaoKYpbeyyhktiZpr6tobVRhIZSYHnLex2ofOzma+bxutYGhhqXN
         oPZy3/kf6Hk1RzfYqpj3CDHNd+JVLRJHkJBrJYQ/pHRv9J8aiIUQGArIg4O11g+o8eQE
         wPmnAWhff8nJm9qKZbRIlsSiZjHBJayHZjpVOOOjU4rG7DHa0mMLmTFEUKvNsVRlWJG6
         TxZg==
X-Gm-Message-State: AOAM531WQb3Gk1Jf6oQoYoIBnUrL44v0MnCpNgoIX+lflvGZoutX70aZ
        zppBmTy4O9dYhZ36RUbd3cB46g8gvqbaSV0GyrrehVo5yZBNl7kalqiwyTTvHRYp6m93mE6c4Qn
        UntLPfM5BtzN+qNt8XpoiAR4=
X-Received: by 2002:a1c:9cd0:: with SMTP id f199mr34398510wme.94.1593767905626;
        Fri, 03 Jul 2020 02:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNmkdFx2ksJ/o9oyOfDqxnW9PNTk+eGqm/xE6RJZmwyDXRckt1MRm5dgxLitM69dR+ZzOxng==
X-Received: by 2002:a1c:9cd0:: with SMTP id f199mr34398469wme.94.1593767905320;
        Fri, 03 Jul 2020 02:18:25 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
        by smtp.gmail.com with ESMTPSA id 92sm14260770wrr.96.2020.07.03.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 02:18:24 -0700 (PDT)
Date:   Fri, 3 Jul 2020 05:18:20 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
Message-ID: <20200703051756-mutt-send-email-mst@kernel.org>
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <2850781.lI95146Gml@os-lin-dmo>
 <CAD90VcbmrismAXW0t7K6M-=a2-P+OCOw8PvBr6r8S_3LNYu=pw@mail.gmail.com>
 <3163123.i8GTTo9gJ5@os-lin-dmo>
 <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 03, 2020 at 02:45:15PM +0900, Alexandre Courbot wrote:
> Hi Dmitry,
> 
> On Thu, Jul 2, 2020 at 10:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
> >
> > Hi Keiichi,
> >
> > Thanks for the clarification. I believe we should explicitly describe this in
> > the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH section. And I also still see a problem
> > there. If it is a guest allocated resource, we cannot consider it to be free
> > until the device really releases it. And it won't happen until we issue the
> > next ATTACH call. Also, as we discussed before, it might be not possible to
> > free individual buffers, but the whole queue only.
> 
> In the case of the encoder, a V4L2 driver is not supposed to let
> user-space dequeue an input frame while it is used as reference for
> the encoding process. So if we add a similar rule in the virtio-video
> specification, I suppose this would solve the problem?
> 
> For the decoder case, we have a bigger problem though. Since DMABUFs
> can be arbitrarily attached to any V4L2 buffer ID, we may end up
> re-queueing the DMABUF of a decoded frame that is still used as
> reference under a different V4L2 buffer ID. In this case I don't think
> the driver has a way to know that the memory resource should not be
> overwritten, and it will thus happily use it as a decode target. The
> easiest fix is probably to update the V4L2 stateful specification to
> require that reused DMABUFs must always be assigned to the same V4L2
> buffer ID, and must be kept alive as long as decoding is in progress,
> or until a resolution change event is received. We can then apply a
> similar rule to the virtio device.


Sounds like a generic kind of problem - how do other devices solve it?

