Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04DC1128034
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 16:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLTP7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 10:59:04 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:45211 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLTP7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 10:59:04 -0500
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id F39A4B4C1F;
        Fri, 20 Dec 2019 16:58:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id zlMr6YNraOhu; Fri, 20 Dec 2019 16:58:58 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id E23C5B7B9A;
        Fri, 20 Dec 2019 16:58:57 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 20 Dec
 2019 16:58:57 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
CC:     <virtio-dev@lists.oasis-open.org>, <linux-media@vger.kernel.org>,
        <acourbot@chromium.org>, <alexlau@chromium.org>, <daniel@ffwll.ch>,
        <dgreid@chromium.org>, <egranata@google.com>, <fziglio@redhat.com>,
        <hverkuil@xs4all.nl>, <kraxel@redhat.com>, <marcheu@chromium.org>,
        <posciak@chromium.org>, <spice-devel@lists.freedesktop.org>,
        <stevensd@chromium.org>, <tfiga@chromium.org>, <uril@redhat.com>
Subject: Re: [PATCH v2 0/1] VirtIO video device specification
Date:   Fri, 20 Dec 2019 16:58:57 +0100
Message-ID: <2730251.jGmEEvB50I@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191218130214.170703-1-keiichiw@chromium.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe wrote:
> Hi,
> This is the 2nd version of virtio-video patch. The PDF is available in [1].
> The first version was sent at [2].
> 
> Any feedback would be appreciated. Thank you.
> 
> Best,
> Keiichi
> 
> [1]:
> https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVapOFx?us
> p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> 
> Change log:
> 
> v2:
> * Removed functionalities except encoding and decoding.
> * Splited encoder and decoder into different devices that use the same
> protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> * Updated structs for capabilities.
>   - Defined new structs and enums such as image formats, profiles, range
> (min, max, step), etc
>     * For virtio_video_pixel_format, chose a naming convention that is used
>       in DRM. We removed XBGR, NV21 and I422, as they are not used in the
>       current draft implementation. https://lwn.net/Articles/806416/
>   - Removed virtio_video_control, whose usage was not documented yet and
> which is not necessary for the simplest decoding scenario.
>   - Removed virtio_video_desc, as it is no longer needed.
> * Updated struct virtio_video_config for changes around capabilities.
> * Added a way to represent supported combinations of formats.
>   - A field "mask" in virtio_video_format_desc plays this role.
> * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play any
> meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH, DETACH}_BACKING
> and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way to
> notify/specify resource creation method.
>   - Added a feature flag.
>   - Defined enum virtio_video_mem_type.
>   - Added new fields in video_stream_create.
> * Modified fields in virtio_video_params.
>   - Added crop information.
> * Removed enum virtio_video_channel_type because we can get this information
> by image format. 
Could you please explain this? How do you get the information?

Suppose you have some piece of HW on the host side that wants I420 as one 
contig buffer w/ some offsets. But on the driver side, say, gralloc gives you 
three separate buffers, one per channel. How do we pass those to the device 
then?

Best regards,
Dmitry.

> * Renamed virtio_video_pin to virtio_video_buf_type.
>   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> * Added an error event.
> * Reordered some subsections.
> * Changed styles to make it consistent with other devices.
> 
> Dmitry Sepp (1):
>   virtio-video: Add virtio video device specification
> 
>  content.tex      |   1 +
>  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 580 insertions(+)
>  create mode 100644 virtio-video.tex
> 
> --
> 2.24.1.735.g03f4e72817-goog


