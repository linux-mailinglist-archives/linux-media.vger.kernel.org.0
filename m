Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CAA24B031
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 09:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgHTHdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 03:33:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55008 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgHTHdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 03:33:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 045EA28E289
Message-ID: <bac2020eabb375a6c9dbc689c0c5a3f6eae16e1e.camel@collabora.com>
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
Date:   Thu, 20 Aug 2020 04:32:46 -0300
In-Reply-To: <20200819135430.GA1566@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <20200806151310.98624-9-ezequiel@collabora.com>
         <20200806155028.GB1621078@aptenodytes>
         <7e0ad157cabb656cbb4f24354146197e6a1d3f36.camel@collabora.com>
         <20200819135430.GA1566@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, 2020-08-19 at 15:54 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri 07 Aug 20, 11:44, Ezequiel Garcia wrote:
> > On Thu, 2020-08-06 at 17:50 +0200, Paul Kocialkowski wrote:
> > > Hi,
> > > 
> > > On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> > > > The SLICE_PARAMS control is intended for slice-based
> > > > devices. In this mode, the OUTPUT buffer contains
> > > > a single slice, and so the buffer's plane payload size
> > > > can be used to query the slice size.
> > > 
> > > If we later extend the API for supporting multiple slices with dynamic array
> > > controls, I guess we'll need to know the size of each slice in each control
> > > elements. So I'd rather keep that even if it's indeed redundant with
> > > vb2_get_plane_payload in single-slice mode.
> > > 
> > 
> > If we later extend the API, another control (possibly
> > another decoding mode?) shall be introduced.
> > 
> > This API covers single-slice-per-request as specified
> > and documented in patch 9/14 "Clarify SLICE_BASED mode".
> > 
> > This is along the lines of the proposal drafted by Nicolas,
> > see my reply: https://lkml.org/lkml/2020/8/5/791.
> > 
> > This applies to num_slices, slice size and slice start offset.
> > 
> > There are multiple ways of doing this.
> 
> If feels a bit problematic to remove these fields without a clear plan yet
> on how to support multiple slices in the future. These may need to be added
> again later, except that it will be too late and new controls will need to be
> introduced.
> 

As Nicolas and I have repeatedly mentioned we do have a plan :)

Nothing prevents us from implementing this now, but since it seems
we don't have any need since the 1-slice-per-buffer is working well,
there is no motivation for it.

As you well mention, it does require new controls. This is
totally expected since new decoding semantics will need new controls.

Here's my version of the plan:

enum v4l2_mpeg_video_h264_decode_mode {
        V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
        V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_ARRAY_BASED,
        V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
};

#define V4L2_CID_MPEG_VIDEO_H264_SLICE_ARRAY    (V4L2_CID_MPEG_BASE+1008)

struct v4l2_ctrl_h264_slice_array {
        __u16 num_slices;

        struct v4l2_ctrl_h264_slice slices[16];
}

struct v4l2_ctrl_h264_slice {
        __u32 size;
        __u32 start_byte_offset;
        struct v4l2_ctrl_h264_slice_params params;
}

Now, the _specific_ way this will be done is not under
discussion at the moment.

> Also, could we consider adding more reserved fields to handle such future needs?
> 

I have considered that (on each control), but I fail
to see the reason for it. The same may be said of all controls,
yet I don't think we bloat each one just in case. 

Thanks,
Ezequiel

> Cheers,
> 
> Paul
> 
> > Thanks!
> > Ezequiel
> > 
> > > What do you think?
> > > 
> > > Paul
> > > 
> > > > To reduce the API surface drop the size from the
> > > > SLICE_PARAMS control.
> > > > 
> > > > A follow-up change will remove other members in SLICE_PARAMS
> > > > so we don't need to add padding fields here.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 ---
> > > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 +++----
> > > >  include/media/h264-ctrls.h                                | 3 ---
> > > >  3 files changed, 3 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > index 427fc5727ec0..fff74b7bf32a 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > @@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >      :stub-columns: 0
> > > >      :widths:       1 1 2
> > > >  
> > > > -    * - __u32
> > > > -      - ``size``
> > > > -      -
> > > >      * - __u32
> > > >        - ``start_byte_offset``
> > > >          Offset (in bytes) from the beginning of the OUTPUT buffer to the start
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > index a9ba78b15907..8b6f05aadbe8 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > @@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> > > >  	struct vb2_buffer *src_buf = &run->src->vb2_buf;
> > > >  	struct cedrus_dev *dev = ctx->dev;
> > > >  	dma_addr_t src_buf_addr;
> > > > -	u32 len = slice->size * 8;
> > > > +	size_t slice_bytes = vb2_get_plane_payload(src_buf, 0);
> > > >  	unsigned int pic_width_in_mbs;
> > > >  	bool mbaff_pic;
> > > >  	u32 reg;
> > > >  
> > > > -	cedrus_write(dev, VE_H264_VLD_LEN, len);
> > > > +	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> > > >  	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> > > >  
> > > >  	src_buf_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > > -	cedrus_write(dev, VE_H264_VLD_END,
> > > > -		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
> > > > +	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
> > > >  	cedrus_write(dev, VE_H264_VLD_ADDR,
> > > >  		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
> > > >  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
> > > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > > index 4f05ee265997..f74736fcfa00 100644
> > > > --- a/include/media/h264-ctrls.h
> > > > +++ b/include/media/h264-ctrls.h
> > > > @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
> > > >  };
> > > >  
> > > >  struct v4l2_ctrl_h264_slice_params {
> > > > -	/* Size in bytes, including header */
> > > > -	__u32 size;
> > > > -
> > > >  	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> > > >  	__u32 start_byte_offset;
> > > >  
> > > > -- 
> > > > 2.27.0
> > > > 


