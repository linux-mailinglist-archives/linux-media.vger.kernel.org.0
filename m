Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF67824FC
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 20:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfHESjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 14:39:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56342 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbfHESjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 14:39:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E2FA8289EEF
Message-ID: <cf60476860b1691ac15c17bedeee3cb908d17faf.camel@collabora.com>
Subject: Re: [PATCH 7/9] media: hantro: Add core bits to support H264
 decoding
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hertz Wong <hertz.wong@rock-chips.com>
Date:   Mon, 05 Aug 2019 15:38:39 -0300
In-Reply-To: <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
         <20190619121540.29320-8-boris.brezillon@collabora.com>
         <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Tomasz,

On Thu, 2019-08-01 at 13:06 +0900, Tomasz Figa wrote:
> Hi Boris,
> 
> On Wed, Jun 19, 2019 at 9:15 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> [snip]
> > @@ -533,10 +535,21 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> >                 return -EINVAL;
> >         }
> > 
> > +       /* The H264 decoder needs extra size on the output buffer. */
> > +       if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE_RAW)
> > +               extra_size0 = 128 * DIV_ROUND_UP(pixfmt->width, 16) *
> > +                             DIV_ROUND_UP(pixfmt->height, 16);
> > +
> 
> I wonder if this shouldn't be accounted for already in the sizeimage
> returned by TRY_/S_FMT, so that the application can know the required
> buffer size if it uses some external allocator and DMABUF memory type.
> I know we had it like this in our downstream code, but it wasn't the
> problem because we use minigbm, where we explicitly add the same
> padding in the rockchip backend. Any thoughts?
> 

Nice catch. This should be fixed and accounted in TRY_FMT as you suggest.

Thanks,
Eze 

