Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25FF187BBF
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 10:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgCQJKr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Mar 2020 05:10:47 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:50947 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQJKr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 05:10:47 -0400
Received: from spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117])
        by plasma.jpberlin.de (Postfix) with ESMTP id 3AB01BA5C2;
        Tue, 17 Mar 2020 10:10:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id R0oXR1GvTyAL; Tue, 17 Mar 2020 10:10:33 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id C735DA0674;
        Tue, 17 Mar 2020 10:10:32 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 17 Mar
 2020 10:10:32 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        <virtio-dev@lists.oasis-open.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
Date:   Tue, 17 Mar 2020 10:10:31 +0100
Message-ID: <1780647.tdWV9SEqCh@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90VcbON1XTuBpuqxV6E+reY8dYq08N8G-jrAO=z-6ytcvtHQ@mail.gmail.com>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <CAD90VcZ5rYHw9qqS7pvaX0TP240qcmoA5MKxKuVVn-eVVrORSA@mail.gmail.com> <CAD90VcbON1XTuBpuqxV6E+reY8dYq08N8G-jrAO=z-6ytcvtHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On Dienstag, 17. März 2020 07:53:26 CET Keiichi Watanabe wrote:
> > > diff --git a/include/uapi/linux/virtio_video.h
> > > b/include/uapi/linux/virtio_video.h new file mode 100644
> > > index 000000000000..0dd98a2237c6
> > > --- /dev/null
> > > +++ b/include/uapi/linux/virtio_video.h
> > > @@ -0,0 +1,469 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > 
> > I suspect it's not expected to use GPL licence without exceptions in a
> > UAPI header file:
> > https://www.kernel.org/doc/html/v5.4/process/license-rules.html
> > 
> > If GPL is used here, only GPL user programs can include this header
> > file, can't they?
> > So, can we use BSD licence like other virtio headers (e.g. virtio_gpu.h)?
> > 
> > Note that I found this program when running
> > /scripts/headers_install.sh. Though it suggested to add "WITH
> > Linux-syscall-note", it shouldn't be the case because this header
> > doesn't provide syscall interface.
> > 
> > Best regards,
> > Keiichi
> > 
> > > +/*
> > > + * Virtio Video Device
> > > + *
> > > + * This header is BSD licensed so anyone can use the definitions
> > > + * to implement compatible drivers/servers:
> > > + *
> 
> Ah, this line says this header is BSD licensed.
> So, the SPDX-License-Identifier above should be simply wrong.
> 

According to some recent upstream discussion about virtio-snd, which was also 
proposed by our engineers, it should be
/* SPDX-License-Identifier: BSD-3-Clause */

Best regards,
Dmitry.

> Best regards,
> Keiichi


