Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1811A3E4A84
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 19:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbhHIRID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 13:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbhHIRIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 13:08:01 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E732AC0613D3;
        Mon,  9 Aug 2021 10:07:39 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l18so22406733wrv.5;
        Mon, 09 Aug 2021 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u/iMXyMsrZswhj0w5GPgRYfRsJgtvFGpf6A8D0/DDKA=;
        b=u8LoE6/2bze1I6wGz+6LCcAZGCndB+s2TMRi3pw+a/oOl2Kf0s6LWhe3tY/Q0UNcSF
         gKvlejIkWpaEZhaOCHh4u9x2h2/P6MtjUqEDOryEFuPSeDXb3xAp/7/MWZcuF/X6rauA
         xx5rgXoEOF/NNefQ/WMAKzK7J15kZKHgdtVAKEoI7B4zI40n4TGGKkIRiyT7HfnB6msT
         zd10mlZ9bDHJWkSPYdzRM0Q/n17LccSrx5KF5vwuh8DWNhBgLLTtDdxrxLeonUxW9CA5
         2JlYUqGriGgZKrKVOed6BfO0tZU1icfhH4CkppwSpM9snUA3krLioCzTsRS0ko6K62Kl
         r2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u/iMXyMsrZswhj0w5GPgRYfRsJgtvFGpf6A8D0/DDKA=;
        b=rLG9Uff5LDRQOTRfMo/SPQCe4IqI3aztMYPPTYMnujdMU5KH8FIxSseBn8N898ib5K
         rrlX9ER2QurGdk9Up1aPh5yy91tdOvSEpqMLUliOYhdE220zZayc+MToJoLbHbRCIJND
         9VPDr9ud+mjj+i5Qre5dhonWqZ9lJCtrxd5REIl5sV35g5vio20UrgWXpaey8lKoNIjj
         OWOUpdzWJlppljSCyPqqRjuVUW6SySs+hI73L/QMHWqHlF2WDo1/e7Q0XvSfpvTIkf5M
         QfPSdJN81fWdxR0eCRc6ZiLceLzTR+AeJhsItDPau81M9L834RWZyH1ppxS4ksh2BBug
         oOZw==
X-Gm-Message-State: AOAM531AYHuBhN8HkwKGzHmV0QgkG220xylBRoQv6w332v+6p24pT4F2
        oCGC6+HGpmBSzyh38Biiv9PTy+B9HhnG9w==
X-Google-Smtp-Source: ABdhPJzlXn8Phmm4LS+ideuFcw5FKoY/nSLD1lydLYp5WE4Bwu5Lju0bAJjbgR/fEZoV+4NfO5RD5w==
X-Received: by 2002:adf:aa98:: with SMTP id h24mr3143539wrc.366.1628528858114;
        Mon, 09 Aug 2021 10:07:38 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id k186sm83874wme.45.2021.08.09.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 10:07:37 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <elezegarcia@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: Re: [PATCH v3 09/10] media: hantro: Support VP9 on the G2 core
Date:   Mon, 09 Aug 2021 19:07:35 +0200
Message-ID: <1771240.sZXMzDhkfG@kista>
In-Reply-To: <20210805144246.11998-10-andrzej.p@collabora.com>
References: <20210805144246.11998-1-andrzej.p@collabora.com> <20210805144246.11998-10-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej!

Dne =C4=8Detrtek, 05. avgust 2021 ob 16:42:45 CEST je Andrzej Pietrasiewicz=
=20
napisal(a):
> VeriSilicon Hantro G2 core supports VP9 codec.
>=20
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/staging/media/hantro/Kconfig          |   1 +
>  drivers/staging/media/hantro/Makefile         |   6 +-
>  drivers/staging/media/hantro/hantro.h         |  26 +
>  drivers/staging/media/hantro/hantro_drv.c     |  18 +-
>  drivers/staging/media/hantro/hantro_g2_regs.h |  97 ++
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  | 978 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |  67 ++
>  drivers/staging/media/hantro/hantro_v4l2.c    |   6 +
>  drivers/staging/media/hantro/hantro_vp9.c     | 240 +++++
>  drivers/staging/media/hantro/hantro_vp9.h     | 103 ++
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  22 +-
>  11 files changed, 1560 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
>  create mode 100644 drivers/staging/media/hantro/hantro_vp9.h

<snip>

> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/
staging/media/hantro/hantro_g2_vp9_dec.c
> new file mode 100644
> index 000000000000..45a7be4a43fa
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> @@ -0,0 +1,978 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VP9 codec driver
> + *
> + * Copyright (C) 2021 Collabora Ltd.
> + */
> +#include "media/videobuf2-core.h"
> +#include "media/videobuf2-dma-contig.h"
> +#include "media/videobuf2-v4l2.h"
> +#include <linux/kernel.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-vp9.h>
> +
> +#include "hantro.h"
> +#include "hantro_vp9.h"
> +#include "hantro_g2_regs.h"
> +
> +#define G2_ALIGN 16
> +
> +enum hantro_ref_frames {
> +	INTRA_FRAME =3D 0,
> +	LAST_FRAME =3D 1,
> +	GOLDEN_FRAME =3D 2,
> +	ALTREF_FRAME =3D 3,
> +	MAX_REF_FRAMES =3D 4
> +};
> +
> +static int start_prepare_run(struct hantro_ctx *ctx, const struct=20
v4l2_ctrl_vp9_frame **dec_params)
> +{
> +	const struct v4l2_ctrl_vp9_compressed_hdr_probs *prob_updates;
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	struct v4l2_ctrl *ctrl;
> +	unsigned int fctx_idx;
> +
> +	/* v4l2-specific stuff */
> +	hantro_start_prepare_run(ctx);
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_handler,=20
V4L2_CID_STATELESS_VP9_FRAME);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	*dec_params =3D ctrl->p_cur.p;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_handler,=20
V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	prob_updates =3D ctrl->p_cur.p;
> +
> +	/*
> +	 * vp9 stuff
> +	 *
> +	 * by this point the userspace has done all parts of 6.2=20
uncompressed_header()
> +	 * except this fragment:
> +	 * if ( FrameIsIntra || error_resilient_mode ) {
> +	 *	setup_past_independence ( )
> +	 *	if ( frame_type =3D=3D KEY_FRAME || error_resilient_mode =3D=3D=20
1 ||
> +	 *	     reset_frame_context =3D=3D 3 ) {
> +	 *		for ( i =3D 0; i < 4; i ++ ) {
> +	 *			save_probs( i )
> +	 *		}
> +	 *	} else if ( reset_frame_context =3D=3D 2 ) {
> +	 *		save_probs( frame_context_idx )
> +	 *	}
> +	 *	frame_context_idx =3D 0
> +	 * }
> +	 */
> +	fctx_idx =3D v4l2_vp9_reset_frame_ctx(*dec_params, vp9_ctx-
>frame_context);
> +	vp9_ctx->cur.frame_context_idx =3D fctx_idx;
> +
> +	/* 6.1 frame(sz): load_probs() and load_probs2() */
> +	vp9_ctx->probability_tables =3D vp9_ctx->frame_context[fctx_idx];
> +
> +	/*
> +	 * The userspace has also performed 6.3 compressed_header(), but=20
handling the
> +	 * probs in a special way. All probs which need updating, except=20
MV-related,
> +	 * have been read from the bitstream and translated through=20
inv_map_table[],
> +	 * but no 6.3.6 inv_recenter_nonneg(v, m) has been performed. The=20
values passed
> +	 * by userspace are either translated values (there are no 0 values=20
in
> +	 * inv_map_table[]), or zero to indicate no update. All MV-related=20
probs which need
> +	 * updating have been read from the bitstream and (mv_prob << 1) |=20
1 has been
> +	 * performed. The values passed by userspace are either new values
> +	 * to replace old ones (the above mentioned shift and bitwise or=20
never result in
> +	 * a zero) or zero to indicate no update.
> +	 * fw_update_probs() performs actual probs updates or leaves probs=20
as-is
> +	 * for values for which a zero was passed from userspace.
> +	 */
> +	v4l2_vp9_fw_update_probs(&vp9_ctx->probability_tables,=20
prob_updates, *dec_params);
> +
> +	return 0;
> +}
> +
> +static size_t chroma_offset(const struct hantro_ctx *ctx,
> +			    const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> +
> +	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> +}
> +
> +static size_t mv_offset(const struct hantro_ctx *ctx,
> +			const struct v4l2_ctrl_vp9_frame *dec_params)
> +{
> +	size_t cr_offset =3D chroma_offset(ctx, dec_params);
> +
> +	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
> +}
> +
> +static struct hantro_decoded_buffer *
> +get_ref_buf(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *dst, u64=20
timestamp)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +	struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> +	int buf_idx;
> +
> +	/*
> +	 * If a ref is unused or invalid, address of current destination
> +	 * buffer is returned.
> +	 */
> +	buf_idx =3D vb2_find_timestamp(cap_q, timestamp, 0);
> +	if (buf_idx < 0)
> +		return vb2_to_hantro_decoded_buf(&dst->vb2_buf);
> +
> +	return vb2_to_hantro_decoded_buf(vb2_get_buffer(cap_q, buf_idx));
> +}
> +
> +static void update_dec_buf_info(struct hantro_decoded_buffer *buf,
> +				const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	buf->vp9.width =3D dec_params->frame_width_minus_1 + 1;
> +	buf->vp9.height =3D dec_params->frame_height_minus_1 + 1;
> +	buf->vp9.bit_depth =3D dec_params->bit_depth;
> +}
> +
> +static void update_ctx_cur_info(struct hantro_vp9_dec_hw_ctx *vp9_ctx,
> +				struct hantro_decoded_buffer *buf,
> +				const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	vp9_ctx->cur.valid =3D true;
> +	vp9_ctx->cur.reference_mode =3D dec_params->reference_mode;
> +	vp9_ctx->cur.tx_mode =3D dec_params->tx_mode;
> +	vp9_ctx->cur.interpolation_filter =3D dec_params->interpolation_filter;
> +	vp9_ctx->cur.flags =3D dec_params->flags;
> +	vp9_ctx->cur.timestamp =3D buf->base.vb.vb2_buf.timestamp;
> +}
> +
> +static void config_output(struct hantro_ctx *ctx,
> +			  struct hantro_decoded_buffer *dst,
> +			  const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	dma_addr_t luma_addr, chroma_addr, mv_addr;
> +
> +	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
> +	hantro_reg_write(ctx->dev, &g2_output_format, 0);
> +
> +	luma_addr =3D vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf,=20
0);
> +	hantro_write_addr(ctx->dev, G2_ADDR_DST, luma_addr);
> +
> +	chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> +	hantro_write_addr(ctx->dev, G2_ADDR_DST_CHR, chroma_addr);
> +
> +	mv_addr =3D luma_addr + mv_offset(ctx, dec_params);
> +	hantro_write_addr(ctx->dev, G2_ADDR_DST_MV, mv_addr);
> +}
> +
> +struct hantro_vp9_ref_reg {
> +	const struct hantro_reg width;
> +	const struct hantro_reg height;
> +	const struct hantro_reg hor_scale;
> +	const struct hantro_reg ver_scale;
> +	u32 y_base;
> +	u32 c_base;
> +};
> +
> +static void config_ref(struct hantro_ctx *ctx,
> +		       struct hantro_decoded_buffer *dst,
> +		       const struct hantro_vp9_ref_reg *ref_reg,
> +		       const struct v4l2_ctrl_vp9_frame *dec_params,
> +		       u64 ref_ts)
> +{
> +	struct hantro_decoded_buffer *buf;
> +	dma_addr_t luma_addr, chroma_addr;
> +	u32 refw, refh;
> +
> +	buf =3D get_ref_buf(ctx, &dst->base.vb, ref_ts);
> +	refw =3D buf->vp9.width;
> +	refh =3D buf->vp9.height;
> +
> +	hantro_reg_write(ctx->dev, &ref_reg->width, refw);
> +	hantro_reg_write(ctx->dev, &ref_reg->height, refh);
> +
> +	hantro_reg_write(ctx->dev, &ref_reg->hor_scale, (refw << 14) / dst-
>vp9.width);
> +	hantro_reg_write(ctx->dev, &ref_reg->ver_scale, (refh << 14) / dst-
>vp9.height);
> +
> +	luma_addr =3D vb2_dma_contig_plane_dma_addr(&buf->base.vb.vb2_buf,=20
0);
> +	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
> +
> +	chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> +	hantro_write_addr(ctx->dev, ref_reg->c_base, chroma_addr);
> +}
> +
> +static void config_ref_registers(struct hantro_ctx *ctx,
> +				 const struct v4l2_ctrl_vp9_frame=20
*dec_params,
> +				 struct hantro_decoded_buffer *dst,
> +				 struct hantro_decoded_buffer=20
*mv_ref)
> +{
> +	static const struct hantro_vp9_ref_reg ref_regs[] =3D {
> +		{
> +			/* Last */
> +			.width =3D vp9_lref_width,
> +			.height =3D vp9_lref_height,
> +			.hor_scale =3D vp9_lref_hor_scale,
> +			.ver_scale =3D vp9_lref_ver_scale,
> +			.y_base =3D G2_REG_ADDR_REF(0),
> +			.c_base =3D G2_REG_CHR_REF(0),
> +		}, {
> +			/* Golden */
> +			.width =3D vp9_gref_width,
> +			.height =3D vp9_gref_height,
> +			.hor_scale =3D vp9_gref_hor_scale,
> +			.ver_scale =3D vp9_gref_ver_scale,
> +			.y_base =3D G2_REG_ADDR_REF(4),
> +			.c_base =3D G2_REG_CHR_REF(4),
> +		}, {
> +			/* Altref */
> +			.width =3D vp9_aref_width,
> +			.height =3D vp9_aref_height,
> +			.hor_scale =3D vp9_aref_hor_scale,
> +			.ver_scale =3D vp9_aref_ver_scale,
> +			.y_base =3D G2_REG_ADDR_REF(5),
> +			.c_base =3D G2_REG_CHR_REF(5),
> +		},
> +	};
> +	dma_addr_t mv_addr;
> +
> +	config_ref(ctx, dst, &ref_regs[0], dec_params, dec_params-
>last_frame_ts);
> +	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params-
>golden_frame_ts);
> +	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params-
>alt_frame_ts);
> +
> +	mv_addr =3D vb2_dma_contig_plane_dma_addr(&mv_ref->base.vb.vb2_buf,=20
0) +
> +		  mv_offset(ctx, dec_params);
> +	hantro_write_addr(ctx->dev, G2_REG_DMV_REF(0), mv_addr);
> +
> +	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,
> +			 dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_LAST ? 1 : 0);
> +
> +	hantro_reg_write(ctx->dev, &vp9_gref_sign_bias,
> +			 dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_GOLDEN ? 1 : 0);
> +
> +	hantro_reg_write(ctx->dev, &vp9_aref_sign_bias,
> +			 dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_ALT ? 1 : 0);

Not sure if I'm missing something, but V4L2_VP9_SIGN_BIAS_LAST,=20
V4L2_VP9_SIGN_BIAS_GOLDEN and V4L2_VP9_SIGN_BIAS_ALT are defined in ordinar=
y=20
enum in patch 5, without any value, so they would have values 0, 1 and 2.

I guess you actually want (1 << 0), (1 << 1) and (1 << 2) in patch 5. Secon=
d=20
and third flag still work by chance and first flag is always applied.

Best regards,
Jernej


