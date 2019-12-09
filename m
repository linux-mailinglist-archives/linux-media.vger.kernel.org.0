Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9EF116C60
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 12:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLILif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 06:38:35 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:59459 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfLILif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 06:38:35 -0500
Received: from spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117])
        by plasma.jpberlin.de (Postfix) with ESMTP id 4A281A5187;
        Mon,  9 Dec 2019 12:38:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id xIptlUPz5zZC; Mon,  9 Dec 2019 12:38:21 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id A2B3FA0916;
        Mon,  9 Dec 2019 12:38:20 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Dec 2019
 12:38:20 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     Keiichi Watanabe <keiichiw@chromium.org>,
        Enrico Granata <egranata@google.com>,
        <virtio-dev@lists.oasis-open.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Mon, 9 Dec 2019 12:38:20 +0100
Message-ID: <1970145.L65FEUb58e@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191209104615.ulct6p34cn7ypvrz@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <CAD90VcY1QgJGYYXTWDFMVshtV0ZnwLjYUzf3uHcDR=FNA2mMEw@mail.gmail.com> <20191209104615.ulct6p34cn7ypvrz@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Montag, 9. Dezember 2019 11:46:15 CET Gerd Hoffmann wrote:
>   Hi,
> 
> > > For (1) you'll simply do a QUEUE_BUFFER.  The command carries references
> > > to the buffer pages.  No resource management needed.
> > > 
> > > For (2) you'll have RESOURCE_CREATE + RESOURCE_DESTROY + QUEUE_RESOURCE,
> > > where RESOURCE_CREATE passes the scatter list of buffer pages to the
> > > host and QUEUE_RESOURCE will carry just the resource id.
> > > 
> > > For (3) you'll have RESOURCE_IMPORT + RESOURCE_DESTROY + QUEUE_RESOURCE.
> > 
> > Thanks for the clarification.
> > On second thought, however, I'm wondering if we should keep all
> > RESOURCE controls.
> > This should be an option (4).
> 
> Well, that's actually (2), aka "we use RESOURCE_* commands to manage
> resources".  With the commands in the latest draft that would be:
> 
>   (1) RESOURCE_CREATE
>   (2) RESOURCE_ATTACH_BACKING
>   (3) RESOURCE_QUEUE (resource can be used multiple times here)
>   (4) RESOURCE_DETACH_BACKING
>   (5) RESOURCE_DESTROY
> 
> I'm not sure we need the separate *_BACKING commands.  I think we could
> also have RESOURCE_CREATE pass the buffer pages scatter list instead.
> 
> Why it is done this way?  Just because the design was copied from
> virtio-gpu?  Or is there some specific reason?

Yes, the design was just derived from virtio-gpu at early stages.

I do agree we should merge the two steps.

> 
> cheers,
>   Gerd


