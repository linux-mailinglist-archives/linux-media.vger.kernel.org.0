Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C611F175D7A
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 15:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgCBOoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 09:44:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46610 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgCBOoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 09:44:32 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4B76F295793;
        Mon,  2 Mar 2020 14:44:30 +0000 (GMT)
Date:   Mon, 2 Mar 2020 15:44:26 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Message-ID: <20200302154426.5fb09f91@collabora.com>
In-Reply-To: <20200302142433.0ad1b383@coco.lan>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-3-ezequiel@collabora.com>
        <20200302142433.0ad1b383@coco.lan>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Mar 2020 14:24:33 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Thu, 20 Feb 2020 13:30:12 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Building those list is a standard procedure described in section
> > '8.2.4 Decoding process for reference picture lists construction' of
> > the H264 specification.
> > 
> > We already have 2 drivers needing the same logic (hantro and rkvdec) and
> > I suspect we will soon have more.
> > 
> > Let's provide generic helpers to create those lists.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/Kconfig     |   4 +
> >  drivers/media/v4l2-core/Makefile    |   1 +
> >  drivers/media/v4l2-core/v4l2-h264.c | 258 ++++++++++++++++++++++++++++
> >  include/media/v4l2-h264.h           |  85 +++++++++
> >  4 files changed, 348 insertions(+)
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
> >  create mode 100644 include/media/v4l2-h264.h
> > 
> > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > index 39e3fb30ba0b..8a4ccfbca8cf 100644
> > --- a/drivers/media/v4l2-core/Kconfig
> > +++ b/drivers/media/v4l2-core/Kconfig
> > @@ -45,6 +45,10 @@ config VIDEO_PCI_SKELETON
> >  config VIDEO_TUNER
> >  	tristate
> >  
> > +# Used by drivers that need v4l2-h264.ko
> > +config V4L2_H264
> > +	tristate
> > +
> >  # Used by drivers that need v4l2-mem2mem.ko
> >  config V4L2_MEM2MEM_DEV
> >  	tristate
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index 786bd1ec4d1b..c5c53e0941ad 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
> >  obj-$(CONFIG_VIDEO_TUNER) += tuner.o
> >  
> >  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
> > +obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> >  
> >  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> > new file mode 100644
> > index 000000000000..4f68c27ec7fd
> > --- /dev/null
> > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > @@ -0,0 +1,258 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * V4L2 H264 helpers.
> > + *
> > + * Copyright (C) 2019 Collabora, Ltd.
> > + *
> > + * Author: Boris Brezillon <boris.brezillon@collabora.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/sort.h>
> > +
> > +#include <media/v4l2-h264.h>
> > +
> > +/**
> > + * v4l2_h264_init_reflist_builder() - Initialize a P/B0/B1 reference list
> > + *				      builder
> > + *
> > + * @b: the builder context to initialize
> > + * @dec_params: decode parameters control
> > + * @slice_params: first slice parameters control
> > + * @sps: SPS control
> > + * @dpb: DPB to use when creating the reference list
> > + */
> > +void
> > +v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> > +		const struct v4l2_ctrl_h264_decode_params *dec_params,
> > +		const struct v4l2_ctrl_h264_slice_params *slice_params,
> > +		const struct v4l2_ctrl_h264_sps *sps,
> > +		const struct v4l2_h264_dpb_entry *dpb)  
> 
> The prototype here is not nice...
> 
> > +{
> > +	int cur_frame_num, max_frame_num;
> > +	unsigned int i;
> > +
> > +	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
> > +	cur_frame_num = slice_params->frame_num;
> > +
> > +	memset(b, 0, sizeof(*b));
> > +	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
> > +		b->cur_pic_order_count = min(dec_params->bottom_field_order_cnt,
> > +					     dec_params->top_field_order_cnt);
> > +	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > +		b->cur_pic_order_count = dec_params->bottom_field_order_cnt;
> > +	else
> > +		b->cur_pic_order_count = dec_params->top_field_order_cnt;
> > +
> > +	for (i = 0; i < 16; i++) {
> > +		u32 pic_order_count;
> > +
> > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > +			continue;
> > +
> > +		b->refs[i].pic_num = dpb[i].pic_num;  
> 
> ... as you're expecting a fixed number of elements at DPB array, and using
> a magic number (16) inside the for loop.

I used to have a '#define V4L2_H264_NUM_DPB_ENTRIES 16' but have been
told that this is an arbitrary limitation (the spec does not explicitly
limit the DPB size, even if all the HW we've seen seem to limit it to
16). Maybe we can pass the DPB array size as an argument so it stays
HW-specific.

> 
> > +
> > +		/*
> > +		 * Handle frame_num wraparound as described in section
> > +		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
> > +		 * TODO: This logic will have to be adjusted when we start
> > +		 * supporting interlaced content.
> > +		 */
> > +		if (dpb[i].frame_num > cur_frame_num)
> > +			b->refs[i].frame_num = (int)dpb[i].frame_num -
> > +					       max_frame_num;
> > +		else
> > +			b->refs[i].frame_num = dpb[i].frame_num;
> > +
> > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> > +			pic_order_count = min(dpb[i].top_field_order_cnt,
> > +					      dpb[i].bottom_field_order_cnt);
> > +		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> > +			pic_order_count = dpb[i].bottom_field_order_cnt;
> > +		else
> > +			pic_order_count = dpb[i].top_field_order_cnt;
> > +
> > +		b->refs[i].pic_order_count = pic_order_count;
> > +		b->unordered_reflist[b->num_valid] = i;
> > +		b->num_valid++;
> > +	}
> > +
> > +	for (i = b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
> > +		b->unordered_reflist[i] = i;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
> > +
> > +static int v4l2_h264_p_ref_list_cmp(const void *ptra, const void *ptrb,
> > +				    const void *data)
> > +{
> > +	const struct v4l2_h264_reflist_builder *builder = data;
> > +	u8 idxa, idxb;
> > +
> > +	idxa = *((u8 *)ptra);
> > +	idxb = *((u8 *)ptrb);
> > +
> > +	if (builder->refs[idxa].longterm != builder->refs[idxb].longterm) {  
> 
> Where do you ensure that idxa and idxb won't be bigger than NUM_DPB_ENTRIES?

If it does that means something went wrong in the init func. I can add
a WARN_ON() and bail out if you want, but I can't return an error here
(that's not what the caller of the callback expects).
