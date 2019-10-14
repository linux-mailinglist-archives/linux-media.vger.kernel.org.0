Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD56D6351
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 15:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbfJNNFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 09:05:10 -0400
Received: from plasma6.jpberlin.de ([80.241.56.68]:55343 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730619AbfJNNFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 09:05:10 -0400
Received: from spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123])
        by plasma.jpberlin.de (Postfix) with ESMTP id 1EC3FB980D;
        Mon, 14 Oct 2019 15:05:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id hFRgc3p4aSTV; Mon, 14 Oct 2019 15:05:05 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 92EB3B0B01;
        Mon, 14 Oct 2019 15:05:04 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 14 Oct
 2019 15:05:04 +0200
From:   Dmitry Morozov <dmitry.morozov@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     Tomasz Figa <tfiga@chromium.org>, <stevensd@chromium.org>,
        <virtio-dev@lists.oasis-open.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <alexlau@chromium.org>, <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode device specification
Date:   Mon, 14 Oct 2019 15:05:03 +0200
Message-ID: <12599990.jpbsygJuY9@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191014123443.ey3yfdnr43kplqaq@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org> <15135216.K0K410U5qv@os-lin-dmo> <20191014123443.ey3yfdnr43kplqaq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Montag, 14. Oktober 2019 14:34:43 CEST Gerd Hoffmann wrote:
>   Hi,
> 
> > My take on this (for a decoder) would be to allocate memory for output
> > buffers from a secure ION heap, import in the v4l2 driver, and then to
> > provide those to the device using virtio. The device side then uses the
> > dmabuf framework to make the buffers accessible for the hardware. I'm not
> > sure about that, it's just an idea.
> 
> Virtualization aside, how does the complete video decoding workflow
> work?  I assume along the lines of ...
> 
>   (1) allocate buffer for decoded video frames (from ion).
>   (2) export those buffers as dma-buf.
>   (3) import dma-buf to video decoder.
>   (4) import dma-buf to gpu.
> 
> ... to establish buffers shared between video decoder and gpu?
> 
> Then feed the video stream into the decoder, which decodes into the ion
> buffers?  Ask the gpu to scanout the ion buffers to show the video?
> 
> cheers,
>   Gerd

Yes, exactly.

[decoder]
1) Input buffers are allocated using  VIDIOC_*BUFS.
2) Output buffers are allocated in a guest specific manner (ION, gbm).
3) Both input and output buffers are exported as dma-bufs.
4) The backing storage of both inputs and outputs is made available to the 
device.
5) Decoder hardware writes to output buffers directly.
6) Back to the guest side, the output dma-bufs are used by (virtio-) gpu.

Best regards,
Dmitry 


