Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013C82155D4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 12:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgGFKtg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 06:49:36 -0400
Received: from plasma2.jpberlin.de ([91.198.250.140]:35757 "EHLO
        plasma2.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbgGFKtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 06:49:36 -0400
Received: from spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122])
        by plasma.jpberlin.de (Postfix) with ESMTP id 0C8C3B9F39;
        Mon,  6 Jul 2020 12:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id 2TYxBK4JO2OK; Mon,  6 Jul 2020 12:49:29 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "Let's Encrypt Authority X3" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id C4B92A6F28;
        Mon,  6 Jul 2020 12:49:28 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by webmail.opensynergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 12:49:28 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        <virtio-dev@lists.oasis-open.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        "David Staessens" <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Gerd Hoffmann" <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
Date:   Mon, 6 Jul 2020 12:49:27 +0200
Message-ID: <5365344.WxEP8abb2G@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAAFQd5CQuDgvZrYC53yKEYBY1LOX2QO8+7eRAscN5wQFmHmkZQ@mail.gmail.com>
References: <20200623111325.237158-1-keiichiw@chromium.org> <CAPBb6MXju_cc3FdWF60Ndx6aYfHmaGbQxu2a3QMxTfnLrXJxYQ@mail.gmail.com> <CAAFQd5CQuDgvZrYC53yKEYBY1LOX2QO8+7eRAscN5wQFmHmkZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -5.16 / 15.00 / 200.00
X-Rspamd-Queue-Id: 0C8C3B9F39
X-Rspamd-UID: 81d474
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre, Tomasz,

Thank  you very much for your feedback.

Yes, unfortunately we cannot disable dmabuf mode as it is currently mandatory 
for Android.

AFAIU the work to have this ready in the main v4l2 spec requires time. But in 
the virtio-video spec we indeed can mention something like that the device 
does not expected the backing memory for an existing resource id to change.

Best regards,
Dmitry.

On Freitag, 3. Juli 2020 11:55:29 CEST Tomasz Figa wrote:
> On Fri, Jul 3, 2020 at 11:27 AM Alexandre Courbot <acourbot@chromium.org> 
wrote:
> > On Fri, Jul 3, 2020 at 6:18 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Fri, Jul 03, 2020 at 02:45:15PM +0900, Alexandre Courbot wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On Thu, Jul 2, 2020 at 10:47 PM Dmitry Sepp 
<dmitry.sepp@opensynergy.com> wrote:
> > > > > Hi Keiichi,
> > > > > 
> > > > > Thanks for the clarification. I believe we should explicitly
> > > > > describe this in the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH section. And
> > > > > I also still see a problem there. If it is a guest allocated
> > > > > resource, we cannot consider it to be free until the device really
> > > > > releases it. And it won't happen until we issue the next ATTACH
> > > > > call. Also, as we discussed before, it might be not possible to
> > > > > free individual buffers, but the whole queue only.
> > > > 
> > > > In the case of the encoder, a V4L2 driver is not supposed to let
> > > > user-space dequeue an input frame while it is used as reference for
> > > > the encoding process. So if we add a similar rule in the virtio-video
> > > > specification, I suppose this would solve the problem?
> > > > 
> > > > For the decoder case, we have a bigger problem though. Since DMABUFs
> > > > can be arbitrarily attached to any V4L2 buffer ID, we may end up
> > > > re-queueing the DMABUF of a decoded frame that is still used as
> > > > reference under a different V4L2 buffer ID. In this case I don't think
> > > > the driver has a way to know that the memory resource should not be
> > > > overwritten, and it will thus happily use it as a decode target. The
> > > > easiest fix is probably to update the V4L2 stateful specification to
> > > > require that reused DMABUFs must always be assigned to the same V4L2
> > > > buffer ID, and must be kept alive as long as decoding is in progress,
> > > > or until a resolution change event is received. We can then apply a
> > > > similar rule to the virtio device.
> > > 
> > > Sounds like a generic kind of problem - how do other devices solve it?
> > 
> > Most users of V4L2 drivers use MMAP buffers, which don't suffer from
> > this problem: since MMAP buffers are managed by V4L2 and the same V4L2
> > buffer ID always corresponds to the same backing memory, the driver
> > just needs to refrain from decoding into a given V4L2 buffer as long
> > as it is used as a reference frames. This is something that all
> > drivers currently do AFAICT.
> > 
> > The problem only occurs if you let userspace map anything to V4L2
> > buffers (USERPTR or DMABUF buffers). In order to guarantee the same
> > reliable behavior as with MMAP buffers, you must enforce the same
> > rule: always the same backing memory for a given V4L2 buffer.
> > 
> > ... or you can rotate between a large enough number of buffers to
> > leave enough space for the reference tag to expire on your frames, but
> > that's clearly not a good way to address the problem.
> 
> FWIW, it's typically solved with regular devices by completely
> disallowing the DMABUF/USERPTR modes and only allowing the
> V4L2-managed MMAP mode for affected buffer queues.
> 
> However, that's quite a severe limitation and with a careful API
> extension, DMABUF could be still handled. Namely:
>  - pre-registration of buffers at initialization time: that would
> likely mean mandating VIDIOC_QBUF for all indexes before any
> decoding/encoding can start,
>  - enforcement of index-buffer mapping: VIDIOC_QBUF would have to fail
> if one attempts to queue another buffer at the same index,
>  - ability to explicitly release existing buffers: there is
> VIDIOC_RELEASE_BUF in the works which could be used to release a
> specific index,
>  - ability to explicitly add new buffers: a combination of
> VIDIOC_CREATEBUFS + VIDIOC_QBUF could be already used to achieve this.
> 
> Best regards,
> Tomasz


