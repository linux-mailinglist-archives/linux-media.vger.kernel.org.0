Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AE11973C8
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 07:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgC3FUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 01:20:10 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39776 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbgC3FUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 01:20:10 -0400
Received: by mail-qk1-f193.google.com with SMTP id b62so17782067qkf.6;
        Sun, 29 Mar 2020 22:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ernxgGqH6tL+1NBFm7nrBkYpKXvc3ql8HSKqVvGEBjA=;
        b=CrZPuaBY+aZg3U5T4A9n6OMSi2W99z/g4LTLd+WYDMSfisMdDFtw6+xbm7NaLO6llY
         TLvG+NK2olV6oSptzRSjAfEv1dKv0ezGagb/gMVoBkw7GOTMZJRJaxc0koO1rLPleA1s
         UNOIw/ALDB8TWmKDNH+9pX+LSrx4RGBaQK4gwWaphPZ0oNfFHvYOsTbPosgUYXglZBoT
         H7z1YeD6k1L1Sc2Ta2sZ77rET4HpplL6Gx4bEy3DaxZcIIoNQ1DUQPhtMufWQ+9WDg9p
         jk/P/Ig5cp4KNXtxks15Dx1jXncqn+unbbgrLr/lwRRAIKkucCol14gAEFueEIJGaljZ
         LQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ernxgGqH6tL+1NBFm7nrBkYpKXvc3ql8HSKqVvGEBjA=;
        b=VybQUYisCJAuSWvniBMro0fR8HW9sjVH5DJ8YYaBkihNGtaYhUFp33C1SYm0N/zVzA
         eT3kUWCxVUPCAKtmRn6dM70rdp2g4EGQr2rlLGTDp9ML3pmoEsq/ml9LiVPOeorYZdiQ
         VFGfBj10uF4aT20L4a0KBoNgDWKfBk5gexZqxI1/OM/gS1yDs14Wz1U6GuZHc7O6FBXZ
         UnQwBJ3LmUS/Mn7hA32Ye36uEdyLfqRnrj3NfPNfwvGEQor00CrwJcUu4fA6W6sSpfTL
         XJ/DwX5fjCL1uPi8DtP35HzvwCgkZCFgEnV6IQkZB5OW3KiGO4IXD1tRxB0rC3Finoiv
         GBHA==
X-Gm-Message-State: ANhLgQ0vug7uWuZxBYkTIMW+XBEolebXwc7yECjWyR0vBJ2kFq/Pt4Gm
        0DhNcAudPvZIFm6OkhCuuqlUkgEv+A4=
X-Google-Smtp-Source: ADFU+vu8DkjV4LCbSrw029jLp3/Cgm3QNixsWe0UUSp44sqbZyNQgmM4IQ0GOP6cJ23qBLBtlrwywA==
X-Received: by 2002:ae9:ebc1:: with SMTP id b184mr9922539qkg.49.1585545605982;
        Sun, 29 Mar 2020 22:20:05 -0700 (PDT)
Received: from manj (c-71-232-27-28.hsd1.ma.comcast.net. [71.232.27.28])
        by smtp.gmail.com with ESMTPSA id s36sm10552420qtb.28.2020.03.29.22.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 22:20:05 -0700 (PDT)
Date:   Mon, 30 Mar 2020 01:20:04 -0400
From:   Andriy Gelman <andriy.gelman@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 4/5] media: rkvdec: Add the rkvdec driver
Message-ID: <20200330052004.lwrqznoieu4fzbxv@manj>
References: <20200330014616.10621-1-ezequiel@collabora.com>
 <20200330014616.10621-5-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200330014616.10621-5-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 29. Mar 22:46, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The rockchip vdec block is a stateless decoder that's able to decode
> H264, HEVC and VP9 content. This commit adds the core infrastructure
> and the H264 backend. Support for VP9 and HEVS will be added later on.

