Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D6470AA94
	for <lists+linux-media@lfdr.de>; Sat, 20 May 2023 20:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjETS6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 May 2023 14:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjETS57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 May 2023 14:57:59 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4228DFD
        for <linux-media@vger.kernel.org>; Sat, 20 May 2023 11:57:55 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51f6461af24so3024558a12.2
        for <linux-media@vger.kernel.org>; Sat, 20 May 2023 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684609075; x=1687201075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrpTll+/MtlXyUgF3bRhfqGpnxE93eXDQ7Ko/cupjpY=;
        b=pUyBw0embAQ4Zs7tAhkY0xj78eHOmnRkj16Qi5+ZTB9Vy3ObnRovc+kKmH9V8z0it/
         bicmfHFYSsLxo160zybwib0Mb6HZrLD8p/eUQVBVT5p1xTNu+I9+iufXfrgNz0wrkPNQ
         uGmEZ3sXi/HjceY/XFTeyLsUfUzAvT9s52W225P3T95k6SgDB6W2SFrRR26sr3xqZ2iA
         YdvTM3utp+sqc4yuoKBtxt452b8uOKIje1ye8idqhs2gWTzrAVAvJFrzfaX1MTm+PdhT
         e6K4OL/EMsRX8TTmLaxrn9Z/hUJjpWpKNHYdo0mHTOZyrc1bLQgx3aRUGhIi8GjyQlQj
         4Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684609075; x=1687201075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrpTll+/MtlXyUgF3bRhfqGpnxE93eXDQ7Ko/cupjpY=;
        b=gvTiNq8E9M+CskOvTAEDq7DALwQOvy7nTO2SUDwX7Jq78QSoGyIURZYmtHPB+cLB37
         UdknRYzPvOw3wSINWbZ+vjm/uXFTSO6cZrYI2zqZpccRCnfUicusBM7jZ/wbr/aNYxeI
         VeX14qrpPB83lJvasqpP5WBZJLzN2ZRDoW1zCG4SRIma13Id4LGpPUkZB5pIVgWJdwTO
         SxAvG8E3f1gY2gxTAQkoqYANQSLzKkPsg87YtarpNoL75rliXCvKlESjHJJQIEtedLZh
         2ET6aBuKpL/c2aszHhiCknU6/U+YjASO7frX1sLy3i1DM7CiFtShDaCsMC+WqtgDY9qu
         iohg==
X-Gm-Message-State: AC+VfDx6ibiyGbMA+J4NduL1t08HrS4tSyCSUVap14i6sCl+d2cArwRB
        pHlY99AhdEtLtETWU7cgKCOBFheGEKT0c1A+j674ED+o
X-Google-Smtp-Source: ACHHUZ7tqIchEzpWavEuzUbE53s+Wb68jFlTeGS8tfuwpP8Oi1y/90Eak9sLvO1GfRmIcTV7baBDVlydrK/dvyFKm+4=
X-Received: by 2002:a17:90a:7187:b0:254:6953:f7b6 with SMTP id
 i7-20020a17090a718700b002546953f7b6mr3053550pjk.20.1684609073920; Sat, 20 May
 2023 11:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230309125651.23911-1-andrzej.p@collabora.com> <20230309125651.23911-3-andrzej.p@collabora.com>
In-Reply-To: <20230309125651.23911-3-andrzej.p@collabora.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 20 May 2023 13:57:42 -0500
Message-ID: <CAHCN7xKQv=Dx7cVSc_ekZ2GHzOVFuv6Yzum=kGQnCVfWxV0m5w@mail.gmail.com>
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 9, 2023 at 6:59=E2=80=AFAM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> A stateless VP8 encoder for rockchip vpu2 found e.g. in rk3399.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Is there a good place or resource where I could learn more about
what's needed to port the vpu1 VP8 encoder?  I'd really like to port
the Hantro H1 encoder that's used on the imx8mm, but it seems like the
vpu2 encoder has different registers than the H1 encoder on the Mini.
I was hoping my employer would send me to Prague for the conference at
the end of June, but unfortunately, that's not going to happen.  I'd
like to get more involved with projects like this as a personal side
project.

