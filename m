Return-Path: <linux-media+bounces-29349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2DA7AFB2
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 22:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADAE017802B
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 20:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56A02571B5;
	Thu,  3 Apr 2025 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="UeSpvAht"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC845253F0A
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 19:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708725; cv=none; b=iF0+XS5W4KcJs1GGr5l4bBy54ff/E7v9g/EznKHmX3Azd9qPoLidRFiy+2/O2SsNfevY5EYTDq/44LCULCJhgDt4foha0LuDYH+hH/k9Oio2iz0beh280dQ0grR5wQsqodQNOai0fH9qJX6Liz+jLqrguMHSSZimP95OeLEZJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708725; c=relaxed/simple;
	bh=SuAM5xCInDF5Oa9WKBDdKGsT7m7U2z+iwq+HNiSMzrc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vnpq7/X7cEDg2EUswuVv4vwg1obfg3NgRoP9BB22o7of6ejkwwlvxfSYbHIA6n2kM2LdKsFF5gmQpDlHYYgX6nYuuc63myvVge4ZWCBy/PxLh1QnVaCfvOGsqW8M5hqwQj5LYJDX+NcQkmuZUQUJbtvuAttLdKUg/h3bvyK1QCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=UeSpvAht; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47691d82bfbso23354431cf.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743708717; x=1744313517; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2k/6EM0OMsW9JU1j++Qrl11eurUjf9QlAq7xEm5pFCM=;
        b=UeSpvAhtn/ePpYH9wdf8bKmyPadjkM0+HFMPQOAbtJsz9/snsz9YPMkAuyGUsZLTyC
         SC6X1dn0wqVeV6JxtpACzswdjIkUzg4EJrvNOo6JMHMlP/++4tdnmTx1IO+4Etcgj8yx
         CuJLhlex/gT/z/S7YFvuH3BlnqR1ZeyLXlGwJ/AgShvlEVMmlPFRiNYVzYhokPy0+yGA
         4GIScpUnY0yQTtxHRP3yrmlMJtj2YWCurfG1gddfOuGKOAYbVCORzgfpC3rrHV4Tmt7s
         31g7/eA29DwvcALAHG5ypdl1kMAz7+XWBmVglPmut9x8nBownXWhRmaQxzApvkpB5fsK
         J+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743708717; x=1744313517;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2k/6EM0OMsW9JU1j++Qrl11eurUjf9QlAq7xEm5pFCM=;
        b=fbaKPzY6ez0oC9Hji7x8tG7G/Sxv/2nMCA13QpkbeppRBsaaoOfLKlfnRsPRECXAid
         LJWIr/MFktU1sBbCdsqS9zbF/+SsjfxTJ2gMyTotJDQa0hh1W3dpaYtSeXGE3VqbZHMi
         tFYVJQqQzOCifqY7/4duzMlHBfZ0gL6+2VSLbw8Y+9f0QODEhODKecl2iLGdctgJcUcZ
         iAb/3IxHDgXmNSRs6k21MMdeXPBLoEF2v8cLL6vQ6w7fsjIZ/BZK3KnTJfclfgJesKbk
         U71g5ofZ4586+fgLK09PEKIbsUoUK5spl2BDQiiwWQR+b6NMp45LF9MjytieQP+KKYJy
         h75g==
X-Forwarded-Encrypted: i=1; AJvYcCWrbjq2df3IO50Faj1jGzqkpSQWGgy+HttDsDAax3TpN6sikbycnOG2Mw3NHD9DUwU8lWUhoBgdwXhMiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEFMryjxIrjO+XqnM5Bor3uz8nrB7IkIoc4UaDY9t/Ma+DMj/
	zxQOvTy68+ydd8Pl3714Z0tgUIOj/3QiJy9o5BEz4yjOpQD9wQjOUhuHXTJSiMY=
X-Gm-Gg: ASbGncuD2L9AFoeN3pvDA4ZzqZ30tKAxyIdJdfIxmGTsXXmYQ84PLBUQtC986ls9jD6
	9YUpDEmX7N8+YoNUKuCqNsI2PuyAMMEVFfznogx6S88trvtxvYkamDFBFFxTkpKLiFPUt3kN8OF
	GnFGf0xs5M16DiSwnsFb4GjkD7ULScBLC5k+xCfPBzB0ULKkZAx4RFCwgMI4l5yVLww7IfgJ+uB
	6ShapSmHjO34MQYnXu6BrdPMaFAYL2pLZVwfMVER0JT+APyc4IlW2mto+awssPW2NixsgZS2oGD
	a75wmUbw8UfxaRdeC9DBxCsK7TIJzAaPUkY7caXZ/USOnaKbdg==
X-Google-Smtp-Source: AGHT+IEtLt7hf87F5h+rBCxBYBxLiiwt2pTfCCmZcuRagwtXol9tY9EhCfnCLRBJT25Ym/f19ZAlNA==
X-Received: by 2002:a05:6214:5004:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f00de70855mr5833566d6.1.1743708715849;
        Thu, 03 Apr 2025 12:31:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14c183sm11007936d6.94.2025.04.03.12.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:31:55 -0700 (PDT)
Message-ID: <78b2b89481d8fec2a32dfa2bf424e4f6295f9534.camel@ndufresne.ca>
Subject: Re: [PATCH v5 4/4] media: mediatek: add MT8188 AIE driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "bo.kong" <bo.kong@mediatek.com>, Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: zhaoyuan.chen@mediatek.com, Teddy.Chen@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 03 Apr 2025 15:31:53 -0400
In-Reply-To: <20250403074005.21472-5-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
		 <20250403074005.21472-5-bo.kong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,


Le jeudi 03 avril 2025 =C3=A0 15:38 +0800, bo.kong a =C3=A9crit=C2=A0:
> From: Bo Kong <Bo.Kong@mediatek.com>
>=20
> Add a V4L2 sub-device driver for MT8188 AIE.

I was confused for a moment with the "sub-device driver" combined with
V4L2_MEM2MEM_DEV and MEDIA_CONTROLLER_REQUEST_API. You likely want to
correct your commit message. From quick code lookup, this looks like a
new class of M2M driver, not a sub-dev that you incorporate into an
existing media controller.

This would be the first M2M driver using request upstream that is not
based on the Stateless Decoder specification. What that means is that
more documentation will have to be written. Last similar driver was
dw100, perhaps you can take inspiration.

  Documentation/userspace-api/media/drivers/dw100.rst

Its your chance to document how your driver works, how request must be
used and also (since you have a media controller) document the graph
content, which would mostly be used for identification if there is new
compatible drivers in the future.

Its always nice to have a link to an open source or public domain demo
or production code for this too. That will enhance your doc and commit
message. MT8188 is pretty public SoC now with Genio line, so I suppose
you don't expect to provide support to everyone that are to use this
upstream feature, so its better document it well.

Nicolas

