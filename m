Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886AD902AF
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 15:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfHPNMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 09:12:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48314 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727610AbfHPNL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 09:11:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C125228D1D4
Message-ID: <c806b90e6fba5cd454df54d70da6f99c05526f46.camel@collabora.com>
Subject: Re: [PATCH v6 09/11] media: hantro: Add core bits to support H264
 decoding
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Hertz Wong <hertz.wong@rock-chips.com>
Date:   Fri, 16 Aug 2019 10:11:46 -0300
In-Reply-To: <b103be14-a89c-2ff2-670c-eb80a2afd618@xs4all.nl>
References: <20190814195931.6587-1-ezequiel@collabora.com>
         <20190814195931.6587-10-ezequiel@collabora.com>
         <b103be14-a89c-2ff2-670c-eb80a2afd618@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-08-16 at 09:41 +0200, Hans Verkuil wrote:
> On 8/14/19 9:59 PM, Ezequiel Garcia wrote:
> > From: Hertz Wong <hertz.wong@rock-chips.com>
> > 
> > Add helpers and patch hantro_{drv,v4l2}.c to prepare addition of H264
> > decoding support.
> > 
> > Signed-off-by: Hertz Wong <hertz.wong@rock-chips.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes in v6:
> > * Fixed duplicated CABAC table memcpy.
> > * Adjust to renamed controls.
> > Changes in v5:
> > * None.
> > Changes in v4:
> > * Rework extra_size0, exposing the size via TRY_FMT/S_FMT
> >   to allow buffer importation, as suggested by Tomasz.
> > * Drop max slice limit.
> > * Use a ternary operator instead of substracting POCs,
> >   to avoid an overflow as pointed out by Rasmus.
> > * Specify annex B slice start code.
> > * Add missing extra_size0 to sizeimage
> > * Swap the first 2 entries of list B1 when B0 and B1 match (mandated by
> >   the spec)
> > * Move the update_dpb() call before the prepare_table() one to make the
> >   POCs stored in the private table match the content of the new DPB
> > ---
> >  drivers/staging/media/hantro/Makefile      |   1 +
> >  drivers/staging/media/hantro/hantro.h      |   9 +-
> >  drivers/staging/media/hantro/hantro_drv.c  |  42 ++
> >  drivers/staging/media/hantro/hantro_h264.c | 641 +++++++++++++++++++++
> >  drivers/staging/media/hantro/hantro_hw.h   |  55 ++
> >  drivers/staging/media/hantro/hantro_v4l2.c |  10 +
> >  6 files changed, 757 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/staging/media/hantro/hantro_h264.c
> > 
> > diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> > index f5ec597d9e08..0f0d3afb1cca 100644
> > --- a/drivers/staging/media/hantro/Makefile
> > +++ b/drivers/staging/media/hantro/Makefile
> > @@ -10,6 +10,7 @@ hantro-vpu-y += \
> >  		rk3399_vpu_hw_mpeg2_dec.o \
> >  		rk3399_vpu_hw_vp8_dec.o \
> >  		hantro_jpeg.o \
> > +		hantro_h264.o \
> >  		hantro_mpeg2.o \
> >  		hantro_vp8.o
> >  
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index c4c86c32ea2d..f670bbde4159 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -30,6 +30,10 @@
> >  #define VP8_MB_WIDTH(w)			DIV_ROUND_UP(w, VP8_MB_DIM)
> >  #define VP8_MB_HEIGHT(h)		DIV_ROUND_UP(h, VP8_MB_DIM)
> >  
> > +#define H264_MB_DIM			16
> > +#define H264_MB_WIDTH(w)		DIV_ROUND_UP(w, H264_MB_DIM)
> > +#define H264_MB_HEIGHT(h)		DIV_ROUND_UP(h, H264_MB_DIM)
> > +
> >  #define MPEG2_MB_DIM			16
> >  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> >  #define MPEG2_MB_HEIGHT(h)		DIV_ROUND_UP(h, MPEG2_MB_DIM)
> > @@ -43,9 +47,9 @@ struct hantro_codec_ops;
> >  
> >  #define HANTRO_JPEG_ENCODER	BIT(0)
> >  #define HANTRO_ENCODERS		0x0000ffff
> > -
> >  #define HANTRO_MPEG2_DECODER	BIT(16)
> >  #define HANTRO_VP8_DECODER	BIT(17)
> > +#define HANTRO_H264_DECODER	BIT(18)
> >  #define HANTRO_DECODERS		0xffff0000
> >  
> >  /**
> > @@ -102,12 +106,14 @@ struct hantro_variant {
> >   * enum hantro_codec_mode - codec operating mode.
> >   * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
> >   * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
> > + * @HANTRO_MODE_H264_DEC: H264 decoder.
> >   * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
> >   * @HANTRO_MODE_VP8_DEC: VP8 decoder.
> >   */
> >  enum hantro_codec_mode {
> >  	HANTRO_MODE_NONE = -1,
> >  	HANTRO_MODE_JPEG_ENC,
> > +	HANTRO_MODE_H264_DEC,
> >  	HANTRO_MODE_MPEG2_DEC,
> >  	HANTRO_MODE_VP8_DEC,
> >  };
> > @@ -246,6 +252,7 @@ struct hantro_ctx {
> >  
> >  	/* Specific for particular codec modes. */
> >  	union {
> > +		struct hantro_h264_dec_hw_ctx h264_dec;
> >  		struct hantro_jpeg_enc_hw_ctx jpeg_enc;
> >  		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
> >  		struct hantro_vp8_dec_hw_ctx vp8_dec;
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 6e2351e46750..f4cea216c926 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -314,6 +314,48 @@ static const struct hantro_ctrl controls[] = {
> >  		.cfg = {
> >  			.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
> >  		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
> > +			.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> > +			.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> > +			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED),
> > +		},
> > +	}, {
> > +		.codec = HANTRO_H264_DECODER,
> > +		.cfg = {
> > +			.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
> > +			.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > +			.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > +			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_START_CODE_NONE),
> > +		},
> > +	}, {
> >  	},
> >  };
> >  
> > diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> > new file mode 100644
> > index 000000000000..05e210a2cdbe
> > --- /dev/null
> > +++ b/drivers/staging/media/hantro/hantro_h264.c
> > @@ -0,0 +1,641 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Rockchip RK3288 VPU codec driver
> > + *
> > + * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
> > + *	Hertz Wong <hertz.wong@rock-chips.com>
> > + *	Herman Chen <herman.chen@rock-chips.com>
> > + *
> > + * Copyright (C) 2014 Google, Inc.
> > + *	Tomasz Figa <tfiga@chromium.org>
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/sort.h>
> > +#include <media/v4l2-mem2mem.h>
> > +
> > +#include "hantro.h"
> > +#include "hantro_hw.h"
> > +
> > +/* Size with u32 units. */
> > +#define CABAC_INIT_BUFFER_SIZE		(460 * 2)
> > +#define POC_BUFFER_SIZE			34
> > +#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
> > +
> > +#define POC_CMP(p0, p1) ((p0) < (p1) ? -1 : 1)
> > +
> > +/* Data structure describing auxiliary buffer format. */
> > +struct hantro_h264_dec_priv_tbl {
> > +	u32 cabac_table[CABAC_INIT_BUFFER_SIZE];
> > +	u32 poc[POC_BUFFER_SIZE];
> > +	u8 scaling_list[SCALING_LIST_SIZE];
> > +};
> > +
> > +/* Constant CABAC table. */
> 
> Can you add a comment explaining where this table comes from?
> 

I don't think this CABAC default table comes from the H264 spec,
in the Hantro G1 SDK you can find this same blob as "cabac_init_values".

As the comment says the CABAC table is constant, it may be
possible to allow applications to pass it. However, this default
value works for all use-cases, so there hasn't been a need for this.

Sorry, but that's all I know about this.

> > +static const u32 h264_cabac_table[] = {
> > +	0x14f10236, 0x034a14f1, 0x0236034a, 0xe47fe968, 0xfa35ff36, 0x07330000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
> > +	0x0029003f, 0x003f003f, 0xf7530456, 0x0061f948, 0x0d29033e, 0x000b0137,
> 
> Regards,
> 
> 	Hans


