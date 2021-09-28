Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D54441B319
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 17:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241684AbhI1Pku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 11:40:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39588 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241679AbhI1Pkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 11:40:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id B862B1F42139
Subject: Re: [PATCH v6 09/10] media: hantro: Support VP9 on the G2 core
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
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
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
References: <20210927151958.24426-1-andrzej.p@collabora.com>
 <20210927151958.24426-10-andrzej.p@collabora.com>
 <e298b3b1204f56dd91cc5b8493810e16267bbb91.camel@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <532bfb30-c464-137e-1635-b6a868d5d7e6@collabora.com>
Date:   Tue, 28 Sep 2021 17:39:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e298b3b1204f56dd91cc5b8493810e16267bbb91.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

W dniu 27.09.2021 o 21:17, Nicolas Dufresne pisze:
> Le lundi 27 septembre 2021 à 17:19 +0200, Andrzej Pietrasiewicz a écrit :
>> VeriSilicon Hantro G2 core supports VP9 codec.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/staging/media/hantro/Kconfig          |   1 +
>>   drivers/staging/media/hantro/Makefile         |   6 +-
>>   drivers/staging/media/hantro/hantro.h         |  26 +
>>   drivers/staging/media/hantro/hantro_drv.c     |  18 +-
>>   drivers/staging/media/hantro/hantro_g2_regs.h |  97 ++
>>   .../staging/media/hantro/hantro_g2_vp9_dec.c  | 978 ++++++++++++++++++
>>   drivers/staging/media/hantro/hantro_hw.h      |  67 ++
>>   drivers/staging/media/hantro/hantro_v4l2.c    |   6 +
>>   drivers/staging/media/hantro/hantro_vp9.c     | 240 +++++
>>   drivers/staging/media/hantro/hantro_vp9.h     | 103 ++
>>   drivers/staging/media/hantro/imx8m_vpu_hw.c   |  22 +-
>>   11 files changed, 1560 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>>   create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
>>   create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
>>
>> diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
>> index 20b1f6d7b69c..00a57d88c92e 100644
>> --- a/drivers/staging/media/hantro/Kconfig
>> +++ b/drivers/staging/media/hantro/Kconfig
>> @@ -9,6 +9,7 @@ config VIDEO_HANTRO
>>   	select VIDEOBUF2_VMALLOC
>>   	select V4L2_MEM2MEM_DEV
>>   	select V4L2_H264
>> +	select V4L2_VP9
>>   	help
>>   	  Support for the Hantro IP based Video Processing Units present on
>>   	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
>> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
>> index fe6d84871d07..28af0a1ee4bf 100644
>> --- a/drivers/staging/media/hantro/Makefile
>> +++ b/drivers/staging/media/hantro/Makefile
>> @@ -10,9 +10,10 @@ hantro-vpu-y += \
>>   		hantro_g1.o \
>>   		hantro_g1_h264_dec.o \
>>   		hantro_g1_mpeg2_dec.o \
>> -		hantro_g2_hevc_dec.o \
>>   		hantro_g1_vp8_dec.o \
>>   		hantro_g2.o \
>> +		hantro_g2_hevc_dec.o \
>> +		hantro_g2_vp9_dec.o \
>>   		rockchip_vpu2_hw_jpeg_enc.o \
>>   		rockchip_vpu2_hw_h264_dec.o \
>>   		rockchip_vpu2_hw_mpeg2_dec.o \
>> @@ -21,7 +22,8 @@ hantro-vpu-y += \
>>   		hantro_h264.o \
>>   		hantro_hevc.o \
>>   		hantro_mpeg2.o \
>> -		hantro_vp8.o
>> +		hantro_vp8.o \
>> +		hantro_vp9.o
>>   
>>   hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
>>   		imx8m_vpu_hw.o
>> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
>> index d91eb2b1c509..1e8c1a6e3eb0 100644
>> --- a/drivers/staging/media/hantro/hantro.h
>> +++ b/drivers/staging/media/hantro/hantro.h
>> @@ -36,6 +36,7 @@ struct hantro_postproc_ops;
>>   #define HANTRO_VP8_DECODER	BIT(17)
>>   #define HANTRO_H264_DECODER	BIT(18)
>>   #define HANTRO_HEVC_DECODER	BIT(19)
>> +#define HANTRO_VP9_DECODER	BIT(20)
>>   #define HANTRO_DECODERS		0xffff0000
>>   
>>   /**
>> @@ -110,6 +111,7 @@ enum hantro_codec_mode {
>>   	HANTRO_MODE_MPEG2_DEC,
>>   	HANTRO_MODE_VP8_DEC,
>>   	HANTRO_MODE_HEVC_DEC,
>> +	HANTRO_MODE_VP9_DEC,
>>   };
>>   
>>   /*
>> @@ -223,6 +225,7 @@ struct hantro_dev {
>>    * @mpeg2_dec:		MPEG-2-decoding context.
>>    * @vp8_dec:		VP8-decoding context.
>>    * @hevc_dec:		HEVC-decoding context.
>> + * @vp9_dec:		VP9-decoding context.
>>    */
>>   struct hantro_ctx {
>>   	struct hantro_dev *dev;
>> @@ -250,6 +253,7 @@ struct hantro_ctx {
>>   		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
>>   		struct hantro_vp8_dec_hw_ctx vp8_dec;
>>   		struct hantro_hevc_dec_hw_ctx hevc_dec;
>> +		struct hantro_vp9_dec_hw_ctx vp9_dec;
>>   	};
>>   };
>>   
>> @@ -299,6 +303,22 @@ struct hantro_postproc_regs {
>>   	struct hantro_reg display_width;
>>   };
>>   
>> +struct hantro_vp9_decoded_buffer_info {
>> +	/* Info needed when the decoded frame serves as a reference frame. */
>> +	unsigned short width;
>> +	unsigned short height;
>> +	u32 bit_depth : 4;
>> +};
>> +
>> +struct hantro_decoded_buffer {
>> +	/* Must be the first field in this struct. */
>> +	struct v4l2_m2m_buffer base;
>> +
>> +	union {
>> +		struct hantro_vp9_decoded_buffer_info vp9;
>> +	};
>> +};
>> +
>>   /* Logging helpers */
>>   
>>   /**
>> @@ -436,6 +456,12 @@ hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
>>   	return vb2_dma_contig_plane_dma_addr(vb, 0);
>>   }
>>   
>> +static inline struct hantro_decoded_buffer *
>> +vb2_to_hantro_decoded_buf(struct vb2_buffer *buf)
>> +{
>> +	return container_of(buf, struct hantro_decoded_buffer, base.vb.vb2_buf);
>> +}
>> +
>>   void hantro_postproc_disable(struct hantro_ctx *ctx);
>>   void hantro_postproc_enable(struct hantro_ctx *ctx);
>>   void hantro_postproc_free(struct hantro_ctx *ctx);
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index 8a2edd67f2c6..800c8879aee0 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -232,7 +232,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>>   	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>   	dst_vq->drv_priv = ctx;
>>   	dst_vq->ops = &hantro_queue_ops;
>> -	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
>>   	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>   	dst_vq->lock = &ctx->dev->vpu_mutex;
>>   	dst_vq->dev = ctx->dev->v4l2_dev.dev;
>> @@ -266,6 +266,12 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>>   		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
>>   			/* No scaling support */
>>   			return -EINVAL;
>> +	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
>> +		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
>> +
>> +		/* We only support profile 0 */
>> +		if (dec_params->profile != 0)
>> +			return -EINVAL;
>>   	}
>>   	return 0;
>>   }
>> @@ -459,6 +465,16 @@ static const struct hantro_ctrl controls[] = {
>>   			.step = 1,
>>   			.ops = &hantro_hevc_ctrl_ops,
>>   		},
>> +	}, {
>> +		.codec = HANTRO_VP9_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_VP9_FRAME,
>> +		},
>> +	}, {
>> +		.codec = HANTRO_VP9_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
>> +		},
>>   	},
>>   };
>>   
>> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
>> index 0ac0ba375e80..21ca21648614 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_regs.h
>> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
>> @@ -28,6 +28,7 @@
>>   #define G2_REG_INTERRUPT_DEC_E		BIT(0)
>>   
>>   #define HEVC_DEC_MODE			0xc
>> +#define VP9_DEC_MODE			0xd
>>   
>>   #define BUS_WIDTH_32			0
>>   #define BUS_WIDTH_64			1
>> @@ -49,6 +50,7 @@
>>   #define g2_pic_height_in_cbs	G2_DEC_REG(4, 6,  0x1fff)
>>   #define g2_num_ref_frames	G2_DEC_REG(4, 0,  0x1f)
>>   
>> +#define g2_start_bit		G2_DEC_REG(5, 25, 0x7f)
>>   #define g2_scaling_list_e	G2_DEC_REG(5, 24, 0x1)
>>   #define g2_cb_qp_offset		G2_DEC_REG(5, 19, 0x1f)
>>   #define g2_cr_qp_offset		G2_DEC_REG(5, 14, 0x1f)
>> @@ -84,6 +86,7 @@
>>   #define g2_bit_depth_y_minus8	G2_DEC_REG(8, 6,  0x3)
>>   #define g2_bit_depth_c_minus8	G2_DEC_REG(8, 4,  0x3)
>>   #define g2_output_8_bits	G2_DEC_REG(8, 3,  0x1)
>> +#define g2_output_format	G2_DEC_REG(8, 0,  0x7)
>>   
>>   #define g2_refidx1_active	G2_DEC_REG(9, 19, 0x1f)
>>   #define g2_refidx0_active	G2_DEC_REG(9, 14, 0x1f)
>> @@ -96,6 +99,14 @@
>>   #define g2_tile_e		G2_DEC_REG(10, 1,  0x1)
>>   #define g2_entropy_sync_e	G2_DEC_REG(10, 0,  0x1)
>>   
>> +#define vp9_transform_mode	G2_DEC_REG(11, 27, 0x7)
>> +#define vp9_filt_sharpness	G2_DEC_REG(11, 21, 0x7)
>> +#define vp9_mcomp_filt_type	G2_DEC_REG(11,  8, 0x7)
>> +#define vp9_high_prec_mv_e	G2_DEC_REG(11,  7, 0x1)
>> +#define vp9_comp_pred_mode	G2_DEC_REG(11,  4, 0x3)
>> +#define vp9_gref_sign_bias	G2_DEC_REG(11,  2, 0x1)
>> +#define vp9_aref_sign_bias	G2_DEC_REG(11,  0, 0x1)
>> +
>>   #define g2_refer_lterm_e	G2_DEC_REG(12, 16, 0xffff)
>>   #define g2_min_cb_size		G2_DEC_REG(12, 13, 0x7)
>>   #define g2_max_cb_size		G2_DEC_REG(12, 10, 0x7)
>> @@ -154,6 +165,50 @@
>>   #define g2_partial_ctb_y	G2_DEC_REG(20, 30, 0x1)
>>   #define g2_pic_width_4x4	G2_DEC_REG(20, 16, 0xfff)
>>   #define g2_pic_height_4x4	G2_DEC_REG(20, 0,  0xfff)
>> +
>> +#define vp9_qp_delta_y_dc	G2_DEC_REG(13, 23, 0x3f)
>> +#define vp9_qp_delta_ch_dc	G2_DEC_REG(13, 17, 0x3f)
>> +#define vp9_qp_delta_ch_ac	G2_DEC_REG(13, 11, 0x3f)
>> +#define vp9_last_sign_bias	G2_DEC_REG(13, 10, 0x1)
>> +#define vp9_lossless_e		G2_DEC_REG(13,  9, 0x1)
>> +#define vp9_comp_pred_var_ref1	G2_DEC_REG(13,  7, 0x3)
>> +#define vp9_comp_pred_var_ref0	G2_DEC_REG(13,  5, 0x3)
>> +#define vp9_comp_pred_fixed_ref	G2_DEC_REG(13,  3, 0x3)
>> +#define vp9_segment_temp_upd_e	G2_DEC_REG(13,  2, 0x1)
>> +#define vp9_segment_upd_e	G2_DEC_REG(13,  1, 0x1)
>> +#define vp9_segment_e		G2_DEC_REG(13,  0, 0x1)
>> +
>> +#define vp9_filt_level		G2_DEC_REG(14, 18, 0x3f)
>> +#define vp9_refpic_seg0		G2_DEC_REG(14, 15, 0x7)
>> +#define vp9_skip_seg0		G2_DEC_REG(14, 14, 0x1)
>> +#define vp9_filt_level_seg0	G2_DEC_REG(14,  8, 0x3f)
>> +#define vp9_quant_seg0		G2_DEC_REG(14,  0, 0xff)
>> +
>> +#define vp9_refpic_seg1		G2_DEC_REG(15, 15, 0x7)
>> +#define vp9_skip_seg1		G2_DEC_REG(15, 14, 0x1)
>> +#define vp9_filt_level_seg1	G2_DEC_REG(15,  8, 0x3f)
>> +#define vp9_quant_seg1		G2_DEC_REG(15,  0, 0xff)
>> +
>> +#define vp9_refpic_seg2		G2_DEC_REG(16, 15, 0x7)
>> +#define vp9_skip_seg2		G2_DEC_REG(16, 14, 0x1)
>> +#define vp9_filt_level_seg2	G2_DEC_REG(16,  8, 0x3f)
>> +#define vp9_quant_seg2		G2_DEC_REG(16,  0, 0xff)
>> +
>> +#define vp9_refpic_seg3		G2_DEC_REG(17, 15, 0x7)
>> +#define vp9_skip_seg3		G2_DEC_REG(17, 14, 0x1)
>> +#define vp9_filt_level_seg3	G2_DEC_REG(17,  8, 0x3f)
>> +#define vp9_quant_seg3		G2_DEC_REG(17,  0, 0xff)
>> +
>> +#define vp9_refpic_seg4		G2_DEC_REG(18, 15, 0x7)
>> +#define vp9_skip_seg4		G2_DEC_REG(18, 14, 0x1)
>> +#define vp9_filt_level_seg4	G2_DEC_REG(18,  8, 0x3f)
>> +#define vp9_quant_seg4		G2_DEC_REG(18,  0, 0xff)
>> +
>> +#define vp9_refpic_seg5		G2_DEC_REG(19, 15, 0x7)
>> +#define vp9_skip_seg5		G2_DEC_REG(19, 14, 0x1)
>> +#define vp9_filt_level_seg5	G2_DEC_REG(19,  8, 0x3f)
>> +#define vp9_quant_seg5		G2_DEC_REG(19,  0, 0xff)
>> +
>>   #define hevc_cur_poc_00		G2_DEC_REG(46, 24, 0xff)
>>   #define hevc_cur_poc_01		G2_DEC_REG(46, 16, 0xff)
>>   #define hevc_cur_poc_02		G2_DEC_REG(46, 8,  0xff)
>> @@ -174,6 +229,44 @@
>>   #define hevc_cur_poc_14		G2_DEC_REG(49, 8,  0xff)
>>   #define hevc_cur_poc_15		G2_DEC_REG(49, 0,  0xff)
>>   
>> +#define vp9_refpic_seg6		G2_DEC_REG(31, 15, 0x7)
>> +#define vp9_skip_seg6		G2_DEC_REG(31, 14, 0x1)
>> +#define vp9_filt_level_seg6	G2_DEC_REG(31,  8, 0x3f)
>> +#define vp9_quant_seg6		G2_DEC_REG(31,  0, 0xff)
>> +
>> +#define vp9_refpic_seg7		G2_DEC_REG(32, 15, 0x7)
>> +#define vp9_skip_seg7		G2_DEC_REG(32, 14, 0x1)
>> +#define vp9_filt_level_seg7	G2_DEC_REG(32,  8, 0x3f)
>> +#define vp9_quant_seg7		G2_DEC_REG(32,  0, 0xff)
>> +
>> +#define vp9_lref_width		G2_DEC_REG(33, 16, 0xffff)
>> +#define vp9_lref_height		G2_DEC_REG(33,  0, 0xffff)
>> +
>> +#define vp9_gref_width		G2_DEC_REG(34, 16, 0xffff)
>> +#define vp9_gref_height		G2_DEC_REG(34,  0, 0xffff)
>> +
>> +#define vp9_aref_width		G2_DEC_REG(35, 16, 0xffff)
>> +#define vp9_aref_height		G2_DEC_REG(35,  0, 0xffff)
>> +
>> +#define vp9_lref_hor_scale	G2_DEC_REG(36, 16, 0xffff)
>> +#define vp9_lref_ver_scale	G2_DEC_REG(36,  0, 0xffff)
>> +
>> +#define vp9_gref_hor_scale	G2_DEC_REG(37, 16, 0xffff)
>> +#define vp9_gref_ver_scale	G2_DEC_REG(37,  0, 0xffff)
>> +
>> +#define vp9_aref_hor_scale	G2_DEC_REG(38, 16, 0xffff)
>> +#define vp9_aref_ver_scale	G2_DEC_REG(38,  0, 0xffff)
>> +
>> +#define vp9_filt_ref_adj_0	G2_DEC_REG(46, 24, 0x7f)
>> +#define vp9_filt_ref_adj_1	G2_DEC_REG(46, 16, 0x7f)
>> +#define vp9_filt_ref_adj_2	G2_DEC_REG(46,  8, 0x7f)
>> +#define vp9_filt_ref_adj_3	G2_DEC_REG(46,  0, 0x7f)
>> +
>> +#define vp9_filt_mb_adj_0	G2_DEC_REG(47, 24, 0x7f)
>> +#define vp9_filt_mb_adj_1	G2_DEC_REG(47, 16, 0x7f)
>> +#define vp9_filt_mb_adj_2	G2_DEC_REG(47,  8, 0x7f)
>> +#define vp9_filt_mb_adj_3	G2_DEC_REG(47,  0, 0x7f)
>> +
>>   #define g2_apf_threshold	G2_DEC_REG(55, 0, 0xffff)
>>   
>>   #define g2_clk_gate_e		G2_DEC_REG(58, 16, 0x1)
>> @@ -186,6 +279,8 @@
>>   
>>   #define G2_ADDR_DST		(G2_SWREG(65))
>>   #define G2_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
>> +#define VP9_ADDR_SEGMENT_WRITE	(G2_SWREG(79))
>> +#define VP9_ADDR_SEGMENT_READ	(G2_SWREG(81))
>>   #define G2_ADDR_DST_CHR		(G2_SWREG(99))
>>   #define G2_REG_CHR_REF(i)	(G2_SWREG(101) + ((i) * 0x8))
>>   #define G2_ADDR_DST_MV		(G2_SWREG(133))
>> @@ -193,6 +288,8 @@
>>   #define G2_ADDR_TILE_SIZE	(G2_SWREG(167))
> 
> I think this name can be improved. We don't say "G2 address tile size", but "G2
> tile size address". Also, there is multiple tile sizes, so I'd prefer if we say
> "G2 tile sizes address". May I suggest this naming then ?
> 
>    #define G2_TILE_SIZES_ADDR_LSB ...
> 
> As a reference, VSI names this sw_tile_base_lsb . That denotes that the name
> also fails to capture that this is only the lower 32bit of the tile_sizes
> address and that if someone have a G2 core on a larger amount of RAM it will
> need to figure where is the second half (spoiler, it looks like it's
> G1_SWREG(166) ). Anyway, that's why I'm proposing dropping LSB in there. Not
> sure between LSB_ADDR or ADDR_LSB.