>=20
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> Changes in V5:
> 1. Modify the description of FLDMODE.
> 2. Replace all instances of the keyword "race" with "ethnicity"
> (e.g., race_result) to improve readability.
> 3. Remove NUM_FORMATS.
> 4. Correct some English spelling errors.
> 5. Change the name of clock, replacing _ with -.
> 6. Add an explanation for the aie_copy_fw related bin files.
> 7. Use enums to save Y2R, RS, and FD related variables, removing the
> define format,
> and add new enums Y2R_CONFIG, RS_CONFIG, and FD_CONFIG.
> 8. Optimize the expression of the RPN_LOOP_NUM and PYM_START_LOOP
> variables.
> 9. Remove unnecessary define variables.
> 10. Remove the fd_wdma_en structure, replacing it with
> out_stride_size for judgment.
> 11. Optimize the fd_ker_rdma_size structure, add the
> get_fd_ker_rdma_size function,
> optimize the attr_ker_rdma_size structure, and add the
> get_attr_ker_rdma_size function.
> 12. Delete the fd_stride and fd_maxpool structures.
> 13. Remove duplicate structures in mtk_aie.h and
> mtk_aie_v4l2_controls.h.
> 14. Remove fd_version, attr_version, and pose_version.
> 15. Move the aie_enq_info and related structures to the uapi
> directory.
> 16. Rename mtk_aie_53.c to mtk_aie_v4l2.c and update the Makefile
> accordingly.
> 17. Optimize some code to reduce redundant conditional checks.
>=20
> Changes in v4:
> 1. Remove ccflags that are not used in Makefile.
> 2. Optimize the write register operation.
> 3. Remove excess config from Kconfig.
> 4. Remove the probe function related to hw_version.
> 5. Remove mtk_aie_hw_connect,mtk_aie_hw_enable,mtk_aie_hw_disconnect
> etc.
> 6. Fix coding style in mtk_aie.h.
> 7. Replace signed short with s16.
> 8. Remove aie_reset_output_buf function, optimize this part of the
> code.
> 9. Remove struct race_result and other structures, and use s16
> instead.
> of structures.
> 10. Change multiple different types of width and height into the same
> structure.
> 11. Remove all unnecessary variable initialization
> operations,retaining
> some variables that need to be initialized.
> 12. Delete print physical address.
> 13. Remove aie_init_table and combine aie_init_table into the
> aie_update_table function.
> 14. Optimize the readability of some codes, add aie_calculate_pa
> function.
> 15. Optimize the aie_execute function and divide this function into
> aie_execute_face_detection, aie_execute_attribute_detection,
> aie_execute_fld_detection functions.
> 16. Modify arrays with all 5 into define ANCHOR_EN_NUM.
> 17. Remove mtk_aie_get_variant function.
> 18. The version in the code was deleted, but the variables in the
> enque
> info structure cannot be deleted. Once deleted, the AIE will not work
> because this structure needs to be aligned with User Space.
>=20
> Changes in v3:
> 1. Remove not used include file, include only headers which AIE use
> 2. Remove Makefile some private driver headers
>=20
> Changes in v2:
> 1. Fix coding style
> ---
> =C2=A0drivers/media/platform/mediatek/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/mediatek/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/mediatek/aie/Kconfig=C2=A0=C2=A0 |=C2=A0=C2=
=A0 12 +
> =C2=A0drivers/media/platform/mediatek/aie/Makefile=C2=A0 |=C2=A0=C2=A0=C2=
=A0 5 +
> =C2=A0drivers/media/platform/mediatek/aie/mtk_aie.h |=C2=A0 870 ++++++
> =C2=A0.../media/platform/mediatek/aie/mtk_aie_drv.c | 2398
> +++++++++++++++++
> =C2=A0.../platform/mediatek/aie/mtk_aie_v4l2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1295 +++++++++
> =C2=A07 files changed, 4582 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
> =C2=A0create mode 100644 drivers/media/platform/mediatek/aie/Makefile
> =C2=A0create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
> =C2=A0create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.=
c
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
>=20
> diff --git a/drivers/media/platform/mediatek/Kconfig
> b/drivers/media/platform/mediatek/Kconfig
> index 84104e2cd024..cd161272666b 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -2,6 +2,7 @@
> =C2=A0
> =C2=A0comment "Mediatek media platform drivers"
> =C2=A0
> +source "drivers/media/platform/mediatek/aie/Kconfig"
> =C2=A0source "drivers/media/platform/mediatek/jpeg/Kconfig"
> =C2=A0source "drivers/media/platform/mediatek/mdp/Kconfig"
> =C2=A0source "drivers/media/platform/mediatek/vcodec/Kconfig"
> diff --git a/drivers/media/platform/mediatek/Makefile
> b/drivers/media/platform/mediatek/Makefile
> index 38e6ba917fe5..23a096fdf21c 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -1,4 +1,5 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D aie/
> =C2=A0obj-y +=3D jpeg/
> =C2=A0obj-y +=3D mdp/
> =C2=A0obj-y +=3D vcodec/
> diff --git a/drivers/media/platform/mediatek/aie/Kconfig
> b/drivers/media/platform/mediatek/aie/Kconfig
> new file mode 100644
> index 000000000000..ffbe0a79a2ea
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Kconfig
> @@ -0,0 +1,12 @@
> +config VIDEO_MTK_AIE
> + tristate "MediaTek AI engine function"
> + depends on OF
> + select V4L2_MEM2MEM_DEV
> + select VIDEOBUF2_DMA_CONTIG
> + select MEDIA_CONTROLLER_REQUEST_API
> + help
> + =C2=A0 Support the AI engine (AIE) feature
> +
> + =C2=A0 AIE driver is a V4L2 memory-to-memory device driver which
> + =C2=A0 provides hardware accelerated face detection function,
> + =C2=A0 it can detect different sizes of faces in a raw image.
> diff --git a/drivers/media/platform/mediatek/aie/Makefile
> b/drivers/media/platform/mediatek/aie/Makefile
> new file mode 100644
> index 000000000000..0b4252452ca2
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk_aie_v4l2.o
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk_aie_drv.o
> +
> +obj-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk-aie.o
> \ No newline at end of file
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie.h
> b/drivers/media/platform/mediatek/aie/mtk_aie.h
> new file mode 100644
> index 000000000000..1de8d8b82499
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie.h
> @@ -0,0 +1,870 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Bo Kong <bo.kong@mediatek.com>
> + */
> +
> +#ifndef __MTK_AIE_H__
> +#define __MTK_AIE_H__
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +
> +#define RPN_NUM 3
> +#define RPN_LOOP_NUM 29
> +#define FD_LOOP_NUM (RPN_NUM * RPN_LOOP_NUM)
> +
> +#define RPNX_LOOP_NUM(x) ((3 - (x)) * RPN_LOOP_NUM - 1)
> +#define PYMX_START_LOOP(x) ((2 - (x)) * RPN_LOOP_NUM)
> +
> +#define ATTR_LOOP_NUM 26
> +#define AGE_OUT_RGS 17
> +#define GENDER_OUT_RGS 20
> +#define INDIAN_OUT_RGS 22
> +#define ETHNICITY_OUT_RGS 25
> +
> +#define INPUT_WDMA_WRA_NUM 4
> +#define OUTPUT_WDMA_WRA_NUM 4
> +#define KERNEL_RDMA_RA_NUM 2
> +
> +#define MAX_ENQUE_FRAME_NUM 10
> +#define PYM_NUM 3
> +#define COLOR_NUM 3
> +
> +#define ATTR_MODE_PYRAMID_WIDTH 128
> +#define ATTR_OUT_SIZE 32
> +
> +#define AIE_START_REG 0x000
> +#define AIE_ENABLE_REG 0x004
> +#define AIE_LOOP_REG 0x008
> +#define AIE_YUV2RGB_CON_BASE_ADR_REG 0x00c
> +#define AIE_RS_CON_BASE_ADR_REG 0x010
> +#define AIE_FD_CON_BASE_ADR_REG 0x014
> +#define AIE_INT_EN_REG 0x018
> +#define AIE_INT_REG 0x01c
> +#define AIE_RESULT_0_REG 0x08c
> +#define AIE_RESULT_1_REG 0x090
> +#define AIE_DMA_CTL_REG 0x094
> +
> +/* AIE 3.0 register */
> +#define AIE_YUV2RGB_CON_BASE_ADR_MSB 0x14C
> +#define AIE_RS_CON_BASE_ADR_MSB 0x150
> +#define AIE_FD_CON_BASE_ADR_MSB 0x154
> +
> +/* AIE 3.0 FLD register */
> +#define FLD_EN 0x400
> +#define FLD_BASE_ADDR_FACE_0 0x404
> +#define FLD_MODEL_PARA1 0x4FC
> +#define FLD_MODEL_PARA14 0x530
> +
> +#define FLD_BUSY 0x544
> +#define FLD_DONE 0x548
> +#define FLD_SRC_WD_HT 0x54C
> +
> +/* n: min 0, max 14 */
> +#define FLD_PL_IN_BASE_ADDR_0_(n) (0x550 + 4 * (n))
> +#define FLD_PL_IN_BASE_ADDR_1_(n) (0x5C8 + 4 * (n))
> +#define FLD_PL_IN_BASE_ADDR_2_(n) (0x640 + 4 * (n))
> +#define FLD_PL_IN_BASE_ADDR_3_(n) (0x6B8 + 4 * (n))
> +#define FLD_SH_IN_BASE_ADDR_(n) (0x85C + 4 * (n))
> +
> +#define FLD_PL_IN_SIZE_0 0x730
> +#define FLD_PL_IN_STRIDE_0 0x734
> +#define FLD_PL_IN_SIZE_1 0x738
> +#define FLD_PL_IN_STRIDE_1 0x73C
> +#define FLD_PL_IN_SIZE_2_0 0x740
> +#define FLD_PL_IN_STRIDE_2_0 0x744
> +#define FLD_PL_IN_SIZE_2_1 0x748
> +#define FLD_PL_IN_STRIDE_2_1 0x74C
> +#define FLD_PL_IN_SIZE_2_2 0x750
> +#define FLD_PL_IN_STRIDE_2_2 0x754
> +#define FLD_PL_IN_SIZE_3 0x758
> +#define FLD_PL_IN_STRIDE_3 0x75C
> +
> +#define FLD_SH_IN_SIZE_0 0x7D8
> +#define FLD_SH_IN_STRIDE_0 0x7DC
> +#define FLD_TR_OUT_BASE_ADDR_0 0x7E0
> +#define FLD_TR_OUT_SIZE_0 0x7E4
> +#define FLD_TR_OUT_STRIDE_0 0x7E8
> +#define FLD_PP_OUT_BASE_ADDR_0 0x7EC
> +#define FLD_PP_OUT_SIZE_0 0x7F0
> +#define FLD_PP_OUT_STRIDE_0 0x7F4
> +#define FLD_SPARE 0x7F8
> +
> +#define FLD_BASE_ADDR_FACE_0_7_MSB 0x7FC
> +#define FLD_BASE_ADDR_FACE_8_14_MSB 0x800
> +
> +#define FLD_PL_IN_BASE_ADDR_0_0_7_MSB 0x804
> +#define FLD_PL_IN_BASE_ADDR_0_8_15_MSB 0x808
> +#define FLD_PL_IN_BASE_ADDR_0_16_23_MSB 0x80C
> +#define FLD_PL_IN_BASE_ADDR_0_24_29_MSB 0x810
> +
> +#define FLD_PL_IN_BASE_ADDR_1_0_7_MSB 0x814
> +#define FLD_PL_IN_BASE_ADDR_1_8_15_MSB 0x818
> +#define FLD_PL_IN_BASE_ADDR_1_16_23_MSB 0x81C
> +#define FLD_PL_IN_BASE_ADDR_1_24_29_MSB 0x820
> +
> +#define FLD_PL_IN_BASE_ADDR_2_0_7_MSB 0x824
> +#define FLD_PL_IN_BASE_ADDR_2_8_15_MSB 0x828
> +#define FLD_PL_IN_BASE_ADDR_2_16_23_MSB 0x82C
> +#define FLD_PL_IN_BASE_ADDR_2_24_29_MSB 0x830
> +
> +#define FLD_PL_IN_BASE_ADDR_3_0_7_MSB 0x834
> +#define FLD_PL_IN_BASE_ADDR_3_8_15_MSB 0x838
> +#define FLD_PL_IN_BASE_ADDR_3_16_23_MSB 0x83C
> +#define FLD_PL_IN_BASE_ADDR_3_24_29_MSB 0x840
> +
> +#define FLD_SH_IN_BASE_ADDR_0_7_MSB 0x844
> +#define FLD_SH_IN_BASE_ADDR_8_15_MSB 0x848
> +#define FLD_SH_IN_BASE_ADDR_16_23_MSB 0x84C
> +#define FLD_SH_IN_BASE_ADDR_24_29_MSB 0x850
> +
> +#define FLD_BS_IN_BASE_ADDR_0_7_MSB 0x8d4
> +#define FLD_BS_IN_BASE_ADDR_8_15_MSB 0x8d8
> +
> +#define FLD_TR_OUT_BASE_ADDR_0_MSB 0x854
> +#define FLD_PP_OUT_BASE_ADDR_0_MSB 0x858
> +
> +#define FLD_BS_IN_BASE_ADDR_14 0x894
> +
> +#define FLD_BS_BIAS 0x8E4
> +#define FLD_CV_FM_RANGE_0 0x8E8
> +#define FLD_CV_FM_RANGE_1 0x8EC
> +#define FLD_CV_PM_RANGE_0 0x8F0
> +#define FLD_CV_PM_RANGE_1 0x8F4
> +#define FLD_BS_RANGE_0 0x8F8
> +#define FLD_BS_RANGE_1 0x8FC
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH 16U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT 16U
> +#define MTK_FD_OUTPUT_MAX_WIDTH 4096U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT 4096U
> +
> +#define MTK_FD_HW_TIMEOUT_IN_MSEC 2000
> +#define RLT_NUM 48
> +#define GENDER_OUT 32
> +
> +#define ETHNICITY_RST_X_NUM 4
> +#define ETHNICITY_RST_Y_NUM 64
> +#define GENDER_RST_X_NUM 2
> +#define GENDER_RST_Y_NUM 64
> +#define METHNICITY_RST_NUM 4
> +#define MGENDER_RST_NUM 2
> +#define MAGE_RST_NUM 2
> +#define MINDIAN_RST_NUM 2
> +
> +#define FLD_FOREST 14
> +#define FLD_POINT 500
> +
> +#define FLD_STEP_NUM 6
> +#define FLD_MAX_FRAME 15
> +
> +#define FLD_STEP_BLINK 0
> +#define FLD_STEP_CV 1
> +#define FLD_STEP_FP 2
> +#define FLD_STEP_LEAF 3
> +#define FLD_STEP_KM02 4
> +#define FLD_STEP_KM13 5
> +
> +#define FLD_BLINK_WEIGHT_FOREST14_SIZE 6416
> +#define FLD_CV_SIZE 19392
> +#define FLD_FP_SIZE 80160
> +#define FLD_LEAFNODE_SIZE 4608000
> +#define FLD_TREE_KM02_SIZE 120000
> +#define FLD_TREE_KM13_SIZE 120000
> +#define FLD_OUTPUT_SIZE 112
> +
> +/* FLD_OUTPUT_X_SIZE: min: 1, max: 15 */
> +#define FLD_OUTPUT_X_SIZE 9
> +
> +#define RESULT_SIZE (RLT_NUM * MAX_FACE_NUM)
> +
> +#define SRZ_BIT (BIT_MASK(16) | BIT_MASK(12) | BIT_MASK(8) |
> BIT_MASK(0))
> +#define RESET_BIT16 BIT(16)
> +#define RESET_BIT17 BIT(17)
> +#define RESET_BIT (RESET_BIT16 | RESET_BIT17)
> +
> +#define ANCHOR_EN_NUM 5
> +
> +#define FD_STRIDE_SIZE 3
> +#define FD_MAXPOOL_SIZE 3
> +
> +#define ATTR_FD_STRIDE(n) ((n) =3D=3D 0 ? 2 : 1)
> +#define ATTR_FD_MAXPOOL(n) ((n) =3D=3D 0 ? 1 : 0)
> +#define FLD_FACE_INFO(m, n) (fld_face_info_0[n] + 4 * (m))
> +
> +enum Y2R_CONFIG {
> + Y2R_SRC_DST_FORMAT,
> + Y2R_IN_W_H,
> + Y2R_OUT_W_H,
> + Y2R_RA0_RA1_EN,
> + Y2R_IN_X_Y_SIZE0,
> + Y2R_IN_STRIDE0_BUS_SIZE0,
> + Y2R_IN_X_Y_SIZE1,
> + Y2R_IN_STRIDE1_BUS_SIZE1,
> + Y2R_OUT_X_Y_SIZE0,
> + Y2R_OUT_STRIDE0_BUS_SIZE0,
> + Y2R_OUT_X_Y_SIZE1,
> + Y2R_OUT_STRIDE1_BUS_SIZE1,
> + Y2R_OUT_X_Y_SIZE2,
> + Y2R_OUT_STRIDE2_BUS_SIZE2,
> + Y2R_IN_0,
> + Y2R_IN_1,
> + Y2R_OUT_0,
> + Y2R_OUT_1,
> + Y2R_OUT_2,
> + Y2R_RS_SEL_SRZ_EN,
> + Y2R_X_Y_MAG,
> + y2r_reserve0,
> + Y2R_SRZ_HORI_STEP,
> + Y2R_SRZ_VERT_STEP,
> + y2r_reserve1,
> + y2r_reserve2,
> + Y2R_PADDING_EN_UP_DOWN,
> + Y2R_PADDING_RIGHT_LEFT,
> + Y2R_CO2_FMT_MODE_EN,
> + Y2R_CO2_CROP_X,
> + Y2R_CO2_CROP_Y,
> + Y2R_CON_IN_BA_MSB,
> + Y2R_CON_OUT_BA_MSB
> +};
> +
> +enum RS_CONFIG {
> + RS_X_Y_MAG =3D 1,
> + RS_SRZ_HORI_STEP =3D 3,
> + RS_SRZ_VERT_STEP,
> + RS_INPUT_W_H =3D 7,
> + RS_OUTPUT_W_H,
> + RS_IN_X_Y_SIZE0 =3D 10,
> + RS_IN_STRIDE0,
> + RS_IN_X_Y_SIZE1,
> + RS_IN_STRIDE1,
> + RS_IN_X_Y_SIZE2,
> + RS_IN_STRIDE2,
> + RS_OUT_X_Y_SIZE0,
> + RS_OUT_STRIDE0,
> + RS_OUT_X_Y_SIZE1,
> + RS_OUT_STRIDE1,
> + RS_OUT_X_Y_SIZE2,
> + RS_OUT_STRIDE2,
> + RS_IN_0,
> + RS_IN_1,
> + RS_IN_2,
> + RS_OUT_0,
> + RS_OUT_1,
> + RS_OUT_2,
> + RS_CON_IN_BA_MSB,
> + RS_CON_OUT_BA_MSB,
> +};
> +
> +enum FD_CONFIG {
> + FD_INPUT_ROTATE =3D 1,
> + FD_CONV_WIDTH_MOD6,
> + FD_CONV_IMG_W_H =3D 4,
> + FD_IN_IMG_W_H,
> + FD_OUT_IMG_W_H,
> + FD_IN_X_Y_SIZE0 =3D 9,
> + FD_IN_STRIDE0_BUS_SIZE0,
> + FD_IN_X_Y_SIZE1,
> + FD_IN_STRIDE1_BUS_SIZE1,
> + FD_IN_X_Y_SIZE2,
> + FD_IN_STRIDE2_BUS_SIZE2,
> + FD_IN_X_Y_SIZE3,
> + FD_IN_STRIDE3_BUS_SIZE3,
> + FD_OUT_X_Y_SIZE0,
> + FD_OUT_STRIDE0_BUS_SIZE0,
> + FD_OUT_X_Y_SIZE1,
> + FD_OUT_STRIDE1_BUS_SIZE1,
> + FD_OUT_X_Y_SIZE2,
> + FD_OUT_STRIDE2_BUS_SIZE2,
> + FD_OUT_X_Y_SIZE3,
> + FD_OUT_STRIDE3_BUS_SIZE3,
> + FD_IN_0 =3D 27,
> + FD_IN_1,
> + FD_IN_2,
> + FD_IN_3,
> + FD_OUT_0,
> + FD_OUT_1,
> + FD_OUT_2,
> + FD_OUT_3,
> + FD_KERNEL_0,
> + FD_KERNEL_1,
> + FD_RPN_SET,
> + FD_IMAGE_COORD,
> + FD_IMAGE_COORD_XY_OFST,
> + FD_BIAS_ACCU =3D 47,
> + FD_SRZ_FDRZ_RS,
> + FD_SRZ_HORI_STEP,
> + FD_SRZ_VERT_STEP,
> + FD_SRZ_HORI_SUB_INT_OFST,
> + FD_SRZ_VERT_SUB_INT_OFST,
> + FD_CON_IN_BA_MSB,
> + FD_CON_OUT_BA_MSB,
> + FD_CON_KERNEL_BA_MSB
> +};
> +
> +static const unsigned int
> out_stride_size[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> + { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2, 0 }, { 1, 0, 0, 0 },
> + { 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
> + { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> + { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
> + { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> + { 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2, 0 },
> + { 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0, 0 },
> + { 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
> + { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
> + { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
> + { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> + { 1, 0, 0, 0 }, { 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
> + { 1, 0, 2, 0 }, { 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2, 2 },
> + { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> + { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 3, 0, 0, 0 }
> +};
> +
> +static const unsigned int fd_ker_rdma_size[RPN_LOOP_NUM] =3D {
> + 240, 1168, 1168, 272,
> + 2320, 2080, 1040, 4624,
> + 3104, 9232, 4624, 4128,
> + 1040, 4624, 4624, 1552,
> + 4624, 4624, 4128, 1040,
> + 1040, 528, 4160, 4160,
> + 2080, 2080, 2080, 1040,
> + 0
> +};
> +
> +static const unsigned int fd_out_stride2_in[FD_LOOP_NUM] =3D {
> + 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
> + 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
> +};
> +
> +static const unsigned int fd_stride_indices[FD_STRIDE_SIZE] =3D {
> + 0, 29, 58
> +};
> +
> +static const unsigned int fd_maxpool_indices[FD_MAXPOOL_SIZE] =3D {
> + 1, 30, 59
> +};
> +
> +static const unsigned int out_2size[FD_LOOP_NUM] =3D {
> + 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1,
> + 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
> +};
> +
> +static const unsigned int in_ch_pack[FD_LOOP_NUM] =3D {
> + 1,=C2=A0 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32=
,
> 32,
> + 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0, 1, 16, 16, 16, 16, 16,
> 32,
> + 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
> 32,
> + 32, 32, 32, 0, 1, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32,
> 32,
> + 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
> +};
> +
> +static const unsigned int outlayer[FD_LOOP_NUM] =3D {
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
> + 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
> +};
> +
> +static const unsigned int out_ch_pack[FD_LOOP_NUM] =3D {
> + 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
> 32,
> + 32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0, 16, 16, 16, 16, 16, 32,
> 32,
> + 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 16, 32, 32,
> 32,
> + 32, 32, 32, 0, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32,
> 32,
> + 32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0
> +};
> +
> +static const signed int
> fd_rdma_en[FD_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] =3D {
> + { { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> + { { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 1, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 1, 0 }, { 2, 0 }, { -1, -1 }, { -1, -1 } },
> + { { 3, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 1, 2 }, { 2, 2 }, { 4, 2 }, { 4, 3 } },
> + { { 5, 0 }, { 5, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 6, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 5, 0 }, { 5, 1 }, { 7, 0 }, { -1, -1 } },
> + { { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 5, 2 }, { 5, 3 }, { 7, 2 }, { 10, 2 } },
> + { { 11, 0 }, { 11, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 11, 0 }, { 11, 1 }, { 14, 0 }, { -1, -1 } },
> + { { 15, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 11, 0 }, { 11, 1 }, { 14, 0 }, { 17, 0 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 19, 0 }, { 22, 0 }, { 22, 1 }, { 25, 0 } },
> + { { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> + { { 29, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 30, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 30, 0 }, { 31, 0 }, { -1, -1 }, { -1, -1 } },
> + { { 32, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 30, 2 }, { 31, 2 }, { 33, 2 }, { 33, 3 } },
> + { { 34, 0 }, { 34, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 35, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 34, 0 }, { 34, 1 }, { 36, 0 }, { -1, -1 } },
> + { { 37, 0 }, { 37, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 38, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 34, 2 }, { 34, 3 }, { 36, 2 }, { 39, 2 } },
> + { { 40, 0 }, { 40, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 41, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 42, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 40, 0 }, { 40, 1 }, { 43, 0 }, { -1, -1 } },
> + { { 44, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 45, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 40, 0 }, { 40, 1 }, { 43, 0 }, { 46, 0 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 48, 0 }, { 51, 0 }, { 51, 1 }, { 54, 0 } },
> + { { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> + { { 58, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 59, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 59, 0 }, { 60, 0 }, { -1, -1 }, { -1, -1 } },
> + { { 61, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 59, 2 }, { 60, 2 }, { 62, 2 }, { 62, 3 } },
> + { { 63, 0 }, { 63, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 64, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 63, 0 }, { 63, 1 }, { 65, 0 }, { -1, -1 } },
> + { { 66, 0 }, { 66, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 67, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 63, 2 }, { 63, 3 }, { 65, 2 }, { 68, 2 } },
> + { { 69, 0 }, { 69, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 70, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 71, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 69, 0 }, { 69, 1 }, { 72, 0 }, { -1, -1 } },
> + { { 73, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 74, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 69, 0 }, { 69, 1 }, { 72, 0 }, { 75, 0 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 77, 0 }, { 80, 0 }, { 80, 1 }, { 83, 0 } }
> +};
> +
> +static const unsigned int
> attr_wdma_en[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> + { 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
> + { 1, 1, 1, 1 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 1, 0 },
> + { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> + { 1, 0, 0, 0 }, { 1, 0, 0, 0 }
> +};
> +
> +static const unsigned int attr_ker_rdma_size[ATTR_LOOP_NUM] =3D {
> + 240, 1168, 272, 2320,
> + 2080, 9232, 3104, 9232,
> + 4128, 1040, 4624, 4624,
> + 1552, 4624, 4624, 4128,
> + 9232, 272, 9232, 2320,
> + 144, 9232, 272, 9232,
> + 2320, 144
> +};
> +
> +static const unsigned int attr_out_stride2_as_in[ATTR_LOOP_NUM] =3D {
> + 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
> +};
> +
> +static const unsigned int attr_out_2size[ATTR_LOOP_NUM] =3D { /* O */
> + 1, 1, 0, 1, 1, 1, 0,
> + 1, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0, 0, 0,
> + 0, 0, 0, 0, 0
> +};
> +
> +/* [loop][ch][output_index] */
> +static const signed int
> attr_rdma_en[ATTR_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] =3D {
> + { { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> + { { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 0, 0 }, { 1, 0 }, { -1, -1 }, { -1, -1 } },
> + { { 2, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 0, 2 }, { 1, 2 }, { 3, 2 }, { 3, 3 } },
> + { { 4, 0 }, { 4, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 4, 0 }, { 4, 1 }, { 5, 0 }, { -1, -1 } },
> + { { 6, 0 }, { 6, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 4, 2 }, { 4, 3 }, { 5, 2 }, { 7, 2 } },
> + { { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 10, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 8, 0 }, { 8, 1 }, { 11, 0 }, { -1, -1 } },
> + { { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 8, 0 }, { 8, 1 }, { 11, 0 }, { 14, 0 } },
> + { { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 18, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 19, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 21, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> + { { 23, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> + { { 24, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } }
> +};
> +
> +static const unsigned int
> attr_wdma_size[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> + { 16384, 0, 4096, 0 },
> + { 16384, 0, 4096, 0 },
> + { 16384, 0, 0, 0 },
> + { 16384, 16384, 4096, 4096 },
> + { 8192, 8192, 2048, 2048 },
> + { 8192, 0, 2048, 0 },
> + { 8192, 8192, 0, 0 },
> + { 8192, 0, 2048, 0 },
> + { 2048, 2048, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 2048, 2048, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 0, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 1024, 0, 0, 0 },
> + { 0, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 0, 0, 0, 0 },
> + { 2048, 0, 0, 0 },
> + { 1024, 0, 0, 0 },
> + { 0, 0, 0, 0 }
> +};
> +
> +static const unsigned int fld_face_info_0[FLD_MAX_FRAME] =3D {
> + 0x440, 0x44C, 0x458, 0x464, 0x470, 0x47C, 0x488, 0x494, 0x4A4,
> + 0x4B0, 0x4BC, 0x4C8, 0x4D4, 0x4E0, 0x4EC
> +};
> +
> +struct aie_static_info_element {
> + u32 fd_wdma_size[OUTPUT_WDMA_WRA_NUM];
> + u32 out_xsize_plus_1;
> + u32 out_height;
> + u32 out_ysize_plus_1_stride2;
> + u32 out_stride;
> + u32 out_stride_stride2;
> + u32 out_width;
> + u32 img_width;
> + u32 img_height;
> + u32 stride2_out_width;
> + u32 stride2_out_height;
> + u32 out_xsize_plus_1_stride2;
> + u32 input_xsize_plus_1;
> +};
> +
> +struct aie_static_info {
> + struct aie_static_info_element inf_elm[FD_LOOP_NUM];
> +};
> +
> +enum aie_state {
> + STATE_NA,
> + STATE_INIT,
> + STATE_OPEN
> +};
> +
> +/**
> + * enum aie_mode - AIE Feature Mode
> + * @FDMODE: Face Detection.
> + * @ATTRIBUTEMODE: Gender and ethnicity detection.
> + * @FLDMODE: Locations of eyebrows, eyes, ears, nose,and mouth.
> + */
> +enum aie_mode {
> + FDMODE,
> + ATTRIBUTEMODE,
> + FLDMODE
> +};
> +
> +enum aie_format {
> + FMT_NA,
> + FMT_YUV_2P,
> + FMT_YVU_2P,
> + FMT_YUYV,
> + FMT_YVYU,
> + FMT_UYVY,
> + FMT_VYUY,
> + FMT_MONO,
> + FMT_YUV420_2P,
> + FMT_YUV420_1P
> +};
> +
> +enum aie_input_degree {
> + DEGREE_0,
> + DEGREE_90,
> + DEGREE_270,
> + DEGREE_180
> +};
> +
> +struct ethnicity_result {
> + signed short result[4][64];
> +};
> +
> +struct merged_ethnicity_result {
> + signed short result[4];
> +};
> +
> +struct merged_gender_result {
> + signed short result[2];
> +};
> +
> +struct merged_age_result {
> + signed short result[2];
> +};
> +
> +struct merged_is_indian_result {
> + signed short result[2];
> +};
> +
> +struct aie_reg_cfg {
> + u32 rs_adr;
> + u32 yuv2rgb_adr;
> + u32 fd_adr;
> + u32 fd_pose_adr;
> + u32 fd_mode;
> + u32 hw_result;
> + u32 hw_result1;
> + u32 reserved;
> +};
> +
> +struct aie_hw_rect {
> + u16 width;
> + u16 height;
> +};
> +
> +struct aie_para {
> + void *fd_fd_cfg_va;
> + void *fd_rs_cfg_va;
> + void *fd_yuv2rgb_cfg_va;
> +
> + void *attr_fd_cfg_va[MAX_ENQUE_FRAME_NUM];
> + void *attr_yuv2rgb_cfg_va[MAX_ENQUE_FRAME_NUM];
> +
> + void *rs_pym_rst_va[PYM_NUM][COLOR_NUM];
> +
> + dma_addr_t fd_fd_cfg_pa;
> + dma_addr_t fd_rs_cfg_pa;
> + dma_addr_t fd_yuv2rgb_cfg_pa;
> +
> + dma_addr_t attr_fd_cfg_pa[MAX_ENQUE_FRAME_NUM];
> + dma_addr_t attr_yuv2rgb_cfg_pa[MAX_ENQUE_FRAME_NUM];
> +
> + dma_addr_t rs_pym_rst_pa[PYM_NUM][COLOR_NUM];
> +
> + u32 sel_mode;
> + u32 src_img_fmt;
> + u32 rotate_degree;
> + s16 rpn_anchor_thrd;
> + u16 number_of_pyramid;
> + u32 src_img_addr;
> + u32 src_img_addr_uv;
> +
> + struct aie_hw_rect max_img_rect;
> + struct aie_hw_rect img_rect;
> + struct aie_hw_rect crop_rect;
> + struct aie_hw_rect pyramid_rect;
> + struct aie_hw_rect max_pyramid_rect;
> +};
> +
> +struct aie_attr_para {
> + u32 w_idx;
> + u32 r_idx;
> + u32 sel_mode[MAX_ENQUE_FRAME_NUM];
> + u16 img_width[MAX_ENQUE_FRAME_NUM];
> + u16 img_height[MAX_ENQUE_FRAME_NUM];
> + u16 crop_width[MAX_ENQUE_FRAME_NUM];
> + u16 crop_height[MAX_ENQUE_FRAME_NUM];
> + u32 src_img_fmt[MAX_ENQUE_FRAME_NUM];
> + u32 rotate_degree[MAX_ENQUE_FRAME_NUM];
> + u32 src_img_addr[MAX_ENQUE_FRAME_NUM];
> + u32 src_img_addr_uv[MAX_ENQUE_FRAME_NUM];
> +};
> +
> +struct aie_fd_dma_para {
> + void *fd_out_hw_va[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
> + void *fd_kernel_va[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM];
> + void *attr_out_hw_va[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
> + void *attr_kernel_va[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM];
> +
> + void *age_out_hw_va[MAX_ENQUE_FRAME_NUM];
> + void *gender_out_hw_va[MAX_ENQUE_FRAME_NUM];
> + void *is_indian_out_hw_va[MAX_ENQUE_FRAME_NUM];
> + void *ethnicity_out_hw_va[MAX_ENQUE_FRAME_NUM];
> +
> + dma_addr_t fd_out_hw_pa[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
> + dma_addr_t fd_kernel_pa[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM];
> + dma_addr_t attr_out_hw_pa[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
> + dma_addr_t attr_kernel_pa[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM];
> +
> + dma_addr_t age_out_hw_pa[MAX_ENQUE_FRAME_NUM];
> + dma_addr_t gender_out_hw_pa[MAX_ENQUE_FRAME_NUM];
> + dma_addr_t is_indian_out_hw_pa[MAX_ENQUE_FRAME_NUM];
> + dma_addr_t ethnicity_out_hw_pa[MAX_ENQUE_FRAME_NUM];
> +};
> +
> +struct aie_fd_fld_para {
> + void *fld_step_va[FLD_STEP_NUM][FLD_MAX_FRAME];
> + void *fld_output_va[FLD_MAX_FRAME];
> + dma_addr_t fld_step_pa[FLD_STEP_NUM][FLD_MAX_FRAME];
> + dma_addr_t fld_output_pa[FLD_MAX_FRAME];
> +};
> +
> +struct imem_buf_info {
> + void *va;
> + dma_addr_t pa;
> + unsigned int size;
> + unsigned int reserved;
> +};
> +
> +struct fd_buffer {
> + /* used by DMA HW */
> + u32 dma_addr;
> +};
> +
> +struct aie_clocks {
> + struct clk_bulk_data *clks;
> + unsigned int clk_num;
> +};
> +
> +struct mtk_aie_req_work {
> + struct work_struct work;
> + struct mtk_aie_dev *fd_dev;
> +};
> +
> +struct mtk_aie_variant {
> + unsigned int y2r_cfg_size;
> + unsigned int rs_cfg_size;
> + unsigned int fd_cfg_size;
> +};
> +
> +struct mtk_aie_dev {
> + struct device *dev;
> + struct mtk_aie_ctx *ctx;
> + struct v4l2_m2m_dev *m2m_dev;
> + struct device *larb;
> + struct aie_para *base_para;
> + struct aie_attr_para *attr_para;
> + struct aie_fd_dma_para *dma_para;
> +
> + struct aie_fd_fld_para *fld_para;
> +
> + struct aie_enq_info *aie_cfg;
> + struct workqueue_struct *frame_done_wq;
> + void __iomem *fd_base;
> + const struct mtk_aie_variant *variant;
> +
> + /* Input Buffer Pointer */
> + struct imem_buf_info rs_cfg_data;
> + struct imem_buf_info fd_cfg_data;
> + struct imem_buf_info yuv2rgb_cfg_data;
> + /* HW Output Buffer Pointer */
> + struct imem_buf_info rs_output_hw;
> + struct imem_buf_info fd_dma_hw;
> + struct imem_buf_info fd_dma_result_hw;
> + struct imem_buf_info fd_kernel_hw;
> + struct imem_buf_info fd_attr_dma_hw;
> + struct aie_static_info st_info;
> +
> + struct aie_reg_cfg reg_cfg;
> +
> + /* Fld fw buffer */
> + struct media_device mdev;
> + struct video_device vfd;
> + struct aie_clocks aie_clk;
> + struct v4l2_device v4l2_dev;
> +
> + /* Lock for V4L2 operations */
> + struct mutex vfd_lock;
> + /* Lock for device operations */
> + struct mutex dev_lock;
> + /* Lock for performance optimization */
> + struct mutex fd_lock;
> + struct imem_buf_info fd_fld_step_data;
> + struct imem_buf_info fd_fld_out_hw;
> +
> + int irq;
> + struct completion fd_job_finished;
> + struct delayed_work job_timeout_work;
> +
> + /* DRAM Buffer Size */
> + unsigned int fd_rs_cfg_size;
> + unsigned int fd_fd_cfg_size;
> + unsigned int fd_yuv2rgb_cfg_size;
> + unsigned int attr_fd_cfg_size;
> + unsigned int attr_yuv2rgb_cfg_size;
> +
> + /* HW Output Buffer Size */
> + unsigned int rs_pym_out_size[PYM_NUM];
> + unsigned int fd_dma_max_size;
> + unsigned int fd_dma_rst_max_size;
> + unsigned int fd_fd_kernel_size;
> + unsigned int fd_attr_kernel_size;
> + unsigned int fd_attr_dma_max_size;
> + unsigned int fd_attr_dma_rst_max_size;
> +
> + /* Fld size */
> + unsigned int fld_step_size;
> + unsigned int fld_out_size;
> +
> + wait_queue_head_t flushing_waitq;
> + atomic_t num_composing;
> + struct mtk_aie_req_work req_work;
> + unsigned int fd_state;
> + unsigned int fd_mem_size;
> + u32 fd_stream_count;
> +};
> +
> +struct mtk_aie_ctx {
> + struct mtk_aie_dev *fd_dev;
> + struct device *dev;
> + struct v4l2_fh fh;
> + struct v4l2_ctrl_handler hdl;
> + struct v4l2_pix_format_mplane src_fmt;
> + struct v4l2_meta_format dst_fmt;
> + struct v4l2_ctrl_aie_init user_init;
> + struct v4l2_ctrl_aie_param user_param;
> +};
> +
> +void aie_reset(struct mtk_aie_dev *fd);
> +int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init
> *user_init);
> +void aie_uninit(struct mtk_aie_dev *fd);
> +void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg);
> +void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg);
> +void aie_irqhandle(struct mtk_aie_dev *fd);
> +void aie_get_fd_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg);
> +void aie_get_attr_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg);
> +void aie_get_fld_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg);
> +#endif /*__MTK_AIE_H__*/
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> new file mode 100644
> index 000000000000..a327d55e2ef2
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> @@ -0,0 +1,2398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Bo Kong <bo.kong@mediatek.com>
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +#include "mtk_aie.h"
> +
> +static u32 aie_cmb_u16(u16 low, u16 high)
> +{
> + return ((u32)high << 16) | low;
> +}
> +
> +static u32 aie_cmb_stride(u16 low, u16 high)
> +{
> + return ((u32)high << 16) | (low & 0x000F);
> +}
> +
> +static inline u16 dif_x(const struct aie_enq_info *aie_cfg)
> +{
> + return (u16)(aie_cfg->src_roi.x2 - aie_cfg->src_roi.x1);
> +}
> +
> +static inline u16 dif_y(const struct aie_enq_info *aie_cfg)
> +{
> + return (u16)(aie_cfg->src_roi.y2 - aie_cfg->src_roi.y1);
> +}
> +
> +static inline void set_cmb_cfg(u32 *tbl, u16 index, u16 stride)
> +{
> + tbl[index] =3D aie_cmb_u16(tbl[index], stride);
> +}
> +
> +static inline void set_cmbst_cfg(u32 *tbl, u16 index, u16 stride)
> +{
> + tbl[index] =3D aie_cmb_stride(tbl[index], stride);
> +}
> +
> +static int get_fd_ker_rdma_size(int i, int j)
> +{
> + if (i < 0 || i >=3D FD_LOOP_NUM || j < 0 || j >=3D KERNEL_RDMA_RA_NUM)
> + return 0;
> +
> + return fd_ker_rdma_size[i % RPN_LOOP_NUM];
> +}
> +
> +static int get_fd_stride(int index)
> +{
> + int i;
> +
> + for (i =3D 0; i < FD_STRIDE_SIZE; i++) {
> + if (fd_stride_indices[i] =3D=3D index)
> + return 2;
> + }
> + return 1;
> +}
> +
> +static int is_fd_maxpool(int index)
> +{
> + int i;
> +
> + for (i =3D 0; i < FD_MAXPOOL_SIZE; i++) {
> + if (fd_maxpool_indices[i] =3D=3D index)
> + return 1;
> + }
> + return 0;
> +}
> +
> +static int get_attr_ker_rdma_size(int index, int j)
> +{
> + if (index < 0 || index >=3D ATTR_LOOP_NUM || j < 0 || j >=3D
> KERNEL_RDMA_RA_NUM)
> + return 0;
> +
> + return attr_ker_rdma_size[index];
> +}
> +
> +static inline unsigned int fld_step_align_size(int step_num, int
> frame)
> +{
> + if (step_num < 0 || step_num >=3D FLD_STEP_NUM || frame < 0 || frame
> >=3D FLD_MAX_FRAME)
> + return 0;
> +
> + switch (step_num) {
> + case FLD_STEP_BLINK:
> + return frame =3D=3D (FLD_MAX_FRAME - 1) ? 6528 : 0;
> + case FLD_STEP_CV:
> + return frame =3D=3D 0 ? 1536 : 1280;
> + case FLD_STEP_FP:
> + return 5376;
> + case FLD_STEP_LEAF:
> + return 307200;
> + case FLD_STEP_KM02:
> + case FLD_STEP_KM13:
> + return 8064;
> + }
> + return 0;
> +}
> +
> +static int aie_imem_alloc(struct mtk_aie_dev *fd, u32 size,
> + =C2=A0 struct imem_buf_info *bufinfo)
> +{
> + struct device *dev =3D fd->dev;
> + dma_addr_t dma_handle;
> + void *va;
> +
> + if (size =3D=3D 0) {
> + dev_dbg(fd->dev, "%s: size(%d)\n", __func__, size);
> + return -EINVAL;
> + }
> +
> + fd->fd_mem_size +=3D size;
> +
> + va =3D dma_alloc_coherent(dev, size, &dma_handle, GFP_KERNEL);
> + if (!va || dma_handle =3D=3D 0)
> + return -ENOMEM;
> +
> + bufinfo->va =3D va;
> + bufinfo->pa =3D dma_handle;
> + bufinfo->size =3D size;
> +
> + dev_dbg(fd->dev, "%s: vAddr(0x%p) size(%d)\n", __func__, va,=C2=A0
> size);
> +
> + return 0;
> +}
> +
> +static void aie_imem_free(struct mtk_aie_dev *fd, struct
> imem_buf_info *bufinfo)
> +{
> + dev_dbg(fd->dev, "%s: vAddr(0x%p) size(%d)\n", __func__, bufinfo-
> >va, bufinfo->size);
> +
> + if (bufinfo->va)
> + dma_free_coherent(fd->dev, bufinfo->size, bufinfo->va, bufinfo-
> >pa);
> +}
> +
> +static void aie_update_table(struct mtk_aie_dev *fd, u16 pym_width,
> + =C2=A0=C2=A0=C2=A0=C2=A0 u16 pym_height, bool binit)
> +{
> + int i, stridesize;
> + struct aie_static_info *pstv =3D &fd->st_info;
> +
> + pstv->inf_elm[PYMX_START_LOOP(2)].img_width =3D pym_width / 4;
> + pstv->inf_elm[PYMX_START_LOOP(2)].img_height =3D pym_height / 4;
> +
> + pstv->inf_elm[PYMX_START_LOOP(1)].img_width =3D pym_width / 2;
> + pstv->inf_elm[PYMX_START_LOOP(1)].img_height =3D pym_height / 2;
> +
> + pstv->inf_elm[PYMX_START_LOOP(0)].img_width =3D pym_width;
> + pstv->inf_elm[PYMX_START_LOOP(0)].img_height =3D pym_height;
> +
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + if (i !=3D PYMX_START_LOOP(2) && i !=3D PYMX_START_LOOP(1) &&
> + =C2=A0=C2=A0=C2=A0 i !=3D PYMX_START_LOOP(0)) {
> + if (fd_out_stride2_in[i] =3D=3D 1) {
> + pstv->inf_elm[i].img_width =3D
> + pstv->inf_elm[i - 1].stride2_out_width;
> + pstv->inf_elm[i].img_height =3D
> + pstv->inf_elm[i - 1].stride2_out_height;
> + } else {
> + pstv->inf_elm[i].img_width =3D pstv->inf_elm[i - 1].out_width;
> + pstv->inf_elm[i].img_height =3D pstv->inf_elm[i - 1].out_height;
> + }
> + }
> +
> + stridesize =3D get_fd_stride(i);
> + if (is_fd_maxpool(i)) {
> + pstv->inf_elm[i].out_width =3D
> + (pstv->inf_elm[i].img_width - 1) / 2 + 1;
> + pstv->inf_elm[i].out_height =3D
> + (pstv->inf_elm[i].img_height - 1) / 2=C2=A0 + 1;
> + } else {
> + pstv->inf_elm[i].out_width =3D (pstv->inf_elm[i].img_width - 1) /
> + stridesize + 1;
> + pstv->inf_elm[i].out_height =3D (pstv->inf_elm[i].img_height - 1) /
> + stridesize + 1;
> + }
> +
> + pstv->inf_elm[i].stride2_out_width =3D
> + ((pstv->inf_elm[i].out_width - 1) / 2 + 1) * out_2size[i];
> + pstv->inf_elm[i].stride2_out_height =3D
> + ((pstv->inf_elm[i].out_height - 1) / 2 + 1) * out_2size[i];
> +
> + if (outlayer[i] =3D=3D 1) {
> + pstv->inf_elm[i].out_xsize_plus_1 =3D
> + pstv->inf_elm[i].out_width * out_ch_pack[i] * 2;
> + pstv->inf_elm[i].out_stride =3D
> + round_up(pstv->inf_elm[i].out_xsize_plus_1 * ANCHOR_EN_NUM, 16);
> + pstv->inf_elm[i].out_xsize_plus_1_stride2 =3D
> + ((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> + out_ch_pack[i] * 2 * out_2size[i];
> + } else {
> + pstv->inf_elm[i].out_xsize_plus_1 =3D
> + pstv->inf_elm[i].out_width * out_ch_pack[i];
> + pstv->inf_elm[i].out_stride =3D
> + round_up(pstv->inf_elm[i].out_xsize_plus_1, 16);
> + pstv->inf_elm[i].out_xsize_plus_1_stride2 =3D
> + ((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> + out_ch_pack[i] * out_2size[i];
> + }
> +
> + pstv->inf_elm[i].out_stride_stride2 =3D
> + round_up(pstv->inf_elm[i].out_xsize_plus_1_stride2, 16);
> +
> + if (out_2size[i] =3D=3D 1)
> + pstv->inf_elm[i].out_ysize_plus_1_stride2 =3D
> + (pstv->inf_elm[i].out_height - 1) / 2 + 1;
> + else
> + pstv->inf_elm[i].out_ysize_plus_1_stride2 =3D pstv-
> >inf_elm[i].out_height;
> +
> + if (binit) {
> + if (i =3D=3D RPNX_LOOP_NUM(2) || i =3D=3D RPNX_LOOP_NUM(1) || i =3D=3D
> RPNX_LOOP_NUM(0))
> + pstv->inf_elm[i].fd_wdma_size[0] =3D RESULT_SIZE;
> + else
> + pstv->inf_elm[i].fd_wdma_size[0] =3D pstv->inf_elm[i].out_height *
> + =C2=A0=C2=A0 pstv->inf_elm[i].out_stride;
> +
> + if (outlayer[i] =3D=3D 1) {
> + if (out_stride_size[i][1])
> + pstv->inf_elm[i].fd_wdma_size[1] =3D
> + pstv->inf_elm[i].fd_wdma_size[0];
> + if (out_stride_size[i][2])
> + pstv->inf_elm[i].fd_wdma_size[2] =3D
> + pstv->inf_elm[i].fd_wdma_size[0];
> + if (out_stride_size[i][3])
> + pstv->inf_elm[i].fd_wdma_size[3] =3D
> + pstv->inf_elm[i].fd_wdma_size[0];
> + } else {
> + if (out_stride_size[i][1])
> + pstv->inf_elm[i].fd_wdma_size[1] =3D
> + pstv->inf_elm[i].out_height *
> + pstv->inf_elm[i].out_stride;
> + if (out_stride_size[i][2])
> + pstv->inf_elm[i].fd_wdma_size[2] =3D
> + pstv->inf_elm[i].out_ysize_plus_1_stride2 *
> + pstv->inf_elm[i].out_stride_stride2;
> + if (out_stride_size[i][3])
> + pstv->inf_elm[i].fd_wdma_size[3] =3D
> + pstv->inf_elm[i].out_ysize_plus_1_stride2 *
> + pstv->inf_elm[i].out_stride_stride2;
> + }
> + }
> +
> + if (in_ch_pack[i] =3D=3D 1)
> + pstv->inf_elm[i].input_xsize_plus_1 =3D
> + round_up(pstv->inf_elm[i].img_width, 8);
> + else
> + pstv->inf_elm[i].input_xsize_plus_1 =3D
> + pstv->inf_elm[i].img_width * in_ch_pack[i];
> + }
> +}
> +
> +static void aie_update_buf_params(struct mtk_aie_dev *fd, u16
> max_img_width,
> + =C2=A0 u16 max_img_height)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + u32 size;
> + u8 i, j;
> +
> + fd->base_para->max_img_rect.width =3D max_img_width;
> + fd->base_para->max_img_rect.height =3D max_img_height;
> + fd->fd_dma_max_size =3D 0;
> + fd->fd_dma_rst_max_size =3D 0;
> + fd->fd_fd_kernel_size =3D 0;
> + fd->fd_attr_kernel_size =3D 0;
> + fd->fd_attr_dma_max_size =3D 0;
> + fd->fd_attr_dma_rst_max_size =3D 0;
> +
> + /* FDMODE Dram Buffer Size */
> + fd->fd_rs_cfg_size =3D 4 * fd->variant->rs_cfg_size * 2;
> + fd->fd_fd_cfg_size =3D 4 * fd->variant->fd_cfg_size * FD_LOOP_NUM;
> + fd->fd_yuv2rgb_cfg_size =3D 4 * fd->variant->y2r_cfg_size;
> +
> + /* ATTRMODE Dram Buffer Size */
> + fd->attr_fd_cfg_size =3D 4 * fd->variant->fd_cfg_size *
> ATTR_LOOP_NUM;
> + fd->attr_yuv2rgb_cfg_size =3D 4 * fd->variant->y2r_cfg_size;
> +
> + /* HW Output Buffer Size */
> + fd->rs_pym_out_size[0] =3D fd->base_para->max_pyramid_rect.width *
> + fd->base_para->max_pyramid_rect.height;
> + fd->rs_pym_out_size[1] =3D fd->rs_pym_out_size[0] / 2;
> + fd->rs_pym_out_size[2] =3D fd->rs_pym_out_size[0] / 4;
> +
> + /* FDMODE Dram Buffer Size */
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (out_stride_size[i][j]) {
> + if ((i =3D=3D RPNX_LOOP_NUM(2) || i =3D=3D RPNX_LOOP_NUM(1) ||
> + =C2=A0=C2=A0=C2=A0=C2=A0 i =3D=3D RPNX_LOOP_NUM(0)) && j =3D=3D 0)
> + fd->fd_dma_rst_max_size +=3D pstv->inf_elm[i].fd_wdma_size[j];
> + else
> + fd->fd_dma_max_size +=3D pstv->inf_elm[i].fd_wdma_size[j];
> + }
> + }
> + }
> +
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + size =3D get_fd_ker_rdma_size(i, j);
> + if (size)
> + fd->fd_fd_kernel_size +=3D size;
> + }
> + }
> +
> + /* ATTRMODE Dram Buffer Size */
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (attr_wdma_en[i][j]) {
> + if ((i =3D=3D AGE_OUT_RGS || i =3D=3D GENDER_OUT_RGS ||
> + =C2=A0=C2=A0=C2=A0=C2=A0 i =3D=3D INDIAN_OUT_RGS || i =3D=3D ETHNICITY_=
OUT_RGS) && j =3D=3D 0)
> + fd->fd_attr_dma_rst_max_size +=3D
> + ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + else
> + fd->fd_attr_dma_max_size +=3D attr_wdma_size[i][j];
> + }
> + }
> + }
> +
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++)
> + fd->fd_attr_kernel_size +=3D get_attr_ker_rdma_size(i, j);
> + }
> +
> + /* FD Pose secure result output buffer: result size * 3 loops */
> + fd->fd_dma_rst_max_size +=3D RESULT_SIZE * 3;
> +
> + /* FLD size */
> + fd->fld_step_size =3D 0;
> + for (i =3D 0; i < FLD_STEP_NUM; i++)
> + for (j =3D 0; j < FLD_MAX_FRAME; j++)
> + fd->fld_step_size +=3D fld_step_align_size(i, j);
> +
> + fd->fld_out_size =3D FLD_OUTPUT_SIZE * FLD_MAX_FRAME;
> +}
> +
> +static int aie_alloc_dram_buf(struct mtk_aie_dev *fd)
> +{
> + u32 alloc_size;
> + int ret;
> + u8 i;
> +
> + /* RS DRAM */
> + alloc_size =3D fd->fd_rs_cfg_size;
> + dev_dbg(fd->dev, "RS CFG:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->rs_cfg_data);
> + if (ret)
> + goto dma_alloc_fail;
> + /* FD MODE */
> + fd->base_para->fd_rs_cfg_pa =3D fd->rs_cfg_data.pa;
> + fd->base_para->fd_rs_cfg_va =3D fd->rs_cfg_data.va;
> +
> + /* FD DRAM */
> + alloc_size =3D fd->fd_fd_cfg_size + fd->attr_fd_cfg_size *
> MAX_ENQUE_FRAME_NUM;
> + dev_dbg(fd->dev, "FD CFG:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_cfg_data);
> + if (ret)
> + goto dma_alloc_fail;
> + /* FD MODE */
> + fd->base_para->fd_fd_cfg_pa =3D fd->fd_cfg_data.pa;
> + fd->base_para->fd_fd_cfg_va =3D fd->fd_cfg_data.va;
> + /* ATTR MODE */
> + fd->base_para->attr_fd_cfg_pa[0] =3D
> + fd->base_para->fd_fd_cfg_pa + fd->fd_fd_cfg_size;
> + fd->base_para->attr_fd_cfg_va[0] =3D
> + fd->base_para->fd_fd_cfg_va + fd->fd_fd_cfg_size;
> +
> + for (i =3D 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> + fd->base_para->attr_fd_cfg_pa[i] =3D
> + fd->base_para->attr_fd_cfg_pa[i - 1] + fd->attr_fd_cfg_size;
> + fd->base_para->attr_fd_cfg_va[i] =3D
> + fd->base_para->attr_fd_cfg_va[i - 1] + fd->attr_fd_cfg_size;
> + }
> +
> + /* YUV2RGB DRAM */
> + alloc_size =3D fd->fd_yuv2rgb_cfg_size +
> + =C2=A0=C2=A0=C2=A0=C2=A0 fd->attr_yuv2rgb_cfg_size * MAX_ENQUE_FRAME_NU=
M;
> + dev_dbg(fd->dev, "YUV2RGB CFG:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->yuv2rgb_cfg_data);
> + if (ret)
> + goto dma_alloc_fail;
> + /* FD MODE */
> + fd->base_para->fd_yuv2rgb_cfg_pa =3D fd->yuv2rgb_cfg_data.pa;
> + fd->base_para->fd_yuv2rgb_cfg_va =3D fd->yuv2rgb_cfg_data.va;
> +
> + /* ATTR MODE */
> + fd->base_para->attr_yuv2rgb_cfg_pa[0] =3D
> + fd->base_para->fd_yuv2rgb_cfg_pa + fd->fd_yuv2rgb_cfg_size;
> + fd->base_para->attr_yuv2rgb_cfg_va[0] =3D
> + fd->base_para->fd_yuv2rgb_cfg_va + fd->fd_yuv2rgb_cfg_size;
> +
> + for (i =3D 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> + fd->base_para->attr_yuv2rgb_cfg_pa[i] =3D
> + fd->base_para->attr_yuv2rgb_cfg_pa[i - 1] + fd-
> >attr_yuv2rgb_cfg_size;
> + fd->base_para->attr_yuv2rgb_cfg_va[i] =3D
> + fd->base_para->attr_yuv2rgb_cfg_va[i - 1] + fd-
> >attr_yuv2rgb_cfg_size;
> + }
> +
> + return 0;
> +dma_alloc_fail:
> + aie_imem_free(fd, &fd->fd_cfg_data);
> + aie_imem_free(fd, &fd->rs_cfg_data);
> +
> + return ret;
> +}
> +
> +static int aie_alloc_output_buf(struct mtk_aie_dev *fd)
> +{
> + u32 alloc_size =3D 0, pa_off =3D 0, va_off =3D 0;
> + int i, j;
> + int ret;
> +
> + for (i =3D 0; i < PYM_NUM; i++)
> + alloc_size +=3D fd->rs_pym_out_size[i] * 3;
> + dev_dbg(fd->dev, "RS OUT:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->rs_output_hw);
> + if (ret)
> + return ret;
> +
> + for (i =3D 0; i < PYM_NUM; i++) {
> + for (j =3D 0; j < COLOR_NUM; j++) {
> + fd->base_para->rs_pym_rst_pa[i][j] =3D fd->rs_output_hw.pa + pa_off;
> + pa_off +=3D fd->rs_pym_out_size[i];
> +
> + fd->base_para->rs_pym_rst_va[i][j] =3D fd->rs_output_hw.va + va_off;
> + va_off +=3D fd->rs_pym_out_size[i];
> + }
> + }
> +
> + return 0;
> +}
> +
> +static void aie_alloc_normal(struct mtk_aie_dev *fd, int start, int
> end)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + int i, j, pi, pj;
> +
> + if (start <=3D 0 || end <=3D start || end >=3D FD_LOOP_NUM) {
> + dev_err(fd->dev, "%s: start =3D %d, end =3D %d\n", __func__, start,
> end);
> + return;
> + }
> +
> + pi =3D start - 1;
> + pj =3D 0;
> + for (i =3D start; i < end + 1; i++) {
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (out_stride_size[i][j]) {
> + fd->dma_para->fd_out_hw_pa[i][j] =3D
> + fd->dma_para->fd_out_hw_pa[pi][pj] +
> + pstv->inf_elm[pi].fd_wdma_size[pj];
> + pi =3D i;
> + pj =3D j;
> + }
> + }
> + }
> +}
> +
> +static int aie_alloc_fddma_buf(struct mtk_aie_dev *fd)
> +{
> + u32 alloc_size;
> + int ret;
> +
> + alloc_size =3D fd->fd_dma_max_size;
> + dev_dbg(fd->dev, "FD DMA:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_dma_hw);
> + if (ret)
> + goto dma_alloc_fail;
> +
> + alloc_size =3D fd->fd_fd_kernel_size + fd->fd_attr_kernel_size;
> + dev_dbg(fd->dev, "FD KERNEL:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_kernel_hw);
> + if (ret)
> + goto dma_alloc_fail;
> +
> + alloc_size =3D fd->fd_attr_dma_max_size;
> + dev_dbg(fd->dev, "ATTR DMA:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_attr_dma_hw);
> + if (ret)
> + goto dma_alloc_fail;
> +
> + alloc_size =3D fd->fd_dma_rst_max_size + fd-
> >fd_attr_dma_rst_max_size;
> + dev_dbg(fd->dev, "RESULT DMA:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_dma_result_hw);
> + if (ret)
> + goto dma_alloc_fail;
> +
> + return 0;
> +
> +dma_alloc_fail:
> + aie_imem_free(fd, &fd->fd_attr_dma_hw);
> + aie_imem_free(fd, &fd->fd_kernel_hw);
> + aie_imem_free(fd, &fd->fd_dma_hw);
> +
> + return ret;
> +}
> +
> +static int aie_alloc_fld_buf(struct mtk_aie_dev *fd)
> +{
> + u32 alloc_size;
> + int ret;
> +
> + alloc_size =3D fd->fld_step_size;
> + dev_dbg(fd->dev, "FLD STEP:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_fld_step_data);
> + if (ret)
> + return ret;
> +
> + alloc_size =3D fd->fld_out_size;
> + dev_dbg(fd->dev, "FLD OUT:");
> + ret =3D aie_imem_alloc(fd, alloc_size, &fd->fd_fld_out_hw);
> + if (ret)
> + goto fld_step;
> +
> + return 0;
> +fld_step:
> + aie_imem_free(fd, &fd->fd_fld_step_data);
> +
> + return ret;
> +}
> +
> +static void aie_calculate_pa(struct mtk_aie_dev *fd, struct
> aie_static_info *pstv, int i)
> +{
> + fd->dma_para->fd_out_hw_pa[i][0] =3D fd->dma_para->fd_out_hw_pa[i -
> 1][1] +
> + =C2=A0=C2=A0 pstv->inf_elm[i - 1].fd_wdma_size[1];
> + fd->dma_para->fd_out_hw_pa[i][1] =3D fd->dma_para->fd_out_hw_pa[i][0]
> +
> + =C2=A0=C2=A0 pstv->inf_elm[i].out_xsize_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 1][0] =3D fd->dma_para-
> >fd_out_hw_pa[i][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 * pstv->inf_elm[i + 1].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 1][1] =3D fd->dma_para-
> >fd_out_hw_pa[i][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 * pstv->inf_elm[i + 1].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 2][0] =3D fd->dma_para-
> >fd_out_hw_pa[i][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * pstv->inf_elm[i + 2].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 3][0] =3D fd->dma_para-
> >fd_out_hw_pa[i][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 1].fd_wdma_size[=
0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 1].fd_wdma_size[=
1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 2].fd_wdma_size[=
0];
> + fd->dma_para->fd_out_hw_pa[i + 3][1] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].fd_wdma_size[=
0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].fd_wdma_size[=
2] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 4].fd_wdma_size[=
0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 4].fd_wdma_size[=
2] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 5].fd_wdma_size[=
0];
> + fd->dma_para->fd_out_hw_pa[i + 3][2] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].out_xsize_plu=
s_1;
> + fd->dma_para->fd_out_hw_pa[i + 3][3] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].out_xsize_plu=
s_1;
> + fd->dma_para->fd_out_hw_pa[i + 4][0] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 * pstv->inf_elm[i + 4].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 4][1] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 * pstv->inf_elm[i + 4].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 4][2] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 * pstv->inf_elm[i + 4].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 4][3] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 * pstv->inf_elm[i + 4].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 5][0] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * pstv->inf_elm[i + 5].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 5][1] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * pstv->inf_elm[i + 5].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 6][0] =3D fd->dma_para->fd_out_hw_pa[i
> + 3][1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].fd_wdma_size[=
1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 3].fd_wdma_size[=
3] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 4].fd_wdma_size[=
1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 4].fd_wdma_size[=
3] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 5].fd_wdma_size[=
1];
> + fd->dma_para->fd_out_hw_pa[i + 6][1] =3D fd->dma_para->fd_out_hw_pa[i
> + 6][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i + 6].out_xsize_plu=
s_1;
> + fd->dma_para->fd_out_hw_pa[i + 7][0] =3D fd->dma_para->fd_out_hw_pa[i
> + 6][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 * pstv->inf_elm[i + 7].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 7][1] =3D fd->dma_para->fd_out_hw_pa[i
> + 6][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 * pstv->inf_elm[i + 7].out_xsize=
_plus_1;
> + fd->dma_para->fd_out_hw_pa[i + 8][0] =3D fd->dma_para->fd_out_hw_pa[i
> + 6][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * pstv->inf_elm[i + 8].out_xsize=
_plus_1;
> +}
> +
> +static void aie_arrange_fddma_buf(struct mtk_aie_dev *fd)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + dma_addr_t current_pa;
> + void *current_va;
> + u8 i, j;
> +
> + /* 0 ~ 18 */
> + fd->dma_para->fd_out_hw_pa[0][0] =3D fd->fd_dma_hw.pa;
> + aie_alloc_normal(fd, 1, 18);
> +
> + /* 19 ~ 27 */
> + aie_calculate_pa(fd, pstv, 19);
> +
> + /* 29 ~ 47 */
> + fd->dma_para->fd_out_hw_pa[29][0] =3D fd->dma_para-
> >fd_out_hw_pa[25][0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[25].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[25].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[26].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[26].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[27].fd_wdma_size[0];
> + aie_alloc_normal(fd, 30, 47);
> +
> + /* 48 ~ 56 */
> + aie_calculate_pa(fd, pstv, 48);
> +
> + /* 58 ~ 76 */
> + fd->dma_para->fd_out_hw_pa[58][0] =3D fd->dma_para-
> >fd_out_hw_pa[54][0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[54].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[54].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[55].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[55].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0 pstv->inf_elm[56].fd_wdma_size[0];
> + aie_alloc_normal(fd, 59, 76);
> +
> + /* 77 ~ 85 */
> + aie_calculate_pa(fd, pstv, 77);
> +
> + /* VA : except 28, 57, 86 */
> + /* 0 ~ 86 */
> + fd->dma_para->fd_out_hw_va[0][0] =3D fd->fd_dma_hw.va;
> + for (i =3D 1; i < FD_LOOP_NUM; i++) {
> + if (i =3D=3D RPNX_LOOP_NUM(2) || i =3D=3D RPNX_LOOP_NUM(1) || i =3D=3D
> RPNX_LOOP_NUM(0))
> + continue;
> + for (j =3D 0; j < 4; j++) {
> + if (out_stride_size[i][j]) {
> + fd->dma_para->fd_out_hw_va[i][j] =3D fd->fd_dma_hw.va +
> + fd->dma_para->fd_out_hw_pa[i][j] - fd->fd_dma_hw.pa;
> + }
> + }
> + }
> +
> + current_pa =3D fd->dma_para->fd_out_hw_pa[83][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[83].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[83].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[84].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[84].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[85].fd_wdma_size[0];
> + current_va =3D fd->dma_para->fd_out_hw_va[83][0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[83].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[83].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[84].fd_wdma_size[0] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[84].fd_wdma_size[1] +
> + =C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[85].fd_wdma_size[0];
> +
> + dev_dbg(fd->dev, "%s: current VA =3D %p\n", __func__, current_va);
> +}
> +
> +static void aie_arrange_kernel_buf(struct mtk_aie_dev *fd)
> +{
> + void *current_va;
> + dma_addr_t current_pa;
> + u32 size, attrsize;
> + u8 i, j;
> +
> + current_pa =3D fd->fd_kernel_hw.pa;
> + current_va =3D fd->fd_kernel_hw.va;
> +
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + size =3D get_fd_ker_rdma_size(i, j);
> + if (size) {
> + fd->dma_para->fd_kernel_pa[i][j] =3D current_pa;
> + fd->dma_para->fd_kernel_va[i][j] =3D current_va;
> + current_pa +=3D size;
> + current_va +=3D size;
> + }
> + }
> + }
> +
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + attrsize =3D get_attr_ker_rdma_size(i, j);
> + fd->dma_para->attr_kernel_pa[i][j] =3D current_pa;
> + fd->dma_para->attr_kernel_va[i][j] =3D current_va;
> + current_pa +=3D attrsize;
> + current_va +=3D attrsize;
> + }
> + }
> +
> + dev_dbg(fd->dev, "%s: current VA =3D %p\n", __func__, current_va);
> +}
> +
> +static void aie_arrange_attrdma_buf(struct mtk_aie_dev *fd)
> +{
> + void *current_va;
> + dma_addr_t current_pa;
> + u8 i, j;
> +
> + current_pa =3D fd->fd_attr_dma_hw.pa;
> + current_va =3D fd->fd_attr_dma_hw.va;
> +
> + /* attribute mode */
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (attr_wdma_en[i][j]) {
> + fd->dma_para->attr_out_hw_pa[i][j] =3D current_pa;
> + fd->dma_para->attr_out_hw_va[i][j] =3D current_va;
> + current_pa +=3D attr_wdma_size[i][j];
> + current_va +=3D attr_wdma_size[i][j];
> + }
> + }
> + }
> +
> + dev_dbg(fd->dev, "%s: current VA =3D %p\n", __func__, current_va);
> +}
> +
> +static void aie_arrange_result_dma_buf(struct mtk_aie_dev *fd)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + dma_addr_t currentresult_pa;
> + void *currentresult_va;
> + u8 i;
> +
> + currentresult_pa =3D fd->fd_dma_result_hw.pa;
> + currentresult_va =3D fd->fd_dma_result_hw.va;
> +
> + fd->dma_para->fd_out_hw_pa[RPNX_LOOP_NUM(2)][0] =3D currentresult_pa;
> + fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(2)][0] =3D currentresult_va;
> + currentresult_pa +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(2)].fd_wdma_size[0];
> + currentresult_va +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(2)].fd_wdma_size[0];
> + fd->dma_para->fd_out_hw_pa[RPNX_LOOP_NUM(1)][0] =3D currentresult_pa;
> + fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(1)][0] =3D currentresult_va;
> + currentresult_pa +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(1)].fd_wdma_size[0];
> + currentresult_va +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(1)].fd_wdma_size[0];
> + fd->dma_para->fd_out_hw_pa[RPNX_LOOP_NUM(0)][0] =3D currentresult_pa;
> + fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(0)][0] =3D currentresult_va;
> + currentresult_pa +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(0)].fd_wdma_size[0];
> + currentresult_va +=3D pstv-
> >inf_elm[RPNX_LOOP_NUM(0)].fd_wdma_size[0];
> +
> + fd->dma_para->attr_out_hw_pa[AGE_OUT_RGS][0] =3D currentresult_pa;
> + fd->dma_para->attr_out_hw_va[AGE_OUT_RGS][0] =3D currentresult_va;
> + currentresult_pa +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + currentresult_va +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + fd->dma_para->attr_out_hw_pa[GENDER_OUT_RGS][0] =3D currentresult_pa;
> + fd->dma_para->attr_out_hw_va[GENDER_OUT_RGS][0] =3D currentresult_va;
> + currentresult_pa +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + currentresult_va +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + fd->dma_para->attr_out_hw_pa[INDIAN_OUT_RGS][0] =3D currentresult_pa;
> + fd->dma_para->attr_out_hw_va[INDIAN_OUT_RGS][0] =3D currentresult_va;
> + currentresult_pa +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + currentresult_va +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + fd->dma_para->attr_out_hw_pa[ETHNICITY_OUT_RGS][0] =3D
> currentresult_pa;
> + fd->dma_para->attr_out_hw_va[ETHNICITY_OUT_RGS][0] =3D
> currentresult_va;
> + currentresult_pa +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> + currentresult_va +=3D ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
> +
> + /* need to prepare 10 buffers to store 10 times result */
> + fd->dma_para->age_out_hw_pa[0] =3D fd->dma_para-
> >attr_out_hw_pa[AGE_OUT_RGS][0];
> + fd->dma_para->age_out_hw_va[0] =3D fd->dma_para-
> >attr_out_hw_va[AGE_OUT_RGS][0];
> + fd->dma_para->gender_out_hw_pa[0] =3D fd->dma_para-
> >attr_out_hw_pa[GENDER_OUT_RGS][0];
> + fd->dma_para->gender_out_hw_va[0] =3D fd->dma_para-
> >attr_out_hw_va[GENDER_OUT_RGS][0];
> + fd->dma_para->is_indian_out_hw_pa[0] =3D
> + fd->dma_para->attr_out_hw_pa[INDIAN_OUT_RGS][0];
> + fd->dma_para->is_indian_out_hw_va[0] =3D
> + fd->dma_para->attr_out_hw_va[INDIAN_OUT_RGS][0];
> + fd->dma_para->ethnicity_out_hw_pa[0] =3D fd->dma_para-
> >attr_out_hw_pa[ETHNICITY_OUT_RGS][0];
> + fd->dma_para->ethnicity_out_hw_va[0] =3D fd->dma_para-
> >attr_out_hw_va[ETHNICITY_OUT_RGS][0];
> +
> + for (i =3D 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> + fd->dma_para->age_out_hw_pa[i] =3D
> + fd->dma_para->age_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->age_out_hw_va[i] =3D
> + fd->dma_para->age_out_hw_va[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->gender_out_hw_pa[i] =3D
> + fd->dma_para->gender_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->gender_out_hw_va[i] =3D
> + fd->dma_para->gender_out_hw_va[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->is_indian_out_hw_pa[i] =3D
> + fd->dma_para->is_indian_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->is_indian_out_hw_va[i] =3D
> + fd->dma_para->is_indian_out_hw_va[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->ethnicity_out_hw_pa[i] =3D
> + fd->dma_para->ethnicity_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
> + fd->dma_para->ethnicity_out_hw_va[i] =3D
> + fd->dma_para->ethnicity_out_hw_va[i - 1] + ATTR_OUT_SIZE;
> + }
> +
> + memset(fd->fd_dma_result_hw.va, 0, fd->fd_dma_result_hw.size);
> +
> + dev_dbg(fd->dev, "%s: current VA =3D %p\n", __func__,
> currentresult_va);
> +}
> +
> +static void aie_arrange_fld_buf(struct mtk_aie_dev *fd)
> +{
> + unsigned int offset =3D 0;
> + u8 i, j;
> +
> + for (i =3D 0; i < FLD_STEP_NUM; i++) {
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + fd->fld_para->fld_step_va[i][j] =3D fd->fd_fld_step_data.va + offset;
> + fd->fld_para->fld_step_pa[i][j] =3D fd->fd_fld_step_data.pa + offset;
> + offset +=3D fld_step_align_size(i, j);
> + }
> + }
> +
> + for (i =3D 0, offset =3D 0; i < FLD_MAX_FRAME; i++) {
> + fd->fld_para->fld_output_va[i] =3D fd->fd_fld_out_hw.va + offset;
> + fd->fld_para->fld_output_pa[i] =3D fd->fd_fld_out_hw.pa + offset;
> + offset +=3D FLD_OUTPUT_SIZE;
> + }
> +}
> +
> +static void aie_update_fddma_buf(struct mtk_aie_dev *fd)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + u8 i, j;
> +
> + /* 19 ~ 27 */
> + aie_calculate_pa(fd, pstv, 19);
> +
> + /* 48 ~ 56 */
> + aie_calculate_pa(fd, pstv, 48);
> +
> + /* 77 ~ 85 */
> + aie_calculate_pa(fd, pstv, 77);
> +
> + /* VA : except 28, 57, 86 */
> + /* 0 ~ 86 */
> + fd->dma_para->fd_out_hw_va[0][0] =3D fd->fd_dma_hw.va;
> + for (i =3D 1; i < FD_LOOP_NUM; i++) {
> + if (i =3D=3D RPNX_LOOP_NUM(2) || i =3D=3D RPNX_LOOP_NUM(1) || i =3D=3D
> RPNX_LOOP_NUM(0))
> + continue;
> + for (j =3D 0; j < 4; j++) {
> + if (out_stride_size[i][j]) {
> + fd->dma_para->fd_out_hw_va[i][j] =3D fd->fd_dma_hw.va +
> + fd->dma_para->fd_out_hw_pa[i][j] - fd->fd_dma_hw.pa;
> + }
> + }
> + }
> +}
> +
> +static void aie_free_dram_buf(struct mtk_aie_dev *fd)
> +{
> + aie_imem_free(fd, &fd->rs_cfg_data);
> + aie_imem_free(fd, &fd->fd_cfg_data);
> + aie_imem_free(fd, &fd->yuv2rgb_cfg_data);
> +}
> +
> +static void aie_free_output_buf(struct mtk_aie_dev *fd)
> +{
> + aie_imem_free(fd, &fd->rs_output_hw);
> +}
> +
> +static void aie_free_fddma_buf(struct mtk_aie_dev *fd)
> +{
> + aie_imem_free(fd, &fd->fd_dma_hw);
> + aie_imem_free(fd, &fd->fd_kernel_hw);
> + aie_imem_free(fd, &fd->fd_attr_dma_hw);
> + aie_imem_free(fd, &fd->fd_dma_result_hw);
> +}
> +
> +static void aie_free_fld_buf(struct mtk_aie_dev *fd)
> +{
> + aie_imem_free(fd, &fd->fd_fld_step_data);
> + aie_imem_free(fd, &fd->fd_fld_out_hw);
> +}
> +
> +static int aie_copy_fw(struct mtk_aie_dev *fd, const char *name,
> void *buf,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
> +{
> + int ret;
> + const struct firmware *fw =3D NULL;
> +
> + ret =3D request_firmware(&fw, name, fd->dev);
> + if (ret =3D=3D 0) {
> + if (size >=3D fw->size)
> + memcpy(buf, fw->data, fw->size);
> + else
> + ret =3D -EINVAL;
> + }
> +
> + release_firmware(fw);
> +
> + return ret;
> +}
> +
> +/**
> + * The aie driver just loads the bin file provided by algorithm.
> + * Driver cannot change path and file name preset by algorithm.
> + * Otherwise it will not be able to get aie related data and
> algorithms.
> + */
> +static int aie_load_fw(struct mtk_aie_dev *fd)
> +{
> + char *cfg_path =3D "aie_mp_fw31/config";
> + char *kel_path =3D "aie_mp_fw31/kernel";
> + char name[128] =3D {};
> + u32 size, attrsize;
> + u8 i, j;
> + int ret;
> +
> + /* aie_fd_fd_config.bin: Provide relevant configs necessary for fd
> mode*/
> + ret =3D sprintf(name, "%s/aie_fd_fd_config.bin", cfg_path);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd,
> + =C2=A0 name,
> + =C2=A0 fd->base_para->fd_fd_cfg_va,
> + =C2=A0 fd->fd_fd_cfg_size);
> + if (ret)
> + return ret;
> +
> + /* aie_fd_rs_config.bin: Provide the necessary data for fd mode
> resizer hardware */
> + ret =3D sprintf(name, "%s/aie_fd_rs_config.bin", cfg_path);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd,
> + =C2=A0 name,
> + =C2=A0 fd->base_para->fd_rs_cfg_va,
> + =C2=A0 fd->fd_rs_cfg_size);
> + if (ret)
> + return ret;
> +
> + /* aie_fd_yuv2rgb_config.bin: Provide fd mode yuv to rgb related
> data */
> + ret =3D sprintf(name, "%s/aie_fd_yuv2rgb_config.bin", cfg_path);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd,
> + =C2=A0 name,
> + =C2=A0 fd->base_para->fd_yuv2rgb_cfg_va,
> + =C2=A0 fd->fd_yuv2rgb_cfg_size);
> + if (ret)
> + return ret;
> +
> + /* aie_attr_fd_config.bin: Provide relevant configs necessary for
> attribute mode*/
> + ret =3D sprintf(name, "%s/aie_attr_fd_config.bin", cfg_path);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd,
> + =C2=A0 name,
> + =C2=A0 fd->base_para->attr_fd_cfg_va[0],
> + =C2=A0 fd->attr_fd_cfg_size);
> + if (ret)
> + return ret;
> +
> + /** aie_attr_yuv2rgb_config.bin: Provide the necessary data for
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 attribute mode resizer hardware
> + */
> + ret =3D sprintf(name, "%s/aie_attr_yuv2rgb_config.bin", cfg_path);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd,
> + =C2=A0 name,
> + =C2=A0 fd->base_para->attr_yuv2rgb_cfg_va[0],
> + =C2=A0 fd->attr_yuv2rgb_cfg_size);
> + if (ret)
> + return ret;
> +
> + for (i =3D 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> + memcpy(fd->base_para->attr_fd_cfg_va[i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->base_para->attr_fd_cfg_va[0], =
fd->attr_fd_cfg_size);
> + memcpy(fd->base_para->attr_yuv2rgb_cfg_va[i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->base_para->attr_yuv2rgb_cfg_va=
[0],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->attr_yuv2rgb_cfg_size);
> + }
> +
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + size =3D get_fd_ker_rdma_size(i, j);
> + if (size) {
> + /* FD mode Hardware requires loop 87 times */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fd_kernel_bias_loop%02d_%d.bin",
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kel_path, i, j);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->dma_para->fd_kernel_va[i][j],
> + =C2=A0 size);
> + if (ret)
> + return ret;
> + }
> + }
> + }
> +
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + attrsize =3D get_attr_ker_rdma_size(i, j);
> + /* attribute mode Hardware requires loop 26 times */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_attr_kernel_bias_loop%02d_%d.bin=
",
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kel_path, i, j);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->dma_para->attr_kernel_va[i][j],
> + =C2=A0 attrsize);
> + if (ret)
> + return ret;
> + }
> + }
> +
> + /* The necessary data when the FLD mode blink model runs */
> + ret =3D sprintf(name, "%s/aie_fld_blink_weight_forest14.bin",
> cfg_path);
> +
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_BLINK][14],
> + =C2=A0 fld_step_align_size(FLD_STEP_BLINK, 14));
> + if (ret)
> + return ret;
> +
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + /* The necessary data when the FLD mode cv model runs */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fld_cv_forest%02d_iom3.bin", cfg=
_path, j);
> + if (ret < 0)
> + return ret;
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_CV][j],
> + =C2=A0 fld_step_align_size(FLD_STEP_CV, j));
> + if (ret)
> + return ret;
> + }
> +
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + /* The necessary data when the FLD mode fp model runs */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fld_fp_forest%02d_om45.bin", cfg=
_path, j);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_FP][j],
> + =C2=A0 fld_step_align_size(FLD_STEP_FP, j));
> + if (ret)
> + return ret;
> + }
> +
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + /* The necessary data when the FLD mode leafnode model runs */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fld_leafnode_forest%02d.bin", cf=
g_path, j);
> + if (ret < 0)
> + return ret;
> +
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_LEAF][j],
> + =C2=A0 fld_step_align_size(FLD_STEP_LEAF, j));
> + if (ret)
> + return ret;
> + }
> +
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + /* The necessary data when the FLD mode treekm02 model runs */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fld_tree_forest%02d_km02.bin", c=
fg_path, j);
> + if (ret < 0)
> + return ret;
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_KM02][j],
> + =C2=A0 fld_step_align_size(FLD_STEP_KM02, j));
> + if (ret)
> + return ret;
> + }
> +
> + for (j =3D 0; j < FLD_MAX_FRAME; j++) {
> + /* The necessary data when the FLD mode treekm13 model runs */
> + ret =3D sprintf(name,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s/aie_fld_tree_forest%02d_km13.bin", c=
fg_path, j);
> + if (ret < 0)
> + return ret;
> + ret =3D aie_copy_fw(fd, name,
> + =C2=A0 fd->fld_para->fld_step_va[FLD_STEP_KM13][j],
> + =C2=A0 fld_step_align_size(FLD_STEP_KM13, j));
> + if (ret)
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +static int aie_update_cfg(struct mtk_aie_dev *fd, struct
> aie_enq_info *aie_cfg)
> +{
> + int crop_width;
> + int crop_height;
> +
> + if (aie_cfg->en_roi) {
> + crop_width =3D dif_x(aie_cfg) + 1;
> + crop_height =3D dif_y(aie_cfg) + 1;
> + } else {
> + crop_width =3D aie_cfg->src_img_width;
> + crop_height =3D aie_cfg->src_img_height;
> + }
> +
> + if (crop_width =3D=3D 0 || crop_height =3D=3D 0) {
> + dev_err(fd->dev, "Invalid crop size 0x0\n");
> + return -EINVAL;
> + }
> +
> + if (aie_cfg->en_padding) {
> + crop_width +=3D aie_cfg->src_padding.right + aie_cfg-
> >src_padding.left;
> + crop_height +=3D aie_cfg->src_padding.up + aie_cfg->src_padding.down;
> + }
> +
> + if (aie_cfg->sel_mode =3D=3D FDMODE) {
> + fd->base_para->sel_mode =3D aie_cfg->sel_mode;
> + fd->base_para->crop_rect.width =3D crop_width;
> + fd->base_para->crop_rect.height =3D crop_height;
> + fd->base_para->src_img_addr =3D aie_cfg->src_img_addr;
> + fd->base_para->src_img_addr_uv =3D aie_cfg->src_img_addr_uv;
> + fd->base_para->img_rect.width =3D aie_cfg->src_img_width;
> + fd->base_para->img_rect.height =3D aie_cfg->src_img_height;
> + fd->base_para->src_img_fmt =3D aie_cfg->src_img_fmt;
> + fd->base_para->rotate_degree =3D aie_cfg->rotate_degree;
> + } else if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE) {
> + fd->attr_para->sel_mode[fd->attr_para->w_idx] =3D aie_cfg->sel_mode;
> + fd->attr_para->crop_width[fd->attr_para->w_idx] =3D crop_width;
> + fd->attr_para->crop_height[fd->attr_para->w_idx] =3D crop_height;
> + fd->attr_para->src_img_addr[fd->attr_para->w_idx] =3D aie_cfg-
> >src_img_addr;
> + fd->attr_para->src_img_addr_uv[fd->attr_para->w_idx] =3D aie_cfg-
> >src_img_addr_uv;
> + fd->attr_para->img_width[fd->attr_para->w_idx] =3D aie_cfg-
> >src_img_width;
> + fd->attr_para->img_height[fd->attr_para->w_idx] =3D aie_cfg-
> >src_img_height;
> + fd->attr_para->src_img_fmt[fd->attr_para->w_idx] =3D aie_cfg-
> >src_img_fmt;
> + fd->attr_para->rotate_degree[fd->attr_para->w_idx] =3D aie_cfg-
> >rotate_degree;
> + }
> +
> + return 0;
> +}
> +
> +static int aie_config_y2r(struct mtk_aie_dev *fd, struct
> aie_enq_info *aie_cfg,
> + =C2=A0 int mode)
> +{
> + u32 img_addr;
> + u32 img_addr_UV;
> + u32 img_off;
> + u32 img_off_uv;
> + u32 *yuv2rgb_cfg;
> + u32 srcbuf, srcbuf_UV;
> + u16 xmag_0, ymag_0;
> + u16 pym0_out_w;
> + u16 pym0_out_h;
> + u16 stride_pym0_out_w;
> + u16 sr_crp_w;
> + u16 sr_crp_h;
> + u16 y1_stride;
> +
> + if (!aie_cfg->en_roi) {
> + img_off =3D 0;
> + img_off_uv =3D 0;
> + } else {
> + if (aie_cfg->src_img_fmt =3D=3D FMT_MONO || aie_cfg->src_img_fmt =3D=3D
> FMT_YUV_2P ||
> + =C2=A0=C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YVU_2P) {
> + y1_stride =3D aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> + img_off =3D y1_stride + aie_cfg->src_roi.x1;
> + img_off_uv =3D y1_stride + aie_cfg->src_roi.x1;
> + } else if (aie_cfg->src_img_fmt =3D=3D FMT_YUV420_2P ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YUV420_1P) {
> + y1_stride =3D aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> + img_off =3D y1_stride + aie_cfg->src_roi.x1;
> + img_off_uv =3D y1_stride / 2 + aie_cfg->src_roi.x1;
> + } else if (aie_cfg->src_img_fmt =3D=3D FMT_YUYV ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YVYU ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_UYVY ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_VYUY) {
> + y1_stride =3D aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> + img_off =3D y1_stride + aie_cfg->src_roi.x1 * 2;
> + img_off_uv =3D y1_stride + aie_cfg->src_roi.x1 * 2;
> + } else {
> + dev_err(fd->dev, "Unsupport input format %d", aie_cfg-
> >src_img_fmt);
> + return -EINVAL;
> + }
> + }
> +
> + img_addr =3D aie_cfg->src_img_addr + img_off;
> + img_addr_UV =3D aie_cfg->src_img_addr_uv + img_off_uv;
> +
> + srcbuf =3D img_addr;
> + if (aie_cfg->src_img_fmt =3D=3D FMT_YUV420_2P || aie_cfg->src_img_fmt
> =3D=3D FMT_YUV420_1P ||
> + =C2=A0=C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YUV_2P || aie_cfg->s=
rc_img_fmt =3D=3D
> FMT_YVU_2P)
> + srcbuf_UV =3D img_addr_UV;
> + else
> + srcbuf_UV =3D 0;
> +
> + if (mode =3D=3D FDMODE) {
> + sr_crp_w =3D fd->base_para->crop_rect.width;
> + sr_crp_h =3D fd->base_para->crop_rect.height;
> + yuv2rgb_cfg =3D (u32 *)fd->base_para->fd_yuv2rgb_cfg_va;
> + pym0_out_w =3D fd->base_para->pyramid_rect.width;
> + }
> + if (mode =3D=3D ATTRIBUTEMODE) {
> + sr_crp_w =3D fd->attr_para->crop_width[fd->attr_para->w_idx];
> + sr_crp_h =3D fd->attr_para->crop_height[fd->attr_para->w_idx];
> + yuv2rgb_cfg =3D (u32 *)fd->base_para->attr_yuv2rgb_cfg_va[fd-
> >attr_para->w_idx];
> + pym0_out_w =3D ATTR_MODE_PYRAMID_WIDTH;
> + }
> +
> + pym0_out_h =3D pym0_out_w * sr_crp_h / sr_crp_w;
> +
> + if (pym0_out_w !=3D 0) {
> + xmag_0 =3D 512 * sr_crp_w / pym0_out_w;
> + ymag_0 =3D xmag_0;
> + } else {
> + xmag_0 =3D 0;
> + ymag_0 =3D 0;
> + }
> +
> + yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] =3D (yuv2rgb_cfg[Y2R_SRC_DST_FORMAT]
> & 0xFFFFFFF8) |
> + =C2=A0 ((aie_cfg->src_img_fmt) & 0x7);
> + if (aie_cfg->src_img_fmt =3D=3D FMT_YUV420_2P || aie_cfg->src_img_fmt
> =3D=3D FMT_YUV420_1P) {
> + /* for match patten */
> + yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] =3D (yuv2rgb_cfg[Y2R_SRC_DST_FORMAT]
> &
> + =C2=A0 0xFFFFFFF8) | ((0x3) & 0x7);
> + }
> + yuv2rgb_cfg[Y2R_IN_W_H] =3D (yuv2rgb_cfg[Y2R_IN_W_H] & 0xF800F800) |
> + =C2=A0 ((sr_crp_w << 16) & 0x7FF0000) | (sr_crp_h & 0x7FF);
> + yuv2rgb_cfg[Y2R_OUT_W_H] =3D (yuv2rgb_cfg[Y2R_OUT_W_H] & 0xF800F800)
> |
> + =C2=A0=C2=A0 ((pym0_out_w << 16) & 0x7FF0000) | (pym0_out_h & 0x7FF);
> +
> + if (aie_cfg->src_img_fmt =3D=3D FMT_YUV_2P || aie_cfg->src_img_fmt =3D=
=3D
> FMT_YVU_2P) {
> + /* 2 plane */
> + yuv2rgb_cfg[Y2R_RA0_RA1_EN] =3D (yuv2rgb_cfg[Y2R_RA0_RA1_EN] &
> 0xFFFFFFEE) | 0x11;
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(dif_x(aie_cfg),
> dif_y(aie_cfg));
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(dif_x(aie_cfg),
> dif_y(aie_cfg));
> + } else {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(sr_crp_w - 1, sr_crp_h
> - 1);
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(sr_crp_w - 1, sr_crp_h
> - 1);
> + }
> + yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x1;
> + yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x1;
> + } else if (aie_cfg->src_img_fmt =3D=3D FMT_MONO) {
> + yuv2rgb_cfg[Y2R_RA0_RA1_EN] =3D
> + (yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x01;
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(dif_x(aie_cfg),
> dif_y(aie_cfg));
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(dif_x(aie_cfg),
> dif_y(aie_cfg));
> + } else {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(sr_crp_w - 1, sr_crp_h
> - 1);
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(sr_crp_w - 1, sr_crp_h
> - 1);
> + }
> + yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
> + yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
> + } else if (aie_cfg->src_img_fmt =3D=3D FMT_YUYV ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YVYU ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_UYVY ||
> + =C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_VYUY) {
> + /* 1 plane */
> + yuv2rgb_cfg[Y2R_RA0_RA1_EN] =3D (yuv2rgb_cfg[Y2R_RA0_RA1_EN] &
> 0xFFFFFFEE) | 0x1;
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(2 * (dif_x(aie_cfg) +
> 1) - 1,
> + =C2=A0=C2=A0=C2=A0 dif_y(aie_cfg));
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(2 * (dif_x(aie_cfg) +
> 1) - 1,
> + =C2=A0=C2=A0=C2=A0 dif_y(aie_cfg));
> + } else {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(2 * sr_crp_w - 1,
> sr_crp_h - 1);
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(2 * sr_crp_w - 1,
> sr_crp_h - 1);
> + }
> + yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x3;
> + yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x3;
> + }
> +
> + /* AIE3.0 */
> + if (aie_cfg->src_img_fmt =3D=3D FMT_YUV420_2P ||
> + =C2=A0=C2=A0=C2=A0 aie_cfg->src_img_fmt =3D=3D FMT_YUV420_1P) {
> + yuv2rgb_cfg[Y2R_RA0_RA1_EN] =3D
> + (yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x11;
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D aie_cmb_u16(dif_x(aie_cfg),
> dif_y(aie_cfg));
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(dif_x(aie_cfg),
> + =C2=A0=C2=A0=C2=A0 dif_y(aie_cfg) / 2);
> + } else {
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =3D
> + aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
> + yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =3D aie_cmb_u16(sr_crp_w - 1,
> + =C2=A0=C2=A0=C2=A0 sr_crp_h / 2 - 1);
> + }
> + yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
> + yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =3D
> + (yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
> + ((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
> +
> + yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] =3D
> + (yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] & 0xFFFFFFFE) | 0x01;
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_CO2_CROP_X] =3D aie_cmb_u16(0, dif_x(aie_cfg));
> + yuv2rgb_cfg[Y2R_CO2_CROP_Y] =3D aie_cmb_u16(0, dif_y(aie_cfg));
> + } else {
> + yuv2rgb_cfg[Y2R_CO2_CROP_X] =3D aie_cmb_u16(0, sr_crp_w - 1);
> + yuv2rgb_cfg[Y2R_CO2_CROP_Y] =3D aie_cmb_u16(0, sr_crp_h - 1);
> + }
> + } else {
> + yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] =3D
> + (yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] & 0xFFFFFFFE);
> +
> + if (aie_cfg->en_roi) {
> + yuv2rgb_cfg[Y2R_CO2_CROP_X] =3D aie_cmb_u16(0, dif_x(aie_cfg));
> + yuv2rgb_cfg[Y2R_CO2_CROP_Y] =3D aie_cmb_u16(0, dif_y(aie_cfg));
> + } else {
> + yuv2rgb_cfg[Y2R_CO2_CROP_X] =3D aie_cmb_u16(0, sr_crp_w - 1);
> + yuv2rgb_cfg[Y2R_CO2_CROP_Y] =3D aie_cmb_u16(0, sr_crp_h - 1);
> + }
> + }
> +
> + stride_pym0_out_w =3D round_up(pym0_out_w, 8);
> +
> + yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE0] =3D
> + aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
> + set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE0_BUS_SIZE0,
> stride_pym0_out_w);
> + yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE1] =3D
> + aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
> + set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE1_BUS_SIZE1,
> stride_pym0_out_w);
> + yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE2] =3D
> + aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
> + set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE2_BUS_SIZE2,
> stride_pym0_out_w);
> +
> + if (aie_cfg->en_padding) {
> + yuv2rgb_cfg[Y2R_PADDING_EN_UP_DOWN] =3D
> + 1 | ((aie_cfg->src_padding.up << 4) & 0x1FF0) |
> + ((aie_cfg->src_padding.down << 16) & 0x01FF0000);
> + yuv2rgb_cfg[Y2R_PADDING_RIGHT_LEFT] =3D
> + (aie_cfg->src_padding.right & 0x01FF) |
> + ((aie_cfg->src_padding.left << 16) & 0x01FF0000);
> + } else {
> + yuv2rgb_cfg[Y2R_PADDING_EN_UP_DOWN] =3D 0;
> + yuv2rgb_cfg[Y2R_PADDING_RIGHT_LEFT] =3D 0;
> + }
> +
> + yuv2rgb_cfg[Y2R_IN_0] =3D srcbuf;
> + yuv2rgb_cfg[Y2R_IN_1] =3D srcbuf_UV;
> +
> + yuv2rgb_cfg[Y2R_OUT_0] =3D (u32)fd->base_para->rs_pym_rst_pa[0][0];
> + yuv2rgb_cfg[Y2R_OUT_1] =3D (u32)fd->base_para->rs_pym_rst_pa[0][1];
> + yuv2rgb_cfg[Y2R_OUT_2] =3D (u32)fd->base_para->rs_pym_rst_pa[0][2];
> +
> + yuv2rgb_cfg[Y2R_X_Y_MAG] =3D (xmag_0 & 0x3FFF) | ((ymag_0 << 16) &
> 0x3FFF0000);
> +
> + if (sr_crp_w >=3D pym0_out_w) {
> + /* down scale AIE1.0 by FRZ */
> + yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] =3D
> + (yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] & 0x00100070);
> + yuv2rgb_cfg[Y2R_SRZ_HORI_STEP] =3D 0;
> + yuv2rgb_cfg[Y2R_SRZ_VERT_STEP] =3D 0;
> + } else {
> + /* SRZ */
> + /* 0: FDRZ for down scaling */
> + /* 1: SRZ for up scaling */
> + yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] =3D
> + (yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] & 0x00100070) | SRZ_BIT;
> + yuv2rgb_cfg[Y2R_SRZ_HORI_STEP] =3D ((sr_crp_w - 1) << 15) /
> (pym0_out_w - 1);
> + yuv2rgb_cfg[Y2R_SRZ_VERT_STEP] =3D ((sr_crp_h - 1) << 15) /
> (pym0_out_h - 1);
> + }
> +
> + yuv2rgb_cfg[Y2R_CON_IN_BA_MSB] =3D (u32)0x02020202;
> + yuv2rgb_cfg[Y2R_CON_OUT_BA_MSB] =3D (u32)0x02020202;
> +
> + return 0;
> +}
> +
> +static int aie_config_rs(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + u32 *rs_cfg;
> + u32 *rs_tbl[2];
> + u16 xmag_0, ymag_0;
> + u16 pym_out_w[3];
> + u16 pym_out_h[3];
> + u16 round_w;
> + u16 sr_crp_w;
> + u16 sr_crp_h;
> + int i;
> +
> + sr_crp_w =3D fd->base_para->crop_rect.width;
> + sr_crp_h =3D fd->base_para->crop_rect.height;
> +
> + rs_cfg =3D (u32 *)fd->base_para->fd_rs_cfg_va;
> +
> + pym_out_w[0] =3D fd->base_para->pyramid_rect.width;
> + pym_out_w[1] =3D pym_out_w[0] >> 1;
> + pym_out_w[2] =3D pym_out_w[1] >> 1;
> +
> + pym_out_h[0] =3D pym_out_w[0] * sr_crp_h / sr_crp_w;
> + pym_out_h[1] =3D pym_out_h[0] >> 1;
> + pym_out_h[2] =3D pym_out_h[1] >> 1;
> +
> + for (i =3D 0; i < 2; i++) {
> + rs_tbl[i] =3D rs_cfg + fd->variant->rs_cfg_size * i;
> +
> + rs_tbl[i][RS_IN_0] =3D (u32)fd->base_para->rs_pym_rst_pa[i][0];
> + rs_tbl[i][RS_IN_1] =3D (u32)fd->base_para->rs_pym_rst_pa[i][1];
> + rs_tbl[i][RS_IN_2] =3D (u32)fd->base_para->rs_pym_rst_pa[i][2];
> +
> + rs_tbl[i][RS_OUT_0] =3D (u32)fd->base_para->rs_pym_rst_pa[i + 1][0];
> + rs_tbl[i][RS_OUT_1] =3D (u32)fd->base_para->rs_pym_rst_pa[i + 1][1];
> + rs_tbl[i][RS_OUT_2] =3D (u32)fd->base_para->rs_pym_rst_pa[i + 1][2];
> +
> + rs_tbl[i][RS_INPUT_W_H] =3D (rs_tbl[i][RS_INPUT_W_H] & 0xF800F800) |
> + (pym_out_h[i] & 0x7FF) | ((pym_out_w[i] << 16) & 0x7FF0000);
> + rs_tbl[i][RS_OUTPUT_W_H] =3D (rs_tbl[i][RS_OUTPUT_W_H] & 0xF800F800)
> |
> + (pym_out_h[i + 1] & 0x7FF) | ((pym_out_w[i + 1] << 16) &
> 0x7FF0000);
> +
> + rs_tbl[i][RS_IN_X_Y_SIZE0] =3D aie_cmb_u16(pym_out_w[i] - 1,
> pym_out_h[i] - 1);
> + rs_tbl[i][RS_IN_X_Y_SIZE1] =3D aie_cmb_u16(pym_out_w[i] - 1,
> pym_out_h[i] - 1);
> + rs_tbl[i][RS_IN_X_Y_SIZE2] =3D aie_cmb_u16(pym_out_w[i] - 1,
> pym_out_h[i] - 1);
> +
> + set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE0, pym_out_w[i]);
> + set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE1, pym_out_w[i]);
> + set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE2, pym_out_w[i]);
> +
> + rs_tbl[i][RS_OUT_X_Y_SIZE0] =3D aie_cmb_u16(pym_out_w[i + 1] - 1,
> + =C2=A0 pym_out_h[i + 1] - 1);
> + rs_tbl[i][RS_OUT_X_Y_SIZE1] =3D aie_cmb_u16(pym_out_w[i + 1] - 1,
> + =C2=A0 pym_out_h[i + 1] - 1);
> + rs_tbl[i][RS_OUT_X_Y_SIZE2] =3D aie_cmb_u16(pym_out_w[i + 1] - 1,
> + =C2=A0 pym_out_h[i + 1] - 1);
> +
> + if (i =3D=3D 0)
> + round_w =3D pym_out_w[i + 1];
> + else
> + round_w =3D round_up(pym_out_w[i + 1], 8);
> +
> + set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE0, round_w);
> + set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE1, round_w);
> + set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE2, round_w);
> +
> + xmag_0 =3D 512 * pym_out_w[i] / pym_out_w[i + 1];
> + ymag_0 =3D xmag_0;
> +
> + rs_tbl[i][RS_X_Y_MAG] =3D (xmag_0 & 0x3FFF) | ((ymag_0 << 16) &
> 0x3FFF0000);
> + rs_tbl[i][RS_CON_IN_BA_MSB] =3D (u32)0x02020202;
> + rs_tbl[i][RS_CON_OUT_BA_MSB] =3D (u32)0x02020202;
> + }
> +
> + return 0;
> +}
> +
> +static int aie_config_network(struct mtk_aie_dev *fd,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aie_enq_info *aie_cfg)
> +{
> + struct aie_static_info *pstv =3D &fd->st_info;
> + u16 pyramid0_out_w, pyramid0_out_h, pyramid1_out_h, pyramid2_out_h;
> + u16 out_ysize_minus_1, out_ysize_minus_1_stride2;
> + u16 fd_xsize[4], size, poolsize, stridesize;
> + u16 input_height, out_height;
> + u16 conv_width, conv_height;
> + u32 *fd_cur_cfg, *fd_cur_set;
> + u32 sr_crp_w, sr_crp_h;
> + u32 cal_x, cal_y;
> + u8 uch, uloop;
> + u8 i, j;
> + void *fd_cfg;
> +
> + sr_crp_w =3D fd->base_para->crop_rect.width;
> + sr_crp_h =3D fd->base_para->crop_rect.height;
> +
> + pyramid0_out_w =3D fd->base_para->pyramid_rect.width;
> + pyramid0_out_h =3D pyramid0_out_w * sr_crp_h / sr_crp_w;
> +
> + pyramid1_out_h =3D pyramid0_out_h / 2;
> + pyramid2_out_h =3D pyramid1_out_h / 2;
> +
> + fd_cfg =3D fd->base_para->fd_fd_cfg_va;
> +
> + for (i =3D 0; i < FD_LOOP_NUM; i++) {
> + fd_cur_cfg =3D (u32 *)fd_cfg + fd->variant->fd_cfg_size * i;
> + fd_cur_cfg[FD_INPUT_ROTATE] =3D (fd_cur_cfg[FD_INPUT_ROTATE] &
> 0xFFFF0FFF) |
> + =C2=A0=C2=A0=C2=A0=C2=A0 ((aie_cfg->rotate_degree << 12) & 0x3000);
> +
> + if (i =3D=3D 0)
> + input_height =3D pyramid2_out_h;
> + else if (i =3D=3D (RPNX_LOOP_NUM(2) + 1))
> + input_height =3D pyramid1_out_h;
> + else if (i =3D=3D (RPNX_LOOP_NUM(1) + 1))
> + input_height =3D pyramid0_out_h;
> + else
> + if (fd_out_stride2_in[i] =3D=3D 0)
> + input_height =3D out_height;
> + else
> + input_height =3D (out_height + 1) / 2;
> +
> + poolsize =3D is_fd_maxpool(i);
> + stridesize =3D get_fd_stride(i);
> + if (poolsize =3D=3D 1)
> + out_height =3D
> + DIV_ROUND_UP(input_height, 2 * poolsize);
> + else
> + out_height =3D DIV_ROUND_UP(input_height, stridesize + 2 * poolsize);
> +
> + if (i =3D=3D RPNX_LOOP_NUM(0) || i =3D=3D RPNX_LOOP_NUM(1) || i =3D=3D
> RPNX_LOOP_NUM(2)) {
> + conv_width =3D fd->base_para->img_rect.width;
> + conv_height =3D fd->base_para->img_rect.height;
> + fd_xsize[0] =3D pstv->inf_elm[i].img_width * 2 * 16 * ANCHOR_EN_NUM -
> 1;
> + fd_xsize[3] =3D pstv->inf_elm[i].img_width * 2 * 32 * ANCHOR_EN_NUM -
> 1;
> + fd_xsize[2] =3D fd_xsize[3];
> + fd_xsize[1] =3D fd_xsize[2];
> + } else {
> + conv_width =3D DIV_ROUND_UP(pstv->inf_elm[i].img_width, stridesize);
> + conv_height =3D DIV_ROUND_UP(input_height, stridesize);
> +
> + fd_xsize[3] =3D pstv->inf_elm[i].input_xsize_plus_1 - 1;
> + fd_xsize[2] =3D fd_xsize[3];
> + fd_xsize[1] =3D fd_xsize[2];
> + fd_xsize[0] =3D fd_xsize[1];
> + }
> +
> + fd_cur_cfg[FD_CONV_WIDTH_MOD6] =3D (fd_cur_cfg[FD_CONV_WIDTH_MOD6] &
> 0xFF8FFFFF) |
> + (((conv_width % 6) << 20) & 0x00700000);
> + fd_cur_cfg[FD_CONV_IMG_W_H] =3D aie_cmb_u16(conv_height, conv_width);
> +
> + fd_cur_cfg[FD_IN_IMG_W_H] =3D aie_cmb_u16(input_height, pstv-
> >inf_elm[i].img_width);
> + fd_cur_cfg[FD_OUT_IMG_W_H] =3D aie_cmb_u16(out_height, pstv-
> >inf_elm[i].out_width);
> +
> + if (fd_rdma_en[i][0][0] !=3D -1) {
> + for (j =3D 0; j < 4; j++) {
> + fd_cur_cfg[FD_IN_X_Y_SIZE0 + 2 * j] =3D
> + aie_cmb_u16(fd_xsize[j], input_height - 1);
> + set_cmbst_cfg(fd_cur_cfg, FD_IN_STRIDE0_BUS_SIZE0 + 2 * j,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_xsize[j] + 1);
> + }
> + }
> +
> + out_ysize_minus_1 =3D out_height - 1;
> + out_ysize_minus_1_stride2 =3D (out_height + 1) / 2 - 1;
> +
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + fd_cur_set =3D fd_cur_cfg + 2 * j;
> + if (!out_stride_size[i][j])
> + continue;
> +
> + if (out_stride_size[i][j] =3D=3D 1) {
> + fd_cur_set[FD_OUT_X_Y_SIZE0] =3D
> + aie_cmb_u16(pstv->inf_elm[i].out_xsize_plus_1 - 1,
> + =C2=A0=C2=A0=C2=A0 out_ysize_minus_1);
> + set_cmbst_cfg(fd_cur_set, FD_OUT_STRIDE0_BUS_SIZE0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i].out_stride);
> + } else if (out_stride_size[i][j] =3D=3D 2) {
> + fd_cur_set[FD_OUT_X_Y_SIZE0] =3D
> + aie_cmb_u16(pstv->inf_elm[i].out_xsize_plus_1_stride2 - 1,
> + =C2=A0=C2=A0=C2=A0 out_ysize_minus_1_stride2);
> + set_cmbst_cfg(fd_cur_set, FD_OUT_STRIDE0_BUS_SIZE0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstv->inf_elm[i].out_stride_stride2);
> + }
> + }
> +
> + if (i =3D=3D RPNX_LOOP_NUM(0) || i =3D=3D RPNX_LOOP_NUM(1) || i =3D=3D
> RPNX_LOOP_NUM(2))
> + set_cmb_cfg(fd_cur_cfg, FD_RPN_SET, fd->base_para-
> >rpn_anchor_thrd);
> +
> + if (i =3D=3D RPNX_LOOP_NUM(0)) {
> + cal_x =3D ((sr_crp_w << 10) * 100 /
> + (int)fd->base_para->pyramid_rect.width) >> 10;
> + cal_y =3D cal_x * 512 / 100;
> + fd_cur_cfg[FD_IMAGE_COORD] =3D (fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
> + =C2=A0=C2=A0=C2=A0=C2=A0 ((cal_y << 4) & 0x7FFF0);
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D 0;
> + if (aie_cfg->en_roi) {
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D
> + (aie_cfg->src_roi.x1 - aie_cfg->src_padding.left) |
> + (aie_cfg->src_roi.y1 - aie_cfg->src_padding.up) << 16;
> + }
> + } else if (i =3D=3D RPNX_LOOP_NUM(1)) {
> + cal_x =3D ((sr_crp_w << 10) * 100 /
> + (int)fd->base_para->pyramid_rect.width) >> 10;
> + cal_y =3D cal_x * 2 * 512 / 100;
> + fd_cur_cfg[FD_IMAGE_COORD] =3D (fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
> + =C2=A0=C2=A0=C2=A0=C2=A0 ((cal_y << 4) & 0x7FFF0);
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D 0;
> + if (aie_cfg->en_roi) {
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D
> + (aie_cfg->src_roi.x1 - aie_cfg->src_padding.left) |
> + (aie_cfg->src_roi.y1 - aie_cfg->src_padding.up) << 16;
> + }
> + } else if (i =3D=3D RPNX_LOOP_NUM(2)) {
> + cal_x =3D ((sr_crp_w << 10) * 100 /
> + (int)fd->base_para->pyramid_rect.width) >> 10;
> + cal_y =3D cal_x * 4 * 512 / 100;
> + fd_cur_cfg[FD_IMAGE_COORD] =3D (fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
> + =C2=A0=C2=A0=C2=A0=C2=A0 ((cal_y << 4) & 0x7FFF0);
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D 0;
> + if (aie_cfg->en_roi) {
> + fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =3D
> + (aie_cfg->src_roi.x1 - aie_cfg->src_padding.left) |
> + (aie_cfg->src_roi.y1 - aie_cfg->src_padding.up) << 16;
> + }
> + }
> +
> + /* IN_FM_BASE_ADR */
> + if (i =3D=3D 0) {
> + fd_cur_cfg[FD_IN_0] =3D (u32)(fd->base_para->rs_pym_rst_pa[2][0]);
> + fd_cur_cfg[FD_IN_1] =3D (u32)(fd->base_para->rs_pym_rst_pa[2][1]);
> + fd_cur_cfg[FD_IN_2] =3D (u32)(fd->base_para->rs_pym_rst_pa[2][2]);
> + } else if (i =3D=3D (RPNX_LOOP_NUM(2) + 1)) {
> + fd_cur_cfg[FD_IN_0] =3D (u32)(fd->base_para->rs_pym_rst_pa[1][0]);
> + fd_cur_cfg[FD_IN_1] =3D (u32)(fd->base_para->rs_pym_rst_pa[1][1]);
> + fd_cur_cfg[FD_IN_2] =3D (u32)(fd->base_para->rs_pym_rst_pa[1][2]);
> + } else if (i =3D=3D (RPNX_LOOP_NUM(1) + 1)) {
> + fd_cur_cfg[FD_IN_0] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][0]);
> + fd_cur_cfg[FD_IN_1] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][1]);
> + fd_cur_cfg[FD_IN_2] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][2]);
> + } else {
> + for (j =3D 0; j < INPUT_WDMA_WRA_NUM; j++) {
> + if (fd_rdma_en[i][j][0] !=3D -1) {
> + uloop =3D fd_rdma_en[i][j][0];
> + uch =3D fd_rdma_en[i][j][1];
> + fd_cur_cfg[FD_IN_0 + j] =3D
> + (u32)(fd->dma_para->fd_out_hw_pa[uloop][uch]);
> + }
> + }
> + }
> +
> + /* OUT_FM_BASE_ADR */
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (out_stride_size[i][j])
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->fd_out_hw_pa[i][j]);
> + }
> +
> + /* KERNEL_BASE_ADR */
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + size =3D get_fd_ker_rdma_size(i, j);
> + if (size)
> + fd_cur_cfg[FD_KERNEL_0 + j] =3D
> + (u32)(fd->dma_para->fd_kernel_pa[i][j]);
> + }
> +
> + fd_cur_cfg[FD_CON_IN_BA_MSB] =3D (u32)0x02020202;
> + fd_cur_cfg[FD_CON_OUT_BA_MSB] =3D (u32)0x02020202;
> + fd_cur_cfg[FD_CON_KERNEL_BA_MSB] =3D (u32)0x00000202;
> + }
> +
> + return 0;
> +}
> +
> +static int aie_config_attr_network(struct mtk_aie_dev *fd,
> + =C2=A0=C2=A0 struct aie_enq_info *aie_cfg)
> +{
> + bool is_regression_loop;
> + void *fd_cfg;
> + u32 *fd_cur_cfg;
> + u16 fd_input_ht, fd_output_ht;
> + u16 fd_out_y[4];
> + u8 i, j;
> + u8 uloop, uch, uidx;
> + u16 pyramid0_out_w, pyramid0_out_h;
> + int fd_conv_ht;
> + u16 sr_crp_w, sr_crp_h;
> +
> + sr_crp_w =3D fd->attr_para->crop_width[fd->attr_para->w_idx];
> + sr_crp_h =3D fd->attr_para->crop_height[fd->attr_para->w_idx];
> +
> + pyramid0_out_w =3D ATTR_MODE_PYRAMID_WIDTH;
> + pyramid0_out_h =3D pyramid0_out_w * sr_crp_h / sr_crp_w;
> +
> + fd_cfg =3D fd->base_para->attr_fd_cfg_va[fd->attr_para->w_idx];
> +
> + for (i =3D 0; i < ATTR_LOOP_NUM; i++) {
> + fd_cur_cfg =3D (u32 *)fd_cfg + fd->variant->fd_cfg_size * i;
> + fd_cur_cfg[FD_INPUT_ROTATE] =3D
> + (fd_cur_cfg[FD_INPUT_ROTATE] & 0xFFFF0FFF) |
> + ((aie_cfg->rotate_degree << 12) & 0x3000);
> + if (i =3D=3D 0)
> + fd_input_ht =3D pyramid0_out_h;
> + else
> + if (attr_out_stride2_as_in[i] =3D=3D 0)
> + fd_input_ht =3D fd_output_ht;
> + else if (attr_out_stride2_as_in[i] =3D=3D 1)
> + fd_input_ht =3D (fd_output_ht + 1) / 2;
> +
> + fd_output_ht =3D DIV_ROUND_UP(fd_input_ht, ATTR_FD_STRIDE(i) +
> + =C2=A0=C2=A0=C2=A0 2 * ATTR_FD_MAXPOOL(i));
> + fd_conv_ht =3D DIV_ROUND_UP(fd_input_ht, ATTR_FD_STRIDE(i));
> +
> + fd_cur_cfg[FD_CONV_IMG_W_H] =3D
> + (fd_cur_cfg[FD_CONV_IMG_W_H] & 0xFFFF0000) |
> + (fd_conv_ht & 0xFFFF);
> + fd_cur_cfg[FD_IN_IMG_W_H] =3D
> + (fd_cur_cfg[FD_IN_IMG_W_H] & 0xFFFF0000) |
> + (fd_input_ht & 0xFFFF);
> + fd_cur_cfg[FD_OUT_IMG_W_H] =3D
> + (fd_cur_cfg[FD_OUT_IMG_W_H] & 0xFFFF0000) |
> + (fd_output_ht & 0xFFFF);
> + set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE0, fd_input_ht - 1);
> + set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE1, fd_input_ht - 1);
> + set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE2, fd_input_ht - 1);
> + set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE3, fd_input_ht - 1);
> +
> + is_regression_loop =3D (i =3D=3D AGE_OUT_RGS || i =3D=3D GENDER_OUT_RGS=
 ||
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D=3D INDIAN_OUT_RGS || i =3D=3D ETHN=
ICITY_OUT_RGS);
> +
> + if (is_regression_loop) {
> + fd_out_y[0] =3D 0;
> + fd_out_y[1] =3D 0;
> + fd_out_y[2] =3D 0;
> + fd_out_y[3] =3D 0;
> + } else {
> + fd_out_y[0] =3D fd_output_ht - 1;
> + fd_out_y[1] =3D fd_output_ht - 1;
> + if (attr_out_2size[i] =3D=3D 0) {
> + fd_out_y[2] =3D fd_output_ht - 1;
> + fd_out_y[3] =3D fd_output_ht - 1;
> + } else {
> + fd_out_y[2] =3D (fd_output_ht + 1) / 2 - 1;
> + fd_out_y[3] =3D (fd_output_ht + 1) / 2 - 1;
> + }
> + }
> +
> + for (j =3D 0; j < 4; j++)
> + set_cmb_cfg(fd_cur_cfg, FD_OUT_X_Y_SIZE0 + 2 * j, fd_out_y[j]);
> +
> + /* IN_FM_BASE_ADR */
> + if (i =3D=3D 0) {
> + fd_cur_cfg[FD_IN_0] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][0]);
> + fd_cur_cfg[FD_IN_1] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][1]);
> + fd_cur_cfg[FD_IN_2] =3D (u32)(fd->base_para->rs_pym_rst_pa[0][2]);
> + } else {
> + for (j =3D 0; j < INPUT_WDMA_WRA_NUM; j++) {
> + if (attr_rdma_en[i][j][0] !=3D -1) {
> + uloop =3D attr_rdma_en[i][j][0];
> + uch =3D attr_rdma_en[i][j][1];
> + fd_cur_cfg[FD_IN_0 + j] =3D
> + (u32)(fd->dma_para->attr_out_hw_pa[uloop][uch]);
> + }
> + }
> + }
> +
> + /* OUT_FM_BASE_ADR */
> + for (j =3D 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> + if (attr_wdma_en[i][j]) {
> + uidx =3D fd->attr_para->w_idx;
> + if (i =3D=3D AGE_OUT_RGS && j =3D=3D 0)
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->age_out_hw_pa[uidx]);
> + else if (i =3D=3D GENDER_OUT_RGS && j =3D=3D 0)
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->gender_out_hw_pa[uidx]);
> + else if (i =3D=3D INDIAN_OUT_RGS && j =3D=3D 0)
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->is_indian_out_hw_pa[uidx]);
> + else if (i =3D=3D ETHNICITY_OUT_RGS && j =3D=3D 0)
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->ethnicity_out_hw_pa[uidx]);
> + else
> + fd_cur_cfg[FD_OUT_0 + j] =3D
> + (u32)(fd->dma_para->attr_out_hw_pa[i][j]);
> + }
> + }
> +
> + /* KERNEL_BASE_ADR */
> + for (j =3D 0; j < KERNEL_RDMA_RA_NUM; j++) {
> + fd_cur_cfg[FD_KERNEL_0 + j] =3D
> + (u32)(fd->dma_para->attr_kernel_pa[i][j]);
> + }
> +
> + fd_cur_cfg[FD_CON_IN_BA_MSB] =3D (u32)0x02020202;
> + fd_cur_cfg[FD_CON_OUT_BA_MSB] =3D (u32)0x02020202;
> + fd_cur_cfg[FD_CON_KERNEL_BA_MSB] =3D (u32)0x00000202;
> + }
> + return 0;
> +}
> +
> +static int aie_config_dram(struct mtk_aie_dev *fd, struct
> aie_enq_info *aie_cfg)
> +{
> + int ret;
> +
> + ret =3D aie_config_y2r(fd, aie_cfg, aie_cfg->sel_mode);
> + if (ret)
> + return ret;
> +
> + if (aie_cfg->sel_mode =3D=3D FDMODE) {
> + ret =3D aie_config_rs(fd, aie_cfg);
> + if (ret)
> + return ret;
> +
> + ret =3D aie_config_network(fd, aie_cfg);
> + if (ret)
> + return ret;
> +
> + } else if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE) {
> + ret =3D aie_config_attr_network(fd, aie_cfg);
> + if (ret)
> + return ret;
> + } else {
> + return -EINVAL;
> + }
> +
> + return 0;
> +}
> +
> +void aie_reset(struct mtk_aie_dev *fd)
> +{
> + writel(RESET_BIT, fd->fd_base + AIE_START_REG);
> + writel(0x0, fd->fd_base + AIE_START_REG);
> +}
> +
> +int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init
> *user_init)
> +{
> + int ret;
> + int i, j;
> +
> + if (fd->fd_state & STATE_INIT) {
> + dev_err(fd->dev, "%s fd state: %d\n", __func__, fd->fd_state);
> + return -EINVAL;
> + }
> +
> + fd->fd_state &=3D ~STATE_INIT;
> + fd->fd_mem_size =3D 0;
> +
> + fd->base_para =3D kmalloc(sizeof(*fd->base_para), GFP_KERNEL);
> + if (!fd->base_para)
> + return -ENOMEM;
> +
> + fd->attr_para =3D kmalloc(sizeof(*fd->attr_para), GFP_KERNEL);
> + if (!fd->attr_para) {
> + ret =3D -ENOMEM;
> + goto kmalloc_fail;
> + }
> +
> + fd->dma_para =3D kmalloc(sizeof(*fd->dma_para), GFP_KERNEL);
> + if (!fd->dma_para) {
> + ret =3D -ENOMEM;
> + goto kmalloc_fail;
> + }
> +
> + fd->fld_para =3D kmalloc(sizeof(*fd->fld_para), GFP_KERNEL);
> + if (!fd->fld_para) {
> + ret =3D -ENOMEM;
> + goto kmalloc_fail;
> + }
> +
> + fd->base_para->rpn_anchor_thrd =3D
> + (signed short)(user_init->feature_threshold & 0x0000FFFF);
> + fd->base_para->pyramid_rect.width =3D user_init->pyramid_width;
> + fd->base_para->pyramid_rect.height =3D user_init->pyramid_height;
> + fd->base_para->max_pyramid_rect.width =3D user_init->pyramid_width;
> + fd->base_para->max_pyramid_rect.height =3D user_init->pyramid_height;
> +
> + fd->base_para->fd_fd_cfg_va =3D NULL;
> + fd->base_para->fd_rs_cfg_va =3D NULL;
> + fd->base_para->fd_yuv2rgb_cfg_va =3D NULL;
> + for (i =3D 0; i < MAX_ENQUE_FRAME_NUM; i++)
> + fd->base_para->attr_fd_cfg_va[i] =3D NULL;
> + for (i =3D 0; i < MAX_ENQUE_FRAME_NUM; i++)
> + fd->base_para->attr_yuv2rgb_cfg_va[i] =3D NULL;
> + for (i =3D 0; i < PYM_NUM; i++)
> + for (j =3D 0; j < COLOR_NUM; j++)
> + fd->base_para->rs_pym_rst_va[i][j] =3D NULL;
> +
> + memset(&fd->st_info, 0, sizeof(struct aie_static_info));
> + aie_update_table(fd, fd->base_para->max_pyramid_rect.width,
> + fd->base_para->max_pyramid_rect.height, 1);
> + aie_update_buf_params(fd, user_init->max_img_width,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_init->max_img_height);
> + ret =3D aie_alloc_dram_buf(fd);
> + if (ret)
> + return -ENOMEM;
> +
> + ret =3D aie_alloc_output_buf(fd);
> + if (ret) {
> + ret =3D -ENOMEM;
> + goto free_all;
> + }
> +
> + ret =3D aie_alloc_fddma_buf(fd);
> + if (ret) {
> + ret =3D -ENOMEM;
> + goto free_all;
> + }
> +
> + ret =3D aie_alloc_fld_buf(fd);
> + if (ret) {
> + ret =3D -ENOMEM;
> + goto free_all;
> + }
> +
> + aie_arrange_fddma_buf(fd);
> + aie_arrange_kernel_buf(fd);
> + aie_arrange_attrdma_buf(fd);
> + aie_arrange_result_dma_buf(fd);
> +
> + aie_arrange_fld_buf(fd);
> +
> + ret =3D aie_load_fw(fd);
> + if (ret) {
> + dev_err(fd->dev, "Failed to load aie fw\n");
> + goto free_all;
> + }
> +
> + fd->attr_para->r_idx =3D 0;
> + fd->attr_para->w_idx =3D 0;
> +
> + fd->fd_state |=3D STATE_INIT;
> +
> + dev_dbg(fd->dev, "%s: fd_mem_size(%d)\n", __func__, fd-
> >fd_mem_size);
> +
> + return 0;
> +
> +free_all:
> + aie_free_dram_buf(fd);
> + aie_free_output_buf(fd);
> + aie_free_fddma_buf(fd);
> + aie_free_fld_buf(fd);
> +
> +kmalloc_fail:
> + kfree(fd->base_para);
> + kfree(fd->attr_para);
> + kfree(fd->dma_para);
> + kfree(fd->fld_para);
> +
> + dev_err(fd->dev, "Failed to init aie\n");
> +
> + return ret;
> +}
> +
> +void aie_uninit(struct mtk_aie_dev *fd)
> +{
> + fd->fd_state &=3D ~STATE_INIT;
> + aie_free_dram_buf(fd);
> + aie_free_output_buf(fd);
> + aie_free_fddma_buf(fd);
> + aie_free_fld_buf(fd);
> +
> + kfree(fd->base_para);
> + kfree(fd->attr_para);
> + kfree(fd->dma_para);
> + kfree(fd->fld_para);
> +}
> +
> +void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + if (aie_cfg->sel_mode =3D=3D FLDMODE)
> + return;
> +
> + memset(&fd->reg_cfg, 0, sizeof(struct aie_reg_cfg));
> +
> + if (aie_cfg->pyramid_base_width =3D=3D 0) {
> + fd->base_para->pyramid_rect.width =3D fd->base_para-
> >max_pyramid_rect.width;
> + fd->base_para->pyramid_rect.height =3D fd->base_para-
> >max_pyramid_rect.height;
> + fd->base_para->number_of_pyramid =3D 3;
> + } else {
> + fd->base_para->pyramid_rect.height =3D
> + fd->base_para->max_pyramid_rect.height;
> + fd->base_para->number_of_pyramid =3D aie_cfg->number_of_pyramid;
> + if (aie_cfg->pyramid_base_width !=3D
> + =C2=A0=C2=A0=C2=A0 fd->base_para->pyramid_rect.width) {
> + dev_dbg(fd->dev,
> + "pre: %d cur: %d num: %d\n",
> + fd->base_para->pyramid_rect.width,
> + aie_cfg->pyramid_base_width,
> + fd->base_para->number_of_pyramid
> + );
> + fd->base_para->pyramid_rect.width =3D
> + aie_cfg->pyramid_base_width;
> + aie_update_table(fd, fd->base_para->pyramid_rect.width,
> + fd->base_para->pyramid_rect.height, 0);
> + aie_update_fddma_buf(fd);
> + }
> + }
> +
> + //Init output va array
> + if (aie_cfg->sel_mode =3D=3D FDMODE) {
> + memset(fd->rs_output_hw.va, 0, fd->rs_output_hw.size);
> + memset(fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(0)][0], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESULT_SIZE);
> + memset(fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(1)][0], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESULT_SIZE);
> + memset(fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(2)][0], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESULT_SIZE);
> + } else if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE) {
> + memset(fd->base_para->rs_pym_rst_va[0][0], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->rs_pym_out_size[0]);
> + memset(fd->base_para->rs_pym_rst_va[0][1], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->rs_pym_out_size[0]);
> + memset(fd->base_para->rs_pym_rst_va[0][2], 0,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->rs_pym_out_size[0]);
> + }
> +
> + fd->reg_cfg.fd_mode =3D aie_cfg->sel_mode;
> + if (aie_cfg->sel_mode =3D=3D FDMODE) {
> + fd->reg_cfg.rs_adr =3D (u32)fd->base_para->fd_rs_cfg_pa;
> + fd->reg_cfg.yuv2rgb_adr =3D (u32)fd->base_para->fd_yuv2rgb_cfg_pa;
> + fd->reg_cfg.fd_adr =3D (u32)fd->base_para->fd_fd_cfg_pa +
> + =C2=A0=C2=A0=C2=A0=C2=A0 fd->variant->fd_cfg_size * 4 *
> + =C2=A0=C2=A0=C2=A0=C2=A0 FD_LOOP_NUM / 3 *
> + =C2=A0=C2=A0=C2=A0=C2=A0 (3 - aie_cfg->number_of_pyramid);
> +
> + } else if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE) {
> + fd->reg_cfg.yuv2rgb_adr =3D
> + (u32)fd->base_para->attr_yuv2rgb_cfg_pa[fd->attr_para->w_idx];
> + fd->reg_cfg.fd_adr =3D
> + (u32)fd->base_para->attr_fd_cfg_pa[fd->attr_para->w_idx];
> + } else {
> + dev_err(fd->dev, "Invalid Mode: %d", aie_cfg->sel_mode);
> + }
> +
> + aie_update_cfg(fd, aie_cfg);
> +
> + aie_config_dram(fd, aie_cfg);
> +
> + if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE)
> + fd->attr_para->w_idx =3D (fd->attr_para->w_idx + 1) %
> MAX_ENQUE_FRAME_NUM;
> +}
> +
> +static void aie_execute_face_detection(struct mtk_aie_dev *fd,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aie_enq_info *aie_cfg)
> +{
> + unsigned int loop_num, loop_reg_val;
> +
> + writel(0x0, fd->fd_base + AIE_START_REG);
> + writel(0x00000111, fd->fd_base + AIE_ENABLE_REG);
> + loop_num =3D FD_LOOP_NUM / 3 * (aie_cfg->number_of_pyramid);
> + loop_reg_val =3D (loop_num << 8) | (aie_cfg->number_of_pyramid - 1);
> + writel(loop_reg_val, fd->fd_base + AIE_LOOP_REG);
> + writel(0x1, fd->fd_base + AIE_INT_EN_REG);
> + writel(fd->reg_cfg.rs_adr, fd->fd_base + AIE_RS_CON_BASE_ADR_REG);
> + writel(fd->reg_cfg.fd_adr, fd->fd_base + AIE_FD_CON_BASE_ADR_REG);
> + writel(fd->reg_cfg.yuv2rgb_adr, fd->fd_base +
> AIE_YUV2RGB_CON_BASE_ADR_REG);
> + writel(0x00000002, fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_MSB);
> + writel(0x00000002, fd->fd_base + AIE_RS_CON_BASE_ADR_MSB);
> + writel(0x00000002, fd->fd_base + AIE_FD_CON_BASE_ADR_MSB);
> + writel(0x1, fd->fd_base + AIE_START_REG);
> +}
> +
> +static void aie_execute_attribute_detection(struct mtk_aie_dev *fd,
> + =C2=A0=C2=A0=C2=A0 struct aie_enq_info *aie_cfg)
> +{
> + writel(0x0, fd->fd_base + AIE_START_REG);
> + writel(0x00000101, fd->fd_base + AIE_ENABLE_REG);
> + writel(0x00001A00, fd->fd_base + AIE_LOOP_REG);
> + writel(0x1, fd->fd_base + AIE_INT_EN_REG);
> + writel(fd->reg_cfg.rs_adr, fd->fd_base + AIE_RS_CON_BASE_ADR_REG);
> + writel(fd->reg_cfg.fd_adr, fd->fd_base + AIE_FD_CON_BASE_ADR_REG);
> + writel(fd->reg_cfg.yuv2rgb_adr, fd->fd_base +
> AIE_YUV2RGB_CON_BASE_ADR_REG);
> + writel(0x00000002, fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_MSB);
> + writel(0x00000002, fd->fd_base + AIE_RS_CON_BASE_ADR_MSB);
> + writel(0x00000002, fd->fd_base + AIE_FD_CON_BASE_ADR_MSB);
> + writel(0x1, fd->fd_base + AIE_START_REG);
> +}
> +
> +static void aie_execute_fld_detection(struct mtk_aie_dev *fd,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aie_enq_info *aie_cfg)
> +{
> + unsigned int i;
> +
> + writel(0x10, fd->fd_base + AIE_START_REG);
> + writel(0x00011111, fd->fd_base + AIE_DMA_CTL_REG);
> + writel(0x01111111, fd->fd_base + FLD_EN);
> + writel(0x1, fd->fd_base + AIE_INT_EN_REG);
> + for (i =3D 0; i < aie_cfg->fld_face_num; i++) {
> + writel(aie_cfg->src_img_addr, fd->fd_base + FLD_BASE_ADDR_FACE_0 +
> i * 0x4);
> + writel(aie_cfg->fld_input[i].fld_in_crop_x1 << 16 |
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aie_cfg->fld_input[i].fld_in_crop_=
y1,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + fld_face_info_0[i]);
> + writel(aie_cfg->fld_input[i].fld_in_crop_x2 << 16 |
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aie_cfg->fld_input[i].fld_in_crop_=
y2,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_FACE_INFO(i, 1))=
;
> + writel(aie_cfg->fld_input[i].fld_in_rip << 4 |
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aie_cfg->fld_input[i].fld_in_rop,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_FACE_INFO(i, 2))=
;
> + }
> +
> + writel(aie_cfg->fld_face_num << 28 | FLD_FOREST << 16 |
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLD_POINT, fd->fd_base + FLD_MODEL=
_PARA1);
> + writel(13 << 16 | 0xfe9, fd->fd_base + FLD_MODEL_PARA14);
> + writel(aie_cfg->src_img_width << 16 | aie_cfg->src_img_height,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_SRC_WD_HT);
> +
> + /*input settings*/
> + writel(0x007c003f, fd->fd_base + FLD_PL_IN_SIZE_0);
> + writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_0);
> + writel(0x007c003f, fd->fd_base + FLD_PL_IN_SIZE_1);
> + writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_1);
> + writel(0x0016003f, fd->fd_base + FLD_PL_IN_SIZE_2_0);
> + writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_0);
> + writel(0x0013003f, fd->fd_base + FLD_PL_IN_SIZE_2_1);
> + writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_1);
> + writel(0x0013003f, fd->fd_base + FLD_PL_IN_SIZE_2_2);
> + writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_2);
> + writel(0x00a6001f, fd->fd_base + FLD_PL_IN_SIZE_3);
> + writel(0x0020000f, fd->fd_base + FLD_PL_IN_STRIDE_3);
> +
> + /*output setting*/
> + writel((2400 * aie_cfg->fld_face_num - 1) << 16 | 127,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_SH_IN_SIZE_0);
> + writel(0x0010000f, fd->fd_base + FLD_SH_IN_STRIDE_0);
> + writel(fd->fld_para->fld_output_pa[0],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_TR_OUT_BASE_ADDR=
_0);
> + writel((aie_cfg->fld_face_num - 1) << 16 | 0x6f,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_TR_OUT_SIZE_0);
> + writel(0x0070000f, fd->fd_base + FLD_TR_OUT_STRIDE_0);
> + writel(fd->fld_para->fld_output_pa[0],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PP_OUT_BASE_ADDR=
_0);
> + writel((aie_cfg->fld_face_num - 1) << 16 | 0x6f,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PP_OUT_SIZE_0);
> + writel(0x0070000f, fd->fd_base + FLD_PP_OUT_STRIDE_0);
> +
> + /*cv score*/
> + writel(0x00000001, fd->fd_base + FLD_BS_BIAS);
> + writel(0x0000b835, fd->fd_base + FLD_CV_FM_RANGE_0);
> + writel(0xffff5cba, fd->fd_base + FLD_CV_FM_RANGE_1);
> + writel(0x00005ed5, fd->fd_base + FLD_CV_PM_RANGE_0);
> + writel(0xffff910d, fd->fd_base + FLD_CV_PM_RANGE_1);
> + writel(0x0000031e, fd->fd_base + FLD_BS_RANGE_0);
> + writel(0xfffffcae, fd->fd_base + FLD_BS_RANGE_1);
> +
> + /* 6 steps */
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_BLINK][14],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_BS_IN_BASE_ADDR_=
14);
> +
> + for (i =3D 0; i < 15; i++) {
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PL_IN_BASE_ADDR_=
2_(i));
> +
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PL_IN_BASE_ADDR_=
3_(i));
> +
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_SH_IN_BASE_ADDR_=
(i));
> +
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PL_IN_BASE_ADDR_=
0_(i));
> +
> + writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][i],
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->fd_base + FLD_PL_IN_BASE_ADDR_=
1_(i));
> + }
> +
> + writel(0x22222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_0_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_0_8_15_MSB);
> +
> + writel(0x22222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_1_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_1_8_15_MSB);
> +
> + writel(0x22222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_2_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_2_8_15_MSB);
> +
> + writel(0x22222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_3_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_PL_IN_BASE_ADDR_3_8_15_MSB);
> +
> + writel(0x22222222, fd->fd_base + FLD_SH_IN_BASE_ADDR_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_SH_IN_BASE_ADDR_8_15_MSB);
> +
> + writel(0x02000000, fd->fd_base + FLD_BS_IN_BASE_ADDR_8_15_MSB);
> +
> + writel(0x22222222, fd->fd_base + FLD_BASE_ADDR_FACE_0_7_MSB);
> + writel(0x02222222, fd->fd_base + FLD_BASE_ADDR_FACE_8_14_MSB);
> + writel(0x00000002, fd->fd_base + FLD_TR_OUT_BASE_ADDR_0_MSB);
> + writel(0x00000002, fd->fd_base + FLD_PP_OUT_BASE_ADDR_0_MSB);
> +
> + /* fld mode + trigger start */
> + writel(0x11, fd->fd_base + AIE_START_REG);
> +}
> +
> +void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + if (aie_cfg->sel_mode =3D=3D FDMODE)
> + aie_execute_face_detection(fd, aie_cfg);
> + else if (aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE)
> + aie_execute_attribute_detection(fd, aie_cfg);
> + else if (aie_cfg->sel_mode =3D=3D FLDMODE)
> + aie_execute_fld_detection(fd, aie_cfg);
> + else
> + return;
> +}
> +
> +void aie_irqhandle(struct mtk_aie_dev *fd)
> +{
> + writel(0x0, fd->fd_base + AIE_START_REG);
> +
> + /* interrupt read clear */
> + readl(fd->fd_base + AIE_INT_REG);
> +}
> +
> +static u16 aie_get_hi16(unsigned int value)
> +{
> + return (value & 0xFFFF0000) >> 16;
> +}
> +
> +static u16 aie_get_lo16(unsigned int value)
> +{
> + return value & 0xFFFF;
> +}
> +
> +static signed short aie_refine_s16_value(signed short value)
> +{
> + s16 result;
> +
> + if ((value & 0x200) >> 9)
> + result =3D (value | 0xFE00);
> + else
> + result =3D value;
> +
> + return result;
> +}
> +
> +/* return aie_cfg to user space */
> +void aie_get_fd_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + u32 fd_result_hw, fd_result_1_hw, fd_total_num;
> + struct aie_enq_info *tmp_aie_cfg;
> + void *fd_pym_result[PYM_NUM];
> + u32 fd_pyramid_num[PYM_NUM];
> + signed short landmark;
> + unsigned int *pto12;
> + struct fd_ret *prst;
> + unsigned int i, j;
> +
> + aie_cfg->sel_mode =3D fd->base_para->sel_mode;
> + aie_cfg->rotate_degree =3D fd->base_para->rotate_degree;
> + aie_cfg->src_img_addr =3D fd->base_para->src_img_addr;
> + aie_cfg->src_img_addr_uv =3D fd->base_para->src_img_addr_uv;
> + aie_cfg->src_img_width =3D fd->base_para->img_rect.width;
> + aie_cfg->src_img_height =3D fd->base_para->img_rect.height;
> + aie_cfg->src_img_fmt =3D fd->base_para->src_img_fmt;
> +
> + aie_cfg->irq_status =3D readl(fd->fd_base + AIE_INT_EN_REG);
> +
> + fd_result_hw =3D fd->reg_cfg.hw_result;
> + fd_result_1_hw =3D fd->reg_cfg.hw_result1;
> + fd_total_num =3D fd_result_hw & 0xFFF;
> + fd_pyramid_num[0] =3D (fd_result_hw & 0xFFF0000) >> 16;
> + fd_pyramid_num[1] =3D fd_result_1_hw & 0xFFF;
> + fd_pyramid_num[2] =3D (fd_result_1_hw & 0xFFF0000) >> 16;
> +
> + if (fd_total_num =3D=3D 0)
> + goto nothing_out;
> +
> + tmp_aie_cfg =3D=C2=A0 aie_cfg;
> +
> + tmp_aie_cfg->fd_out.fd_total_num =3D fd_total_num;
> + tmp_aie_cfg->fd_out.fd_pyramid0_num =3D fd_pyramid_num[0];
> + tmp_aie_cfg->fd_out.fd_pyramid1_num =3D fd_pyramid_num[1];
> + tmp_aie_cfg->fd_out.fd_pyramid2_num =3D fd_pyramid_num[2];
> +
> + switch (tmp_aie_cfg->number_of_pyramid) {
> + case 1:
> + fd_pym_result[2] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(0)][0];
> + break;
> + case 2:
> + fd_pym_result[1] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(0)][0];
> + fd_pym_result[2] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(1)][0];
> + break;
> + case 3:
> + fd_pym_result[0] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(0)][0];
> + fd_pym_result[1] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(1)][0];
> + fd_pym_result[2] =3D fd->dma_para->fd_out_hw_va[RPNX_LOOP_NUM(2)][0];
> + break;
> + default:
> + dev_err(fd->dev, "Wrong number_of_pyramid\n");
> + goto nothing_out;
> + }
> +
> + for (i =3D 0; i < 3; i++) {
> + for (j =3D 0; j < fd_pyramid_num[i]; j++) {
> + if (i =3D=3D 0)
> + prst =3D &tmp_aie_cfg->fd_out.pyramid0_result;
> + else if (i =3D=3D 1)
> + prst =3D &tmp_aie_cfg->fd_out.pyramid1_result;
> + else if (i =3D=3D 2)
> + prst =3D &tmp_aie_cfg->fd_out.pyramid2_result;
> +
> + pto12 =3D (unsigned int *)fd_pym_result[i] + 12 * j;
> +
> + prst->anchor_x0[j] =3D aie_get_lo16(*(pto12 + 0));
> + prst->anchor_y0[j] =3D aie_get_hi16(*(pto12 + 0));
> + prst->anchor_x1[j] =3D aie_get_lo16(*(pto12 + 1));
> + prst->anchor_y1[j] =3D aie_get_hi16(*(pto12 + 1));
> +
> + if (prst->anchor_x1[j] =3D=3D 0 ||
> + =C2=A0=C2=A0=C2=A0 prst->anchor_y1[j] =3D=3D 0) {
> + dev_err(fd->dev,
> + "wrong coordinate: i=3D%d j=3D%d M:%d %d %d %d\n", i, j,
> + prst->anchor_x0[j],
> + prst->anchor_x1[j],
> + prst->anchor_y0[j],
> + prst->anchor_y1[j]
> + );
> + goto nothing_out;
> + }
> +
> + /* ROP result at 1st run */
> + landmark =3D (*(pto12 + 2) & 0x3FF);
> + prst->rop_landmark_score0[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 2) & 0xFFC00) >> 10);
> + prst->rop_landmark_score1[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 2) & 0x3FF00000) >> 20);
> + prst->rop_landmark_score2[j] =3D aie_refine_s16_value(landmark);
> +
> + prst->anchor_score[j] =3D aie_refine_s16_value(*(pto12 + 9) & 0x3FF);
> +
> + /* RIP result at 1st run */
> + landmark =3D ((*(pto12 + 9) & 0xFFC00) >> 10);
> + prst->rip_landmark_score0[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 9) & 0x3FF00000) >> 20);
> + prst->rip_landmark_score1[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 9) & 0xC0000000) >> 30) |
> + =C2=A0=C2=A0 ((*(pto12 + 10) & 0xFF) << 2);
> + prst->rip_landmark_score2[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 10) & 0x3FF00) >> 8);
> + prst->rip_landmark_score3[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 10) & 0xFFC0000) >> 18);
> + prst->rip_landmark_score4[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 10) & 0xF0000000) >> 28) |
> + =C2=A0=C2=A0 ((*(pto12 + 11) & 0x3F) << 4);
> + prst->rip_landmark_score5[j] =3D aie_refine_s16_value(landmark);
> + landmark =3D ((*(pto12 + 11) & 0xFFC0) >> 6);
> + prst->rip_landmark_score6[j] =3D aie_refine_s16_value(landmark);
> + prst->face_result_index[j] =3D ((*(pto12 + 11) & 0xFFF0000) >> 16);
> + prst->anchor_index[j] =3D ((*(pto12 + 11) & 0x70000000) >> 28);
> +
> + prst->fd_partial_result =3D fd_pyramid_num[i];
> + }
> + }
> + return;
> +nothing_out:
> + // Ensure that user mode does not receive an inappropriate result
> structure
> + memset(&aie_cfg->fd_out, 0, sizeof(struct fd_result));
> +}
> +
> +void aie_get_attr_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + u32 *attr_ethnicity_result, *attr_gender_result;
> + u32 *attr_age_result, *attr_is_indian_result;
> +
> + aie_cfg->sel_mode =3D fd->attr_para->sel_mode[fd->attr_para->r_idx];
> + aie_cfg->rotate_degree =3D fd->attr_para->rotate_degree[fd-
> >attr_para->r_idx];
> + aie_cfg->src_img_addr =3D
> + fd->attr_para->src_img_addr[fd->attr_para->r_idx];
> + aie_cfg->src_img_addr_uv =3D
> + fd->attr_para->src_img_addr_uv[fd->attr_para->r_idx];
> + aie_cfg->src_img_width =3D fd->attr_para->img_width[fd->attr_para-
> >r_idx];
> + aie_cfg->src_img_height =3D
> + fd->attr_para->img_height[fd->attr_para->r_idx];
> + aie_cfg->src_img_fmt =3D fd->attr_para->src_img_fmt[fd->attr_para-
> >r_idx];
> +
> + aie_cfg->irq_status =3D readl(fd->fd_base + AIE_INT_EN_REG);
> +
> + /* 64 feature * 32 bytes */
> + attr_age_result =3D
> + (u32 *)fd->dma_para->age_out_hw_va[fd->attr_para->r_idx];
> + attr_gender_result =3D
> + (u32 *)fd->dma_para->gender_out_hw_va[fd->attr_para->r_idx];
> + attr_is_indian_result =3D
> + (u32 *)fd->dma_para->is_indian_out_hw_va[fd->attr_para->r_idx];
> + attr_ethnicity_result =3D
> + (u32 *)fd->dma_para->ethnicity_out_hw_va[fd->attr_para->r_idx];
> +
> + aie_cfg->attr_out.merged_age_ret[0] =3D
> aie_get_lo16(*attr_age_result);
> + aie_cfg->attr_out.merged_age_ret[1] =3D
> aie_get_hi16(*attr_age_result);
> +
> + aie_cfg->attr_out.merged_gender_ret[0] =3D
> aie_get_lo16(*attr_gender_result);
> + aie_cfg->attr_out.merged_gender_ret[1] =3D
> aie_get_hi16(*attr_gender_result);
> +
> + aie_cfg->attr_out.merged_is_indian_ret[0] =3D
> aie_get_lo16(*attr_is_indian_result);
> + aie_cfg->attr_out.merged_is_indian_ret[1] =3D
> aie_get_hi16(*attr_is_indian_result);
> +
> + aie_cfg->attr_out.merged_ethnicity_ret[0] =3D
> aie_get_lo16(*attr_ethnicity_result);
> + aie_cfg->attr_out.merged_ethnicity_ret[1] =3D
> aie_get_hi16(*attr_ethnicity_result);
> + aie_cfg->attr_out.merged_ethnicity_ret[2] =3D
> aie_get_lo16(*(attr_ethnicity_result + 1));
> +
> + fd->attr_para->r_idx =3D (fd->attr_para->r_idx + 1) %
> MAX_ENQUE_FRAME_NUM;
> +}
> +
> +void aie_get_fld_result(struct mtk_aie_dev *fd, struct aie_enq_info
> *aie_cfg)
> +{
> + u8 fld_rlt[FLD_OUTPUT_X_SIZE][FLD_OUTPUT_SIZE];
> + u16 *out_parsing;
> + int i, j;
> +
> + aie_cfg->irq_status =3D readl(fd->fd_base + AIE_INT_EN_REG);
> +
> + memcpy(fld_rlt, fd->fld_para->fld_output_va[0], sizeof(fld_rlt));
> +
> + for (j =3D 0; j < aie_cfg->fld_face_num; j++) {
> + out_parsing =3D (unsigned short *)&fld_rlt[j][0];
> + for (i =3D 0; i < FLD_CUR_LANDMARK; i++) {
> + aie_cfg->fld_out[j].fld_landmark[i].x =3D *out_parsing;
> + aie_cfg->fld_out[j].fld_landmark[i].y =3D *(out_parsing + 1);
> +
> + if (i % 2)
> + out_parsing =3D out_parsing + 6;
> + else
> + out_parsing =3D out_parsing + 2;
> + }
> + out_parsing =3D (unsigned short *)&fld_rlt[j][0];
> + if (FLD_CUR_LANDMARK % 2)
> + out_parsing =3D out_parsing + ((FLD_CUR_LANDMARK + 1) / 2) * 8;
> + else
> + out_parsing =3D out_parsing + (FLD_CUR_LANDMARK / 2) * 8;
> +
> + aie_cfg->fld_out[j].fld_out_rop =3D *out_parsing;
> + aie_cfg->fld_out[j].fld_out_rip =3D *(out_parsing + 1);
> + aie_cfg->fld_out[j].confidence =3D *(out_parsing + 2);
> + aie_cfg->fld_out[j].blinkscore =3D *(out_parsing + 3);
> + }
> +}
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
> b/drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
> new file mode 100644
> index 000000000000..28646d5a53aa
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
> @@ -0,0 +1,1295 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author:=C2=A0 Bo.Kong <bo.kong@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk_aie.h"
> +
> +#define V4L2_CID_MTK_AIE_MAX 2
> +#define Y2R_CFG_SIZE 34
> +#define RS_CFG_SIZE 30
> +#define FD_CFG_SIZE 56
> +
> +static const struct mtk_aie_variant aie_31_drvdata =3D {
> + .y2r_cfg_size =3D Y2R_CFG_SIZE,
> + .rs_cfg_size =3D RS_CFG_SIZE,
> + .fd_cfg_size =3D FD_CFG_SIZE,
> +};
> +
> +static const struct of_device_id mtk_aie_of_ids[] =3D {
> + { .compatible =3D "mediatek,mt8188-aie", .data =3D &aie_31_drvdata },
> + { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_aie_of_ids);
> +
> +static const struct v4l2_pix_format_mplane mtk_aie_img_fmts[] =3D {
> + {
> + .pixelformat =3D V4L2_PIX_FMT_NV16M,
> + .num_planes =3D 2,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_NV61M,
> + .num_planes =3D 2,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_YUYV,
> + .num_planes =3D 1,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_YVYU,
> + .num_planes =3D 1,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_UYVY,
> + .num_planes =3D 1,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_VYUY,
> + .num_planes =3D 1,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_GREY,
> + .num_planes =3D 1,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_NV12M,
> + .num_planes =3D 2,
> + },
> + {
> + .pixelformat =3D V4L2_PIX_FMT_NV12,
> + .num_planes =3D 1,
> + },
> +};
> +
> +static inline struct mtk_aie_ctx *fh_to_ctx(struct v4l2_fh *fh)
> +{
> + return container_of(fh, struct mtk_aie_ctx, fh);
> +}
> +
> +static inline struct mtk_aie_ctx *ctrl_to_ctx(const struct v4l2_ctrl
> *ctrl)
> +{
> + return container_of(ctrl->handler, struct mtk_aie_ctx, hdl);
> +}
> +
> +static void mtk_aie_hw_job_finish(struct mtk_aie_dev *fd,
> + =C2=A0 enum vb2_buffer_state vb_state)
> +{
> + struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
> + struct mtk_aie_ctx *ctx;
> +
> + pm_runtime_put(fd->dev);
> + ctx =3D v4l2_m2m_get_curr_priv(fd->m2m_dev);
> + if (!ctx) {
> + dev_err(fd->dev, "Failed to do v4l2_m2m_get_curr_priv!\n");
> + } else {
> + src_vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> + dst_vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> + if (src_vbuf && dst_vbuf)
> + v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> + if (src_vbuf)
> + v4l2_m2m_buf_done(src_vbuf, vb_state);
> + if (dst_vbuf)
> + v4l2_m2m_buf_done(dst_vbuf, vb_state);
> + if (src_vbuf && dst_vbuf)
> + v4l2_m2m_job_finish(fd->m2m_dev, ctx->fh.m2m_ctx);
> + }
> + complete_all(&fd->fd_job_finished);
> +}
> +
> +static int mtk_aie_hw_job_exec(struct mtk_aie_dev *fd)
> +{
> + pm_runtime_get_sync(fd->dev);
> +
> + reinit_completion(&fd->fd_job_finished);
> + schedule_delayed_work(&fd->job_timeout_work,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MS=
EC));
> +
> + return 0;
> +}
> +
> +static int mtk_aie_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> + struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> +
> + if (v4l2_buf->field =3D=3D V4L2_FIELD_ANY)
> + v4l2_buf->field =3D V4L2_FIELD_NONE;
> + if (v4l2_buf->field !=3D V4L2_FIELD_NONE)
> + return -EINVAL;
> +
> + return 0;
> +}
> +
> +static int mtk_aie_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> + struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> + struct vb2_queue *vq =3D vb->vb2_queue;
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vq);
> + struct v4l2_pix_format_mplane *pixfmt;
> + struct device *dev =3D ctx->dev;
> +
> + switch (vq->type) {
> + case V4L2_BUF_TYPE_META_CAPTURE:
> + if (vb2_plane_size(vb, 0) < ctx->dst_fmt.buffersize) {
> + dev_err(dev, "meta size %lu is too small\n", vb2_plane_size(vb,
> 0));
> + return -EINVAL;
> + }
> + vb2_set_plane_payload(vb, 0, ctx->dst_fmt.buffersize);
> + break;
> + case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> + pixfmt =3D &ctx->src_fmt;
> +
> + if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> + vbuf->field =3D V4L2_FIELD_NONE;
> +
> + if (vb->num_planes > 2 || vbuf->field !=3D V4L2_FIELD_NONE) {
> + dev_dbg(dev, "plane %d or field %d not supported\n",
> + vb->num_planes, vbuf->field);
> + return -EINVAL;
> + }
> +
> + if (vb2_plane_size(vb, 0) < pixfmt->plane_fmt[0].sizeimage) {
> + dev_dbg(dev, "plane 0 %lu is too small than %x\n",
> + vb2_plane_size(vb, 0), pixfmt->plane_fmt[0].sizeimage);
> + return -EINVAL;
> + }
> + vb2_set_plane_payload(vb, 0, pixfmt->plane_fmt[0].sizeimage);
> +
> + if (pixfmt->num_planes =3D=3D 2 &&
> + =C2=A0=C2=A0=C2=A0 vb2_plane_size(vb, 1) < pixfmt->plane_fmt[1].sizeima=
ge) {
> + dev_dbg(dev, "plane 1 %lu is too small than %x\n",
> + vb2_plane_size(vb, 1), pixfmt->plane_fmt[1].sizeimage);
> + return -EINVAL;
> + }
> + vb2_set_plane_payload(vb, 1, pixfmt->plane_fmt[1].sizeimage);
> + break;
> + }
> +
> + return 0;
> +}
> +
> +static void mtk_aie_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> + struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> + v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int mtk_aie_vb2_queue_setup(struct vb2_queue *vq,
> + =C2=A0=C2=A0 unsigned int *num_buffers,
> + =C2=A0=C2=A0 unsigned int *num_planes,
> + =C2=A0=C2=A0 unsigned int sizes[],
> + =C2=A0=C2=A0 struct device *alloc_devs[])
> +{
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vq);
> + struct device *dev =3D ctx->dev;
> + unsigned int size[2];
> + unsigned int plane;
> +
> + switch (vq->type) {
> + case V4L2_BUF_TYPE_META_CAPTURE:
> + size[0] =3D ctx->dst_fmt.buffersize;
> + size[1] =3D 0;
> + break;
> + case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> + size[0] =3D ctx->src_fmt.plane_fmt[0].sizeimage;
> + size[1] =3D ctx->src_fmt.plane_fmt[1].sizeimage;
> + break;
> + default:
> + size[0] =3D 0;
> + size[1] =3D 0;
> + }
> +
> + dev_dbg(dev, "vq type =3D %d, size[0] =3D %d, size[1] =3D %d\n",
> + vq->type, size[0], size[1]);
> +
> + if (*num_planes > 2)
> + return -EINVAL;
> +
> + *num_buffers =3D clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
> +
> + if (*num_planes =3D=3D 0) {
> + if (vq->type =3D=3D V4L2_BUF_TYPE_META_CAPTURE) {
> + sizes[0] =3D ctx->dst_fmt.buffersize;
> + *num_planes =3D 1;
> + return 0;
> + }
> +
> + *num_planes =3D ctx->src_fmt.num_planes;
> + if (*num_planes > 2)
> + return -EINVAL;
> + for (plane =3D 0; plane < *num_planes; plane++)
> + sizes[plane] =3D ctx->src_fmt.plane_fmt[plane].sizeimage;
> +
> + return 0;
> + }
> +
> + return 0;
> +}
> +
> +static int mtk_aie_vb2_start_streaming(struct vb2_queue *vq,
> unsigned int count)
> +{
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vq);
> + struct mtk_aie_dev *fd;
> +
> + if (!ctx)
> + return -EINVAL;
> +
> + fd =3D ctx->fd_dev;
> + if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && (++fd-
> >fd_stream_count =3D=3D 1))
> + return aie_init(ctx->fd_dev, &ctx->fd_dev->ctx->user_init);
> +
> + return 0;
> +}
> +
> +static void mtk_aie_job_timeout_work(struct work_struct *work)
> +{
> + struct mtk_aie_dev *fd =3D
> + container_of(work, struct mtk_aie_dev, job_timeout_work.work);
> +
> + dev_err(fd->dev, "FD Job timeout!");
> +
> + dev_dbg(fd->dev, "%s result result1: %x, %x, %x", __func__,
> + readl(fd->fd_base + AIE_RESULT_0_REG),
> + readl(fd->fd_base + AIE_RESULT_1_REG),
> + readl(fd->fd_base + AIE_DMA_CTL_REG));
> +
> + fd->aie_cfg->irq_status =3D readl(fd->fd_base + AIE_INT_EN_REG);
> +
> + if (fd->aie_cfg->sel_mode =3D=3D ATTRIBUTEMODE) {
> + dev_dbg(fd->dev, "w_idx =3D %d, r_idx =3D %d\n",
> + fd->attr_para->w_idx, fd->attr_para->r_idx);
> + }
> +
> + aie_irqhandle(fd);
> + aie_reset(fd);
> + atomic_dec(&fd->num_composing);
> + mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> + wake_up(&fd->flushing_waitq);
> +}
> +
> +static void mtk_aie_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vq);
> + struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> + struct v4l2_m2m_queue_ctx *queue_ctx;
> + struct mtk_aie_dev *fd =3D ctx->fd_dev;
> + struct vb2_v4l2_buffer *vb =3D NULL;
> + int ret;
> +
> + /* Waiting Job Finish */
> + ret =3D wait_for_completion_timeout(&fd->fd_job_finished,
> msecs_to_jiffies(1000));
> + if (!ret)
> + dev_err(fd->dev, "Wait job finish timeout\n");
> +
> + if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> + fd->fd_stream_count--;
> + if (fd->fd_stream_count > 0)
> + dev_dbg(fd->dev, "Stop: fd_stream_count =3D %d\n", fd-
> >fd_stream_count);
> + else
> + aie_uninit(fd);
> + }
> +
> + queue_ctx =3D V4L2_TYPE_IS_OUTPUT(vq->type) ? &m2m_ctx->out_q_ctx :
> + &m2m_ctx->cap_q_ctx;
> + while ((vb =3D v4l2_m2m_buf_remove(queue_ctx)))
> + v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +}
> +
> +static void mtk_aie_vb2_request_complete(struct vb2_buffer *vb)
> +{
> + struct mtk_aie_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> + v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
> +static int mtk_aie_querycap(struct file *file, void *fh,
> + =C2=A0=C2=A0=C2=A0 struct v4l2_capability *cap)
> +{
> + struct mtk_aie_dev *fd =3D video_drvdata(file);
> + struct device *dev =3D fd->dev;
> +
> + strscpy(cap->driver, dev_driver_string(dev), sizeof(cap->driver));
> + strscpy(cap->card, dev_driver_string(dev), sizeof(cap->card));
> +
> + cap->device_caps =3D V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> + =C2=A0=C2=A0 V4L2_CAP_STREAMING | V4L2_CAP_META_CAPTURE;
> + cap->capabilities =3D V4L2_CAP_DEVICE_CAPS | cap->device_caps;
> +
> + return 0;
> +}
> +
> +static int mtk_aie_enum_fmt_out_mp(struct file *file, void *fh,
> + =C2=A0=C2=A0 struct v4l2_fmtdesc *f)
> +{
> + if (f->index >=3D ARRAY_SIZE(mtk_aie_img_fmts))
> + return -EINVAL;
> +
> + f->pixelformat =3D mtk_aie_img_fmts[f->index].pixelformat;
> + return 0;
> +}
> +
> +static void mtk_aie_fill_pixfmt_mp(struct v4l2_pix_format_mplane
> *dfmt,
> + =C2=A0=C2=A0 const struct v4l2_pix_format_mplane *sfmt)
> +{
> + dfmt->field =3D V4L2_FIELD_NONE;
> + dfmt->colorspace =3D V4L2_COLORSPACE_BT2020;
> + dfmt->num_planes =3D sfmt->num_planes;
> + dfmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> + dfmt->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> + dfmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> + dfmt->pixelformat =3D sfmt->pixelformat;
> +
> + /* Keep user setting as possible */
> + dfmt->width =3D clamp(dfmt->width, MTK_FD_OUTPUT_MIN_WIDTH,
> + =C2=A0=C2=A0=C2=A0 MTK_FD_OUTPUT_MAX_WIDTH);
> + dfmt->height =3D clamp(dfmt->height, MTK_FD_OUTPUT_MIN_HEIGHT,
> + =C2=A0=C2=A0=C2=A0=C2=A0 MTK_FD_OUTPUT_MAX_HEIGHT);
> +
> + dfmt->plane_fmt[0].bytesperline =3D ALIGN(dfmt->width, 16);
> + dfmt->plane_fmt[1].bytesperline =3D ALIGN(dfmt->width, 16);
> +
> + dfmt->plane_fmt[0].sizeimage =3D dfmt->height * dfmt-
> >plane_fmt[0].bytesperline;
> + dfmt->plane_fmt[1].sizeimage =3D dfmt->height * dfmt-
> >plane_fmt[1].bytesperline;
> + if (sfmt->num_planes =3D=3D 2 && sfmt->pixelformat =3D=3D
> V4L2_PIX_FMT_NV12M) {
> + dfmt->plane_fmt[1].sizeimage /=3D 2;
> + } else if (sfmt->pixelformat =3D=3D V4L2_PIX_FMT_NV12) {
> + dfmt->plane_fmt[0].sizeimage *=3D 3;
> + dfmt->plane_fmt[0].sizeimage /=3D 2;
> + }
> +}
> +
> +static const struct v4l2_pix_format_mplane *mtk_aie_find_fmt(u32
> format)
> +{
> + unsigned int i;
> +
> + for (i =3D 0; i < ARRAY_SIZE(mtk_aie_img_fmts); i++) {
> + if (mtk_aie_img_fmts[i].pixelformat =3D=3D format)
> + return &mtk_aie_img_fmts[i];
> + }
> +
> + return NULL;
> +}
> +
> +static int mtk_aie_try_fmt_out_mp(struct file *file, void *fh,
> + =C2=A0 struct v4l2_format *f)
> +{
> + struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> + const struct v4l2_pix_format_mplane *fmt;
> +
> + fmt =3D mtk_aie_find_fmt(pix_mp->pixelformat);
> + if (!fmt)
> + fmt =3D &mtk_aie_img_fmts[0];
> +
> + mtk_aie_fill_pixfmt_mp(pix_mp, fmt);
> + return 0;
> +}
> +
> +static int mtk_aie_g_fmt_out_mp(struct file *file, void *fh,
> + struct v4l2_format *f)
> +{
> + struct mtk_aie_ctx *ctx =3D fh_to_ctx(fh);
> +
> + f->fmt.pix_mp =3D ctx->src_fmt;
> +
> + return 0;
> +}
> +
> +static int mtk_aie_s_fmt_out_mp(struct file *file, void *fh,
> + struct v4l2_format *f)
> +{
> + struct mtk_aie_ctx *ctx =3D fh_to_ctx(fh);
> + struct vb2_queue *vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> + const struct v4l2_pix_format_mplane *fmt;
> + struct mtk_aie_dev *fd =3D ctx->fd_dev;
> +
> + if (!vq) {
> + dev_err(fd->dev, "%s vq is NULL!\n", __func__);
> + return -EINVAL;
> + }
> +
> + /* Change not allowed if queue is streaming. */
> + if (vb2_is_streaming(vq))
> + return -EBUSY;
> +
> + fmt =3D mtk_aie_find_fmt(f->fmt.pix_mp.pixelformat);
> + if (!fmt)
> + fmt =3D &mtk_aie_img_fmts[0];
> + else if (&fd->ctx->fh !=3D file->private_data)
> + return -EBUSY;
> +
> + fd->ctx =3D ctx;
> + mtk_aie_fill_pixfmt_mp(&f->fmt.pix_mp, fmt);
> + ctx->src_fmt =3D f->fmt.pix_mp;
> +
> + return 0;
> +}
> +
> +static int mtk_aie_enum_fmt_meta_cap(struct file *file, void *fh,
> + =C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fmtdesc *f)
> +{
> + if (f->index)
> + return -EINVAL;
> +
> + strscpy(f->description, "Face detection result", sizeof(f-
> >description));
> + f->pixelformat =3D V4L2_META_FMT_MTFD_RESULT;
> + f->flags =3D 0;
> +
> + return 0;
> +}
> +
> +static int mtk_aie_g_fmt_meta_cap(struct file *file, void *fh,
> + =C2=A0 struct v4l2_format *f)
> +{
> + f->fmt.meta.dataformat =3D V4L2_META_FMT_MTFD_RESULT;
> + f->fmt.meta.buffersize =3D sizeof(struct aie_enq_info);
> +
> + return 0;
> +}
> +
> +static const struct vb2_ops mtk_aie_vb2_ops =3D {
> + .queue_setup =3D mtk_aie_vb2_queue_setup,
> + .buf_out_validate =3D mtk_aie_vb2_buf_out_validate,
> + .buf_prepare =3D mtk_aie_vb2_buf_prepare,
> + .buf_queue =3D mtk_aie_vb2_buf_queue,
> + .start_streaming =3D mtk_aie_vb2_start_streaming,
> + .stop_streaming =3D mtk_aie_vb2_stop_streaming,
> + .wait_prepare =3D vb2_ops_wait_prepare,
> + .wait_finish =3D vb2_ops_wait_finish,
> + .buf_request_complete =3D mtk_aie_vb2_request_complete,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_aie_v4l2_video_out_ioctl_ops
> =3D {
> + .vidioc_querycap =3D mtk_aie_querycap,
> + .vidioc_enum_fmt_vid_out =3D mtk_aie_enum_fmt_out_mp,
> + .vidioc_g_fmt_vid_out_mplane =3D mtk_aie_g_fmt_out_mp,
> + .vidioc_s_fmt_vid_out_mplane =3D mtk_aie_s_fmt_out_mp,
> + .vidioc_try_fmt_vid_out_mplane =3D mtk_aie_try_fmt_out_mp,
> + .vidioc_enum_fmt_meta_cap =3D mtk_aie_enum_fmt_meta_cap,
> + .vidioc_g_fmt_meta_cap =3D mtk_aie_g_fmt_meta_cap,
> + .vidioc_s_fmt_meta_cap =3D mtk_aie_g_fmt_meta_cap,
> + .vidioc_try_fmt_meta_cap =3D mtk_aie_g_fmt_meta_cap,
> + .vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> + .vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> + .vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> + .vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> + .vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> + .vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> + .vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> + .vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> + .vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> + .vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> + .vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +};
> +
> +static int mtk_aie_queue_init(void *priv, struct vb2_queue *src_vq,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_queue *dst_vq)
> +{
> + struct mtk_aie_ctx *ctx =3D priv;
> + int ret;
> +
> + src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> + src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> + src_vq->supports_requests =3D true;
> + src_vq->drv_priv =3D ctx;
> + src_vq->ops =3D &mtk_aie_vb2_ops;
> + src_vq->mem_ops =3D &vb2_dma_contig_memops;
> + src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> + src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> + src_vq->lock =3D &ctx->fd_dev->vfd_lock;
> + src_vq->dev =3D ctx->fd_dev->v4l2_dev.dev;
> +
> + ret =3D vb2_queue_init(src_vq);
> + if (ret)
> + return ret;
> +
> + dst_vq->type =3D V4L2_BUF_TYPE_META_CAPTURE;
> + dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> + dst_vq->drv_priv =3D ctx;
> + dst_vq->ops =3D &mtk_aie_vb2_ops;
> + dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> + dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> + dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> + dst_vq->lock =3D &ctx->fd_dev->vfd_lock;
> + dst_vq->dev =3D ctx->fd_dev->v4l2_dev.dev;
> +
> + return vb2_queue_init(dst_vq);
> +}
> +
> +static int mtk_aie_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> + struct mtk_aie_ctx *ctx =3D ctrl_to_ctx(ctrl);
> + struct v4l2_ctrl_aie_param *p_aie_param;
> + struct v4l2_ctrl_aie_init *p_aie_init;
> +
> + if (!ctx)
> + return -EINVAL;
> +
> + switch (ctrl->id) {
> + case V4L2_CID_MTK_AIE_INIT:
> + p_aie_init =3D ctrl->p_new.p;
> + memcpy(&ctx->user_init, p_aie_init, sizeof(struct
> v4l2_ctrl_aie_init));
> + break;
> + case V4L2_CID_MTK_AIE_PARAM:
> + p_aie_param =3D ctrl->p_new.p;
> + memcpy(&ctx->user_param, p_aie_param, sizeof(struct
> v4l2_ctrl_aie_param));
> + break;
> + default:
> + return -EINVAL;
> + }
> +
> + return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops aie_ctrl_ops =3D {
> + .s_ctrl =3D mtk_aie_s_ctrl,
> +};
> +
> +static void mtk_aie_ctrl_type_op_init(const struct v4l2_ctrl *ctrl,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 from_idx, union v4l2_ctrl_ptr ptr)
> +{
> + struct v4l2_ctrl_aie_param *p_aie_param;
> + struct v4l2_ctrl_aie_init *p_aie_init;
> +
> + switch (ctrl->id) {
> + case V4L2_CID_MTK_AIE_INIT:
> + p_aie_init =3D ptr.p;
> + memset(p_aie_init, 0, sizeof(struct v4l2_ctrl_aie_init));
> + break;
> +
> + case V4L2_CID_MTK_AIE_PARAM:
> + p_aie_param =3D ptr.p;
> + memset(p_aie_param, 0, sizeof(struct v4l2_ctrl_aie_param));
> + break;
> +
> + default:
> + break;
> + }
> +}
> +
> +static int mtk_aie_ctrl_type_op_validate(const struct v4l2_ctrl
> *ctrl,
> + union v4l2_ctrl_ptr ptr)
> +{
> + struct mtk_aie_ctx *ctx =3D ctrl_to_ctx(ctrl);
> + struct v4l2_ctrl_aie_param *p_aie_param;
> + struct v4l2_ctrl_aie_init *p_aie_init;
> + struct mtk_aie_dev *fd;
> +
> + if (!ctx)
> + return -EINVAL;
> +
> + fd =3D ctx->fd_dev;
> +
> + switch (ctrl->id) {
> + case V4L2_CID_MTK_AIE_PARAM:
> + p_aie_param =3D ptr.p;
> +
> + switch (p_aie_param->fd_mode) {
> + case FDMODE:
> + case ATTRIBUTEMODE:
> + case FLDMODE:
> + break;
> + default:
> + dev_err(ctx->dev, "Invalid Requested Mode: %d\n", p_aie_param-
> >fd_mode);
> + return -EINVAL;
> + }
> +
> + switch (p_aie_param->src_img_fmt) {
> + case FMT_YUV_2P:
> + case FMT_YVU_2P:
> + case FMT_YUYV:
> + case FMT_YVYU:
> + case FMT_UYVY:
> + case FMT_VYUY:
> + case FMT_MONO:
> + case FMT_YUV420_2P:
> + case FMT_YUV420_1P:
> + break;
> + default:
> + dev_err(ctx->dev, "Invalid Requested Fmt: %d\n", p_aie_param-
> >src_img_fmt);
> + return -EINVAL;
> + }
> +
> + if (p_aie_param->src_img_width > fd->base_para->max_img_rect.width
> ||
> + =C2=A0=C2=A0=C2=A0 p_aie_param->src_img_height > fd->base_para-
> >max_img_rect.height ||
> + =C2=A0=C2=A0=C2=A0 p_aie_param->src_img_width =3D=3D 0 || p_aie_param->=
src_img_height
> =3D=3D 0) {
> + dev_err(fd->dev, "Invalid Requested Src_WD: %d Src_HT: %d\n",
> + p_aie_param->src_img_width,
> + p_aie_param->src_img_height);
> +
> + dev_err(fd->dev, "Invalid Requested MAX_Src_WD: %d MAX_Src_HT:
> %d\n",
> + fd->base_para->max_img_rect.width,
> + fd->base_para->max_img_rect.height);
> +
> + return -EINVAL;
> + }
> +
> + if (p_aie_param->pyramid_base_width > fd->base_para-
> >max_pyramid_rect.width ||
> + =C2=A0=C2=A0=C2=A0 p_aie_param->pyramid_base_height > fd->base_para-
> >max_pyramid_rect.height ||
> + =C2=A0=C2=A0=C2=A0 p_aie_param->number_of_pyramid > 3 ||
> + =C2=A0=C2=A0=C2=A0 p_aie_param->number_of_pyramid <=3D 0) {
> + dev_err(fd->dev, "Invalid Requested base w: %d h: %d num: %d\n",
> + p_aie_param->pyramid_base_width, p_aie_param->pyramid_base_height,
> + p_aie_param->number_of_pyramid);
> +
> + dev_err(fd->dev, "Invalid Requested max w: %d h: %d\n",
> + fd->base_para->max_pyramid_rect.width,
> + fd->base_para->max_pyramid_rect.height);
> +
> + return -EINVAL;
> + }
> +
> + break;
> +
> + case V4L2_CID_MTK_AIE_INIT:
> + p_aie_init =3D ptr.p;
> + if (!p_aie_init->max_img_width || !p_aie_init->max_img_height ||
> + =C2=A0=C2=A0=C2=A0 !p_aie_init->pyramid_width || !p_aie_init->pyramid_h=
eight) {
> + dev_err(fd->dev,
> + "Invalid Requested max_w: %d max_h: %d, p_w: %d p_h: %d\n",
> + p_aie_init->max_img_width, p_aie_init->max_img_height,
> + p_aie_init->pyramid_width, p_aie_init->pyramid_height);
> +
> + return -EINVAL;
> + }
> +
> + break;
> +
> + default:
> + return -EINVAL;
> + }
> +
> + return 0;
> +}
> +
> +static const struct v4l2_ctrl_type_ops aie_ctrl_type_ops =3D {
> + .equal =3D v4l2_ctrl_type_op_equal,
> + .init =3D mtk_aie_ctrl_type_op_init,
> + .log =3D v4l2_ctrl_type_op_log,
> + .validate =3D mtk_aie_ctrl_type_op_validate,
> +};
> +
> +static struct v4l2_ctrl_config mtk_aie_controls[] =3D {
> + {
> + .ops =3D &aie_ctrl_ops,
> + .type_ops =3D &aie_ctrl_type_ops,
> + .id =3D V4L2_CID_MTK_AIE_INIT,
> + .name =3D "FD detection init",
> + .type =3D V4L2_CTRL_TYPE_AIE_INIT,
> + .elem_size =3D sizeof(struct v4l2_ctrl_aie_init),
> + }, {
> + .ops =3D &aie_ctrl_ops,
> + .type_ops =3D &aie_ctrl_type_ops,
> + .id =3D V4L2_CID_MTK_AIE_PARAM,
> + .name =3D "FD detection param",
> + .type =3D V4L2_CTRL_TYPE_AIE_PARAM,
> + .elem_size =3D sizeof(struct v4l2_ctrl_aie_param),
> + },
> +};
> +
> +static int mtk_aie_ctrls_setup(struct mtk_aie_ctx *ctx)
> +{
> + struct v4l2_ctrl_handler *hdl =3D &ctx->hdl;
> + int i;
> +
> + v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_AIE_MAX);
> + if (hdl->error)
> + return hdl->error;
> +
> + for (i =3D 0; i < ARRAY_SIZE(mtk_aie_controls); i++) {
> + v4l2_ctrl_new_custom(hdl, &mtk_aie_controls[i], ctx);
> + if (hdl->error) {
> + v4l2_ctrl_handler_free(hdl);
> + dev_err(ctx->dev, "Failed to register controls: %d", i);
> + return hdl->error;
> + }
> + }
> +
> + ctx->fh.ctrl_handler =3D &ctx->hdl;
> + v4l2_ctrl_handler_setup(hdl);
> +
> + return 0;
> +}
> +
> +static void init_ctx_fmt(struct mtk_aie_ctx *ctx)
> +{
> + struct v4l2_pix_format_mplane *src_fmt =3D &ctx->src_fmt;
> + struct v4l2_meta_format *dst_fmt =3D &ctx->dst_fmt;
> +
> + /* Initialize M2M source fmt */
> + src_fmt->width =3D MTK_FD_OUTPUT_MAX_WIDTH;
> + src_fmt->height =3D MTK_FD_OUTPUT_MAX_HEIGHT;
> + mtk_aie_fill_pixfmt_mp(src_fmt, &mtk_aie_img_fmts[0]);
> +
> + /* Initialize M2M destination fmt */
> + dst_fmt->buffersize =3D sizeof(struct aie_enq_info);
> + dst_fmt->dataformat =3D V4L2_META_FMT_MTFD_RESULT;
> +}
> +
> +/*
> + * V4L2 file operations.
> + */
> +static int mtk_vfd_open(struct file *filp)
> +{
> + struct video_device *vdev =3D video_devdata(filp);
> + struct mtk_aie_dev *fd =3D video_drvdata(filp);
> + struct mtk_aie_ctx *ctx;
> + int ret;
> +
> + mutex_lock(&fd->dev_lock);
> +
> + if (fd->fd_state & STATE_OPEN) {
> + dev_err(fd->dev, "VFD is already open, Only one instance is
> supported\n");
> + ret =3D=C2=A0 -EBUSY;
> + goto err_unlock;
> + }
> +
> + ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> + if (!ctx) {
> + ret =3D=C2=A0 -ENOMEM;
> + goto err_unlock;
> + }
> +
> + ctx->fd_dev =3D fd;
> + ctx->dev =3D fd->dev;
> + fd->ctx =3D ctx;
> +
> + v4l2_fh_init(&ctx->fh, vdev);
> + filp->private_data =3D &ctx->fh;
> +
> + init_ctx_fmt(ctx);
> +
> + ret =3D mtk_aie_ctrls_setup(ctx);
> + if (ret) {
> + dev_err(ctx->dev, "Failed to set up controls: %d\n", ret);
> + goto err_fh_exit;
> + }
> + ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(fd->m2m_dev, ctx,
> &mtk_aie_queue_init);
> + if (IS_ERR(ctx->fh.m2m_ctx)) {
> + ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> + goto err_free_ctrl_handler;
> + }
> + v4l2_fh_add(&ctx->fh);
> + fd->fd_state |=3D STATE_OPEN;
> +
> + mutex_unlock(&fd->dev_lock);
> +
> + return 0;
> +err_free_ctrl_handler:
> + v4l2_ctrl_handler_free(&ctx->hdl);
> +err_fh_exit:
> + v4l2_fh_exit(&ctx->fh);
> + kfree(ctx);
> +err_unlock:
> + mutex_unlock(&fd->dev_lock);
> +
> + return ret;
> +}
> +
> +static int mtk_vfd_release(struct file *filp)
> +{
> + struct mtk_aie_ctx *ctx =3D container_of(filp->private_data, struct
> mtk_aie_ctx, fh);
> + struct mtk_aie_dev *fd =3D video_drvdata(filp);
> +
> + mutex_lock(&fd->dev_lock);
> +
> + fd->fd_state &=3D ~STATE_OPEN;
> +
> + v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> + v4l2_ctrl_handler_free(&ctx->hdl);
> + v4l2_fh_del(&ctx->fh);
> + v4l2_fh_exit(&ctx->fh);
> +
> + kfree(ctx);
> +
> + mutex_unlock(&fd->dev_lock);
> +
> + return 0;
> +}
> +
> +static __poll_t mtk_vfd_fop_poll(struct file *file, poll_table
> *wait)
> +{
> + int ret;
> +
> + struct mtk_aie_ctx *ctx =3D container_of(file->private_data, struct
> mtk_aie_ctx, fh);
> + struct mtk_aie_dev *fd =3D ctx->fd_dev;
> +
> + if (fd->fd_state & STATE_INIT) {
> + /* Waiting Job Finsh */
> + ret =3D wait_for_completion_timeout(&fd->fd_job_finished,
> msecs_to_jiffies(1000));
> + if (!ret) {
> + dev_err(ctx->dev, "Wait job finish timeout from poll\n");
> + return EPOLLERR;
> + }
> + }
> +
> + return v4l2_m2m_fop_poll(file, wait);
> +}
> +
> +static const struct v4l2_file_operations fd_video_fops =3D {
> + .owner =3D THIS_MODULE,
> + .open =3D mtk_vfd_open,
> + .release =3D mtk_vfd_release,
> + .poll =3D mtk_vfd_fop_poll,
> + .unlocked_ioctl =3D video_ioctl2,
> + .mmap =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static int mtk_aie_job_ready(void *priv)
> +{
> + struct vb2_v4l2_buffer *src_buf, *dst_buf;
> + struct mtk_aie_ctx *ctx =3D priv;
> + struct mtk_aie_dev *fd =3D ctx->fd_dev;
> + struct fd_buffer src_img[2] =3D {};
> + void *plane_vaddr;
> +
> + if (!ctx->fh.m2m_ctx) {
> + dev_err(fd->dev, "Memory-to-memory context is NULL\n");
> + return -1;
> + }
> +
> + if (!(fd->fd_state & STATE_OPEN)) {
> + dev_err(fd->dev, "Job ready with device closed\n");
> + return -1;
> + }
> +
> + mutex_lock(&fd->fd_lock);
> +
> + src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> + dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> + if (!src_buf || !dst_buf) {
> + dev_err(fd->dev, "src or dst buf is NULL\n");
> + mutex_unlock(&fd->fd_lock);
> + return -1;
> + }
> +
> + if (!(fd->fd_state & STATE_INIT)) {
> + dev_err(fd->dev, "%s Wrong fd state: %d\n", __func__, fd-
> >fd_state);
> + mutex_unlock(&fd->fd_lock);
> + return -1;
> + }
> +
> + plane_vaddr =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> + if (!plane_vaddr) {
> + dev_err(fd->dev, "Failed to get plane virtual address\n");
> + mutex_unlock(&fd->fd_lock);
> + return -1;
> + }
> +
> + v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +
> + fd->aie_cfg =3D (struct aie_enq_info *)plane_vaddr;
> + fd->aie_cfg->fld_face_num =3D ctx->user_param.fld_face_num;
> +
> + memset(fd->aie_cfg, 0, sizeof(struct aie_enq_info));
> + memcpy(fd->aie_cfg, &ctx->user_param, sizeof(struct aie_enq_info));
> + memcpy(fd->aie_cfg->fld_input, ctx->user_param.fld_input,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLD_MAX_FRAME * sizeof(struct v4l2=
_fld_crop_rip_rop));
> +
> + src_img[0].dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf-
> >vb2_buf, 0);
> +
> + if (ctx->src_fmt.num_planes =3D=3D 2) {
> + src_img[1].dma_addr =3D
> + vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
> + }
> +
> + if ((fd->aie_cfg->sel_mode =3D=3D FDMODE || fd->aie_cfg->sel_mode =3D=
=3D
> ATTRIBUTEMODE) &&
> + =C2=A0=C2=A0=C2=A0 fd->aie_cfg->src_img_fmt =3D=3D FMT_YUV420_1P) {
> + src_img[1].dma_addr =3D src_img[0].dma_addr + ctx-
> >user_param.src_img_stride *
> + ctx->user_param.src_img_height;
> + }
> +
> + fd->aie_cfg->src_img_addr =3D src_img[0].dma_addr;
> + fd->aie_cfg->src_img_addr_uv =3D src_img[1].dma_addr;
> +
> + aie_prepare(fd, fd->aie_cfg);
> +
> + mutex_unlock(&fd->fd_lock);
> +
> + if (src_buf) {
> + /* Complete request controls if any */
> + v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx-
> >hdl);
> + }
> +
> + return 0;
> +}
> +
> +static void mtk_aie_device_run(void *priv)
> +{
> + struct mtk_aie_ctx *ctx =3D priv;
> + struct mtk_aie_dev *fd =3D ctx->fd_dev;
> + int ret;
> +
> + ret =3D mtk_aie_job_ready(priv);
> + if (ret =3D=3D -1) {
> + dev_err(fd->dev, "Failed to run job ready\n");
> + return;
> + }
> +
> + atomic_inc(&fd->num_composing);
> + mtk_aie_hw_job_exec(fd);
> + aie_execute(fd, fd->aie_cfg);
> +}
> +
> +static struct v4l2_m2m_ops fd_m2m_ops =3D {
> + .device_run =3D mtk_aie_device_run,
> +};
> +
> +static const struct media_device_ops fd_m2m_media_ops =3D {
> + .req_validate =3D vb2_request_validate,
> + .req_queue =3D v4l2_m2m_request_queue,
> +};
> +
> +static int mtk_aie_video_device_register(struct mtk_aie_dev *fd)
> +{
> + struct v4l2_m2m_dev *m2m_dev =3D fd->m2m_dev;
> + struct video_device *vfd =3D &fd->vfd;
> + struct device *dev =3D fd->dev;
> + int ret;
> +
> + vfd->fops =3D &fd_video_fops;
> + vfd->release =3D video_device_release_empty;
> + vfd->lock =3D &fd->vfd_lock;
> + vfd->v4l2_dev =3D &fd->v4l2_dev;
> + vfd->vfl_dir =3D VFL_DIR_M2M;
> + vfd->device_caps =3D V4L2_CAP_STREAMING |
> V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> + =C2=A0=C2=A0 V4L2_CAP_META_CAPTURE;
> + vfd->ioctl_ops =3D &mtk_aie_v4l2_video_out_ioctl_ops;
> +
> + strscpy(vfd->name, dev_driver_string(dev), sizeof(vfd->name));
> +
> + video_set_drvdata(vfd, fd);
> +
> + ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
> + if (ret) {
> + dev_err(dev, "Failed to register video device\n");
> + return ret;
> + }
> +
> + ret =3D v4l2_m2m_register_media_controller(m2m_dev, vfd,
> MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> + if (ret) {
> + dev_err(dev, "Failed to init mem2mem media controller\n");
> + video_unregister_device(vfd);
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +static int mtk_aie_dev_v4l2_init(struct mtk_aie_dev *fd)
> +{
> + struct media_device *mdev =3D &fd->mdev;
> + struct device *dev =3D fd->dev;
> + int ret;
> +
> + ret =3D v4l2_device_register(dev, &fd->v4l2_dev);
> + if (ret) {
> + dev_err(dev, "Failed to register v4l2 device\n");
> + return ret;
> + }
> +
> + fd->m2m_dev =3D v4l2_m2m_init(&fd_m2m_ops);
> + if (IS_ERR(fd->m2m_dev)) {
> + dev_err(dev, "Failed to init mem2mem device\n");
> + ret =3D PTR_ERR(fd->m2m_dev);
> + goto err_unreg_v4l2_dev;
> + }
> +
> + mdev->dev =3D dev;
> + strscpy(mdev->model, dev_driver_string(dev), sizeof(mdev->model));
> + media_device_init(mdev);
> + mdev->ops =3D &fd_m2m_media_ops;
> + fd->v4l2_dev.mdev =3D mdev;
> +
> + ret =3D mtk_aie_video_device_register(fd);
> + if (ret)
> + goto err_cleanup_mdev;
> +
> + ret =3D media_device_register(mdev);
> + if (ret) {
> + dev_err(dev, "Failed to register mem2mem media device\n");
> + goto err_unreg_vdev;
> + }
> + return 0;
> +
> +err_unreg_vdev:
> + v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> + video_unregister_device(&fd->vfd);
> +err_cleanup_mdev:
> + media_device_cleanup(mdev);
> + v4l2_m2m_release(fd->m2m_dev);
> +err_unreg_v4l2_dev:
> + v4l2_device_unregister(&fd->v4l2_dev);
> + return ret;
> +}
> +
> +static void mtk_aie_video_device_unregister(struct mtk_aie_dev *fd)
> +{
> + v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> + video_unregister_device(&fd->vfd);
> + media_device_cleanup(&fd->mdev);
> + v4l2_m2m_release(fd->m2m_dev);
> + v4l2_device_unregister(&fd->v4l2_dev);
> +}
> +
> +static void mtk_aie_frame_done_worker(struct work_struct *work)
> +{
> + struct mtk_aie_req_work *req_work =3D (struct mtk_aie_req_work
> *)work;
> + struct mtk_aie_dev *fd =3D (struct mtk_aie_dev *)req_work->fd_dev;
> +
> + if (fd->reg_cfg.fd_mode =3D=3D FDMODE) {
> + fd->reg_cfg.hw_result =3D readl(fd->fd_base + AIE_RESULT_0_REG);
> + fd->reg_cfg.hw_result1 =3D readl(fd->fd_base + AIE_RESULT_1_REG);
> + }
> +
> + mutex_lock(&fd->fd_lock);
> +
> + switch (fd->aie_cfg->sel_mode) {
> + case FDMODE:
> + aie_get_fd_result(fd, fd->aie_cfg);
> + break;
> + case ATTRIBUTEMODE:
> + aie_get_attr_result(fd, fd->aie_cfg);
> + break;
> + case FLDMODE:
> + aie_get_fld_result(fd, fd->aie_cfg);
> + break;
> + default:
> + dev_dbg(fd->dev, "Wrong sel_mode\n");
> + break;
> + }
> +
> + mutex_unlock(&fd->fd_lock);
> +
> + if (!cancel_delayed_work(&fd->job_timeout_work))
> + return;
> +
> + atomic_dec(&fd->num_composing);
> + mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_DONE);
> + wake_up(&fd->flushing_waitq);
> +}
> +
> +static int mtk_aie_resource_init(struct mtk_aie_dev *fd)
> +{
> + mutex_init(&fd->vfd_lock);
> + mutex_init(&fd->dev_lock);
> + mutex_init(&fd->fd_lock);
> +
> + init_completion(&fd->fd_job_finished);
> + complete_all(&fd->fd_job_finished);
> + INIT_DELAYED_WORK(&fd->job_timeout_work, mtk_aie_job_timeout_work);
> + init_waitqueue_head(&fd->flushing_waitq);
> + atomic_set(&fd->num_composing, 0);
> + fd->fd_stream_count =3D 0;
> +
> + fd->frame_done_wq =3D alloc_ordered_workqueue(dev_name(fd->dev),
> + =C2=A0=C2=A0=C2=A0 WQ_HIGHPRI | WQ_FREEZABLE);
> + if (!fd->frame_done_wq) {
> + dev_err(fd->dev, "failed to alloc frame_done workqueue\n");
> + mutex_destroy(&fd->vfd_lock);
> + mutex_destroy(&fd->dev_lock);
> + mutex_destroy(&fd->fd_lock);
> + return -ENOMEM;
> + }
> +
> + INIT_WORK(&fd->req_work.work, mtk_aie_frame_done_worker);
> + fd->req_work.fd_dev =3D fd;
> +
> + return 0;
> +}
> +
> +static void mtk_aie_resource_free(struct platform_device *pdev)
> +{
> + struct mtk_aie_dev *fd =3D dev_get_drvdata(&pdev->dev);
> +
> + if (fd->frame_done_wq)
> + destroy_workqueue(fd->frame_done_wq);
> + fd->frame_done_wq =3D NULL;
> + mutex_destroy(&fd->vfd_lock);
> + mutex_destroy(&fd->dev_lock);
> + mutex_destroy(&fd->fd_lock);
> +}
> +
> +static irqreturn_t mtk_aie_irq(int irq, void *data)
> +{
> + struct mtk_aie_dev *fd =3D (struct mtk_aie_dev *)data;
> +
> + aie_irqhandle(fd);
> +
> + queue_work(fd->frame_done_wq, &fd->req_work.work);
> +
> + return IRQ_HANDLED;
> +}
> +
> +static int mtk_aie_probe(struct platform_device *pdev)
> +{
> + struct mtk_aie_dev *fd;
> + struct device *dev =3D &pdev->dev;
> + const struct mtk_aie_variant *driver_data =3D NULL;
> + const struct of_device_id *match =3D NULL;
> + int irq;
> + int ret;
> +
> + static struct clk_bulk_data aie_clks[] =3D {
> + { .id =3D "img-ipe" },
> + { .id =3D "ipe-fdvt" },
> + { .id =3D "ipe-top" },
> + { .id =3D "ipe-smi-larb12" },
> + };
> +
> + fd =3D devm_kzalloc(&pdev->dev, sizeof(*fd), GFP_KERNEL);
> + if (!fd)
> + return -ENOMEM;
> +
> + match =3D of_match_node(mtk_aie_of_ids, dev->of_node);
> + if (match)
> + driver_data =3D (const struct mtk_aie_variant *)match->data;
> +
> + fd->variant =3D driver_data;
> + if (!fd->variant)
> + return -ENODEV;
> +
> + ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> + if (ret)
> + return dev_err_probe(dev, ret, "Cannot set Coherent DMA mask\n");
> +
> + dev_set_drvdata(dev, fd);
> + fd->dev =3D dev;
> +
> + irq =3D platform_get_irq(pdev, 0);
> + if (irq < 0)
> + return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> +
> + ret =3D devm_request_irq(dev, irq, mtk_aie_irq, IRQF_SHARED,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_driver_string(dev), fd);
> + if (ret)
> + return dev_err_probe(dev, ret, "Failed to request irq\n");
> +
> + fd->irq =3D irq;
> + fd->fd_base =3D devm_platform_ioremap_resource(pdev, 0);
> + if (IS_ERR(fd->fd_base))
> + return dev_err_probe(dev, -EINVAL, "Failed to get fd reg base\n");
> +
> + fd->aie_clk.clk_num =3D ARRAY_SIZE(aie_clks);
> + fd->aie_clk.clks =3D aie_clks;
> + ret =3D devm_clk_bulk_get(&pdev->dev, fd->aie_clk.clk_num, fd-
> >aie_clk.clks);
> + if (ret)
> + return dev_err_probe(dev, ret, "Failed to get raw clock\n");
> +
> + ret =3D mtk_aie_resource_init(fd);
> + if (ret) {
> + mtk_aie_resource_free(pdev);
> + return ret;
> + }
> + pm_runtime_enable(dev);
> + ret =3D mtk_aie_dev_v4l2_init(fd);
> + if (ret) {
> + pm_runtime_disable(&pdev->dev);
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +static void mtk_aie_remove(struct platform_device *pdev)
> +{
> + struct mtk_aie_dev *fd =3D dev_get_drvdata(&pdev->dev);
> +
> + mtk_aie_video_device_unregister(fd);
> + pm_runtime_disable(&pdev->dev);
> + mtk_aie_resource_free(pdev);
> +}
> +
> +static int __maybe_unused mtk_aie_suspend(struct device *dev)
> +{
> + struct mtk_aie_dev *fd =3D dev_get_drvdata(dev);
> + int ret, num;
> +
> + if (pm_runtime_suspended(dev))
> + return 0;
> +
> + num =3D atomic_read(&fd->num_composing);
> +
> + ret =3D wait_event_timeout(fd->flushing_waitq,
> + !(num =3D atomic_read(&fd->num_composing)),
> + msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MSEC));
> + if (!ret && num) {
> + dev_dbg(dev, "%s: flushing aie job timeout num %d\n", __func__,
> num);
> +
> + return -EBUSY;
> + }
> +
> + ret =3D pm_runtime_force_suspend(dev);
> + if (ret)
> + return ret;
> +
> + return 0;
> +}
> +
> +static int __maybe_unused mtk_aie_resume(struct device *dev)
> +{
> + int ret;
> +
> + if (pm_runtime_suspended(dev)) {
> + dev_dbg(dev, "%s: pm_runtime_suspended is true, no action\n",
> __func__);
> + return 0;
> + }
> +
> + ret =3D pm_runtime_force_resume(dev);
> + if (ret)
> + return ret;
> +
> + return 0;
> +}
> +
> +static int __maybe_unused mtk_aie_runtime_suspend(struct device
> *dev)
> +{
> + struct mtk_aie_dev *fd =3D dev_get_drvdata(dev);
> +
> + clk_bulk_disable_unprepare(fd->aie_clk.clk_num, fd->aie_clk.clks);
> +
> + return 0;
> +}
> +
> +static int __maybe_unused mtk_aie_runtime_resume(struct device *dev)
> +{
> + struct mtk_aie_dev *fd =3D dev_get_drvdata(dev);
> + int ret;
> +
> + ret =3D clk_bulk_prepare_enable(fd->aie_clk.clk_num, fd-
> >aie_clk.clks);
> + if (ret) {
> + dev_err(dev, "Failed to enable clock: %d\n", ret);
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_aie_pm_ops =3D {
> + SET_SYSTEM_SLEEP_PM_OPS(mtk_aie_suspend, mtk_aie_resume)
> + SET_RUNTIME_PM_OPS(mtk_aie_runtime_suspend, mtk_aie_runtime_resume,
> NULL)
> +};
> +
> +static struct platform_driver mtk_aie_driver =3D {
> + .probe =3D mtk_aie_probe,
> + .remove =3D mtk_aie_remove,
> + .driver =3D {
> + .name =3D "mtk-aie-5.3",
> + .of_match_table =3D mtk_aie_of_ids,
> + .pm =3D pm_ptr(&mtk_aie_pm_ops),
> + }
> +};
> +
> +module_platform_driver(mtk_aie_driver);
> +MODULE_AUTHOR("Bo Kong <bo.kong@mediatek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MediaTek AIE driver");

