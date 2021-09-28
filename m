Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0984B41B2ED
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 17:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241626AbhI1P3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 11:29:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39410 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241535AbhI1P3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 11:29:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 7B6431F43520
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
 <79d74f26c1b36c77723ef57adf1ee7148b2ae36b.camel@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <6a93e756-67f1-3fa6-7ae2-c8430345f897@collabora.com>
Date:   Tue, 28 Sep 2021 17:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <79d74f26c1b36c77723ef57adf1ee7148b2ae36b.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

W dniu 28.09.2021 o 17:02, Nicolas Dufresne pisze:
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
>>   #define G2_ADDR_STR		(G2_SWREG(169))
>>   #define HEVC_SCALING_LIST	(G2_SWREG(171))
>> +#define VP9_ADDR_CTR		(G2_SWREG(171))
>> +#define VP9_ADDR_PROBS		(G2_SWREG(173))
>>   #define G2_RASTER_SCAN		(G2_SWREG(175))
>>   #define G2_RASTER_SCAN_CHR	(G2_SWREG(177))
>>   #define G2_TILE_FILTER		(G2_SWREG(179))
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
> 
> The two above addresses are left with ancient data when tile is disabled. The
> vendor driver always set a valid pointer regardless if tile is enabled or
> disabled, perhaps we could do that same ?
> 
> p.s. Was spotted by Jernej.
> 

FWIW, when testing with fluster I observe no score changes if I set these
for the no-tiles case, too. Always writing G2_TILE_FILTER and G2_TILE_BSD won't
hurt, though, so I will do that in v7.

Regards,

Andrzej