> +}
> +
> +static void recompute_tile_info(unsigned short *tile_info, unsigned int=
=20
tiles, unsigned int sbs)
> +{
> +	int i;
> +	unsigned int accumulated =3D 0;
> +	unsigned int next_accumulated;
> +
> +	for (i =3D 1; i <=3D tiles; ++i) {
> +		next_accumulated =3D i * sbs / tiles;
> +		*tile_info++ =3D next_accumulated - accumulated;
> +		accumulated =3D next_accumulated;
> +	}
> +}
> +
> +static void
> +recompute_tile_rc_info(struct hantro_ctx *ctx,
> +		       unsigned int tile_r, unsigned int tile_c,
> +		       unsigned int sbs_r, unsigned int sbs_c)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +
> +	recompute_tile_info(vp9_ctx->tile_r_info, tile_r, sbs_r);
> +	recompute_tile_info(vp9_ctx->tile_c_info, tile_c, sbs_c);
> +
> +	vp9_ctx->last_tile_r =3D tile_r;
> +	vp9_ctx->last_tile_c =3D tile_c;
> +	vp9_ctx->last_sbs_r =3D sbs_r;
> +	vp9_ctx->last_sbs_c =3D sbs_c;
> +}
> +
> +static inline unsigned int first_tile_row(unsigned int tile_r, unsigned =
int=20
sbs_r)
> +{
> +	if (tile_r =3D=3D sbs_r + 1)
> +		return 1;
> +
> +	if (tile_r =3D=3D sbs_r + 2)
> +		return 2;
> +
> +	return 0;
> +}
> +
> +static void
> +fill_tile_info(struct hantro_ctx *ctx,
> +	       unsigned int tile_r, unsigned int tile_c,
> +	       unsigned int sbs_r, unsigned int sbs_c,
> +	       unsigned short *tile_mem)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	unsigned int i, j;
> +	bool first =3D true;
> +
> +	for (i =3D first_tile_row(tile_r, sbs_r); i < tile_r; ++i) {
> +		unsigned short r_info =3D vp9_ctx->tile_r_info[i];
> +
> +		if (first) {
> +			if (i > 0)
> +				r_info +=3D vp9_ctx->tile_r_info[0];
> +			if (i =3D=3D 2)
> +				r_info +=3D vp9_ctx->tile_r_info[1];
> +			first =3D false;
> +		}
> +		for (j =3D 0; j < tile_c; ++j) {
> +			*tile_mem++ =3D vp9_ctx->tile_c_info[j];
> +			*tile_mem++ =3D r_info;
> +		}
> +	}
> +}
> +
> +static void
> +config_tiles(struct hantro_ctx *ctx,
> +	     const struct v4l2_ctrl_vp9_frame *dec_params,
> +	     struct hantro_decoded_buffer *dst)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *misc =3D &vp9_ctx->misc;
> +	struct hantro_aux_buf *tile_edge =3D &vp9_ctx->tile_edge;
> +	dma_addr_t addr;
> +	unsigned short *tile_mem;
> +
> +	addr =3D misc->dma + vp9_ctx->tile_info_offset;
> +	hantro_write_addr(ctx->dev, G2_ADDR_TILE_SIZE, addr);
> +
> +	tile_mem =3D misc->cpu + vp9_ctx->tile_info_offset;
> +	if (dec_params->tile_cols_log2 || dec_params->tile_rows_log2) {
> +		unsigned int tile_r =3D (1 << dec_params->tile_rows_log2);
> +		unsigned int tile_c =3D (1 << dec_params->tile_cols_log2);
> +		unsigned int sbs_r =3D hantro_vp9_num_sbs(dst-
>vp9.height);
> +		unsigned int sbs_c =3D hantro_vp9_num_sbs(dst->vp9.width);
> +
> +		if (tile_r !=3D vp9_ctx->last_tile_r || tile_c !=3D vp9_ctx-
>last_tile_c ||
> +		    sbs_r !=3D vp9_ctx->last_sbs_r || sbs_c !=3D vp9_ctx-
>last_sbs_c)
> +			recompute_tile_rc_info(ctx, tile_r, tile_c,=20
sbs_r, sbs_c);
> +
> +		fill_tile_info(ctx, tile_r, tile_c, sbs_r, sbs_c,=20
tile_mem);
> +
> +		hantro_reg_write(ctx->dev, &g2_tile_e, 1);
> +		hantro_reg_write(ctx->dev, &g2_num_tile_cols, tile_c);
> +		hantro_reg_write(ctx->dev, &g2_num_tile_rows, tile_r);
> +
> +		addr =3D tile_edge->dma;
> +		hantro_write_addr(ctx->dev, G2_TILE_FILTER, addr);
> +
> +		addr =3D tile_edge->dma + vp9_ctx->bsd_ctrl_offset;
> +		hantro_write_addr(ctx->dev, G2_TILE_BSD, addr);
> +	} else {
> +		tile_mem[0] =3D hantro_vp9_num_sbs(dst->vp9.width);
> +		tile_mem[1] =3D hantro_vp9_num_sbs(dst->vp9.height);
> +
> +		hantro_reg_write(ctx->dev, &g2_tile_e, 0);
> +		hantro_reg_write(ctx->dev, &g2_num_tile_cols, 1);
> +		hantro_reg_write(ctx->dev, &g2_num_tile_rows, 1);
> +	}
> +}
> +
> +static void
> +update_feat_and_flag(struct hantro_vp9_dec_hw_ctx *vp9_ctx,
> +		     const struct v4l2_vp9_segmentation *seg,
> +		     enum v4l2_vp9_segment_feature feature,
> +		     unsigned int segid)
> +{
> +	u8 mask =3D V4L2_VP9_SEGMENT_FEATURE_ENABLED(feature);
> +
> +	vp9_ctx->feature_data[segid][feature] =3D seg->feature_data[segid]
[feature];
> +	vp9_ctx->feature_enabled[segid] &=3D ~mask;
> +	vp9_ctx->feature_enabled[segid] |=3D (seg->feature_enabled[segid] &=20
mask);
> +}
> +
> +static inline s16 clip3(s16 x, s16 y, s16 z)
> +{
> +	return (z < x) ? x : (z > y) ? y : z;
> +}
> +
> +static s16 feat_val_clip3(s16 feat_val, s16 feature_data, bool absolute,=
 u8=20
clip)
> +{
> +	if (absolute)
> +		return feature_data;
> +
> +	return clip3(0, 255, feat_val + feature_data);
> +}
> +
> +static void config_segment(struct hantro_ctx *ctx, const struct=20
v4l2_ctrl_vp9_frame *dec_params)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	const struct v4l2_vp9_segmentation *seg;
> +	s16 feat_val;
> +	unsigned char feat_id;
> +	unsigned int segid;
> +	bool segment_enabled, absolute, update_data;
> +
> +	static const struct hantro_reg seg_regs[8][V4L2_VP9_SEG_LVL_MAX] =3D=20
{
> +		{ vp9_quant_seg0, vp9_filt_level_seg0, vp9_refpic_seg0,=20
vp9_skip_seg0 },
> +		{ vp9_quant_seg1, vp9_filt_level_seg1, vp9_refpic_seg1,=20
vp9_skip_seg1 },
> +		{ vp9_quant_seg2, vp9_filt_level_seg2, vp9_refpic_seg2,=20
vp9_skip_seg2 },
> +		{ vp9_quant_seg3, vp9_filt_level_seg3, vp9_refpic_seg3,=20
vp9_skip_seg3 },
> +		{ vp9_quant_seg4, vp9_filt_level_seg4, vp9_refpic_seg4,=20
vp9_skip_seg4 },
> +		{ vp9_quant_seg5, vp9_filt_level_seg5, vp9_refpic_seg5,=20
vp9_skip_seg5 },
> +		{ vp9_quant_seg6, vp9_filt_level_seg6, vp9_refpic_seg6,=20
vp9_skip_seg6 },
> +		{ vp9_quant_seg7, vp9_filt_level_seg7, vp9_refpic_seg7,=20
vp9_skip_seg7 },
> +	};
> +
> +	segment_enabled =3D !!(dec_params->seg.flags &=20
V4L2_VP9_SEGMENTATION_FLAG_ENABLED);
> +	hantro_reg_write(ctx->dev, &vp9_segment_e, segment_enabled);
> +	hantro_reg_write(ctx->dev, &vp9_segment_upd_e,
> +			 !!(dec_params->seg.flags &=20
V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP));
> +	hantro_reg_write(ctx->dev, &vp9_segment_temp_upd_e,
> +			 !!(dec_params->seg.flags &=20
V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
> +
> +	seg =3D &dec_params->seg;
> +	absolute =3D !!(seg->flags &=20
V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
> +	update_data =3D !!(seg->flags &=20
V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA);
> +
> +	for (segid =3D 0; segid < 8; ++segid) {
> +		/* Quantizer segment feature */
> +		feat_id =3D V4L2_VP9_SEG_LVL_ALT_Q;
> +		feat_val =3D dec_params->quant.base_q_idx;
> +		if (segment_enabled) {
> +			if (update_data)
> +				update_feat_and_flag(vp9_ctx, seg,=20
feat_id, segid);
> +			if (v4l2_vp9_seg_feat_enabled(vp9_ctx-
>feature_enabled, feat_id, segid))
> +				feat_val =3D=20
feat_val_clip3(feat_val,
> +							 =20
vp9_ctx->feature_data[segid][feat_id],
> +							 =20
absolute, 255);
> +		}
> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id],=20
feat_val);
> +
> +		/* Loop filter segment feature */
> +		feat_id =3D V4L2_VP9_SEG_LVL_ALT_L;
> +		feat_val =3D dec_params->lf.level;
> +		if (segment_enabled) {
> +			if (update_data)
> +				update_feat_and_flag(vp9_ctx, seg,=20
feat_id, segid);
> +			if (v4l2_vp9_seg_feat_enabled(vp9_ctx-
>feature_enabled, feat_id, segid))
> +				feat_val =3D=20
feat_val_clip3(feat_val,
> +							 =20
vp9_ctx->feature_data[segid][feat_id],
> +							 =20
absolute, 63);
> +		}
> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id],=20
feat_val);
> +
> +		/* Reference frame segment feature */
> +		feat_id =3D V4L2_VP9_SEG_LVL_REF_FRAME;
> +		feat_val =3D 0;
> +		if (segment_enabled) {
> +			if (update_data)
> +				update_feat_and_flag(vp9_ctx, seg,=20
feat_id, segid);
> +			if (!(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
> +			    v4l2_vp9_seg_feat_enabled(vp9_ctx-
>feature_enabled, feat_id, segid))
> +				feat_val =3D vp9_ctx-
>feature_data[segid][feat_id] + 1;
> +		}
> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id],=20
feat_val);
> +
> +		/* Skip segment feature */
> +		feat_id =3D V4L2_VP9_SEG_LVL_SKIP;
> +		feat_val =3D 0;
> +		if (segment_enabled) {
> +			if (update_data)
> +				update_feat_and_flag(vp9_ctx, seg,=20
feat_id, segid);
> +			feat_val =3D v4l2_vp9_seg_feat_enabled(vp9_ctx-
>feature_enabled,
> +							    =20
feat_id, segid) ? 1 : 0;
> +		}
> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id],=20
feat_val);
> +	}
> +}
> +
> +static void config_loop_filter(struct hantro_ctx *ctx, const struct=20
v4l2_ctrl_vp9_frame *dec_params)
> +{
> +	bool d =3D dec_params->lf.flags &=20
V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED;
> +
> +	hantro_reg_write(ctx->dev, &vp9_filt_level, dec_params->lf.level);
> +	hantro_reg_write(ctx->dev, &g2_out_filtering_dis, dec_params-
>lf.level =3D=3D 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_sharpness, dec_params-
>lf.sharpness);
> +
> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_0, d ? dec_params-
>lf.ref_deltas[0] : 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_1, d ? dec_params-
>lf.ref_deltas[1] : 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_2, d ? dec_params-
>lf.ref_deltas[2] : 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_3, d ? dec_params-
>lf.ref_deltas[3] : 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_mb_adj_0, d ? dec_params-
>lf.mode_deltas[0] : 0);
> +	hantro_reg_write(ctx->dev, &vp9_filt_mb_adj_1, d ? dec_params-
>lf.mode_deltas[1] : 0);
> +}
> +
> +static void config_picture_dimensions(struct hantro_ctx *ctx, struct=20
hantro_decoded_buffer *dst)
> +{
> +	u32 pic_w_4x4, pic_h_4x4;
> +
> +	hantro_reg_write(ctx->dev, &g2_pic_width_in_cbs, (dst->vp9.width +=20
7) / 8);
> +	hantro_reg_write(ctx->dev, &g2_pic_height_in_cbs, (dst->vp9.height=20
+ 7) / 8);
> +	pic_w_4x4 =3D roundup(dst->vp9.width, 8) >> 2;
> +	pic_h_4x4 =3D roundup(dst->vp9.height, 8) >> 2;
> +	hantro_reg_write(ctx->dev, &g2_pic_width_4x4, pic_w_4x4);
> +	hantro_reg_write(ctx->dev, &g2_pic_height_4x4, pic_h_4x4);
> +}
> +
> +static void
> +config_bit_depth(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_fram=
e=20
*dec_params)
> +{
> +	hantro_reg_write(ctx->dev, &g2_bit_depth_y_minus8, dec_params-
>bit_depth - 8);
> +	hantro_reg_write(ctx->dev, &g2_bit_depth_c_minus8, dec_params-
>bit_depth - 8);
> +}
> +
> +static inline bool is_lossless(const struct v4l2_vp9_quantization *quant)
> +{
> +	return quant->base_q_idx =3D=3D 0 && quant->delta_q_uv_ac =3D=3D 0 &&
> +	       quant->delta_q_uv_dc =3D=3D 0 && quant->delta_q_y_dc =3D=3D 0;
> +}
> +
> +static void
> +config_quant(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_y_dc, dec_params-
>quant.delta_q_y_dc);
> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_ch_dc, dec_params-
>quant.delta_q_uv_dc);
> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_ch_ac, dec_params-
>quant.delta_q_uv_ac);
> +	hantro_reg_write(ctx->dev, &vp9_lossless_e,=20
is_lossless(&dec_params->quant));
> +}
> +
> +static u32
> +hantro_interp_filter_from_v4l2(enum v4l2_vp9_interpolation_filter=20
interpolation_filter)
> +{
> +	switch (interpolation_filter) {
> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP:
> +		return 0x1;
> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH:
> +		return 0;
> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP:
> +		return 0x2;
> +	case V4L2_VP9_INTERP_FILTER_BILINEAR:
> +		return 0x3;
> +	case V4L2_VP9_INTERP_FILTER_SWITCHABLE:
> +		return 0x4;
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +config_others(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame=20
*dec_params,
> +	      bool intra_only, bool resolution_change)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +
> +	hantro_reg_write(ctx->dev, &g2_idr_pic_e, intra_only);
> +
> +	hantro_reg_write(ctx->dev, &vp9_transform_mode, dec_params-
>tx_mode);
> +
> +	hantro_reg_write(ctx->dev, &vp9_mcomp_filt_type, intra_only ?
> +		0 : hantro_interp_filter_from_v4l2(dec_params-
>interpolation_filter));
> +
> +	hantro_reg_write(ctx->dev, &vp9_high_prec_mv_e,
> +			 !!(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV));
> +
> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_mode, dec_params-
>reference_mode);
> +
> +	hantro_reg_write(ctx->dev, &g2_tempor_mvp_e,
> +			 !(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
> +			 !(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
> +			 !(vp9_ctx->last.flags &=20
V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
> +			 !(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_INTRA_ONLY) &&
> +			 !resolution_change &&
> +			 vp9_ctx->last.flags &=20
V4L2_VP9_FRAME_FLAG_SHOW_FRAME
> +	);
> +
> +	hantro_reg_write(ctx->dev, &g2_write_mvs_e,
> +			 !(dec_params->flags &=20
V4L2_VP9_FRAME_FLAG_KEY_FRAME));
> +}
> +
> +static void
> +config_compound_reference(struct hantro_ctx *ctx,
> +			  const struct v4l2_ctrl_vp9_frame=20
*dec_params)
> +{
> +	u32 comp_fixed_ref, comp_var_ref[2];
> +	bool last_ref_frame_sign_bias;
> +	bool golden_ref_frame_sign_bias;
> +	bool alt_ref_frame_sign_bias;
> +	bool comp_ref_allowed =3D 0;
> +
> +	comp_fixed_ref =3D 0;
> +	comp_var_ref[0] =3D 0;
> +	comp_var_ref[1] =3D 0;
> +
> +	last_ref_frame_sign_bias =3D dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_LAST;
> +	golden_ref_frame_sign_bias =3D dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_GOLDEN;
> +	alt_ref_frame_sign_bias =3D dec_params->ref_frame_sign_bias &=20
V4L2_VP9_SIGN_BIAS_ALT;
> +
> +	/* 6.3.12 Frame reference mode syntax */
> +	comp_ref_allowed |=3D golden_ref_frame_sign_bias !=3D=20
last_ref_frame_sign_bias;
> +	comp_ref_allowed |=3D alt_ref_frame_sign_bias !=3D=20
last_ref_frame_sign_bias;
> +
> +	if (comp_ref_allowed) {
> +		if (last_ref_frame_sign_bias =3D=3D
> +		    golden_ref_frame_sign_bias) {
> +			comp_fixed_ref =3D ALTREF_FRAME;
> +			comp_var_ref[0] =3D LAST_FRAME;
> +			comp_var_ref[1] =3D GOLDEN_FRAME;
> +		} else if (last_ref_frame_sign_bias =3D=3D
> +			   alt_ref_frame_sign_bias) {
> +			comp_fixed_ref =3D GOLDEN_FRAME;
> +			comp_var_ref[0] =3D LAST_FRAME;
> +			comp_var_ref[1] =3D ALTREF_FRAME;
> +		} else {
> +			comp_fixed_ref =3D LAST_FRAME;
> +			comp_var_ref[0] =3D GOLDEN_FRAME;
> +			comp_var_ref[1] =3D ALTREF_FRAME;
> +		}
> +	}
> +
> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_fixed_ref, comp_fixed_ref);
> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_var_ref0,=20
comp_var_ref[0]);
> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_var_ref1,=20
comp_var_ref[1]);
> +}
> +
> +#define INNER_LOOP \
> +do {							=09
	\
> +	for (m =3D 0; m < ARRAY_SIZE(adaptive->coef[0][0][0][0]); ++m) {	\
> +		memcpy(adaptive->coef[i][j][k][l][m],		=09
\
> +		       probs->coef[i][j][k][l][m],		=09
\
> +		       sizeof(probs->coef[i][j][k][l][m]));	=09
\
> +							=09
	\
> +		adaptive->coef[i][j][k][l][m][3] =3D 0;		=09
\
> +	}						=09
	\
> +} while (0)
> +
> +static void config_probs(struct hantro_ctx *ctx, const struct=20
v4l2_ctrl_vp9_frame *dec_params)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *misc =3D &vp9_ctx->misc;
> +	struct hantro_g2_all_probs *all_probs =3D misc->cpu;
> +	struct hantro_g2_probs *adaptive;
> +	struct hantro_g2_mv_probs *mv;
> +	const struct v4l2_vp9_segmentation *seg =3D &dec_params->seg;
> +	const struct v4l2_vp9_frame_context *probs =3D &vp9_ctx-
>probability_tables;
> +	int i, j, k, l, m;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(all_probs->kf_y_mode_prob); ++i)
> +		for (j =3D 0; j < ARRAY_SIZE(all_probs-
>kf_y_mode_prob[0]); ++j) {
> +			memcpy(all_probs->kf_y_mode_prob[i][j],
> +			       v4l2_vp9_kf_y_mode_prob[i][j],
> +			       ARRAY_SIZE(all_probs-
>kf_y_mode_prob[i][j]));
> +
> +			all_probs->kf_y_mode_prob_tail[i][j][0] =3D
> +				v4l2_vp9_kf_y_mode_prob[i][j][8];
> +		}
> +
> +	memcpy(all_probs->mb_segment_tree_probs, seg->tree_probs,
> +	       sizeof(all_probs->mb_segment_tree_probs));
> +
> +	memcpy(all_probs->segment_pred_probs, seg->pred_probs,
> +	       sizeof(all_probs->segment_pred_probs));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(all_probs->kf_uv_mode_prob); ++i) {
> +		memcpy(all_probs->kf_uv_mode_prob[i],=20
v4l2_vp9_kf_uv_mode_prob[i],
> +		       ARRAY_SIZE(all_probs->kf_uv_mode_prob[i]));
> +
> +		all_probs->kf_uv_mode_prob_tail[i][0] =3D=20
v4l2_vp9_kf_uv_mode_prob[i][8];
> +	}
> +
> +	adaptive =3D &all_probs->probs;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->inter_mode); ++i) {
> +		memcpy(adaptive->inter_mode[i], probs->inter_mode[i],
> +		       sizeof(probs->inter_mode));
> +
> +		adaptive->inter_mode[i][3] =3D 0;
> +	}
> +
> +	memcpy(adaptive->is_inter, probs->is_inter, sizeof(adaptive-
>is_inter));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->uv_mode); ++i) {
> +		memcpy(adaptive->uv_mode[i], probs->uv_mode[i],
> +		       sizeof(adaptive->uv_mode[i]));
> +		adaptive->uv_mode_tail[i][0] =3D probs->uv_mode[i][8];
> +	}
> +
> +	memcpy(adaptive->tx8, probs->tx8, sizeof(adaptive->tx8));
> +	memcpy(adaptive->tx16, probs->tx16, sizeof(adaptive->tx16));
> +	memcpy(adaptive->tx32, probs->tx32, sizeof(adaptive->tx32));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->y_mode); ++i) {
> +		memcpy(adaptive->y_mode[i], probs->y_mode[i],
> +		       ARRAY_SIZE(adaptive->y_mode[i]));
> +
> +		adaptive->y_mode_tail[i][0] =3D probs->y_mode[i][8];
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->partition[0]); ++i) {
> +		memcpy(adaptive->partition[0][i],=20
v4l2_vp9_kf_partition_probs[i],
> +		       sizeof(v4l2_vp9_kf_partition_probs[i]));
> +
> +		adaptive->partition[0][i][3] =3D 0;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->partition[1]); ++i) {
> +		memcpy(adaptive->partition[1][i], probs->partition[i],
> +		       sizeof(probs->partition[i]));
> +
> +		adaptive->partition[1][i][3] =3D 0;
> +	}
> +
> +	memcpy(adaptive->interp_filter, probs->interp_filter,
> +	       sizeof(adaptive->interp_filter));
> +
> +	memcpy(adaptive->comp_mode, probs->comp_mode, sizeof(adaptive-
>comp_mode));
> +
> +	memcpy(adaptive->skip, probs->skip, sizeof(adaptive->skip));
> +
> +	mv =3D &adaptive->mv;
> +
> +	memcpy(mv->joint, probs->mv.joint, sizeof(mv->joint));
> +	memcpy(mv->sign, probs->mv.sign, sizeof(mv->sign));
> +	memcpy(mv->class0_bit, probs->mv.class0_bit, sizeof(mv-
>class0_bit));
> +	memcpy(mv->fr, probs->mv.fr, sizeof(mv->fr));
> +	memcpy(mv->class0_hp, probs->mv.class0_hp, sizeof(mv->class0_hp));
> +	memcpy(mv->hp, probs->mv.hp, sizeof(mv->hp));
> +	memcpy(mv->classes, probs->mv.classes, sizeof(mv->classes));
> +	memcpy(mv->class0_fr, probs->mv.class0_fr, sizeof(mv->class0_fr));
> +	memcpy(mv->bits, probs->mv.bits, sizeof(mv->bits));
> +
> +	memcpy(adaptive->single_ref, probs->single_ref, sizeof(adaptive-
>single_ref));
> +
> +	memcpy(adaptive->comp_ref, probs->comp_ref, sizeof(adaptive-
>comp_ref));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adaptive->coef); ++i)
> +		for (j =3D 0; j < ARRAY_SIZE(adaptive->coef[0]); ++j)
> +			for (k =3D 0; k < ARRAY_SIZE(adaptive->coef[0]
[0]); ++k)
> +				for (l =3D 0; l <=20
ARRAY_SIZE(adaptive->coef[0][0][0]); ++l)
> +					INNER_LOOP;
> +
> +	hantro_write_addr(ctx->dev, VP9_ADDR_PROBS, misc->dma);
> +}
> +
> +static void config_counts(struct hantro_ctx *ctx)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_dec =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *misc =3D &vp9_dec->misc;
> +	dma_addr_t addr =3D misc->dma + vp9_dec->ctx_counters_offset;
> +
> +	hantro_write_addr(ctx->dev, VP9_ADDR_CTR, addr);
> +}
> +
> +static void config_seg_map(struct hantro_ctx *ctx,
> +			   const struct v4l2_ctrl_vp9_frame=20
*dec_params,
> +			   bool intra_only, bool update_map)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *segment_map =3D &vp9_ctx->segment_map;
> +	dma_addr_t addr;
> +
> +	if (intra_only ||
> +	    (dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT)) {
> +		memset(segment_map->cpu, 0, segment_map->size);
> +		memset(vp9_ctx->feature_data, 0, sizeof(vp9_ctx-
>feature_data));
> +		memset(vp9_ctx->feature_enabled, 0, sizeof(vp9_ctx-
>feature_enabled));
> +	}
> +
> +	addr =3D segment_map->dma + vp9_ctx->active_segment * vp9_ctx-
>segment_map_size;
> +	hantro_write_addr(ctx->dev, VP9_ADDR_SEGMENT_READ, addr);
> +
> +	addr =3D segment_map->dma + (1 - vp9_ctx->active_segment) * vp9_ctx-
>segment_map_size;
> +	hantro_write_addr(ctx->dev, VP9_ADDR_SEGMENT_WRITE, addr);
> +
> +	if (update_map)
> +		vp9_ctx->active_segment =3D 1 - vp9_ctx->active_segment;
> +}
> +
> +static void
> +config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame=20
*dec_params,
> +	      struct vb2_v4l2_buffer *vb2_src)
> +{
> +	dma_addr_t stream_base, tmp_addr;
> +	unsigned int headres_size;
> +	u32 src_len, start_bit, src_buf_len;
> +
> +	headres_size =3D dec_params->uncompressed_header_size
> +		     + dec_params->compressed_header_size;
> +
> +	stream_base =3D vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
> +	hantro_write_addr(ctx->dev, G2_ADDR_STR, stream_base);
> +
> +	tmp_addr =3D stream_base + headres_size;
> +	start_bit =3D (tmp_addr & 0xf) * 8;
> +	hantro_reg_write(ctx->dev, &g2_start_bit, start_bit);
> +
> +	src_len =3D vb2_get_plane_payload(&vb2_src->vb2_buf, 0);
> +	src_len +=3D start_bit / 8 - headres_size;
> +	hantro_reg_write(ctx->dev, &g2_stream_len, src_len);
> +
> +	tmp_addr &=3D ~0xf;
> +	hantro_reg_write(ctx->dev, &g2_strm_start_offset, tmp_addr -=20
stream_base);
> +	src_buf_len =3D vb2_plane_size(&vb2_src->vb2_buf, 0);
> +	hantro_reg_write(ctx->dev, &g2_strm_buffer_len, src_buf_len);
> +}
> +
> +static void
> +config_registers(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_fram=
e=20
*dec_params,
> +		 struct vb2_v4l2_buffer *vb2_src, struct vb2_v4l2_buffer=20
*vb2_dst)
> +{
> +	struct hantro_decoded_buffer *dst, *last, *mv_ref;
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	const struct v4l2_vp9_segmentation *seg;
> +	bool intra_only, resolution_change;
> +
> +	/* vp9 stuff */
> +	dst =3D vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> +
> +	if (vp9_ctx->last.valid)
> +		last =3D get_ref_buf(ctx, &dst->base.vb, vp9_ctx-
>last.timestamp);
> +	else
> +		last =3D dst;
> +
> +	update_dec_buf_info(dst, dec_params);
> +	update_ctx_cur_info(vp9_ctx, dst, dec_params);
> +	seg =3D &dec_params->seg;
> +
> +	intra_only =3D !!(dec_params->flags &
> +			(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
> +			V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
> +
> +	if (!intra_only &&
> +	    !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
> +	    vp9_ctx->last.valid)
> +		mv_ref =3D last;
> +	else
> +		mv_ref =3D dst;
> +
> +	resolution_change =3D dst->vp9.width !=3D last->vp9.width ||
> +			    dst->vp9.height !=3D last->vp9.height;
> +
> +	/* configure basic registers */
> +	hantro_reg_write(ctx->dev, &g2_mode, VP9_DEC_MODE);
> +	hantro_reg_write(ctx->dev, &g2_strm_swap, 0xf);
> +	hantro_reg_write(ctx->dev, &g2_dirmv_swap, 0xf);
> +	hantro_reg_write(ctx->dev, &g2_compress_swap, 0xf);
> +	hantro_reg_write(ctx->dev, &g2_buswidth, BUS_WIDTH_128);
> +	hantro_reg_write(ctx->dev, &g2_max_burst, 16);
> +	hantro_reg_write(ctx->dev, &g2_apf_threshold, 8);
> +	hantro_reg_write(ctx->dev, &g2_ref_compress_bypass, 1);
> +	hantro_reg_write(ctx->dev, &g2_clk_gate_e, 1);
> +	hantro_reg_write(ctx->dev, &g2_max_cb_size, 6);
> +	hantro_reg_write(ctx->dev, &g2_min_cb_size, 3);
> +
> +	config_output(ctx, dst, dec_params);
> +
> +	if (!intra_only)
> +		config_ref_registers(ctx, dec_params, dst, mv_ref);
> +
> +	config_tiles(ctx, dec_params, dst);
> +	config_segment(ctx, dec_params);
> +	config_loop_filter(ctx, dec_params);
> +	config_picture_dimensions(ctx, dst);
> +	config_bit_depth(ctx, dec_params);
> +	config_quant(ctx, dec_params);
> +	config_others(ctx, dec_params, intra_only, resolution_change);
> +	config_compound_reference(ctx, dec_params);
> +	config_probs(ctx, dec_params);
> +	config_counts(ctx);
> +	config_seg_map(ctx, dec_params, intra_only,
> +		       seg->flags &=20
V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP);
> +	config_source(ctx, dec_params, vb2_src);
> +}
> +
> +int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
> +{
> +	const struct v4l2_ctrl_vp9_frame *decode_params;
> +	struct vb2_v4l2_buffer *src;
> +	struct vb2_v4l2_buffer *dst;
> +	int ret;
> +
> +	hantro_g2_check_idle(ctx->dev);
> +
> +	ret =3D start_prepare_run(ctx, &decode_params);
> +	if (ret) {
> +		hantro_end_prepare_run(ctx);
> +		return ret;
> +	}
> +
> +	src =3D hantro_get_src_buf(ctx);
> +	dst =3D hantro_get_dst_buf(ctx);
> +
> +	config_registers(ctx, decode_params, src, dst);
> +
> +	hantro_end_prepare_run(ctx);
> +
> +	vdpu_write(ctx->dev, G2_REG_INTERRUPT_DEC_E, G2_REG_INTERRUPT);
> +
> +	return 0;
> +}
> +
> +#define copy_tx_and_skip(p1, p2)				\
> +do {							=09
\
> +	memcpy((p1)->tx8, (p2)->tx8, sizeof((p1)->tx8));	\
> +	memcpy((p1)->tx16, (p2)->tx16, sizeof((p1)->tx16));	\
> +	memcpy((p1)->tx32, (p2)->tx32, sizeof((p1)->tx32));	\
> +	memcpy((p1)->skip, (p2)->skip, sizeof((p1)->skip));	\
> +} while (0)
> +
> +void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	unsigned int fctx_idx;
> +
> +	if (!(vp9_ctx->cur.flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX))
> +		goto out_update_last;
> +
> +	fctx_idx =3D vp9_ctx->cur.frame_context_idx;
> +
> +	if (!(vp9_ctx->cur.flags & V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE)) {
> +		/* error_resilient_mode =3D=3D 0 &&=20
frame_parallel_decoding_mode =3D=3D 0 */
> +		struct v4l2_vp9_frame_context *probs =3D &vp9_ctx-
>probability_tables;
> +		bool frame_is_intra =3D vp9_ctx->cur.flags &
> +		    (V4L2_VP9_FRAME_FLAG_KEY_FRAME |=20
V4L2_VP9_FRAME_FLAG_INTRA_ONLY);
> +		struct tx_and_skip {
> +			u8 tx8[2][1];
> +			u8 tx16[2][2];
> +			u8 tx32[2][3];
> +			u8 skip[3];
> +		} _tx_skip, *tx_skip =3D &_tx_skip;
> +		struct v4l2_vp9_frame_symbol_counts *counts;
> +		struct symbol_counts *hantro_cnts;
> +		u32 tx16p[2][4];
> +		int i;
> +
> +		/* buffer the forward-updated TX and skip probs */
> +		if (frame_is_intra)
> +			copy_tx_and_skip(tx_skip, probs);
> +
> +		/* 6.1.2 refresh_probs(): load_probs() and load_probs2()=20
*/
> +		*probs =3D vp9_ctx->frame_context[fctx_idx];
> +
> +		/* if FrameIsIntra then undo the effect of load_probs2()=20
*/
> +		if (frame_is_intra)
> +			copy_tx_and_skip(probs, tx_skip);
> +
> +		counts =3D &vp9_ctx->cnts;
> +		hantro_cnts =3D vp9_ctx->misc.cpu + vp9_ctx-
>ctx_counters_offset;
> +		for (i =3D 0; i < ARRAY_SIZE(tx16p); ++i) {
> +			memcpy(tx16p[i],
> +			       hantro_cnts->tx16x16_count[i],
> +			       sizeof(hantro_cnts-
>tx16x16_count[0]));
> +			tx16p[i][3] =3D 0;
> +		}
> +		counts->tx16p =3D &tx16p;
> +
> +		v4l2_vp9_adapt_coef_probs(probs, counts,
> +					  !vp9_ctx->last.valid=20
||
> +					  vp9_ctx->last.flags &=20
V4L2_VP9_FRAME_FLAG_KEY_FRAME,
> +					  frame_is_intra);
> +
> +		if (!frame_is_intra) {
> +			/* load_probs2() already done */
> +			u32 mv_mode[7][4];
> +
> +			for (i =3D 0; i < ARRAY_SIZE(mv_mode); ++i) {
> +				mv_mode[i][0] =3D hantro_cnts-
>inter_mode_counts[i][1][0];
> +				mv_mode[i][1] =3D hantro_cnts-
>inter_mode_counts[i][2][0];
> +				mv_mode[i][2] =3D hantro_cnts-
>inter_mode_counts[i][0][0];
> +				mv_mode[i][3] =3D hantro_cnts-
>inter_mode_counts[i][2][1];
> +			}
> +			counts->mv_mode =3D &mv_mode;
> +			v4l2_vp9_adapt_noncoef_probs(&vp9_ctx-
>probability_tables, counts,
> +						    =20
vp9_ctx->cur.reference_mode,
> +						    =20
vp9_ctx->cur.interpolation_filter,
> +						    =20
vp9_ctx->cur.tx_mode, vp9_ctx->cur.flags);
> +		}
> +	}
> +
> +	vp9_ctx->frame_context[fctx_idx] =3D vp9_ctx->probability_tables;
> +
> +out_update_last:
> +	vp9_ctx->last =3D vp9_ctx->cur;
> +}
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/
media/hantro/hantro_hw.h
> index 42b3f3961f75..2961d399fd60 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/v4l2-controls.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-vp9.h>
>  #include <media/videobuf2-core.h>
> =20
>  #define DEC_8190_ALIGN_MASK	0x07U
> @@ -161,6 +162,50 @@ struct hantro_vp8_dec_hw_ctx {
>  	struct hantro_aux_buf prob_tbl;
>  };
> =20
> +struct hantro_vp9_frame_info {
> +	u32 valid : 1;
> +	u32 frame_context_idx : 2;
> +	u32 reference_mode : 2;
> +	u32 tx_mode : 3;
> +	u32 interpolation_filter : 3;
> +	u32 flags;
> +	u64 timestamp;
> +};
> +
> +#define MAX_SB_COLS	64
> +#define MAX_SB_ROWS	34
> +
> +/**
> + * struct hantro_vp9_dec_hw_ctx
> + *
> + */
> +struct hantro_vp9_dec_hw_ctx {
> +	struct hantro_aux_buf tile_edge;
> +	struct hantro_aux_buf segment_map;
> +	struct hantro_aux_buf misc;
> +	struct v4l2_vp9_frame_symbol_counts cnts;
> +	struct v4l2_vp9_frame_context probability_tables;
> +	struct v4l2_vp9_frame_context frame_context[4];
> +	struct hantro_vp9_frame_info cur;
> +	struct hantro_vp9_frame_info last;
> +
> +	unsigned int bsd_ctrl_offset;
> +	unsigned int segment_map_size;
> +	unsigned int ctx_counters_offset;
> +	unsigned int tile_info_offset;
> +
> +	unsigned short tile_r_info[MAX_SB_ROWS];
> +	unsigned short tile_c_info[MAX_SB_COLS];
> +	unsigned int last_tile_r;
> +	unsigned int last_tile_c;
> +	unsigned int last_sbs_r;
> +	unsigned int last_sbs_c;
> +
> +	unsigned int active_segment;
> +	u8 feature_enabled[8];
> +	s16 feature_data[8][4];
> +};
> +
>  /**
>   * struct hantro_postproc_ctx
>   *
> @@ -267,6 +312,24 @@ void hantro_hevc_ref_remove_unused(struct hantro_ctx=
=20
*ctx);
>  size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
>  size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps=
=20
*sps);
> =20
> +static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
> +{
> +	return (dimension + 63) / 64;
> +}
> +
> +static inline size_t
> +hantro_vp9_mv_size(unsigned int width, unsigned int height)
> +{
> +	int num_ctbs;
> +
> +	/*
> +	 * There can be up to (CTBs x 64) number of blocks,
> +	 * and the motion vector for each block needs 16 bytes.
> +	 */
> +	num_ctbs =3D hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
> +	return (num_ctbs * 64) * 16;
> +}
> +
>  static inline size_t
>  hantro_h264_mv_size(unsigned int width, unsigned int height)
>  {
> @@ -308,6 +371,10 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
>  void hantro_vp8_prob_update(struct hantro_ctx *ctx,
>  			    const struct v4l2_ctrl_vp8_frame *hdr);
> =20
> +int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx);
> +void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx);
> +int hantro_vp9_dec_init(struct hantro_ctx *ctx);
> +void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
>  void hantro_g2_check_idle(struct hantro_dev *vpu);
> =20
>  #endif /* HANTRO_HW_H_ */
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/
media/hantro/hantro_v4l2.c
> index d1f060c55fed..e4b0645ba6fc 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -299,6 +299,11 @@ static int hantro_try_fmt(const struct hantro_ctx *c=
tx,
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_h264_mv_size(pix_mp-
>width,
>  						    pix_mp-
>height);
> +		else if (ctx->vpu_src_fmt->fourcc =3D=3D=20
V4L2_PIX_FMT_VP9_FRAME &&
> +			 !hantro_needs_postproc(ctx, fmt))
> +			pix_mp->plane_fmt[0].sizeimage +=3D
> +				hantro_vp9_mv_size(pix_mp->width,
> +						   pix_mp-
>height);
>  	} else if (!pix_mp->plane_fmt[0].sizeimage) {
>  		/*
>  		 * For coded formats the application can specify
> @@ -407,6 +412,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx=
,=20
u32 fourcc)
>  	case V4L2_PIX_FMT_VP8_FRAME:
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_HEVC_SLICE:
> +	case V4L2_PIX_FMT_VP9_FRAME:
>  		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests =3D true;
>  		break;
>  	default:
> diff --git a/drivers/staging/media/hantro/hantro_vp9.c b/drivers/staging/
media/hantro/hantro_vp9.c
> new file mode 100644
> index 000000000000..566cd376c097
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_vp9.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VP9 codec driver
> + *
> + * Copyright (C) 2021 Collabora Ltd.
> + */
> +
> +#include <linux/types.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "hantro.h"
> +#include "hantro_hw.h"
> +#include "hantro_vp9.h"
> +
> +#define POW2(x) (1 << (x))
> +
> +#define MAX_LOG2_TILE_COLUMNS 6
> +#define MAX_NUM_TILE_COLS POW2(MAX_LOG2_TILE_COLUMNS)
> +#define MAX_TILE_COLS 20
> +#define MAX_TILE_ROWS 22
> +
> +static size_t hantro_vp9_tile_filter_size(unsigned int height)
> +{
> +	u32 h, height32, size;
> +
> +	h =3D roundup(height, 8);
> +
> +	height32 =3D roundup(h, 64);
> +	size =3D 24 * height32 * (MAX_NUM_TILE_COLS - 1); /* luma: 8, chroma:=20
8 + 8 */
> +
> +	return size;
> +}
> +
> +static size_t hantro_vp9_bsd_control_size(unsigned int height)
> +{
> +	u32 h, height32;
> +
> +	h =3D roundup(height, 8);
> +	height32 =3D roundup(h, 64);
> +
> +	return 16 * (height32 / 4) * (MAX_NUM_TILE_COLS - 1);
> +}
> +
> +static size_t hantro_vp9_segment_map_size(unsigned int width, unsigned i=
nt=20
height)
> +{
> +	u32 w, h;
> +	int num_ctbs;
> +
> +	w =3D roundup(width, 8);
> +	h =3D roundup(height, 8);
> +	num_ctbs =3D ((w + 63) / 64) * ((h + 63) / 64);
> +
> +	return num_ctbs * 32;
> +}
> +
> +static inline size_t hantro_vp9_prob_tab_size(void)
> +{
> +	return roundup(sizeof(struct hantro_g2_all_probs), 16);
> +}
> +
> +static inline size_t hantro_vp9_count_tab_size(void)
> +{
> +	return roundup(sizeof(struct symbol_counts), 16);
> +}
> +
> +static inline size_t hantro_vp9_tile_info_size(void)
> +{
> +	return roundup((MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) +=20
15 + 16) & ~0xf, 16);
> +}
> +
> +static void *get_coeffs_arr(struct symbol_counts *cnts, int i, int j, in=
t k,=20
int l, int m)
> +{
> +	if (i =3D=3D 0)
> +		return &cnts->count_coeffs[j][k][l][m];
> +
> +	if (i =3D=3D 1)
> +		return &cnts->count_coeffs8x8[j][k][l][m];
> +
> +	if (i =3D=3D 2)
> +		return &cnts->count_coeffs16x16[j][k][l][m];
> +
> +	if (i =3D=3D 3)
> +		return &cnts->count_coeffs32x32[j][k][l][m];
> +
> +	return NULL;
> +}
> +
> +static void *get_eobs1(struct symbol_counts *cnts, int i, int j, int k, =
int=20
l, int m)
> +{
> +	if (i =3D=3D 0)
> +		return &cnts->count_coeffs[j][k][l][m][3];
> +
> +	if (i =3D=3D 1)
> +		return &cnts->count_coeffs8x8[j][k][l][m][3];
> +
> +	if (i =3D=3D 2)
> +		return &cnts->count_coeffs16x16[j][k][l][m][3];
> +
> +	if (i =3D=3D 3)
> +		return &cnts->count_coeffs32x32[j][k][l][m][3];
> +
> +	return NULL;
> +}
> +
> +#define INNER_LOOP \
> +	do {						=09
			\
> +		for (m =3D 0; m < ARRAY_SIZE(vp9_ctx->cnts.coeff[i][0][0]
[0]); ++m) {	\
> +			vp9_ctx->cnts.coeff[i][j][k][l][m] =3D	=09
		\
> +				get_coeffs_arr(cnts, i, j, k, l,=20
m);			\
> +			vp9_ctx->cnts.eob[i][j][k][l][m][0] =3D	=09
		\
> +				&cnts->count_eobs[i][j][k][l][m];=09
		\
> +			vp9_ctx->cnts.eob[i][j][k][l][m][1] =3D	=09
		\
> +				get_eobs1(cnts, i, j, k, l, m);=09
			\
> +		}					=09
			\
> +	} while (0)
> +
> +static void init_v4l2_vp9_count_tbl(struct hantro_ctx *ctx)
> +{
> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx =3D &ctx->vp9_dec;
> +	struct symbol_counts *cnts =3D vp9_ctx->misc.cpu + vp9_ctx-
>ctx_counters_offset;
> +	int i, j, k, l, m;
> +
> +	vp9_ctx->cnts.partition =3D &cnts->partition_counts;
> +	vp9_ctx->cnts.skip =3D &cnts->mbskip_count;
> +	vp9_ctx->cnts.intra_inter =3D &cnts->intra_inter_count;
> +	vp9_ctx->cnts.tx32p =3D &cnts->tx32x32_count;
> +	/*
> +	 * g2 hardware uses tx16x16_count[2][3], while the api
> +	 * expects tx16p[2][4], so this must be explicitly copied
> +	 * into vp9_ctx->cnts.tx16p when passing the data to the
> +	 * vp9 library function
> +	 */
> +	vp9_ctx->cnts.tx8p =3D &cnts->tx8x8_count;
> +
> +	vp9_ctx->cnts.y_mode =3D &cnts->sb_ymode_counts;
> +	vp9_ctx->cnts.uv_mode =3D &cnts->uv_mode_counts;
> +	vp9_ctx->cnts.comp =3D &cnts->comp_inter_count;
> +	vp9_ctx->cnts.comp_ref =3D &cnts->comp_ref_count;
> +	vp9_ctx->cnts.single_ref =3D &cnts->single_ref_count;
> +	vp9_ctx->cnts.filter =3D &cnts->switchable_interp_counts;
> +	vp9_ctx->cnts.mv_joint =3D &cnts->mv_counts.joints;
> +	vp9_ctx->cnts.sign =3D &cnts->mv_counts.sign;
> +	vp9_ctx->cnts.classes =3D &cnts->mv_counts.classes;
> +	vp9_ctx->cnts.class0 =3D &cnts->mv_counts.class0;
> +	vp9_ctx->cnts.bits =3D &cnts->mv_counts.bits;
> +	vp9_ctx->cnts.class0_fp =3D &cnts->mv_counts.class0_fp;
> +	vp9_ctx->cnts.fp =3D &cnts->mv_counts.fp;
> +	vp9_ctx->cnts.class0_hp =3D &cnts->mv_counts.class0_hp;
> +	vp9_ctx->cnts.hp =3D &cnts->mv_counts.hp;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(vp9_ctx->cnts.coeff); ++i)
> +		for (j =3D 0; j < ARRAY_SIZE(vp9_ctx->cnts.coeff[i]); ++j)
> +			for (k =3D 0; k < ARRAY_SIZE(vp9_ctx-
>cnts.coeff[i][0]); ++k)
> +				for (l =3D 0; l <=20
ARRAY_SIZE(vp9_ctx->cnts.coeff[i][0][0]); ++l)
> +					INNER_LOOP;
> +}
> +
> +int hantro_vp9_dec_init(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	const struct hantro_variant *variant =3D vpu->variant;
> +	struct hantro_vp9_dec_hw_ctx *vp9_dec =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *tile_edge =3D &vp9_dec->tile_edge;
> +	struct hantro_aux_buf *segment_map =3D &vp9_dec->segment_map;
> +	struct hantro_aux_buf *misc =3D &vp9_dec->misc;
> +	u32 i, max_width, max_height, size;
> +
> +	if (variant->num_dec_fmts < 1)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < variant->num_dec_fmts; ++i)
> +		if (variant->dec_fmts[i].fourcc =3D=3D=20
V4L2_PIX_FMT_VP9_FRAME)
> +			break;
> +
> +	if (i =3D=3D variant->num_dec_fmts)
> +		return -EINVAL;
> +
> +	max_width =3D vpu->variant->dec_fmts[i].frmsize.max_width;
> +	max_height =3D vpu->variant->dec_fmts[i].frmsize.max_height;
> +
> +	size =3D hantro_vp9_tile_filter_size(max_height);
> +	vp9_dec->bsd_ctrl_offset =3D size;
> +	size +=3D hantro_vp9_bsd_control_size(max_height);
> +
> +	tile_edge->cpu =3D dma_alloc_coherent(vpu->dev, size, &tile_edge-
>dma, GFP_KERNEL);
> +	if (!tile_edge->cpu)
> +		return -ENOMEM;
> +
> +	tile_edge->size =3D size;
> +	memset(tile_edge->cpu, 0, size);
> +
> +	size =3D hantro_vp9_segment_map_size(max_width, max_height);
> +	vp9_dec->segment_map_size =3D size;
> +	size *=3D 2; /* we need two areas of this size, used alternately */
> +
> +	segment_map->cpu =3D dma_alloc_coherent(vpu->dev, size, &segment_map-
>dma, GFP_KERNEL);
> +	if (!segment_map->cpu)
> +		goto err_segment_map;
> +
> +	segment_map->size =3D size;
> +	memset(segment_map->cpu, 0, size);
> +
> +	size =3D hantro_vp9_prob_tab_size();
> +	vp9_dec->ctx_counters_offset =3D size;
> +	size +=3D hantro_vp9_count_tab_size();
> +	vp9_dec->tile_info_offset =3D size;
> +	size +=3D hantro_vp9_tile_info_size();
> +
> +	misc->cpu =3D dma_alloc_coherent(vpu->dev, size, &misc->dma,=20
GFP_KERNEL);
> +	if (!misc->cpu)
> +		goto err_misc;
> +
> +	misc->size =3D size;
> +	memset(misc->cpu, 0, size);
> +
> +	init_v4l2_vp9_count_tbl(ctx);
> +
> +	return 0;
> +
> +err_misc:
> +	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu,=20
segment_map->dma);
> +
> +err_segment_map:
> +	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu,=20
tile_edge->dma);
> +
> +	return -ENOMEM;
> +}
> +
> +void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	struct hantro_vp9_dec_hw_ctx *vp9_dec =3D &ctx->vp9_dec;
> +	struct hantro_aux_buf *tile_edge =3D &vp9_dec->tile_edge;
> +	struct hantro_aux_buf *segment_map =3D &vp9_dec->segment_map;
> +	struct hantro_aux_buf *misc =3D &vp9_dec->misc;
> +
> +	dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
> +	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu,=20
segment_map->dma);
> +	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu,=20
tile_edge->dma);
> +}
> diff --git a/drivers/staging/media/hantro/hantro_vp9.h b/drivers/staging/
media/hantro/hantro_vp9.h
> new file mode 100644
> index 000000000000..c7f4bd3ff8dd
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_vp9.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Hantro VP9 codec driver
> + *
> + * Copyright (C) 2021 Collabora Ltd.
> + */
> +
> +struct hantro_g2_mv_probs {
> +	u8 joint[3];
> +	u8 sign[2];
> +	u8 class0_bit[2][1];
> +	u8 fr[2][3];
> +	u8 class0_hp[2];
> +	u8 hp[2];
> +	u8 classes[2][10];
> +	u8 class0_fr[2][2][3];
> +	u8 bits[2][10];
> +};
> +
> +struct hantro_g2_probs {
> +	u8 inter_mode[7][4];
> +	u8 is_inter[4];
> +	u8 uv_mode[10][8];
> +	u8 tx8[2][1];
> +	u8 tx16[2][2];
> +	u8 tx32[2][3];
> +	u8 y_mode_tail[4][1];
> +	u8 y_mode[4][8];
> +	u8 partition[2][16][4]; /* [keyframe][][], [inter][][] */
> +	u8 uv_mode_tail[10][1];
> +	u8 interp_filter[4][2];
> +	u8 comp_mode[5];
> +	u8 skip[3];
> +
> +	u8 pad1[1];
> +
> +	struct hantro_g2_mv_probs mv;
> +
> +	u8 single_ref[5][2];
> +	u8 comp_ref[5];
> +
> +	u8 pad2[17];
> +
> +	u8 coef[4][2][2][6][6][4];
> +};
> +
> +struct hantro_g2_all_probs {
> +	u8 kf_y_mode_prob[10][10][8];
> +
> +	u8 kf_y_mode_prob_tail[10][10][1];
> +	u8 ref_pred_probs[3];
> +	u8 mb_segment_tree_probs[7];
> +	u8 segment_pred_probs[3];
> +	u8 ref_scores[4];
> +	u8 prob_comppred[2];
> +
> +	u8 pad1[9];
> +
> +	u8 kf_uv_mode_prob[10][8];
> +	u8 kf_uv_mode_prob_tail[10][1];
> +
> +	u8 pad2[6];
> +
> +	struct hantro_g2_probs probs;
> +};
> +
> +struct mv_counts {
> +	u32 joints[4];
> +	u32 sign[2][2];
> +	u32 classes[2][11];
> +	u32 class0[2][2];
> +	u32 bits[2][10][2];
> +	u32 class0_fp[2][2][4];
> +	u32 fp[2][4];
> +	u32 class0_hp[2][2];
> +	u32 hp[2][2];
> +};
> +
> +struct symbol_counts {
> +	u32 inter_mode_counts[7][3][2];
> +	u32 sb_ymode_counts[4][10];
> +	u32 uv_mode_counts[10][10];
> +	u32 partition_counts[16][4];
> +	u32 switchable_interp_counts[4][3];
> +	u32 intra_inter_count[4][2];
> +	u32 comp_inter_count[5][2];
> +	u32 single_ref_count[5][2][2];
> +	u32 comp_ref_count[5][2];
> +	u32 tx32x32_count[2][4];
> +	u32 tx16x16_count[2][3];
> +	u32 tx8x8_count[2][2];
> +	u32 mbskip_count[3][2];
> +
> +	struct mv_counts mv_counts;
> +
> +	u32 count_coeffs[2][2][6][6][4];
> +	u32 count_coeffs8x8[2][2][6][6][4];
> +	u32 count_coeffs16x16[2][2][6][6][4];
> +	u32 count_coeffs32x32[2][2][6][6][4];
> +
> +	u32 count_eobs[4][2][2][6][6];
> +};
> +
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/stagin=
g/
media/hantro/imx8m_vpu_hw.c
> index a40b161e5956..455a107ffb02 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -150,6 +150,19 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts=
[]=20
=3D {
>  			.step_height =3D MB_DIM,
>  		},
>  	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_VP9_FRAME,
> +		.codec_mode =3D HANTRO_MODE_VP9_DEC,
> +		.max_depth =3D 2,
> +		.frmsize =3D {
> +			.min_width =3D 48,
> +			.max_width =3D 3840,
> +			.step_width =3D MB_DIM,
> +			.min_height =3D 48,
> +			.max_height =3D 2160,
> +			.step_height =3D MB_DIM,
> +		},
> +	},
>  };
> =20
>  static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
> @@ -241,6 +254,13 @@ static const struct hantro_codec_ops=20
imx8mq_vpu_g2_codec_ops[] =3D {
>  		.init =3D hantro_hevc_dec_init,
>  		.exit =3D hantro_hevc_dec_exit,
>  	},
> +	[HANTRO_MODE_VP9_DEC] =3D {
> +		.run =3D hantro_g2_vp9_dec_run,
> +		.done =3D hantro_g2_vp9_dec_done,
> +		.reset =3D imx8m_vpu_g2_reset,
> +		.init =3D hantro_vp9_dec_init,
> +		.exit =3D hantro_vp9_dec_exit,
> +	},
>  };
> =20
>  /*
> @@ -281,7 +301,7 @@ const struct hantro_variant imx8mq_vpu_g2_variant =3D=
 {
>  	.dec_offset =3D 0x0,
>  	.dec_fmts =3D imx8m_vpu_g2_dec_fmts,
>  	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
> -	.codec =3D HANTRO_HEVC_DECODER,
> +	.codec =3D HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
>  	.codec_ops =3D imx8mq_vpu_g2_codec_ops,
>  	.init =3D imx8mq_vpu_hw_init,
>  	.runtime_resume =3D imx8mq_runtime_resume,
> --=20
> 2.17.1
>=20
>=20