The LSB/MSB point is indeed valid. I think I will change hantro_write_addr() to
something on the lines of:

static inline void hantro_write_addr(struct hantro_dev *vpu,
				     unsigned long offset,
				     dma_addr_t addr)
{
	vdpu_write(vpu, addr & 0xffffffff, offset);
#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
	vdpu_write(vpu, (addr >> 32) & 0xffffffff, offset + 4);
#endif
}

Then the #defines will not need the _LSB/_MSB suffixes at all
(and will remain as they are) and the modified function will
still do the right thing.

Regards,

Andrzej

> 
>>   #define G2_ADDR_STR		(G2_SWREG(169))
>>   #define HEVC_SCALING_LIST	(G2_SWREG(171))
>> +#define VP9_ADDR_CTR		(G2_SWREG(171))
>> +#define VP9_ADDR_PROBS		(G2_SWREG(173))
>>   #define G2_RASTER_SCAN		(G2_SWREG(175))
>>   #define G2_RASTER_SCAN_CHR	(G2_SWREG(177))
>>   #define G2_TILE_FILTER		(G2_SWREG(179))
> 
> This one is also an address, but does not say so at all. It's also the LSB, the
> MSB is REG 178. VSI describes it as "Base address LSB to store/read filtering
> coeffients of current picture at tile border.". I think some cleanup would be
> nice here. There is likely a lot of other weirdly named registers here and these
> name don't seem to come from reference code.
> 
>> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>> new file mode 100644
>> index 000000000000..f1b207666fa7
>> --- /dev/null
>> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>> @@ -0,0 +1,978 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Hantro VP9 codec driver
>> + *
>> + * Copyright (C) 2021 Collabora Ltd.
>> + */
>> +#include "media/videobuf2-core.h"
>> +#include "media/videobuf2-dma-contig.h"
>> +#include "media/videobuf2-v4l2.h"
>> +#include <linux/kernel.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/v4l2-vp9.h>
>> +
>> +#include "hantro.h"
>> +#include "hantro_vp9.h"
>> +#include "hantro_g2_regs.h"
>> +
>> +#define G2_ALIGN 16
>> +
>> +enum hantro_ref_frames {
>> +	INTRA_FRAME = 0,
>> +	LAST_FRAME = 1,
>> +	GOLDEN_FRAME = 2,
>> +	ALTREF_FRAME = 3,
>> +	MAX_REF_FRAMES = 4
>> +};
>> +
>> +static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame **dec_params)
>> +{
>> +	const struct v4l2_ctrl_vp9_compressed_hdr *prob_updates;
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	struct v4l2_ctrl *ctrl;
>> +	unsigned int fctx_idx;
>> +
>> +	/* v4l2-specific stuff */
>> +	hantro_start_prepare_run(ctx);
>> +
>> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_FRAME);
>> +	if (WARN_ON(!ctrl))
>> +		return -EINVAL;
>> +	*dec_params = ctrl->p_cur.p;
>> +
>> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
>> +	if (WARN_ON(!ctrl))
>> +		return -EINVAL;
>> +	prob_updates = ctrl->p_cur.p;
>> +	vp9_ctx->cur.tx_mode = prob_updates->tx_mode;
>> +
>> +	/*
>> +	 * vp9 stuff
>> +	 *
>> +	 * by this point the userspace has done all parts of 6.2 uncompressed_header()
>> +	 * except this fragment:
>> +	 * if ( FrameIsIntra || error_resilient_mode ) {
>> +	 *	setup_past_independence ( )
>> +	 *	if ( frame_type == KEY_FRAME || error_resilient_mode == 1 ||
>> +	 *	     reset_frame_context == 3 ) {
>> +	 *		for ( i = 0; i < 4; i ++ ) {
>> +	 *			save_probs( i )
>> +	 *		}
>> +	 *	} else if ( reset_frame_context == 2 ) {
>> +	 *		save_probs( frame_context_idx )
>> +	 *	}
>> +	 *	frame_context_idx = 0
>> +	 * }
>> +	 */
>> +	fctx_idx = v4l2_vp9_reset_frame_ctx(*dec_params, vp9_ctx->frame_context);
>> +	vp9_ctx->cur.frame_context_idx = fctx_idx;
>> +
>> +	/* 6.1 frame(sz): load_probs() and load_probs2() */
>> +	vp9_ctx->probability_tables = vp9_ctx->frame_context[fctx_idx];
>> +
>> +	/*
>> +	 * The userspace has also performed 6.3 compressed_header(), but handling the
>> +	 * probs in a special way. All probs which need updating, except MV-related,
>> +	 * have been read from the bitstream and translated through inv_map_table[],
>> +	 * but no 6.3.6 inv_recenter_nonneg(v, m) has been performed. The values passed
>> +	 * by userspace are either translated values (there are no 0 values in
>> +	 * inv_map_table[]), or zero to indicate no update. All MV-related probs which need
>> +	 * updating have been read from the bitstream and (mv_prob << 1) | 1 has been
>> +	 * performed. The values passed by userspace are either new values
>> +	 * to replace old ones (the above mentioned shift and bitwise or never result in
>> +	 * a zero) or zero to indicate no update.
>> +	 * fw_update_probs() performs actual probs updates or leaves probs as-is
>> +	 * for values for which a zero was passed from userspace.
>> +	 */
>> +	v4l2_vp9_fw_update_probs(&vp9_ctx->probability_tables, prob_updates, *dec_params);
>> +
>> +	return 0;
>> +}
>> +
>> +static size_t chroma_offset(const struct hantro_ctx *ctx,
>> +			    const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
>> +
>> +	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
>> +}
>> +
>> +static size_t mv_offset(const struct hantro_ctx *ctx,
>> +			const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	size_t cr_offset = chroma_offset(ctx, dec_params);
>> +
>> +	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
>> +}
>> +
>> +static struct hantro_decoded_buffer *
>> +get_ref_buf(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
>> +{
>> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>> +	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
>> +	int buf_idx;
>> +
>> +	/*
>> +	 * If a ref is unused or invalid, address of current destination
>> +	 * buffer is returned.
>> +	 */
>> +	buf_idx = vb2_find_timestamp(cap_q, timestamp, 0);
>> +	if (buf_idx < 0)
>> +		return vb2_to_hantro_decoded_buf(&dst->vb2_buf);
>> +
>> +	return vb2_to_hantro_decoded_buf(vb2_get_buffer(cap_q, buf_idx));
>> +}
>> +
>> +static void update_dec_buf_info(struct hantro_decoded_buffer *buf,
>> +				const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	buf->vp9.width = dec_params->frame_width_minus_1 + 1;
>> +	buf->vp9.height = dec_params->frame_height_minus_1 + 1;
>> +	buf->vp9.bit_depth = dec_params->bit_depth;
>> +}
>> +
>> +static void update_ctx_cur_info(struct hantro_vp9_dec_hw_ctx *vp9_ctx,
>> +				struct hantro_decoded_buffer *buf,
>> +				const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	vp9_ctx->cur.valid = true;
>> +	vp9_ctx->cur.reference_mode = dec_params->reference_mode;
>> +	vp9_ctx->cur.interpolation_filter = dec_params->interpolation_filter;
>> +	vp9_ctx->cur.flags = dec_params->flags;
>> +	vp9_ctx->cur.timestamp = buf->base.vb.vb2_buf.timestamp;
>> +}
>> +
>> +static void config_output(struct hantro_ctx *ctx,
>> +			  struct hantro_decoded_buffer *dst,
>> +			  const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	dma_addr_t luma_addr, chroma_addr, mv_addr;
>> +
>> +	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
>> +	hantro_reg_write(ctx->dev, &g2_output_format, 0);
>> +
>> +	luma_addr = vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf, 0);
>> +	hantro_write_addr(ctx->dev, G2_ADDR_DST, luma_addr);
>> +
>> +	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
>> +	hantro_write_addr(ctx->dev, G2_ADDR_DST_CHR, chroma_addr);
>> +
>> +	mv_addr = luma_addr + mv_offset(ctx, dec_params);
>> +	hantro_write_addr(ctx->dev, G2_ADDR_DST_MV, mv_addr);
>> +}
>> +
>> +struct hantro_vp9_ref_reg {
>> +	const struct hantro_reg width;
>> +	const struct hantro_reg height;
>> +	const struct hantro_reg hor_scale;
>> +	const struct hantro_reg ver_scale;
>> +	u32 y_base;
>> +	u32 c_base;
>> +};
>> +
>> +static void config_ref(struct hantro_ctx *ctx,
>> +		       struct hantro_decoded_buffer *dst,
>> +		       const struct hantro_vp9_ref_reg *ref_reg,
>> +		       const struct v4l2_ctrl_vp9_frame *dec_params,
>> +		       u64 ref_ts)
>> +{
>> +	struct hantro_decoded_buffer *buf;
>> +	dma_addr_t luma_addr, chroma_addr;
>> +	u32 refw, refh;
>> +
>> +	buf = get_ref_buf(ctx, &dst->base.vb, ref_ts);
>> +	refw = buf->vp9.width;
>> +	refh = buf->vp9.height;
>> +
>> +	hantro_reg_write(ctx->dev, &ref_reg->width, refw);
>> +	hantro_reg_write(ctx->dev, &ref_reg->height, refh);
>> +
>> +	hantro_reg_write(ctx->dev, &ref_reg->hor_scale, (refw << 14) / dst->vp9.width);
>> +	hantro_reg_write(ctx->dev, &ref_reg->ver_scale, (refh << 14) / dst->vp9.height);
>> +
>> +	luma_addr = vb2_dma_contig_plane_dma_addr(&buf->base.vb.vb2_buf, 0);
>> +	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
>> +
>> +	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
>> +	hantro_write_addr(ctx->dev, ref_reg->c_base, chroma_addr);
>> +}
>> +
>> +static void config_ref_registers(struct hantro_ctx *ctx,
>> +				 const struct v4l2_ctrl_vp9_frame *dec_params,
>> +				 struct hantro_decoded_buffer *dst,
>> +				 struct hantro_decoded_buffer *mv_ref)
>> +{
>> +	static const struct hantro_vp9_ref_reg ref_regs[] = {
>> +		{
>> +			/* Last */
>> +			.width = vp9_lref_width,
>> +			.height = vp9_lref_height,
>> +			.hor_scale = vp9_lref_hor_scale,
>> +			.ver_scale = vp9_lref_ver_scale,
>> +			.y_base = G2_REG_ADDR_REF(0),
>> +			.c_base = G2_REG_CHR_REF(0),
>> +		}, {
>> +			/* Golden */
>> +			.width = vp9_gref_width,
>> +			.height = vp9_gref_height,
>> +			.hor_scale = vp9_gref_hor_scale,
>> +			.ver_scale = vp9_gref_ver_scale,
>> +			.y_base = G2_REG_ADDR_REF(4),
>> +			.c_base = G2_REG_CHR_REF(4),
>> +		}, {
>> +			/* Altref */
>> +			.width = vp9_aref_width,
>> +			.height = vp9_aref_height,
>> +			.hor_scale = vp9_aref_hor_scale,
>> +			.ver_scale = vp9_aref_ver_scale,
>> +			.y_base = G2_REG_ADDR_REF(5),
>> +			.c_base = G2_REG_CHR_REF(5),
>> +		},
>> +	};
>> +	dma_addr_t mv_addr;
>> +
>> +	config_ref(ctx, dst, &ref_regs[0], dec_params, dec_params->last_frame_ts);
>> +	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params->golden_frame_ts);
>> +	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
>> +
>> +	mv_addr = vb2_dma_contig_plane_dma_addr(&mv_ref->base.vb.vb2_buf, 0) +
>> +		  mv_offset(ctx, dec_params);
>> +	hantro_write_addr(ctx->dev, G2_REG_DMV_REF(0), mv_addr);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,
>> +			 dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_LAST ? 1 : 0);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_gref_sign_bias,
>> +			 dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_GOLDEN ? 1 : 0);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_aref_sign_bias,
>> +			 dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_ALT ? 1 : 0);
>> +}
>> +
>> +static void recompute_tile_info(unsigned short *tile_info, unsigned int tiles, unsigned int sbs)
>> +{
>> +	int i;
>> +	unsigned int accumulated = 0;
>> +	unsigned int next_accumulated;
>> +
>> +	for (i = 1; i <= tiles; ++i) {
>> +		next_accumulated = i * sbs / tiles;
>> +		*tile_info++ = next_accumulated - accumulated;
>> +		accumulated = next_accumulated;
>> +	}
>> +}
>> +
>> +static void
>> +recompute_tile_rc_info(struct hantro_ctx *ctx,
>> +		       unsigned int tile_r, unsigned int tile_c,
>> +		       unsigned int sbs_r, unsigned int sbs_c)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +
>> +	recompute_tile_info(vp9_ctx->tile_r_info, tile_r, sbs_r);
>> +	recompute_tile_info(vp9_ctx->tile_c_info, tile_c, sbs_c);
>> +
>> +	vp9_ctx->last_tile_r = tile_r;
>> +	vp9_ctx->last_tile_c = tile_c;
>> +	vp9_ctx->last_sbs_r = sbs_r;
>> +	vp9_ctx->last_sbs_c = sbs_c;
>> +}
>> +
>> +static inline unsigned int first_tile_row(unsigned int tile_r, unsigned int sbs_r)
>> +{
>> +	if (tile_r == sbs_r + 1)
>> +		return 1;
>> +
>> +	if (tile_r == sbs_r + 2)
>> +		return 2;
>> +
>> +	return 0;
>> +}
>> +
>> +static void
>> +fill_tile_info(struct hantro_ctx *ctx,
>> +	       unsigned int tile_r, unsigned int tile_c,
>> +	       unsigned int sbs_r, unsigned int sbs_c,
>> +	       unsigned short *tile_mem)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	unsigned int i, j;
>> +	bool first = true;
>> +
>> +	for (i = first_tile_row(tile_r, sbs_r); i < tile_r; ++i) {
>> +		unsigned short r_info = vp9_ctx->tile_r_info[i];
>> +
>> +		if (first) {
>> +			if (i > 0)
>> +				r_info += vp9_ctx->tile_r_info[0];
>> +			if (i == 2)
>> +				r_info += vp9_ctx->tile_r_info[1];
>> +			first = false;
>> +		}
>> +		for (j = 0; j < tile_c; ++j) {
>> +			*tile_mem++ = vp9_ctx->tile_c_info[j];
>> +			*tile_mem++ = r_info;
>> +		}
>> +	}
>> +}
>> +
>> +static void
>> +config_tiles(struct hantro_ctx *ctx,
>> +	     const struct v4l2_ctrl_vp9_frame *dec_params,
>> +	     struct hantro_decoded_buffer *dst)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *misc = &vp9_ctx->misc;
>> +	struct hantro_aux_buf *tile_edge = &vp9_ctx->tile_edge;
>> +	dma_addr_t addr;
>> +	unsigned short *tile_mem;
>> +
>> +	addr = misc->dma + vp9_ctx->tile_info_offset;
>> +	hantro_write_addr(ctx->dev, G2_ADDR_TILE_SIZE, addr);
>> +
>> +	tile_mem = misc->cpu + vp9_ctx->tile_info_offset;
>> +	if (dec_params->tile_cols_log2 || dec_params->tile_rows_log2) {
>> +		unsigned int tile_r = (1 << dec_params->tile_rows_log2);
>> +		unsigned int tile_c = (1 << dec_params->tile_cols_log2);
>> +		unsigned int sbs_r = hantro_vp9_num_sbs(dst->vp9.height);
>> +		unsigned int sbs_c = hantro_vp9_num_sbs(dst->vp9.width);
>> +
>> +		if (tile_r != vp9_ctx->last_tile_r || tile_c != vp9_ctx->last_tile_c ||
>> +		    sbs_r != vp9_ctx->last_sbs_r || sbs_c != vp9_ctx->last_sbs_c)
>> +			recompute_tile_rc_info(ctx, tile_r, tile_c, sbs_r, sbs_c);
>> +
>> +		fill_tile_info(ctx, tile_r, tile_c, sbs_r, sbs_c, tile_mem);
>> +
>> +		hantro_reg_write(ctx->dev, &g2_tile_e, 1);
>> +		hantro_reg_write(ctx->dev, &g2_num_tile_cols, tile_c);
>> +		hantro_reg_write(ctx->dev, &g2_num_tile_rows, tile_r);
>> +
>> +		addr = tile_edge->dma;
>> +		hantro_write_addr(ctx->dev, G2_TILE_FILTER, addr);
>> +
>> +		addr = tile_edge->dma + vp9_ctx->bsd_ctrl_offset;
>> +		hantro_write_addr(ctx->dev, G2_TILE_BSD, addr);
>> +	} else {
>> +		tile_mem[0] = hantro_vp9_num_sbs(dst->vp9.width);
>> +		tile_mem[1] = hantro_vp9_num_sbs(dst->vp9.height);
>> +
>> +		hantro_reg_write(ctx->dev, &g2_tile_e, 0);
>> +		hantro_reg_write(ctx->dev, &g2_num_tile_cols, 1);
>> +		hantro_reg_write(ctx->dev, &g2_num_tile_rows, 1);
>> +	}
>> +}
>> +
>> +static void
>> +update_feat_and_flag(struct hantro_vp9_dec_hw_ctx *vp9_ctx,
>> +		     const struct v4l2_vp9_segmentation *seg,
>> +		     unsigned int feature,
>> +		     unsigned int segid)
>> +{
>> +	u8 mask = V4L2_VP9_SEGMENT_FEATURE_ENABLED(feature);
>> +
>> +	vp9_ctx->feature_data[segid][feature] = seg->feature_data[segid][feature];
>> +	vp9_ctx->feature_enabled[segid] &= ~mask;
>> +	vp9_ctx->feature_enabled[segid] |= (seg->feature_enabled[segid] & mask);
>> +}
>> +
>> +static inline s16 clip3(s16 x, s16 y, s16 z)
>> +{
>> +	return (z < x) ? x : (z > y) ? y : z;
>> +}
>> +
>> +static s16 feat_val_clip3(s16 feat_val, s16 feature_data, bool absolute, u8 clip)
>> +{
>> +	if (absolute)
>> +		return feature_data;
>> +
>> +	return clip3(0, 255, feat_val + feature_data);
>> +}
>> +
>> +static void config_segment(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	const struct v4l2_vp9_segmentation *seg;
>> +	s16 feat_val;
>> +	unsigned char feat_id;
>> +	unsigned int segid;
>> +	bool segment_enabled, absolute, update_data;
>> +
>> +	static const struct hantro_reg seg_regs[8][V4L2_VP9_SEG_LVL_MAX] = {
>> +		{ vp9_quant_seg0, vp9_filt_level_seg0, vp9_refpic_seg0, vp9_skip_seg0 },
>> +		{ vp9_quant_seg1, vp9_filt_level_seg1, vp9_refpic_seg1, vp9_skip_seg1 },
>> +		{ vp9_quant_seg2, vp9_filt_level_seg2, vp9_refpic_seg2, vp9_skip_seg2 },
>> +		{ vp9_quant_seg3, vp9_filt_level_seg3, vp9_refpic_seg3, vp9_skip_seg3 },
>> +		{ vp9_quant_seg4, vp9_filt_level_seg4, vp9_refpic_seg4, vp9_skip_seg4 },
>> +		{ vp9_quant_seg5, vp9_filt_level_seg5, vp9_refpic_seg5, vp9_skip_seg5 },
>> +		{ vp9_quant_seg6, vp9_filt_level_seg6, vp9_refpic_seg6, vp9_skip_seg6 },
>> +		{ vp9_quant_seg7, vp9_filt_level_seg7, vp9_refpic_seg7, vp9_skip_seg7 },
>> +	};
>> +
>> +	segment_enabled = !!(dec_params->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED);
>> +	hantro_reg_write(ctx->dev, &vp9_segment_e, segment_enabled);
>> +	hantro_reg_write(ctx->dev, &vp9_segment_upd_e,
>> +			 !!(dec_params->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP));
>> +	hantro_reg_write(ctx->dev, &vp9_segment_temp_upd_e,
>> +			 !!(dec_params->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
>> +
>> +	seg = &dec_params->seg;
>> +	absolute = !!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
>> +	update_data = !!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA);
>> +
>> +	for (segid = 0; segid < 8; ++segid) {
>> +		/* Quantizer segment feature */
>> +		feat_id = V4L2_VP9_SEG_LVL_ALT_Q;
>> +		feat_val = dec_params->quant.base_q_idx;
>> +		if (segment_enabled) {
>> +			if (update_data)
>> +				update_feat_and_flag(vp9_ctx, seg, feat_id, segid);
>> +			if (v4l2_vp9_seg_feat_enabled(vp9_ctx->feature_enabled, feat_id, segid))
>> +				feat_val = feat_val_clip3(feat_val,
>> +							  vp9_ctx->feature_data[segid][feat_id],
>> +							  absolute, 255);
>> +		}
>> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id], feat_val);
>> +
>> +		/* Loop filter segment feature */
>> +		feat_id = V4L2_VP9_SEG_LVL_ALT_L;
>> +		feat_val = dec_params->lf.level;
>> +		if (segment_enabled) {
>> +			if (update_data)
>> +				update_feat_and_flag(vp9_ctx, seg, feat_id, segid);
>> +			if (v4l2_vp9_seg_feat_enabled(vp9_ctx->feature_enabled, feat_id, segid))
>> +				feat_val = feat_val_clip3(feat_val,
>> +							  vp9_ctx->feature_data[segid][feat_id],
>> +							  absolute, 63);
>> +		}
>> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id], feat_val);
>> +
>> +		/* Reference frame segment feature */
>> +		feat_id = V4L2_VP9_SEG_LVL_REF_FRAME;
>> +		feat_val = 0;
>> +		if (segment_enabled) {
>> +			if (update_data)
>> +				update_feat_and_flag(vp9_ctx, seg, feat_id, segid);
>> +			if (!(dec_params->flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
>> +			    v4l2_vp9_seg_feat_enabled(vp9_ctx->feature_enabled, feat_id, segid))
>> +				feat_val = vp9_ctx->feature_data[segid][feat_id] + 1;
>> +		}
>> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id], feat_val);
>> +
>> +		/* Skip segment feature */
>> +		feat_id = V4L2_VP9_SEG_LVL_SKIP;
>> +		feat_val = 0;
>> +		if (segment_enabled) {
>> +			if (update_data)
>> +				update_feat_and_flag(vp9_ctx, seg, feat_id, segid);
>> +			feat_val = v4l2_vp9_seg_feat_enabled(vp9_ctx->feature_enabled,
>> +							     feat_id, segid) ? 1 : 0;
>> +		}
>> +		hantro_reg_write(ctx->dev, &seg_regs[segid][feat_id], feat_val);
>> +	}
>> +}
>> +
>> +static void config_loop_filter(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	bool d = dec_params->lf.flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED;
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_filt_level, dec_params->lf.level);
>> +	hantro_reg_write(ctx->dev, &g2_out_filtering_dis, dec_params->lf.level == 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_sharpness, dec_params->lf.sharpness);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_0, d ? dec_params->lf.ref_deltas[0] : 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_1, d ? dec_params->lf.ref_deltas[1] : 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_2, d ? dec_params->lf.ref_deltas[2] : 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_ref_adj_3, d ? dec_params->lf.ref_deltas[3] : 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_mb_adj_0, d ? dec_params->lf.mode_deltas[0] : 0);
>> +	hantro_reg_write(ctx->dev, &vp9_filt_mb_adj_1, d ? dec_params->lf.mode_deltas[1] : 0);
>> +}
>> +
>> +static void config_picture_dimensions(struct hantro_ctx *ctx, struct hantro_decoded_buffer *dst)
>> +{
>> +	u32 pic_w_4x4, pic_h_4x4;
>> +
>> +	hantro_reg_write(ctx->dev, &g2_pic_width_in_cbs, (dst->vp9.width + 7) / 8);
>> +	hantro_reg_write(ctx->dev, &g2_pic_height_in_cbs, (dst->vp9.height + 7) / 8);
>> +	pic_w_4x4 = roundup(dst->vp9.width, 8) >> 2;
>> +	pic_h_4x4 = roundup(dst->vp9.height, 8) >> 2;
>> +	hantro_reg_write(ctx->dev, &g2_pic_width_4x4, pic_w_4x4);
>> +	hantro_reg_write(ctx->dev, &g2_pic_height_4x4, pic_h_4x4);
>> +}
>> +
>> +static void
>> +config_bit_depth(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	hantro_reg_write(ctx->dev, &g2_bit_depth_y_minus8, dec_params->bit_depth - 8);
>> +	hantro_reg_write(ctx->dev, &g2_bit_depth_c_minus8, dec_params->bit_depth - 8);
>> +}
>> +
>> +static inline bool is_lossless(const struct v4l2_vp9_quantization *quant)
>> +{
>> +	return quant->base_q_idx == 0 && quant->delta_q_uv_ac == 0 &&
>> +	       quant->delta_q_uv_dc == 0 && quant->delta_q_y_dc == 0;
>> +}
>> +
>> +static void
>> +config_quant(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_y_dc, dec_params->quant.delta_q_y_dc);
>> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_ch_dc, dec_params->quant.delta_q_uv_dc);
>> +	hantro_reg_write(ctx->dev, &vp9_qp_delta_ch_ac, dec_params->quant.delta_q_uv_ac);
>> +	hantro_reg_write(ctx->dev, &vp9_lossless_e, is_lossless(&dec_params->quant));
>> +}
>> +
>> +static u32
>> +hantro_interp_filter_from_v4l2(unsigned int interpolation_filter)
>> +{
>> +	switch (interpolation_filter) {
>> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP:
>> +		return 0x1;
>> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH:
>> +		return 0;
>> +	case V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP:
>> +		return 0x2;
>> +	case V4L2_VP9_INTERP_FILTER_BILINEAR:
>> +		return 0x3;
>> +	case V4L2_VP9_INTERP_FILTER_SWITCHABLE:
>> +		return 0x4;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void
>> +config_others(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params,
>> +	      bool intra_only, bool resolution_change)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +
>> +	hantro_reg_write(ctx->dev, &g2_idr_pic_e, intra_only);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_transform_mode, vp9_ctx->cur.tx_mode);
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_mcomp_filt_type, intra_only ?
>> +		0 : hantro_interp_filter_from_v4l2(dec_params->interpolation_filter));
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_high_prec_mv_e,
>> +			 !!(dec_params->flags & V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV));
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_mode, dec_params->reference_mode);
>> +
>> +	hantro_reg_write(ctx->dev, &g2_tempor_mvp_e,
>> +			 !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
>> +			 !(dec_params->flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
>> +			 !(vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
>> +			 !(dec_params->flags & V4L2_VP9_FRAME_FLAG_INTRA_ONLY) &&
>> +			 !resolution_change &&
>> +			 vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_SHOW_FRAME
>> +	);
>> +
>> +	hantro_reg_write(ctx->dev, &g2_write_mvs_e,
>> +			 !(dec_params->flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME));
>> +}
>> +
>> +static void
>> +config_compound_reference(struct hantro_ctx *ctx,
>> +			  const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	u32 comp_fixed_ref, comp_var_ref[2];
>> +	bool last_ref_frame_sign_bias;
>> +	bool golden_ref_frame_sign_bias;
>> +	bool alt_ref_frame_sign_bias;
>> +	bool comp_ref_allowed = 0;
>> +
>> +	comp_fixed_ref = 0;
>> +	comp_var_ref[0] = 0;
>> +	comp_var_ref[1] = 0;
>> +
>> +	last_ref_frame_sign_bias = dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_LAST;
>> +	golden_ref_frame_sign_bias = dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_GOLDEN;
>> +	alt_ref_frame_sign_bias = dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_ALT;
>> +
>> +	/* 6.3.12 Frame reference mode syntax */
>> +	comp_ref_allowed |= golden_ref_frame_sign_bias != last_ref_frame_sign_bias;
>> +	comp_ref_allowed |= alt_ref_frame_sign_bias != last_ref_frame_sign_bias;
>> +
>> +	if (comp_ref_allowed) {
>> +		if (last_ref_frame_sign_bias ==
>> +		    golden_ref_frame_sign_bias) {
>> +			comp_fixed_ref = ALTREF_FRAME;
>> +			comp_var_ref[0] = LAST_FRAME;
>> +			comp_var_ref[1] = GOLDEN_FRAME;
>> +		} else if (last_ref_frame_sign_bias ==
>> +			   alt_ref_frame_sign_bias) {
>> +			comp_fixed_ref = GOLDEN_FRAME;
>> +			comp_var_ref[0] = LAST_FRAME;
>> +			comp_var_ref[1] = ALTREF_FRAME;
>> +		} else {
>> +			comp_fixed_ref = LAST_FRAME;
>> +			comp_var_ref[0] = GOLDEN_FRAME;
>> +			comp_var_ref[1] = ALTREF_FRAME;
>> +		}
>> +	}
>> +
>> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_fixed_ref, comp_fixed_ref);
>> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_var_ref0, comp_var_ref[0]);
>> +	hantro_reg_write(ctx->dev, &vp9_comp_pred_var_ref1, comp_var_ref[1]);
>> +}
>> +
>> +#define INNER_LOOP \
>> +do {									\
>> +	for (m = 0; m < ARRAY_SIZE(adaptive->coef[0][0][0][0]); ++m) {	\
>> +		memcpy(adaptive->coef[i][j][k][l][m],			\
>> +		       probs->coef[i][j][k][l][m],			\
>> +		       sizeof(probs->coef[i][j][k][l][m]));		\
>> +									\
>> +		adaptive->coef[i][j][k][l][m][3] = 0;			\
>> +	}								\
>> +} while (0)
>> +
>> +static void config_probs(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *misc = &vp9_ctx->misc;
>> +	struct hantro_g2_all_probs *all_probs = misc->cpu;
>> +	struct hantro_g2_probs *adaptive;
>> +	struct hantro_g2_mv_probs *mv;
>> +	const struct v4l2_vp9_segmentation *seg = &dec_params->seg;
>> +	const struct v4l2_vp9_frame_context *probs = &vp9_ctx->probability_tables;
>> +	int i, j, k, l, m;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(all_probs->kf_y_mode_prob); ++i)
>> +		for (j = 0; j < ARRAY_SIZE(all_probs->kf_y_mode_prob[0]); ++j) {
>> +			memcpy(all_probs->kf_y_mode_prob[i][j],
>> +			       v4l2_vp9_kf_y_mode_prob[i][j],
>> +			       ARRAY_SIZE(all_probs->kf_y_mode_prob[i][j]));
>> +
>> +			all_probs->kf_y_mode_prob_tail[i][j][0] =
>> +				v4l2_vp9_kf_y_mode_prob[i][j][8];
>> +		}
>> +
>> +	memcpy(all_probs->mb_segment_tree_probs, seg->tree_probs,
>> +	       sizeof(all_probs->mb_segment_tree_probs));
>> +
>> +	memcpy(all_probs->segment_pred_probs, seg->pred_probs,
>> +	       sizeof(all_probs->segment_pred_probs));
>> +
>> +	for (i = 0; i < ARRAY_SIZE(all_probs->kf_uv_mode_prob); ++i) {
>> +		memcpy(all_probs->kf_uv_mode_prob[i], v4l2_vp9_kf_uv_mode_prob[i],
>> +		       ARRAY_SIZE(all_probs->kf_uv_mode_prob[i]));
>> +
>> +		all_probs->kf_uv_mode_prob_tail[i][0] = v4l2_vp9_kf_uv_mode_prob[i][8];
>> +	}
>> +
>> +	adaptive = &all_probs->probs;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->inter_mode); ++i) {
>> +		memcpy(adaptive->inter_mode[i], probs->inter_mode[i],
>> +		       sizeof(probs->inter_mode));
>> +
>> +		adaptive->inter_mode[i][3] = 0;
>> +	}
>> +
>> +	memcpy(adaptive->is_inter, probs->is_inter, sizeof(adaptive->is_inter));
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->uv_mode); ++i) {
>> +		memcpy(adaptive->uv_mode[i], probs->uv_mode[i],
>> +		       sizeof(adaptive->uv_mode[i]));
>> +		adaptive->uv_mode_tail[i][0] = probs->uv_mode[i][8];
>> +	}
>> +
>> +	memcpy(adaptive->tx8, probs->tx8, sizeof(adaptive->tx8));
>> +	memcpy(adaptive->tx16, probs->tx16, sizeof(adaptive->tx16));
>> +	memcpy(adaptive->tx32, probs->tx32, sizeof(adaptive->tx32));
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->y_mode); ++i) {
>> +		memcpy(adaptive->y_mode[i], probs->y_mode[i],
>> +		       ARRAY_SIZE(adaptive->y_mode[i]));
>> +
>> +		adaptive->y_mode_tail[i][0] = probs->y_mode[i][8];
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->partition[0]); ++i) {
>> +		memcpy(adaptive->partition[0][i], v4l2_vp9_kf_partition_probs[i],
>> +		       sizeof(v4l2_vp9_kf_partition_probs[i]));
>> +
>> +		adaptive->partition[0][i][3] = 0;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->partition[1]); ++i) {
>> +		memcpy(adaptive->partition[1][i], probs->partition[i],
>> +		       sizeof(probs->partition[i]));
>> +
>> +		adaptive->partition[1][i][3] = 0;
>> +	}
>> +
>> +	memcpy(adaptive->interp_filter, probs->interp_filter,
>> +	       sizeof(adaptive->interp_filter));
>> +
>> +	memcpy(adaptive->comp_mode, probs->comp_mode, sizeof(adaptive->comp_mode));
>> +
>> +	memcpy(adaptive->skip, probs->skip, sizeof(adaptive->skip));
>> +
>> +	mv = &adaptive->mv;
>> +
>> +	memcpy(mv->joint, probs->mv.joint, sizeof(mv->joint));
>> +	memcpy(mv->sign, probs->mv.sign, sizeof(mv->sign));
>> +	memcpy(mv->class0_bit, probs->mv.class0_bit, sizeof(mv->class0_bit));
>> +	memcpy(mv->fr, probs->mv.fr, sizeof(mv->fr));
>> +	memcpy(mv->class0_hp, probs->mv.class0_hp, sizeof(mv->class0_hp));
>> +	memcpy(mv->hp, probs->mv.hp, sizeof(mv->hp));
>> +	memcpy(mv->classes, probs->mv.classes, sizeof(mv->classes));
>> +	memcpy(mv->class0_fr, probs->mv.class0_fr, sizeof(mv->class0_fr));
>> +	memcpy(mv->bits, probs->mv.bits, sizeof(mv->bits));
>> +
>> +	memcpy(adaptive->single_ref, probs->single_ref, sizeof(adaptive->single_ref));
>> +
>> +	memcpy(adaptive->comp_ref, probs->comp_ref, sizeof(adaptive->comp_ref));
>> +
>> +	for (i = 0; i < ARRAY_SIZE(adaptive->coef); ++i)
>> +		for (j = 0; j < ARRAY_SIZE(adaptive->coef[0]); ++j)
>> +			for (k = 0; k < ARRAY_SIZE(adaptive->coef[0][0]); ++k)
>> +				for (l = 0; l < ARRAY_SIZE(adaptive->coef[0][0][0]); ++l)
>> +					INNER_LOOP;
>> +
>> +	hantro_write_addr(ctx->dev, VP9_ADDR_PROBS, misc->dma);
>> +}
>> +
>> +static void config_counts(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_dec = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *misc = &vp9_dec->misc;
>> +	dma_addr_t addr = misc->dma + vp9_dec->ctx_counters_offset;
>> +
>> +	hantro_write_addr(ctx->dev, VP9_ADDR_CTR, addr);
>> +}
>> +
>> +static void config_seg_map(struct hantro_ctx *ctx,
>> +			   const struct v4l2_ctrl_vp9_frame *dec_params,
>> +			   bool intra_only, bool update_map)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *segment_map = &vp9_ctx->segment_map;
>> +	dma_addr_t addr;
>> +
>> +	if (intra_only ||
>> +	    (dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT)) {
>> +		memset(segment_map->cpu, 0, segment_map->size);
>> +		memset(vp9_ctx->feature_data, 0, sizeof(vp9_ctx->feature_data));
>> +		memset(vp9_ctx->feature_enabled, 0, sizeof(vp9_ctx->feature_enabled));
>> +	}
>> +
>> +	addr = segment_map->dma + vp9_ctx->active_segment * vp9_ctx->segment_map_size;
>> +	hantro_write_addr(ctx->dev, VP9_ADDR_SEGMENT_READ, addr);
>> +
>> +	addr = segment_map->dma + (1 - vp9_ctx->active_segment) * vp9_ctx->segment_map_size;
>> +	hantro_write_addr(ctx->dev, VP9_ADDR_SEGMENT_WRITE, addr);
>> +
>> +	if (update_map)
>> +		vp9_ctx->active_segment = 1 - vp9_ctx->active_segment;
>> +}
>> +
>> +static void
>> +config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params,
>> +	      struct vb2_v4l2_buffer *vb2_src)
>> +{
>> +	dma_addr_t stream_base, tmp_addr;
>> +	unsigned int headres_size;
>> +	u32 src_len, start_bit, src_buf_len;
>> +
>> +	headres_size = dec_params->uncompressed_header_size
>> +		     + dec_params->compressed_header_size;
>> +
>> +	stream_base = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
>> +	hantro_write_addr(ctx->dev, G2_ADDR_STR, stream_base);
>> +
>> +	tmp_addr = stream_base + headres_size;
>> +	start_bit = (tmp_addr & 0xf) * 8;
>> +	hantro_reg_write(ctx->dev, &g2_start_bit, start_bit);
>> +
>> +	src_len = vb2_get_plane_payload(&vb2_src->vb2_buf, 0);
>> +	src_len += start_bit / 8 - headres_size;
>> +	hantro_reg_write(ctx->dev, &g2_stream_len, src_len);
>> +
>> +	tmp_addr &= ~0xf;
>> +	hantro_reg_write(ctx->dev, &g2_strm_start_offset, tmp_addr - stream_base);
>> +	src_buf_len = vb2_plane_size(&vb2_src->vb2_buf, 0);
>> +	hantro_reg_write(ctx->dev, &g2_strm_buffer_len, src_buf_len);
>> +}
>> +
>> +static void
>> +config_registers(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params,
>> +		 struct vb2_v4l2_buffer *vb2_src, struct vb2_v4l2_buffer *vb2_dst)
>> +{
>> +	struct hantro_decoded_buffer *dst, *last, *mv_ref;
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	const struct v4l2_vp9_segmentation *seg;
>> +	bool intra_only, resolution_change;
>> +
>> +	/* vp9 stuff */
>> +	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
>> +
>> +	if (vp9_ctx->last.valid)
>> +		last = get_ref_buf(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
>> +	else
>> +		last = dst;
>> +
>> +	update_dec_buf_info(dst, dec_params);
>> +	update_ctx_cur_info(vp9_ctx, dst, dec_params);
>> +	seg = &dec_params->seg;
>> +
>> +	intra_only = !!(dec_params->flags &
>> +			(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
>> +			V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
>> +
>> +	if (!intra_only &&
>> +	    !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
>> +	    vp9_ctx->last.valid)
>> +		mv_ref = last;
>> +	else
>> +		mv_ref = dst;
>> +
>> +	resolution_change = dst->vp9.width != last->vp9.width ||
>> +			    dst->vp9.height != last->vp9.height;
>> +
>> +	/* configure basic registers */
>> +	hantro_reg_write(ctx->dev, &g2_mode, VP9_DEC_MODE);
>> +	hantro_reg_write(ctx->dev, &g2_strm_swap, 0xf);
>> +	hantro_reg_write(ctx->dev, &g2_dirmv_swap, 0xf);
>> +	hantro_reg_write(ctx->dev, &g2_compress_swap, 0xf);
>> +	hantro_reg_write(ctx->dev, &g2_buswidth, BUS_WIDTH_128);
>> +	hantro_reg_write(ctx->dev, &g2_max_burst, 16);
>> +	hantro_reg_write(ctx->dev, &g2_apf_threshold, 8);
>> +	hantro_reg_write(ctx->dev, &g2_ref_compress_bypass, 1);
>> +	hantro_reg_write(ctx->dev, &g2_clk_gate_e, 1);
>> +	hantro_reg_write(ctx->dev, &g2_max_cb_size, 6);
>> +	hantro_reg_write(ctx->dev, &g2_min_cb_size, 3);
>> +
>> +	config_output(ctx, dst, dec_params);
>> +
>> +	if (!intra_only)
>> +		config_ref_registers(ctx, dec_params, dst, mv_ref);
>> +
>> +	config_tiles(ctx, dec_params, dst);
>> +	config_segment(ctx, dec_params);
>> +	config_loop_filter(ctx, dec_params);
>> +	config_picture_dimensions(ctx, dst);
>> +	config_bit_depth(ctx, dec_params);
>> +	config_quant(ctx, dec_params);
>> +	config_others(ctx, dec_params, intra_only, resolution_change);
>> +	config_compound_reference(ctx, dec_params);
>> +	config_probs(ctx, dec_params);
>> +	config_counts(ctx);
>> +	config_seg_map(ctx, dec_params, intra_only,
>> +		       seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP);
>> +	config_source(ctx, dec_params, vb2_src);
>> +}
>> +
>> +int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
>> +{
>> +	const struct v4l2_ctrl_vp9_frame *decode_params;
>> +	struct vb2_v4l2_buffer *src;
>> +	struct vb2_v4l2_buffer *dst;
>> +	int ret;
>> +
>> +	hantro_g2_check_idle(ctx->dev);
>> +
>> +	ret = start_prepare_run(ctx, &decode_params);
>> +	if (ret) {
>> +		hantro_end_prepare_run(ctx);
>> +		return ret;
>> +	}
>> +
>> +	src = hantro_get_src_buf(ctx);
>> +	dst = hantro_get_dst_buf(ctx);
>> +
>> +	config_registers(ctx, decode_params, src, dst);
>> +
>> +	hantro_end_prepare_run(ctx);
>> +
>> +	vdpu_write(ctx->dev, G2_REG_INTERRUPT_DEC_E, G2_REG_INTERRUPT);
>> +
>> +	return 0;
>> +}
>> +
>> +#define copy_tx_and_skip(p1, p2)				\
>> +do {								\
>> +	memcpy((p1)->tx8, (p2)->tx8, sizeof((p1)->tx8));	\
>> +	memcpy((p1)->tx16, (p2)->tx16, sizeof((p1)->tx16));	\
>> +	memcpy((p1)->tx32, (p2)->tx32, sizeof((p1)->tx32));	\
>> +	memcpy((p1)->skip, (p2)->skip, sizeof((p1)->skip));	\
>> +} while (0)
>> +
>> +void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	unsigned int fctx_idx;
>> +
>> +	if (!(vp9_ctx->cur.flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX))
>> +		goto out_update_last;
>> +
>> +	fctx_idx = vp9_ctx->cur.frame_context_idx;
>> +
>> +	if (!(vp9_ctx->cur.flags & V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE)) {
>> +		/* error_resilient_mode == 0 && frame_parallel_decoding_mode == 0 */
>> +		struct v4l2_vp9_frame_context *probs = &vp9_ctx->probability_tables;
>> +		bool frame_is_intra = vp9_ctx->cur.flags &
>> +		    (V4L2_VP9_FRAME_FLAG_KEY_FRAME | V4L2_VP9_FRAME_FLAG_INTRA_ONLY);
>> +		struct tx_and_skip {
>> +			u8 tx8[2][1];
>> +			u8 tx16[2][2];
>> +			u8 tx32[2][3];
>> +			u8 skip[3];
>> +		} _tx_skip, *tx_skip = &_tx_skip;
>> +		struct v4l2_vp9_frame_symbol_counts *counts;
>> +		struct symbol_counts *hantro_cnts;
>> +		u32 tx16p[2][4];
>> +		int i;
>> +
>> +		/* buffer the forward-updated TX and skip probs */
>> +		if (frame_is_intra)
>> +			copy_tx_and_skip(tx_skip, probs);
>> +
>> +		/* 6.1.2 refresh_probs(): load_probs() and load_probs2() */
>> +		*probs = vp9_ctx->frame_context[fctx_idx];
>> +
>> +		/* if FrameIsIntra then undo the effect of load_probs2() */
>> +		if (frame_is_intra)
>> +			copy_tx_and_skip(probs, tx_skip);
>> +
>> +		counts = &vp9_ctx->cnts;
>> +		hantro_cnts = vp9_ctx->misc.cpu + vp9_ctx->ctx_counters_offset;
>> +		for (i = 0; i < ARRAY_SIZE(tx16p); ++i) {
>> +			memcpy(tx16p[i],
>> +			       hantro_cnts->tx16x16_count[i],
>> +			       sizeof(hantro_cnts->tx16x16_count[0]));
>> +			tx16p[i][3] = 0;
>> +		}
>> +		counts->tx16p = &tx16p;
>> +
>> +		v4l2_vp9_adapt_coef_probs(probs, counts,
>> +					  !vp9_ctx->last.valid ||
>> +					  vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME,
>> +					  frame_is_intra);
>> +
>> +		if (!frame_is_intra) {
>> +			/* load_probs2() already done */
>> +			u32 mv_mode[7][4];
>> +
>> +			for (i = 0; i < ARRAY_SIZE(mv_mode); ++i) {
>> +				mv_mode[i][0] = hantro_cnts->inter_mode_counts[i][1][0];
>> +				mv_mode[i][1] = hantro_cnts->inter_mode_counts[i][2][0];
>> +				mv_mode[i][2] = hantro_cnts->inter_mode_counts[i][0][0];
>> +				mv_mode[i][3] = hantro_cnts->inter_mode_counts[i][2][1];
>> +			}
>> +			counts->mv_mode = &mv_mode;
>> +			v4l2_vp9_adapt_noncoef_probs(&vp9_ctx->probability_tables, counts,
>> +						     vp9_ctx->cur.reference_mode,
>> +						     vp9_ctx->cur.interpolation_filter,
>> +						     vp9_ctx->cur.tx_mode, vp9_ctx->cur.flags);
>> +		}
>> +	}
>> +
>> +	vp9_ctx->frame_context[fctx_idx] = vp9_ctx->probability_tables;
>> +
>> +out_update_last:
>> +	vp9_ctx->last = vp9_ctx->cur;
>> +}
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index 42b3f3961f75..2961d399fd60 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -12,6 +12,7 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/v4l2-controls.h>
>>   #include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-vp9.h>
>>   #include <media/videobuf2-core.h>
>>   
>>   #define DEC_8190_ALIGN_MASK	0x07U
>> @@ -161,6 +162,50 @@ struct hantro_vp8_dec_hw_ctx {
>>   	struct hantro_aux_buf prob_tbl;
>>   };
>>   
>> +struct hantro_vp9_frame_info {
>> +	u32 valid : 1;
>> +	u32 frame_context_idx : 2;
>> +	u32 reference_mode : 2;
>> +	u32 tx_mode : 3;
>> +	u32 interpolation_filter : 3;
>> +	u32 flags;
>> +	u64 timestamp;
>> +};
>> +
>> +#define MAX_SB_COLS	64
>> +#define MAX_SB_ROWS	34
>> +
>> +/**
>> + * struct hantro_vp9_dec_hw_ctx
>> + *
>> + */
>> +struct hantro_vp9_dec_hw_ctx {
>> +	struct hantro_aux_buf tile_edge;
>> +	struct hantro_aux_buf segment_map;
>> +	struct hantro_aux_buf misc;
>> +	struct v4l2_vp9_frame_symbol_counts cnts;
>> +	struct v4l2_vp9_frame_context probability_tables;
>> +	struct v4l2_vp9_frame_context frame_context[4];
>> +	struct hantro_vp9_frame_info cur;
>> +	struct hantro_vp9_frame_info last;
>> +
>> +	unsigned int bsd_ctrl_offset;
>> +	unsigned int segment_map_size;
>> +	unsigned int ctx_counters_offset;
>> +	unsigned int tile_info_offset;
>> +
>> +	unsigned short tile_r_info[MAX_SB_ROWS];
>> +	unsigned short tile_c_info[MAX_SB_COLS];
>> +	unsigned int last_tile_r;
>> +	unsigned int last_tile_c;
>> +	unsigned int last_sbs_r;
>> +	unsigned int last_sbs_c;
>> +
>> +	unsigned int active_segment;
>> +	u8 feature_enabled[8];
>> +	s16 feature_data[8][4];
>> +};
>> +
>>   /**
>>    * struct hantro_postproc_ctx
>>    *
>> @@ -267,6 +312,24 @@ void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
>>   size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
>>   size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps);
>>   
>> +static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
>> +{
>> +	return (dimension + 63) / 64;
>> +}
>> +
>> +static inline size_t
>> +hantro_vp9_mv_size(unsigned int width, unsigned int height)
>> +{
>> +	int num_ctbs;
>> +
>> +	/*
>> +	 * There can be up to (CTBs x 64) number of blocks,
>> +	 * and the motion vector for each block needs 16 bytes.
>> +	 */
>> +	num_ctbs = hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
>> +	return (num_ctbs * 64) * 16;
>> +}
>> +
>>   static inline size_t
>>   hantro_h264_mv_size(unsigned int width, unsigned int height)
>>   {
>> @@ -308,6 +371,10 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
>>   void hantro_vp8_prob_update(struct hantro_ctx *ctx,
>>   			    const struct v4l2_ctrl_vp8_frame *hdr);
>>   
>> +int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx);
>> +void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx);
>> +int hantro_vp9_dec_init(struct hantro_ctx *ctx);
>> +void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
>>   void hantro_g2_check_idle(struct hantro_dev *vpu);
>>   
>>   #endif /* HANTRO_HW_H_ */
>> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
>> index d1f060c55fed..e4b0645ba6fc 100644
>> --- a/drivers/staging/media/hantro/hantro_v4l2.c
>> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
>> @@ -299,6 +299,11 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
>>   			pix_mp->plane_fmt[0].sizeimage +=
>>   				hantro_h264_mv_size(pix_mp->width,
>>   						    pix_mp->height);
>> +		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
>> +			 !hantro_needs_postproc(ctx, fmt))
>> +			pix_mp->plane_fmt[0].sizeimage +=
>> +				hantro_vp9_mv_size(pix_mp->width,
>> +						   pix_mp->height);
>>   	} else if (!pix_mp->plane_fmt[0].sizeimage) {
>>   		/*
>>   		 * For coded formats the application can specify
>> @@ -407,6 +412,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>>   	case V4L2_PIX_FMT_VP8_FRAME:
>>   	case V4L2_PIX_FMT_H264_SLICE:
>>   	case V4L2_PIX_FMT_HEVC_SLICE:
>> +	case V4L2_PIX_FMT_VP9_FRAME:
>>   		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
>>   		break;
>>   	default:
>> diff --git a/drivers/staging/media/hantro/hantro_vp9.c b/drivers/staging/media/hantro/hantro_vp9.c
>> new file mode 100644
>> index 000000000000..566cd376c097
>> --- /dev/null
>> +++ b/drivers/staging/media/hantro/hantro_vp9.c
>> @@ -0,0 +1,240 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Hantro VP9 codec driver
>> + *
>> + * Copyright (C) 2021 Collabora Ltd.
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <media/v4l2-mem2mem.h>
>> +
>> +#include "hantro.h"
>> +#include "hantro_hw.h"
>> +#include "hantro_vp9.h"
>> +
>> +#define POW2(x) (1 << (x))
>> +
>> +#define MAX_LOG2_TILE_COLUMNS 6
>> +#define MAX_NUM_TILE_COLS POW2(MAX_LOG2_TILE_COLUMNS)
>> +#define MAX_TILE_COLS 20
>> +#define MAX_TILE_ROWS 22
>> +
>> +static size_t hantro_vp9_tile_filter_size(unsigned int height)
>> +{
>> +	u32 h, height32, size;
>> +
>> +	h = roundup(height, 8);
>> +
>> +	height32 = roundup(h, 64);
>> +	size = 24 * height32 * (MAX_NUM_TILE_COLS - 1); /* luma: 8, chroma: 8 + 8 */
>> +
>> +	return size;
>> +}
>> +
>> +static size_t hantro_vp9_bsd_control_size(unsigned int height)
>> +{
>> +	u32 h, height32;
>> +
>> +	h = roundup(height, 8);
>> +	height32 = roundup(h, 64);
>> +
>> +	return 16 * (height32 / 4) * (MAX_NUM_TILE_COLS - 1);
>> +}
>> +
>> +static size_t hantro_vp9_segment_map_size(unsigned int width, unsigned int height)
>> +{
>> +	u32 w, h;
>> +	int num_ctbs;
>> +
>> +	w = roundup(width, 8);
>> +	h = roundup(height, 8);
>> +	num_ctbs = ((w + 63) / 64) * ((h + 63) / 64);
>> +
>> +	return num_ctbs * 32;
>> +}
>> +
>> +static inline size_t hantro_vp9_prob_tab_size(void)
>> +{
>> +	return roundup(sizeof(struct hantro_g2_all_probs), 16);
>> +}
>> +
>> +static inline size_t hantro_vp9_count_tab_size(void)
>> +{
>> +	return roundup(sizeof(struct symbol_counts), 16);
>> +}
>> +
>> +static inline size_t hantro_vp9_tile_info_size(void)
>> +{
>> +	return roundup((MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) + 15 + 16) & ~0xf, 16);
>> +}
>> +
>> +static void *get_coeffs_arr(struct symbol_counts *cnts, int i, int j, int k, int l, int m)
>> +{
>> +	if (i == 0)
>> +		return &cnts->count_coeffs[j][k][l][m];
>> +
>> +	if (i == 1)
>> +		return &cnts->count_coeffs8x8[j][k][l][m];
>> +
>> +	if (i == 2)
>> +		return &cnts->count_coeffs16x16[j][k][l][m];
>> +
>> +	if (i == 3)
>> +		return &cnts->count_coeffs32x32[j][k][l][m];
>> +
>> +	return NULL;
>> +}
>> +
>> +static void *get_eobs1(struct symbol_counts *cnts, int i, int j, int k, int l, int m)
>> +{
>> +	if (i == 0)
>> +		return &cnts->count_coeffs[j][k][l][m][3];
>> +
>> +	if (i == 1)
>> +		return &cnts->count_coeffs8x8[j][k][l][m][3];
>> +
>> +	if (i == 2)
>> +		return &cnts->count_coeffs16x16[j][k][l][m][3];
>> +
>> +	if (i == 3)
>> +		return &cnts->count_coeffs32x32[j][k][l][m][3];
>> +
>> +	return NULL;
>> +}
>> +
>> +#define INNER_LOOP \
>> +	do {										\
>> +		for (m = 0; m < ARRAY_SIZE(vp9_ctx->cnts.coeff[i][0][0][0]); ++m) {	\
>> +			vp9_ctx->cnts.coeff[i][j][k][l][m] =				\
>> +				get_coeffs_arr(cnts, i, j, k, l, m);			\
>> +			vp9_ctx->cnts.eob[i][j][k][l][m][0] =				\
>> +				&cnts->count_eobs[i][j][k][l][m];			\
>> +			vp9_ctx->cnts.eob[i][j][k][l][m][1] =				\
>> +				get_eobs1(cnts, i, j, k, l, m);				\
>> +		}									\
>> +	} while (0)
>> +
>> +static void init_v4l2_vp9_count_tbl(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_vp9_dec_hw_ctx *vp9_ctx = &ctx->vp9_dec;
>> +	struct symbol_counts *cnts = vp9_ctx->misc.cpu + vp9_ctx->ctx_counters_offset;
>> +	int i, j, k, l, m;
>> +
>> +	vp9_ctx->cnts.partition = &cnts->partition_counts;
>> +	vp9_ctx->cnts.skip = &cnts->mbskip_count;
>> +	vp9_ctx->cnts.intra_inter = &cnts->intra_inter_count;
>> +	vp9_ctx->cnts.tx32p = &cnts->tx32x32_count;
>> +	/*
>> +	 * g2 hardware uses tx16x16_count[2][3], while the api
>> +	 * expects tx16p[2][4], so this must be explicitly copied
>> +	 * into vp9_ctx->cnts.tx16p when passing the data to the
>> +	 * vp9 library function
>> +	 */
>> +	vp9_ctx->cnts.tx8p = &cnts->tx8x8_count;
>> +
>> +	vp9_ctx->cnts.y_mode = &cnts->sb_ymode_counts;
>> +	vp9_ctx->cnts.uv_mode = &cnts->uv_mode_counts;
>> +	vp9_ctx->cnts.comp = &cnts->comp_inter_count;
>> +	vp9_ctx->cnts.comp_ref = &cnts->comp_ref_count;
>> +	vp9_ctx->cnts.single_ref = &cnts->single_ref_count;
>> +	vp9_ctx->cnts.filter = &cnts->switchable_interp_counts;
>> +	vp9_ctx->cnts.mv_joint = &cnts->mv_counts.joints;
>> +	vp9_ctx->cnts.sign = &cnts->mv_counts.sign;
>> +	vp9_ctx->cnts.classes = &cnts->mv_counts.classes;
>> +	vp9_ctx->cnts.class0 = &cnts->mv_counts.class0;
>> +	vp9_ctx->cnts.bits = &cnts->mv_counts.bits;
>> +	vp9_ctx->cnts.class0_fp = &cnts->mv_counts.class0_fp;
>> +	vp9_ctx->cnts.fp = &cnts->mv_counts.fp;
>> +	vp9_ctx->cnts.class0_hp = &cnts->mv_counts.class0_hp;
>> +	vp9_ctx->cnts.hp = &cnts->mv_counts.hp;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(vp9_ctx->cnts.coeff); ++i)
>> +		for (j = 0; j < ARRAY_SIZE(vp9_ctx->cnts.coeff[i]); ++j)
>> +			for (k = 0; k < ARRAY_SIZE(vp9_ctx->cnts.coeff[i][0]); ++k)
>> +				for (l = 0; l < ARRAY_SIZE(vp9_ctx->cnts.coeff[i][0][0]); ++l)
>> +					INNER_LOOP;
>> +}
>> +
>> +int hantro_vp9_dec_init(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_dev *vpu = ctx->dev;
>> +	const struct hantro_variant *variant = vpu->variant;
>> +	struct hantro_vp9_dec_hw_ctx *vp9_dec = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *tile_edge = &vp9_dec->tile_edge;
>> +	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
>> +	struct hantro_aux_buf *misc = &vp9_dec->misc;
>> +	u32 i, max_width, max_height, size;
>> +
>> +	if (variant->num_dec_fmts < 1)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < variant->num_dec_fmts; ++i)
>> +		if (variant->dec_fmts[i].fourcc == V4L2_PIX_FMT_VP9_FRAME)
>> +			break;
>> +
>> +	if (i == variant->num_dec_fmts)
>> +		return -EINVAL;
>> +
>> +	max_width = vpu->variant->dec_fmts[i].frmsize.max_width;
>> +	max_height = vpu->variant->dec_fmts[i].frmsize.max_height;
>> +
>> +	size = hantro_vp9_tile_filter_size(max_height);
>> +	vp9_dec->bsd_ctrl_offset = size;
>> +	size += hantro_vp9_bsd_control_size(max_height);
>> +
>> +	tile_edge->cpu = dma_alloc_coherent(vpu->dev, size, &tile_edge->dma, GFP_KERNEL);
>> +	if (!tile_edge->cpu)
>> +		return -ENOMEM;
>> +
>> +	tile_edge->size = size;
>> +	memset(tile_edge->cpu, 0, size);
>> +
>> +	size = hantro_vp9_segment_map_size(max_width, max_height);
>> +	vp9_dec->segment_map_size = size;
>> +	size *= 2; /* we need two areas of this size, used alternately */
>> +
>> +	segment_map->cpu = dma_alloc_coherent(vpu->dev, size, &segment_map->dma, GFP_KERNEL);
>> +	if (!segment_map->cpu)
>> +		goto err_segment_map;
>> +
>> +	segment_map->size = size;
>> +	memset(segment_map->cpu, 0, size);
>> +
>> +	size = hantro_vp9_prob_tab_size();
>> +	vp9_dec->ctx_counters_offset = size;
>> +	size += hantro_vp9_count_tab_size();
>> +	vp9_dec->tile_info_offset = size;
>> +	size += hantro_vp9_tile_info_size();
>> +
>> +	misc->cpu = dma_alloc_coherent(vpu->dev, size, &misc->dma, GFP_KERNEL);
>> +	if (!misc->cpu)
>> +		goto err_misc;
>> +
>> +	misc->size = size;
>> +	memset(misc->cpu, 0, size);
>> +
>> +	init_v4l2_vp9_count_tbl(ctx);
>> +
>> +	return 0;
>> +
>> +err_misc:
>> +	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
>> +
>> +err_segment_map:
>> +	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
>> +
>> +	return -ENOMEM;
>> +}
>> +
>> +void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_dev *vpu = ctx->dev;
>> +	struct hantro_vp9_dec_hw_ctx *vp9_dec = &ctx->vp9_dec;
>> +	struct hantro_aux_buf *tile_edge = &vp9_dec->tile_edge;
>> +	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
>> +	struct hantro_aux_buf *misc = &vp9_dec->misc;
>> +
>> +	dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
>> +	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
>> +	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
>> +}
>> diff --git a/drivers/staging/media/hantro/hantro_vp9.h b/drivers/staging/media/hantro/hantro_vp9.h
>> new file mode 100644
>> index 000000000000..c7f4bd3ff8dd
>> --- /dev/null
>> +++ b/drivers/staging/media/hantro/hantro_vp9.h
>> @@ -0,0 +1,103 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Hantro VP9 codec driver
>> + *
>> + * Copyright (C) 2021 Collabora Ltd.
>> + */
>> +
>> +struct hantro_g2_mv_probs {
>> +	u8 joint[3];
>> +	u8 sign[2];
>> +	u8 class0_bit[2][1];
>> +	u8 fr[2][3];
>> +	u8 class0_hp[2];
>> +	u8 hp[2];
>> +	u8 classes[2][10];
>> +	u8 class0_fr[2][2][3];
>> +	u8 bits[2][10];
>> +};
>> +
>> +struct hantro_g2_probs {
>> +	u8 inter_mode[7][4];
>> +	u8 is_inter[4];
>> +	u8 uv_mode[10][8];
>> +	u8 tx8[2][1];
>> +	u8 tx16[2][2];
>> +	u8 tx32[2][3];
>> +	u8 y_mode_tail[4][1];
>> +	u8 y_mode[4][8];
>> +	u8 partition[2][16][4]; /* [keyframe][][], [inter][][] */
>> +	u8 uv_mode_tail[10][1];
>> +	u8 interp_filter[4][2];
>> +	u8 comp_mode[5];
>> +	u8 skip[3];
>> +
>> +	u8 pad1[1];
>> +
>> +	struct hantro_g2_mv_probs mv;
>> +
>> +	u8 single_ref[5][2];
>> +	u8 comp_ref[5];
>> +
>> +	u8 pad2[17];
>> +
>> +	u8 coef[4][2][2][6][6][4];
>> +};
>> +
>> +struct hantro_g2_all_probs {
>> +	u8 kf_y_mode_prob[10][10][8];
>> +
>> +	u8 kf_y_mode_prob_tail[10][10][1];
>> +	u8 ref_pred_probs[3];
>> +	u8 mb_segment_tree_probs[7];
>> +	u8 segment_pred_probs[3];
>> +	u8 ref_scores[4];
>> +	u8 prob_comppred[2];
>> +
>> +	u8 pad1[9];
>> +
>> +	u8 kf_uv_mode_prob[10][8];
>> +	u8 kf_uv_mode_prob_tail[10][1];
>> +
>> +	u8 pad2[6];
>> +
>> +	struct hantro_g2_probs probs;
>> +};
>> +
>> +struct mv_counts {
>> +	u32 joints[4];
>> +	u32 sign[2][2];
>> +	u32 classes[2][11];
>> +	u32 class0[2][2];
>> +	u32 bits[2][10][2];
>> +	u32 class0_fp[2][2][4];
>> +	u32 fp[2][4];
>> +	u32 class0_hp[2][2];
>> +	u32 hp[2][2];
>> +};
>> +
>> +struct symbol_counts {
>> +	u32 inter_mode_counts[7][3][2];
>> +	u32 sb_ymode_counts[4][10];
>> +	u32 uv_mode_counts[10][10];
>> +	u32 partition_counts[16][4];
>> +	u32 switchable_interp_counts[4][3];
>> +	u32 intra_inter_count[4][2];
>> +	u32 comp_inter_count[5][2];
>> +	u32 single_ref_count[5][2][2];
>> +	u32 comp_ref_count[5][2];
>> +	u32 tx32x32_count[2][4];
>> +	u32 tx16x16_count[2][3];
>> +	u32 tx8x8_count[2][2];
>> +	u32 mbskip_count[3][2];
>> +
>> +	struct mv_counts mv_counts;
>> +
>> +	u32 count_coeffs[2][2][6][6][4];
>> +	u32 count_coeffs8x8[2][2][6][6][4];
>> +	u32 count_coeffs16x16[2][2][6][6][4];
>> +	u32 count_coeffs32x32[2][2][6][6][4];
>> +
>> +	u32 count_eobs[4][2][2][6][6];
>> +};
>> +
>> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> index a40b161e5956..455a107ffb02 100644
>> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> @@ -150,6 +150,19 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>>   			.step_height = MB_DIM,
>>   		},
>>   	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
>> +		.codec_mode = HANTRO_MODE_VP9_DEC,
>> +		.max_depth = 2,
>> +		.frmsize = {
>> +			.min_width = 48,
>> +			.max_width = 3840,
>> +			.step_width = MB_DIM,
>> +			.min_height = 48,
>> +			.max_height = 2160,
>> +			.step_height = MB_DIM,
>> +		},
>> +	},
>>   };
>>   
>>   static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>> @@ -241,6 +254,13 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>>   		.init = hantro_hevc_dec_init,
>>   		.exit = hantro_hevc_dec_exit,
>>   	},
>> +	[HANTRO_MODE_VP9_DEC] = {
>> +		.run = hantro_g2_vp9_dec_run,
>> +		.done = hantro_g2_vp9_dec_done,
>> +		.reset = imx8m_vpu_g2_reset,
>> +		.init = hantro_vp9_dec_init,
>> +		.exit = hantro_vp9_dec_exit,
>> +	},
>>   };
>>   
>>   /*
>> @@ -281,7 +301,7 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
>>   	.dec_offset = 0x0,
>>   	.dec_fmts = imx8m_vpu_g2_dec_fmts,
>>   	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
>> -	.codec = HANTRO_HEVC_DECODER,
>> +	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
>>   	.codec_ops = imx8mq_vpu_g2_codec_ops,
>>   	.init = imx8mq_vpu_hw_init,
>>   	.runtime_resume = imx8mq_runtime_resume,
> 
> 