s/HEVS/HEVC ? 

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> v7:
> * hverkuil-cisco@xs4all.nl: replaced VFL_TYPE_GRABBER by _VIDEO
> * Use macros and ARRAY_SIZE instead of magic numbers,
>   as suggested by Mauro.
> * Renamed M_N macro, suggested by Mauro.
> * Use v4l2_m2m_buf_done_and_job_finish.
> * Set buffers' zeroth plane payload in .buf_prepare
> * Refactor try/s_fmt for spec compliance.
> ---
>  MAINTAINERS                                |    7 +
>  drivers/staging/media/Kconfig              |    2 +
>  drivers/staging/media/Makefile             |    1 +
>  drivers/staging/media/rkvdec/Kconfig       |   15 +
>  drivers/staging/media/rkvdec/Makefile      |    3 +
>  drivers/staging/media/rkvdec/TODO          |   11 +
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 1156 ++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec-regs.h |  223 ++++
>  drivers/staging/media/rkvdec/rkvdec.c      | 1111 +++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.h      |  121 ++
>  10 files changed, 2650 insertions(+)
>  create mode 100644 drivers/staging/media/rkvdec/Kconfig
>  create mode 100644 drivers/staging/media/rkvdec/Makefile
>  create mode 100644 drivers/staging/media/rkvdec/TODO
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d66ac41ef587..df2295d0b733 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14298,6 +14298,13 @@ F:	drivers/hid/hid-roccat*
>  F:	include/linux/hid-roccat*
>  F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
>  
> +ROCKCHIP VIDEO DECODER DRIVER
> +M:	Ezequiel Garcia <ezequiel@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/staging/media/rkvdec/
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +
>  ROCKCHIP ISP V1 DRIVER
>  M:	Helen Koike <helen.koike@collabora.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index e59a846bc909..c6b4fb5d48b4 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -30,6 +30,8 @@ source "drivers/staging/media/meson/vdec/Kconfig"
>  
>  source "drivers/staging/media/omap4iss/Kconfig"
>  
> +source "drivers/staging/media/rkvdec/Kconfig"
> +
>  source "drivers/staging/media/sunxi/Kconfig"
>  
>  source "drivers/staging/media/tegra-vde/Kconfig"
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 23c682461b62..8b24be1a7076 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
>  obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
>  obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
>  obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
>  obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
>  obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
> diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/staging/media/rkvdec/Kconfig
> new file mode 100644
> index 000000000000..a22756deded7
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_ROCKCHIP_VDEC
> +	tristate "Rockchip Video Decoder driver"
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
> +	depends on MEDIA_CONTROLLER_REQUEST_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	select V4L2_H264
> +	help
> +	  Support for the Rockchip Video Decoder IP present on Rockchip SoCs,
> +	  which accelerates video decoding.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-vdec.
> diff --git a/drivers/staging/media/rkvdec/Makefile b/drivers/staging/media/rkvdec/Makefile
> new file mode 100644
> index 000000000000..c08fed0a39f9
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/Makefile
> @@ -0,0 +1,3 @@
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
> +
> +rockchip-vdec-y += rkvdec.o rkvdec-h264.o
> diff --git a/drivers/staging/media/rkvdec/TODO b/drivers/staging/media/rkvdec/TODO
> new file mode 100644
> index 000000000000..e0f0f12f0ac5
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/TODO
> @@ -0,0 +1,11 @@
> +* Support for VP9 is planned for this driver.
> +
> +  Given the V4L controls for those CODECs will be part of
> +  the uABI, it will be required to have the driver in staging.
> +
> +  For this reason, we are keeping this driver in staging for now.
> +
> +* Evaluate introducing a helper to consolidate duplicated
> +  code in rkvdec_request_validate and cedrus_request_validate.
> +  The helper needs to the driver private data associated with
> +  the videobuf2 queue, from a media request.
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> new file mode 100644
> index 000000000000..8d631c6e4c94
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -0,0 +1,1156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Video Decoder H264 backend
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *	Jeffy Chen <jeffy.chen@rock-chips.com>
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-regs.h"
> +
> +/* Size with u32 units. */
> +#define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
> +#define RKV_RPS_SIZE			((128 + 128) / 4)
> +#define RKV_SCALING_LIST_SIZE		(6 * 16 + 6 * 64 + 128)
> +#define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
> +
> +#define RKVDEC_NUM_REFLIST		3
> +
> +struct rkvdec_sps_pps_packet {
> +	u32 info[8];
> +};
> +
> +struct rkvdec_ps_field {
> +	u16 offset;
> +	u8 len;
> +};
> +
> +#define PS_FIELD(_offset, _len) \
> +	((struct rkvdec_ps_field){ _offset, _len })
> +
> +#define SEQ_PARAMETER_SET_ID				PS_FIELD(0, 4)
> +#define PROFILE_IDC					PS_FIELD(4, 8)
> +#define CONSTRAINT_SET3_FLAG				PS_FIELD(12, 1)
> +#define CHROMA_FORMAT_IDC				PS_FIELD(13, 2)
> +#define BIT_DEPTH_LUMA					PS_FIELD(15, 3)
> +#define BIT_DEPTH_CHROMA				PS_FIELD(18, 3)
> +#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		PS_FIELD(21, 1)
> +#define LOG2_MAX_FRAME_NUM_MINUS4			PS_FIELD(22, 4)
> +#define MAX_NUM_REF_FRAMES				PS_FIELD(26, 5)
> +#define PIC_ORDER_CNT_TYPE				PS_FIELD(31, 2)
> +#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		PS_FIELD(33, 4)
> +#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		PS_FIELD(37, 1)
> +#define PIC_WIDTH_IN_MBS				PS_FIELD(38, 9)
> +#define PIC_HEIGHT_IN_MBS				PS_FIELD(47, 9)
> +#define FRAME_MBS_ONLY_FLAG				PS_FIELD(56, 1)
> +#define MB_ADAPTIVE_FRAME_FIELD_FLAG			PS_FIELD(57, 1)
> +#define DIRECT_8X8_INFERENCE_FLAG			PS_FIELD(58, 1)
> +#define MVC_EXTENSION_ENABLE				PS_FIELD(59, 1)
> +#define NUM_VIEWS					PS_FIELD(60, 2)
> +#define VIEW_ID(i)					PS_FIELD(62 + ((i) * 10), 10)
> +#define NUM_ANCHOR_REFS_L(i)				PS_FIELD(82 + ((i) * 11), 1)
> +#define ANCHOR_REF_L(i)				PS_FIELD(83 + ((i) * 11), 10)
> +#define NUM_NON_ANCHOR_REFS_L(i)			PS_FIELD(104 + ((i) * 11), 1)
> +#define NON_ANCHOR_REFS_L(i)				PS_FIELD(105 + ((i) * 11), 10)
> +#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 8)
> +#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(136, 5)
> +#define ENTROPY_CODING_MODE_FLAG			PS_FIELD(141, 1)
> +#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	PS_FIELD(142, 1)
> +#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		PS_FIELD(143 + ((i) * 5), 5)
> +#define WEIGHTED_PRED_FLAG				PS_FIELD(153, 1)
> +#define WEIGHTED_BIPRED_IDC				PS_FIELD(154, 2)
> +#define PIC_INIT_QP_MINUS26				PS_FIELD(156, 7)
> +#define PIC_INIT_QS_MINUS26				PS_FIELD(163, 6)
> +#define CHROMA_QP_INDEX_OFFSET				PS_FIELD(169, 5)
> +#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		PS_FIELD(174, 1)
> +#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(175, 1)
> +#define REDUNDANT_PIC_CNT_PRESENT			PS_FIELD(176, 1)
> +#define TRANSFORM_8X8_MODE_FLAG			PS_FIELD(177, 1)
> +#define SECOND_CHROMA_QP_INDEX_OFFSET			PS_FIELD(178, 5)
> +#define SCALING_LIST_ENABLE_FLAG			PS_FIELD(183, 1)
> +#define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
> +#define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
> +
> +#define DPB_OFFS(i, j)					(288 + ((j) * 32 * 7) + ((i) * 7))
> +#define DPB_INFO(i, j)					PS_FIELD(DPB_OFFS(i, j), 5)
> +#define BOTTOM_FLAG(i, j)				PS_FIELD(DPB_OFFS(i, j) + 5, 1)
> +#define VIEW_INDEX_OFF(i, j)				PS_FIELD(DPB_OFFS(i, j) + 6, 1)
> +
> +/* Data structure describing auxiliary buffer format. */
> +struct rkvdec_h264_priv_tbl {
> +	s8 cabac_table[4][464][2];
> +	u8 scaling_list[RKV_SCALING_LIST_SIZE];
> +	u32 rps[RKV_RPS_SIZE];
> +	struct rkvdec_sps_pps_packet param_set[256];
> +	u8 err_info[RKV_ERROR_INFO_SIZE];
> +};
> +
> +#define RKVDEC_H264_DPB_SIZE 16
> +
> +struct rkvdec_h264_reflists {
> +	u8 p[RKVDEC_H264_DPB_SIZE];
> +	u8 b0[RKVDEC_H264_DPB_SIZE];
> +	u8 b1[RKVDEC_H264_DPB_SIZE];
> +	u8 num_valid;
> +};
> +
> +struct rkvdec_h264_run {
> +	struct rkvdec_run base;
> +	const struct v4l2_ctrl_h264_decode_params *decode_params;
> +	const struct v4l2_ctrl_h264_slice_params *slices_params;
> +	const struct v4l2_ctrl_h264_sps *sps;
> +	const struct v4l2_ctrl_h264_pps *pps;
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> +};
> +
> +struct rkvdec_h264_ctx {
> +	struct rkvdec_aux_buf priv_tbl;
> +	struct rkvdec_h264_reflists reflists;
> +};
> +
> +#define CABAC_ENTRY(ctxidx, idc0_m, idc0_n, idc1_m, idc1_n,		\
> +	    idc2_m, idc2_n, intra_m, intra_n)			\
> +	[0][(ctxidx)] = {idc0_m, idc0_n},			\
> +	[1][(ctxidx)] = {idc1_m, idc1_n},			\
> +	[2][(ctxidx)] = {idc2_m, idc2_n},			\
> +	[3][(ctxidx)] = {intra_m, intra_n}
> +
> +/*
> + * Constant CABAC table.
> + * Built from the tables described in section '9.3.1.1 Initialisation process
> + * for context variables' of the H264 spec.
> + */
> +static const s8 rkvdec_h264_cabac_table[4][464][2] = {
> +	/* Table 9-12 – Values of variables m and n for ctxIdx from 0 to 10 */
> +	CABAC_ENTRY(0, 20, -15, 20, -15, 20, -15, 20, -15),
> +	CABAC_ENTRY(1, 2, 54, 2, 54, 2, 54, 2, 54),
> +	CABAC_ENTRY(2, 3, 74, 3, 74, 3, 74, 3, 74),
> +	CABAC_ENTRY(3, 20, -15, 20, -15, 20, -15, 20, -15),
> +	CABAC_ENTRY(4, 2, 54, 2, 54, 2, 54, 2, 54),
> +	CABAC_ENTRY(5, 3, 74, 3, 74, 3, 74, 3, 74),
> +	CABAC_ENTRY(6, -28, 127, -28, 127, -28, 127, -28, 127),
> +	CABAC_ENTRY(7, -23, 104, -23, 104, -23, 104, -23, 104),
> +	CABAC_ENTRY(8, -6, 53, -6, 53, -6, 53, -6, 53),
> +	CABAC_ENTRY(9, -1, 54, -1, 54, -1, 54, -1, 54),
> +	CABAC_ENTRY(10, 7, 51, 7, 51, 7, 51, 7, 51),
> +
> +	/* Table 9-13 – Values of variables m and n for ctxIdx from 11 to 23 */
> +	CABAC_ENTRY(11, 23, 33, 22, 25, 29, 16, 0, 0),
> +	CABAC_ENTRY(12, 23, 2, 34, 0, 25, 0, 0, 0),
> +	CABAC_ENTRY(13, 21, 0, 16, 0, 14, 0, 0, 0),
> +	CABAC_ENTRY(14, 1, 9, -2, 9, -10, 51, 0, 0),
> +	CABAC_ENTRY(15, 0, 49, 4, 41, -3, 62, 0, 0),
> +	CABAC_ENTRY(16, -37, 118, -29, 118, -27, 99, 0, 0),
> +	CABAC_ENTRY(17, 5, 57, 2, 65, 26, 16, 0, 0),
> +	CABAC_ENTRY(18, -13, 78, -6, 71, -4, 85, 0, 0),
> +	CABAC_ENTRY(19, -11, 65, -13, 79, -24, 102, 0, 0),
> +	CABAC_ENTRY(20, 1, 62, 5, 52, 5, 57, 0, 0),
> +	CABAC_ENTRY(21, 12, 49, 9, 50, 6, 57, 0, 0),
> +	CABAC_ENTRY(22, -4, 73, -3, 70, -17, 73, 0, 0),
> +	CABAC_ENTRY(23, 17, 50, 10, 54, 14, 57, 0, 0),
> +
> +	/* Table 9-14 – Values of variables m and n for ctxIdx from 24 to 39 */
> +	CABAC_ENTRY(24, 18, 64, 26, 34, 20, 40, 0, 0),
> +	CABAC_ENTRY(25, 9, 43, 19, 22, 20, 10, 0, 0),
> +	CABAC_ENTRY(26, 29, 0, 40, 0, 29, 0, 0, 0),
> +	CABAC_ENTRY(27, 26, 67, 57, 2, 54, 0, 0, 0),
> +	CABAC_ENTRY(28, 16, 90, 41, 36, 37, 42, 0, 0),
> +	CABAC_ENTRY(29, 9, 104, 26, 69, 12, 97, 0, 0),
> +	CABAC_ENTRY(30, -46, 127, -45, 127, -32, 127, 0, 0),
> +	CABAC_ENTRY(31, -20, 104, -15, 101, -22, 117, 0, 0),
> +	CABAC_ENTRY(32, 1, 67, -4, 76, -2, 74, 0, 0),
> +	CABAC_ENTRY(33, -13, 78, -6, 71, -4, 85, 0, 0),
> +	CABAC_ENTRY(34, -11, 65, -13, 79, -24, 102, 0, 0),
> +	CABAC_ENTRY(35, 1, 62, 5, 52, 5, 57, 0, 0),
> +	CABAC_ENTRY(36, -6, 86, 6, 69, -6, 93, 0, 0),
> +	CABAC_ENTRY(37, -17, 95, -13, 90, -14, 88, 0, 0),
> +	CABAC_ENTRY(38, -6, 61, 0, 52, -6, 44, 0, 0),
> +	CABAC_ENTRY(39, 9, 45, 8, 43, 4, 55, 0, 0),
> +
> +	/* Table 9-15 – Values of variables m and n for ctxIdx from 40 to 53 */
> +	CABAC_ENTRY(40, -3, 69, -2, 69, -11, 89, 0, 0),
> +	CABAC_ENTRY(41, -6, 81, -5, 82, -15, 103, 0, 0),
> +	CABAC_ENTRY(42, -11, 96, -10, 96, -21, 116, 0, 0),
> +	CABAC_ENTRY(43, 6, 55, 2, 59, 19, 57, 0, 0),
> +	CABAC_ENTRY(44, 7, 67, 2, 75, 20, 58, 0, 0),
> +	CABAC_ENTRY(45, -5, 86, -3, 87, 4, 84, 0, 0),
> +	CABAC_ENTRY(46, 2, 88, -3, 100, 6, 96, 0, 0),
> +	CABAC_ENTRY(47, 0, 58, 1, 56, 1, 63, 0, 0),
> +	CABAC_ENTRY(48, -3, 76, -3, 74, -5, 85, 0, 0),
> +	CABAC_ENTRY(49, -10, 94, -6, 85, -13, 106, 0, 0),
> +	CABAC_ENTRY(50, 5, 54, 0, 59, 5, 63, 0, 0),
> +	CABAC_ENTRY(51, 4, 69, -3, 81, 6, 75, 0, 0),
> +	CABAC_ENTRY(52, -3, 81, -7, 86, -3, 90, 0, 0),
> +	CABAC_ENTRY(53, 0, 88, -5, 95, -1, 101, 0, 0),
> +
> +	/* Table 9-16 – Values of variables m and n for ctxIdx from 54 to 59 */
> +	CABAC_ENTRY(54, -7, 67, -1, 66, 3, 55, 0, 0),
> +	CABAC_ENTRY(55, -5, 74, -1, 77, -4, 79, 0, 0),
> +	CABAC_ENTRY(56, -4, 74, 1, 70, -2, 75, 0, 0),
> +	CABAC_ENTRY(57, -5, 80, -2, 86, -12, 97, 0, 0),
> +	CABAC_ENTRY(58, -7, 72, -5, 72, -7, 50, 0, 0),
> +	CABAC_ENTRY(59, 1, 58, 0, 61, 1, 60, 0, 0),
> +
> +	/* Table 9-17 – Values of variables m and n for ctxIdx from 60 to 69 */
> +	CABAC_ENTRY(60, 0, 41, 0, 41, 0, 41, 0, 41),
> +	CABAC_ENTRY(61, 0, 63, 0, 63, 0, 63, 0, 63),
> +	CABAC_ENTRY(62, 0, 63, 0, 63, 0, 63, 0, 63),
> +	CABAC_ENTRY(63, 0, 63, 0, 63, 0, 63, 0, 63),
> +	CABAC_ENTRY(64, -9, 83, -9, 83, -9, 83, -9, 83),
> +	CABAC_ENTRY(65, 4, 86, 4, 86, 4, 86, 4, 86),
> +	CABAC_ENTRY(66, 0, 97, 0, 97, 0, 97, 0, 97),
> +	CABAC_ENTRY(67, -7, 72, -7, 72, -7, 72, -7, 72),
> +	CABAC_ENTRY(68, 13, 41, 13, 41, 13, 41, 13, 41),
> +	CABAC_ENTRY(69, 3, 62, 3, 62, 3, 62, 3, 62),
> +
> +	/* Table 9-18 – Values of variables m and n for ctxIdx from 70 to 104 */
> +	CABAC_ENTRY(70, 0, 45, 13, 15, 7, 34, 0, 11),
> +	CABAC_ENTRY(71, -4, 78, 7, 51, -9, 88, 1, 55),
> +	CABAC_ENTRY(72, -3, 96, 2, 80, -20, 127, 0, 69),
> +	CABAC_ENTRY(73, -27, 126, -39, 127, -36, 127, -17, 127),
> +	CABAC_ENTRY(74, -28, 98, -18, 91, -17, 91, -13, 102),
> +	CABAC_ENTRY(75, -25, 101, -17, 96, -14, 95, 0, 82),
> +	CABAC_ENTRY(76, -23, 67, -26, 81, -25, 84, -7, 74),
> +	CABAC_ENTRY(77, -28, 82, -35, 98, -25, 86, -21, 107),
> +	CABAC_ENTRY(78, -20, 94, -24, 102, -12, 89, -27, 127),
> +	CABAC_ENTRY(79, -16, 83, -23, 97, -17, 91, -31, 127),
> +	CABAC_ENTRY(80, -22, 110, -27, 119, -31, 127, -24, 127),
> +	CABAC_ENTRY(81, -21, 91, -24, 99, -14, 76, -18, 95),
> +	CABAC_ENTRY(82, -18, 102, -21, 110, -18, 103, -27, 127),
> +	CABAC_ENTRY(83, -13, 93, -18, 102, -13, 90, -21, 114),
> +	CABAC_ENTRY(84, -29, 127, -36, 127, -37, 127, -30, 127),
> +	CABAC_ENTRY(85, -7, 92, 0, 80, 11, 80, -17, 123),
> +	CABAC_ENTRY(86, -5, 89, -5, 89, 5, 76, -12, 115),
> +	CABAC_ENTRY(87, -7, 96, -7, 94, 2, 84, -16, 122),
> +	CABAC_ENTRY(88, -13, 108, -4, 92, 5, 78, -11, 115),
> +	CABAC_ENTRY(89, -3, 46, 0, 39, -6, 55, -12, 63),
> +	CABAC_ENTRY(90, -1, 65, 0, 65, 4, 61, -2, 68),
> +	CABAC_ENTRY(91, -1, 57, -15, 84, -14, 83, -15, 84),
> +	CABAC_ENTRY(92, -9, 93, -35, 127, -37, 127, -13, 104),
> +	CABAC_ENTRY(93, -3, 74, -2, 73, -5, 79, -3, 70),
> +	CABAC_ENTRY(94, -9, 92, -12, 104, -11, 104, -8, 93),
> +	CABAC_ENTRY(95, -8, 87, -9, 91, -11, 91, -10, 90),
> +	CABAC_ENTRY(96, -23, 126, -31, 127, -30, 127, -30, 127),
> +	CABAC_ENTRY(97, 5, 54, 3, 55, 0, 65, -1, 74),
> +	CABAC_ENTRY(98, 6, 60, 7, 56, -2, 79, -6, 97),
> +	CABAC_ENTRY(99, 6, 59, 7, 55, 0, 72, -7, 91),
> +	CABAC_ENTRY(100, 6, 69, 8, 61, -4, 92, -20, 127),
> +	CABAC_ENTRY(101, -1, 48, -3, 53, -6, 56, -4, 56),
> +	CABAC_ENTRY(102, 0, 68, 0, 68, 3, 68, -5, 82),
> +	CABAC_ENTRY(103, -4, 69, -7, 74, -8, 71, -7, 76),
> +	CABAC_ENTRY(104, -8, 88, -9, 88, -13, 98, -22, 125),
> +
> +	/* Table 9-19 – Values of variables m and n for ctxIdx from 105 to 165 */
> +	CABAC_ENTRY(105, -2, 85, -13, 103, -4, 86, -7, 93),
> +	CABAC_ENTRY(106, -6, 78, -13, 91, -12, 88, -11, 87),
> +	CABAC_ENTRY(107, -1, 75, -9, 89, -5, 82, -3, 77),
> +	CABAC_ENTRY(108, -7, 77, -14, 92, -3, 72, -5, 71),
> +	CABAC_ENTRY(109, 2, 54, -8, 76, -4, 67, -4, 63),
> +	CABAC_ENTRY(110, 5, 50, -12, 87, -8, 72, -4, 68),
> +	CABAC_ENTRY(111, -3, 68, -23, 110, -16, 89, -12, 84),
> +	CABAC_ENTRY(112, 1, 50, -24, 105, -9, 69, -7, 62),
> +	CABAC_ENTRY(113, 6, 42, -10, 78, -1, 59, -7, 65),
> +	CABAC_ENTRY(114, -4, 81, -20, 112, 5, 66, 8, 61),
> +	CABAC_ENTRY(115, 1, 63, -17, 99, 4, 57, 5, 56),
> +	CABAC_ENTRY(116, -4, 70, -78, 127, -4, 71, -2, 66),
> +	CABAC_ENTRY(117, 0, 67, -70, 127, -2, 71, 1, 64),
> +	CABAC_ENTRY(118, 2, 57, -50, 127, 2, 58, 0, 61),
> +	CABAC_ENTRY(119, -2, 76, -46, 127, -1, 74, -2, 78),
> +	CABAC_ENTRY(120, 11, 35, -4, 66, -4, 44, 1, 50),
> +	CABAC_ENTRY(121, 4, 64, -5, 78, -1, 69, 7, 52),
> +	CABAC_ENTRY(122, 1, 61, -4, 71, 0, 62, 10, 35),
> +	CABAC_ENTRY(123, 11, 35, -8, 72, -7, 51, 0, 44),
> +	CABAC_ENTRY(124, 18, 25, 2, 59, -4, 47, 11, 38),
> +	CABAC_ENTRY(125, 12, 24, -1, 55, -6, 42, 1, 45),
> +	CABAC_ENTRY(126, 13, 29, -7, 70, -3, 41, 0, 46),
> +	CABAC_ENTRY(127, 13, 36, -6, 75, -6, 53, 5, 44),
> +	CABAC_ENTRY(128, -10, 93, -8, 89, 8, 76, 31, 17),
> +	CABAC_ENTRY(129, -7, 73, -34, 119, -9, 78, 1, 51),
> +	CABAC_ENTRY(130, -2, 73, -3, 75, -11, 83, 7, 50),
> +	CABAC_ENTRY(131, 13, 46, 32, 20, 9, 52, 28, 19),
> +	CABAC_ENTRY(132, 9, 49, 30, 22, 0, 67, 16, 33),
> +	CABAC_ENTRY(133, -7, 100, -44, 127, -5, 90, 14, 62),
> +	CABAC_ENTRY(134, 9, 53, 0, 54, 1, 67, -13, 108),
> +	CABAC_ENTRY(135, 2, 53, -5, 61, -15, 72, -15, 100),
> +	CABAC_ENTRY(136, 5, 53, 0, 58, -5, 75, -13, 101),
> +	CABAC_ENTRY(137, -2, 61, -1, 60, -8, 80, -13, 91),
> +	CABAC_ENTRY(138, 0, 56, -3, 61, -21, 83, -12, 94),
> +	CABAC_ENTRY(139, 0, 56, -8, 67, -21, 64, -10, 88),
> +	CABAC_ENTRY(140, -13, 63, -25, 84, -13, 31, -16, 84),
> +	CABAC_ENTRY(141, -5, 60, -14, 74, -25, 64, -10, 86),
> +	CABAC_ENTRY(142, -1, 62, -5, 65, -29, 94, -7, 83),
> +	CABAC_ENTRY(143, 4, 57, 5, 52, 9, 75, -13, 87),
> +	CABAC_ENTRY(144, -6, 69, 2, 57, 17, 63, -19, 94),
> +	CABAC_ENTRY(145, 4, 57, 0, 61, -8, 74, 1, 70),
> +	CABAC_ENTRY(146, 14, 39, -9, 69, -5, 35, 0, 72),
> +	CABAC_ENTRY(147, 4, 51, -11, 70, -2, 27, -5, 74),
> +	CABAC_ENTRY(148, 13, 68, 18, 55, 13, 91, 18, 59),
> +	CABAC_ENTRY(149, 3, 64, -4, 71, 3, 65, -8, 102),
> +	CABAC_ENTRY(150, 1, 61, 0, 58, -7, 69, -15, 100),
> +	CABAC_ENTRY(151, 9, 63, 7, 61, 8, 77, 0, 95),
> +	CABAC_ENTRY(152, 7, 50, 9, 41, -10, 66, -4, 75),
> +	CABAC_ENTRY(153, 16, 39, 18, 25, 3, 62, 2, 72),
> +	CABAC_ENTRY(154, 5, 44, 9, 32, -3, 68, -11, 75),
> +	CABAC_ENTRY(155, 4, 52, 5, 43, -20, 81, -3, 71),
> +	CABAC_ENTRY(156, 11, 48, 9, 47, 0, 30, 15, 46),
> +	CABAC_ENTRY(157, -5, 60, 0, 44, 1, 7, -13, 69),
> +	CABAC_ENTRY(158, -1, 59, 0, 51, -3, 23, 0, 62),
> +	CABAC_ENTRY(159, 0, 59, 2, 46, -21, 74, 0, 65),
> +	CABAC_ENTRY(160, 22, 33, 19, 38, 16, 66, 21, 37),
> +	CABAC_ENTRY(161, 5, 44, -4, 66, -23, 124, -15, 72),
> +	CABAC_ENTRY(162, 14, 43, 15, 38, 17, 37, 9, 57),
> +	CABAC_ENTRY(163, -1, 78, 12, 42, 44, -18, 16, 54),
> +	CABAC_ENTRY(164, 0, 60, 9, 34, 50, -34, 0, 62),
> +	CABAC_ENTRY(165, 9, 69, 0, 89, -22, 127, 12, 72),
> +
> +	/* Table 9-20 – Values of variables m and n for ctxIdx from 166 to 226 */
> +	CABAC_ENTRY(166, 11, 28, 4, 45, 4, 39, 24, 0),
> +	CABAC_ENTRY(167, 2, 40, 10, 28, 0, 42, 15, 9),
> +	CABAC_ENTRY(168, 3, 44, 10, 31, 7, 34, 8, 25),
> +	CABAC_ENTRY(169, 0, 49, 33, -11, 11, 29, 13, 18),
> +	CABAC_ENTRY(170, 0, 46, 52, -43, 8, 31, 15, 9),
> +	CABAC_ENTRY(171, 2, 44, 18, 15, 6, 37, 13, 19),
> +	CABAC_ENTRY(172, 2, 51, 28, 0, 7, 42, 10, 37),
> +	CABAC_ENTRY(173, 0, 47, 35, -22, 3, 40, 12, 18),
> +	CABAC_ENTRY(174, 4, 39, 38, -25, 8, 33, 6, 29),
> +	CABAC_ENTRY(175, 2, 62, 34, 0, 13, 43, 20, 33),
> +	CABAC_ENTRY(176, 6, 46, 39, -18, 13, 36, 15, 30),
> +	CABAC_ENTRY(177, 0, 54, 32, -12, 4, 47, 4, 45),
> +	CABAC_ENTRY(178, 3, 54, 102, -94, 3, 55, 1, 58),
> +	CABAC_ENTRY(179, 2, 58, 0, 0, 2, 58, 0, 62),
> +	CABAC_ENTRY(180, 4, 63, 56, -15, 6, 60, 7, 61),
> +	CABAC_ENTRY(181, 6, 51, 33, -4, 8, 44, 12, 38),
> +	CABAC_ENTRY(182, 6, 57, 29, 10, 11, 44, 11, 45),
> +	CABAC_ENTRY(183, 7, 53, 37, -5, 14, 42, 15, 39),
> +	CABAC_ENTRY(184, 6, 52, 51, -29, 7, 48, 11, 42),
> +	CABAC_ENTRY(185, 6, 55, 39, -9, 4, 56, 13, 44),
> +	CABAC_ENTRY(186, 11, 45, 52, -34, 4, 52, 16, 45),
> +	CABAC_ENTRY(187, 14, 36, 69, -58, 13, 37, 12, 41),
> +	CABAC_ENTRY(188, 8, 53, 67, -63, 9, 49, 10, 49),
> +	CABAC_ENTRY(189, -1, 82, 44, -5, 19, 58, 30, 34),
> +	CABAC_ENTRY(190, 7, 55, 32, 7, 10, 48, 18, 42),
> +	CABAC_ENTRY(191, -3, 78, 55, -29, 12, 45, 10, 55),
> +	CABAC_ENTRY(192, 15, 46, 32, 1, 0, 69, 17, 51),
> +	CABAC_ENTRY(193, 22, 31, 0, 0, 20, 33, 17, 46),
> +	CABAC_ENTRY(194, -1, 84, 27, 36, 8, 63, 0, 89),
> +	CABAC_ENTRY(195, 25, 7, 33, -25, 35, -18, 26, -19),
> +	CABAC_ENTRY(196, 30, -7, 34, -30, 33, -25, 22, -17),
> +	CABAC_ENTRY(197, 28, 3, 36, -28, 28, -3, 26, -17),
> +	CABAC_ENTRY(198, 28, 4, 38, -28, 24, 10, 30, -25),
> +	CABAC_ENTRY(199, 32, 0, 38, -27, 27, 0, 28, -20),
> +	CABAC_ENTRY(200, 34, -1, 34, -18, 34, -14, 33, -23),
> +	CABAC_ENTRY(201, 30, 6, 35, -16, 52, -44, 37, -27),
> +	CABAC_ENTRY(202, 30, 6, 34, -14, 39, -24, 33, -23),
> +	CABAC_ENTRY(203, 32, 9, 32, -8, 19, 17, 40, -28),
> +	CABAC_ENTRY(204, 31, 19, 37, -6, 31, 25, 38, -17),
> +	CABAC_ENTRY(205, 26, 27, 35, 0, 36, 29, 33, -11),
> +	CABAC_ENTRY(206, 26, 30, 30, 10, 24, 33, 40, -15),
> +	CABAC_ENTRY(207, 37, 20, 28, 18, 34, 15, 41, -6),
> +	CABAC_ENTRY(208, 28, 34, 26, 25, 30, 20, 38, 1),
> +	CABAC_ENTRY(209, 17, 70, 29, 41, 22, 73, 41, 17),
> +	CABAC_ENTRY(210, 1, 67, 0, 75, 20, 34, 30, -6),
> +	CABAC_ENTRY(211, 5, 59, 2, 72, 19, 31, 27, 3),
> +	CABAC_ENTRY(212, 9, 67, 8, 77, 27, 44, 26, 22),
> +	CABAC_ENTRY(213, 16, 30, 14, 35, 19, 16, 37, -16),
> +	CABAC_ENTRY(214, 18, 32, 18, 31, 15, 36, 35, -4),
> +	CABAC_ENTRY(215, 18, 35, 17, 35, 15, 36, 38, -8),
> +	CABAC_ENTRY(216, 22, 29, 21, 30, 21, 28, 38, -3),
> +	CABAC_ENTRY(217, 24, 31, 17, 45, 25, 21, 37, 3),
> +	CABAC_ENTRY(218, 23, 38, 20, 42, 30, 20, 38, 5),
> +	CABAC_ENTRY(219, 18, 43, 18, 45, 31, 12, 42, 0),
> +	CABAC_ENTRY(220, 20, 41, 27, 26, 27, 16, 35, 16),
> +	CABAC_ENTRY(221, 11, 63, 16, 54, 24, 42, 39, 22),
> +	CABAC_ENTRY(222, 9, 59, 7, 66, 0, 93, 14, 48),
> +	CABAC_ENTRY(223, 9, 64, 16, 56, 14, 56, 27, 37),
> +	CABAC_ENTRY(224, -1, 94, 11, 73, 15, 57, 21, 60),
> +	CABAC_ENTRY(225, -2, 89, 10, 67, 26, 38, 12, 68),
> +	CABAC_ENTRY(226, -9, 108, -10, 116, -24, 127, 2, 97),
> +
> +	/* Table 9-21 – Values of variables m and n for ctxIdx from 227 to 275 */
> +	CABAC_ENTRY(227, -6, 76, -23, 112, -24, 115, -3, 71),
> +	CABAC_ENTRY(228, -2, 44, -15, 71, -22, 82, -6, 42),
> +	CABAC_ENTRY(229, 0, 45, -7, 61, -9, 62, -5, 50),
> +	CABAC_ENTRY(230, 0, 52, 0, 53, 0, 53, -3, 54),
> +	CABAC_ENTRY(231, -3, 64, -5, 66, 0, 59, -2, 62),
> +	CABAC_ENTRY(232, -2, 59, -11, 77, -14, 85, 0, 58),
> +	CABAC_ENTRY(233, -4, 70, -9, 80, -13, 89, 1, 63),
> +	CABAC_ENTRY(234, -4, 75, -9, 84, -13, 94, -2, 72),
> +	CABAC_ENTRY(235, -8, 82, -10, 87, -11, 92, -1, 74),
> +	CABAC_ENTRY(236, -17, 102, -34, 127, -29, 127, -9, 91),
> +	CABAC_ENTRY(237, -9, 77, -21, 101, -21, 100, -5, 67),
> +	CABAC_ENTRY(238, 3, 24, -3, 39, -14, 57, -5, 27),
> +	CABAC_ENTRY(239, 0, 42, -5, 53, -12, 67, -3, 39),
> +	CABAC_ENTRY(240, 0, 48, -7, 61, -11, 71, -2, 44),
> +	CABAC_ENTRY(241, 0, 55, -11, 75, -10, 77, 0, 46),
> +	CABAC_ENTRY(242, -6, 59, -15, 77, -21, 85, -16, 64),
> +	CABAC_ENTRY(243, -7, 71, -17, 91, -16, 88, -8, 68),
> +	CABAC_ENTRY(244, -12, 83, -25, 107, -23, 104, -10, 78),
> +	CABAC_ENTRY(245, -11, 87, -25, 111, -15, 98, -6, 77),
> +	CABAC_ENTRY(246, -30, 119, -28, 122, -37, 127, -10, 86),
> +	CABAC_ENTRY(247, 1, 58, -11, 76, -10, 82, -12, 92),
> +	CABAC_ENTRY(248, -3, 29, -10, 44, -8, 48, -15, 55),
> +	CABAC_ENTRY(249, -1, 36, -10, 52, -8, 61, -10, 60),
> +	CABAC_ENTRY(250, 1, 38, -10, 57, -8, 66, -6, 62),
> +	CABAC_ENTRY(251, 2, 43, -9, 58, -7, 70, -4, 65),
> +	CABAC_ENTRY(252, -6, 55, -16, 72, -14, 75, -12, 73),
> +	CABAC_ENTRY(253, 0, 58, -7, 69, -10, 79, -8, 76),
> +	CABAC_ENTRY(254, 0, 64, -4, 69, -9, 83, -7, 80),
> +	CABAC_ENTRY(255, -3, 74, -5, 74, -12, 92, -9, 88),
> +	CABAC_ENTRY(256, -10, 90, -9, 86, -18, 108, -17, 110),
> +	CABAC_ENTRY(257, 0, 70, 2, 66, -4, 79, -11, 97),
> +	CABAC_ENTRY(258, -4, 29, -9, 34, -22, 69, -20, 84),
> +	CABAC_ENTRY(259, 5, 31, 1, 32, -16, 75, -11, 79),
> +	CABAC_ENTRY(260, 7, 42, 11, 31, -2, 58, -6, 73),
> +	CABAC_ENTRY(261, 1, 59, 5, 52, 1, 58, -4, 74),
> +	CABAC_ENTRY(262, -2, 58, -2, 55, -13, 78, -13, 86),
> +	CABAC_ENTRY(263, -3, 72, -2, 67, -9, 83, -13, 96),
> +	CABAC_ENTRY(264, -3, 81, 0, 73, -4, 81, -11, 97),
> +	CABAC_ENTRY(265, -11, 97, -8, 89, -13, 99, -19, 117),
> +	CABAC_ENTRY(266, 0, 58, 3, 52, -13, 81, -8, 78),
> +	CABAC_ENTRY(267, 8, 5, 7, 4, -6, 38, -5, 33),
> +	CABAC_ENTRY(268, 10, 14, 10, 8, -13, 62, -4, 48),
> +	CABAC_ENTRY(269, 14, 18, 17, 8, -6, 58, -2, 53),
> +	CABAC_ENTRY(270, 13, 27, 16, 19, -2, 59, -3, 62),
> +	CABAC_ENTRY(271, 2, 40, 3, 37, -16, 73, -13, 71),
> +	CABAC_ENTRY(272, 0, 58, -1, 61, -10, 76, -10, 79),
> +	CABAC_ENTRY(273, -3, 70, -5, 73, -13, 86, -12, 86),
> +	CABAC_ENTRY(274, -6, 79, -1, 70, -9, 83, -13, 90),
> +	CABAC_ENTRY(275, -8, 85, -4, 78, -10, 87, -14, 97),
> +
> +	/* Table 9-22 – Values of variables m and n for ctxIdx from 277 to 337 */
> +	CABAC_ENTRY(277, -13, 106, -21, 126, -22, 127, -6, 93),
> +	CABAC_ENTRY(278, -16, 106, -23, 124, -25, 127, -6, 84),
> +	CABAC_ENTRY(279, -10, 87, -20, 110, -25, 120, -8, 79),
> +	CABAC_ENTRY(280, -21, 114, -26, 126, -27, 127, 0, 66),
> +	CABAC_ENTRY(281, -18, 110, -25, 124, -19, 114, -1, 71),
> +	CABAC_ENTRY(282, -14, 98, -17, 105, -23, 117, 0, 62),
> +	CABAC_ENTRY(283, -22, 110, -27, 121, -25, 118, -2, 60),
> +	CABAC_ENTRY(284, -21, 106, -27, 117, -26, 117, -2, 59),
> +	CABAC_ENTRY(285, -18, 103, -17, 102, -24, 113, -5, 75),
> +	CABAC_ENTRY(286, -21, 107, -26, 117, -28, 118, -3, 62),
> +	CABAC_ENTRY(287, -23, 108, -27, 116, -31, 120, -4, 58),
> +	CABAC_ENTRY(288, -26, 112, -33, 122, -37, 124, -9, 66),
> +	CABAC_ENTRY(289, -10, 96, -10, 95, -10, 94, -1, 79),
> +	CABAC_ENTRY(290, -12, 95, -14, 100, -15, 102, 0, 71),
> +	CABAC_ENTRY(291, -5, 91, -8, 95, -10, 99, 3, 68),
> +	CABAC_ENTRY(292, -9, 93, -17, 111, -13, 106, 10, 44),
> +	CABAC_ENTRY(293, -22, 94, -28, 114, -50, 127, -7, 62),
> +	CABAC_ENTRY(294, -5, 86, -6, 89, -5, 92, 15, 36),
> +	CABAC_ENTRY(295, 9, 67, -2, 80, 17, 57, 14, 40),
> +	CABAC_ENTRY(296, -4, 80, -4, 82, -5, 86, 16, 27),
> +	CABAC_ENTRY(297, -10, 85, -9, 85, -13, 94, 12, 29),
> +	CABAC_ENTRY(298, -1, 70, -8, 81, -12, 91, 1, 44),
> +	CABAC_ENTRY(299, 7, 60, -1, 72, -2, 77, 20, 36),
> +	CABAC_ENTRY(300, 9, 58, 5, 64, 0, 71, 18, 32),
> +	CABAC_ENTRY(301, 5, 61, 1, 67, -1, 73, 5, 42),
> +	CABAC_ENTRY(302, 12, 50, 9, 56, 4, 64, 1, 48),
> +	CABAC_ENTRY(303, 15, 50, 0, 69, -7, 81, 10, 62),
> +	CABAC_ENTRY(304, 18, 49, 1, 69, 5, 64, 17, 46),
> +	CABAC_ENTRY(305, 17, 54, 7, 69, 15, 57, 9, 64),
> +	CABAC_ENTRY(306, 10, 41, -7, 69, 1, 67, -12, 104),
> +	CABAC_ENTRY(307, 7, 46, -6, 67, 0, 68, -11, 97),
> +	CABAC_ENTRY(308, -1, 51, -16, 77, -10, 67, -16, 96),
> +	CABAC_ENTRY(309, 7, 49, -2, 64, 1, 68, -7, 88),
> +	CABAC_ENTRY(310, 8, 52, 2, 61, 0, 77, -8, 85),
> +	CABAC_ENTRY(311, 9, 41, -6, 67, 2, 64, -7, 85),
> +	CABAC_ENTRY(312, 6, 47, -3, 64, 0, 68, -9, 85),
> +	CABAC_ENTRY(313, 2, 55, 2, 57, -5, 78, -13, 88),
> +	CABAC_ENTRY(314, 13, 41, -3, 65, 7, 55, 4, 66),
> +	CABAC_ENTRY(315, 10, 44, -3, 66, 5, 59, -3, 77),
> +	CABAC_ENTRY(316, 6, 50, 0, 62, 2, 65, -3, 76),
> +	CABAC_ENTRY(317, 5, 53, 9, 51, 14, 54, -6, 76),
> +	CABAC_ENTRY(318, 13, 49, -1, 66, 15, 44, 10, 58),
> +	CABAC_ENTRY(319, 4, 63, -2, 71, 5, 60, -1, 76),
> +	CABAC_ENTRY(320, 6, 64, -2, 75, 2, 70, -1, 83),
> +	CABAC_ENTRY(321, -2, 69, -1, 70, -2, 76, -7, 99),
> +	CABAC_ENTRY(322, -2, 59, -9, 72, -18, 86, -14, 95),
> +	CABAC_ENTRY(323, 6, 70, 14, 60, 12, 70, 2, 95),
> +	CABAC_ENTRY(324, 10, 44, 16, 37, 5, 64, 0, 76),
> +	CABAC_ENTRY(325, 9, 31, 0, 47, -12, 70, -5, 74),
> +	CABAC_ENTRY(326, 12, 43, 18, 35, 11, 55, 0, 70),
> +	CABAC_ENTRY(327, 3, 53, 11, 37, 5, 56, -11, 75),
> +	CABAC_ENTRY(328, 14, 34, 12, 41, 0, 69, 1, 68),
> +	CABAC_ENTRY(329, 10, 38, 10, 41, 2, 65, 0, 65),
> +	CABAC_ENTRY(330, -3, 52, 2, 48, -6, 74, -14, 73),
> +	CABAC_ENTRY(331, 13, 40, 12, 41, 5, 54, 3, 62),
> +	CABAC_ENTRY(332, 17, 32, 13, 41, 7, 54, 4, 62),
> +	CABAC_ENTRY(333, 7, 44, 0, 59, -6, 76, -1, 68),
> +	CABAC_ENTRY(334, 7, 38, 3, 50, -11, 82, -13, 75),
> +	CABAC_ENTRY(335, 13, 50, 19, 40, -2, 77, 11, 55),
> +	CABAC_ENTRY(336, 10, 57, 3, 66, -2, 77, 5, 64),
> +	CABAC_ENTRY(337, 26, 43, 18, 50, 25, 42, 12, 70),
> +
> +	/* Table 9-23 – Values of variables m and n for ctxIdx from 338 to 398 */
> +	CABAC_ENTRY(338, 14, 11, 19, -6, 17, -13, 15, 6),
> +	CABAC_ENTRY(339, 11, 14, 18, -6, 16, -9, 6, 19),
> +	CABAC_ENTRY(340, 9, 11, 14, 0, 17, -12, 7, 16),
> +	CABAC_ENTRY(341, 18, 11, 26, -12, 27, -21, 12, 14),
> +	CABAC_ENTRY(342, 21, 9, 31, -16, 37, -30, 18, 13),
> +	CABAC_ENTRY(343, 23, -2, 33, -25, 41, -40, 13, 11),
> +	CABAC_ENTRY(344, 32, -15, 33, -22, 42, -41, 13, 15),
> +	CABAC_ENTRY(345, 32, -15, 37, -28, 48, -47, 15, 16),
> +	CABAC_ENTRY(346, 34, -21, 39, -30, 39, -32, 12, 23),
> +	CABAC_ENTRY(347, 39, -23, 42, -30, 46, -40, 13, 23),
> +	CABAC_ENTRY(348, 42, -33, 47, -42, 52, -51, 15, 20),
> +	CABAC_ENTRY(349, 41, -31, 45, -36, 46, -41, 14, 26),
> +	CABAC_ENTRY(350, 46, -28, 49, -34, 52, -39, 14, 44),
> +	CABAC_ENTRY(351, 38, -12, 41, -17, 43, -19, 17, 40),
> +	CABAC_ENTRY(352, 21, 29, 32, 9, 32, 11, 17, 47),
> +	CABAC_ENTRY(353, 45, -24, 69, -71, 61, -55, 24, 17),
> +	CABAC_ENTRY(354, 53, -45, 63, -63, 56, -46, 21, 21),
> +	CABAC_ENTRY(355, 48, -26, 66, -64, 62, -50, 25, 22),
> +	CABAC_ENTRY(356, 65, -43, 77, -74, 81, -67, 31, 27),
> +	CABAC_ENTRY(357, 43, -19, 54, -39, 45, -20, 22, 29),
> +	CABAC_ENTRY(358, 39, -10, 52, -35, 35, -2, 19, 35),
> +	CABAC_ENTRY(359, 30, 9, 41, -10, 28, 15, 14, 50),
> +	CABAC_ENTRY(360, 18, 26, 36, 0, 34, 1, 10, 57),
> +	CABAC_ENTRY(361, 20, 27, 40, -1, 39, 1, 7, 63),
> +	CABAC_ENTRY(362, 0, 57, 30, 14, 30, 17, -2, 77),
> +	CABAC_ENTRY(363, -14, 82, 28, 26, 20, 38, -4, 82),
> +	CABAC_ENTRY(364, -5, 75, 23, 37, 18, 45, -3, 94),
> +	CABAC_ENTRY(365, -19, 97, 12, 55, 15, 54, 9, 69),
> +	CABAC_ENTRY(366, -35, 125, 11, 65, 0, 79, -12, 109),
> +	CABAC_ENTRY(367, 27, 0, 37, -33, 36, -16, 36, -35),
> +	CABAC_ENTRY(368, 28, 0, 39, -36, 37, -14, 36, -34),
> +	CABAC_ENTRY(369, 31, -4, 40, -37, 37, -17, 32, -26),
> +	CABAC_ENTRY(370, 27, 6, 38, -30, 32, 1, 37, -30),
> +	CABAC_ENTRY(371, 34, 8, 46, -33, 34, 15, 44, -32),
> +	CABAC_ENTRY(372, 30, 10, 42, -30, 29, 15, 34, -18),
> +	CABAC_ENTRY(373, 24, 22, 40, -24, 24, 25, 34, -15),
> +	CABAC_ENTRY(374, 33, 19, 49, -29, 34, 22, 40, -15),
> +	CABAC_ENTRY(375, 22, 32, 38, -12, 31, 16, 33, -7),
> +	CABAC_ENTRY(376, 26, 31, 40, -10, 35, 18, 35, -5),
> +	CABAC_ENTRY(377, 21, 41, 38, -3, 31, 28, 33, 0),
> +	CABAC_ENTRY(378, 26, 44, 46, -5, 33, 41, 38, 2),
> +	CABAC_ENTRY(379, 23, 47, 31, 20, 36, 28, 33, 13),
> +	CABAC_ENTRY(380, 16, 65, 29, 30, 27, 47, 23, 35),
> +	CABAC_ENTRY(381, 14, 71, 25, 44, 21, 62, 13, 58),
> +	CABAC_ENTRY(382, 8, 60, 12, 48, 18, 31, 29, -3),
> +	CABAC_ENTRY(383, 6, 63, 11, 49, 19, 26, 26, 0),
> +	CABAC_ENTRY(384, 17, 65, 26, 45, 36, 24, 22, 30),
> +	CABAC_ENTRY(385, 21, 24, 22, 22, 24, 23, 31, -7),
> +	CABAC_ENTRY(386, 23, 20, 23, 22, 27, 16, 35, -15),
> +	CABAC_ENTRY(387, 26, 23, 27, 21, 24, 30, 34, -3),
> +	CABAC_ENTRY(388, 27, 32, 33, 20, 31, 29, 34, 3),
> +	CABAC_ENTRY(389, 28, 23, 26, 28, 22, 41, 36, -1),
> +	CABAC_ENTRY(390, 28, 24, 30, 24, 22, 42, 34, 5),
> +	CABAC_ENTRY(391, 23, 40, 27, 34, 16, 60, 32, 11),
> +	CABAC_ENTRY(392, 24, 32, 18, 42, 15, 52, 35, 5),
> +	CABAC_ENTRY(393, 28, 29, 25, 39, 14, 60, 34, 12),
> +	CABAC_ENTRY(394, 23, 42, 18, 50, 3, 78, 39, 11),
> +	CABAC_ENTRY(395, 19, 57, 12, 70, -16, 123, 30, 29),
> +	CABAC_ENTRY(396, 22, 53, 21, 54, 21, 53, 34, 26),
> +	CABAC_ENTRY(397, 22, 61, 14, 71, 22, 56, 29, 39),
> +	CABAC_ENTRY(398, 11, 86, 11, 83, 25, 61, 19, 66),
> +
> +	/* Values of variables m and n for ctxIdx from 399 to 463 (not documented) */
> +	CABAC_ENTRY(399, 12, 40, 25, 32, 21, 33, 31, 21),
> +	CABAC_ENTRY(400, 11, 51, 21, 49, 19, 50, 31, 31),
> +	CABAC_ENTRY(401, 14, 59, 21, 54, 17, 61, 25, 50),
> +	CABAC_ENTRY(402, -4, 79, -5, 85, -3, 78, -17, 120),
> +	CABAC_ENTRY(403, -7, 71, -6, 81, -8, 74, -20, 112),
> +	CABAC_ENTRY(404, -5, 69, -10, 77, -9, 72, -18, 114),
> +	CABAC_ENTRY(405, -9, 70, -7, 81, -10, 72, -11, 85),
> +	CABAC_ENTRY(406, -8, 66, -17, 80, -18, 75, -15, 92),
> +	CABAC_ENTRY(407, -10, 68, -18, 73, -12, 71, -14, 89),
> +	CABAC_ENTRY(408, -19, 73, -4, 74, -11, 63, -26, 71),
> +	CABAC_ENTRY(409, -12, 69, -10, 83, -5, 70, -15, 81),
> +	CABAC_ENTRY(410, -16, 70, -9, 71, -17, 75, -14, 80),
> +	CABAC_ENTRY(411, -15, 67, -9, 67, -14, 72, 0, 68),
> +	CABAC_ENTRY(412, -20, 62, -1, 61, -16, 67, -14, 70),
> +	CABAC_ENTRY(413, -19, 70, -8, 66, -8, 53, -24, 56),
> +	CABAC_ENTRY(414, -16, 66, -14, 66, -14, 59, -23, 68),
> +	CABAC_ENTRY(415, -22, 65, 0, 59, -9, 52, -24, 50),
> +	CABAC_ENTRY(416, -20, 63, 2, 59, -11, 68, -11, 74),
> +	CABAC_ENTRY(417, 9, -2, 17, -10, 9, -2, 23, -13),
> +	CABAC_ENTRY(418, 26, -9, 32, -13, 30, -10, 26, -13),
> +	CABAC_ENTRY(419, 33, -9, 42, -9, 31, -4, 40, -15),
> +	CABAC_ENTRY(420, 39, -7, 49, -5, 33, -1, 49, -14),
> +	CABAC_ENTRY(421, 41, -2, 53, 0, 33, 7, 44, 3),
> +	CABAC_ENTRY(422, 45, 3, 64, 3, 31, 12, 45, 6),
> +	CABAC_ENTRY(423, 49, 9, 68, 10, 37, 23, 44, 34),
> +	CABAC_ENTRY(424, 45, 27, 66, 27, 31, 38, 33, 54),
> +	CABAC_ENTRY(425, 36, 59, 47, 57, 20, 64, 19, 82),
> +	CABAC_ENTRY(426, -6, 66, -5, 71, -9, 71, -3, 75),
> +	CABAC_ENTRY(427, -7, 35, 0, 24, -7, 37, -1, 23),
> +	CABAC_ENTRY(428, -7, 42, -1, 36, -8, 44, 1, 34),
> +	CABAC_ENTRY(429, -8, 45, -2, 42, -11, 49, 1, 43),
> +	CABAC_ENTRY(430, -5, 48, -2, 52, -10, 56, 0, 54),
> +	CABAC_ENTRY(431, -12, 56, -9, 57, -12, 59, -2, 55),
> +	CABAC_ENTRY(432, -6, 60, -6, 63, -8, 63, 0, 61),
> +	CABAC_ENTRY(433, -5, 62, -4, 65, -9, 67, 1, 64),
> +	CABAC_ENTRY(434, -8, 66, -4, 67, -6, 68, 0, 68),
> +	CABAC_ENTRY(435, -8, 76, -7, 82, -10, 79, -9, 92),
> +	CABAC_ENTRY(436, -5, 85, -3, 81, -3, 78, -14, 106),
> +	CABAC_ENTRY(437, -6, 81, -3, 76, -8, 74, -13, 97),
> +	CABAC_ENTRY(438, -10, 77, -7, 72, -9, 72, -15, 90),
> +	CABAC_ENTRY(439, -7, 81, -6, 78, -10, 72, -12, 90),
> +	CABAC_ENTRY(440, -17, 80, -12, 72, -18, 75, -18, 88),
> +	CABAC_ENTRY(441, -18, 73, -14, 68, -12, 71, -10, 73),
> +	CABAC_ENTRY(442, -4, 74, -3, 70, -11, 63, -9, 79),
> +	CABAC_ENTRY(443, -10, 83, -6, 76, -5, 70, -14, 86),
> +	CABAC_ENTRY(444, -9, 71, -5, 66, -17, 75, -10, 73),
> +	CABAC_ENTRY(445, -9, 67, -5, 62, -14, 72, -10, 70),
> +	CABAC_ENTRY(446, -1, 61, 0, 57, -16, 67, -10, 69),
> +	CABAC_ENTRY(447, -8, 66, -4, 61, -8, 53, -5, 66),
> +	CABAC_ENTRY(448, -14, 66, -9, 60, -14, 59, -9, 64),
> +	CABAC_ENTRY(449, 0, 59, 1, 54, -9, 52, -5, 58),
> +	CABAC_ENTRY(450, 2, 59, 2, 58, -11, 68, 2, 59),
> +	CABAC_ENTRY(451, 21, -13, 17, -10, 9, -2, 21, -10),
> +	CABAC_ENTRY(452, 33, -14, 32, -13, 30, -10, 24, -11),
> +	CABAC_ENTRY(453, 39, -7, 42, -9, 31, -4, 28, -8),
> +	CABAC_ENTRY(454, 46, -2, 49, -5, 33, -1, 28, -1),
> +	CABAC_ENTRY(455, 51, 2, 53, 0, 33, 7, 29, 3),
> +	CABAC_ENTRY(456, 60, 6, 64, 3, 31, 12, 29, 9),
> +	CABAC_ENTRY(457, 61, 17, 68, 10, 37, 23, 35, 20),
> +	CABAC_ENTRY(458, 55, 34, 66, 27, 31, 38, 29, 36),
> +	CABAC_ENTRY(459, 42, 62, 47, 57, 20, 64, 14, 67),
> +};
> +
> +static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
> +{
> +	u8 bit = field.offset % 32, word = field.offset / 32;
> +	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
> +	u64 val = ((u64)value << bit) & mask;
> +
> +	buf[word] &= ~mask;
> +	buf[word] |= val;
> +	if (bit + field.len > 32) {
> +		buf[word + 1] &= ~(mask >> 32);
> +		buf[word + 1] |= val >> 32;
> +	}
> +}
> +
> +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> +			    struct rkvdec_h264_run *run)
> +{
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> +	const struct v4l2_ctrl_h264_pps *pps = run->pps;
> +	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> +	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> +	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> +	struct rkvdec_sps_pps_packet *hw_ps;
> +	dma_addr_t scaling_list_address;
> +	u32 scaling_distance;
> +	u32 i;
> +

> +	/*
> +	 * HW read the SPS/PPS informantion from PPS packet index by PPS id.

s/informantion/information

> +	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
> +	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
> +	 * packet unit for HW accessing.
> +	 */
> +	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
> +	memset(hw_ps, 0, sizeof(*hw_ps));
> +
> +#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
> +	/* write sps */
> +	WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
> +	WRITE_PPS(0xff, PROFILE_IDC);
> +	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
> +	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
> +	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
> +	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
> +	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
> +	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
> +	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
> +	WRITE_PPS(sps->pic_order_cnt_type, PIC_ORDER_CNT_TYPE);
> +	WRITE_PPS(sps->log2_max_pic_order_cnt_lsb_minus4,
> +		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
> +	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
> +		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
> +	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
> +	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
> +	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
> +		  FRAME_MBS_ONLY_FLAG);
> +	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
> +		  MB_ADAPTIVE_FRAME_FIELD_FLAG);
> +	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE),
> +		  DIRECT_8X8_INFERENCE_FLAG);
> +
> +	/* write pps */
> +	WRITE_PPS(0xff, PIC_PARAMETER_SET_ID);
> +	WRITE_PPS(0x1f, PPS_SEQ_PARAMETER_SET_ID);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE),
> +		  ENTROPY_CODING_MODE_FLAG);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT),
> +		  BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG);
> +	WRITE_PPS(pps->num_ref_idx_l0_default_active_minus1,
> +		  NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(0));
> +	WRITE_PPS(pps->num_ref_idx_l1_default_active_minus1,
> +		  NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(1));
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED),
> +		  WEIGHTED_PRED_FLAG);
> +	WRITE_PPS(pps->weighted_bipred_idc, WEIGHTED_BIPRED_IDC);
> +	WRITE_PPS(pps->pic_init_qp_minus26, PIC_INIT_QP_MINUS26);
> +	WRITE_PPS(pps->pic_init_qs_minus26, PIC_INIT_QS_MINUS26);
> +	WRITE_PPS(pps->chroma_qp_index_offset, CHROMA_QP_INDEX_OFFSET);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT),
> +		  DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED),
> +		  CONSTRAINED_INTRA_PRED_FLAG);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT),
> +		  REDUNDANT_PIC_CNT_PRESENT);
> +	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE),
> +		  TRANSFORM_8X8_MODE_FLAG);
> +	WRITE_PPS(pps->second_chroma_qp_index_offset,
> +		  SECOND_CHROMA_QP_INDEX_OFFSET);
> +
> +	/* always use the matrix sent from userspace */
> +	WRITE_PPS(1, SCALING_LIST_ENABLE_FLAG);
> +
> +	scaling_distance = offsetof(struct rkvdec_h264_priv_tbl, scaling_list);
> +	scaling_list_address = h264_ctx->priv_tbl.dma + scaling_distance;
> +	WRITE_PPS(scaling_list_address, SCALING_LIST_ADDRESS);
> +
> +	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		u32 is_longterm = 0;
> +
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +			is_longterm = 1;
> +
> +		WRITE_PPS(is_longterm, IS_LONG_TERM(i));
> +	}
> +}
> +
> +static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> +			    struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> +	const struct v4l2_ctrl_h264_slice_params *sl_params = &run->slices_params[0];
> +	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> +	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> +	u32 max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
> +
> +	u32 *hw_rps = priv_tbl->rps;
> +	u32 i, j;
> +	u16 *p = (u16 *)hw_rps;
> +
> +	memset(hw_rps, 0, sizeof(priv_tbl->rps));
> +
> +	/*
> +	 * Assign an invalid pic_num if DPB entry at that position is inactive.
> +	 * If we assign 0 in that position hardware will treat that as a real
> +	 * reference picture with pic_num 0, triggering output picture
> +	 * corruption.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +			continue;
> +
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> +		    dpb[i].frame_num < sl_params->frame_num) {
> +			p[i] = dpb[i].frame_num;
> +			continue;
> +		}
> +
> +		p[i] = dpb[i].frame_num - max_frame_num;
> +	}
> +
> +	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
> +		for (i = 0; i < h264_ctx->reflists.num_valid; i++) {
> +			u8 dpb_valid = 0;
> +			u8 idx = 0;
> +
> +			switch (j) {
> +			case 0:
> +				idx = h264_ctx->reflists.p[i];
> +				break;
> +			case 1:
> +				idx = h264_ctx->reflists.b0[i];
> +				break;
> +			case 2:
> +				idx = h264_ctx->reflists.b1[i];
> +				break;
> +			}
> +
> +			if (idx >= ARRAY_SIZE(dec_params->dpb))
> +				continue;
> +			dpb_valid = !!(dpb[idx].flags &
> +				       V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
> +
> +			set_ps_field(hw_rps, DPB_INFO(i, j),
> +				     idx | dpb_valid << 4);
> +		}
> +	}
> +}
> +
> +/*
> + * NOTE: The values in a scaling list are in zig-zag order, apply inverse
> + * scanning process to get the values in matrix order.
> + */
> +static const u32 zig_zag_4x4[16] = {
> +	0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15
> +};
> +
> +static const u32 zig_zag_8x8[64] = {
> +	0,  1,  8, 16,  9,  2,  3, 10, 17, 24, 32, 25, 18, 11,  4,  5,
> +	12, 19, 26, 33, 40, 48, 41, 34, 27, 20, 13,  6,  7, 14, 21, 28,
> +	35, 42, 49, 56, 57, 50, 43, 36, 29, 22, 15, 23, 30, 37, 44, 51,
> +	58, 59, 52, 45, 38, 31, 39, 46, 53, 60, 61, 54, 47, 55, 62, 63
> +};
> +
> +static void reorder_scaling_list(struct rkvdec_ctx *ctx,
> +				 struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
> +	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
> +	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
> +	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
> +	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
> +	u8 *dst = tbl->scaling_list;
> +	const u8 *src;
> +	int i, j;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
> +	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
> +	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) <
> +		     num_list_4x4 * list_len_4x4 +
> +		     num_list_8x8 * list_len_8x8);
> +
> +	src = &scaling->scaling_list_4x4[0][0];
> +	for (i = 0; i < num_list_4x4; ++i) {
> +		for (j = 0; j < list_len_4x4; ++j)
> +			dst[zig_zag_4x4[j]] = src[j];
> +		src += list_len_4x4;
> +		dst += list_len_4x4;
> +	}
> +
> +	src = &scaling->scaling_list_8x8[0][0];
> +	for (i = 0; i < num_list_8x8; ++i) {
> +		for (j = 0; j < list_len_8x8; ++j)
> +			dst[zig_zag_8x8[j]] = src[j];
> +		src += list_len_8x8;
> +		dst += list_len_8x8;
> +	}
> +}
> +
> +/*
> + * dpb poc related registers table
> + */
> +static const u32 poc_reg_tbl_top_field[16] = {
> +	RKVDEC_REG_H264_POC_REFER0(0),
> +	RKVDEC_REG_H264_POC_REFER0(2),
> +	RKVDEC_REG_H264_POC_REFER0(4),
> +	RKVDEC_REG_H264_POC_REFER0(6),
> +	RKVDEC_REG_H264_POC_REFER0(8),
> +	RKVDEC_REG_H264_POC_REFER0(10),
> +	RKVDEC_REG_H264_POC_REFER0(12),
> +	RKVDEC_REG_H264_POC_REFER0(14),
> +	RKVDEC_REG_H264_POC_REFER1(1),
> +	RKVDEC_REG_H264_POC_REFER1(3),
> +	RKVDEC_REG_H264_POC_REFER1(5),
> +	RKVDEC_REG_H264_POC_REFER1(7),
> +	RKVDEC_REG_H264_POC_REFER1(9),
> +	RKVDEC_REG_H264_POC_REFER1(11),
> +	RKVDEC_REG_H264_POC_REFER1(13),
> +	RKVDEC_REG_H264_POC_REFER2(0)
> +};
> +
> +static const u32 poc_reg_tbl_bottom_field[16] = {
> +	RKVDEC_REG_H264_POC_REFER0(1),
> +	RKVDEC_REG_H264_POC_REFER0(3),
> +	RKVDEC_REG_H264_POC_REFER0(5),
> +	RKVDEC_REG_H264_POC_REFER0(7),
> +	RKVDEC_REG_H264_POC_REFER0(9),
> +	RKVDEC_REG_H264_POC_REFER0(11),
> +	RKVDEC_REG_H264_POC_REFER0(13),
> +	RKVDEC_REG_H264_POC_REFER1(0),
> +	RKVDEC_REG_H264_POC_REFER1(2),
> +	RKVDEC_REG_H264_POC_REFER1(4),
> +	RKVDEC_REG_H264_POC_REFER1(6),
> +	RKVDEC_REG_H264_POC_REFER1(8),
> +	RKVDEC_REG_H264_POC_REFER1(10),
> +	RKVDEC_REG_H264_POC_REFER1(12),
> +	RKVDEC_REG_H264_POC_REFER1(14),
> +	RKVDEC_REG_H264_POC_REFER2(1)
> +};
> +
> +static struct vb2_buffer *
> +get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run,
> +	    unsigned int dpb_idx)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
> +	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> +	int buf_idx = -1;
> +
> +	if (dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> +		buf_idx = vb2_find_timestamp(cap_q,
> +					     dpb[dpb_idx].reference_ts, 0);
> +
> +	/*
> +	 * If a DPB entry is unused or invalid, address of current destination
> +	 * buffer is returned.
> +	 */
> +	if (buf_idx < 0)
> +		return &run->base.bufs.dst->vb2_buf;
> +
> +	return vb2_get_buffer(cap_q, buf_idx);
> +}
> +
> +static void config_registers(struct rkvdec_ctx *ctx,
> +			     struct rkvdec_h264_run *run)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> +	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> +	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	dma_addr_t priv_start_addr = h264_ctx->priv_tbl.dma;
> +	const struct v4l2_pix_format_mplane *dst_fmt;
> +	struct vb2_v4l2_buffer *src_buf = run->base.bufs.src;
> +	struct vb2_v4l2_buffer *dst_buf = run->base.bufs.dst;
> +	const struct v4l2_format *f;
> +	dma_addr_t rlc_addr;
> +	dma_addr_t refer_addr;
> +	u32 rlc_len;
> +	u32 hor_virstride = 0;
> +	u32 ver_virstride = 0;
> +	u32 y_virstride = 0;
> +	u32 yuv_virstride = 0;
> +	u32 offset;
> +	dma_addr_t dst_addr;
> +	u32 reg, i;
> +
> +	reg = RKVDEC_MODE(RKVDEC_MODE_H264);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_SYSCTRL);
> +
> +	f = &ctx->decoded_fmt;
> +	dst_fmt = &f->fmt.pix_mp;
> +	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
> +	ver_virstride = round_up(dst_fmt->height, 16);
> +	y_virstride = hor_virstride * ver_virstride;
> +
> +	if (sps->chroma_format_idc == 0)
> +		yuv_virstride = y_virstride;
> +	else if (sps->chroma_format_idc == 1)
> +		yuv_virstride += y_virstride + y_virstride / 2;
> +	else if (sps->chroma_format_idc == 2)
> +		yuv_virstride += 2 * y_virstride;
> +
> +	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
> +	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
> +	      RKVDEC_SLICE_NUM_HIGHBIT |
> +	      RKVDEC_SLICE_NUM_LOWBITS(0x7ff);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_PICPAR);
> +
> +	/* config rlc base address */
> +	rlc_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_STRM_RLC_BASE);
> +	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_RLCWRITE_BASE);
> +
> +	rlc_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +	reg = RKVDEC_STRM_LEN(rlc_len);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_STRM_LEN);
> +
> +	/* config cabac table */
> +	offset = offsetof(struct rkvdec_h264_priv_tbl, cabac_table);
> +	writel_relaxed(priv_start_addr + offset,
> +		       rkvdec->regs + RKVDEC_REG_CABACTBL_PROB_BASE);
> +
> +	/* config output base address */
> +	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	writel_relaxed(dst_addr, rkvdec->regs + RKVDEC_REG_DECOUT_BASE);
> +
> +	reg = RKVDEC_Y_VIRSTRIDE(y_virstride / 16);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_Y_VIRSTRIDE);
> +
> +	reg = RKVDEC_YUV_VIRSTRIDE(yuv_virstride / 16);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_YUV_VIRSTRIDE);
> +
> +	/* config ref pic address & poc */
> +	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
> +
> +		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0) |
> +			     RKVDEC_COLMV_USED_FLAG_REF;
> +
> +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> +			refer_addr |= RKVDEC_TOPFIELD_USED_REF |
> +				      RKVDEC_BOTFIELD_USED_REF;
> +		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> +			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
> +		else
> +			refer_addr |= RKVDEC_TOPFIELD_USED_REF;
> +
> +		writel_relaxed(dpb[i].top_field_order_cnt,
> +			       rkvdec->regs +  poc_reg_tbl_top_field[i]);
> +		writel_relaxed(dpb[i].bottom_field_order_cnt,
> +			       rkvdec->regs + poc_reg_tbl_bottom_field[i]);
> +
> +		if (i < V4L2_H264_NUM_DPB_ENTRIES - 1)
> +			writel_relaxed(refer_addr,
> +				       rkvdec->regs + RKVDEC_REG_H264_BASE_REFER(i));
> +		else
> +			writel_relaxed(refer_addr,
> +				       rkvdec->regs + RKVDEC_REG_H264_BASE_REFER15);
> +	}
> +
> +	/*
> +	 * Since support frame mode only
> +	 * top_field_order_cnt is the same as bottom_field_order_cnt
> +	 */
> +	reg = RKVDEC_CUR_POC(dec_params->top_field_order_cnt);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC0);
> +
> +	reg = RKVDEC_CUR_POC(dec_params->bottom_field_order_cnt);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC1);
> +
> +	/* config hw pps address */
> +	offset = offsetof(struct rkvdec_h264_priv_tbl, param_set);
> +	writel_relaxed(priv_start_addr + offset,
> +		       rkvdec->regs + RKVDEC_REG_PPS_BASE);
> +
> +	/* config hw rps address */
> +	offset = offsetof(struct rkvdec_h264_priv_tbl, rps);
> +	writel_relaxed(priv_start_addr + offset,
> +		       rkvdec->regs + RKVDEC_REG_RPS_BASE);
> +
> +	reg = RKVDEC_AXI_DDR_RDATA(0);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_RDATA);
> +
> +	reg = RKVDEC_AXI_DDR_WDATA(0);
> +	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_WDATA);
> +
> +	offset = offsetof(struct rkvdec_h264_priv_tbl, err_info);
> +	writel_relaxed(priv_start_addr + offset,
> +		       rkvdec->regs + RKVDEC_REG_H264_ERRINFO_BASE);
> +}
> +
> +#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
> +
> +static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
> +				  struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
> +
> +	fmt->num_planes = 1;
> +	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> +				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> +	return 0;
> +}
> +
> +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	struct rkvdec_h264_priv_tbl *priv_tbl;
> +	struct rkvdec_h264_ctx *h264_ctx;
> +	int ret;
> +
> +	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
> +	if (!priv_tbl) {
> +		ret = -ENOMEM;
> +		goto err_free_ctx;
> +	}
> +
> +	h264_ctx->priv_tbl.size = sizeof(*priv_tbl);
> +	h264_ctx->priv_tbl.cpu = priv_tbl;
> +	memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
> +	       sizeof(rkvdec_h264_cabac_table));
> +
> +	ctx->priv = h264_ctx;
> +	return 0;
> +
> +err_free_ctx:
> +	kfree(ctx);

