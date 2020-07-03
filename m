Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC212137A4
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 11:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgGCJ1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 05:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgGCJ1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 05:27:13 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F6BC08C5C1
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 02:27:13 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id n24so24018015otr.13
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=My7AEIFF8m+uLMru4rHgMTWXFzlW7n2k2ELeHm5OiLY=;
        b=HhFwvN3a6ABKc5S+t/sH9sQ3IwBkJPZ1XaxXkRJOAOiPO6UsNhMZ513t9LeD7Wo6zl
         J7OUxzIU6GKetseqEkcDPj/q0EBidHDEF03qmGWLNBK7qyAEJbcI2UkVFHkDZPQowx0G
         D5P32oTPd3NROTsJ3Gu5wrZgMBR0+m3sw7Mv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=My7AEIFF8m+uLMru4rHgMTWXFzlW7n2k2ELeHm5OiLY=;
        b=PTEJeOKx3+BrZmjNI4xm9p41mvvk193yAKmv6pMxmyV31O4xVEetTKETILa0JUXeOH
         cHfIWaHZOngUXKnXJrDSWzA8JCqW8L1Xi6FEgVRRa+Hyd9WXeNa0egBf8urOQl2NAHMY
         rXzWcBEhGcImKoH+mgiE8PoiPNg/ybjuNWqusRQ5eNyhsOxwsKz9iD4nFFGaCzyu2wPj
         Hv//kffridonQezh0kumfHFSxxm35rvZ4iHqmYFCS4+exBEtlYqM0sAE0C07minNOty1
         LynlzrDPA2fGkDjr/aGszPpOYlwEbY004DH1q/Ez1UNV+L9a+kRBeJXuCQlU6He/gxMo
         1g3A==
X-Gm-Message-State: AOAM533pr27YtDfKlHg2/fv6i0C95UFfTPt7P7iwRcPTx6d7V6rrGEtQ
        Dtv12Ef7AC2UtsAW5R/kSCE7xA1G/qY=
X-Google-Smtp-Source: ABdhPJxId2s23p0r+c/08YvIYsjo4fJnG+vdCvM4AwJ/3HBhPkMQCzvdUZ9S40J6l9n3WiD/NBx1Yg==
X-Received: by 2002:a9d:3e57:: with SMTP id h23mr30135790otg.44.1593768432078;
        Fri, 03 Jul 2020 02:27:12 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id n6sm3204112otq.33.2020.07.03.02.27.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 02:27:11 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 72so26263211otc.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2020 02:27:10 -0700 (PDT)
X-Received: by 2002:a9d:6389:: with SMTP id w9mr28658984otk.97.1593768430034;
 Fri, 03 Jul 2020 02:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <2850781.lI95146Gml@os-lin-dmo> <CAD90VcbmrismAXW0t7K6M-=a2-P+OCOw8PvBr6r8S_3LNYu=pw@mail.gmail.com>
 <3163123.i8GTTo9gJ5@os-lin-dmo> <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
 <20200703051756-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200703051756-mutt-send-email-mst@kernel.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 3 Jul 2020 18:26:58 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXju_cc3FdWF60Ndx6aYfHmaGbQxu2a3QMxTfnLrXJxYQ@mail.gmail.com>
Message-ID: <CAPBb6MXju_cc3FdWF60Ndx6aYfHmaGbQxu2a3QMxTfnLrXJxYQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     "Michael S. Tsirkin" <mst@redhat.com>
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
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 3, 2020 at 6:18 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 03, 2020 at 02:45:15PM +0900, Alexandre Courbot wrote:
> > Hi Dmitry,
> >
> > On Thu, Jul 2, 2020 at 10:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
> > >
> > > Hi Keiichi,
> > >
> > > Thanks for the clarification. I believe we should explicitly describe this in
> > > the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH section. And I also still see a problem
> > > there. If it is a guest allocated resource, we cannot consider it to be free
> > > until the device really releases it. And it won't happen until we issue the
> > > next ATTACH call. Also, as we discussed before, it might be not possible to
> > > free individual buffers, but the whole queue only.
> >
> > In the case of the encoder, a V4L2 driver is not supposed to let
> > user-space dequeue an input frame while it is used as reference for
> > the encoding process. So if we add a similar rule in the virtio-video
> > specification, I suppose this would solve the problem?
> >
> > For the decoder case, we have a bigger problem though. Since DMABUFs
> > can be arbitrarily attached to any V4L2 buffer ID, we may end up
> > re-queueing the DMABUF of a decoded frame that is still used as
> > reference under a different V4L2 buffer ID. In this case I don't think
> > the driver has a way to know that the memory resource should not be
> > overwritten, and it will thus happily use it as a decode target. The
> > easiest fix is probably to update the V4L2 stateful specification to
> > require that reused DMABUFs must always be assigned to the same V4L2
> > buffer ID, and must be kept alive as long as decoding is in progress,
> > or until a resolution change event is received. We can then apply a
> > similar rule to the virtio device.
>
>
> Sounds like a generic kind of problem - how do other devices solve it?

Most users of V4L2 drivers use MMAP buffers, which don't suffer from
this problem: since MMAP buffers are managed by V4L2 and the same V4L2
buffer ID always corresponds to the same backing memory, the driver
just needs to refrain from decoding into a given V4L2 buffer as long
as it is used as a reference frames. This is something that all
drivers currently do AFAICT.

The problem only occurs if you let userspace map anything to V4L2
buffers (USERPTR or DMABUF buffers). In order to guarantee the same
reliable behavior as with MMAP buffers, you must enforce the same
rule: always the same backing memory for a given V4L2 buffer.

... or you can rotate between a large enough number of buffers to
leave enough space for the reference tag to expire on your frames, but
that's clearly not a good way to address the problem.
