Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D1333E78A
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 04:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhCQDPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 23:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCQDOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 23:14:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0F1C06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 20:14:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y1so1353856ljm.10
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qknUfHWdqW6AnX0C1/fDS1ifhZBmUTxuUVNXXlScDSA=;
        b=fdh4ndgURwuSjCzDoaxiWUm2zyNvDRu/gC+6dnD/bS2gnMHJ0BL267hsnRpOBaLvqX
         izmaTxCaAFehQ2YJN2IG+Beer0YyjTl768ZDHH1tAzPTgmvB+trhoIdJwo/fRMwL4eCd
         VN31laWMSg1t6t3RYO9tg8CkDytweW6OKjN/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qknUfHWdqW6AnX0C1/fDS1ifhZBmUTxuUVNXXlScDSA=;
        b=G9amU7KRVlNhSRsIH4FqrwVGDBxaCE51wzPHzNLnlPZHNycUN7baTAPGhLmcQSELRC
         nod3JNxYD0c+LKJwg5dAjEZYlBJrg1d8OXXSoDTnk9UbE/KDhKXNkQa4dZVT1OsspUjx
         YlE2OyAaGJDbDmaF0bqgSm8btHs0hOHyCBzRLWMtFIgGJb1vhFSjBgqm3ZMMguwrrv49
         22ImvjNyAJQyaLlvzmLtmwW88GNtUpYCwmQbL6CbVDsVXNqgrsTOXBe2f1cuavQ36ADS
         h81Tpj8m49q5PNOV4YzQi7wL8V06JKQL+gShk1c8KbTqoFyeebJXaGN/SxXdmCdvxvrv
         5zfQ==
X-Gm-Message-State: AOAM531gWVohM4PW3opsRppervDQOqTYpD4FvXY6q7uTDH/aMd+mBo4K
        Vyk+Vo/2JqAcKW5zzqznjg+hZSLGlu7zoA==
X-Google-Smtp-Source: ABdhPJx9jenjuW9CUoHmt+in5GBeZj5adgviDzDdOiAdi8bQ1EewU3jBjullHQqbi+6WnEb/7dnt6Q==
X-Received: by 2002:a2e:885a:: with SMTP id z26mr1082441ljj.316.1615950875660;
        Tue, 16 Mar 2021 20:14:35 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id j18sm3196595lfe.145.2021.03.16.20.14.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 20:14:35 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id f16so1417202ljm.1
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 20:14:35 -0700 (PDT)
X-Received: by 2002:a2e:80c4:: with SMTP id r4mr1073717ljg.87.1615950874502;
 Tue, 16 Mar 2021 20:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210226100148.1663389-1-acourbot@chromium.org>
 <20210226100148.1663389-7-acourbot@chromium.org> <CAAEAJfBRoOgT9waWjfK7uxFF+QCO+Cv0H22Z4V1p86G1wTt_Hw@mail.gmail.com>
 <CAPBb6MWrbzQMuNNYgjwcEg4_oapMHtjDvAtKkTtAvDqr3AVO9w@mail.gmail.com> <e10817d425d93e89d7c957a8084606f8e4a655c8.camel@ndufresne.ca>