is it h264_ctx that should be freed? 

> +	return ret;

maybe just return -ENOMEM here? you can then get rid of ret stack variable 

> +}
> +
> +static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +
> +	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
> +	kfree(h264_ctx);
> +}
> +
> +static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
> +				     struct rkvdec_h264_run *run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
> +	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
> +	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_MPEG_VIDEO_H264_SPS);
> +	run->sps = ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_MPEG_VIDEO_H264_PPS);
> +	run->pps = ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
> +	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
> +
> +	rkvdec_run_preamble(ctx, &run->base);
> +}
> +
> +static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> +{
> +	struct v4l2_h264_reflist_builder reflist_builder;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	struct rkvdec_h264_run run;
> +
> +	rkvdec_h264_run_preamble(ctx, &run);
> +
> +	/* Build the P/B{0,1} ref lists. */
> +	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> +				       &run.slices_params[0], run.sps,
> +				       run.decode_params->dpb);
> +	h264_ctx->reflists.num_valid = reflist_builder.num_valid;
> +	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> +	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> +				    h264_ctx->reflists.b1);
> +
> +	reorder_scaling_list(ctx, &run);
> +	assemble_hw_pps(ctx, &run);
> +	assemble_hw_rps(ctx, &run);
> +	config_registers(ctx, &run);
> +
> +	rkvdec_run_postamble(ctx, &run.base);
> +
> +	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
> +
> +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> +	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> +	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> +
> +	/* Start decoding! */
> +	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> +	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> +	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +
> +	return 0;
> +}
> +
> +const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
> +	.adjust_fmt = rkvdec_h264_adjust_fmt,
> +	.start = rkvdec_h264_start,
> +	.stop = rkvdec_h264_stop,
> +	.run = rkvdec_h264_run,
> +};
> diff --git a/drivers/staging/media/rkvdec/rkvdec-regs.h b/drivers/staging/media/rkvdec/rkvdec-regs.h
> new file mode 100644
> index 000000000000..15b9bee92016
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec-regs.h
> @@ -0,0 +1,223 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef RKVDEC_REGS_H_
> +#define RKVDEC_REGS_H_
> +
> +/* rkvcodec registers */
> +#define RKVDEC_REG_INTERRUPT				0x004
> +#define RKVDEC_INTERRUPT_DEC_E				BIT(0)
> +#define RKVDEC_CONFIG_DEC_CLK_GATE_E			BIT(1)
> +#define RKVDEC_E_STRMD_CLKGATE_DIS			BIT(2)
> +#define RKVDEC_TIMEOUT_MODE				BIT(3)
> +#define RKVDEC_IRQ_DIS					BIT(4)
> +#define RKVDEC_TIMEOUT_E				BIT(5)
> +#define RKVDEC_BUF_EMPTY_E				BIT(6)
> +#define RKVDEC_STRM_E_WAITDECFIFO_EMPTY			BIT(7)
> +#define RKVDEC_IRQ					BIT(8)
> +#define RKVDEC_IRQ_RAW					BIT(9)
> +#define RKVDEC_E_REWRITE_VALID				BIT(10)
> +#define RKVDEC_COMMONIRQ_MODE				BIT(11)
> +#define RKVDEC_RDY_STA					BIT(12)
> +#define RKVDEC_BUS_STA					BIT(13)
> +#define RKVDEC_ERR_STA					BIT(14)
> +#define RKVDEC_TIMEOUT_STA				BIT(15)
> +#define RKVDEC_BUF_EMPTY_STA				BIT(16)
> +#define RKVDEC_COLMV_REF_ERR_STA			BIT(17)
> +#define RKVDEC_CABU_END_STA				BIT(18)
> +#define RKVDEC_H264ORVP9_ERR_MODE			BIT(19)
> +#define RKVDEC_SOFTRST_EN_P				BIT(20)
> +#define RKVDEC_FORCE_SOFTRESET_VALID			BIT(21)
> +#define RKVDEC_SOFTRESET_RDY				BIT(22)
> +
> +#define RKVDEC_REG_SYSCTRL				0x008
> +#define RKVDEC_IN_ENDIAN				BIT(0)
> +#define RKVDEC_IN_SWAP32_E				BIT(1)
> +#define RKVDEC_IN_SWAP64_E				BIT(2)
> +#define RKVDEC_STR_ENDIAN				BIT(3)
> +#define RKVDEC_STR_SWAP32_E				BIT(4)
> +#define RKVDEC_STR_SWAP64_E				BIT(5)
> +#define RKVDEC_OUT_ENDIAN				BIT(6)
> +#define RKVDEC_OUT_SWAP32_E				BIT(7)
> +#define RKVDEC_OUT_CBCR_SWAP				BIT(8)
> +#define RKVDEC_RLC_MODE_DIRECT_WRITE			BIT(10)
> +#define RKVDEC_RLC_MODE					BIT(11)
> +#define RKVDEC_STRM_START_BIT(x)			(((x) & 0x7f) << 12)
> +#define RKVDEC_MODE(x)					(((x) & 0x03) << 20)
> +#define RKVDEC_MODE_H264				1
> +#define RKVDEC_MODE_VP9					2
> +#define RKVDEC_RPS_MODE					BIT(24)
> +#define RKVDEC_STRM_MODE				BIT(25)
> +#define RKVDEC_H264_STRM_LASTPKT			BIT(26)
> +#define RKVDEC_H264_FIRSTSLICE_FLAG			BIT(27)
> +#define RKVDEC_H264_FRAME_ORSLICE			BIT(28)
> +#define RKVDEC_BUSPR_SLOT_DIS				BIT(29)
> +
> +#define RKVDEC_REG_PICPAR				0x00C
> +#define RKVDEC_Y_HOR_VIRSTRIDE(x)			((x) & 0x1ff)
> +#define RKVDEC_SLICE_NUM_HIGHBIT			BIT(11)
> +#define RKVDEC_UV_HOR_VIRSTRIDE(x)			(((x) & 0x1ff) << 12)
> +#define RKVDEC_SLICE_NUM_LOWBITS(x)			(((x) & 0x7ff) << 21)
> +
> +#define RKVDEC_REG_STRM_RLC_BASE			0x010
> +
> +#define RKVDEC_REG_STRM_LEN				0x014
> +#define RKVDEC_STRM_LEN(x)				((x) & 0x7ffffff)
> +
> +#define RKVDEC_REG_CABACTBL_PROB_BASE			0x018
> +#define RKVDEC_REG_DECOUT_BASE				0x01C
> +
> +#define RKVDEC_REG_Y_VIRSTRIDE				0x020
> +#define RKVDEC_Y_VIRSTRIDE(x)				((x) & 0xfffff)
> +
> +#define RKVDEC_REG_YUV_VIRSTRIDE			0x024
> +#define RKVDEC_YUV_VIRSTRIDE(x)				((x) & 0x1fffff)
> +#define RKVDEC_REG_H264_BASE_REFER(i)			(((i) * 0x04) + 0x028)
> +
> +#define RKVDEC_REG_H264_BASE_REFER15			0x0C0
> +#define RKVDEC_FIELD_REF				BIT(0)
> +#define RKVDEC_TOPFIELD_USED_REF			BIT(1)
> +#define RKVDEC_BOTFIELD_USED_REF			BIT(2)
> +#define RKVDEC_COLMV_USED_FLAG_REF			BIT(3)
> +
> +#define RKVDEC_REG_VP9_LAST_FRAME_BASE			0x02c
> +#define RKVDEC_REG_VP9_GOLDEN_FRAME_BASE		0x030
> +#define RKVDEC_REG_VP9_ALTREF_FRAME_BASE		0x034
> +
> +#define RKVDEC_REG_VP9_CPRHEADER_OFFSET			0x028
> +#define RKVDEC_VP9_CPRHEADER_OFFSET(x)			((x) & 0xffff)
> +
> +#define RKVDEC_REG_VP9_REFERLAST_BASE			0x02C
> +#define RKVDEC_REG_VP9_REFERGOLDEN_BASE			0x030
> +#define RKVDEC_REG_VP9_REFERALFTER_BASE			0x034
> +
> +#define RKVDEC_REG_VP9COUNT_BASE			0x038
> +#define RKVDEC_VP9COUNT_UPDATE_EN			BIT(0)
> +
> +#define RKVDEC_REG_VP9_SEGIDLAST_BASE			0x03C
> +#define RKVDEC_REG_VP9_SEGIDCUR_BASE			0x040
> +#define RKVDEC_REG_VP9_FRAME_SIZE(i)			((i) * 0x04 + 0x044)
> +#define RKVDEC_VP9_FRAMEWIDTH(x)			(((x) & 0xffff) << 0)
> +#define RKVDEC_VP9_FRAMEHEIGHT(x)			(((x) & 0xffff) << 16)
> +
> +#define RKVDEC_VP9_SEGID_GRP(i)				((i) * 0x04 + 0x050)
> +#define RKVDEC_SEGID_ABS_DELTA(x)			((x) & 0x1)
> +#define RKVDEC_SEGID_FRAME_QP_DELTA_EN(x)		(((x) & 0x1) << 1)
> +#define RKVDEC_SEGID_FRAME_QP_DELTA(x)			(((x) & 0x1ff) << 2)
> +#define RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE_EN(x)	(((x) & 0x1) << 11)
> +#define RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE(x)		(((x) & 0x7f) << 12)
> +#define RKVDEC_SEGID_REFERINFO_EN(x)			(((x) & 0x1) << 19)
> +#define RKVDEC_SEGID_REFERINFO(x)			(((x) & 0x03) << 20)
> +#define RKVDEC_SEGID_FRAME_SKIP_EN(x)			(((x) & 0x1) << 22)
> +
> +#define RKVDEC_VP9_CPRHEADER_CONFIG			0x070
> +#define RKVDEC_VP9_TX_MODE(x)				((x) & 0x07)
> +#define RKVDEC_VP9_FRAME_REF_MODE(x)			(((x) & 0x03) << 3)
> +
> +#define RKVDEC_VP9_REF_SCALE(i)				((i) * 0x04 + 0x074)
> +#define RKVDEC_VP9_REF_HOR_SCALE(x)			((x) & 0xffff)
> +#define RKVDEC_VP9_REF_VER_SCALE(x)			(((x) & 0xffff) << 16)
> +
> +#define RKVDEC_VP9_REF_DELTAS_LASTFRAME			0x080
> +#define RKVDEC_REF_DELTAS_LASTFRAME(pos, val)		(((val) & 0x7f) << ((pos) * 7))
> +
> +#define RKVDEC_VP9_INFO_LASTFRAME			0x084
> +#define RKVDEC_MODE_DELTAS_LASTFRAME(pos, val)		(((val) & 0x7f) << ((pos) * 7))
> +#define RKVDEC_SEG_EN_LASTFRAME				BIT(16)
> +#define RKVDEC_LAST_SHOW_FRAME				BIT(17)
> +#define RKVDEC_LAST_INTRA_ONLY				BIT(18)
> +#define RKVDEC_LAST_WIDHHEIGHT_EQCUR			BIT(19)
> +#define RKVDEC_COLOR_SPACE_LASTKEYFRAME(x)		(((x) & 0x07) << 20)
> +
> +#define RKVDEC_VP9_INTERCMD_BASE			0x088
> +
> +#define RKVDEC_VP9_INTERCMD_NUM				0x08C
> +#define RKVDEC_INTERCMD_NUM(x)				((x) & 0xffffff)
> +
> +#define RKVDEC_VP9_LASTTILE_SIZE			0x090
> +#define RKVDEC_LASTTILE_SIZE(x)				((x) & 0xffffff)
> +
> +#define RKVDEC_VP9_HOR_VIRSTRIDE(i)			((i) * 0x04 + 0x094)
> +#define RKVDEC_HOR_Y_VIRSTRIDE(x)			((x) & 0x1ff)
> +#define RKVDEC_HOR_UV_VIRSTRIDE(x)			(((x) & 0x1ff) << 16)
> +
> +#define RKVDEC_REG_H264_POC_REFER0(i)			(((i) * 0x04) + 0x064)
> +#define RKVDEC_REG_H264_POC_REFER1(i)			(((i) * 0x04) + 0x0C4)
> +#define RKVDEC_REG_H264_POC_REFER2(i)			(((i) * 0x04) + 0x120)
> +#define RKVDEC_POC_REFER(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_CUR_POC0				0x0A0
> +#define RKVDEC_REG_CUR_POC1				0x128
> +#define RKVDEC_CUR_POC(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_RLCWRITE_BASE			0x0A4
> +#define RKVDEC_REG_PPS_BASE				0x0A8
> +#define RKVDEC_REG_RPS_BASE				0x0AC
> +
> +#define RKVDEC_REG_STRMD_ERR_EN				0x0B0
> +#define RKVDEC_STRMD_ERR_EN(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_STRMD_ERR_STA			0x0B4
> +#define RKVDEC_STRMD_ERR_STA(x)				((x) & 0xfffffff)
> +#define RKVDEC_COLMV_ERR_REF_PICIDX(x)			(((x) & 0x0f) << 28)
> +
> +#define RKVDEC_REG_STRMD_ERR_CTU			0x0B8
> +#define RKVDEC_STRMD_ERR_CTU(x)				((x) & 0xff)
> +#define RKVDEC_STRMD_ERR_CTU_YOFFSET(x)			(((x) & 0xff) << 8)
> +#define RKVDEC_STRMFIFO_SPACE2FULL(x)			(((x) & 0x7f) << 16)
> +#define RKVDEC_VP9_ERR_EN_CTU0				BIT(24)
> +
> +#define RKVDEC_REG_SAO_CTU_POS				0x0BC
> +#define RKVDEC_SAOWR_XOFFSET(x)				((x) & 0x1ff)
> +#define RKVDEC_SAOWR_YOFFSET(x)				(((x) & 0x3ff) << 16)
> +
> +#define RKVDEC_VP9_LAST_FRAME_YSTRIDE			0x0C0
> +#define RKVDEC_VP9_GOLDEN_FRAME_YSTRIDE			0x0C4
> +#define RKVDEC_VP9_ALTREF_FRAME_YSTRIDE			0x0C8
> +#define RKVDEC_VP9_REF_YSTRIDE(x)			(((x) & 0xfffff) << 0)
> +
> +#define RKVDEC_VP9_LAST_FRAME_YUVSTRIDE			0x0CC
> +#define RKVDEC_VP9_REF_YUVSTRIDE(x)			(((x) & 0x1fffff) << 0)
> +
> +#define RKVDEC_VP9_REF_COLMV_BASE			0x0D0
> +
> +#define RKVDEC_REG_PERFORMANCE_CYCLE			0x100
> +#define RKVDEC_PERFORMANCE_CYCLE(x)			((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_AXI_DDR_RDATA			0x104
> +#define RKVDEC_AXI_DDR_RDATA(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_AXI_DDR_WDATA			0x108
> +#define RKVDEC_AXI_DDR_WDATA(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_FPGADEBUG_RESET			0x10C
> +#define RKVDEC_BUSIFD_RESETN				BIT(0)
> +#define RKVDEC_CABAC_RESETN				BIT(1)
> +#define RKVDEC_DEC_CTRL_RESETN				BIT(2)
> +#define RKVDEC_TRANSD_RESETN				BIT(3)
> +#define RKVDEC_INTRA_RESETN				BIT(4)
> +#define RKVDEC_INTER_RESETN				BIT(5)
> +#define RKVDEC_RECON_RESETN				BIT(6)
> +#define RKVDEC_FILER_RESETN				BIT(7)
> +
> +#define RKVDEC_REG_PERFORMANCE_SEL			0x110
> +#define RKVDEC_PERF_SEL_CNT0(x)				((x) & 0x3f)
> +#define RKVDEC_PERF_SEL_CNT1(x)				(((x) & 0x3f) << 8)
> +#define RKVDEC_PERF_SEL_CNT2(x)				(((x) & 0x3f) << 16)
> +
> +#define RKVDEC_REG_PERFORMANCE_CNT(i)			((i) * 0x04 + 0x114)
> +#define RKVDEC_PERF_CNT(x)				((x) & 0xffffffff)
> +
> +#define RKVDEC_REG_H264_ERRINFO_BASE			0x12C
> +
> +#define RKVDEC_REG_H264_ERRINFO_NUM			0x130
> +#define RKVDEC_SLICEDEC_NUM(x)				((x) & 0x3fff)
> +#define RKVDEC_STRMD_DECT_ERR_FLAG			BIT(15)
> +#define RKVDEC_ERR_PKT_NUM(x)				(((x) & 0x3fff) << 16)
> +
> +#define RKVDEC_REG_H264_ERR_E				0x134
> +#define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
> +
> +#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
> +#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
> +
> +#endif /* RKVDEC_REGS_H_ */
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> new file mode 100644
> index 000000000000..049cd921d99f
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -0,0 +1,1111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Video Decoder driver
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <linux/workqueue.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-regs.h"
> +
> +static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> +	{
> +		.per_request = true,
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> +	},
> +	{
> +		.per_request = true,
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> +	},
> +	{
> +		.per_request = true,
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
> +	},
> +	{
> +		.per_request = true,
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
> +	},
> +	{
> +		.per_request = true,
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> +	},
> +	{
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> +		.cfg.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> +		.cfg.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> +	},
> +	{
> +		.mandatory = true,
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> +		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> +		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> +	},
> +};
> +
> +static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
> +	.ctrls = rkvdec_h264_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
> +};
> +
> +static const u32 rkvdec_h264_decoded_fmts[] = {
> +	V4L2_PIX_FMT_NV12,
> +};
> +
> +static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 48,
> +			.max_width = 4096,
> +			.step_width = 16,
> +			.min_height = 48,
> +			.max_height = 2304,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec_h264_ctrls,
> +		.ops = &rkvdec_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
> +	}
> +};
> +
> +static const struct rkvdec_coded_fmt_desc *
> +rkvdec_find_coded_fmt_desc(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> +		if (rkvdec_coded_fmts[i].fourcc == fourcc)
> +			return &rkvdec_coded_fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
> +			     u32 fourcc)
> +{
> +	memset(f, 0, sizeof(*f));
> +	f->fmt.pix_mp.pixelformat = fourcc;
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709,
> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->coded_fmt;
> +
> +	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
> +	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
> +
> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	f->fmt.pix_mp.width = ctx->coded_fmt_desc->frmsize.min_width;
> +	f->fmt.pix_mp.height = ctx->coded_fmt_desc->frmsize.min_height;
> +
> +	if (ctx->coded_fmt_desc->ops->adjust_fmt)
> +		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
> +}
> +
> +static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->decoded_fmt;
> +
> +	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
> +			    ctx->coded_fmt_desc->decoded_fmts[0],
> +			    ctx->coded_fmt.fmt.pix_mp.width,
> +			    ctx->coded_fmt.fmt.pix_mp.height);
> +	f->fmt.pix_mp.plane_fmt[0].sizeimage += 128 *
> +		DIV_ROUND_UP(f->fmt.pix_mp.width, 16) *
> +		DIV_ROUND_UP(f->fmt.pix_mp.height, 16);
> +}
> +
> +static int rkvdec_enum_framesizes(struct file *file, void *priv,
> +				  struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct rkvdec_coded_fmt_desc *fmt;
> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise = fmt->frmsize;
> +	return 0;
> +}
> +
> +static int rkvdec_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	struct rkvdec_dev *rkvdec = video_drvdata(file);
> +	struct video_device *vdev = video_devdata(file);
> +
> +	strscpy(cap->driver, rkvdec->dev->driver->name,
> +		sizeof(cap->driver));
> +	strscpy(cap->card, vdev->name, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 rkvdec->dev->driver->name);
> +	return 0;
> +}
> +
> +static int rkvdec_try_capture_fmt(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	const struct rkvdec_coded_fmt_desc *coded_desc;
> +	u32 width, height;
> +	unsigned int i;
> +
> +	/*
> +	 * The codec context should point to a coded format desc, if the format
> +	 * on the coded end has not been set yet, it should point to the
> +	 * default value.
> +	 */
> +	coded_desc = ctx->coded_fmt_desc;
> +	if (WARN_ON(!coded_desc))
> +		return -EINVAL;
> +
> +	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> +			break;
> +	}
> +
> +	if (i == coded_desc->num_decoded_fmts)
> +		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +
> +	/* Save the original width/height before aligning them. */
> +	width = pix_mp->width;
> +	height = pix_mp->height;
> +
> +	/* Always apply the frmsize constraint of the coded end. */
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> +			    pix_mp->width, pix_mp->height);
> +	pix_mp->plane_fmt[0].sizeimage +=
> +		128 * DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16);
> +	pix_mp->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int rkvdec_try_output_fmt(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	const struct rkvdec_coded_fmt_desc *desc;
> +
> +	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
> +	if (!desc) {
> +		pix_mp->pixelformat = rkvdec_coded_fmts[0].fourcc;
> +		desc = &rkvdec_coded_fmts[0];
> +	}
> +
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &desc->frmsize);
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	/* All coded formats are considered single planar for now. */
> +	pix_mp->num_planes = 1;
> +
> +	if (desc->ops->adjust_fmt) {

> +		int ret;
> +
> +		ret = desc->ops->adjust_fmt(ctx, f);
> +		if (ret)
> +			return ret;

maybe simpler to just:
return desc->ops->adjust_fmt(ctx, f);

> +	}
> +
> +	return 0;
> +}
> +
> +static int rkvdec_s_fmt(struct file *file, void *priv,
> +			struct v4l2_format *f,
> +			int (*try_fmt)(struct file *, void *,
> +				       struct v4l2_format *))
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	if (!try_fmt)
> +		return -EINVAL;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_busy(vq))
> +		return -EBUSY;

