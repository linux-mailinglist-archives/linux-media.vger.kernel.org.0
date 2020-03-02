Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CC3175E0C
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgCBPVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:21:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:56122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCBPVI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Mar 2020 10:21:08 -0500
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4B6C2146E;
        Mon,  2 Mar 2020 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583162467;
        bh=PLvk6y3hcWUG0cJaGOrwLbmj0GYuf2HRT1LWd/H3Pvw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vxmofjcBaFgoMf1BcXCB1UtH3FNWdlGmtwPDusDU85gCm5zGZy4rUj4XM2Ocx1qEa
         WTIdopeGSmWkh7UFfRTCZR56v+z+5BpuwItWvaTJeK/6UqNFtkxlfRgzbja7Ns6K7t
         mnSWRGWyXyZ387AYxiKeIymAFHqgLmIuFmCDrxAk=
Date:   Mon, 2 Mar 2020 16:21:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 2/6] media: v4l2-core: Add helpers to build the H264
 P/B0/B1 reflists
Message-ID: <20200302162100.72696380@coco.lan>
In-Reply-To: <20200302154426.5fb09f91@collabora.com>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-3-ezequiel@collabora.com>
        <20200302142433.0ad1b383@coco.lan>
        <20200302154426.5fb09f91@collabora.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 2 Mar 2020 15:44:26 +0100
Boris Brezillon <boris.brezillon@collabora.com> escreveu:

