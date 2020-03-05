Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E3017B0C6
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 22:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgCEViB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 16:38:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:40382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgCEViB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 16:38:01 -0500
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F0192072A;
        Thu,  5 Mar 2020 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583444279;
        bh=yzdmROVoTcnH2uJKy6mKkDhIXA05EsrK9nODytG0Iis=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O3/pH4N1qeN9EWMQcscxR6Rm3w5KfJfGwdYcRrC0eGAexPcif+iRAMsSFA7cJ0s01
         bG0p5dM8t5ySaLPCRe9EoWM3LSGEDdGOsf0vHKX4Dr2W9uWjrITydrAwMaEgFS4sxA
         9F5/inXSJbn2qlrzfq/A35AmELPjRV/hW54ox8UM=
Date:   Thu, 5 Mar 2020 22:37:50 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 2/6] media: v4l2-core: Add helpers to build the H264
 P/B0/B1 reflists
Message-ID: <20200305223750.14514063@coco.lan>
In-Reply-To: <20200305211535.2e9a6673@collabora.com>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-3-ezequiel@collabora.com>
        <20200302142433.0ad1b383@coco.lan>
        <20200302154426.5fb09f91@collabora.com>
        <c7a88abfaf00c00a5c4c4239d1d9c7b348bc052e.camel@ndufresne.ca>
        <20200305211535.2e9a6673@collabora.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Mar 2020 21:15:35 +0100
Boris Brezillon <boris.brezillon@collabora.com> escreveu:

> On Thu, 05 Mar 2020 14:42:34 -0500
> Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>=20
> > Le lundi 02 mars 2020 =C3=A0 15:44 +0100, Boris Brezillon a =C3=A9crit =
: =20
> > > On Mon, 2 Mar 2020 14:24:33 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >    =20
> > > > Em Thu, 20 Feb 2020 13:30:12 -0300
> > > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > > >    =20
> > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >=20
> > > > > Building those list is a standard procedure described in section
> > > > > '8.2.4 Decoding process for reference picture lists construction'=
 of
