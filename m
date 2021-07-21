Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FE13D09FC
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 09:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhGUHHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 03:07:00 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50445 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235098AbhGUHGz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 03:06:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 66womzz0Zhqx966wpmyABU; Wed, 21 Jul 2021 09:47:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626853639; bh=wcwqyp83aWiiVP/xgme05L0RFGFqcaoQ6hpPeBMax3Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r1hIVuQG+1usCGrtnEnXWAbLjY9dUy+u/YwGes4RJDUDvvHWwQXrYOJi1pfEvg5P2
         GqhlFZ1F61FI/xUjr8lWVTpxZZor+nMyDh0bzviOyMvypyQt+sGh9xmCn9gwNk8waX
         ZMY4jAIz9WAwKR9fKraj3vwielQ+kAdqmicQeV5a9hGuhVnEH21lL0iGzSmcx8+7to
         ncjFLPzug3LGNxMOpaPtzMkZO//Dv4M0888Ewff4PUOZz+bL6bxd0obkQUM3xC0kga
         F0Iqf1FEUO7j/w+LPCqNcZzXXpIAhsQIlbaEIAVs1XxLM4DXeqPgCm+ufiTxG0xIIi
         rlhSObuSHuYlA==
Subject: Re: [PATCH v4 03/13] media: imx: imx8q: add imx8q vpu device driver
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1626743758.git.ming.qian@nxp.com>
 <b5280a27895da7b2128a8b856b70a39b9ceb3188.1626743758.git.ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <23da6982-8cc8-0f58-1289-e98f0944034b@xs4all.nl>
Date:   Wed, 21 Jul 2021 09:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b5280a27895da7b2128a8b856b70a39b9ceb3188.1626743758.git.ming.qian@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKNmbNgBJOmCees3JU1xCvBFHo0tpwIgQH1Q+ZcoZ8bow2y/EmC1igVXeMd0LDsKUYfZ/z11dvOh8jIinxbjR5gXuFYI6H0BKAklc5z79HBzp5+kZWDc
 oMX/Rhl4tfSuOEXZWbAniqF7Enk/Q1ior1r2Xc5cmrS8uWyb7IMVAPbIxlj69veQJnuELnCNxtoOjFH9nFncsOQ59KCbPtmw7vzmfMuG5prFa/UyzmZ/pB9z
 cgL2tBWceyeU21DChKiZQTl+1Jmzc45Hie/51/h382YYsXWmSexEd7c0DyWlFJoKUgovTiL2RLwd67r0Vnf2pRxq60qKhrWVajiuo7vogecdtJDTUQNS3n0t
 Ioh0OBpiNdymu0zdEZm04aL3ESX/CiJpkN/fdcZNiFCxT+Mfth3IOEMrmKcsDGjX9EPa4mv8Lq0frXIQtT02+3osaPE5f4rdHMjwamyJ4xPRTMvoAIGvh7QP
 IfdI4Z2NaS6r1BhyZDN0WAHZwC5dDmsJp6WNgkb2M/6Nxm5b8/AqScmdgwKWowz4HRsaHAa0JwXzWaObwsN6kMMMCRv07wtml1qRsMKskU9y+fyIzVjJpdQT
 7u8jq2zhdETkaz9Mxyz8wUU7MS2iksh3zqdJhai16hWEEnGie4VqQ4RR3sL2Kphyjrp3WunlctB6D4h/JfshWK3ZGFDqCZ2HgHzZKW8N5cxQnxhVcYNFtMhc
 uhmdB7fPynk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/07/2021 03:43, Ming Qian wrote:
> IMX8Q SoCs feature a powerful video processing unit able to decode many
> foramts and encode H.264.
> 
> The vpu IP is amphion malone decoder and windsor encoder.
> This Driver is for this IP that is based on the v4l2 mem2mem framework.
> 
> Supported SoCs are: IMX8QXP, IMX8QM
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>

<snip>

> diff --git a/include/uapi/linux/imx_vpu.h b/include/uapi/linux/imx_vpu.h
> new file mode 100644
> index 000000000000..330082d1c13f
> --- /dev/null
> +++ b/include/uapi/linux/imx_vpu.h
> @@ -0,0 +1,120 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright 2018-2020 NXP

