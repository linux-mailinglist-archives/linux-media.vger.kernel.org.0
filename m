Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E254A2A9902
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 17:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgKFQDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 11:03:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:59122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgKFQDm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 11:03:42 -0500
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66C2A22247;
        Fri,  6 Nov 2020 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604678621;
        bh=k8bryvFui+YoGklp94RFUzRsPMzTAL7+JGvq9QXQg+s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hi/uyH5WXU66Rm2JLXwlxWHG0n5p4kipBD9wlwWxVHzvp+063vHGOKEpCMH1LUxHw
         e6nFQ2VQhcxRGFOrda2acrUwOn11TDLqOXP/if7jmiZILokM3y6FesB5nFRHKsUSI2
         +FGZE3vX2mkQrh666F9acUBGbYRDuZ6R+741q6o4=
Received: by mail-lf1-f52.google.com with SMTP id u18so2621488lfd.9;
        Fri, 06 Nov 2020 08:03:41 -0800 (PST)
X-Gm-Message-State: AOAM531F51fbjo4t1JrT+K1Nt5DabMDJhuLwd8VpJse63Xpd+mmBpf93
        r2SdBlWm0WqzrLfFHnqPZK0Sn0YBSkhVvQv1HaM=
X-Google-Smtp-Source: ABdhPJy4L9sWNTrKjB39Lz4S8huMYtJ2miYTZnmYiCjhMmzPfT6Q8pHTbOo2LrWBLVMhDMAFLR/BADUAut2KfwSjmLs=
X-Received: by 2002:a19:c354:: with SMTP id t81mr562644lff.283.1604678619488;
 Fri, 06 Nov 2020 08:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20201106151411.321743-1-maxime@cerno.tech>
In-Reply-To: <20201106151411.321743-1-maxime@cerno.tech>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Sat, 7 Nov 2020 00:03:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66N1BF+ReqMwJOUPESvJOwm7w7exuc3T52GULxJHJqKzg@mail.gmail.com>
Message-ID: <CAGb2v66N1BF+ReqMwJOUPESvJOwm7w7exuc3T52GULxJHJqKzg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sunxi: Remove the calls to dma_direct_set_offset
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Christoph Hellwig <hch@lst.de>, devel@driverdev.osuosl.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Nov 6, 2020 at 11:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> Here's an attempt to removing the dma_direct_set_offset calls we have in
> numerous drivers and move all those quirks into a global notifier as suggested
> by Robin.
>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (7):
>   drm/sun4i: backend: Fix probe failure with multiple backends
>   soc: sunxi: Deal with the MBUS DMA offsets in a central place
>   drm/sun4i: backend: Remove the MBUS quirks
>   media: sun4i: Remove the MBUS quirks
>   media: sun6i: Remove the MBUS quirks
>   media: cedrus: Remove the MBUS quirks
>   media: sun8i-di: Remove the call to of_dma_configure

Whole series looks good to me.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Now the question remaining is how do we merge this series so that
the notifier gets merged before all the code dealing with the MBUS
quirk gets removed.


>  drivers/gpu/drm/sun4i/sun4i_backend.c         |  13 --
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 ----
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  17 ---
>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  |   4 -
>  drivers/soc/sunxi/Kconfig                     |   8 ++
>  drivers/soc/sunxi/Makefile                    |   1 +
>  drivers/soc/sunxi/sunxi_mbus.c                | 132 ++++++++++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   1 -
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 -
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 ---
>  10 files changed, 141 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/soc/sunxi/sunxi_mbus.c
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