> +
> +	ret = try_fmt(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

same as above:
return try_fmt(file, priv, f);

> +}
> +
> +static int rkvdec_s_capture_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	int ret;
> +
> +	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_capture_fmt);
> +	if (ret)
> +		return ret;
> +
> +	ctx->decoded_fmt = *f;
> +	return 0;
> +}
> +
> +static int rkvdec_s_output_fmt(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	const struct rkvdec_coded_fmt_desc *desc;
> +	struct v4l2_format *cap_fmt;
> +	struct vb2_queue *peer_vq;
> +	int ret;
> +
> +	/*
> +	 * Since format change on the OUTPUT queue will reset the CAPTURE
> +	 * queue, we can't allow doing so when the CAPTURE queue has buffers
> +	 * allocated.
> +	 */
> +	peer_vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (vb2_is_busy(peer_vq))
> +		return -EBUSY;
> +
> +	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
> +	if (ret)
> +		return ret;
> +
> +	desc = rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
> +	if (!desc)
> +		return -EINVAL;
> +	ctx->coded_fmt_desc = desc;
> +	ctx->coded_fmt = *f;
> +
> +	/*
> +	 * Current decoded format might have become invalid with newly
> +	 * selected codec, so reset it to default just to be safe and
> +	 * keep internal driver state sane. User is mandated to set
> +	 * the decoded format again after we return, so we don't need
> +	 * anything smarter.
> +	 *
> +	 * Note that this will propagates any size changes to the decoded format.
> +	 */
> +	rkvdec_reset_decoded_fmt(ctx);
> +
> +	/* Propagate colorspace information to capture. */
> +	cap_fmt = &ctx->decoded_fmt;
> +	cap_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
> +	cap_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
> +	cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +	cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
> +
> +	return 0;
> +}
> +
> +static int rkvdec_g_output_fmt(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +
> +	*f = ctx->coded_fmt;
> +	return 0;
> +}
> +
> +static int rkvdec_g_capture_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +
> +	*f = ctx->decoded_fmt;
> +	return 0;
> +}
> +
> +static int rkvdec_enum_output_fmt(struct file *file, void *priv,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
> +		return -EINVAL;
> +
> +	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
> +	return 0;
> +}
> +
> +static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +
> +	if (WARN_ON(!ctx->coded_fmt_desc))
> +		return -EINVAL;
> +
> +	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
> +		return -EINVAL;
> +
> +	f->pixelformat = ctx->coded_fmt_desc->decoded_fmts[f->index];
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops rkvdec_ioctl_ops = {
> +	.vidioc_querycap = rkvdec_querycap,
> +	.vidioc_enum_framesizes = rkvdec_enum_framesizes,
> +
> +	.vidioc_try_fmt_vid_cap_mplane = rkvdec_try_capture_fmt,
> +	.vidioc_try_fmt_vid_out_mplane = rkvdec_try_output_fmt,
> +	.vidioc_s_fmt_vid_out_mplane = rkvdec_s_output_fmt,
> +	.vidioc_s_fmt_vid_cap_mplane = rkvdec_s_capture_fmt,
> +	.vidioc_g_fmt_vid_out_mplane = rkvdec_g_output_fmt,
> +	.vidioc_g_fmt_vid_cap_mplane = rkvdec_g_capture_fmt,
> +	.vidioc_enum_fmt_vid_out = rkvdec_enum_output_fmt,
> +	.vidioc_enum_fmt_vid_cap = rkvdec_enum_capture_fmt,
> +
> +	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +
> +	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
> +};
> +
> +static int rkvdec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +			      unsigned int *num_planes, unsigned int sizes[],
> +			      struct device *alloc_devs[])
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct v4l2_format *f;
> +	unsigned int i;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		f = &ctx->coded_fmt;
> +	else
> +		f = &ctx->decoded_fmt;
> +
> +	if (*num_planes) {
> +		if (*num_planes != f->fmt.pix_mp.num_planes)
> +			return -EINVAL;
> +
> +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> +			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +		}
> +	} else {
> +		*num_planes = f->fmt.pix_mp.num_planes;
> +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
> +			sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkvdec_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct v4l2_format *f;
> +	unsigned int i;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		f = &ctx->coded_fmt;
> +	else
> +		f = &ctx->decoded_fmt;
> +
> +	for (i = 0; i < f->fmt.pix_mp.num_planes; ++i) {
> +		u32 sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
> +
> +		if (vb2_plane_size(vb, i) < sizeimage)
> +			return -EINVAL;
> +	}
> +	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +	return 0;
> +}
> +
> +static void rkvdec_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int rkvdec_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +
> +static void rkvdec_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +}
> +
> +static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
> +	const struct rkvdec_coded_fmt_desc *desc;
> +	int ret;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(q->type))
> +		return 0;
> +
> +	desc = ctx->coded_fmt_desc;
> +	if (WARN_ON(!desc))
> +		return -EINVAL;
> +
> +	if (desc->ops->start) {
> +		ret = desc->ops->start(ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rkvdec_queue_cleanup(struct vb2_queue *vq, u32 state)
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
> +
> +	while (true) {
> +		struct vb2_v4l2_buffer *vbuf;
> +
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +		if (!vbuf)
> +			break;
> +
> +		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
> +					   &ctx->ctrl_hdl);
> +		v4l2_m2m_buf_done(vbuf, state);
> +	}
> +}
> +
> +static void rkvdec_stop_streaming(struct vb2_queue *q)
> +{
> +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +
> +		if (WARN_ON(!desc))
> +			return;
> +
> +		if (desc->ops->stop)
> +			desc->ops->stop(ctx);
> +	}
> +
> +	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops rkvdec_queue_ops = {
> +	.queue_setup = rkvdec_queue_setup,
> +	.buf_prepare = rkvdec_buf_prepare,
> +	.buf_queue = rkvdec_buf_queue,
> +	.buf_out_validate = rkvdec_buf_out_validate,
> +	.buf_request_complete = rkvdec_buf_request_complete,
> +	.start_streaming = rkvdec_start_streaming,
> +	.stop_streaming = rkvdec_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +};
> +
> +static int rkvdec_request_validate(struct media_request *req)
> +{
> +	struct media_request_object *obj;
> +	const struct rkvdec_ctrls *ctrls;
> +	struct v4l2_ctrl_handler *hdl;
> +	struct rkvdec_ctx *ctx = NULL;
> +	unsigned int count, i;
> +	int ret;
> +
> +	list_for_each_entry(obj, &req->objects, list) {
> +		if (vb2_request_object_is_buffer(obj)) {
> +			struct vb2_buffer *vb;
> +
> +			vb = container_of(obj, struct vb2_buffer, req_obj);
> +			ctx = vb2_get_drv_priv(vb->vb2_queue);
> +			break;
> +		}
> +	}
> +
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	count = vb2_request_buffer_cnt(req);
> +	if (!count)
> +		return -ENOENT;
> +	else if (count > 1)
> +		return -EINVAL;
> +
> +	hdl = v4l2_ctrl_request_hdl_find(req, &ctx->ctrl_hdl);
> +	if (!hdl)
> +		return -ENOENT;
> +
> +	ret = 0;
> +	ctrls = ctx->coded_fmt_desc->ctrls;
> +	for (i = 0; ctrls && i < ctrls->num_ctrls; i++) {
> +		u32 id = ctrls->ctrls[i].cfg.id;
> +		struct v4l2_ctrl *ctrl;
> +
> +		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
> +			continue;
> +
> +		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
> +		if (!ctrl) {
> +			ret = -ENOENT;
> +			break;
> +		}
> +	}
> +
> +	v4l2_ctrl_request_hdl_put(hdl);
> +
> +	if (ret)
> +		return ret;
> +
> +	return vb2_request_validate(req);
> +}
> +
> +static const struct media_device_ops rkvdec_media_ops = {
> +	.req_validate = rkvdec_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
> +				    enum vb2_buffer_state result)
> +{
> +	if (ctx->coded_fmt_desc->ops->done) {
> +		struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +		dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
> +	}
> +
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> +					 result);
> +}
> +
> +static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
> +			      enum vb2_buffer_state result)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +
> +	pm_runtime_mark_last_busy(rkvdec->dev);
> +	pm_runtime_put_autosuspend(rkvdec->dev);
> +	rkvdec_job_finish_no_pm(ctx, result);
> +}
> +
> +void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
> +{
> +	struct media_request *src_req;
> +
> +	memset(run, 0, sizeof(*run));
> +
> +	run->bufs.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	run->bufs.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	/* Apply request(s) controls if needed. */
> +	src_req = run->bufs.src->vb2_buf.req_obj.req;
> +	if (src_req)
> +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
> +
> +	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst, true);
> +}
> +
> +void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
> +{
> +	struct media_request *src_req = run->bufs.src->vb2_buf.req_obj.req;
> +
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
> +}
> +
> +static void rkvdec_device_run(void *priv)
> +{
> +	struct rkvdec_ctx *ctx = priv;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	int ret;
> +
> +	if (WARN_ON(!desc))
> +		return;
> +
> +	ret = pm_runtime_get_sync(rkvdec->dev);
> +	if (ret < 0) {
> +		rkvdec_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	ret = desc->ops->run(ctx);
> +	if (ret)
> +		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static struct v4l2_m2m_ops rkvdec_m2m_ops = {
> +	.device_run = rkvdec_device_run,
> +};
> +
> +static int rkvdec_queue_init(void *priv,
> +			     struct vb2_queue *src_vq,
> +			     struct vb2_queue *dst_vq)
> +{
> +	struct rkvdec_ctx *ctx = priv;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->ops = &rkvdec_queue_ops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +
> +	/*
> +	 * Driver does mostly sequential access, so sacrifice TLB efficiency
> +	 * for faster allocation. Also, no CPU access on the source queue,
> +	 * so no kernel mapping needed.
> +	 */
> +	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
> +			    DMA_ATTR_NO_KERNEL_MAPPING;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &rkvdec->vdev_lock;
> +	src_vq->dev = rkvdec->v4l2_dev.dev;
> +	src_vq->supports_requests = true;
> +	src_vq->requires_requests = true;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->bidirectional = true;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
> +			    DMA_ATTR_NO_KERNEL_MAPPING;
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->ops = &rkvdec_queue_ops;
> +	dst_vq->buf_struct_size = sizeof(struct rkvdec_decoded_buffer);
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &rkvdec->vdev_lock;
> +	dst_vq->dev = rkvdec->v4l2_dev.dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
> +			    const struct rkvdec_ctrls *ctrls)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ctrls->num_ctrls; i++) {
> +		const struct v4l2_ctrl_config *cfg = &ctrls->ctrls[i].cfg;
> +
> +		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
> +		if (ctx->ctrl_hdl.error)
> +			return ctx->ctrl_hdl.error;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> +{
> +	unsigned int i, nctrls = 0;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> +		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> +
> +	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> +		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +		if (ret)
> +			goto err_free_handler;
> +	}
> +
> +	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +	return ret;
> +}
> +
> +static int rkvdec_open(struct file *filp)
> +{
> +	struct rkvdec_dev *rkvdec = video_drvdata(filp);
> +	struct rkvdec_ctx *ctx;
> +	int ret;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = rkvdec;
> +	rkvdec_reset_coded_fmt(ctx);
> +	rkvdec_reset_decoded_fmt(ctx);
> +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> +
> +	ret = rkvdec_init_ctrls(ctx);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
> +					    rkvdec_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_cleanup_ctrls;
> +	}
> +
> +	filp->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	return 0;
> +
> +err_cleanup_ctrls:
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +
> +err_free_ctx:
> +	kfree(ctx);
> +	return ret;
> +}
> +
> +static int rkvdec_release(struct file *filp)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(filp->private_data);
> +
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations rkvdec_fops = {
> +	.owner = THIS_MODULE,
> +	.open = rkvdec_open,
> +	.release = rkvdec_release,
> +	.poll = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = v4l2_m2m_fop_mmap,
> +};
> +
> +static int rkvdec_v4l2_init(struct rkvdec_dev *rkvdec)
> +{
> +	int ret;
> +
> +	ret = v4l2_device_register(rkvdec->dev, &rkvdec->v4l2_dev);
> +	if (ret) {
> +		dev_err(rkvdec->dev, "Failed to register V4L2 device\n");
> +		return ret;
> +	}
> +
> +	rkvdec->m2m_dev = v4l2_m2m_init(&rkvdec_m2m_ops);
> +	if (IS_ERR(rkvdec->m2m_dev)) {
> +		v4l2_err(&rkvdec->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(rkvdec->m2m_dev);
> +		goto err_unregister_v4l2;
> +	}
> +
> +	rkvdec->mdev.dev = rkvdec->dev;
> +	strscpy(rkvdec->mdev.model, "rkvdec", sizeof(rkvdec->mdev.model));
> +	strscpy(rkvdec->mdev.bus_info, "platform:rkvdec",
> +		sizeof(rkvdec->mdev.bus_info));
> +	media_device_init(&rkvdec->mdev);
> +	rkvdec->mdev.ops = &rkvdec_media_ops;
> +	rkvdec->v4l2_dev.mdev = &rkvdec->mdev;
> +
> +	rkvdec->vdev.lock = &rkvdec->vdev_lock;
> +	rkvdec->vdev.v4l2_dev = &rkvdec->v4l2_dev;
> +	rkvdec->vdev.fops = &rkvdec_fops;
> +	rkvdec->vdev.release = video_device_release_empty;
> +	rkvdec->vdev.vfl_dir = VFL_DIR_M2M;
> +	rkvdec->vdev.device_caps = V4L2_CAP_STREAMING |
> +				   V4L2_CAP_VIDEO_M2M_MPLANE;
> +	rkvdec->vdev.ioctl_ops = &rkvdec_ioctl_ops;
> +	video_set_drvdata(&rkvdec->vdev, rkvdec);
> +	strscpy(rkvdec->vdev.name, "rkvdec", sizeof(rkvdec->vdev.name));
> +
> +	ret = video_register_device(&rkvdec->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&rkvdec->v4l2_dev, "Failed to register video device\n");
> +		goto err_cleanup_mc;
> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(rkvdec->m2m_dev, &rkvdec->vdev,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&rkvdec->v4l2_dev,
> +			 "Failed to initialize V4L2 M2M media controller\n");
> +		goto err_unregister_vdev;
> +	}
> +
> +	ret = media_device_register(&rkvdec->mdev);
> +	if (ret) {
> +		v4l2_err(&rkvdec->v4l2_dev, "Failed to register media device\n");
> +		goto err_unregister_mc;
> +	}
> +
> +	return 0;
> +
> +err_unregister_mc:
> +	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
> +
> +err_unregister_vdev:
> +	video_unregister_device(&rkvdec->vdev);
> +
> +err_cleanup_mc:
> +	media_device_cleanup(&rkvdec->mdev);
> +	v4l2_m2m_release(rkvdec->m2m_dev);
> +
> +err_unregister_v4l2:
> +	v4l2_device_unregister(&rkvdec->v4l2_dev);
> +	return ret;
> +}
> +
> +static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
> +{
> +	media_device_unregister(&rkvdec->mdev);
> +	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
> +	video_unregister_device(&rkvdec->vdev);
> +	media_device_cleanup(&rkvdec->mdev);
> +	v4l2_m2m_release(rkvdec->m2m_dev);
> +	v4l2_device_unregister(&rkvdec->v4l2_dev);
> +}
> +
> +static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +{
> +	struct rkvdec_dev *rkvdec = priv;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status = readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +	state = (status & RKVDEC_RDY_STA) ?
> +		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
> +		struct rkvdec_ctx *ctx;
> +
> +		ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +		rkvdec_job_finish(ctx, state);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void rkvdec_watchdog_func(struct work_struct *work)
> +{
> +	struct rkvdec_dev *rkvdec;
> +	struct rkvdec_ctx *ctx;
> +
> +	rkvdec = container_of(to_delayed_work(work), struct rkvdec_dev,
> +			      watchdog_work);
> +	ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	if (ctx) {
> +		dev_err(rkvdec->dev, "Frame processing timed out!\n");
> +		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +		writel(0, rkvdec->regs + RKVDEC_REG_SYSCTRL);
> +		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}
> +}
> +
> +static const struct of_device_id of_rkvdec_match[] = {
> +	{ .compatible = "rockchip,rk3399-vdec" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> +
> +static const char * const rkvdec_clk_names[] = {
> +	"axi", "ahb", "cabac", "core"
> +};
> +
> +static int rkvdec_probe(struct platform_device *pdev)
> +{
> +	struct rkvdec_dev *rkvdec;
> +	struct resource *res;
> +	unsigned int i;
> +	int ret, irq;
> +
> +	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
> +	if (!rkvdec)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rkvdec);
> +	rkvdec->dev = &pdev->dev;
> +	mutex_init(&rkvdec->vdev_lock);
> +	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> +
> +	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
> +				      sizeof(*rkvdec->clocks), GFP_KERNEL);
> +	if (!rkvdec->clocks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
> +		rkvdec->clocks[i].id = rkvdec_clk_names[i];
> +
> +	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
> +				rkvdec->clocks);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Bump ACLK to max. possible freq. (500 MHz) to improve performance
> +	 * When 4k video playback.
> +	 */
> +	clk_set_rate(rkvdec->clocks[0].clk, 500 * 1000 * 1000);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rkvdec->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rkvdec->regs))
> +		return PTR_ERR(rkvdec->regs);
> +
> +	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not set DMA coherent mask.\n");
> +		return ret;
> +	}
> +
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq <= 0) {
> +		dev_err(&pdev->dev, "Could not get vdec IRQ\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					rkvdec_irq_handler, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), rkvdec);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> +		return ret;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = rkvdec_v4l2_init(rkvdec);
> +	if (ret)
> +		goto err_disable_runtime_pm;
> +
> +	return 0;
> +
> +err_disable_runtime_pm:
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static int rkvdec_remove(struct platform_device *pdev)
> +{
> +	struct rkvdec_dev *rkvdec = platform_get_drvdata(pdev);
> +
> +	rkvdec_v4l2_cleanup(rkvdec);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int rkvdec_runtime_resume(struct device *dev)
> +{
> +	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
> +				       rkvdec->clocks);
> +}
> +
> +static int rkvdec_runtime_suspend(struct device *dev)
> +{
> +	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
> +				   rkvdec->clocks);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops rkvdec_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver rkvdec_driver = {
> +	.probe = rkvdec_probe,
> +	.remove = rkvdec_remove,
> +	.driver = {
> +		   .name = "rkvdec",
> +		   .of_match_table = of_match_ptr(of_rkvdec_match),
> +		   .pm = &rkvdec_pm_ops,
> +	},
> +};
> +module_platform_driver(rkvdec_driver);
> +
> +MODULE_AUTHOR("Boris Brezillon <boris.brezillon@collabora.com>");
> +MODULE_DESCRIPTION("Rockchip Video Decoder driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> new file mode 100644
> index 000000000000..2fc9f46b6910
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Video Decoder driver
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */
> +#ifndef RKVDEC_H_
> +#define RKVDEC_H_
> +
> +#include <linux/platform_device.h>
> +#include <linux/videodev2.h>
> +#include <linux/wait.h>
> +#include <linux/clk.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +struct rkvdec_ctx;
> +
> +struct rkvdec_ctrl_desc {
> +	u32 per_request : 1;
> +	u32 mandatory : 1;
> +	struct v4l2_ctrl_config cfg;
> +};
> +
> +struct rkvdec_ctrls {
> +	const struct rkvdec_ctrl_desc *ctrls;
> +	unsigned int num_ctrls;
> +};
> +
> +struct rkvdec_run {
> +	struct {
> +		struct vb2_v4l2_buffer *src;
> +		struct vb2_v4l2_buffer *dst;
> +	} bufs;
> +};
> +
> +struct rkvdec_vp9_decoded_buffer_info {
> +	/* Info needed when the decoded frame serves as a reference frame. */
> +	u16 width;
> +	u16 height;
> +	u32 bit_depth : 4;
> +};
> +
> +struct rkvdec_decoded_buffer {
> +	/* Must be the first field in this struct. */
> +	struct v4l2_m2m_buffer base;
> +};
> +
> +static inline struct rkvdec_decoded_buffer *
> +vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> +{
> +	return container_of(buf, struct rkvdec_decoded_buffer,
> +			    base.vb.vb2_buf);
> +}
> +
> +struct rkvdec_coded_fmt_ops {
> +	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
> +			  struct v4l2_format *f);
> +	int (*start)(struct rkvdec_ctx *ctx);
> +	void (*stop)(struct rkvdec_ctx *ctx);
> +	int (*run)(struct rkvdec_ctx *ctx);
> +	void (*done)(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *src_buf,
> +		     struct vb2_v4l2_buffer *dst_buf,
> +		     enum vb2_buffer_state result);
> +};
> +
> +struct rkvdec_coded_fmt_desc {
> +	u32 fourcc;
> +	struct v4l2_frmsize_stepwise frmsize;
> +	const struct rkvdec_ctrls *ctrls;
> +	const struct rkvdec_coded_fmt_ops *ops;
> +	unsigned int num_decoded_fmts;
> +	const u32 *decoded_fmts;
> +};
> +
> +struct rkvdec_dev {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +	struct video_device vdev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct device *dev;
> +	struct clk_bulk_data *clocks;
> +	void __iomem *regs;
> +	struct mutex vdev_lock; /* serializes ioctls */
> +	struct delayed_work watchdog_work;
> +};
> +
> +struct rkvdec_ctx {
> +	struct v4l2_fh fh;
> +	struct v4l2_format coded_fmt;
> +	struct v4l2_format decoded_fmt;
> +	const struct rkvdec_coded_fmt_desc *coded_fmt_desc;
> +	struct v4l2_ctrl_handler ctrl_hdl;
> +	struct rkvdec_dev *dev;
> +	void *priv;
> +};
> +
> +static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct rkvdec_ctx, fh);
> +}
> +
> +struct rkvdec_aux_buf {
> +	void *cpu;
> +	dma_addr_t dma;
> +	size_t size;
> +};
> +
> +void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
> +void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
> +
> +extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
> +#endif /* RKVDEC_H_ */
> -- 
> 2.26.0.rc2
> 

Thanks,
-- 
Andriy