2020 -> 2021

> + */
> +
> +/*
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */

Drop this copyright comment block. The SPDX tag is sufficient. This should be
removed in all files, just stick to the SPDX tag.

> +#ifndef _UAPI__LINUX_IMX_VPU_H
> +#define _UAPI__LINUX_IMX_VPU_H
> +
> +#include <linux/videodev2.h>
> +#include <linux/v4l2-controls.h>
> +
> +/*imx v4l2 controls & extension controls*/
> +
> +//ctrls & extension ctrls definitions
> +#define V4L2_CID_NON_FRAME		(V4L2_CID_USER_IMX_BASE)

Don't use IMX_BASE, that's for the staging/media/imx driver.

Add a new base for this driver to v4l2-controls.h.

> +#define V4L2_CID_DIS_REORDER		(V4L2_CID_USER_IMX_BASE + 1)
> +#define V4L2_CID_ROI_COUNT		(V4L2_CID_USER_IMX_BASE + 2)
> +#define V4L2_CID_ROI			(V4L2_CID_USER_IMX_BASE + 3)
> +#define V4L2_CID_IPCM_COUNT		(V4L2_CID_USER_IMX_BASE + 4)
> +#define V4L2_CID_IPCM			(V4L2_CID_USER_IMX_BASE + 5)
> +#define V4L2_CID_HDR10META		(V4L2_CID_USER_IMX_BASE + 6)
> +#define V4L2_CID_SECUREMODE		(V4L2_CID_USER_IMX_BASE + 7)
> +#define V4L2_CID_SC_ENABLE		(V4L2_CID_USER_IMX_BASE + 8)

These all need to be documented in this header. Also make sure that all these
structs are identical for 32 and 64 bit compilers (the pahole utility is
very useful to test that), and that there are no holes in the structs.

> +
> +#define V4L2_MAX_ROI_REGIONS		8
> +struct v4l2_enc_roi_param {
> +	struct v4l2_rect rect;
> +	__u32 enable;
> +	__s32 qp_delta;
> +	__u32 reserved[2];
> +};

Of interest might be this series adding support for dynamic array controls:

https://patchwork.linuxtv.org/project/linux-media/cover/20210610113615.785359-1-hverkuil-cisco@xs4all.nl/

It is very likely to be merged in the near future since it is needed for stateless
HEVC decoders.

> +
> +struct v4l2_enc_roi_params {
> +	__u32 num_roi_regions;
> +	struct v4l2_enc_roi_param roi_params[V4L2_MAX_ROI_REGIONS];
> +	__u32 config_store;

That can be dropped, it appears to refer to the old and never merged config store API.
Eventually the Request API was merged in the kernel, and that's what should be used.

> +	__u32 reserved[2];
> +};
> +
> +#define V4L2_MAX_IPCM_REGIONS		2
> +struct v4l2_enc_ipcm_param {
> +	struct v4l2_rect rect;
> +	__u32 enable;
> +	__u32 reserved[2];
> +};
> +struct v4l2_enc_ipcm_params {
> +	__u32 num_ipcm_regions;
> +	struct v4l2_enc_ipcm_param ipcm_params[V4L2_MAX_IPCM_REGIONS];
> +	__u32 config_store;
> +	__u32 reserved[2];
> +};
> +
> +struct v4l2_hdr10_meta {
> +	__u32 hasHdr10Meta;
> +	__u32 redPrimary[2];
> +	__u32 greenPrimary[2];
> +	__u32 bluePrimary[2];
> +	__u32 whitePoint[2];
> +	__u32 maxMasteringLuminance;
> +	__u32 minMasteringLuminance;
> +	__u32 maxContentLightLevel;
> +	__u32 maxFrameAverageLightLevel;
> +};

This is probably covered by the new colorimetry controls:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/ext-ctrls-colorimetry.html

> +
> +/*imx v4l2 command*/
> +#define V4L2_DEC_CMD_IMX_BASE		(0x08000000)
> +#define V4L2_DEC_CMD_RESET		(V4L2_DEC_CMD_IMX_BASE + 1)

Needs to be documented, looks dubious.