In-Reply-To: <e10817d425d93e89d7c957a8084606f8e4a655c8.camel@ndufresne.ca>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 17 Mar 2021 12:14:23 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXjXqz7w+D5o46WafpLEiwriGbM0YeC9bm258rLizx6nQ@mail.gmail.com>
Message-ID: <CAPBb6MXjXqz7w+D5o46WafpLEiwriGbM0YeC9bm258rLizx6nQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] media: mtk-vcodec: vdec: support stateless H.264 decoding
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 16, 2021 at 12:21 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le lundi 15 mars 2021 =C3=A0 20:28 +0900, Alexandre Courbot a =C3=A9crit =
:
> > Hi Ezequiel,
> >
> > On Thu, Mar 4, 2021 at 6:47 AM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > >  Hi Alex,
> > >
> > > Thanks for the patch.
> > >
> > > On Fri, 26 Feb 2021 at 07:06, Alexandre Courbot <acourbot@chromium.or=
g>
> > > wrote:
> > > >
> > > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > > >
> > > > Add support for H.264 decoding using the stateless API, as supporte=
d by
> > > > MT8183. This support takes advantage of the V4L2 H.264 reference li=
st
> > > > builders.
> > > >
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > [acourbot: refactor, cleanup and split]
> > > > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > ---
> > > >  drivers/media/platform/Kconfig                |   1 +
> > > >  drivers/media/platform/mtk-vcodec/Makefile    |   1 +
> > > >  .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 807 ++++++++++++++=
++++
> > > >  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
> > > >  .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
> > > >  5 files changed, 813 insertions(+)
> > > >  create mode 100644 drivers/media/platform/mtk-
> > > > vcodec/vdec/vdec_h264_req_if.c
> > > >
> > > > diff --git a/drivers/media/platform/Kconfig
> > > > b/drivers/media/platform/Kconfig
> > > > index fd1831e97b22..c27db5643712 100644
> > > > --- a/drivers/media/platform/Kconfig
> > > > +++ b/drivers/media/platform/Kconfig
> > > > @@ -295,6 +295,7 @@ config VIDEO_MEDIATEK_VCODEC
> > > >         select V4L2_MEM2MEM_DEV
> > > >         select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> > > >         select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> > > > +       select V4L2_H264
> > > >         help
> > > >           Mediatek video codec driver provides HW capability to
> > > >           encode and decode in a range of video formats on MT8173
> > > > diff --git a/drivers/media/platform/mtk-vcodec/Makefile
> > > > b/drivers/media/platform/mtk-vcodec/Makefile
> > > > index 4ba93d838ab6..ca8e9e7a9c4e 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > > > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > > > @@ -7,6 +7,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) +=3D mtk-vcodec=
-dec.o \
> > > >  mtk-vcodec-dec-y :=3D vdec/vdec_h264_if.o \
> > > >                 vdec/vdec_vp8_if.o \
> > > >                 vdec/vdec_vp9_if.o \
> > > > +               vdec/vdec_h264_req_if.o \
> > > >                 mtk_vcodec_dec_drv.o \
> > > >                 vdec_drv_if.o \
> > > >                 vdec_vpu_if.o \
> > > > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_i=
f.c
> > > > b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > > > new file mode 100644
> > > > index 000000000000..2fbbfbbcfbec
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > > > @@ -0,0 +1,807 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +#include <linux/module.h>
> > > > +#include <linux/slab.h>
> > > > +#include <media/v4l2-mem2mem.h>
> > > > +#include <media/v4l2-h264.h>
> > > > +#include <media/videobuf2-dma-contig.h>
> > > > +
> > > > +#include "../vdec_drv_if.h"
> > > > +#include "../mtk_vcodec_util.h"
> > > > +#include "../mtk_vcodec_dec.h"
> > > > +#include "../mtk_vcodec_intr.h"
> > > > +#include "../vdec_vpu_if.h"
> > > > +#include "../vdec_drv_base.h"
> > > > +
> > > > +#define NAL_NON_IDR_SLICE                      0x01
> > > > +#define NAL_IDR_SLICE                          0x05
> > > > +#define NAL_H264_PPS                           0x08
> > >
> > > Not used?
> > >
> > > > +#define NAL_TYPE(value)                                ((value) & =
0x1F)
> > > > +
> > >
> > > I believe you may not need the NAL type.
> >
> > True, removed this block of defines.
> >
> > >
> > > > +#define BUF_PREDICTION_SZ                      (64 * 4096)
> > > > +#define MB_UNIT_LEN                            16
> > > > +
> > > > +/* get used parameters for sps/pps */
> > > > +#define GET_MTK_VDEC_FLAG(cond, flag) \
> > > > +       { dst_param->cond =3D ((src_param->flags & flag) ? (1) : (0=
)); }
> > > > +#define GET_MTK_VDEC_PARAM(param) \
> > > > +       { dst_param->param =3D src_param->param; }
> > > > +/* motion vector size (bytes) for every macro block */
> > > > +#define HW_MB_STORE_SZ                         64
> > > > +
> > > > +#define H264_MAX_FB_NUM                                17
> > > > +#define H264_MAX_MV_NUM                                32
> > > > +#define HDR_PARSING_BUF_SZ                     1024
> > > > +
> > > > +/**
> > > > + * struct mtk_h264_dpb_info  - h264 dpb information
> > > > + * @y_dma_addr: Y bitstream physical address
> > > > + * @c_dma_addr: CbCr bitstream physical address
> > > > + * @reference_flag: reference picture flag (short/long term refere=
nce
> > > > picture)
> > > > + * @field: field picture flag
> > > > + */
> > > > +struct mtk_h264_dpb_info {
> > > > +       dma_addr_t y_dma_addr;
> > > > +       dma_addr_t c_dma_addr;
> > > > +       int reference_flag;
> > > > +       int field;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mtk_h264_sps_param  - parameters for sps
> > > > + */
> > > > +struct mtk_h264_sps_param {
> > > > +       unsigned char chroma_format_idc;
> > > > +       unsigned char bit_depth_luma_minus8;
> > > > +       unsigned char bit_depth_chroma_minus8;
> > > > +       unsigned char log2_max_frame_num_minus4;
> > > > +       unsigned char pic_order_cnt_type;
> > > > +       unsigned char log2_max_pic_order_cnt_lsb_minus4;
> > > > +       unsigned char max_num_ref_frames;
> > > > +       unsigned char separate_colour_plane_flag;
> > > > +       unsigned short pic_width_in_mbs_minus1;
> > > > +       unsigned short pic_height_in_map_units_minus1;
> > > > +       unsigned int max_frame_nums;
> > > > +       unsigned char qpprime_y_zero_transform_bypass_flag;
> > > > +       unsigned char delta_pic_order_always_zero_flag;
> > > > +       unsigned char frame_mbs_only_flag;
> > > > +       unsigned char mb_adaptive_frame_field_flag;
> > > > +       unsigned char direct_8x8_inference_flag;
> > > > +       unsigned char reserved[3];
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mtk_h264_pps_param  - parameters for pps
> > > > + */
> > > > +struct mtk_h264_pps_param {
> > > > +       unsigned char num_ref_idx_l0_default_active_minus1;
> > > > +       unsigned char num_ref_idx_l1_default_active_minus1;
> > > > +       unsigned char weighted_bipred_idc;
> > > > +       char pic_init_qp_minus26;
> > > > +       char chroma_qp_index_offset;
> > > > +       char second_chroma_qp_index_offset;
> > > > +       unsigned char entropy_coding_mode_flag;
> > > > +       unsigned char pic_order_present_flag;
> > > > +       unsigned char deblocking_filter_control_present_flag;
> > > > +       unsigned char constrained_intra_pred_flag;
> > > > +       unsigned char weighted_pred_flag;
> > > > +       unsigned char redundant_pic_cnt_present_flag;
> > > > +       unsigned char transform_8x8_mode_flag;
> > > > +       unsigned char scaling_matrix_present_flag;
> > > > +       unsigned char reserved[2];
> > > > +};
> > > > +
> > > > +struct slice_api_h264_scaling_matrix {
> > >
> > > Equal to v4l2_ctrl_h264_scaling_matrix ?
> > > Well I guess you don't want to mix a hardware-specific
> > > thing with the V4L2 API maybe.
> >
> > That's the idea. Although the layout match and the ABI is now stable,
> > I think this communicates better the fact that this is a firmware
> > structure.
> >
> > >
> > > > +       unsigned char scaling_list_4x4[6][16];
> > > > +       unsigned char scaling_list_8x8[6][64];
> > > > +};
> > > > +
> > > > +struct slice_h264_dpb_entry {
> > > > +       unsigned long long reference_ts;
> > > > +       unsigned short frame_num;
> > > > +       unsigned short pic_num;
> > > > +       /* Note that field is indicated by v4l2_buffer.field */
> > > > +       int top_field_order_cnt;
> > > > +       int bottom_field_order_cnt;
> > > > +       unsigned int flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct slice_api_h264_decode_param - parameters for decode.
> > > > + */
> > > > +struct slice_api_h264_decode_param {
> > > > +       struct slice_h264_dpb_entry dpb[16];
> > >
> > > V4L2_H264_NUM_DPB_ENTRIES?
> >
> > For the same reason as above (this being a firmware structure), I
> > think it is clearer to not use the kernel definitions here.
> >
> > >
> > > > +       unsigned short num_slices;
> > > > +       unsigned short nal_ref_idc;
> > > > +       unsigned char ref_pic_list_p0[32];
> > > > +       unsigned char ref_pic_list_b0[32];
> > > > +       unsigned char ref_pic_list_b1[32];
> > >
> > > V4L2_H264_REF_LIST_LEN?
> >
> > Ditto.
> >
> > >
> > > > +       int top_field_order_cnt;
> > > > +       int bottom_field_order_cnt;
> > > > +       unsigned int flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mtk_h264_dec_slice_param  - parameters for decode curren=
t frame
> > > > + */
> > > > +struct mtk_h264_dec_slice_param {
> > > > +       struct mtk_h264_sps_param                       sps;
> > > > +       struct mtk_h264_pps_param                       pps;
> > > > +       struct slice_api_h264_scaling_matrix            scaling_mat=
rix;
> > > > +       struct slice_api_h264_decode_param              decode_para=
ms;
> > > > +       struct mtk_h264_dpb_info h264_dpb_info[16];
> > >
> > > V4L2_H264_NUM_DPB_ENTRIES?
> >
> > Ditto.
> >
> > >
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct h264_fb - h264 decode frame buffer information
> > > > + * @vdec_fb_va  : virtual address of struct vdec_fb
> > > > + * @y_fb_dma    : dma address of Y frame buffer (luma)
> > > > + * @c_fb_dma    : dma address of C frame buffer (chroma)
> > > > + * @poc         : picture order count of frame buffer
> > > > + * @reserved    : for 8 bytes alignment
> > > > + */
> > > > +struct h264_fb {
> > > > +       uint64_t vdec_fb_va;
> > > > +       uint64_t y_fb_dma;
> > > > +       uint64_t c_fb_dma;
> > > > +       int32_t poc;
> > > > +       uint32_t reserved;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct vdec_h264_dec_info - decode information
> > > > + * @dpb_sz             : decoding picture buffer size
> > > > + * @resolution_changed  : resoltion change happen
> > > > + * @realloc_mv_buf     : flag to notify driver to re-allocate mv b=
uffer
> > > > + * @cap_num_planes     : number planes of capture buffer
> > > > + * @bs_dma             : Input bit-stream buffer dma address
> > > > + * @y_fb_dma           : Y frame buffer dma address
> > > > + * @c_fb_dma           : C frame buffer dma address
> > > > + * @vdec_fb_va         : VDEC frame buffer struct virtual address
> > > > + */
> > > > +struct vdec_h264_dec_info {
> > > > +       uint32_t dpb_sz;
> > > > +       uint32_t resolution_changed;
> > > > +       uint32_t realloc_mv_buf;
> > > > +       uint32_t cap_num_planes;
> > > > +       uint64_t bs_dma;
> > > > +       uint64_t y_fb_dma;
> > > > +       uint64_t c_fb_dma;
> > > > +       uint64_t vdec_fb_va;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct vdec_h264_vsi - shared memory for decode information exc=
hange
> > > > + *                        between VPU and Host.
> > > > + *                        The memory is allocated by VPU then mapp=
ing to
> > > > Host
> > > > + *                        in vpu_dec_init() and freed in vpu_dec_d=
einit()
> > > > + *                        by VPU.
> > > > + *                        AP-W/R : AP is writer/reader on this ite=
m
> > > > + *                        VPU-W/R: VPU is write/reader on this ite=
m
> > > > + * @pred_buf_dma : HW working predication buffer dma address (AP-W=
, VPU-
> > > > R)
> > > > + * @mv_buf_dma   : HW working motion vector buffer dma address (AP=
-W,
> > > > VPU-R)
> > > > + * @dec          : decode information (AP-R, VPU-W)
> > > > + * @pic          : picture information (AP-R, VPU-W)
> > > > + * @crop         : crop information (AP-R, VPU-W)
> > > > + */
> > > > +struct vdec_h264_vsi {
> > > > +       uint64_t pred_buf_dma;
> > > > +       uint64_t mv_buf_dma[H264_MAX_MV_NUM];
> > > > +       struct vdec_h264_dec_info dec;
> > > > +       struct vdec_pic_info pic;
> > > > +       struct v4l2_rect crop;
> > > > +       struct mtk_h264_dec_slice_param h264_slice_params;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct vdec_h264_slice_inst - h264 decoder instance
> > > > + * @num_nalu : how many nalus be decoded
> > > > + * @ctx      : point to mtk_vcodec_ctx
> > > > + * @pred_buf : HW working predication buffer
> > > > + * @mv_buf   : HW working motion vector buffer
> > > > + * @vpu      : VPU instance
> > > > + * @vsi_ctx  : Local VSI data for this decoding context
> > > > + */
> > > > +struct vdec_h264_slice_inst {
> > > > +       unsigned int num_nalu;
> > > > +       struct mtk_vcodec_ctx *ctx;
> > > > +       struct mtk_vcodec_mem pred_buf;
> > > > +       struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
> > > > +       struct vdec_vpu_inst vpu;
> > > > +       struct vdec_h264_vsi vsi_ctx;
> > > > +       struct mtk_h264_dec_slice_param h264_slice_param;
> > > > +
> > > > +       struct v4l2_h264_dpb_entry dpb[16];
> > > > +};
> > > > +
> > > > +static void *get_ctrl_ptr(struct mtk_vcodec_ctx *ctx,
> > > > +                                int id)
> > > > +{
> > > > +       struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl, i=
d);
> > > > +
> > > > +       return ctrl->p_cur.p;
> > > > +}
> > > > +
> > > > +static void get_h264_dpb_list(struct vdec_h264_slice_inst *inst,
> > > > +                             struct mtk_h264_dec_slice_param
> > > > *slice_param)
> > > > +{
> > > > +       struct vb2_queue *vq;
> > > > +       struct vb2_buffer *vb;
> > > > +       struct vb2_v4l2_buffer *vb2_v4l2;
> > > > +       u64 index;
> > > > +
> > > > +       vq =3D v4l2_m2m_get_vq(inst->ctx->m2m_ctx,
> > > > +               V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > > +
> > > > +       for (index =3D 0; index < 16; index++) {
> > >
> > > Ditto, some macro instead of 16.
> >
> > Changed this to use ARRAY_SIZE() which is appropriate here.
> >
> > >
> > > > +               const struct slice_h264_dpb_entry *dpb;
> > > > +               int vb2_index;
> > > > +
> > > > +               dpb =3D &slice_param->decode_params.dpb[index];
> > > > +               if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)=
) {
> > > > +                       slice_param->h264_dpb_info[index].reference=
_flag =3D
> > > > 0;
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               vb2_index =3D vb2_find_timestamp(vq, dpb->reference=
_ts, 0);
> > > > +               if (vb2_index < 0) {
> > > > +                       mtk_vcodec_err(inst, "Reference invalid:
> > > > dpb_index(%lld) reference_ts(%lld)",
> > > > +                               index, dpb->reference_ts);
> > > > +                       continue;
> > > > +               }
> > > > +               /* 1 for short term reference, 2 for long term refe=
rence
> > > > */
> > > > +               if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TE=
RM))
> > > > +                       slice_param->h264_dpb_info[index].reference=
_flag =3D
> > > > 1;
> > > > +               else
> > > > +                       slice_param->h264_dpb_info[index].reference=
_flag =3D
> > > > 2;
> > > > +
> > > > +               vb =3D vq->bufs[vb2_index];
> > > > +               vb2_v4l2 =3D container_of(vb, struct vb2_v4l2_buffe=
r,
> > > > vb2_buf);
> > > > +               slice_param->h264_dpb_info[index].field =3D vb2_v4l=
2->field;
> > > > +
> > > > +               slice_param->h264_dpb_info[index].y_dma_addr =3D
> > > > +                       vb2_dma_contig_plane_dma_addr(vb, 0);
> > > > +               if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_plan=
es =3D=3D
> > > > 2) {
> > > > +                       slice_param->h264_dpb_info[index].c_dma_add=
r =3D
> > > > +                               vb2_dma_contig_plane_dma_addr(vb, 1=
);
> > > > +               }
> > > > +       }
> > > > +}
> > > > +
> > > > +static void get_h264_sps_parameters(struct mtk_h264_sps_param *dst=
_param,
> > > > +       const struct v4l2_ctrl_h264_sps *src_param)
> > > > +{
> > > > +       GET_MTK_VDEC_PARAM(chroma_format_idc);
> > > > +       GET_MTK_VDEC_PARAM(bit_depth_luma_minus8);
> > > > +       GET_MTK_VDEC_PARAM(bit_depth_chroma_minus8);
> > > > +       GET_MTK_VDEC_PARAM(log2_max_frame_num_minus4);
> > > > +       GET_MTK_VDEC_PARAM(pic_order_cnt_type);
> > > > +       GET_MTK_VDEC_PARAM(log2_max_pic_order_cnt_lsb_minus4);
> > > > +       GET_MTK_VDEC_PARAM(max_num_ref_frames);
> > > > +       GET_MTK_VDEC_PARAM(pic_width_in_mbs_minus1);
> > > > +       GET_MTK_VDEC_PARAM(pic_height_in_map_units_minus1);
> > > > +
> > > > +       GET_MTK_VDEC_FLAG(separate_colour_plane_flag,
> > > > +               V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE);
> > > > +       GET_MTK_VDEC_FLAG(qpprime_y_zero_transform_bypass_flag,
> > > > +               V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS)=
;
> > > > +       GET_MTK_VDEC_FLAG(delta_pic_order_always_zero_flag,
> > > > +               V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> > > > +       GET_MTK_VDEC_FLAG(frame_mbs_only_flag,
> > > > +               V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
> > > > +       GET_MTK_VDEC_FLAG(mb_adaptive_frame_field_flag,
> > > > +               V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> > > > +       GET_MTK_VDEC_FLAG(direct_8x8_inference_flag,
> > > > +               V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
> > > > +}
> > > > +
> > > > +static void get_h264_pps_parameters(struct mtk_h264_pps_param *dst=
_param,
> > > > +       const struct v4l2_ctrl_h264_pps *src_param)
> > > > +{
> > > > +       GET_MTK_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
> > > > +       GET_MTK_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
> > > > +       GET_MTK_VDEC_PARAM(weighted_bipred_idc);
> > > > +       GET_MTK_VDEC_PARAM(pic_init_qp_minus26);
> > > > +       GET_MTK_VDEC_PARAM(chroma_qp_index_offset);
> > > > +       GET_MTK_VDEC_PARAM(second_chroma_qp_index_offset);
> > > > +
> > > > +       GET_MTK_VDEC_FLAG(entropy_coding_mode_flag,
> > > > +               V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
> > > > +       GET_MTK_VDEC_FLAG(pic_order_present_flag,
> > > > +
> > > > V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
> > > > +       GET_MTK_VDEC_FLAG(weighted_pred_flag,
> > > > +               V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
> > > > +       GET_MTK_VDEC_FLAG(deblocking_filter_control_present_flag,
> > > > +               V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESEN=
T);
> > > > +       GET_MTK_VDEC_FLAG(constrained_intra_pred_flag,
> > > > +               V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> > > > +       GET_MTK_VDEC_FLAG(redundant_pic_cnt_present_flag,
> > > > +               V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
> > > > +       GET_MTK_VDEC_FLAG(transform_8x8_mode_flag,
> > > > +               V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
> > > > +       GET_MTK_VDEC_FLAG(scaling_matrix_present_flag,
> > > > +               V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> > > > +}
> > > > +
> > > > +static void
> > > > +get_h264_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_=
matrix,
> > > > +                       const struct v4l2_ctrl_h264_scaling_matrix
> > > > *src_matrix)
> > > > +{
> > > > +       memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_li=
st_4x4,
> > > > +              sizeof(dst_matrix->scaling_list_4x4));
> > > > +
> > > > +       memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_li=
st_8x8,
> > > > +              sizeof(dst_matrix->scaling_list_8x8));
> > > > +}
> > > > +
> > > > +static void get_h264_decode_parameters(
> > > > +       struct slice_api_h264_decode_param *dst_params,
> > > > +       const struct v4l2_ctrl_h264_decode_params *src_params,
> > > > +       const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTR=
IES])
> > > > +{
> > > > +       int i;
> > > > +
> > > > +       for (i =3D 0; i < ARRAY_SIZE(dst_params->dpb); i++) {
> > > > +               struct slice_h264_dpb_entry *dst_entry =3D &dst_par=
ams-
> > > > >dpb[i];
> > > > +               const struct v4l2_h264_dpb_entry *src_entry =3D &dp=
b[i];
> > > > +
> > > > +               dst_entry->reference_ts =3D src_entry->reference_ts=
;
> > > > +               dst_entry->frame_num =3D src_entry->frame_num;
> > > > +               dst_entry->pic_num =3D src_entry->pic_num;
> > > > +               dst_entry->top_field_order_cnt =3D src_entry-
> > > > >top_field_order_cnt;
> > > > +               dst_entry->bottom_field_order_cnt =3D
> > > > +                       src_entry->bottom_field_order_cnt;
> > > > +               dst_entry->flags =3D src_entry->flags;
> > > > +       }
> > > > +
> > > > +       // num_slices is a leftover from the old H.264 support and =
is
> > > > ignored
> > > > +       // by the firmware.
> > > > +       dst_params->num_slices =3D 0;
> > > > +       dst_params->nal_ref_idc =3D src_params->nal_ref_idc;
> > > > +       dst_params->top_field_order_cnt =3D src_params->top_field_o=
rder_cnt;
> > > > +       dst_params->bottom_field_order_cnt =3D src_params-
> > > > >bottom_field_order_cnt;
> > > > +       dst_params->flags =3D src_params->flags;
> > > > +}
> > > > +
> > > > +static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
> > > > +                           const struct v4l2_h264_dpb_entry *b)
> > > > +{
> > > > +       return a->top_field_order_cnt =3D=3D b->top_field_order_cnt=
 &&
> > > > +              a->bottom_field_order_cnt =3D=3D b->bottom_field_ord=
er_cnt;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Move DPB entries of dec_param that refer to a frame already exi=
sting
> > > > in dpb
> > > > + * into the already existing slot in dpb, and move other entries i=
nto new
> > > > slots.
> > > > + *
> > > > + * This function is an adaptation of the similarly-named function =
in
> > > > + * hantro_h264.c.
> > > > + */
> > > > +static void update_dpb(const struct v4l2_ctrl_h264_decode_params
> > > > *dec_param,
> > > > +                      struct v4l2_h264_dpb_entry *dpb)
> > > > +{
> > > > +       DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) =3D { 0, };
> > > > +       DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) =3D { 0,=
 };
> > > > +       DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) =3D { 0, }=
;
> > > > +       unsigned int i, j;
> > > > +
> > > > +       /* Disable all entries by default, and mark the ones in use=
. */
> > > > +       for (i =3D 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
> > > > +               if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> > > > +                       set_bit(i, in_use);
> > > > +               dpb[i].flags &=3D ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
> > > > +       }
> > > > +
> > > > +       /* Try to match new DPB entries with existing ones by their=
 POCs.
> > > > */
> > > > +       for (i =3D 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
> > > > +               const struct v4l2_h264_dpb_entry *ndpb =3D &dec_par=
am-
> > > > >dpb[i];
> > > > +
> > > > +               if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE=
))
> > > > +                       continue;
> > > > +
> > > > +               /*
> > > > +                * To cut off some comparisons, iterate only on tar=
get DPB
> > > > +                * entries were already used.
> > > > +                */
> > > > +               for_each_set_bit(j, in_use, ARRAY_SIZE(dec_param->d=
pb)) {
> > > > +                       struct v4l2_h264_dpb_entry *cdpb;
> > > > +
> > > > +                       cdpb =3D &dpb[j];
> > > > +                       if (!dpb_entry_match(cdpb, ndpb))
> > > > +                               continue;
> > > > +
> > > > +                       *cdpb =3D *ndpb;
> > > > +                       set_bit(j, used);
> > > > +                       /* Don't reiterate on this one. */
> > > > +                       clear_bit(j, in_use);
> > > > +                       break;
> > > > +               }
> > > > +
> > > > +               if (j =3D=3D ARRAY_SIZE(dec_param->dpb))
> > > > +                       set_bit(i, new);
> > > > +       }
> > > > +
> > > > +       /* For entries that could not be matched, use remaining fre=
e
> > > > slots. */
> > > > +       for_each_set_bit(i, new, ARRAY_SIZE(dec_param->dpb)) {
> > > > +               const struct v4l2_h264_dpb_entry *ndpb =3D &dec_par=
am-
> > > > >dpb[i];
> > > > +               struct v4l2_h264_dpb_entry *cdpb;
> > > > +
> > > > +               /*
> > > > +                * Both arrays are of the same sizes, so there is n=
o way
> > > > +                * we can end up with no space in target array, unl=
ess
> > > > +                * something is buggy.
> > > > +                */
> > > > +               j =3D find_first_zero_bit(used, ARRAY_SIZE(dec_para=
m->dpb));
> > > > +               if (WARN_ON(j >=3D ARRAY_SIZE(dec_param->dpb)))
> > > > +                       return;
> > > > +
> > > > +               cdpb =3D &dpb[j];
> > > > +               *cdpb =3D *ndpb;
> > > > +               set_bit(j, used);
> > > > +       }
> > > > +}
> > > > +
> > > > +/*
> > > > + * The firmware expects unused reflist entries to have the value 0=
x20.
> > > > + */
> > > > +static void fixup_ref_list(u8 *ref_list, size_t num_valid)
> > > > +{
> > > > +       memset(&ref_list[num_valid], 0x20, 32 - num_valid);
> > > > +}
> > > > +
> > > > +static void get_vdec_decode_parameters(struct vdec_h264_slice_inst=
 *inst)
> > > > +{
> > > > +       const struct v4l2_ctrl_h264_decode_params *dec_params =3D
> > > > +               get_ctrl_ptr(inst->ctx,
> > > > V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> > > > +       const struct v4l2_ctrl_h264_sps *sps =3D
> > > > +               get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SPS=
);
> > > > +       const struct v4l2_ctrl_h264_pps *pps =3D
> > > > +               get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_PPS=
);
> > > > +       const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix =
=3D
> > > > +               get_ctrl_ptr(inst->ctx,
> > > > V4L2_CID_STATELESS_H264_SCALING_MATRIX);
> > > > +       struct mtk_h264_dec_slice_param *slice_param =3D &inst-
> > > > >h264_slice_param;
> > > > +       struct v4l2_h264_reflist_builder reflist_builder;
> > > > +       enum v4l2_field dpb_fields[V4L2_H264_NUM_DPB_ENTRIES];
> > > > +       u8 *p0_reflist =3D slice_param->decode_params.ref_pic_list_=
p0;
> > > > +       u8 *b0_reflist =3D slice_param->decode_params.ref_pic_list_=
b0;
> > > > +       u8 *b1_reflist =3D slice_param->decode_params.ref_pic_list_=
b1;
> > > > +       int i;
> > > > +
> > > > +       update_dpb(dec_params, inst->dpb);
> > > > +
> > > > +       get_h264_sps_parameters(&slice_param->sps, sps);
> > > > +       get_h264_pps_parameters(&slice_param->pps, pps);
> > > > +       get_h264_scaling_matrix(&slice_param->scaling_matrix,
> > > > scaling_matrix);
> > > > +       get_h264_decode_parameters(&slice_param->decode_params,
> > > > dec_params,
> > > > +                                  inst->dpb);
> > > > +       get_h264_dpb_list(inst, slice_param);
> > > > +
> > > > +       /* Prepare the fields for our reference lists */
> > > > +       for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++)
> > > > +               dpb_fields[i] =3D slice_param->h264_dpb_info[i].fie=
ld;
> > > > +       /* Build the reference lists */
> > > > +       v4l2_h264_init_reflist_builder(&reflist_builder, dec_params=
, sps,
> > > > +                                      inst->dpb);
> > > > +       v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
> > > > +       v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist,
> > > > b1_reflist);
> > > > +       /* Adapt the built lists to the firmware's expectations */
> > > > +       fixup_ref_list(p0_reflist, reflist_builder.num_valid);
> > > > +       fixup_ref_list(b0_reflist, reflist_builder.num_valid);
> > > > +       fixup_ref_list(b1_reflist, reflist_builder.num_valid);
> > > > +
> > > > +       memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
> > > > +              sizeof(inst->vsi_ctx.h264_slice_params));
> > > > +}
> > > > +
> > > > +static unsigned int get_mv_buf_size(unsigned int width, unsigned i=
nt
> > > > height)
> > > > +{
> > > > +       int unit_size =3D (width / MB_UNIT_LEN) * (height / MB_UNIT=
_LEN) +
> > > > 8;
> > > > +
> > > > +       return HW_MB_STORE_SZ * unit_size;
> > > > +}
> > > > +
> > > > +static int allocate_predication_buf(struct vdec_h264_slice_inst *i=
nst)
> > > > +{
> > > > +       int err =3D 0;
> > > > +
> > > > +       inst->pred_buf.size =3D BUF_PREDICTION_SZ;
> > > > +       err =3D mtk_vcodec_mem_alloc(inst->ctx, &inst->pred_buf);
> > > > +       if (err) {
> > > > +               mtk_vcodec_err(inst, "failed to allocate ppl buf");
> > > > +               return err;
> > > > +       }
> > > > +
> > > > +       inst->vsi_ctx.pred_buf_dma =3D inst->pred_buf.dma_addr;
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void free_predication_buf(struct vdec_h264_slice_inst *inst=
)
> > > > +{
> > > > +       struct mtk_vcodec_mem *mem =3D NULL;
> > > > +
> > > > +       mtk_vcodec_debug_enter(inst);
> > > > +
> > > > +       inst->vsi_ctx.pred_buf_dma =3D 0;
> > > > +       mem =3D &inst->pred_buf;
> > > > +       if (mem->va)
> > > > +               mtk_vcodec_mem_free(inst->ctx, mem);
> > > > +}
> > > > +
> > > > +static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
> > > > +       struct vdec_pic_info *pic)
> > > > +{
> > > > +       int i;
> > > > +       int err;
> > > > +       struct mtk_vcodec_mem *mem =3D NULL;
> > > > +       unsigned int buf_sz =3D get_mv_buf_size(pic->buf_w, pic->bu=
f_h);
> > > > +
> > > > +       mtk_v4l2_debug(3, "size =3D 0x%lx", buf_sz);
> > > > +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > > > +               mem =3D &inst->mv_buf[i];
> > > > +               if (mem->va)
> > > > +                       mtk_vcodec_mem_free(inst->ctx, mem);
> > > > +               mem->size =3D buf_sz;
> > > > +               err =3D mtk_vcodec_mem_alloc(inst->ctx, mem);
> > > > +               if (err) {
> > > > +                       mtk_vcodec_err(inst, "failed to allocate mv=
 buf");
> > > > +                       return err;
> > > > +               }
> > > > +               inst->vsi_ctx.mv_buf_dma[i] =3D mem->dma_addr;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void free_mv_buf(struct vdec_h264_slice_inst *inst)
> > > > +{
> > > > +       int i;
> > > > +       struct mtk_vcodec_mem *mem =3D NULL;
> > > > +
> > > > +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > > > +               inst->vsi_ctx.mv_buf_dma[i] =3D 0;
> > > > +               mem =3D &inst->mv_buf[i];
> > > > +               if (mem->va)
> > > > +                       mtk_vcodec_mem_free(inst->ctx, mem);
> > > > +       }
> > > > +}
> > > > +
> > > > +static void get_pic_info(struct vdec_h264_slice_inst *inst,
> > > > +                        struct vdec_pic_info *pic)
> > > > +{
> > > > +       struct mtk_vcodec_ctx *ctx =3D inst->ctx;
> > > > +
> > > > +       ctx->picinfo.buf_w =3D (ctx->picinfo.pic_w + 15) & 0xFFFFFF=
F0;
> > > > +       ctx->picinfo.buf_h =3D (ctx->picinfo.pic_h + 31) & 0xFFFFFF=
E0;
> > > > +       ctx->picinfo.fb_sz[0] =3D ctx->picinfo.buf_w * ctx->picinfo=
.buf_h;
> > > > +       ctx->picinfo.fb_sz[1] =3D ctx->picinfo.fb_sz[0] >> 1;
> > > > +       inst->vsi_ctx.dec.cap_num_planes =3D
> > > > +               ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
> > > > +
> > > > +       pic =3D &ctx->picinfo;
> > > > +       mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
> > > > +                        ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> > > > +                        ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> > > > +       mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0]=
,
> > > > +               ctx->picinfo.fb_sz[1]);
> > > > +
> > > > +       if ((ctx->last_decoded_picinfo.pic_w !=3D ctx->picinfo.pic_=
w) ||
> > > > +               (ctx->last_decoded_picinfo.pic_h !=3D ctx->picinfo.=
pic_h)) {
> > > > +               inst->vsi_ctx.dec.resolution_changed =3D true;
> > > > +               if ((ctx->last_decoded_picinfo.buf_w !=3D ctx-
> > > > >picinfo.buf_w) ||
> > > > +                       (ctx->last_decoded_picinfo.buf_h !=3D ctx-
> > > > >picinfo.buf_h))
> > > > +                       inst->vsi_ctx.dec.realloc_mv_buf =3D true;
> > > > +
> > > > +               mtk_v4l2_debug(1, "ResChg: (%d %d) : old(%d, %d) ->
> > > > new(%d, %d)",
> > > > +                       inst->vsi_ctx.dec.resolution_changed,
> > > > +                       inst->vsi_ctx.dec.realloc_mv_buf,
> > > > +                       ctx->last_decoded_picinfo.pic_w,
> > > > +                       ctx->last_decoded_picinfo.pic_h,
> > > > +                       ctx->picinfo.pic_w, ctx->picinfo.pic_h);
> > > > +       }
> > > > +}
> > > > +
> > > > +static void get_crop_info(struct vdec_h264_slice_inst *inst,
> > > > +       struct v4l2_rect *cr)
> > > > +{
> > > > +       cr->left =3D inst->vsi_ctx.crop.left;
> > > > +       cr->top =3D inst->vsi_ctx.crop.top;
> > > > +       cr->width =3D inst->vsi_ctx.crop.width;
> > > > +       cr->height =3D inst->vsi_ctx.crop.height;
> > > > +
> > > > +       mtk_vcodec_debug(inst, "l=3D%d, t=3D%d, w=3D%d, h=3D%d",
> > > > +                        cr->left, cr->top, cr->width, cr->height);
> > > > +}
> > > > +
> > > > +static void get_dpb_size(struct vdec_h264_slice_inst *inst,
> > > > +       unsigned int *dpb_sz)
> > > > +{
> > > > +       *dpb_sz =3D inst->vsi_ctx.dec.dpb_sz;
> > > > +       mtk_vcodec_debug(inst, "sz=3D%d", *dpb_sz);
> > > > +}
> > > > +
> > > > +static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
> > > > +{
> > > > +       struct vdec_h264_slice_inst *inst =3D NULL;
> > > > +       int err;
> > > > +
> > > > +       inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> > > > +       if (!inst)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       inst->ctx =3D ctx;
> > > > +
> > > > +       inst->vpu.id =3D SCP_IPI_VDEC_H264;
> > > > +       inst->vpu.ctx =3D ctx;
> > > > +
> > > > +       err =3D vpu_dec_init(&inst->vpu);
> > > > +       if (err) {
> > > > +               mtk_vcodec_err(inst, "vdec_h264 init err=3D%d", err=
);
> > > > +               goto error_free_inst;
> > > > +       }
> > > > +
> > > > +       memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx)=
);
> > > > +       inst->vsi_ctx.dec.resolution_changed =3D true;
> > > > +       inst->vsi_ctx.dec.realloc_mv_buf =3D true;
> > > > +
> > > > +       err =3D allocate_predication_buf(inst);
> > > > +       if (err)
> > > > +               goto error_deinit;
> > > > +
> > > > +       mtk_vcodec_debug(inst, "struct size =3D %d,%d,%d,%d\n",
> > > > +               sizeof(struct mtk_h264_sps_param),
> > > > +               sizeof(struct mtk_h264_pps_param),
> > > > +               sizeof(struct mtk_h264_dec_slice_param),
> > > > +               sizeof(struct mtk_h264_dpb_info));
> > > > +
> > > > +       mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
> > > > +
> > > > +       ctx->drv_handle =3D inst;
> > > > +       return 0;
> > > > +
> > > > +error_deinit:
> > > > +       vpu_dec_deinit(&inst->vpu);
> > > > +
> > > > +error_free_inst:
> > > > +       kfree(inst);
> > > > +       return err;
> > > > +}
> > > > +
> > > > +static void vdec_h264_slice_deinit(void *h_vdec)
> > > > +{
> > > > +       struct vdec_h264_slice_inst *inst =3D
> > > > +               (struct vdec_h264_slice_inst *)h_vdec;
> > > > +
> > > > +       mtk_vcodec_debug_enter(inst);
> > > > +
> > > > +       vpu_dec_deinit(&inst->vpu);
> > > > +       free_predication_buf(inst);
> > > > +       free_mv_buf(inst);
> > > > +
> > > > +       kfree(inst);
> > > > +}
> > > > +
> > > > +static int find_start_code(unsigned char *data, unsigned int data_=
sz)
> > > > +{
> > > > +       if (data_sz > 3 && data[0] =3D=3D 0 && data[1] =3D=3D 0 && =
data[2] =3D=3D 1)
> > > > +               return 3;
> > > > +
> > > > +       if (data_sz > 4 && data[0] =3D=3D 0 && data[1] =3D=3D 0 && =
data[2] =3D=3D 0 &&
> > > > +           data[3] =3D=3D 1)
> > > > +               return 4;
> > > > +
> > > > +       return -1;
> > > > +}
> > > > +
> > > > +static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_=
mem
> > > > *bs,
> > > > +                                 struct vdec_fb *fb, bool *res_chg=
)
> > > > +{
> > > > +       struct vdec_h264_slice_inst *inst =3D
> > > > +               (struct vdec_h264_slice_inst *)h_vdec;
> > > > +       struct vdec_vpu_inst *vpu =3D &inst->vpu;
> > > > +       struct mtk_video_dec_buf *src_buf_info;
> > > > +       int nal_start_idx =3D 0, err =3D 0;
> > > > +       uint32_t nal_type, data[2];
> > > > +       unsigned char *buf;
> > > > +       uint64_t y_fb_dma;
> > > > +       uint64_t c_fb_dma;
> > > > +
> > > > +       mtk_vcodec_debug(inst, "+ [%d] FB y_dma=3D%llx c_dma=3D%llx=
 va=3D%p",
> > > > +                        ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
> > > > +
> > > > +       /* bs NULL means flush decoder */
> > > > +       if (bs =3D=3D NULL)
> > > > +               return vpu_dec_reset(vpu);
> > > > +
> > > > +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf,
> > > > bs_buffer);
> > > > +
> > > > +       y_fb_dma =3D fb ? (u64)fb->base_y.dma_addr : 0;
> > > > +       c_fb_dma =3D fb ? (u64)fb->base_c.dma_addr : 0;
> > > > +
> > > > +       buf =3D (unsigned char *)bs->va;
> > >
> > > I can be completely wrong, but it would seem here
> > > is where the CPU mapping is used.
> >
> > I think you're right. :)
> >
> > >
> > > > +       nal_start_idx =3D find_start_code(buf, bs->size);
> > > > +       if (nal_start_idx < 0)
> > > > +               goto err_free_fb_out;
> > > > +
> > > > +       data[0] =3D bs->size;
> > > > +       data[1] =3D buf[nal_start_idx];
> > > > +       nal_type =3D NAL_TYPE(buf[nal_start_idx]);
> > >
> > > Which seems to be used to parse the NAL type. But shouldn't
> > > you expect here VLC NALUs only?
> > >
> > > I.e. you only get IDR or non-IDR frames, marked with
> > > V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC.
> >
> > Yep, that's true. And as a matter of fact I can remove `nal_type` (and
> > the test using it below) and the driver is just as happy.
> >
> > >
> > > > +       mtk_vcodec_debug(inst, "\n + NALU[%d] type %d +\n", inst-
> > > > >num_nalu,
> > > > +                        nal_type);
> > > > +
> > > > +       inst->vsi_ctx.dec.bs_dma =3D (uint64_t)bs->dma_addr;
> > > > +       inst->vsi_ctx.dec.y_fb_dma =3D y_fb_dma;
> > > > +       inst->vsi_ctx.dec.c_fb_dma =3D c_fb_dma;
> > > > +       inst->vsi_ctx.dec.vdec_fb_va =3D (u64)(uintptr_t)fb;
> > > > +
> > > > +       get_vdec_decode_parameters(inst);
> > > > +       *res_chg =3D inst->vsi_ctx.dec.resolution_changed;
> > > > +       if (*res_chg) {
> > > > +               mtk_vcodec_debug(inst, "- resolution changed -");
> > > > +               if (inst->vsi_ctx.dec.realloc_mv_buf) {
> > > > +                       err =3D alloc_mv_buf(inst, &(inst->ctx->pic=
info));
> > > > +                       inst->vsi_ctx.dec.realloc_mv_buf =3D false;
> > > > +                       if (err)
> > > > +                               goto err_free_fb_out;
> > > > +               }
> > > > +               *res_chg =3D false;
> > > > +       }
> > > > +
> > > > +       memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx)=
);
> > > > +       err =3D vpu_dec_start(vpu, data, 2);
> > >
> > > Then it seems this 2-bytes are passed to the firmware. Maybe you
> > > could test if that can be derived without the CPU mapping.
> > > That would allow you to set DMA_ATTR_NO_KERNEL_MAPPING.
> >
> > This one is a bit trickier. It seems the NAL type is passed as part of
> > the decode request to the firmware. Which should be absolutely not
> > needed since the firmware can check this from the buffer itself. Just
> > for fun I have tried setting this parameter unconditionally to 0x1
> > (non-IDR picture) and all I get is green frames with seemingly random
> > garbage. If I set it to 0x5 (IDR picture) I also get green frames with
> > a different kind of garbage, and once every while a properly rendered
> > frame (presumably when it is *really* an IDR frame).
>
> Can't you deduce this from the v4l2_ctrl_h264_slice_params.slice_type ?

This decoder is frame-based, so it doesn't receive a
v4l2_ctrl_h264_slice_params from user-space unfortunately. But
thankfully we can deduce this from the decode params.
