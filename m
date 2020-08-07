Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BB923EF2B
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 16:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgHGOpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 10:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgHGOpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 10:45:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CB5C061756;
        Fri,  7 Aug 2020 07:45:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5DB0828C534
Message-ID: <7e0ad157cabb656cbb4f24354146197e6a1d3f36.camel@collabora.com>
Subject: Re: [PATCH v2 08/14] media: uapi: h264: Drop SLICE_PARAMS 'size'
 field
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Fri, 07 Aug 2020 11:44:51 -0300
In-Reply-To: <20200806155028.GB1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <20200806151310.98624-9-ezequiel@collabora.com>
         <20200806155028.GB1621078@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-08-06 at 17:50 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> > The SLICE_PARAMS control is intended for slice-based
> > devices. In this mode, the OUTPUT buffer contains
> > a single slice, and so the buffer's plane payload size
> > can be used to query the slice size.
> 
> If we later extend the API for supporting multiple slices with dynamic array
> controls, I guess we'll need to know the size of each slice in each control
> elements. So I'd rather keep that even if it's indeed redundant with
> vb2_get_plane_payload in single-slice mode.
> 

If we later extend the API, another control (possibly
another decoding mode?) shall be introduced.

This API covers single-slice-per-request as specified
and documented in patch 9/14 "Clarify SLICE_BASED mode".

This is along the lines of the proposal drafted by Nicolas,
see my reply: https://lkml.org/lkml/2020/8/5/791.

This applies to num_slices, slice size and slice start offset.

There are multiple ways of doing this.

Thanks!
Ezequiel

> What do you think?
> 
> Paul
> 
> > To reduce the API surface drop the size from the
> > SLICE_PARAMS control.
> > 
> > A follow-up change will remove other members in SLICE_PARAMS
> > so we don't need to add padding fields here.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 +++----
> >  include/media/h264-ctrls.h                                | 3 ---
> >  3 files changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 427fc5727ec0..fff74b7bf32a 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      :stub-columns: 0
> >      :widths:       1 1 2
> >  
> > -    * - __u32
> > -      - ``size``
> > -      -
> >      * - __u32
> >        - ``start_byte_offset``
> >          Offset (in bytes) from the beginning of the OUTPUT buffer to the start
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > index a9ba78b15907..8b6f05aadbe8 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> >  	struct vb2_buffer *src_buf = &run->src->vb2_buf;
> >  	struct cedrus_dev *dev = ctx->dev;
> >  	dma_addr_t src_buf_addr;
> > -	u32 len = slice->size * 8;
> > +	size_t slice_bytes = vb2_get_plane_payload(src_buf, 0);
> >  	unsigned int pic_width_in_mbs;
> >  	bool mbaff_pic;
> >  	u32 reg;
> >  
> > -	cedrus_write(dev, VE_H264_VLD_LEN, len);
> > +	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> >  	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> >  
> >  	src_buf_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > -	cedrus_write(dev, VE_H264_VLD_END,
> > -		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
> > +	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
> >  	cedrus_write(dev, VE_H264_VLD_ADDR,
> >  		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
> >  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 4f05ee265997..f74736fcfa00 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
> >  };
> >  
> >  struct v4l2_ctrl_h264_slice_params {
> > -	/* Size in bytes, including header */
> > -	__u32 size;
> > -
> >  	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> >  	__u32 start_byte_offset;
> >  
> > -- 
> > 2.27.0
> > 