> +
> +/*imx v4l2 event*/
> +//error happened in dec/enc
> +#define V4L2_EVENT_CODEC_ERROR		(V4L2_EVENT_PRIVATE_START + 1)
> +//frame loss in dec/enc
> +#define V4L2_EVENT_SKIP			(V4L2_EVENT_PRIVATE_START + 2)
> +//crop area change in dec, not reso change
> +#define V4L2_EVENT_CROPCHANGE		(V4L2_EVENT_PRIVATE_START + 3)
> +//some options can't be handled by codec, so might be ignored or updated. But codec could go on.
> +#define V4L2_EVENT_INVALID_OPTION	(V4L2_EVENT_PRIVATE_START + 4)

Documentation. I'm not sure we want it this way, or perhaps some should become standard
events.

> +
> +/*imx v4l2 warning msg, attached with event V4L2_EVENT_INVALID_OPTION*/
> +enum {
> +	UNKONW_WARNING = -1,		//not known warning type
> +	RIOREGION_NOTALLOW,		//(part of)roi region can not work with media setting and be ignored by enc
> +	IPCMREGION_NOTALLOW,		//(part of)ipcm region can not work with media setting and be ignored by enc
> +	LEVEL_UPDATED,			//current level cant't work with media setting and be updated by enc
> +};
> +
> +/*  Flags for 'flags' field */
> +/* Buffer only contains codec config data, eg. sps and pps*/
> +#define V4L2_BUF_FLAG_CODECCONFIG	0x00200000
> +
> +/* imx v4l2 formats */
> +/*raw formats*/
> +#define V4L2_PIX_FMT_BGR565		v4l2_fourcc('B', 'G', 'R', 'P') /* 16  BGR-5-6-5 */
> +#define V4L2_PIX_FMT_NV12X		v4l2_fourcc('N', 'V', 'X', '2') /* Y/CbCr 4:2:0 for 10bit */
> +#define V4L2_PIX_FMT_DTRC		v4l2_fourcc('D', 'T', 'R', 'C') /* 8bit tile output, uncompressed */
> +#define V4L2_PIX_FMT_P010		v4l2_fourcc('P', '0', '1', '0')	/* ms p010, data stored in upper 10 bits of 16 */
> +#define V4L2_PIX_FMT_TILEX		v4l2_fourcc('D', 'T', 'R', 'X') /* 10 bit tile output, uncompressed */
> +#define V4L2_PIX_FMT_RFC		v4l2_fourcc('R', 'F', 'C', '0') /* 8bit tile output, with rfc*/
> +#define V4L2_PIX_FMT_RFCX		v4l2_fourcc('R', 'F', 'C', 'X') /* 10 bit tile output, with rfc */
> +#define V4L2_PIX_FMT_411SP		v4l2_fourcc('4', '1', 'S', 'P') /* YUV 411 Semi planar */
> +#define V4L2_PIX_FMT_NT8		v4l2_fourcc('N', 'A', '1', '2') /* NXP Tiled NV12 Format*/
> +#define V4L2_PIX_FMT_NT10		v4l2_fourcc('N', 'T', '1', '2') /* NXP Tiled 10 bit Format*/
> +
> +/*codec format*/
> +#define V4L2_PIX_FMT_AV1		v4l2_fourcc('A', 'V', '1', '0')	/* av1 */
> +#define V4L2_PIX_FMT_RV			v4l2_fourcc('R', 'V', '0', '0')	/* rv  */
> +#define V4L2_PIX_FMT_AVS		v4l2_fourcc('A', 'V', 'S', '0')	/* avs */
> +#define V4L2_PIX_FMT_VP6		v4l2_fourcc('V', 'P', '6', '0') /* vp6 */
> +#define V4L2_PIX_FMT_SPK		v4l2_fourcc('S', 'P', 'K', '0') /* spk */

All these formats need to be added to videodev2.h and documented.

I would suggest that you only keep what you really need for an initial submission of the
driver, and add these new API features later. Extending the uAPI is always much
more time consuming, so if possible you want to postpone that.

Regards,

	Hans

> +
> +/*codec formats*/
> +#endif	//#ifndef _UAPI__LINUX_IMX_VPU_H
> 