> On Mon, 2 Mar 2020 14:24:33 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Thu, 20 Feb 2020 13:30:12 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >   
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > Building those list is a standard procedure described in section
> > > '8.2.4 Decoding process for reference picture lists construction' of
> > > the H264 specification.
> > > 
> > > We already have 2 drivers needing the same logic (hantro and rkvdec) and
> > > I suspect we will soon have more.
> > > 
> > > Let's provide generic helpers to create those lists.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/v4l2-core/Kconfig     |   4 +
> > >  drivers/media/v4l2-core/Makefile    |   1 +
> > >  drivers/media/v4l2-core/v4l2-h264.c | 258 ++++++++++++++++++++++++++++
> > >  include/media/v4l2-h264.h           |  85 +++++++++
> > >  4 files changed, 348 insertions(+)
> > >  create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
> > >  create mode 100644 include/media/v4l2-h264.h
> > > 
> > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > index 39e3fb30ba0b..8a4ccfbca8cf 100644
> > > --- a/drivers/media/v4l2-core/Kconfig
> > > +++ b/drivers/media/v4l2-core/Kconfig
> > > @@ -45,6 +45,10 @@ config VIDEO_PCI_SKELETON
> > >  config VIDEO_TUNER
> > >  	tristate
> > >  
> > > +# Used by drivers that need v4l2-h264.ko
> > > +config V4L2_H264
> > > +	tristate
> > > +
> > >  # Used by drivers that need v4l2-mem2mem.ko
> > >  config V4L2_MEM2MEM_DEV
> > >  	tristate
> > > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > > index 786bd1ec4d1b..c5c53e0941ad 100644
> > > --- a/drivers/media/v4l2-core/Makefile
> > > +++ b/drivers/media/v4l2-core/Makefile
> > > @@ -21,6 +21,7 @@ obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
> > >  obj-$(CONFIG_VIDEO_TUNER) += tuner.o
> > >  
> > >  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
> > > +obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> > >  
> > >  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> > >  
> > > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> > > new file mode 100644
> > > index 000000000000..4f68c27ec7fd
> > > --- /dev/null
> > > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > > @@ -0,0 +1,258 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * V4L2 H264 helpers.
> > > + *
> > > + * Copyright (C) 2019 Collabora, Ltd.
> > > + *
> > > + * Author: Boris Brezillon <boris.brezillon@collabora.com>
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +#include <linux/sort.h>
> > > +
> > > +#include <media/v4l2-h264.h>
> > > +
> > > +/**
> > > + * v4l2_h264_init_reflist_builder() - Initialize a P/B0/B1 reference list
> > > + *				      builder
> > > + *
> > > + * @b: the builder context to initialize
> > > + * @dec_params: decode parameters control
> > > + * @slice_params: first slice parameters control
> > > + * @sps: SPS control
> > > + * @dpb: DPB to use when creating the reference list
> > > + */
> > > +void
> > > +v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> > > +		const struct v4l2_ctrl_h264_decode_params *dec_params,
> > > +		const struct v4l2_ctrl_h264_slice_params *slice_params,
> > > +		const struct v4l2_ctrl_h264_sps *sps,
> > > +		const struct v4l2_h264_dpb_entry *dpb)    
> > 
> > The prototype here is not nice...
> >   
> > > +{
> > > +	int cur_frame_num, max_frame_num;
> > > +	unsigned int i;
> > > +
> > > +	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
> > > +	cur_frame_num = slice_params->frame_num;
> > > +
> > > +	memset(b, 0, sizeof(*b));
> > > +	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
> > > +		b->cur_pic_order_count = min(dec_params->bottom_field_order_cnt,
> > > +					     dec_params->top_field_order_cnt);
> > > +	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > > +		b->cur_pic_order_count = dec_params->bottom_field_order_cnt;
> > > +	else
> > > +		b->cur_pic_order_count = dec_params->top_field_order_cnt;
> > > +
> > > +	for (i = 0; i < 16; i++) {
> > > +		u32 pic_order_count;
> > > +
> > > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > > +			continue;
> > > +
> > > +		b->refs[i].pic_num = dpb[i].pic_num;    
> > 
> > ... as you're expecting a fixed number of elements at DPB array, and using
> > a magic number (16) inside the for loop.  
> 
> I used to have a '#define V4L2_H264_NUM_DPB_ENTRIES 16' but have been
> told that this is an arbitrary limitation (the spec does not explicitly
> limit the DPB size, even if all the HW we've seen seem to limit it to
> 16).

Yeah, 16 seems an arbitrary limitation to me too. Yet, the way it
is, the code still has this arbitrary limit, except that it is now
split into different places, making worse to change if we ever need
to extend it.

At least with a define, if we need to change it to, let's say, 32,
it would be just a matter of changing the #define.

> Maybe we can pass the DPB array size as an argument so it stays
> HW-specific.

That would work too, but then you'll likely need to add dynamic
allocation for the structs, with would add more complexity without
a real use-case.

> 
> >   
> > > +
> > > +		/*
> > > +		 * Handle frame_num wraparound as described in section
> > > +		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
> > > +		 * TODO: This logic will have to be adjusted when we start
> > > +		 * supporting interlaced content.
> > > +		 */
> > > +		if (dpb[i].frame_num > cur_frame_num)
> > > +			b->refs[i].frame_num = (int)dpb[i].frame_num -
> > > +					       max_frame_num;
> > > +		else
> > > +			b->refs[i].frame_num = dpb[i].frame_num;
> > > +
> > > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> > > +			pic_order_count = min(dpb[i].top_field_order_cnt,
> > > +					      dpb[i].bottom_field_order_cnt);
> > > +		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> > > +			pic_order_count = dpb[i].bottom_field_order_cnt;
> > > +		else
> > > +			pic_order_count = dpb[i].top_field_order_cnt;
> > > +
> > > +		b->refs[i].pic_order_count = pic_order_count;
> > > +		b->unordered_reflist[b->num_valid] = i;
> > > +		b->num_valid++;
> > > +	}
> > > +
> > > +	for (i = b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
> > > +		b->unordered_reflist[i] = i;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
> > > +
> > > +static int v4l2_h264_p_ref_list_cmp(const void *ptra, const void *ptrb,
> > > +				    const void *data)
> > > +{
> > > +	const struct v4l2_h264_reflist_builder *builder = data;
> > > +	u8 idxa, idxb;
> > > +
> > > +	idxa = *((u8 *)ptra);
> > > +	idxb = *((u8 *)ptrb);
> > > +
> > > +	if (builder->refs[idxa].longterm != builder->refs[idxb].longterm) {    
> > 
> > Where do you ensure that idxa and idxb won't be bigger than NUM_DPB_ENTRIES?  
> 
> If it does that means something went wrong in the init func. 

Well, this is a library code. We know that the init function won't
do that, but the core doesn't really know if the driver didn't change
the refs for some reason. If it does, it will go past the array index,
with can be very bad. So, I would try to either re-work this sorting
code to prevent going out of refs[] array or add some code to bail out
if this ever happen.

> I can add
> a WARN_ON() and bail out if you want, but I can't return an error here
> (that's not what the caller of the callback expects).


Thanks,
Mauro
