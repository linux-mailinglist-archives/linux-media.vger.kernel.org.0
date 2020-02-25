Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B95116BE1D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 11:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgBYKAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 05:00:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44620 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729183AbgBYKAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 05:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582624806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v5+GHWTChLbfFttBskHIPRCdq5tT5TfEElH1eb8aU/Q=;
        b=SmSOIbZCe3iYKwLZ2dpxJ0Re8Sfh67Du/aY9e3ka4GeOk2OL+meNo+p1TTGHepKO+8VvZn
        xUpo8fC6Zx+2u+Z5pEJ9k22egGuQVuAK2Xrzxe9PzR/F3KDlg3IGQIE1l+lhouWcqKEJe4
        sdQ6WnBKJydUYrbBPKhHyER7JAQOpRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Oi2aRwcoPVWe9m4X_cHgEw-1; Tue, 25 Feb 2020 05:00:04 -0500
X-MC-Unique: Oi2aRwcoPVWe9m4X_cHgEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9594818C8C04;
        Tue, 25 Feb 2020 10:00:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com [10.36.116.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA5D5C105;
        Tue, 25 Feb 2020 09:59:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id DF55E1744A; Tue, 25 Feb 2020 10:59:56 +0100 (CET)
Date:   Tue, 25 Feb 2020 10:59:56 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dstaessens@chromium.org,
        dmitry.sepp@opensynergy.com, egranata@google.com,
        fziglio@redhat.com, hverkuil@xs4all.nl, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device
 specification
Message-ID: <20200225095956.7rtwugfru4dbjj7q@sirius.home.kraxel.org>
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206102058.247258-2-keiichiw@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 06, 2020 at 07:20:57PM +0900, Keiichi Watanabe wrote:
> From: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> 
> The virtio video encoder device and decoder device provide functionalities to
> encode and decode video stream respectively.
> Though video encoder and decoder are provided as different devices, they use a
> same protocol.
> 
> Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>

Finally found the time for a closer look.
Pretty good overall, some minor nits below ...

> +\begin{description}
> +\item[\field{version}] is the protocol version that the device talks.
> +  The device MUST set this to 0.

What is the intended use case for this?

Given that virtio has feature flags to negotiate support for optional
features and protocol extensions between driver and device, why do you
think this is needed?

> +The format description \field{virtio_video_format_desc} is defined as
> +follows:
> +\begin{lstlisting}
> +enum virtio_video_format {
> +        /* Raw formats */
> +        VIRTIO_VIDEO_FORMAT_RAW_MIN = 1,
> +        VIRTIO_VIDEO_FORMAT_ARGB8888 = VIRTIO_VIDEO_FORMAT_RAW_MIN,
> +        VIRTIO_VIDEO_FORMAT_BGRA8888,
> +        VIRTIO_VIDEO_FORMAT_NV12, /* 12  Y/CbCr 4:2:0  */
> +        VIRTIO_VIDEO_FORMAT_YUV420, /* 12  YUV 4:2:0     */
> +        VIRTIO_VIDEO_FORMAT_YVU420, /* 12  YVU 4:2:0     */
> +        VIRTIO_VIDEO_FORMAT_RAW_MAX = VIRTIO_VIDEO_FORMAT_YVU420,

I'm wondering what the *_MIN and *_MAX values here (and elsewhere) are
good for?  I doubt drivers would actually loop over formats from min to
max, I'd expect they check for specific formats they can handle instead.

If you want define the range for valid raw formats I'd suggest to leave
some room, so new formats can be added without changing MAX values, i.e.
use -- for example -- RAW_MIN = 0x100, RAW_MAX = 0x1ff, CODED_MIN=0x200,
CODED_MAX=0x2ff.  Or just drop them ...

> +struct virtio_video_query_control_level {
> +        le32 profile; /* One of VIRTIO_VIDEO_PROFILE_* */
                                                ^^^^^^^  LEVEL ?

cheers,
  Gerd

