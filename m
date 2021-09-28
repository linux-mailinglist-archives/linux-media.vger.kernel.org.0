Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470A241B48A
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 18:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbhI1Q5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 12:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241894AbhI1Q5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 12:57:42 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9017C061745
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 09:56:02 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 138so40938471qko.10
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=D0s2b6pbniwGyIoYgcH8BH+CA6QFqL/fI1VUJp2KYZ8=;
        b=QWFNBR6qvJAzzlmAxCO0uExbBx5hAHj+TH4hMJaFmrrXqxjWL/XQVVmjWYq0nun5Kl
         u/SHucmAc5+rm/HQPZjnJoJfYKwpOiqW+7RS3bidYe44Fe8kHPz1NiWJtIju/M4tkOfb
         yONGN9JtHYY5f2h8GzE9QYlk0CH9biCPUloMrGBQrdBVRgEz6h5OTWeJ1KoRWEbTeAh6
         0kG3ctny00P2ayKIEum0aVbQGgWbs/XZMWxRIGxm5bJaOzw7Ma79F83T6yNCM4JdKchs
         yaLo0V+r4YBaf4O6zAssHQodDnlKLlBMs99FtVr+BYDj2vJ2G+0MsyFw/IVM0v5r96tC
         xg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=D0s2b6pbniwGyIoYgcH8BH+CA6QFqL/fI1VUJp2KYZ8=;
        b=1r6nZAr2RXkykWVg4C6Rg1eVSKM+Uu32xSyjwJRSoT54r+LJ7AuIcfotkmYAH4m+iw
         3/6BxcUwWFBVHq/ZZFDL+k7FCh6L7QhcisZg71mFNgdNO04+hxQmg+6ExuPZzyXdQ/A4
         ylrHz6V8Nj8c7G/7jNJ3IXr0VmHbrjBriqJGLr3hQV6wBh7SD0s2uqTESBb1kuYskjaA
         VwWfUPR9FgcpHGwZtSrDv7Eds5GDbsF+k/4BgF8jCjvGs32rxjav8F2Hzj+dtDV2xjaO
         CUZeUTWE4FTkDST6NEFu22AY021U32jRrmBL+ShAI3OGMUUYbrHD6hhPU9uYlGrJjOaw
         CzaQ==
X-Gm-Message-State: AOAM532O9wDEJIPNcY6KAalXsDAo8uOblORo/OUWwEoOV/HxBbGolRtJ
        Ez084zBGs5C8mNtxrRX2h1VEuA==
X-Google-Smtp-Source: ABdhPJyK7NlTng1jpOLvkyyjfxoaG7b3qXFnSiYS6Hzd7ACsP0PZRIQ0Jf0SiL9/JSQ2jI/VbZ18sQ==
X-Received: by 2002:a05:620a:5ec:: with SMTP id z12mr993317qkg.41.1632848161471;
        Tue, 28 Sep 2021 09:56:01 -0700 (PDT)
Received: from fedora ([196.32.91.248])
        by smtp.gmail.com with ESMTPSA id j21sm13968544qkl.25.2021.09.28.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 09:56:00 -0700 (PDT)
Date:   Tue, 28 Sep 2021 13:55:53 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        bob.beckett@collabora.com
Subject: Re: [PATCH v6 09/10] media: hantro: Support VP9 on the G2 core
Message-ID: <YVNJGaLmZkJVuXbe@fedora>
References: <20210927151958.24426-1-andrzej.p@collabora.com>
 <20210927151958.24426-10-andrzej.p@collabora.com>
 <e298b3b1204f56dd91cc5b8493810e16267bbb91.camel@collabora.com>
 <532bfb30-c464-137e-1635-b6a868d5d7e6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <532bfb30-c464-137e-1635-b6a868d5d7e6@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 28, 2021 at 05:39:02PM +0200, Andrzej Pietrasiewicz wrote:
