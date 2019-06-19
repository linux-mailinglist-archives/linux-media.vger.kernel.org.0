Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EB84B81A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 14:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731591AbfFSMX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 08:23:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40770 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfFSMX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 08:23:59 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A3533260701;
        Wed, 19 Jun 2019 13:23:56 +0100 (BST)
Date:   Wed, 19 Jun 2019 14:23:53 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/9] media: hantro: Add support for H264 decoding
Message-ID: <20190619142353.184a625a@collabora.com>
In-Reply-To: <20190619121540.29320-1-boris.brezillon@collabora.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 19 Jun 2019 14:15:31 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This patch series adds support H264 decoding support to the hantro
> driver and doing some consilidation cleanup in the driver along the
> way.
> 
> Some details about the patches forming this patchset:
> 
> * The first patch is adding support for the sort_r() variant and has
>   been posted separately by Rasmus. I put it back there because Andrew
>   told me to repost it with the patch series using this new variant.
>   As mentioned in the patch itself, I'd like this patch to be merged
>   as soon as possible to avoid the synchronisation burden that might
>   appear if we decide to delay it.
> 
> * Patch 2 is needed to properly propagate the output buf timestamp to
>   the capture buf one, which is required for intra-frame references.
> 
> * Patches 3 to 6 are consolidating the code by providing helpers that
>   can be used by all hantro backend and simplifying the ctrl
>   initialization logic. We also constify the controls array.
> 
> * Patches 7 to 8 are adding common H264 decoding bits and patch 9 is
>   enabling H264 decoding on rk3288
> 
> Now, a few words about the dependencies. Unfortunately there are a lot,
> and that'd be great to have some of them merged.
> 
> * This series is based on top of Ezequiel's VP8 work [1].
> * It depends on [2] which defines/described the H264 decoding mode
>   control.
> * Depends on [3] since I'm using vb2_get_buffer() to retrieve a
>   reference buffer
> * The final dep is a fix I sent this morning allowing me to simplify the
>   ctrl initialization logic [4]

And now the links :-).

[1]https://patchwork.kernel.org/project/linux-media/list/?series=131677
[2]https://patchwork.kernel.org/project/linux-media/list/?series=129567
[3]https://patchwork.kernel.org/project/linux-media/list/?series=129895
[4]https://patchwork.kernel.org/patch/11003737/

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (5):
>   media: hantro: Move copy_metadata() before doing a decode operation
>   media: hantro: Constify the control array
>   media: hantro: Simplify the controls creation logic
>   media: hantro: Add hantro_get_{src,dst}_buf() helpers
>   media: hantro: Add helpers to prepare/finish a run
> 
> Hertz Wong (3):
>   media: hantro: Add core bits to support H264 decoding
>   media: hantro: Add support for H264 decoding on G1
>   media: hantro: Enable H264 decoding on rk3288
> 
> Rasmus Villemoes (1):
>   lib/sort.c: implement sort() variant taking context argument
> 
>  drivers/staging/media/hantro/Makefile         |   2 +
>  drivers/staging/media/hantro/hantro.h         |  24 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  95 ++-
>  .../staging/media/hantro/hantro_g1_h264_dec.c | 295 ++++++++
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |  14 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |  17 +-
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c |  11 +-
>  drivers/staging/media/hantro/hantro_h264.c    | 638 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |  55 ++
>  drivers/staging/media/hantro/hantro_v4l2.c    |  15 +-
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  21 +-
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  12 +-
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  14 +-
>  include/linux/sort.h                          |   5 +
>  lib/sort.c                                    |  34 +-
>  15 files changed, 1175 insertions(+), 77 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/hantro_g1_h264_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_h264.c
> 

