Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C547D4FD
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 07:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfHAFmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 01:42:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfHAFmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 01:42:08 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4824A28BF70;
        Thu,  1 Aug 2019 06:42:06 +0100 (BST)
Date:   Thu, 1 Aug 2019 07:42:03 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hertz Wong <hertz.wong@rock-chips.com>
Subject: Re: [PATCH 7/9] media: hantro: Add core bits to support H264
 decoding
Message-ID: <20190801074203.76b439bd@collabora.com>
In-Reply-To: <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
        <20190619121540.29320-8-boris.brezillon@collabora.com>
        <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 1 Aug 2019 13:06:10 +0900
Tomasz Figa <tfiga@chromium.org> wrote:

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

Actually, I was wondering why it was not counted in ->sizeimage. I
thought you had a good reason to not expose the extra size to userspace
so I kept it like that.