> > > > > the H264 specification.
> > > > >=20
> > > > > We already have 2 drivers needing the same logic (hantro and rkvd=
ec) and
> > > > > I suspect we will soon have more.
> > > > >=20
> > > > > Let's provide generic helpers to create those lists.
> > > > >=20
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/Kconfig     |   4 +
> > > > >  drivers/media/v4l2-core/Makefile    |   1 +
> > > > >  drivers/media/v4l2-core/v4l2-h264.c | 258 ++++++++++++++++++++++=
++++++
> > > > >  include/media/v4l2-h264.h           |  85 +++++++++
> > > > >  4 files changed, 348 insertions(+)
> > > > >  create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
> > > > >  create mode 100644 include/media/v4l2-h264.h
> > > > >=20
> > > > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-
> > > > > core/Kconfig
> > > > > index 39e3fb30ba0b..8a4ccfbca8cf 100644
> > > > > --- a/drivers/media/v4l2-core/Kconfig
> > > > > +++ b/drivers/media/v4l2-core/Kconfig
> > > > > @@ -45,6 +45,10 @@ config VIDEO_PCI_SKELETON
> > > > >  config VIDEO_TUNER
> > > > >  	tristate
> > > > > =20
> > > > > +# Used by drivers that need v4l2-h264.ko
> > > > > +config V4L2_H264
> > > > > +	tristate
> > > > > +
> > > > >  # Used by drivers that need v4l2-mem2mem.ko
> > > > >  config V4L2_MEM2MEM_DEV
> > > > >  	tristate
> > > > > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l=
2-
> > > > > core/Makefile
> > > > > index 786bd1ec4d1b..c5c53e0941ad 100644
> > > > > --- a/drivers/media/v4l2-core/Makefile
> > > > > +++ b/drivers/media/v4l2-core/Makefile
> > > > > @@ -21,6 +21,7 @@ obj-$(CONFIG_VIDEO_V4L2) +=3D v4l2-dv-timings.o
> > > > >  obj-$(CONFIG_VIDEO_TUNER) +=3D tuner.o
> > > > > =20
> > > > >  obj-$(CONFIG_V4L2_MEM2MEM_DEV) +=3D v4l2-mem2mem.o
> > > > > +obj-$(CONFIG_V4L2_H264) +=3D v4l2-h264.o
> > > > > =20
> > > > >  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) +=3D v4l2-flash-led-class.o
> > > > > =20
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/=
v4l2-
> > > > > core/v4l2-h264.c
> > > > > new file mode 100644
> > > > > index 000000000000..4f68c27ec7fd
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > > > > @@ -0,0 +1,258 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * V4L2 H264 helpers.
> > > > > + *
> > > > > + * Copyright (C) 2019 Collabora, Ltd.
> > > > > + *
> > > > > + * Author: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > + */
> > > > > +
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/sort.h>
> > > > > +
> > > > > +#include <media/v4l2-h264.h>
> > > > > +
> > > > > +/**
> > > > > + * v4l2_h264_init_reflist_builder() - Initialize a P/B0/B1 refer=
ence list
> > > > > + *				      builder
> > > > > + *
> > > > > + * @b: the builder context to initialize
> > > > > + * @dec_params: decode parameters control
> > > > > + * @slice_params: first slice parameters control
> > > > > + * @sps: SPS control
> > > > > + * @dpb: DPB to use when creating the reference list
> > > > > + */
> > > > > +void
> > > > > +v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder =
*b,
> > > > > +		const struct v4l2_ctrl_h264_decode_params *dec_params,
> > > > > +		const struct v4l2_ctrl_h264_slice_params *slice_params,
> > > > > +		const struct v4l2_ctrl_h264_sps *sps,
> > > > > +		const struct v4l2_h264_dpb_entry *dpb)     =20
> > > >=20
> > > > The prototype here is not nice...
> > > >    =20
> > > > > +{
> > > > > +	int cur_frame_num, max_frame_num;
> > > > > +	unsigned int i;
> > > > > +
> > > > > +	max_frame_num =3D 1 << (sps->log2_max_frame_num_minus4 + 4);
> > > > > +	cur_frame_num =3D slice_params->frame_num;
> > > > > +
> > > > > +	memset(b, 0, sizeof(*b));
> > > > > +	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
> > > > > +		b->cur_pic_order_count =3D min(dec_params->bottom_field_order_=
cnt,
> > > > > +					     dec_params->top_field_order_cnt);
> > > > > +	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIEL=
D)
> > > > > +		b->cur_pic_order_count =3D dec_params->bottom_field_order_cnt;
> > > > > +	else
> > > > > +		b->cur_pic_order_count =3D dec_params->top_field_order_cnt;
> > > > > +
> > > > > +	for (i =3D 0; i < 16; i++) {
> > > > > +		u32 pic_order_count;
> > > > > +
> > > > > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > > > > +			continue;
> > > > > +
> > > > > +		b->refs[i].pic_num =3D dpb[i].pic_num;     =20
> > > >=20
> > > > ... as you're expecting a fixed number of elements at DPB array, an=
d using
> > > > a magic number (16) inside the for loop.   =20
> > >=20
> > > I used to have a '#define V4L2_H264_NUM_DPB_ENTRIES 16' but have been
> > > told that this is an arbitrary limitation (the spec does not explicit=
ly
> > > limit the DPB size, even if all the HW we've seen seem to limit it to
> > > 16). Maybe we can pass the DPB array size as an argument so it stays
> > > HW-specific.   =20
> >=20
> > it's formalized in A.31 h), to quote it:
> >=20
> > max_dec_frame_buffering <=3D MaxDpbFrames, where MaxDpbFrames is equal =
to
> >=20
> >   Min( MaxDpbMbs / ( PicWidthInMbs * FrameHeightInMbs ), 16 )
> >=20
> > So a DPB larger then this is not an H.24 DPB. =20
>=20
> My bad, I mixed "max number of slices per frame" and "max number of
> entries in the DPB". The first one I couldn't find a clear answer to,
> while the second one has been 16 from the start. Sorry for the
> confusion.

Well, newer versions of the spec might change it. In any case, I guess
a define should work properly. If the spec is ever updated to accept
a bigger number, a simple change at the define would be enough to
solve.

Thanks,
Mauro