> Hi Nicolas,
> 
> W dniu 27.09.2021 o 21:17, Nicolas Dufresne pisze:
> > Le lundi 27 septembre 2021 à 17:19 +0200, Andrzej Pietrasiewicz a écrit :
> > > VeriSilicon Hantro G2 core supports VP9 codec.
> > > 
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > >   drivers/staging/media/hantro/Kconfig          |   1 +
> > >   drivers/staging/media/hantro/Makefile         |   6 +-
> > >   drivers/staging/media/hantro/hantro.h         |  26 +
> > >   drivers/staging/media/hantro/hantro_drv.c     |  18 +-
> > >   drivers/staging/media/hantro/hantro_g2_regs.h |  97 ++
> > >   .../staging/media/hantro/hantro_g2_vp9_dec.c  | 978 ++++++++++++++++++
> > >   drivers/staging/media/hantro/hantro_hw.h      |  67 ++
> > >   drivers/staging/media/hantro/hantro_v4l2.c    |   6 +
> > >   drivers/staging/media/hantro/hantro_vp9.c     | 240 +++++
> > >   drivers/staging/media/hantro/hantro_vp9.h     | 103 ++
> > >   drivers/staging/media/hantro/imx8m_vpu_hw.c   |  22 +-
> > >   11 files changed, 1560 insertions(+), 4 deletions(-)
> > >   create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> > >   create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
> > >   create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
> > > 
> > > diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> > > index 20b1f6d7b69c..00a57d88c92e 100644
> > > --- a/drivers/staging/media/hantro/Kconfig
> > > +++ b/drivers/staging/media/hantro/Kconfig
> > > @@ -9,6 +9,7 @@ config VIDEO_HANTRO
> > >   	select VIDEOBUF2_VMALLOC
> > >   	select V4L2_MEM2MEM_DEV
> > >   	select V4L2_H264
> > > +	select V4L2_VP9
> > >   	help
> > >   	  Support for the Hantro IP based Video Processing Units present on
> > >   	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
> > > diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> > > index fe6d84871d07..28af0a1ee4bf 100644
> > > --- a/drivers/staging/media/hantro/Makefile
> > > +++ b/drivers/staging/media/hantro/Makefile
> > > @@ -10,9 +10,10 @@ hantro-vpu-y += \
> > >   		hantro_g1.o \
> > >   		hantro_g1_h264_dec.o \
> > >   		hantro_g1_mpeg2_dec.o \
> > > -		hantro_g2_hevc_dec.o \
> > >   		hantro_g1_vp8_dec.o \
> > >   		hantro_g2.o \
> > > +		hantro_g2_hevc_dec.o \
> > > +		hantro_g2_vp9_dec.o \
> > >   		rockchip_vpu2_hw_jpeg_enc.o \
> > >   		rockchip_vpu2_hw_h264_dec.o \
> > >   		rockchip_vpu2_hw_mpeg2_dec.o \
> > > @@ -21,7 +22,8 @@ hantro-vpu-y += \
> > >   		hantro_h264.o \
> > >   		hantro_hevc.o \
> > >   		hantro_mpeg2.o \
> > > -		hantro_vp8.o
> > > +		hantro_vp8.o \
> > > +		hantro_vp9.o
> > >   hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
> > >   		imx8m_vpu_hw.o
> > > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > > index d91eb2b1c509..1e8c1a6e3eb0 100644
> > > --- a/drivers/staging/media/hantro/hantro.h
> > > +++ b/drivers/staging/media/hantro/hantro.h
> > > @@ -36,6 +36,7 @@ struct hantro_postproc_ops;
> > >   #define HANTRO_VP8_DECODER	BIT(17)
> > >   #define HANTRO_H264_DECODER	BIT(18)
> > >   #define HANTRO_HEVC_DECODER	BIT(19)
> > > +#define HANTRO_VP9_DECODER	BIT(20)
> > >   #define HANTRO_DECODERS		0xffff0000
> > >   /**
> > > @@ -110,6 +111,7 @@ enum hantro_codec_mode {
> > >   	HANTRO_MODE_MPEG2_DEC,
> > >   	HANTRO_MODE_VP8_DEC,
> > >   	HANTRO_MODE_HEVC_DEC,
> > > +	HANTRO_MODE_VP9_DEC,
> > >   };
> > >   /*
> > > @@ -223,6 +225,7 @@ struct hantro_dev {
> > >    * @mpeg2_dec:		MPEG-2-decoding context.
> > >    * @vp8_dec:		VP8-decoding context.
> > >    * @hevc_dec:		HEVC-decoding context.
> > > + * @vp9_dec:		VP9-decoding context.
> > >    */
> > >   struct hantro_ctx {
> > >   	struct hantro_dev *dev;
> > > @@ -250,6 +253,7 @@ struct hantro_ctx {
> > >   		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
> > >   		struct hantro_vp8_dec_hw_ctx vp8_dec;
> > >   		struct hantro_hevc_dec_hw_ctx hevc_dec;
> > > +		struct hantro_vp9_dec_hw_ctx vp9_dec;
> > >   	};
> > >   };
> > > @@ -299,6 +303,22 @@ struct hantro_postproc_regs {
> > >   	struct hantro_reg display_width;
> > >   };
> > > +struct hantro_vp9_decoded_buffer_info {
> > > +	/* Info needed when the decoded frame serves as a reference frame. */
> > > +	unsigned short width;
> > > +	unsigned short height;
> > > +	u32 bit_depth : 4;
> > > +};
> > > +
> > > +struct hantro_decoded_buffer {
> > > +	/* Must be the first field in this struct. */
> > > +	struct v4l2_m2m_buffer base;
> > > +
> > > +	union {
> > > +		struct hantro_vp9_decoded_buffer_info vp9;
> > > +	};
> > > +};
> > > +
> > >   /* Logging helpers */
> > >   /**
> > > @@ -436,6 +456,12 @@ hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
> > >   	return vb2_dma_contig_plane_dma_addr(vb, 0);
> > >   }
> > > +static inline struct hantro_decoded_buffer *
> > > +vb2_to_hantro_decoded_buf(struct vb2_buffer *buf)
> > > +{
> > > +	return container_of(buf, struct hantro_decoded_buffer, base.vb.vb2_buf);
> > > +}
> > > +
> > >   void hantro_postproc_disable(struct hantro_ctx *ctx);
> > >   void hantro_postproc_enable(struct hantro_ctx *ctx);
> > >   void hantro_postproc_free(struct hantro_ctx *ctx);
> > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > > index 8a2edd67f2c6..800c8879aee0 100644
> > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > @@ -232,7 +232,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
> > >   	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > >   	dst_vq->drv_priv = ctx;
> > >   	dst_vq->ops = &hantro_queue_ops;
> > > -	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> > > +	dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
> > >   	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > >   	dst_vq->lock = &ctx->dev->vpu_mutex;
> > >   	dst_vq->dev = ctx->dev->v4l2_dev.dev;
> > > @@ -266,6 +266,12 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
> > >   		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
> > >   			/* No scaling support */
> > >   			return -EINVAL;
> > > +	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
> > > +		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
> > > +
> > > +		/* We only support profile 0 */
> > > +		if (dec_params->profile != 0)
> > > +			return -EINVAL;
> > >   	}
> > >   	return 0;
> > >   }
> > > @@ -459,6 +465,16 @@ static const struct hantro_ctrl controls[] = {
> > >   			.step = 1,
> > >   			.ops = &hantro_hevc_ctrl_ops,
> > >   		},
> > > +	}, {
> > > +		.codec = HANTRO_VP9_DECODER,
> > > +		.cfg = {
> > > +			.id = V4L2_CID_STATELESS_VP9_FRAME,
> > > +		},
> > > +	}, {
> > > +		.codec = HANTRO_VP9_DECODER,
> > > +		.cfg = {
> > > +			.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
> > > +		},
> > >   	},
> > >   };
> > > diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> > > index 0ac0ba375e80..21ca21648614 100644
> > > --- a/drivers/staging/media/hantro/hantro_g2_regs.h
> > > +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> > > @@ -28,6 +28,7 @@
> > >   #define G2_REG_INTERRUPT_DEC_E		BIT(0)
> > >   #define HEVC_DEC_MODE			0xc
> > > +#define VP9_DEC_MODE			0xd
> > >   #define BUS_WIDTH_32			0
> > >   #define BUS_WIDTH_64			1
> > > @@ -49,6 +50,7 @@
> > >   #define g2_pic_height_in_cbs	G2_DEC_REG(4, 6,  0x1fff)
> > >   #define g2_num_ref_frames	G2_DEC_REG(4, 0,  0x1f)
> > > +#define g2_start_bit		G2_DEC_REG(5, 25, 0x7f)
> > >   #define g2_scaling_list_e	G2_DEC_REG(5, 24, 0x1)
> > >   #define g2_cb_qp_offset		G2_DEC_REG(5, 19, 0x1f)
> > >   #define g2_cr_qp_offset		G2_DEC_REG(5, 14, 0x1f)
> > > @@ -84,6 +86,7 @@
> > >   #define g2_bit_depth_y_minus8	G2_DEC_REG(8, 6,  0x3)
> > >   #define g2_bit_depth_c_minus8	G2_DEC_REG(8, 4,  0x3)
> > >   #define g2_output_8_bits	G2_DEC_REG(8, 3,  0x1)
> > > +#define g2_output_format	G2_DEC_REG(8, 0,  0x7)
> > >   #define g2_refidx1_active	G2_DEC_REG(9, 19, 0x1f)
> > >   #define g2_refidx0_active	G2_DEC_REG(9, 14, 0x1f)
> > > @@ -96,6 +99,14 @@
> > >   #define g2_tile_e		G2_DEC_REG(10, 1,  0x1)
> > >   #define g2_entropy_sync_e	G2_DEC_REG(10, 0,  0x1)
> > > +#define vp9_transform_mode	G2_DEC_REG(11, 27, 0x7)
> > > +#define vp9_filt_sharpness	G2_DEC_REG(11, 21, 0x7)
> > > +#define vp9_mcomp_filt_type	G2_DEC_REG(11,  8, 0x7)
> > > +#define vp9_high_prec_mv_e	G2_DEC_REG(11,  7, 0x1)
> > > +#define vp9_comp_pred_mode	G2_DEC_REG(11,  4, 0x3)
> > > +#define vp9_gref_sign_bias	G2_DEC_REG(11,  2, 0x1)
> > > +#define vp9_aref_sign_bias	G2_DEC_REG(11,  0, 0x1)
> > > +
> > >   #define g2_refer_lterm_e	G2_DEC_REG(12, 16, 0xffff)
> > >   #define g2_min_cb_size		G2_DEC_REG(12, 13, 0x7)
> > >   #define g2_max_cb_size		G2_DEC_REG(12, 10, 0x7)
> > > @@ -154,6 +165,50 @@
> > >   #define g2_partial_ctb_y	G2_DEC_REG(20, 30, 0x1)
> > >   #define g2_pic_width_4x4	G2_DEC_REG(20, 16, 0xfff)
> > >   #define g2_pic_height_4x4	G2_DEC_REG(20, 0,  0xfff)
> > > +
> > > +#define vp9_qp_delta_y_dc	G2_DEC_REG(13, 23, 0x3f)
> > > +#define vp9_qp_delta_ch_dc	G2_DEC_REG(13, 17, 0x3f)
> > > +#define vp9_qp_delta_ch_ac	G2_DEC_REG(13, 11, 0x3f)
> > > +#define vp9_last_sign_bias	G2_DEC_REG(13, 10, 0x1)
> > > +#define vp9_lossless_e		G2_DEC_REG(13,  9, 0x1)
> > > +#define vp9_comp_pred_var_ref1	G2_DEC_REG(13,  7, 0x3)
> > > +#define vp9_comp_pred_var_ref0	G2_DEC_REG(13,  5, 0x3)
> > > +#define vp9_comp_pred_fixed_ref	G2_DEC_REG(13,  3, 0x3)
> > > +#define vp9_segment_temp_upd_e	G2_DEC_REG(13,  2, 0x1)
> > > +#define vp9_segment_upd_e	G2_DEC_REG(13,  1, 0x1)
> > > +#define vp9_segment_e		G2_DEC_REG(13,  0, 0x1)
> > > +
> > > +#define vp9_filt_level		G2_DEC_REG(14, 18, 0x3f)
> > > +#define vp9_refpic_seg0		G2_DEC_REG(14, 15, 0x7)
> > > +#define vp9_skip_seg0		G2_DEC_REG(14, 14, 0x1)
> > > +#define vp9_filt_level_seg0	G2_DEC_REG(14,  8, 0x3f)
> > > +#define vp9_quant_seg0		G2_DEC_REG(14,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg1		G2_DEC_REG(15, 15, 0x7)
> > > +#define vp9_skip_seg1		G2_DEC_REG(15, 14, 0x1)
> > > +#define vp9_filt_level_seg1	G2_DEC_REG(15,  8, 0x3f)
> > > +#define vp9_quant_seg1		G2_DEC_REG(15,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg2		G2_DEC_REG(16, 15, 0x7)
> > > +#define vp9_skip_seg2		G2_DEC_REG(16, 14, 0x1)
> > > +#define vp9_filt_level_seg2	G2_DEC_REG(16,  8, 0x3f)
> > > +#define vp9_quant_seg2		G2_DEC_REG(16,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg3		G2_DEC_REG(17, 15, 0x7)
> > > +#define vp9_skip_seg3		G2_DEC_REG(17, 14, 0x1)
> > > +#define vp9_filt_level_seg3	G2_DEC_REG(17,  8, 0x3f)
> > > +#define vp9_quant_seg3		G2_DEC_REG(17,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg4		G2_DEC_REG(18, 15, 0x7)
> > > +#define vp9_skip_seg4		G2_DEC_REG(18, 14, 0x1)
> > > +#define vp9_filt_level_seg4	G2_DEC_REG(18,  8, 0x3f)
> > > +#define vp9_quant_seg4		G2_DEC_REG(18,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg5		G2_DEC_REG(19, 15, 0x7)
> > > +#define vp9_skip_seg5		G2_DEC_REG(19, 14, 0x1)
> > > +#define vp9_filt_level_seg5	G2_DEC_REG(19,  8, 0x3f)
> > > +#define vp9_quant_seg5		G2_DEC_REG(19,  0, 0xff)
> > > +
> > >   #define hevc_cur_poc_00		G2_DEC_REG(46, 24, 0xff)
> > >   #define hevc_cur_poc_01		G2_DEC_REG(46, 16, 0xff)
> > >   #define hevc_cur_poc_02		G2_DEC_REG(46, 8,  0xff)
> > > @@ -174,6 +229,44 @@
> > >   #define hevc_cur_poc_14		G2_DEC_REG(49, 8,  0xff)
> > >   #define hevc_cur_poc_15		G2_DEC_REG(49, 0,  0xff)
> > > +#define vp9_refpic_seg6		G2_DEC_REG(31, 15, 0x7)
> > > +#define vp9_skip_seg6		G2_DEC_REG(31, 14, 0x1)
> > > +#define vp9_filt_level_seg6	G2_DEC_REG(31,  8, 0x3f)
> > > +#define vp9_quant_seg6		G2_DEC_REG(31,  0, 0xff)
> > > +
> > > +#define vp9_refpic_seg7		G2_DEC_REG(32, 15, 0x7)
> > > +#define vp9_skip_seg7		G2_DEC_REG(32, 14, 0x1)
> > > +#define vp9_filt_level_seg7	G2_DEC_REG(32,  8, 0x3f)
> > > +#define vp9_quant_seg7		G2_DEC_REG(32,  0, 0xff)
> > > +
> > > +#define vp9_lref_width		G2_DEC_REG(33, 16, 0xffff)
> > > +#define vp9_lref_height		G2_DEC_REG(33,  0, 0xffff)
> > > +
> > > +#define vp9_gref_width		G2_DEC_REG(34, 16, 0xffff)
> > > +#define vp9_gref_height		G2_DEC_REG(34,  0, 0xffff)
> > > +
> > > +#define vp9_aref_width		G2_DEC_REG(35, 16, 0xffff)
> > > +#define vp9_aref_height		G2_DEC_REG(35,  0, 0xffff)
> > > +
> > > +#define vp9_lref_hor_scale	G2_DEC_REG(36, 16, 0xffff)
> > > +#define vp9_lref_ver_scale	G2_DEC_REG(36,  0, 0xffff)
> > > +
> > > +#define vp9_gref_hor_scale	G2_DEC_REG(37, 16, 0xffff)
> > > +#define vp9_gref_ver_scale	G2_DEC_REG(37,  0, 0xffff)
> > > +
> > > +#define vp9_aref_hor_scale	G2_DEC_REG(38, 16, 0xffff)
> > > +#define vp9_aref_ver_scale	G2_DEC_REG(38,  0, 0xffff)
> > > +
> > > +#define vp9_filt_ref_adj_0	G2_DEC_REG(46, 24, 0x7f)
> > > +#define vp9_filt_ref_adj_1	G2_DEC_REG(46, 16, 0x7f)
> > > +#define vp9_filt_ref_adj_2	G2_DEC_REG(46,  8, 0x7f)
> > > +#define vp9_filt_ref_adj_3	G2_DEC_REG(46,  0, 0x7f)
> > > +
> > > +#define vp9_filt_mb_adj_0	G2_DEC_REG(47, 24, 0x7f)
> > > +#define vp9_filt_mb_adj_1	G2_DEC_REG(47, 16, 0x7f)
> > > +#define vp9_filt_mb_adj_2	G2_DEC_REG(47,  8, 0x7f)
> > > +#define vp9_filt_mb_adj_3	G2_DEC_REG(47,  0, 0x7f)
> > > +
> > >   #define g2_apf_threshold	G2_DEC_REG(55, 0, 0xffff)
> > >   #define g2_clk_gate_e		G2_DEC_REG(58, 16, 0x1)
> > > @@ -186,6 +279,8 @@
> > >   #define G2_ADDR_DST		(G2_SWREG(65))
> > >   #define G2_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
> > > +#define VP9_ADDR_SEGMENT_WRITE	(G2_SWREG(79))
> > > +#define VP9_ADDR_SEGMENT_READ	(G2_SWREG(81))
> > >   #define G2_ADDR_DST_CHR		(G2_SWREG(99))
> > >   #define G2_REG_CHR_REF(i)	(G2_SWREG(101) + ((i) * 0x8))
> > >   #define G2_ADDR_DST_MV		(G2_SWREG(133))
> > > @@ -193,6 +288,8 @@
> > >   #define G2_ADDR_TILE_SIZE	(G2_SWREG(167))
> > 
> > I think this name can be improved. We don't say "G2 address tile size", but "G2
> > tile size address". Also, there is multiple tile sizes, so I'd prefer if we say
> > "G2 tile sizes address". May I suggest this naming then ?
> > 
> >    #define G2_TILE_SIZES_ADDR_LSB ...
> > 
> > As a reference, VSI names this sw_tile_base_lsb . That denotes that the name
> > also fails to capture that this is only the lower 32bit of the tile_sizes
> > address and that if someone have a G2 core on a larger amount of RAM it will
> > need to figure where is the second half (spoiler, it looks like it's
> > G1_SWREG(166) ). Anyway, that's why I'm proposing dropping LSB in there. Not
> > sure between LSB_ADDR or ADDR_LSB.
> 
> The LSB/MSB point is indeed valid. I think I will change hantro_write_addr() to
> something on the lines of:
> 
> static inline void hantro_write_addr(struct hantro_dev *vpu,
> 				     unsigned long offset,
> 				     dma_addr_t addr)
> {
> 	vdpu_write(vpu, addr & 0xffffffff, offset);
> #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 	vdpu_write(vpu, (addr >> 32) & 0xffffffff, offset + 4);
> #endif
> }
> 
> Then the #defines will not need the _LSB/_MSB suffixes at all
> (and will remain as they are) and the modified function will
> still do the right thing.
> 

I'd rather not go in this direction. First of all, ifdefs are something
to avoid, and only use if really needed. I know there are other drivers
doing this, but that doesn't mean it's nice.

And then I'm not sure if this is even correct. The MSB bits are needed
if the device is sitting on a bus that can do 64-bits DMA.
That _may_ be something you can figure out per architecture,
but doesn't have to be like that.

For instance, the Hantro device could be sitting on PCI (Adding
Robert in Cc who can comment on this).

For now, I don't think we care given we are setting
the DMA mask to 32-bits (see hantro_probe). So we won't get
64-bit addresses. I'd really like to see 64-bit support
via the LSB/MSB registers, but I think it's not something
we should cover on this VP9 patchset.

One more thing: is it correct to assume that the MSB register
is always right after the LSB register? Is that the case
for all buffers and Hantro-like variants?

Thanks,
Ezequiel
