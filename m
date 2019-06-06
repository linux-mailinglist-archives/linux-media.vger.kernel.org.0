Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7837764
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 17:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbfFFPGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 11:06:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58772 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbfFFPGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 11:06:19 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 20FAC2852B6;
        Thu,  6 Jun 2019 16:06:17 +0100 (BST)
Date:   Thu, 6 Jun 2019 17:06:14 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 01/10] rockchip/vpu: rename from rockchip to hantro
Message-ID: <20190606170614.526d3380@collabora.com>
In-Reply-To: <20190605132242.102fcdd2@collabora.com>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-2-p.zabel@pengutronix.de>
        <20190605132242.102fcdd2@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 Jun 2019 13:22:42 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 31 May 2019 10:55:14 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Rename the driver and all relevant identifiers from Rockchip to Hantro,
> > as other Hantro IP based VPU implementations can be supported by the
> > same driver.
> > The RK3288 decoder is Hantro G1 based, the encoder is Hantro H1.
> > 
> > This patch just renames, no functional changes.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  MAINTAINERS                                   |   4 +-
> >  drivers/staging/media/Kconfig                 |   2 +-
> >  drivers/staging/media/Makefile                |   2 +-
> >  .../media/{rockchip/vpu => hantro}/Kconfig    |  11 +-
> >  drivers/staging/media/hantro/Makefile         |  13 +
> >  .../media/{rockchip/vpu => hantro}/TODO       |   0
> >  .../vpu/rockchip_vpu.h => hantro/hantro.h}    | 136 +++++-----
> >  .../hantro_drv.c}                             | 251 +++++++++---------
> >  .../hantro_g1_mpeg2_dec.c}                    |  55 ++--
> >  .../hantro_h1_jpeg_enc.c}                     |  44 +--
> >  drivers/staging/media/hantro/hantro_hw.h      | 102 +++++++
> >  .../hantro_jpeg.c}                            |  18 +-
> >  drivers/staging/media/hantro/hantro_jpeg.h    |  13 +
> >  .../hantro_mpeg2.c}                           |  14 +-
> >  .../hantro_v4l2.c}                            | 234 ++++++++--------
> >  .../hantro_v4l2.h}                            |  16 +-
> >  .../{rockchip/vpu => hantro}/rk3288_vpu_hw.c  |  64 ++---
> >  .../vpu => hantro}/rk3288_vpu_regs.h          |   2 +-
> >  .../{rockchip/vpu => hantro}/rk3399_vpu_hw.c  |  64 ++---
> >  .../vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c   |  32 +--
> >  .../vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c  |  37 ++-
> >  .../vpu => hantro}/rk3399_vpu_regs.h          |   2 +-
> >  drivers/staging/media/rockchip/vpu/Makefile   |  14 -
> >  .../media/rockchip/vpu/rockchip_vpu_hw.h      | 103 -------
> >  .../media/rockchip/vpu/rockchip_vpu_jpeg.h    |  14 -
> >  25 files changed, 616 insertions(+), 631 deletions(-)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/Kconfig (59%)
> >  create mode 100644 drivers/staging/media/hantro/Makefile
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/TODO (100%)
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h} (69%)
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c} (74%)
> >  rename drivers/staging/media/{rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c => hantro/hantro_g1_mpeg2_dec.c} (87%)
> >  rename drivers/staging/media/{rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c => hantro/hantro_h1_jpeg_enc.c} (76%)
> >  create mode 100644 drivers/staging/media/hantro/hantro_hw.h
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c} (95%)
> >  create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c} (79%)
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c} (69%)
> >  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h} (53%)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3288_vpu_hw.c (68%)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3288_vpu_regs.h (99%)  
> 
> Didn't notice that in my initial review, but rk3288_vpu_regs.h should
> be split in 2: hantro_{g1,h1}_regs.h (g1 being the decoder part and h1
> the encoder).
> 
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c (69%)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c (86%)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c (92%)
> >  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h (99%)  
> 
> Same here, rk3399_vpu_regs.h should be split into hantro_{g2,h2}_regs.h
> (I still need to make sure this is actually a g2/h2 combo we have on
> this SoC). That's also true for the
> rk3399_vpu_hw_{mpeg2_dec,jpeg_enc}.c files: they should be renamed
> hantro_{g2_mpeg2_dec,h2_jpeg_enc}.c

Sorry, I was wrong, it's not a G2/H2 combo we have, it looks like G1/H1
with shuffled regs/fields. The ID are 0x45142158 (for the decoder) and
0x3a122158 (for the encoder). Couldn't find any reference to those IDs
in the hantro reference drivers.

Anyway, I'm working on abstracting the reg layout so we can have the
same base of code for both variants.