adam
> ---
>  drivers/media/platform/verisilicon/Makefile   |    2 +
>  drivers/media/platform/verisilicon/hantro.h   |   10 +
>  .../platform/verisilicon/hantro_boolenc.c     |   69 +
>  .../platform/verisilicon/hantro_boolenc.h     |   21 +
>  .../media/platform/verisilicon/hantro_drv.c   |   18 +-
>  .../media/platform/verisilicon/hantro_hw.h    |   90 +
>  .../media/platform/verisilicon/hantro_v4l2.c  |    5 +-
>  .../media/platform/verisilicon/hantro_vp8.c   |  118 ++
>  .../verisilicon/rockchip_vpu2_hw_vp8_enc.c    | 1574 +++++++++++++++++
>  .../platform/verisilicon/rockchip_vpu2_regs.h |    1 +
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   23 +-
>  11 files changed, 1925 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.h
>  create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu2_hw_v=
p8_enc.c
>
> diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/=
platform/verisilicon/Makefile
> index ebd5ede7bef7..a1cd18b8dfe7 100644
> --- a/drivers/media/platform/verisilicon/Makefile
> +++ b/drivers/media/platform/verisilicon/Makefile
> @@ -6,6 +6,7 @@ hantro-vpu-y +=3D \
>                 hantro_drv.o \
>                 hantro_v4l2.o \
>                 hantro_postproc.o \
> +               hantro_boolenc.o \
>                 hantro_h1_jpeg_enc.o \
>                 hantro_g1.o \
>                 hantro_g1_h264_dec.o \
> @@ -18,6 +19,7 @@ hantro-vpu-y +=3D \
>                 rockchip_vpu2_hw_h264_dec.o \
>                 rockchip_vpu2_hw_mpeg2_dec.o \
>                 rockchip_vpu2_hw_vp8_dec.o \
> +               rockchip_vpu2_hw_vp8_enc.o \
>                 hantro_jpeg.o \
>                 hantro_h264.o \
>                 hantro_hevc.o \
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 2989ebc631cc..512a235686b9 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -32,6 +32,7 @@ struct hantro_codec_ops;
>  struct hantro_postproc_ops;
>
>  #define HANTRO_JPEG_ENCODER    BIT(0)
> +#define HANTRO_VP8_ENCODER     BIT(1)
>  #define HANTRO_ENCODERS                0x0000ffff
>  #define HANTRO_MPEG2_DECODER   BIT(16)
>  #define HANTRO_VP8_DECODER     BIT(17)
> @@ -111,6 +112,7 @@ struct hantro_variant {
>   * @HANTRO_MODE_VP8_DEC: VP8 decoder.
>   * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
>   * @HANTRO_MODE_VP9_DEC: VP9 decoder.
> + * @HANTRO_MODE_VP8_ENC: VP8 encoder.
>   */
>  enum hantro_codec_mode {
>         HANTRO_MODE_NONE =3D -1,
> @@ -120,6 +122,7 @@ enum hantro_codec_mode {
>         HANTRO_MODE_VP8_DEC,
>         HANTRO_MODE_HEVC_DEC,
>         HANTRO_MODE_VP9_DEC,
> +       HANTRO_MODE_VP8_ENC,
>  };
>
>  /*
> @@ -265,6 +268,7 @@ struct hantro_ctx {
>                 struct hantro_vp8_dec_hw_ctx vp8_dec;
>                 struct hantro_hevc_dec_hw_ctx hevc_dec;
>                 struct hantro_vp9_dec_hw_ctx vp9_dec;
> +               struct hantro_vp8_enc_hw_ctx vp8_enc;
>         };
>  };
>
> @@ -361,6 +365,12 @@ extern int hantro_debug;
>  #define vpu_err(fmt, args...)                                  \
>         pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
>
> +static inline unsigned int hantro_rounded_luma_size(unsigned int w,
> +                                                   unsigned int h)
> +{
> +       return round_up(w, MB_DIM) * round_up(h, MB_DIM);
> +}
> +
>  /* Structure access helpers. */
>  static inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
>  {
> diff --git a/drivers/media/platform/verisilicon/hantro_boolenc.c b/driver=
s/media/platform/verisilicon/hantro_boolenc.c
> new file mode 100644
> index 000000000000..88a1c1c166fe
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_boolenc.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bug.h>
> +
> +#include "hantro_boolenc.h"
> +
> +void hantro_boolenc_init(struct hantro_boolenc *e, uint8_t *output)
> +{
> +       e->output =3D output;
> +       e->range =3D 255;
> +       e->bottom =3D 0;
> +       e->bit_count =3D 24;
> +       e->bytes_written =3D 0;
> +}
> +
> +/*
> + * Add one to a number stored in bytes preceding *q.
> + * There's exactly bytes_written such bytes.
> + *
> + * The spec guarantees that the backward search won't go beyond
> + * the start of the buffer, so if we detect such condition we can
> + * BUG_ON() - this should never happen anyway.
> + */
> +static void add_one_to_output(uint8_t *q, int bytes_written)
> +{
> +       /*
> +        * originally:
> +        * while (*--q =3D=3D 0xff)
> +        *       *q =3D 0;
> +        */
> +       for (;;) {
> +               BUG_ON(bytes_written-- <=3D 0); /* check if we're allowed=
 to go back one byte */
> +
> +               if (*--q =3D=3D 0xff)             /* adding a 1 overflows=
 *--q? */
> +                       *q =3D 0;               /* yes, so zero *q */
> +               else
> +                       break;                /* no, we're good to add 1 =
*/
> +       }
> +
> +       ++*q;                                 /* add 1 */
> +}
> +
> +void hantro_boolenc_write_bool(struct hantro_boolenc *e, uint32_t prob, =
bool bool_value)
> +{
> +       uint32_t split =3D 1 + (((e->range - 1) * prob) >> 8);
> +
> +       if (bool_value) {
> +               e->bottom +=3D split;
> +               e->range -=3D split;
> +       } else {
> +               e->range =3D split;
> +       }
> +
> +       while (e->range < 128) {
> +               e->range <<=3D 1;
> +
> +               if (e->bottom & (1 << 31))
> +                       add_one_to_output(e->output, e->bytes_written);
> +
> +               e->bottom <<=3D 1;
> +
> +               if (!--e->bit_count) {
> +                       *e->output++ =3D (uint8_t)(e->bottom >> 24);
> +                       ++e->bytes_written;
> +                       e->bottom &=3D (1 << 24) - 1;
> +                       e->bit_count =3D 8;
> +               }
> +       }
> +}
> diff --git a/drivers/media/platform/verisilicon/hantro_boolenc.h b/driver=
s/media/platform/verisilicon/hantro_boolenc.h
> new file mode 100644
> index 000000000000..80ec686d504d
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_boolenc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/types.h>
> +
> +struct hantro_boolenc {
> +       uint8_t *output;        /* next byte pointer */
> +       uint32_t range;
> +       uint32_t bottom;        /* 4 LSB of leftmost end of the range, MS=
B alread in output  */
> +       int bit_count;          /* how many shifts until next encoded byt=
e available */
> +       int bytes_written;
> +};
> +
> +void hantro_boolenc_init(struct hantro_boolenc *e, uint8_t *output);
> +
> +void hantro_boolenc_write_bool(struct hantro_boolenc *e, uint32_t prob, =
bool bool_value);
> +
> +static inline void hantro_boolenc_write_lit(struct hantro_boolenc *e, ui=
nt32_t val, uint8_t n)
> +{
> +       while (n--)
> +               hantro_boolenc_write_bool(e, 128, (val >> n) & 0x1);
> +}
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 8cb4a68c9119..a6bacf22cff5 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -160,7 +160,6 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>         src_buf =3D hantro_get_src_buf(ctx);
>         v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>                                    &ctx->ctrl_handler);
> -
>         /* Kick the watchdog. */
>         schedule_delayed_work(&ctx->dev->watchdog_work,
>                               msecs_to_jiffies(2000));
> @@ -215,8 +214,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
>          * for faster allocation. Also, no CPU access on the source queue=
,
>          * so no kernel mapping needed.
>          */
> -       src_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES |
> -                           DMA_ATTR_NO_KERNEL_MAPPING;
> +       src_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES;
>         src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
>         src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>         src_vq->lock =3D &ctx->dev->vpu_mutex;
> @@ -352,6 +350,20 @@ static const struct hantro_ctrl controls[] =3D {
>                         .def =3D 50,
>                         .ops =3D &hantro_jpeg_ctrl_ops,
>                 },
> +       }, {
> +               .codec =3D HANTRO_VP8_ENCODER,
> +               .cfg =3D {
> +                       .id =3D V4L2_CID_STATELESS_VP8_ENCODE_PARAMS,
> +               },
> +       }, {
> +               .codec =3D HANTRO_VP8_ENCODER,
> +               .cfg =3D {
> +                       .id =3D V4L2_CID_STATELESS_VP8_ENCODE_QP,
> +                       .min =3D 0,
> +                       .max =3D 127,
> +                       .step =3D 1,
> +                       .def =3D 0,
> +               },
>         }, {
>                 .codec =3D HANTRO_JPEG_ENCODER,
>                 .cfg =3D {
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/med=
ia/platform/verisilicon/hantro_hw.h
> index e83f0c523a30..c35cac7f88a9 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -15,6 +15,8 @@
>  #include <media/v4l2-vp9.h>
>  #include <media/videobuf2-core.h>
>
> +#include "hantro_boolenc.h"
> +
>  #define DEC_8190_ALIGN_MASK    0x07U
>
>  #define MB_DIM                 16
> @@ -171,6 +173,67 @@ struct hantro_vp8_dec_hw_ctx {
>         struct hantro_aux_buf prob_tbl;
>  };
>
> +struct hantro_vp8_entropy {
> +       /* TODO: int32_t? */
> +       int32_t coeff_prob[4][8][3][11];
> +       int32_t coeff_prob_old[4][8][3][11];
> +       int32_t mv_prob[2][19];
> +       int32_t mv_prob_old[2][19];
> +       int32_t y_mode_prob[4];
> +       int32_t uv_mode_prob[3];
> +};
> +
> +#define VP8_BIT_LAST   0
> +#define VP8_BIT_GOLDEN 1
> +#define VP8_BIT_ALT    2
> +
> +struct hantro_vp8_enc_hw_ctx {
> +       struct hantro_aux_buf ref_frames[4];    /* recreated and referenc=
e images */
> +       struct hantro_aux_buf priv_src; /* cabac table, segment map */
> +       struct hantro_aux_buf mv_buf;   /* motion vector */
> +       struct hantro_aux_buf priv_dst; /* prob count */
> +       struct hantro_aux_buf ctrl_buf; /* size table */
> +       struct hantro_boolenc boolenc;
> +       struct hantro_vp8_entropy entropy;
> +       size_t header_size;
> +       size_t estimated_hdr_size;
> +       size_t frame_counter;
> +       int last_ref;
> +       int golden_ref;
> +       int alt_ref;
> +       int first_free;
> +       int reconstructed;
> +       char ref_bitmaps[4];
> +
> +       int32_t mode_delta[4];
> +       int32_t old_mode_delta[4];
> +       int32_t ref_delta[4];
> +       int32_t old_ref_delta[4];
> +
> +       struct {
> +               uint8_t tag[3];
> +
> +               /* the following three only used for inter frames */
> +               uint8_t magic[3];       /* 0x9d012a */
> +               uint8_t width[2];       /* (scale << 14) | width */
> +               uint8_t height[2];      /* (scale << 14) | height */
> +       } __packed *frame_tag;
> +
> +       u8 is_intra:1;
> +       u8 last_intra:1;
> +       u8 show_frame:1;
> +       u8 refresh_golden_frame:1;
> +       u8 refresh_alternate_frame:1;
> +       u8 refresh_entropy_probs:1;
> +
> +       u8 prob_skip_false;
> +       u8 prob_intra;
> +       u8 prob_last;
> +       u8 prob_gf;
> +       u8 copy_buffer_to_golden;
> +       u8 copy_buffer_to_alternate;
> +};
> +
>  /**
>   * struct hantro_vp9_frame_info
>   *
> @@ -417,6 +480,28 @@ hantro_hevc_mv_size(unsigned int width, unsigned int=
 height)
>         return width * height / 16;
>  }
>
> +static inline void hantro_vp8_set_bit(struct hantro_vp8_enc_hw_ctx *vp8_=
enc, char bit, int idx)
> +{
> +       if (idx < 0)
> +               return;
> +
> +       if (bit !=3D VP8_BIT_LAST && bit !=3D VP8_BIT_GOLDEN && bit !=3D =
VP8_BIT_ALT)
> +               return;
> +
> +       vp8_enc->ref_bitmaps[idx] |=3D (1 << bit);
> +}
> +
> +static inline void hantro_vp8_clr_bit(struct hantro_vp8_enc_hw_ctx *vp8_=
enc, char bit, int idx)
> +{
> +       if (idx < 0)
> +               return;
> +
> +       if (bit !=3D VP8_BIT_LAST && bit !=3D VP8_BIT_GOLDEN && bit !=3D =
VP8_BIT_ALT)
> +               return;
> +
> +       vp8_enc->ref_bitmaps[idx] &=3D ~(1 << bit);
> +}
> +
>  int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
>  int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
>  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> @@ -438,4 +523,9 @@ void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
>  void hantro_g2_check_idle(struct hantro_dev *vpu);
>  irqreturn_t hantro_g2_irq(int irq, void *dev_id);
>
> +int rockchip_vpu2_vp8_enc_run(struct hantro_ctx *ctx);
> +int hantro_vp8_enc_init(struct hantro_ctx *ctx);
> +void rockchip_vpu2_vp8_enc_done(struct hantro_ctx *ctx);
> +void hantro_vp8_enc_exit(struct hantro_ctx *ctx);
> +
>  #endif /* HANTRO_HW_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 2c7a805289e7..7503d6b76fc9 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -312,8 +312,9 @@ static int hantro_try_fmt(const struct hantro_ctx *ct=
x,
>
>         pix_mp->field =3D V4L2_FIELD_NONE;
>
> -       v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> -                                      &vpu_fmt->frmsize);
> +       if (!capture || !ctx->is_encoder)
> +               v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->h=
eight,
> +                                              &vpu_fmt->frmsize);
>
>         if (!coded) {
>                 /* Fill remaining fields */
> diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/me=
dia/platform/verisilicon/hantro_vp8.c
> index 381bc1d3bfda..63e026055615 100644
> --- a/drivers/media/platform/verisilicon/hantro_vp8.c
> +++ b/drivers/media/platform/verisilicon/hantro_vp8.c
> @@ -199,3 +199,121 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
>         dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
>                           vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
>  }
> +
> +int hantro_vp8_enc_init(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu =3D ctx->dev;
> +       struct hantro_aux_buf *aux_buf;
> +       unsigned int mb_width, mb_height;
> +       size_t luma_size, segment_map_size;
> +       static int32_t mode_delta[4] =3D { 4, -2, 2, 4 };
> +       static int32_t ref_delta[4] =3D { 2, 0, -2, -2 };
> +       int ret, i;
> +
> +       memcpy(ctx->vp8_enc.mode_delta, mode_delta, sizeof(mode_delta));
> +       memcpy(ctx->vp8_enc.ref_delta, ref_delta, sizeof(ref_delta));
> +
> +       mb_width =3D DIV_ROUND_UP(ctx->src_fmt.width, 16);
> +       mb_height =3D DIV_ROUND_UP(ctx->src_fmt.height, 16);
> +       luma_size =3D mb_width * mb_height * 16 * 16;
> +       segment_map_size =3D round_up(DIV_ROUND_UP(mb_width * mb_height, =
4), 64);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(ctx->vp8_enc.ref_frames); ++i) {
> +               aux_buf =3D &ctx->vp8_enc.ref_frames[i];
> +               aux_buf->size =3D luma_size * 3 / 2;
> +               aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->si=
ze,
> +                                                 &aux_buf->dma, GFP_KERN=
EL);
> +               if (!aux_buf->cpu) {
> +                       ret =3D -ENOMEM;
> +                       goto err_free_ref_frames;
> +               }
> +               ctx->vp8_enc.ref_bitmaps[i] =3D 0;
> +       }
> +       ctx->vp8_enc.last_ref =3D ctx->vp8_enc.golden_ref =3D ctx->vp8_en=
c.alt_ref =3D -1;
> +       ctx->vp8_enc.first_free =3D 0;
> +
> +       aux_buf =3D &ctx->vp8_enc.priv_src;
> +       aux_buf->size =3D 1208 + segment_map_size + PAGE_SIZE; /* TODO: e=
liminate one page overhead */
> +       aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size, &aux=
_buf->dma, GFP_KERNEL);
> +       if (!aux_buf->cpu) {
> +               ret =3D -ENOMEM;
> +               goto err_free_ref_frames;
> +       }
> +
> +       aux_buf =3D &ctx->vp8_enc.mv_buf;
> +       aux_buf->size =3D mb_width * mb_height * 4;
> +       aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size, &aux=
_buf->dma, GFP_KERNEL);
> +       if (!aux_buf->cpu) {
> +               ret =3D -ENOMEM;
> +               goto err_free_priv_src;
> +       }
> +
> +       aux_buf =3D &ctx->vp8_enc.priv_dst;
> +       aux_buf->size =3D PAGE_SIZE; /* TODO: use correct size */
> +       aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size, &aux=
_buf->dma, GFP_KERNEL);
> +       if (!aux_buf->cpu) {
> +               ret =3D -ENOMEM;
> +               goto err_free_mv_buf;
> +       }
> +
> +       aux_buf =3D &ctx->vp8_enc.ctrl_buf;
> +       aux_buf->size =3D PAGE_SIZE; /* TODO: use correct size */
> +       aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size, &aux=
_buf->dma, GFP_KERNEL);
> +       if (!aux_buf->cpu) {
> +               ret =3D -ENOMEM;
> +               goto err_free_priv_dst;
> +       }
> +
> +       return 0;
> +
> +err_free_priv_dst:
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.priv_dst.size,
> +                         ctx->vp8_enc.priv_dst.cpu,
> +                         ctx->vp8_enc.priv_dst.dma);
> +
> +err_free_mv_buf:
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.mv_buf.size,
> +                         ctx->vp8_enc.mv_buf.cpu,
> +                         ctx->vp8_enc.mv_buf.dma);
> +
> +err_free_priv_src:
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.priv_src.size,
> +                         ctx->vp8_enc.priv_src.cpu,
> +                         ctx->vp8_enc.priv_src.dma);
> +
> +err_free_ref_frames:
> +       while (--i >=3D 0)
> +               dma_free_coherent(vpu->dev, ctx->vp8_enc.ref_frames[i].si=
ze,
> +                                 ctx->vp8_enc.ref_frames[i].cpu,
> +                                 ctx->vp8_enc.ref_frames[i].dma);
> +
> +       return ret;
> +}
> +
> +void hantro_vp8_enc_exit(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu =3D ctx->dev;
> +       int i;
> +
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.ctrl_buf.size,
> +                         ctx->vp8_enc.ctrl_buf.cpu,
> +                         ctx->vp8_enc.ctrl_buf.dma);
> +
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.priv_dst.size,
> +                         ctx->vp8_enc.priv_dst.cpu,
> +                         ctx->vp8_enc.priv_dst.dma);
> +
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.mv_buf.size,
> +                         ctx->vp8_enc.mv_buf.cpu,
> +                         ctx->vp8_enc.mv_buf.dma);
> +
> +       dma_free_coherent(vpu->dev, ctx->vp8_enc.priv_src.size,
> +                         ctx->vp8_enc.priv_src.cpu,
> +                         ctx->vp8_enc.priv_src.dma);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(ctx->vp8_enc.ref_frames); ++i)
> +               dma_free_coherent(vpu->dev, ctx->vp8_enc.ref_frames[i].si=
ze,
> +                                 ctx->vp8_enc.ref_frames[i].cpu,
> +                                 ctx->vp8_enc.ref_frames[i].dma);
> +
> +}
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.=
c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.c
> new file mode 100644
> index 000000000000..08e198606509
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.c
> @@ -0,0 +1,1574 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Collabora Ltd.
> + *     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> + *
> + * This work is derived from:
> + *
> + * https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ref=
s/heads/chromeos-5.10/
> + * drivers/staging/media/hantro/rk3399_vpu_hw_vp8_enc.c
> + *
> + * which is:
> + *
> + * Rockchip VPU codec driver
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *     Alpha Lin <Alpha.Lin@rock-chips.com>
> + *
> + * Substantial portions are based on MIT-licensed code
> + *
> + * https://github.com/rockchip-linux/mpp/blob/develop/mpp/hal/vpu/vp8e/h=
al_vp8e_entropy.{c|h}
> + * https://github.com/rockchip-linux/mpp/blob/develop/mpp/hal/vpu/vp8e/h=
al_vp8e_table.{c|h}
> + *
> + * which is:
> + *
> + * Copyright (c) 2017 Rockchip Electronics Co., Ltd.
> + *
> + */
> +#include <linux/minmax.h>
> +
> +#include "hantro.h"
> +#include "hantro_hw.h"
> +#include "rockchip_vpu2_regs.h"
> +
> +/* threshold of MBs count to disable quarter pixel mv for encode speed *=
/
> +#define MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_MV       3600
> +
> +/* threshold of MBs count to disable multi mv in one macro block */
> +#define MAX_MB_COUNT_TO_DISABLE_SPLIT_MV               1584
> +
> +#define QINDEX_RANGE 128
> +#define VP8_PROB_COUNT_MV_OFFSET 222
> +
> +#define MODE_DELTA_BPRED       0
> +#define MODE_DELTA_ZEROMV      1
> +#define MODE_DELTA_NEWMV       2
> +#define MODE_DELTA_SPLITMV     3
> +
> +#define REF_DELTA_INTRA_MB     0
> +#define REF_DELTA_LAST_REF     1
> +#define REF_DELTA_GOLDEN       2
> +#define REF_DELTA_ALT_REF      3
> +
> +/* experimentally fitted, 24.893*exp(0.02545*qp) */
> +static const s32 split_penalty[QINDEX_RANGE] =3D {
> +       24, 25, 26, 26, 27, 28, 29, 29,
> +       30, 31, 32, 32, 33, 34, 35, 36,
> +       37, 38, 39, 40, 41, 42, 43, 44,
> +       45, 47, 48, 49, 50, 52, 53, 54,
> +       56, 57, 59, 60, 62, 63, 65, 67,
> +       68, 70, 72, 74, 76, 78, 80, 82,
> +       84, 86, 88, 91, 93, 95, 98, 100,
> +       103, 106, 108, 111, 114, 117, 120, 123,
> +       126, 130, 133, 136, 140, 144, 147, 151,
> +       155, 159, 163, 167, 172, 176, 181, 185,
> +       190, 195, 200, 205, 211, 216, 222, 227,
> +       233, 239, 245, 252, 258, 265, 272, 279,
> +       286, 293, 301, 309, 317, 325, 333, 342,
> +       351, 360, 369, 379, 388, 398, 409, 419,
> +       430, 441, 453, 464, 476, 488, 501, 514,
> +       527, 541, 555, 569, 584, 599, 614, 630
> +};
> +
> +static const int dc_q_lookup[QINDEX_RANGE] =3D {
> +       4,   5,   6,   7,   8,   9,   10,  10,  11,  12,
> +       13,  14,  15,  16,  17,  17,  18,  19,  20,  20,
> +       21,  21,  22,  22,  23,  23,  24,  25,  25,  26,
> +       27,  28,  29,  30,  31,  32,  33,  34,  35,  36,
> +       37,  37,  38,  39,  40,  41,  42,  43,  44,  45,
> +       46,  46,  47,  48,  49,  50,  51,  52,  53,  54,
> +       55,  56,  57,  58,  59,  60,  61,  62,  63,  64,
> +       65,  66,  67,  68,  69,  70,  71,  72,  73,  74,
> +       75,  76,  76,  77,  78,  79,  80,  81,  82,  83,
> +       84,  85,  86,  87,  88,  89,  91,  93,  95,  96,
> +       98,  100, 101, 102, 104, 106, 108, 110, 112, 114,
> +       116, 118, 122, 124, 126, 128, 130, 132, 134, 136,
> +       138, 140, 143, 145, 148, 151, 154, 157
> +};
> +
> +static const int ac_q_lookup[QINDEX_RANGE] =3D {
> +       4,   5,   6,   7,   8,   9,   10,  11,  12,  13,
> +       14,  15,  16,  17,  18,  19,  20,  21,  22,  23,
> +       24,  25,  26,  27,  28,  29,  30,  31,  32,  33,
> +       34,  35,  36,  37,  38,  39,  40,  41,  42,  43,
> +       44,  45,  46,  47,  48,  49,  50,  51,  52,  53,
> +       54,  55,  56,  57,  58,  60,  62,  64,  66,  68,
> +       70,  72,  74,  76,  78,  80,  82,  84,  86,  88,
> +       90,  92,  94,  96,  98,  100, 102, 104, 106, 108,
> +       110, 112, 114, 116, 119, 122, 125, 128, 131, 134,
> +       137, 140, 143, 146, 149, 152, 155, 158, 161, 164,
> +       167, 170, 173, 177, 181, 185, 189, 193, 197, 201,
> +       205, 209, 213, 217, 221, 225, 229, 234, 239, 245,
> +       249, 254, 259, 264, 269, 274, 279, 284
> +};
> +
> +static const s32 qrounding_factors[QINDEX_RANGE] =3D {
> +       56, 56, 56, 56, 56, 56, 56, 56, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
> +       48, 48, 48, 48, 48, 48, 48, 48
> +};
> +
> +static const s32 qzbin_factors[QINDEX_RANGE] =3D {
> +       64, 64, 64, 64, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
> +       80, 80, 80, 80, 80, 80, 80, 80
> +};
> +
> +/* Intra 16x16 mode tree penalty values */
> +static s32 intra_16_tree_penalty[] =3D {
> +       305, 841, 914, 1082
> +};
> +
> +/* Intra 4x4 mode tree penalty values */
> +static s32 intra_4_tree_penalty[] =3D {
> +       280, 622, 832, 1177, 1240, 1341, 1085, 1259, 1357, 1495
> +};
> +
> +
> +int32_t const offset_tbl[] =3D {
> +       -1, -1, -1,  0,  1,  2, -1,  3,  4, -1,  5,  6, -1,  7,  8, -1,
> +       9, 10, -1, 11, 12, 13, 14, 15, -1, 16, 17, -1, 18, 19, -1, 20,
> +       21, -1, 22, 23, -1, 24, 25, -1, 26, 27, 28, 29, 30, -1, 31, 32,
> +       -1, 33, 34, -1, 35, 36, -1, 37, 38, -1, 39, 40, -1, 41, 42, 43,
> +       44, 45, -1, 46, 47, -1, 48, 49, -1, 50, 51, -1, 52, 53, -1, 54,
> +       55, -1, 56, 57, -1, -1, -1, 58, 59, 60, 61, 62, 63, 64, 65, 66,
> +       67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82,
> +       83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98,
> +       99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 1=
12, 113, 114,
> +       115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, =
128, 129, 130,
> +       131, 132, 133, 134, 135, 136, 137, 138, -1, -1, -1, 139, 140, 141=
, 142, 143,
> +       144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, =
157, 158, 159,
> +       160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, =
173, 174, 175,
> +       176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, =
189, 190, 191,
> +       192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, =
205, 206, 207,
> +       208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219
> +};
> +
> +/* ~round((2*(2+exp((x+22)/39)) + (2+exp((x+15)/32)))/3) */
> +static s32 weight[QINDEX_RANGE] =3D {
> +       4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
> +       4,  4,  4,  4,  4,  5,  5,  5,  5,  5,
> +       5,  5,  5,  5,  5,  5,  5,  6,  6,  6,
> +       6,  6,  6,  6,  6,  6,  6,  7,  7,  7,
> +       7,  7,  7,  7,  7,  8,  8,  8,  8,  8,
> +       8,  8,  9,  9,  9,  9,  9, 10, 10, 10,
> +       10, 11, 11, 11, 12, 12, 13, 13, 13, 13,
> +       14, 14, 14, 14, 15, 15, 15, 16, 16, 17,
> +       17, 18, 18, 19, 19, 20, 20, 20, 21, 22,
> +       23, 23, 24, 24, 25, 25, 26, 27, 28, 28,
> +       29, 30, 31, 32, 32, 33, 34, 35, 36, 37,
> +       38, 39, 40, 41, 42, 44, 44, 46, 47, 48,
> +       50, 51, 52, 54, 55, 57, 58, 61
> +};
> +
> +struct tree {
> +       s32 value;       /* Bits describe the bool tree  */
> +       s32 number;      /* Number, valid bit count in above tree */
> +       s32 index[9];    /* Probability table index */
> +};
> +
> +/* Motion vector tree */
> +static struct tree mv_tree[] =3D {
> +       { 0, 3, { 0, 1, 2 } },        /* mv_0 000 */
> +       { 1, 3, { 0, 1, 2 } },        /* mv_1 001 */
> +       { 2, 3, { 0, 1, 3 } },        /* mv_2 010 */
> +       { 3, 3, { 0, 1, 3 } },        /* mv_3 011 */
> +       { 4, 3, { 0, 4, 5 } },        /* mv_4 100 */
> +       { 5, 3, { 0, 4, 5 } },        /* mv_5 101 */
> +       { 6, 3, { 0, 4, 6 } },        /* mv_6 110 */
> +       { 7, 3, { 0, 4, 6 } },        /* mv_7 111 */
> +};
> +
> +/* If probability being zero is p, then average number of bits used to e=
ncode 0
> + * is log2(1/p), to encode 1 is log2(1/(1-p)).
> + *
> + * For example, if the probability of being zero is 0.5
> + * bin =3D 0 -> average bits used is log2(1/0.5)      =3D 1 bits/bin
> + * bin =3D 1 -> average bits used is log2(1/(1 - 0.5) =3D 1 bits/bin
> + *
> + * For example, if the probability of being zero is 0.95
> + * bin =3D 0 -> average bits used is log2(1/0.95)      =3D 0.074 bits/bi=
n
> + * bin =3D 1 -> average bits used is log2(1/(1 - 0.95) =3D 4.321 bits/bi=
n
> + *
> + * The cost[p] is average number of bits used to encode 0 if the probabi=
lity is
> + * p / 256, scaled by a magic number 256,
> + * i.e., cost[p] =3D round(log2(256 / p) * 256).
> + */
> +static const s32 vp8_prob_cost[] =3D {
> +       2048, 2048, 1792, 1642, 1536, 1454, 1386, 1329, 1280, 1236,
> +       1198, 1162, 1130, 1101, 1073, 1048, 1024, 1002,  980,  961,
> +       942,  924,  906,  890,  874,  859,  845,  831,  817,  804,
> +       792,  780,  768,  757,  746,  735,  724,  714,  705,  695,
> +       686,  676,  668,  659,  650,  642,  634,  626,  618,  611,
> +       603,  596,  589,  582,  575,  568,  561,  555,  548,  542,
> +       536,  530,  524,  518,  512,  506,  501,  495,  490,  484,
> +       479,  474,  468,  463,  458,  453,  449,  444,  439,  434,
> +       430,  425,  420,  416,  412,  407,  403,  399,  394,  390,
> +       386,  382,  378,  374,  370,  366,  362,  358,  355,  351,
> +       347,  343,  340,  336,  333,  329,  326,  322,  319,  315,
> +       312,  309,  305,  302,  299,  296,  292,  289,  286,  283,
> +       280,  277,  274,  271,  268,  265,  262,  259,  256,  253,
> +       250,  247,  245,  242,  239,  236,  234,  231,  228,  226,
> +       223,  220,  218,  215,  212,  210,  207,  205,  202,  200,
> +       197,  195,  193,  190,  188,  185,  183,  181,  178,  176,
> +       174,  171,  169,  167,  164,  162,  160,  158,  156,  153,
> +       151,  149,  147,  145,  143,  140,  138,  136,  134,  132,
> +       130,  128,  126,  124,  122,  120,  118,  116,  114,  112,
> +       110,  108,  106,  104,  102,  101,   99,   97,   95,   93,
> +       91,   89,   87,   86,   84,   82,   80,   78,   77,   75,
> +       73,   71,   70,   68,   66,   64,   63,   61,   59,   58,
> +       56,   54,   53,   51,   49,   48,   46,   44,   43,   41,
> +       40,   38,   36,   35,   33,   32,   30,   28,   27,   25,
> +       24,   22,   21,   19,   18,   16,   15,   13,   12,   10,
> +       9,    7,    6,    4,    3,    1
> +};
> +
> +/* Approximate bit cost of bin at given probability prob */
> +#define COST_BOOL(prob, bin)   vp8_prob_cost[(bin) ? 255 - (prob) : (pro=
b)]
> +
> +uint32_t const coeff_update_prob[4][8][3][11] =3D {
> +       {
> +               {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {176, 246, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {223, 241, 252, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {249, 253, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 244, 252, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {234, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {253, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 246, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {239, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 248, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {251, 255, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {251, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 253, 255, 254, 255, 255, 255, 255, 255=
, 255},
> +                       {250, 255, 254, 255, 254, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               },
> +       }, {
> +               {
> +                       {217, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {225, 252, 241, 253, 255, 255, 254, 255, 255, 255=
, 255},
> +                       {234, 250, 241, 250, 253, 255, 253, 254, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {223, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {238, 253, 254, 254, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 248, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {249, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 253, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {247, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {252, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {253, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {250, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               },
> +       }, {
> +               {
> +                       {186, 251, 250, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {234, 251, 244, 254, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {251, 251, 243, 253, 254, 255, 254, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {236, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {251, 253, 253, 254, 254, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 254, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               },
> +       }, {
> +               {
> +                       {248, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {250, 254, 252, 254, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {248, 254, 249, 253, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 253, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {246, 253, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {252, 254, 251, 254, 254, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 254, 252, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {248, 254, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {253, 255, 254, 254, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 251, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {245, 251, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {253, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 251, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {252, 253, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 254, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 252, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {249, 255, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 254, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 253, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {250, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               }, {
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {254, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +                       {255, 255, 255, 255, 255, 255, 255, 255, 255, 255=
, 255},
> +               },
> +       },
> +};
> +
> +uint32_t const mv_update_prob[2][19] =3D {
> +       {
> +               237, 246, 253, 253, 254, 254, 254, 254, 254, 254,
> +               254, 254, 254, 254, 250, 250, 252, 254, 254
> +       }, {
> +               231, 243, 245, 253, 254, 254, 254, 254, 254, 254,
> +               254, 254, 254, 254, 251, 251, 254, 254, 254
> +       }
> +};
> +
> +uint8_t const default_prob_skip_false[128] =3D {
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       255, 255, 255, 255, 255, 255, 255, 255,
> +       251, 248, 244, 240, 236, 232, 229, 225,
> +       221, 217, 213, 208, 204, 199, 194, 190,
> +       187, 183, 179, 175, 172, 168, 164, 160,
> +       157, 153, 149, 145, 142, 138, 134, 130,
> +       127, 124, 120, 117, 114, 110, 107, 104,
> +       101, 98,  95,  92,  89,  86,  83, 80,
> +       77,  74,  71,  68,  65,  62,  59, 56,
> +       53,  50,  47,  44,  41,  38,  35, 32,
> +       30,  28,  26,  24,  22,  20,  18, 16,
> +};
> +
> +int32_t const y_mode_prob[4] =3D {
> +       112, 86, 140, 37
> +};
> +
> +int32_t const uv_mode_prob[3] =3D {
> +       162, 101, 204
> +};
> +
> +uint32_t const default_prob_coeff[4][8][3][11] =3D {
> +       {
> +               {
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {253, 136, 254, 255, 228, 219, 128, 128, 128, 128=
, 128},
> +                       {189, 129, 242, 255, 227, 213, 255, 219, 128, 128=
, 128},
> +                       {106, 126, 227, 252, 214, 209, 255, 255, 128, 128=
, 128},
> +               }, {
> +                       {  1,  98, 248, 255, 236, 226, 255, 255, 128, 128=
, 128},
> +                       {181, 133, 238, 254, 221, 234, 255, 154, 128, 128=
, 128},
> +                       { 78, 134, 202, 247, 198, 180, 255, 219, 128, 128=
, 128},
> +               }, {
> +                       {  1, 185, 249, 255, 243, 255, 128, 128, 128, 128=
, 128},
> +                       {184, 150, 247, 255, 236, 224, 128, 128, 128, 128=
, 128},
> +                       { 77, 110, 216, 255, 236, 230, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1, 101, 251, 255, 241, 255, 128, 128, 128, 128=
, 128},
> +                       {170, 139, 241, 252, 236, 209, 255, 255, 128, 128=
, 128},
> +                       { 37, 116, 196, 243, 228, 255, 255, 255, 128, 128=
, 128},
> +               }, {
> +                       {  1, 204, 254, 255, 245, 255, 128, 128, 128, 128=
, 128},
> +                       {207, 160, 250, 255, 238, 128, 128, 128, 128, 128=
, 128},
> +                       {102, 103, 231, 255, 211, 171, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1, 152, 252, 255, 240, 255, 128, 128, 128, 128=
, 128},
> +                       {177, 135, 243, 255, 234, 225, 128, 128, 128, 128=
, 128},
> +                       { 80, 129, 211, 255, 194, 224, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {246,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {255, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               },
> +       }, {
> +               {
> +                       {198,  35, 237, 223, 193, 187, 162, 160, 145, 155=
,  62},
> +                       {131,  45, 198, 221, 172, 176, 220, 157, 252, 221=
,   1},
> +                       { 68,  47, 146, 208, 149, 167, 221, 162, 255, 223=
, 128},
> +               }, {
> +                       {  1, 149, 241, 255, 221, 224, 255, 255, 128, 128=
, 128},
> +                       {184, 141, 234, 253, 222, 220, 255, 199, 128, 128=
, 128},
> +                       { 81,  99, 181, 242, 176, 190, 249, 202, 255, 255=
, 128},
> +               }, {
> +                       {  1, 129, 232, 253, 214, 197, 242, 196, 255, 255=
, 128},
> +                       { 99, 121, 210, 250, 201, 198, 255, 202, 128, 128=
, 128},
> +                       { 23,  91, 163, 242, 170, 187, 247, 210, 255, 255=
, 128},
> +               }, {
> +                       {  1, 200, 246, 255, 234, 255, 128, 128, 128, 128=
, 128},
> +                       {109, 178, 241, 255, 231, 245, 255, 255, 128, 128=
, 128},
> +                       { 44, 130, 201, 253, 205, 192, 255, 255, 128, 128=
, 128},
> +               }, {
> +                       {  1, 132, 239, 251, 219, 209, 255, 165, 128, 128=
, 128},
> +                       { 94, 136, 225, 251, 218, 190, 255, 255, 128, 128=
, 128},
> +                       { 22, 100, 174, 245, 186, 161, 255, 199, 128, 128=
, 128},
> +               }, {
> +                       {  1, 182, 249, 255, 232, 235, 128, 128, 128, 128=
, 128},
> +                       {124, 143, 241, 255, 227, 234, 128, 128, 128, 128=
, 128},
> +                       { 35,  77, 181, 251, 193, 211, 255, 205, 128, 128=
, 128},
> +               }, {
> +                       {  1, 157, 247, 255, 236, 231, 255, 255, 128, 128=
, 128},
> +                       {121, 141, 235, 255, 225, 227, 255, 255, 128, 128=
, 128},
> +                       { 45,  99, 188, 251, 195, 217, 255, 224, 128, 128=
, 128},
> +               }, {
> +                       {  1,   1, 251, 255, 213, 255, 128, 128, 128, 128=
, 128},
> +                       {203,   1, 248, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +                       {137,   1, 177, 255, 224, 255, 128, 128, 128, 128=
, 128},
> +               },
> +       }, {
> +               {
> +                       {253,   9, 248, 251, 207, 208, 255, 192, 128, 128=
, 128},
> +                       {175,  13, 224, 243, 193, 185, 249, 198, 255, 255=
, 128},
> +                       { 73,  17, 171, 221, 161, 179, 236, 167, 255, 234=
, 128},
> +               }, {
> +                       {  1,  95, 247, 253, 212, 183, 255, 255, 128, 128=
, 128},
> +                       {239,  90, 244, 250, 211, 209, 255, 255, 128, 128=
, 128},
> +                       {155,  77, 195, 248, 188, 195, 255, 255, 128, 128=
, 128},
> +               }, {
> +                       {  1,  24, 239, 251, 218, 219, 255, 205, 128, 128=
, 128},
> +                       {201,  51, 219, 255, 196, 186, 128, 128, 128, 128=
, 128},
> +                       { 69,  46, 190, 239, 201, 218, 255, 228, 128, 128=
, 128},
> +               }, {
> +                       {  1, 191, 251, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +                       {223, 165, 249, 255, 213, 255, 128, 128, 128, 128=
, 128},
> +                       {141, 124, 248, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1,  16, 248, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +                       {190,  36, 230, 255, 236, 255, 128, 128, 128, 128=
, 128},
> +                       {149,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1, 226, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {247, 192, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {240, 128, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {  1, 134, 252, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +                       {213,  62, 250, 255, 255, 128, 128, 128, 128, 128=
, 128},
> +                       { 55,  93, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               }, {
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {128, 128, 128, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               },
> +       }, {
> +               {
> +                       {202,  24, 213, 235, 186, 191, 220, 160, 240, 175=
, 255},
> +                       {126,  38, 182, 232, 169, 184, 228, 174, 255, 187=
, 128},
> +                       { 61,  46, 138, 219, 151, 178, 240, 170, 255, 216=
, 128},
> +               }, {
> +                       {  1, 112, 230, 250, 199, 191, 247, 159, 255, 255=
, 128},
> +                       {166, 109, 228, 252, 211, 215, 255, 174, 128, 128=
, 128},
> +                       { 39,  77, 162, 232, 172, 180, 245, 178, 255, 255=
, 128},
> +               }, {
> +                       {  1,  52, 220, 246, 198, 199, 249, 220, 255, 255=
, 128},
> +                       {124,  74, 191, 243, 183, 193, 250, 221, 255, 255=
, 128},
> +                       { 24,  71, 130, 219, 154, 170, 243, 182, 255, 255=
, 128},
> +               }, {
> +                       {  1, 182, 225, 249, 219, 240, 255, 224, 128, 128=
, 128},
> +                       {149, 150, 226, 252, 216, 205, 255, 171, 128, 128=
, 128},
> +                       { 28, 108, 170, 242, 183, 194, 254, 223, 255, 255=
, 128},
> +               }, {
> +                       {  1,  81, 230, 252, 204, 203, 255, 192, 128, 128=
, 128},
> +                       {123, 102, 209, 247, 188, 196, 255, 233, 128, 128=
, 128},
> +                       { 20,  95, 153, 243, 164, 173, 255, 203, 128, 128=
, 128},
> +               }, {
> +                       {  1, 222, 248, 255, 216, 213, 128, 128, 128, 128=
, 128},
> +                       {168, 175, 246, 252, 235, 205, 255, 255, 128, 128=
, 128},
> +                       { 47, 116, 215, 255, 211, 212, 255, 255, 128, 128=
, 128},
> +               }, {
> +                       {  1, 121, 236, 253, 212, 214, 255, 255, 128, 128=
, 128},
> +                       {141,  84, 213, 252, 201, 202, 255, 219, 128, 128=
, 128},
> +                       { 42,  80, 160, 240, 162, 185, 255, 205, 128, 128=
, 128},
> +               }, {
> +                       {  1,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {244,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +                       {238,   1, 255, 128, 128, 128, 128, 128, 128, 128=
, 128},
> +               },
> +       }
> +};
> +
> +uint32_t const default_prob_mv[2][19] =3D {
> +       {
> +               162, 128, 225, 146, 172, 147, 214,  39, 156, 128,
> +               129, 132,  75, 145, 178, 206, 239, 254, 254,
> +       }, {
> +               164, 128, 204, 170, 119, 235, 140, 230, 228, 128,
> +               130, 130,  74, 148, 180, 203, 236, 254, 254,
> +       },
> +};
> +
> +struct hantro_vp8_enc_ctrl_buf {
> +       u32 hw_hdr_size;
> +       u32 dct_size;
> +       u8 reserved[1016];
> +};
> +
> +static inline bool is_intra(struct hantro_ctx *ctx)
> +{
> +       return ctx->vp8_enc.is_intra;
> +}
> +
> +static inline size_t frame_tag_size(struct hantro_ctx *ctx)
> +{
> +       return is_intra(ctx) ? 10 : 3;
> +}
> +
> +static void rockchip_vpu2_vp8_enc_write_coeff_prob(struct hantro_ctx *ct=
x)
> +{
> +       struct hantro_boolenc *e =3D &ctx->vp8_enc.boolenc;
> +       struct hantro_vp8_entropy *entropy =3D &ctx->vp8_enc.entropy;
> +
> +       int i, j, k, l;
> +       uint32_t prob, new, old;
> +
> +       for (i =3D 0; i < 4; i++) {
> +               for (j =3D 0; j < 8; j++) {
> +                       for (k =3D 0; k < 3; k++) {
> +                               for (l =3D 0; l < 11; l++) {
> +                                       prob =3D coeff_update_prob[i][j][=
k][l];
> +
> +                                       old =3D entropy->coeff_prob_old[i=
][j][k][l];
> +                                       new =3D entropy->coeff_prob[i][j]=
[k][l];
> +
> +                                       if (new =3D=3D old) {
> +                                               hantro_boolenc_write_bool=
(e, prob, 0);
> +                                       } else {
> +                                               hantro_boolenc_write_bool=
(e, prob, 1);
> +                                               hantro_boolenc_write_lit(=
e, new, 8);
> +                                       }
> +                               }
> +                       }
> +               }
> +       }
> +}
> +
> +static void rockchip_vpu2_vp8_enc_write_mv_prob(struct hantro_ctx *ctx)
> +{
> +       struct hantro_boolenc *e =3D &ctx->vp8_enc.boolenc;
> +       struct hantro_vp8_entropy *entropy =3D &ctx->vp8_enc.entropy;
> +
> +       int i, j;
> +       uint32_t prob, new, old;
> +
> +       for (i =3D 0; i < 2; i++) {
> +               for (j =3D 0; j < 19; j++) {
> +                       prob =3D mv_update_prob[i][j];
> +                       old =3D entropy->mv_prob_old[i][j];
> +                       new =3D entropy->mv_prob[i][j];
> +
> +                       if (new =3D=3D old) {
> +                               hantro_boolenc_write_bool(e, prob, 0);
> +                       } else {
> +                               hantro_boolenc_write_bool(e, prob, 1);
> +                               hantro_boolenc_write_lit(e, new >> 1, 7);
> +                       }
> +               }
> +       }
> +}
> +
> +static void rockchip_vpu2_vp8_enc_write_filter_level_delta(struct hantro=
_ctx *ctx)
> +{
> +       struct hantro_boolenc *e =3D &ctx->vp8_enc.boolenc;
> +       int32_t i, tmp;
> +       uint8_t  update =3D 0;
> +       int32_t mode_update[4];
> +       int32_t ref_update[4];
> +
> +       if (is_intra(ctx)) {
> +               memset(ctx->vp8_enc.old_mode_delta, 0, sizeof(ctx->vp8_en=
c.old_mode_delta));
> +               memset(ctx->vp8_enc.old_ref_delta, 0, sizeof(ctx->vp8_enc=
.old_ref_delta));
> +       }
> +
> +       for (i =3D 0; i < 4; i++) {
> +               mode_update[i] =3D ctx->vp8_enc.mode_delta[i] !=3D ctx->v=
p8_enc.old_mode_delta[i];
> +               ref_update[i] =3D ctx->vp8_enc.ref_delta[i] !=3D ctx->vp8=
_enc.old_ref_delta[i];
> +               if (mode_update[i] || ref_update[i])
> +                       update =3D 1;
> +       }
> +
> +       if (!ctx->vp8_enc.refresh_entropy_probs)
> +               update =3D 1;
> +
> +       hantro_boolenc_write_lit(e, update, 1);
> +       if (!update)
> +               return;
> +
> +       for (i =3D 0; i < 4; i++) {
> +               hantro_boolenc_write_lit(e, ref_update[i], 1);
> +               if (ref_update[i]) {
> +                       tmp =3D ctx->vp8_enc.ref_delta[i];
> +                       hantro_boolenc_write_lit(e, abs(tmp), 6);
> +                       hantro_boolenc_write_lit(e, tmp < 0, 1);
> +               }
> +       }
> +
> +       for (i =3D 0; i < 4; i++) {
> +               hantro_boolenc_write_lit(e, mode_update[i], 1);
> +               if (mode_update[i]) {
> +                       tmp =3D ctx->vp8_enc.mode_delta[i];
> +                       hantro_boolenc_write_lit(e, abs(tmp), 6);
> +                       hantro_boolenc_write_lit(e, tmp < 0, 1);
> +               }
> +       }
> +
> +       memcpy(ctx->vp8_enc.old_mode_delta, ctx->vp8_enc.mode_delta,
> +              sizeof(ctx->vp8_enc.old_mode_delta));
> +       memcpy(ctx->vp8_enc.old_ref_delta, ctx->vp8_enc.ref_delta,
> +              sizeof(ctx->vp8_enc.old_ref_delta));
> +}
> +
> +static void rockchip_vpu2_vp8_enc_write_header(struct hantro_ctx *ctx, u=
32 qp,
> +                                              struct v4l2_ctrl_vp8_encod=
e_params *params)
> +{
> +       struct hantro_boolenc *e =3D &ctx->vp8_enc.boolenc;
> +       struct vb2_v4l2_buffer *dst_buf =3D hantro_get_dst_buf(ctx);
> +       void *vaddr =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +
> +       ctx->vp8_enc.frame_tag =3D vaddr;
> +       memset(ctx->vp8_enc.frame_tag, 0, sizeof(*ctx->vp8_enc.frame_tag)=
);
> +       ctx->vp8_enc.frame_tag->tag[0] |=3D (1 << 1);     /* version 1 */
> +       if (ctx->vp8_enc.show_frame)
> +               ctx->vp8_enc.frame_tag->tag[0] |=3D (1 << 4);
> +       /* first partition size is known only after encoding */
> +
> +       if (is_intra(ctx)) {
> +               ctx->vp8_enc.frame_tag->magic[0] =3D 0x9d;
> +               ctx->vp8_enc.frame_tag->magic[1] =3D 0x01;
> +               ctx->vp8_enc.frame_tag->magic[2] =3D 0x2a;
> +
> +               ctx->vp8_enc.frame_tag->width[0] =3D ctx->src_fmt.width &=
 0xff;
> +               ctx->vp8_enc.frame_tag->width[1] =3D (ctx->src_fmt.width =
>> 8) & 0xff;
> +
> +               ctx->vp8_enc.frame_tag->height[0] =3D ctx->src_fmt.height=
 & 0xff;
> +               ctx->vp8_enc.frame_tag->height[1] =3D (ctx->src_fmt.heigh=
t >> 8) & 0xff;
> +       } else {
> +               ctx->vp8_enc.frame_tag->tag[0] |=3D 0x1;
> +       }
> +
> +       hantro_boolenc_init(e, vaddr + frame_tag_size(ctx));
> +
> +       if (is_intra(ctx)) {
> +               hantro_boolenc_write_lit(e, params->color_space, 1);
> +               hantro_boolenc_write_lit(e, params->clamping_type, 1);
> +       }
> +
> +       hantro_boolenc_write_lit(e, !!(params->flags & V4L2_VP8_FRAME_FLA=
G_SEGMENT_ENABLED), 1);
> +
> +       hantro_boolenc_write_lit(e, params->loop_filter_type, 1);
> +       hantro_boolenc_write_lit(e, params->loop_filter_level, 6);
> +       hantro_boolenc_write_lit(e, params->sharpness_level, 3);
> +       hantro_boolenc_write_lit(e, !!(params->flags & V4L2_VP8_FRAME_FLA=
G_LOOP_FILTER_ADJ_ENABLED),
> +                                1);
> +       if (params->flags & V4L2_VP8_FRAME_FLAG_LOOP_FILTER_ADJ_ENABLED)
> +               rockchip_vpu2_vp8_enc_write_filter_level_delta(ctx);
> +
> +       hantro_boolenc_write_lit(e, params->log2_nbr_of_dct_partitions, 2=
);
> +
> +       hantro_boolenc_write_lit(e, qp, 7);
> +
> +       hantro_boolenc_write_lit(e, 0, 1);
> +       hantro_boolenc_write_lit(e, 0, 1);
> +       hantro_boolenc_write_lit(e, 0, 1);
> +       hantro_boolenc_write_lit(e, 0, 1);
> +       hantro_boolenc_write_lit(e, 0, 1);
> +
> +       if (!is_intra(ctx)) {
> +               hantro_boolenc_write_lit(e, 0, 1); /* refresh golden */
> +               hantro_boolenc_write_lit(e, 0, 1); /* refresh alt */
> +               hantro_boolenc_write_lit(e, 0, 2); /* copy to golden */
> +               hantro_boolenc_write_lit(e, 0, 2); /* copy to alt */
> +               hantro_boolenc_write_lit(e, 0, 1); /* sign bias golden */
> +               hantro_boolenc_write_lit(e, 0, 1); /* sign bias alt */
> +               hantro_boolenc_write_lit(e, ctx->vp8_enc.refresh_entropy_=
probs, 1);
> +               hantro_boolenc_write_lit(e, 1, 1);
> +       } else {
> +               hantro_boolenc_write_lit(e, ctx->vp8_enc.refresh_entropy_=
probs, 1);
> +       }
> +
> +       rockchip_vpu2_vp8_enc_write_coeff_prob(ctx);
> +
> +       hantro_boolenc_write_lit(e, 1, 1);
> +       hantro_boolenc_write_lit(e, ctx->vp8_enc.prob_skip_false, 8);
> +
> +       if (is_intra(ctx))
> +               return;
> +
> +       hantro_boolenc_write_lit(e, ctx->vp8_enc.prob_intra, 8);
> +       hantro_boolenc_write_lit(e, ctx->vp8_enc.prob_last, 8);
> +       hantro_boolenc_write_lit(e, ctx->vp8_enc.prob_gf, 8);
> +       hantro_boolenc_write_lit(e, 0, 1); /* intra 16x16 prob update fla=
g */
> +       hantro_boolenc_write_lit(e, 0, 1); /* intra chroma prob update fl=
ag */
> +
> +       rockchip_vpu2_vp8_enc_write_mv_prob(ctx);
> +}
> +
> +static uint32_t calc_mvprob(uint32_t left, uint32_t right, uint32_t prob=
)
> +{
> +       uint32_t p;
> +
> +       if (left + right) {
> +               p =3D (left * 255) / (left + right);
> +               p &=3D -2;
> +               if (!p)
> +                       p =3D 1;
> +       } else {
> +               p =3D prob;
> +       }
> +
> +       return p;
> +}
> +
> +static uint32_t update_prob(uint32_t prob, uint32_t left, uint32_t right=
,
> +                           uint32_t old_prob, uint32_t new_prob, uint32_=
t fixed)
> +{
> +       int32_t u, s;
> +
> +       u =3D (int32_t)fixed + ((vp8_prob_cost[255 - prob] - vp8_prob_cos=
t[prob]) >> 8);
> +       s =3D ((int32_t)left * (vp8_prob_cost[old_prob] - vp8_prob_cost[n=
ew_prob]) +
> +               (int32_t)right *
> +               (vp8_prob_cost[255 - old_prob] - vp8_prob_cost[255 - new_=
prob])) >> 8;
> +
> +       return (s > u);
> +}
> +
> +static void rockchip_vpu2_vp8_enc_update_entropy(struct hantro_ctx *ctx)
> +{
> +       struct hantro_vp8_entropy *entropy =3D &ctx->vp8_enc.entropy;
> +       uint16_t *p_cnt =3D (uint16_t *)ctx->vp8_enc.priv_dst.cpu;
> +
> +       int32_t i, j, k, l;
> +
> +       uint32_t p, left, right;
> +       uint32_t old_p, upd_p =3D 0;
> +
> +       uint32_t type;
> +       uint32_t branch_cnt[2];
> +       uint16_t *p_tmp =3D NULL;
> +
> +       if (!ctx->vp8_enc.refresh_entropy_probs || is_intra(ctx)) {
> +               memcpy(entropy->coeff_prob, default_prob_coeff, sizeof(de=
fault_prob_coeff));
> +               memcpy(entropy->mv_prob, default_prob_mv, sizeof(default_=
prob_mv));
> +       }
> +
> +       memcpy(entropy->coeff_prob_old, entropy->coeff_prob, sizeof(entro=
py->coeff_prob));
> +       if (ctx->vp8_enc.frame_counter =3D=3D 0 || !ctx->vp8_enc.last_int=
ra)
> +               memcpy(entropy->mv_prob_old, entropy->mv_prob, sizeof(ent=
ropy->mv_prob));
> +
> +       if (!ctx->vp8_enc.frame_counter)
> +               return;
> +
> +       for (i =3D 0; i < 4; i++) {
> +               for (j =3D 0; j < 7; j++) {
> +                       for (k =3D 0; k < 3; k++) {
> +                               int32_t tmp, ii;
> +
> +                               tmp =3D i * 7 * 3 + j * 3 + k;
> +                               tmp +=3D 2 * 4 * 7 * 3;
> +                               ii =3D offset_tbl[tmp];
> +
> +                               right =3D ii >=3D 0 ? p_cnt[ii] : 0;
> +
> +                               for (l =3D 2; l--;) {
> +                                       old_p =3D entropy->coeff_prob[i][=
j][k][l];
> +                                       old_p =3D coeff_update_prob[i][j]=
[k][l];
> +
> +                                       tmp -=3D 4 * 7 * 3;
> +                                       ii =3D offset_tbl[tmp];
> +                                       left =3D ii >=3D 0 ? p_cnt[ii] : =
0;
> +                                       if (left + right) {
> +                                               p =3D ((left * 256) + ((l=
eft + right) >> 1)) /
> +                                                   (left + right);
> +                                               if (p > 255)
> +                                                       p =3D 255;
> +                                       } else {
> +                                               p =3D old_p;
> +                                       }
> +
> +                                       if (update_prob(upd_p, left, righ=
t, old_p, p, 8))
> +                                               entropy->coeff_prob[i][j]=
[k][l] =3D p;
> +
> +                                       right +=3D left;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       p_tmp =3D p_cnt + VP8_PROB_COUNT_MV_OFFSET;
> +       for (i =3D 0; i < 2; i++) {
> +               left  =3D *p_tmp++;
> +               right =3D *p_tmp++;
> +
> +               p =3D calc_mvprob(left, right, entropy->mv_prob_old[i][0]=
);
> +
> +               if (update_prob(mv_update_prob[i][0], left, right,
> +                               entropy->mv_prob_old[i][0], p, 6))
> +                       entropy->mv_prob[i][0] =3D p;
> +
> +               right +=3D left;
> +               left =3D *p_tmp++;
> +               right -=3D left - p_tmp[0];
> +
> +               p =3D calc_mvprob(left, right, entropy->mv_prob_old[i][1]=
);
> +               if (update_prob(mv_update_prob[i][1], left, right,
> +                               entropy->mv_prob_old[i][1], p, 6))
> +                       entropy->mv_prob[i][1] =3D p;
> +
> +               for (j =3D 0; j < 2; j++) {
> +                       left =3D *p_tmp++;
> +                       right =3D *p_tmp++;
> +                       p =3D calc_mvprob(left, right, entropy->mv_prob_o=
ld[i][4 + j]);
> +                       if (update_prob(mv_update_prob[i][4 + j], left, r=
ight,
> +                                       entropy->mv_prob_old[i][4 + j], p=
, 6))
> +                               entropy->mv_prob[i][4 + j] =3D p;
> +                       branch_cnt[j] =3D left + right;
> +               }
> +
> +               p =3D calc_mvprob(branch_cnt[0], branch_cnt[1], entropy->=
mv_prob_old[i][3]);
> +               if (update_prob(mv_update_prob[i][3], branch_cnt[0], bran=
ch_cnt[1],
> +                               entropy->mv_prob_old[i][3], p, 6))
> +                       entropy->mv_prob[i][3] =3D p;
> +
> +               type =3D branch_cnt[0] + branch_cnt[1];
> +
> +               for (j =3D 0; j < 2; j++) {
> +                       left =3D *p_tmp++;
> +                       right =3D *p_tmp++;
> +                       p =3D calc_mvprob(left, right, entropy->mv_prob_o=
ld[i][7 + j]);
> +                       if (update_prob(mv_update_prob[i][7 + j], left, r=
ight,
> +                                       entropy->mv_prob_old[i][7 + j], p=
, 6))
> +                               entropy->mv_prob[i][7 + j] =3D p;
> +                       branch_cnt[j] =3D left + right;
> +               }
> +
> +               p =3D calc_mvprob(branch_cnt[0], branch_cnt[1], entropy->=
mv_prob_old[i][6]);
> +               if (update_prob(mv_update_prob[i][6], branch_cnt[0], bran=
ch_cnt[1],
> +                               entropy->mv_prob_old[i][6], p, 6))
> +                       entropy->mv_prob[i][6] =3D p;
> +
> +               p =3D calc_mvprob(type, branch_cnt[0] + branch_cnt[1],
> +                               entropy->mv_prob_old[i][2]);
> +               if (update_prob(mv_update_prob[i][2], type, branch_cnt[0]=
 + branch_cnt[1],
> +                               entropy->mv_prob_old[i][2], p, 6))
> +                       entropy->mv_prob[i][2] =3D p;
> +       }
> +
> +       memcpy(entropy->y_mode_prob, y_mode_prob, sizeof(y_mode_prob));
> +       memcpy(entropy->uv_mode_prob, uv_mode_prob, sizeof(uv_mode_prob))=
;
> +}
> +
> +static inline int coeff_prob_idx(int index)
> +{
> +       return (index / 8) * 8 + 7 - (index % 8);
> +}
> +
> +static void rockchip_vpu2_vp8_enc_write_entropy(struct hantro_ctx *ctx)
> +{
> +       struct hantro_vp8_entropy *entropy =3D &ctx->vp8_enc.entropy;
> +       uint8_t *entropy_table =3D ctx->vp8_enc.priv_src.cpu;
> +       int index, i, j, k, l;
> +
> +       memset(entropy_table, 0, 56);
> +       entropy_table[7] =3D ctx->vp8_enc.prob_skip_false;
> +       entropy_table[6] =3D ctx->vp8_enc.prob_intra;
> +       entropy_table[5] =3D ctx->vp8_enc.prob_last;
> +       entropy_table[4] =3D ctx->vp8_enc.prob_gf;
> +       entropy_table[3] =3D 0; /* segment_prob[0]; */
> +       entropy_table[2] =3D 0; /* segment_prob[1]; */
> +       entropy_table[1] =3D 0; /* segment_prob[2]; */
> +
> +       entropy_table[15] =3D entropy->y_mode_prob[0];
> +       entropy_table[14] =3D entropy->y_mode_prob[1];
> +       entropy_table[13] =3D entropy->y_mode_prob[2];
> +       entropy_table[12] =3D entropy->y_mode_prob[3];
> +       entropy_table[11] =3D entropy->uv_mode_prob[0];
> +       entropy_table[10] =3D entropy->uv_mode_prob[1];
> +       entropy_table[9] =3D entropy->uv_mode_prob[2];
> +
> +       entropy_table[23] =3D entropy->mv_prob[1][0];
> +       entropy_table[22] =3D entropy->mv_prob[0][0];
> +       entropy_table[21] =3D entropy->mv_prob[1][1];
> +       entropy_table[20] =3D entropy->mv_prob[0][1];
> +       entropy_table[19] =3D entropy->mv_prob[1][17];
> +       entropy_table[18] =3D entropy->mv_prob[1][18];
> +       entropy_table[17] =3D entropy->mv_prob[0][17];
> +       entropy_table[16] =3D entropy->mv_prob[0][18];
> +
> +       for (i =3D 0; i < 8; ++i)
> +               entropy_table[24 + 7 - i] =3D entropy->mv_prob[1][9 + i];
> +
> +       for (i =3D 0; i < 8; ++i)
> +               entropy_table[32 + 7 - i] =3D entropy->mv_prob[0][9 + i];
> +
> +       for (i =3D 0; i < 7; ++i)
> +               entropy_table[40 + 7 - i] =3D entropy->mv_prob[1][2 + i];
> +
> +       for (i =3D 0; i < 7; ++i)
> +               entropy_table[48 + 7 - i] =3D entropy->mv_prob[0][2 + i];
> +
> +       index =3D 56;
> +
> +       for (i =3D 0; i < 4; ++i)
> +               for (j =3D 0; j < 8; ++j)
> +                       for (k =3D 0; k < 3; ++k) {
> +                               for (l =3D 0; l < 3; ++l)
> +                                       entropy_table[coeff_prob_idx(inde=
x++)] =3D
> +                                               entropy->coeff_prob[i][j]=
[k][l];
> +                               entropy_table[coeff_prob_idx(index++)] =
=3D 0;
> +                       }
> +
> +       for (i =3D 0; i < 4; ++i)
> +               for (j =3D 0; j < 8; ++j)
> +                       for (k =3D 0; k < 3; ++k) {
> +                               for (l =3D 4; l < 11; ++l)
> +                                       entropy_table[coeff_prob_idx(inde=
x++)] =3D
> +                                               entropy->coeff_prob[i][j]=
[k][l];
> +                               entropy_table[coeff_prob_idx(index++)] =
=3D
> +                                       entropy->coeff_prob[i][j][k][3];
> +                       }
> +}
> +
> +static inline size_t sw_hdr_size(struct hantro_ctx *ctx)
> +{
> +       return ctx->vp8_enc.boolenc.bytes_written + frame_tag_size(ctx);
> +}
> +
> +static inline u32 enc_in_img_ctrl(struct hantro_ctx *ctx, u32 qp)
> +{
> +       unsigned int overfill_r, overfill_b;
> +
> +       /*
> +        * The hardware needs only the value for luma plane, because
> +        * values of other planes are calculated internally based on
> +        * format setting.
> +        */
> +       overfill_r =3D ctx->src_fmt.width - ctx->dst_fmt.width;
> +       overfill_b =3D ctx->src_fmt.height - ctx->dst_fmt.height;
> +
> +       return VEPU_REG_STREAM_START_OFFSET(0) |
> +               VEPU_REG_IN_IMG_CTRL_OVRFLR_D4(overfill_r / 4) |
> +               VEPU_REG_IN_IMG_CTRL_OVRFLB(overfill_b) |
> +               VEPU_REG_SKIP_MACROBLOCK_PENALTY(qp >=3D 100 ? (3 * qp / =
4) : 0);
> +}
> +
> +static void
> +rockchip_vpu2_vp8_enc_set_buffers(struct hantro_dev *vpu, struct hantro_=
ctx *ctx, u32 qp,
> +                                 struct v4l2_ctrl_vp8_encode_params *par=
ams)
> +{
> +       const u32 src_addr_regs[] =3D { VEPU_REG_ADDR_IN_PLANE_0,
> +                                     VEPU_REG_ADDR_IN_PLANE_1,
> +                                     VEPU_REG_ADDR_IN_PLANE_2 };
> +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +       struct v4l2_pix_format_mplane *src_fmt =3D &ctx->src_fmt;
> +       size_t luma_size;
> +       dma_addr_t dst_dma;
> +       size_t dst_size;
> +       int i, ref_idx;
> +
> +       src_buf =3D hantro_get_src_buf(ctx);
> +       dst_buf =3D hantro_get_dst_buf(ctx);
> +
> +       luma_size =3D hantro_rounded_luma_size(ctx->src_fmt.width,
> +                                            ctx->src_fmt.height);
> +
> +       dst_dma =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +       dst_size =3D vb2_plane_size(&dst_buf->vb2_buf, 0);
> +
> +       /*
> +        * We assume here that 1/10 of the buffer is enough for headers.
> +        * DCT partition will be placed in remaining 9/10 of the buffer.
> +        */
> +       ctx->vp8_enc.estimated_hdr_size =3D round_up(dst_size / 10, 8);
> +
> +       /* Destination buffer. */
> +       /*
> +        * We "abused" the first portion of this 1/10 of the buffer when =
generating
> +        * the frame tag and compressed header, so TODO: verify that the =
1/10 can hold both the
> +        * compressed header and the "extended header" generated in hw.
> +        */
> +       vepu_write_relaxed(vpu, dst_dma + round_up(sw_hdr_size(ctx), 8),
> +                          VEPU_REG_ADDR_OUTPUT_STREAM);
> +       vepu_write_relaxed(vpu, dst_dma + ctx->vp8_enc.estimated_hdr_size=
,
> +                          VEPU_REG_ADDR_VP8_DCT_PART(0));
> +       vepu_write_relaxed(vpu, dst_size - ctx->vp8_enc.estimated_hdr_siz=
e,
> +                          VEPU_REG_STR_BUF_LIMIT);
> +
> +       /* Auxiliary buffers. */
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.ctrl_buf.dma,
> +                          VEPU_REG_ADDR_OUTPUT_CTRL);
> +       memset(ctx->vp8_enc.ctrl_buf.cpu, 0, ctx->vp8_enc.ctrl_buf.size);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.mv_buf.dma,
> +                          VEPU_REG_ADDR_MV_OUT);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.priv_dst.dma,
> +                          VEPU_REG_ADDR_VP8_PROB_CNT);
> +       memset(ctx->vp8_enc.priv_dst.cpu, 0, ctx->vp8_enc.priv_dst.size);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.priv_src.dma,
> +                          VEPU_REG_ADDR_CABAC_TBL);
> +
> +       rockchip_vpu2_vp8_enc_write_entropy(ctx);
> +
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.priv_src.dma + 151 * 8,
> +                          VEPU_REG_ADDR_VP8_SEG_MAP);
> +
> +       /* Reference buffers. */
> +       switch (params->reference_type) {
> +       case V4L2_VP8_FRAME_REF_LAST:
> +               ref_idx =3D ctx->vp8_enc.last_ref;
> +               break;
> +       case V4L2_VP8_FRAME_REF_GOLDEN:
> +               ref_idx =3D ctx->vp8_enc.golden_ref;
> +               break;
> +       case V4L2_VP8_FRAME_REF_ALT:
> +               ref_idx =3D ctx->vp8_enc.alt_ref;
> +               break;
> +       }
> +       if (ref_idx < 0)
> +               ref_idx =3D 0;
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.ref_frames[ref_idx].dma, VEP=
U_REG_ADDR_REF_LUMA);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.ref_frames[ref_idx].dma + lu=
ma_size,
> +                          VEPU_REG_ADDR_REF_CHROMA);
> +
> +       /* Reconstruction buffers. */
> +       ctx->vp8_enc.reconstructed =3D  ctx->vp8_enc.first_free;
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.ref_frames[ctx->vp8_enc.reco=
nstructed].dma,
> +                          VEPU_REG_ADDR_REC_LUMA);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.ref_frames[ctx->vp8_enc.reco=
nstructed].dma + luma_size,
> +                          VEPU_REG_ADDR_REC_CHROMA);
> +
> +       /* Source buffer. */
> +       for (i =3D 0; i < src_fmt->num_planes; ++i)
> +               vepu_write_relaxed(vpu,
> +                                  vb2_dma_contig_plane_dma_addr(&src_buf=
->vb2_buf, i) +
> +                                  src_buf->vb2_buf.planes[i].data_offset=
,
> +                                  src_addr_regs[i]);
> +
> +       /* Source parameters. */
> +       vepu_write_relaxed(vpu, enc_in_img_ctrl(ctx, qp),
> +                          VEPU_REG_ENC_OVER_FILL_STRM_OFFSET);
> +}
> +
> +static inline uint32_t compute_filter_level(int32_t qp)
> +{
> +       return clamp((qp * 64) / 128 + 8, 0, 63);
> +}
> +
> +static s32 cost_tree(struct tree *tree, const s32 *prob)
> +{
> +       s32 value =3D tree->value;
> +       s32 number =3D tree->number;
> +       s32 *index =3D tree->index;
> +       s32 bit_cost =3D 0;
> +
> +       while (number--)
> +               bit_cost +=3D COST_BOOL(prob[*index++], (value >> number)=
 & 1);
> +
> +       return bit_cost;
> +}
> +
> +static s32 cost_mv(s32 mvd, const s32 *mv_prob)
> +{
> +       s32 i, tmp, bit_cost =3D 0;
> +
> +       tmp =3D abs(mvd >> 1);
> +
> +       /* Short Tree */
> +       if (tmp < 8) {
> +               bit_cost +=3D COST_BOOL(mv_prob[0], 0);
> +               bit_cost +=3D cost_tree(&mv_tree[tmp], mv_prob + 2);
> +               if (!tmp)
> +                       return bit_cost;
> +
> +               /* Sign */
> +               bit_cost +=3D COST_BOOL(mv_prob[1], mvd < 0);
> +               return bit_cost;
> +       }
> +
> +       /* Long Tree */
> +       bit_cost +=3D COST_BOOL(mv_prob[0], 1);
> +
> +       /* Bits 0, 1, 2 */
> +       for (i =3D 0; i < 3; i++)
> +               bit_cost +=3D COST_BOOL(mv_prob[9 + i], (tmp >> i) & 1);
> +
> +       /* Bits 9, 8, 7, 6, 5, 4 */
> +       for (i =3D 9; i > 3; i--)
> +               bit_cost +=3D COST_BOOL(mv_prob[9 + i], (tmp >> i) & 1);
> +
> +       /*
> +        * Bit 3: if ABS(mvd) < 8, it is coded with short tree, so if her=
e
> +        * ABS(mvd) <=3D 15, bit 3 must be one (because here we code valu=
es
> +        * 8,...,15) and is not explicitly coded.
> +        */
> +       if (tmp > 15)
> +               bit_cost +=3D COST_BOOL(mv_prob[9 + 3], (tmp >> 3) & 1);
> +
> +       /* Sign */
> +       bit_cost +=3D COST_BOOL(mv_prob[1], mvd < 0);
> +
> +       return bit_cost;
> +}
> +
> +static void rockchip_vpu2_vp8_enc_set_params(struct hantro_dev *vpu, str=
uct hantro_ctx *ctx, u32 qp,
> +                                            struct v4l2_ctrl_vp8_encode_=
params *params)
> +{
> +       struct hantro_vp8_entropy *entropy =3D &ctx->vp8_enc.entropy;
> +       int i;
> +       unsigned int mb_width =3D MB_WIDTH(ctx->src_fmt.width);
> +       unsigned int mb_height =3D MB_HEIGHT(ctx->src_fmt.height);
> +       u32 deq;
> +       u32 tmp;
> +       u32 reg;
> +       s32 inter_favor;
> +
> +       reg =3D VEPU_REG_OUTPUT_SWAP32
> +               | VEPU_REG_OUTPUT_SWAP16
> +               | VEPU_REG_OUTPUT_SWAP8
> +               | VEPU_REG_INPUT_SWAP8
> +               | VEPU_REG_INPUT_SWAP16
> +               | VEPU_REG_INPUT_SWAP32;
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_DATA_ENDIAN);
> +
> +       reg =3D VEPU_REG_SIZE_TABLE_PRESENT
> +               | VEPU_REG_IN_IMG_CTRL_FMT(ctx->vpu_src_fmt->enc_fmt)
> +               | VEPU_REG_IN_IMG_ROTATE_MODE(0);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_ENC_CTRL1);
> +
> +       reg =3D VEPU_REG_INTERRUPT_TIMEOUT_EN
> +               | VEPU_REG_MV_WRITE_EN;
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_INTERRUPT);
> +
> +       reg =3D VEPU_REG_IN_IMG_CHROMA_OFFSET(0)
> +               | VEPU_REG_IN_IMG_LUMA_OFFSET(0)
> +               | VEPU_REG_IN_IMG_CTRL_ROW_LEN(mb_width * 16);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_INPUT_LUMA_INFO);
> +
> +       vepu_write_relaxed(vpu, 0, VEPU_REG_STR_HDR_REM_MSB);
> +       vepu_write_relaxed(vpu, 0, VEPU_REG_STR_HDR_REM_LSB);
> +
> +       reg =3D 0;
> +       if (mb_width * mb_height > MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_=
MV)
> +               reg =3D VEPU_REG_DISABLE_QUARTER_PIXEL_MV;
> +       reg |=3D VEPU_REG_ENTROPY_CODING_MODE;
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_ENC_CTRL0);
> +
> +       inter_favor =3D 128 - ctx->vp8_enc.prob_intra;
> +       if (inter_favor >=3D 0)
> +               inter_favor =3D max(0, (int32_t)(qp * 2 - 40));
> +
> +       reg =3D VEPU_REG_INTRA16X16_MODE(qp * 1024 / 128)
> +               | VEPU_REG_INTER_MODE(inter_favor);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_INTRA_INTER_MODE);
> +
> +       reg =3D VEPU_REG_1MV_PENALTY(60 / 2 * 32)
> +               | VEPU_REG_QMV_PENALTY(8)
> +               | VEPU_REG_4MV_PENALTY(64 / 2);
> +       if (mb_width * mb_height < MAX_MB_COUNT_TO_DISABLE_SPLIT_MV)
> +               reg |=3D VEPU_REG_SPLIT_MV_MODE_EN;
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_MV_PENALTY);
> +
> +       reg =3D VEPU_REG_MV_PENALTY_16X8_8X16(
> +                       min(1023, split_penalty[qp] / 2))
> +               | VEPU_REG_MV_PENALTY_8X8(
> +                       min(1023, (2 * split_penalty[qp] + 40) / 4))
> +               | VEPU_REG_MV_PENALTY_8X4_4X8(0x3ff);
> +       /* no 8x4 or 4x8 block define in vp8 */
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_ENC_CTRL4);
> +
> +       reg =3D VEPU_REG_PENALTY_4X4MV(min(511,
> +                                        (8 * split_penalty[qp] + 500) / =
16))
> +               | VEPU_REG_ZERO_MV_FAVOR_D2(0);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_MVC_RELATE);
> +
> +       /* initialize quant table for segment0 */
> +       deq =3D dc_q_lookup[qp];
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_DC_Y1(min((1 << 16) / deq, 0x3FFFu)=
);
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_DC_Y1(((qzbin_factors[qp] * deq) =
+ 64) >>
> +                                           7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_DC_Y1((qrounding_factors[qp] * deq=
) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_DC_Y1);
> +
> +       deq =3D ac_q_lookup[qp];
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_AC_Y1(min((1 << 16) / deq, 0x3FFFu)=
);
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_AC_Y1(((qzbin_factors[qp] * deq) =
+ 64) >>
> +                                           7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_AC_Y1((qrounding_factors[qp] * deq=
) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_AC_Y1);
> +
> +       deq =3D dc_q_lookup[qp] * 2;
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_DC_Y2(min((1 << 16) / deq, 0x3FFFu)=
);
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_DC_Y2((qzbin_factors[qp] * deq + =
64) >>
> +                                           7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_DC_Y2((qrounding_factors[qp] * deq=
) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_DC_Y2);
> +
> +       deq =3D max(ac_q_lookup[qp] * 155 / 100, 8);
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_AC_Y2(min((1 << 16) / deq, 0x3FFFu)=
);
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_AC_Y2((qzbin_factors[qp] * deq + =
64) >>
> +                                           7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_AC_Y2((qrounding_factors[qp] * deq=
) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_AC_Y2);
> +
> +       deq =3D min(dc_q_lookup[qp], 132);
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_DC_CHR(min((1 << 16) / deq, 0x3FFFu=
));
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_DC_CHR((qzbin_factors[qp] * deq +=
 64) >>
> +                                            7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_DC_CHR((qrounding_factors[qp] * de=
q) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_DC_CHR);
> +
> +       deq =3D ac_q_lookup[qp];
> +       reg =3D VEPU_REG_VP8_SEG0_QUT_AC_CHR(min((1 << 16) / deq, 0x3FFFu=
));
> +       reg |=3D VEPU_REG_VP8_SEG0_ZBIN_AC_CHR((qzbin_factors[qp] * deq +=
 64) >>
> +                                            7);
> +       reg |=3D VEPU_REG_VP8_SEG0_RND_AC_CHR((qrounding_factors[qp] * de=
q) >> 7);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_AC_CHR);
> +
> +       reg =3D VEPU_REG_VP8_MV_REF_IDX1(params->reference_type);
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_DC_Y1(dc_q_lookup[qp]);
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_AC_Y1(ac_q_lookup[qp]);
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_DC_Y2(dc_q_lookup[qp] * 2);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_DQUT);
> +
> +       reg =3D VEPU_REG_VP8_MV_REF_IDX2(0);
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_DC_CHR(min(dc_q_lookup[qp], 132))=
;
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_AC_CHR(ac_q_lookup[qp]);
> +       reg |=3D VEPU_REG_VP8_SEG0_DQUT_AC_Y2(max(ac_q_lookup[qp] * 155 /=
 100, 8));
> +       if (is_intra(ctx))
> +               reg |=3D VEPU_REG_VP8_SEGMENT_MAP_UPDATE;
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_SEG0_QUANT_DQUT_1);
> +       vepu_write_relaxed(vpu, ctx->vp8_enc.boolenc.bottom,
> +                          VEPU_REG_VP8_BOOL_ENC_VALUE);
> +
> +       reg =3D VEPU_REG_VP8_DCT_PARTITION_CNT(0);
> +       reg |=3D VEPU_REG_VP8_FILTER_LEVEL(compute_filter_level(qp));
> +       reg |=3D VEPU_REG_VP8_FILTER_SHARPNESS(params->sharpness_level);
> +       reg |=3D VEPU_REG_VP8_ZERO_MV_PENALTY_FOR_REF2(0);
> +       reg |=3D VEPU_REG_VP8_BOOL_ENC_VALUE_BITS(24 - ctx->vp8_enc.boole=
nc.bit_count);
> +       reg |=3D VEPU_REG_VP8_BOOL_ENC_RANGE(ctx->vp8_enc.boolenc.range);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_ENC_CTRL2);
> +
> +       vepu_write_relaxed(vpu, 0xffffffff, VEPU_REG_ROI1);
> +       vepu_write_relaxed(vpu, 0xffffffff, VEPU_REG_ROI2);
> +       vepu_write_relaxed(vpu, 0, VEPU_REG_STABILIZATION_OUTPUT);
> +       vepu_write_relaxed(vpu, 0x962b4c85, VEPU_REG_RGB2YUV_CONVERSION_C=
OEF1);
> +       vepu_write_relaxed(vpu, 0x90901d50, VEPU_REG_RGB2YUV_CONVERSION_C=
OEF2);
> +       vepu_write_relaxed(vpu, 0x0000b694, VEPU_REG_RGB2YUV_CONVERSION_C=
OEF3);
> +       vepu_write_relaxed(vpu, 0, VEPU_REG_RGB_MASK_MSB);
> +       vepu_write_relaxed(vpu, 0, VEPU_REG_CIR_INTRA_CTRL);
> +       vepu_write_relaxed(vpu, 0xffffffff, VEPU_REG_INTRA_AREA_CTRL);
> +
> +       /* Intra 4x4 mode */
> +       tmp =3D qp * 2 + 8;
> +       for (i =3D 0; i < 5; i++) {
> +               reg =3D VEPU_REG_VP8_INTRA_4X4_PENALTY_0
> +                       ((intra_4_tree_penalty[i * 2] * tmp) >> 8);
> +               reg |=3D VEPU_REG_VP8_INTRA_4x4_PENALTY_1
> +                       ((intra_4_tree_penalty[i * 2 + 1] * tmp) >> 8);
> +               vepu_write_relaxed(vpu, reg,
> +                                  VEPU_REG_VP8_INTRA_4X4_PENALTY(i));
> +       }
> +
> +       /* Intra 16x16 mode */
> +       tmp =3D qp * 2 + 64;
> +       for (i =3D 0; i < 2; i++) {
> +               reg =3D VEPU_REG_VP8_INTRA_16X16_PENALTY_0
> +                       ((intra_16_tree_penalty[2 * i] * tmp) >> 8);
> +               reg |=3D VEPU_REG_VP8_INTRA_16X16_PENALTY_1
> +                       ((intra_16_tree_penalty[2 * i + 1] * tmp) >> 8);
> +               vepu_write_relaxed(vpu, reg,
> +                                  VEPU_REG_VP8_INTRA_16X16_PENALTY(i));
> +       }
> +
> +       reg =3D VEPU_REG_VP8_LF_REF_DELTA_INTRA_MB(ctx->vp8_enc.ref_delta=
[REF_DELTA_INTRA_MB]);
> +       reg |=3D VEPU_REG_VP8_LF_MODE_DELTA_BPRED(ctx->vp8_enc.mode_delta=
[MODE_DELTA_BPRED]);
> +       reg |=3D VEPU_REG_VP8_INTER_TYPE_BIT_COST(0);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_CONTROL);
> +
> +       reg =3D VEPU_REG_VP8_LF_REF_DELTA_ALT_REF(ctx->vp8_enc.ref_delta[=
REF_DELTA_ALT_REF])
> +               | VEPU_REG_VP8_LF_REF_DELTA_LAST_REF(ctx->vp8_enc.ref_del=
ta[REF_DELTA_LAST_REF])
> +               | VEPU_REG_VP8_LF_REF_DELTA_GOLDEN(ctx->vp8_enc.ref_delta=
[REF_DELTA_GOLDEN]);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_LOOP_FILTER_REF_DELTA);
> +
> +       reg =3D VEPU_REG_VP8_LF_MODE_DELTA_SPLITMV(ctx->vp8_enc.mode_delt=
a[MODE_DELTA_SPLITMV])
> +               | VEPU_REG_VP8_LF_MODE_DELTA_ZEROMV(ctx->vp8_enc.mode_del=
ta[MODE_DELTA_ZEROMV])
> +               | VEPU_REG_VP8_LF_MODE_DELTA_NEWMV(ctx->vp8_enc.mode_delt=
a[MODE_DELTA_NEWMV]);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_VP8_LOOP_FILTER_MODE_DELTA)=
;
> +
> +       for (i =3D 0; i < 128; i +=3D 4) {
> +               u32 x;
> +               u32 y;
> +
> +               reg =3D VEPU_REG_DMV_PENALTY_TABLE_BIT(i * 2, 3);
> +               reg |=3D VEPU_REG_DMV_PENALTY_TABLE_BIT((i + 1) * 2, 2);
> +               reg |=3D VEPU_REG_DMV_PENALTY_TABLE_BIT((i + 2) * 2, 1);
> +               reg |=3D VEPU_REG_DMV_PENALTY_TABLE_BIT((i + 3) * 2, 0);
> +               vepu_write_relaxed(vpu, reg, VEPU_REG_DMV_PENALTY_TBL(i /=
 4));
> +
> +               y =3D cost_mv(i * 2, entropy->mv_prob[0]);        /* mv y=
 */
> +               x =3D cost_mv(i * 2, entropy->mv_prob[1]);        /* mv x=
 */
> +
> +               reg =3D VEPU_REG_DMV_Q_PIXEL_PENALTY_TABLE_BIT(
> +                       min(255u, (y + x + 1) / 2 * weight[qp] >> 8), 3);
> +
> +               y =3D cost_mv((i + 1) * 2, entropy->mv_prob[0]); /* mv y =
*/
> +               x =3D cost_mv((i + 1) * 2, entropy->mv_prob[1]); /* mv x =
*/
> +               reg |=3D VEPU_REG_DMV_Q_PIXEL_PENALTY_TABLE_BIT(
> +                       min(255u, (y + x + 1) / 2 * weight[qp] >> 8), 2);
> +
> +               y =3D cost_mv((i + 2) * 2, entropy->mv_prob[0]); /* mv y =
*/
> +               x =3D cost_mv((i + 2) * 2, entropy->mv_prob[1]); /* mv x =
*/
> +               reg |=3D VEPU_REG_DMV_Q_PIXEL_PENALTY_TABLE_BIT(
> +                       min(255u, (y + x + 1) / 2 * weight[qp] >> 8), 1);
> +
> +               y =3D cost_mv((i + 3) * 2, entropy->mv_prob[0]); /* mv y =
*/
> +               x =3D cost_mv((i + 3) * 2, entropy->mv_prob[1]); /* mv x =
*/
> +               reg |=3D VEPU_REG_DMV_Q_PIXEL_PENALTY_TABLE_BIT(
> +                       min(255u, (y + x + 1) / 2 * weight[qp] >> 8), 0);
> +
> +               vepu_write_relaxed(vpu, reg,
> +                                  VEPU_REG_DMV_Q_PIXEL_PENALTY_TBL(i / 4=
));
> +       }
> +}
> +
> +int rockchip_vpu2_vp8_enc_run(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu =3D ctx->dev;
> +       struct v4l2_ctrl_vp8_encode_params *params;
> +       struct v4l2_ctrl *ctrl;
> +       u32 reg, qp;
> +       int i;
> +
> +       hantro_start_prepare_run(ctx);
> +
> +       params =3D hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_ENCODE_PAR=
AMS);
> +       if (WARN_ON(!params))
> +               return -EINVAL;
> +
> +       if (params->flags & V4L2_VP8_FRAME_FLAG_SEGMENT_ENABLED)
> +               return -EINVAL;
> +
> +       ctx->vp8_enc.is_intra =3D params->frame_type =3D=3D V4L2_VP8_FRAM=
E_TYPE_KEYFRAME;
> +
> +       if (is_intra(ctx)) {
> +               if (params->loop_filter_level !=3D 26)
> +                       return -EINVAL;
> +       } else {
> +               if (params->loop_filter_level !=3D 12)
> +                       return -EINVAL;
> +       }
> +
> +       ctrl =3D v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP=
8_ENCODE_QP);
> +       if (WARN_ON(!ctrl))
> +               return -EINVAL;
> +
> +       ctx->vp8_enc.show_frame =3D params->flags & V4L2_VP8_FRAME_FLAG_S=
HOWFRAME;
> +       ctx->vp8_enc.refresh_golden_frame =3D params->flags & V4L2_VP8_FR=
AME_FLAG_GOLDEN_REFRESH;
> +       ctx->vp8_enc.refresh_alternate_frame =3D params->flags & V4L2_VP8=
_FRAME_FLAG_ALTREF_REFRESH;
> +       ctx->vp8_enc.refresh_entropy_probs =3D
> +               params->flags & V4L2_VP8_FRAME_FLAG_REFRESH_ENTROPY_PROBS=
;
> +       ctx->vp8_enc.copy_buffer_to_golden =3D params->copy_buffer_to_gol=
den;
> +       ctx->vp8_enc.copy_buffer_to_alternate =3D params->copy_buffer_to_=
alternate;
> +       ctx->vp8_enc.prob_intra =3D params->prob_intra;
> +       ctx->vp8_enc.prob_last =3D params->prob_last;
> +       ctx->vp8_enc.prob_gf =3D params->prob_gf;
> +
> +       rockchip_vpu2_vp8_enc_update_entropy(ctx);
> +
> +       qp =3D *ctrl->p_cur.p_s32;
> +       ctx->vp8_enc.prob_skip_false =3D default_prob_skip_false[qp];
> +       rockchip_vpu2_vp8_enc_write_header(ctx, qp, params);
> +
> +       /*
> +        * Program the hardware.
> +        */
> +       vepu_write_relaxed(vpu, VEPU_REG_ENCODE_FORMAT_VP8, VEPU_REG_ENCO=
DE_START);
> +
> +       rockchip_vpu2_vp8_enc_set_params(vpu, ctx, qp, params);
> +       rockchip_vpu2_vp8_enc_set_buffers(vpu, ctx, qp, params);
> +
> +       reg =3D VEPU_REG_AXI_CTRL_READ_ID(0)
> +               | VEPU_REG_AXI_CTRL_WRITE_ID(0)
> +               | VEPU_REG_AXI_CTRL_BURST_LEN(16)
> +               | VEPU_REG_AXI_CTRL_INCREMENT_MODE(0)
> +               | VEPU_REG_AXI_CTRL_BIRST_DISCARD(0);
> +       vepu_write_relaxed(vpu, reg, VEPU_REG_AXI_CTRL);
> +
> +       /* Start the hardware. */
> +       reg =3D VEPU_REG_MB_HEIGHT(MB_HEIGHT(ctx->src_fmt.height))
> +               | VEPU_REG_MB_WIDTH(MB_WIDTH(ctx->src_fmt.width))
> +               | VEPU_REG_ENCODE_FORMAT_VP8
> +               | VEPU_REG_ENCODE_ENABLE;
> +
> +       if (is_intra(ctx))
> +               reg |=3D VEPU_REG_FRAME_TYPE_INTRA;
> +       else
> +               reg |=3D VEPU_REG_FRAME_TYPE_INTER;
> +
> +       /* Kick the watchdog and start encoding */
> +       hantro_end_prepare_run(ctx);
> +
> +       for (i =3D 0; i < 184; ++i)
> +               vepu_read(vpu, i * 4);
> +
> +       vepu_write(vpu, reg, VEPU_REG_ENCODE_START);
> +
> +       return 0;
> +}
> +
> +void rockchip_vpu2_vp8_enc_done(struct hantro_ctx *ctx)
> +{
> +       struct vb2_v4l2_buffer *dst_buf;
> +       struct hantro_vp8_enc_ctrl_buf *ctrl_buf =3D ctx->vp8_enc.ctrl_bu=
f.cpu;
> +       int part1_sz =3D ctx->vp8_enc.boolenc.bytes_written + ctrl_buf->h=
w_hdr_size;
> +       void *dst =3D ctx->vp8_enc.frame_tag;
> +       int old_g =3D ctx->vp8_enc.golden_ref, old_a =3D ctx->vp8_enc.alt=
_ref;
> +       int i;
> +
> +       ctx->vp8_enc.frame_tag->tag[0] |=3D ((part1_sz << 5) & 0xff);
> +       ctx->vp8_enc.frame_tag->tag[1] =3D ((part1_sz << 5) >> 8) & 0xff;
> +       ctx->vp8_enc.frame_tag->tag[2] =3D ((part1_sz << 5) >> 16) & 0xff=
;
> +
> +       dst_buf =3D hantro_get_dst_buf(ctx);
> +
> +       /* assemble dst frame */
> +       vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +                             sw_hdr_size(ctx) + ctrl_buf->hw_hdr_size + =
ctrl_buf->dct_size);
> +
> +       memmove(dst + sw_hdr_size(ctx), dst + round_up(sw_hdr_size(ctx), =
8), ctrl_buf->hw_hdr_size);
> +       memmove(dst + sw_hdr_size(ctx) + ctrl_buf->hw_hdr_size,
> +               dst + ctx->vp8_enc.estimated_hdr_size, ctrl_buf->dct_size=
);
> +
> +       /* currently reconstructed frame becames last ref */
> +       hantro_vp8_clr_bit(&ctx->vp8_enc, VP8_BIT_LAST, ctx->vp8_enc.last=
_ref);
> +       ctx->vp8_enc.last_ref =3D ctx->vp8_enc.reconstructed;
> +       hantro_vp8_set_bit(&ctx->vp8_enc, VP8_BIT_LAST, ctx->vp8_enc.last=
_ref);
> +
> +       /* after update (potentially) new slots will be used */
> +       hantro_vp8_clr_bit(&ctx->vp8_enc, VP8_BIT_GOLDEN, old_g);
> +       hantro_vp8_clr_bit(&ctx->vp8_enc, VP8_BIT_ALT, old_a);
> +
> +       /* VP8 spec, section 9.7. Refresh Golden Frame and Altref Frame *=
/
> +       if (is_intra(ctx)) {
> +               ctx->vp8_enc.golden_ref =3D ctx->vp8_enc.last_ref;
> +               ctx->vp8_enc.alt_ref =3D ctx->vp8_enc.last_ref;
> +       } else {
> +               if (ctx->vp8_enc.refresh_golden_frame) {
> +                       ctx->vp8_enc.golden_ref =3D ctx->vp8_enc.last_ref=
;
> +               } else if (ctx->vp8_enc.copy_buffer_to_golden) {
> +                       switch (ctx->vp8_enc.copy_buffer_to_golden) {
> +                       case V4L2_VP8_FRAME_GOLDEN_KEEP:
> +                               break;
> +                       case V4L2_VP8_FRAME_GOLDEN_LASTFRAME:
> +                               ctx->vp8_enc.golden_ref =3D ctx->vp8_enc.=
last_ref;
> +                               break;
> +                       case V4L2_VP8_FRAME_GOLDEN_ALTREF:
> +                               ctx->vp8_enc.golden_ref =3D old_a;
> +                               break;
> +                       }
> +               }
> +
> +               if (ctx->vp8_enc.refresh_alternate_frame) {
> +                       ctx->vp8_enc.alt_ref =3D ctx->vp8_enc.last_ref;
> +               } else if (ctx->vp8_enc.copy_buffer_to_alternate) {
> +                       switch (ctx->vp8_enc.copy_buffer_to_alternate) {
> +                       case V4L2_VP8_FRAME_ALTREF_KEEP:
> +                               break;
> +                       case V4L2_VP8_FRAME_ALTREF_LASTFRAME:
> +                               ctx->vp8_enc.alt_ref =3D ctx->vp8_enc.las=
t_ref;
> +                               break;
> +                       case V4L2_VP8_FRAME_ALTREF_GOLDEN:
> +                               ctx->vp8_enc.alt_ref =3D old_g;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       /* mark updated golden and alt slots used */
> +       hantro_vp8_set_bit(&ctx->vp8_enc, VP8_BIT_GOLDEN, ctx->vp8_enc.go=
lden_ref);
> +       hantro_vp8_set_bit(&ctx->vp8_enc, VP8_BIT_ALT, ctx->vp8_enc.alt_r=
ef);
> +
> +       /* find first free slot after updates */
> +       for (i =3D 0; i < ARRAY_SIZE(ctx->vp8_enc.ref_bitmaps); ++i)
> +               if (!ctx->vp8_enc.ref_bitmaps[i]) {
> +                       ctx->vp8_enc.first_free =3D i;
> +                       break;
> +               }
> +       WARN_ON(i >=3D 4);
> +
> +       ctx->vp8_enc.last_intra =3D is_intra(ctx);
> +       ++ctx->vp8_enc.frame_counter;
> +}
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h b/dr=
ivers/media/platform/verisilicon/rockchip_vpu2_regs.h
> index 49e40889545b..b68882965770 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
> @@ -258,6 +258,7 @@
>  #define     VEPU_REG_FRAME_TYPE_INTER                  (0x0 << 6)
>  #define     VEPU_REG_FRAME_TYPE_INTRA                  (0x1 << 6)
>  #define     VEPU_REG_FRAME_TYPE_MVCINTER               (0x2 << 6)
> +#define     VEPU_REG_ENCODE_FORMAT_VP8                 (0x1 << 4)      /=
* undocumented */
>  #define     VEPU_REG_ENCODE_FORMAT_JPEG                        (0x2 << 4=
)
>  #define     VEPU_REG_ENCODE_FORMAT_H264                        (0x3 << 4=
)
>  #define     VEPU_REG_ENCODE_ENABLE                     BIT(0)
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 8de6fd2e8eef..0671f1609ac4 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -56,6 +56,19 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[]=
 =3D {
>                         .step_height =3D MB_DIM,
>                 },
>         },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_VP8_FRAME,
> +               .codec_mode =3D HANTRO_MODE_VP8_ENC,
> +               .max_depth =3D 2,
> +               .frmsize =3D {
> +                       .min_width =3D 96,
> +                       .max_width =3D 1920,
> +                       .step_width =3D MB_DIM,
> +                       .min_height =3D 96,
> +                       .max_height =3D 1088,
> +                       .step_height =3D MB_DIM,
> +               },
> +       },
>  };
>
>  static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] =3D {
> @@ -350,6 +363,7 @@ static int rockchip_vpu_hw_init(struct hantro_dev *vp=
u)
>  {
>         /* Bump ACLK to max. possible freq. to improve performance. */
>         clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
> +
>         return 0;
>  }
>
> @@ -488,6 +502,13 @@ static const struct hantro_codec_ops rk3399_vpu_code=
c_ops[] =3D {
>                 .init =3D hantro_vp8_dec_init,
>                 .exit =3D hantro_vp8_dec_exit,
>         },
> +       [HANTRO_MODE_VP8_ENC] =3D {
> +               .run =3D rockchip_vpu2_vp8_enc_run,
> +               .reset =3D rockchip_vpu2_enc_reset,
> +               .init =3D hantro_vp8_enc_init,
> +               .done =3D rockchip_vpu2_vp8_enc_done,
> +               .exit =3D hantro_vp8_enc_exit,
> +       },
>  };
>
>  static const struct hantro_codec_ops rk3568_vepu_codec_ops[] =3D {
> @@ -626,7 +647,7 @@ const struct hantro_variant rk3399_vpu_variant =3D {
>         .dec_fmts =3D rk3399_vpu_dec_fmts,
>         .num_dec_fmts =3D ARRAY_SIZE(rk3399_vpu_dec_fmts),
>         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> -                HANTRO_VP8_DECODER,
> +                HANTRO_VP8_DECODER | HANTRO_VP8_ENCODER,
>         .codec_ops =3D rk3399_vpu_codec_ops,
>         .irqs =3D rockchip_vpu2_irqs,
>         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
> --
> 2.25.1
>
