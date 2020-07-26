Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330B722E308
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGZWLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgGZWLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:11:00 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB5EC0619D4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 15:10:59 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id g7so6859163ejw.12
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 15:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pwD0cUs5pdfvpFsTLUA9XdMBz1Z0n8F4cnJaers+pUc=;
        b=hyvKBF498NOPIrzCEIrYtf1nFdqxQiEcMQTIAdoN4nN5YrvqsNH86tpB+yFvbUL2dq
         djUscpAlv1OYOC2yrzPBd0g+V7pizTn0cKddHcOzeNMYmDLICIkFU7xj9bwC97PGN7Jv
         gCa0H1aAJAzE91XLFG31DS0CPWDyeCfcz9hXslCPX4AWmLSr45krXBW5g/J70DMfzA3a
         6HmhEfJqGMJ2NekRVykJRAkbEJM690LLF86u6wASXBp7IFS/KktvOHFoMFxwR63AlNR1
         7J/Wi3tQAckwLgQqD7y2Zc94aKztci773bv5l16r2r/1W+LcIg7xqvo65tD41AG2jnM5
         ETTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pwD0cUs5pdfvpFsTLUA9XdMBz1Z0n8F4cnJaers+pUc=;
        b=shYPjUJ00tYMunbYtXM9L8Y5NClBGdxogJRn3vau71QWEOrehFaB7Yjth1ZcYtiH0N
         0dNSJLfsNkt4bJ1oGizAa3BzHb0mUcNJ/kSjV1kGVd6b+Cd94sRgfRasJ9khi8mpyvkB
         SL3Ktt4GT6JmdlAGDT0605uS4c8Rlj0G8xG1y6MwBaOCtoz3VlIN1tVbfRu9KkpAQbDj
         DsqG9ywXL9j0J3b00cFCkDqQ3dxe3OXXiBnoxOern7FCDPYLN+/AlheP/Wr2qRkBYK0S
         Biz7K/jtAHyLTtiSUDzMPoW11VX/Onw0tvAWn4/H/j9TIYclF+mpmla850HzKRezuYa/
         UoCQ==
X-Gm-Message-State: AOAM530HKEYMf38gnalKVkBdeaqrUuHzAveeC4Kj9m0aDCp94TDfAmVi
        NT1LK/RzM/kWGrugyv4SS1t1PQT++n0yGveFGeYBUWLKeHw=
X-Google-Smtp-Source: ABdhPJzacapyvptMnlEEluR0EUytALmyyLfZ+B59hRICwB7G0MhEWQP0M5AwoWIx+7SjSgsriCbt8QQrmi/0aGtXjgg=
X-Received: by 2002:a17:906:74d0:: with SMTP id z16mr3339125ejl.51.1595801457720;
 Sun, 26 Jul 2020 15:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200722203909.42818-1-jernej.skrabec@siol.net>
 <CAAEAJfCdMVpnSAyn9REBCDBZKQddZDgmD1kjZ4GoPmYRQ=0toQ@mail.gmail.com> <1803845.DCBpHQD99V@jernej-laptop>
In-Reply-To: <1803845.DCBpHQD99V@jernej-laptop>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 26 Jul 2020 19:10:45 -0300
Message-ID: <CAAEAJfCGL0joJ71OnC-8W=PYAWSrg_Mt-pXK-_xE1eMF+Lvefw@mail.gmail.com>
Subject: Re: [PATCH v2] media: cedrus: Add support for VP8 decoding
To:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 26 Jul 2020 at 16:16, Jernej =C5=A0krabec <jernej.skrabec@siol.net>=
 wrote:
>
> Hi Ezequiel!
>
> Dne sobota, 25. julij 2020 ob 15:08:37 CEST je Ezequiel Garcia napisal(a)=
:
> > Hi Jernej,
> >
> > As you know, I'm not familiar with this hardware,
> > but I've tried to take a detailed look anyway.
> >
>
> Thanks, any review is welcome.
>
> > The driver looks mostly good to me, I just have
> > some minor comments.
> >
> > More importantly, seems the current uAPI
> > control is supporting this platform nicely,
> > which gives us some confidence to mark it
> > as stable.
>
> Yes, it looks pretty good in that regard.
>
> >
> > Comments below.
> >
> > On Wed, 22 Jul 2020 at 17:35, Jernej Skrabec <jernej.skrabec@siol.net>
> wrote:
> > > VP8 in Cedrus shares same engine as H264.
> > >
> > > Note that it seems necessary to call bitstream parsing functions,
> > > to parse frame header, otherwise decoded image is garbage. This is
> > > contrary to what is driver supposed to do. However, values are not
> > > really used, so this might be acceptable. It's possible that bitstrea=
m
> > > parsing functions set some internal VPU state, which is later necessa=
ry
> > > for proper decoding. Biggest suspect is "VP8 probs update" trigger.
> >
> > I suggest that you also put this explanation here, as a comment
> > in the cedrus_vp8.c
>
> Ok.
>
> >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > > Changes in v2:
> > > - rebased on top of current linux-media master branch
> > >
> > >  drivers/staging/media/sunxi/cedrus/Makefile   |   3 +-
> > >  drivers/staging/media/sunxi/cedrus/cedrus.c   |   8 +
> > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  15 +
> > >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   5 +
> > >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   1 +
> > >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  80 ++
> > >  .../staging/media/sunxi/cedrus/cedrus_video.c |   9 +
> > >  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 699 ++++++++++++++++=
++
> > >  8 files changed, 819 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/Makefile
> > > b/drivers/staging/media/sunxi/cedrus/Makefile index
> > > 1bce49d3e7e2..a647b3690bf8 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/Makefile
> > > +++ b/drivers/staging/media/sunxi/cedrus/Makefile
> > > @@ -2,4 +2,5 @@
> > >
> > >  obj-$(CONFIG_VIDEO_SUNXI_CEDRUS) +=3D sunxi-cedrus.o
> > >
> > >  sunxi-cedrus-y =3D cedrus.o cedrus_video.o cedrus_hw.o cedrus_dec.o =
\
> > >
> > > -                cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o
> > > +                cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o \
> > > +                cedrus_vp8.o
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> > > bc27f9430eeb..b2f5f03ad4a3 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > @@ -135,6 +135,13 @@ static const struct cedrus_control cedrus_contro=
ls[]
> > > =3D {>
> > >                 .codec          =3D CEDRUS_CODEC_H265,
> > >                 .required       =3D false,
> > >
> > >         },
> > >
> > > +       {
> > > +               .cfg =3D {
> > > +                       .id             =3D
> > > V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER, +               },
> > > +               .codec          =3D CEDRUS_CODEC_VP8,
> > > +               .required       =3D true,
> > > +       },
> > >
> > >  };
> > >
> > >  #define CEDRUS_CONTROLS_COUNT  ARRAY_SIZE(cedrus_controls)
> > >
> > > @@ -381,6 +388,7 @@ static int cedrus_probe(struct platform_device *p=
dev)
> > >
> > >         dev->dec_ops[CEDRUS_CODEC_MPEG2] =3D &cedrus_dec_ops_mpeg2;
> > >         dev->dec_ops[CEDRUS_CODEC_H264] =3D &cedrus_dec_ops_h264;
> > >         dev->dec_ops[CEDRUS_CODEC_H265] =3D &cedrus_dec_ops_h265;
> > >
> > > +       dev->dec_ops[CEDRUS_CODEC_VP8] =3D &cedrus_dec_ops_vp8;
> > >
> > >         mutex_init(&dev->dev_mutex);
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > > 96765555ab8a..9f4605afa0f4 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > @@ -35,6 +35,7 @@ enum cedrus_codec {
> > >
> > >         CEDRUS_CODEC_MPEG2,
> > >         CEDRUS_CODEC_H264,
> > >         CEDRUS_CODEC_H265,
> > >
> > > +       CEDRUS_CODEC_VP8,
> > >
> > >         CEDRUS_CODEC_LAST,
> > >
> > >  };
> > >
> > > @@ -75,6 +76,10 @@ struct cedrus_h265_run {
> > >
> > >         const struct v4l2_ctrl_hevc_slice_params        *slice_params=
;
> > >
> > >  };
> > >
> > > +struct cedrus_vp8_run {
> > > +       const struct v4l2_ctrl_vp8_frame_header         *slice_params=
;
> >
> > I don't think VP8 has any concept of slice, as H264 does.
> > I think it's misleading to call this parameter as slice_params.
> >
>
> frame_info perhaps? Or frame_params?
>

Either works for me.

> > > +};
> > > +
> > >
> > >  struct cedrus_run {
> > >
> > >         struct vb2_v4l2_buffer  *src;
> > >         struct vb2_v4l2_buffer  *dst;
> > >
> > > @@ -83,6 +88,7 @@ struct cedrus_run {
> > >
> > >                 struct cedrus_h264_run  h264;
> > >                 struct cedrus_mpeg2_run mpeg2;
> > >                 struct cedrus_h265_run  h265;
> > >
> > > +               struct cedrus_vp8_run   vp8;
> > >
> > >         };
> > >
> > >  };
> > >
> > > @@ -134,6 +140,14 @@ struct cedrus_ctx {
> > >
> > >                         void            *neighbor_info_buf;
> > >                         dma_addr_t      neighbor_info_buf_addr;
> > >
> > >                 } h265;
> > >
> > > +               struct {
> > > +                       unsigned int    last_frame_p_type;
> > > +                       unsigned int    last_filter_type;
> > > +                       unsigned int    last_sharpness_level;
> > > +
> > > +                       u8              *entropy_probs_buf;
> > > +                       dma_addr_t      entropy_probs_buf_dma;
> > > +               } vp8;
> > >
> > >         } codec;
> > >
> > >  };
> > >
> > > @@ -180,6 +194,7 @@ struct cedrus_dev {
> > >
> > >  extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
> > >  extern struct cedrus_dec_ops cedrus_dec_ops_h264;
> > >  extern struct cedrus_dec_ops cedrus_dec_ops_h265;
> > >
> > > +extern struct cedrus_dec_ops cedrus_dec_ops_vp8;
> > >
> > >  static inline void cedrus_write(struct cedrus_dev *dev, u32 reg, u32=
 val)
> > >  {
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > > 58c48e4fdfe9..47c079f14c74 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > @@ -68,6 +68,11 @@ void cedrus_device_run(void *priv)
> > >
> > >                         V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
> > >
> > >                 break;
> > >
> > > +       case V4L2_PIX_FMT_VP8_FRAME:
> > > +               run.vp8.slice_params =3D cedrus_find_control_data(ctx=
,
> > > +                       V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
> > > +               break;
> > > +
> > >
> > >         default:
> > >                 break;
> > >
> > >         }
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> > > 1744e6fcc999..cb8cabfc7cee 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > > @@ -48,6 +48,7 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, en=
um
> > > cedrus_codec codec)>
> > >                 break;
> > >
> > >         case CEDRUS_CODEC_H264:
> > > +       case CEDRUS_CODEC_VP8:
> > I would add a comment here mentioning
> > both codecs use the same decoding mode bit.
>
> Ok.
>
> >
> > >                 reg |=3D VE_MODE_DEC_H264;
> > >                 break;
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h index
> > > 66b152f18d17..7718c561823f 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > @@ -546,6 +546,7 @@
> > >
> > >  #define VE_H264_SHS_QP_SCALING_MATRIX_DEFAULT  BIT(24)
> > >
> > >  #define VE_H264_CTRL                   0x220
> > >
> > > +#define VE_H264_CTRL_VP8                       BIT(29)
> > >
> > >  #define VE_H264_CTRL_VLD_DATA_REQ_INT          BIT(2)
> > >  #define VE_H264_CTRL_DECODE_ERR_INT            BIT(1)
> > >  #define VE_H264_CTRL_SLICE_DECODE_INT          BIT(0)
> > >
> > > @@ -555,7 +556,12 @@
> > >
> > >                                          VE_H264_CTRL_SLICE_DECODE_IN=
T)
> > >
> > >  #define VE_H264_TRIGGER_TYPE           0x224
> > >
> > > +#define VE_H264_TRIGGER_TYPE_PROBABILITY(x)    SHIFT_AND_MASK_BITS(x=
, 31,
> > > 24) +#define VE_H264_TRIGGER_TYPE_BIN_LENS(x)
> > > SHIFT_AND_MASK_BITS((x) - 1, 18, 16)>
> > >  #define VE_H264_TRIGGER_TYPE_N_BITS(x)         (((x) & 0x3f) << 8)
> > >
> > > +#define VE_H264_TRIGGER_TYPE_VP8_GET_BITS      (15 << 0)
> > > +#define VE_H264_TRIGGER_TYPE_VP8_UPDATE_COEF   (14 << 0)
> > > +#define VE_H264_TRIGGER_TYPE_VP8_SLICE_DECODE  (10 << 0)
> > >
> > >  #define VE_H264_TRIGGER_TYPE_AVC_SLICE_DECODE  (8 << 0)
> > >  #define VE_H264_TRIGGER_TYPE_INIT_SWDEC                (7 << 0)
> > >  #define VE_H264_TRIGGER_TYPE_FLUSH_BITS                (3 << 0)
> > >
> > > @@ -565,6 +571,7 @@
> > >
> > >  #define VE_H264_STATUS_DECODE_ERR_INT
> > >  VE_H264_CTRL_DECODE_ERR_INT
> > >  #define VE_H264_STATUS_SLICE_DECODE_INT
> > >  VE_H264_CTRL_SLICE_DECODE_INT #define VE_H264_STATUS_VLD_BUSY
> > >              BIT(8)
> > >
> > > +#define VE_H264_STATUS_VP8_UPPROB_BUSY         BIT(17)
> > >
> > >  #define VE_H264_STATUS_INT_MASK
> > >  VE_H264_CTRL_INT_MASK
> > Why not just using VE_H264_CTRL_INT_MASK?
> >
> > Having an alias looks confusing.
>
> This is not my change so I suggest to address it later.
>
> >
> > > @@ -583,10 +590,83 @@
> > >
> > >  #define VE_H264_OUTPUT_FRAME_IDX       0x24c
> > >  #define VE_H264_EXTRA_BUFFER1          0x250
> > >  #define VE_H264_EXTRA_BUFFER2          0x254
> > >
> > > +#define VE_H264_MB_ADDR                        0x260
> > > +#define VE_H264_ERROR_CASE             0x2b8
> > >
> > >  #define VE_H264_BASIC_BITS             0x2dc
> > >  #define VE_AVC_SRAM_PORT_OFFSET                0x2e0
> > >  #define VE_AVC_SRAM_PORT_DATA          0x2e4
> > >
> > > +#define VE_VP8_PPS                     0x214
> > > +#define VE_VP8_PPS_PIC_TYPE_P_FRAME            BIT(31)
> > > +#define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)     SHIFT_AND_MASK_BITS(v=
, 30,
> > > 28) +#define VE_VP8_PPS_LAST_PIC_TYPE_P_FRAME       BIT(27)
> > > +#define VE_VP8_PPS_ALTREF_SIGN_BIAS            BIT(26)
> > > +#define VE_VP8_PPS_GOLDEN_SIGN_BIAS            BIT(25)
> > > +#define VE_VP8_PPS_RELOAD_ENTROPY_PROBS                BIT(24)
> > > +#define VE_VP8_PPS_REFRESH_ENTROPY_PROBS       BIT(23)
> > > +#define VE_VP8_PPS_MB_NO_COEFF_SKIP            BIT(22)
> > > +#define VE_VP8_PPS_TOKEN_PARTITION(v)          SHIFT_AND_MASK_BITS(v=
, 21,
> > > 20) +#define VE_VP8_PPS_MODE_REF_LF_DELTA_UPDATE    BIT(19)
> > > +#define VE_VP8_PPS_MODE_REF_LF_DELTA_ENABLE    BIT(18)
> > > +#define VE_VP8_PPS_LOOP_FILTER_LEVEL(v)
> > > SHIFT_AND_MASK_BITS(v, 17, 12) +#define VE_VP8_PPS_LOOP_FILTER_SIMPLE
> > >      BIT(11)
> > > +#define VE_VP8_PPS_SHARPNESS_LEVEL(v)          SHIFT_AND_MASK_BITS(v=
, 10,
> > > 8) +#define VE_VP8_PPS_LAST_LOOP_FILTER_SIMPLE     BIT(7)
> > > +#define VE_VP8_PPS_SEGMENTATION_ENABLE         BIT(6)
> > > +#define VE_VP8_PPS_MB_SEGMENT_ABS_DELTA                BIT(5)
> > > +#define VE_VP8_PPS_UPDATE_MB_SEGMENTATION_MAP  BIT(4)
> > > +#define VE_VP8_PPS_FULL_PIXEL                  BIT(3)
> > > +#define VE_VP8_PPS_BILINEAR_MC_FILTER          BIT(2)
> > > +#define VE_VP8_PPS_FILTER_TYPE_SIMPLE          BIT(1)
> > > +#define VE_VP8_PPS_LPF_DISABLE                 BIT(0)
> > > +
> > > +#define VE_VP8_QP_INDEX_DELTA          0x218
> > > +#define VE_VP8_QP_INDEX_DELTA_UVAC(v)          SHIFT_AND_MASK_BITS(v=
, 31,
> > > 27) +#define VE_VP8_QP_INDEX_DELTA_UVDC(v)
> > > SHIFT_AND_MASK_BITS(v, 26, 22) +#define VE_VP8_QP_INDEX_DELTA_Y2AC(v)
> > >      SHIFT_AND_MASK_BITS(v, 21, 17) +#define
> > > VE_VP8_QP_INDEX_DELTA_Y2DC(v)          SHIFT_AND_MASK_BITS(v, 16, 12)
> > > +#define VE_VP8_QP_INDEX_DELTA_Y1DC(v)          SHIFT_AND_MASK_BITS(v=
,
> > > 11, 7) +#define VE_VP8_QP_INDEX_DELTA_BASE_QINDEX(v)
> > > SHIFT_AND_MASK_BITS(v, 6, 0) +
> > > +#define VE_VP8_PART_SIZE_OFFSET                0x21c
> > > +#define VE_VP8_ENTROPY_PROBS_ADDR      0x250
> > > +#define VE_VP8_FIRST_DATA_PART_LEN     0x254
> > > +
> > > +#define VE_VP8_FSIZE                   0x258
> > > +#define VE_VP8_FSIZE_WIDTH(w) \
> > > +       SHIFT_AND_MASK_BITS(DIV_ROUND_UP(w, 16), 15, 8)
> > > +#define VE_VP8_FSIZE_HEIGHT(h) \
> > > +       SHIFT_AND_MASK_BITS(DIV_ROUND_UP(h, 16), 7, 0)
> > > +
> > > +#define VE_VP8_PICSIZE                 0x25c
> > > +#define VE_VP8_PICSIZE_WIDTH(w)
> > > SHIFT_AND_MASK_BITS(w, 27, 16) +#define VE_VP8_PICSIZE_HEIGHT(h)
> > >      SHIFT_AND_MASK_BITS(h, 11, 0) +
> > > +#define VE_VP8_REC_LUMA                        0x2ac
> > > +#define VE_VP8_FWD_LUMA                        0x2b0
> > > +#define VE_VP8_BWD_LUMA                        0x2b4
> > > +#define VE_VP8_REC_CHROMA              0x2d0
> > > +#define VE_VP8_FWD_CHROMA              0x2d4
> > > +#define VE_VP8_BWD_CHROMA              0x2d8
> > > +#define VE_VP8_ALT_LUMA                        0x2e8
> > > +#define VE_VP8_ALT_CHROMA              0x2ec
> > > +
> > > +#define VE_VP8_SEGMENT_FEAT_MB_LV0     0x2f0
> > > +#define VE_VP8_SEGMENT_FEAT_MB_LV1     0x2f4
> > > +
> > > +#define VE_VP8_SEGMENT3(v)                     SHIFT_AND_MASK_BITS(v=
, 31,
> > > 24) +#define VE_VP8_SEGMENT2(v)
> > > SHIFT_AND_MASK_BITS(v, 23, 16) +#define VE_VP8_SEGMENT1(v)
> > >      SHIFT_AND_MASK_BITS(v, 15, 8) +#define VE_VP8_SEGMENT0(v)
> > >          SHIFT_AND_MASK_BITS(v, 7, 0) +
> > > +#define VE_VP8_REF_LF_DELTA            0x2f8
> > > +#define VE_VP8_MODE_LF_DELTA           0x2fc
> > > +
> > > +#define VE_VP8_LF_DELTA3(v)                    SHIFT_AND_MASK_BITS(v=
, 30,
> > > 24) +#define VE_VP8_LF_DELTA2(v)
> > > SHIFT_AND_MASK_BITS(v, 22, 16) +#define VE_VP8_LF_DELTA1(v)
> > >      SHIFT_AND_MASK_BITS(v, 14, 8) +#define VE_VP8_LF_DELTA0(v)
> > >          SHIFT_AND_MASK_BITS(v, 6, 0) +
> > >
> > >  #define VE_ISP_INPUT_SIZE              0xa00
> > >  #define VE_ISP_INPUT_STRIDE            0xa04
> > >  #define VE_ISP_CTRL                    0xa08
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> > > 16d82309e7b6..0212054484dd 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > @@ -48,6 +48,10 @@ static struct cedrus_format cedrus_formats[] =3D {
> > >
> > >                 .directions     =3D CEDRUS_DECODE_SRC,
> > >                 .capabilities   =3D CEDRUS_CAPABILITY_H265_DEC,
> > >
> > >         },
> > >
> > > +       {
> > > +               .pixelformat    =3D V4L2_PIX_FMT_VP8_FRAME,
> > > +               .directions     =3D CEDRUS_DECODE_SRC,
> > > +       },
> > >
> > >         {
> > >
> > >                 .pixelformat    =3D V4L2_PIX_FMT_SUNXI_TILED_NV12,
> > >                 .directions     =3D CEDRUS_DECODE_DST,
> > >
> > > @@ -110,6 +114,7 @@ void cedrus_prepare_format(struct v4l2_pix_format
> > > *pix_fmt)>
> > >         case V4L2_PIX_FMT_MPEG2_SLICE:
> > >         case V4L2_PIX_FMT_H264_SLICE:
> > >
> > >         case V4L2_PIX_FMT_HEVC_SLICE:
> > > +       case V4L2_PIX_FMT_VP8_FRAME:
> > >                 /* Zero bytes per line for encoded source. */
> > >                 bytesperline =3D 0;
> > >                 /* Choose some minimum size since this can't be 0 */
> > >
> > > @@ -448,6 +453,10 @@ static int cedrus_start_streaming(struct vb2_que=
ue
> > > *vq, unsigned int count)>
> > >                 ctx->current_codec =3D CEDRUS_CODEC_H265;
> > >                 break;
> > >
> > > +       case V4L2_PIX_FMT_VP8_FRAME:
> > > +               ctx->current_codec =3D CEDRUS_CODEC_VP8;
> > > +               break;
> > > +
> > >
> > >         default:
> > >                 return -EINVAL;
> > >
> > >         }
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c new file mode 10064=
4
> > > index 000000000000..93beffd07c35
> > > --- /dev/null
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> > > @@ -0,0 +1,699 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Cedrus VPU driver
> > > + *
> > > + * Copyright (c) 2019 Jernej Skrabec <jernej.skrabec@siol.net>
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include <media/videobuf2-dma-contig.h>
> > > +
> > > +#include "cedrus.h"
> > > +#include "cedrus_hw.h"
> > > +#include "cedrus_regs.h"
> > > +
> > > +#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
> > > +#define VP8_PROB_HALF 128
> > > +
> > > +static const u8 prob_table_init[] =3D {
> >
> > What's this prob_table_init and where
> > are the values coming from?
> >
> > Doesn't seem like coming from the spec.
>
> Well, that's good question. Actually, this structure consists from severa=
l
> arrays defined in VP8. See https://bitbucket.org/paullo612/cedarx-vp8-tes=
t/src/
> default/src/vp8.c function fill_probs_table(). It's my understanding that=
 this
> was reverse engineered from CedarX binary library. Instead of building ar=
ray
> every time codec is started, I just precomputed it. I agree that it needs=
 some
> explanation.
>

I wonder if we can at least point out that it comes from a reverse
engineering effort.


> >
> > > +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xB0, 0=
xF6,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xDF, 0xF1, 0xFC, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xF9, 0xFD, 0=
xFD,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xF4, 0xFC, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xEA, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xF6, 0xFE, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xEF, 0=
xFD,
> > > 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFE, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFF, 0xF8, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFB, 0xFF, 0xFE, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFD, 0xFE, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFB, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFE, 0=
xFF,
> > > 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFE, 0=
xFD,
> > > 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFA, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xD9, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xE1, 0xFC, 0=
xF1,
> > > 0xFD, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xEA, 0xFA, 0xF1, 0xFA, 0xFD, 0xFF, 0xFD, 0xFE, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xDF, 0xFE, 0xFE, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xEE,
> > > 0xFD, 0xFE, 0xFE, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0=
xF8,
> > > 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xF9, 0xFE, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFD, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xF7, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFD, 0xFE, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFC, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFF, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFE, 0xFD, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFA, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFE, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xBA, 0xFB, 0xFA, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xEA,
> > > 0xFB, 0xF4, 0xFE, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFB, 0xFB, 0xF3, 0xFD, 0xFE, 0xFF, 0=
xFE,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFF, 0xFD, 0xFE, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xEC, 0xFD, 0=
xFE,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFB, 0xFD, 0xFD, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0=
xFE,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xFE, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xF8, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFA, 0xFE, 0xFC, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xFE, 0xF9, 0xFD, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFD, 0xFD, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xF6,
> > > 0xFD, 0xFD, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFC, 0xFE, 0xFB, 0xFE, 0xFE, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFF, 0xFE, 0xFC, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xF8, 0xFE, 0=
xFD,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFD, 0xFF, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFB, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xF5, 0xFB, 0xFE, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
xFD,
> > > 0xFD, 0xFE, 0xFF, +       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0=
xFB,
> > > 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFC, 0xFD, 0xFE, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFE, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFC, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xF9, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0xFF, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0x00, +       0x00, 0x00, 0x00, 0x00, 0xFA, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, +       0xFF, 0xFF, 0xFF, 0=
xFF,
> > > 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, +       0=
xFF,
> > > 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, +
> > > 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF=
F,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x91,
> > > 0x9C, 0xA3, 0x80, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x6F, 0x96, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x78, 0x5A, 0x4F, 0x85, 0x57, 0x55, 0x50, 0x6=
F, +
> > >       0x97, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x93, 0x88, 0x12, 0x00, 0x6A, 0x91, 0x01, 0x00, 0=
xB3,
> > > 0x79, 0x01, 0x00, +       0xDF, 0x01, 0x22, 0x00, 0xD0, 0x01, 0x01, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x07, 0x01, 0x01, 0x8F, +       0x0E, 0x12, 0x0E, 0x6B, 0x87, 0=
x40,
> > > 0x39, 0x44, 0x3C, 0x38, 0x80, 0x41, +       0x9F, 0x86, 0x80, 0x22, 0=
xEA,
> > > 0xBC, 0x80, 0x1C, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, +
> > >       0x84, 0x02, 0x04, 0x06, 0x80, 0x81, 0x82, 0x83, 0x80, 0x02, 0x0=
4,
> > > 0x06, +       0x81, 0x82, 0x83, 0x84, 0x80, 0x02, 0x81, 0x04, 0x82, 0=
x83,
> > > 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x02, 0x08, +       0x04, 0x06, 0x80, 0x81, 0x82, 0x83, 0x0A, 0=
x0C,
> > > 0x84, 0x85, 0x86, 0x87, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x02, 0x08, 0x04, 0x06, 0x80, 0x81, +       0x82, 0x83, 0x0A, 0x0C, 0=
x84,
> > > 0x85, 0x86, 0x87, 0x00, 0x00, 0x00, 0x00, +       0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +       0x83, 0x02, 0=
x82,
> > > 0x04, 0x80, 0x81, 0x00, 0x00, 0x80, 0x02, 0x81, 0x04, +       0x82, 0=
x06,
> > > 0x08, 0x0C, 0x83, 0x0A, 0x85, 0x86, 0x84, 0x0E, 0x87, 0x10, +       0=
x88,
> > > 0x89, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, +
> > > 0x00, 0x00, 0x00, 0x00, 0x8A, 0x02, 0x8B, 0x04, 0x8C, 0x8D, 0x00, 0x0=
0, +
> > >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > > 0x00, +       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > > 0x00, 0x00, +       0x87, 0x02, 0x85, 0x04, 0x86, 0x06, 0x88, 0x89,
> > > +};
> > > +
> > > +static const u8 vp8_mv_update_prob[2][19] =3D {
> >
> > Seems like the V4L2 VP8 uapi header should
> > #define MV_PROB_CNT 19 so you could use it through
> > the driver.
>
> Ok.
>
> >
> > Also, these look like k_mv_entropy_update_probs,
> > could you add a comment here about this?
>
> Well, this table can even go in common header... I'm not sure how many fu=
ture
> codecs would need it. For now, it can stay here but maybe renaming it to
> vp8_k_mv_entropy_update_probs would be enough (instead of comment)?
>

How about both? Comments are free :-)

> >
> > > +       { 237, 246, 253, 253, 254, 254, 254, 254, 254,
> > > +         254, 254, 254, 254, 254, 250, 250, 252, 254, 254 },
> > > +       { 231, 243, 245, 253, 254, 254, 254, 254, 254,
> > > +         254, 254, 254, 254, 254, 251, 251, 254, 254, 254 }
> > > +};
> > > +
> > > +static uint8_t read_bits(struct cedrus_dev *dev, unsigned int bits_c=
ount,
> > > +                        unsigned int probability)
> > > +{
> > > +       cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> > > +                    VE_H264_TRIGGER_TYPE_VP8_GET_BITS |
> > > +                    VE_H264_TRIGGER_TYPE_BIN_LENS(bits_count) |
> > > +                    VE_H264_TRIGGER_TYPE_PROBABILITY(probability));
> > > +
> > > +       while (cedrus_read(dev, VE_H264_STATUS) & VE_H264_STATUS_VLD_=
BUSY)
> > > +               ;
> > > +
> >
> > You can abstract this as cedrus_wait_for(flag),
> > which should be based on readl_poll_timeout_atomic.
> >
> > The flag argument would be VE_H264_STATUS_VP8_UPPROB_BUSY
> > or VE_H264_STATUS_VLD_BUSY. This way it'll be cleaner
> > and you don't risk deadlocks if the hardware goes nuts.
>
> Good idea.
>
> >
> > > +       return cedrus_read(dev, VE_H264_BASIC_BITS);
> > > +}
> > > +
> > > +static void get_delta_q(struct cedrus_dev *dev)
> > > +{
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +               read_bits(dev, 4, VP8_PROB_HALF);
> > > +               read_bits(dev, 1, VP8_PROB_HALF);
> > > +       }
> > > +}
> > > +
> > > +static void process_segmentation_info(struct cedrus_dev *dev)
> > > +{
> > > +       int update =3D read_bits(dev, 1, VP8_PROB_HALF);
> > > +       int i;
> > > +
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +               read_bits(dev, 1, VP8_PROB_HALF);
> > > +
> > > +               for (i =3D 0; i < 4; i++)
> > > +                       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                               read_bits(dev, 7, VP8_PROB_HALF);
> > > +                               read_bits(dev, 1, VP8_PROB_HALF);
> > > +                       }
> > > +
> > > +               for (i =3D 0; i < 4; i++)
> > > +                       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                               read_bits(dev, 6, VP8_PROB_HALF);
> > > +                               read_bits(dev, 1, VP8_PROB_HALF);
> > > +                       }
> > > +       }
> > > +
> > > +       if (update)
> > > +               for (i =3D 0; i < 3; i++)
> > > +                       if (read_bits(dev, 1, VP8_PROB_HALF))
> > > +                               read_bits(dev, 8, VP8_PROB_HALF);
> > > +}
> > > +
> > > +static void process_ref_lf_delta_info(struct cedrus_dev *dev)
> > > +{
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +               int i;
> > > +
> > > +               for (i =3D 0; i < 4; i++)
> > > +                       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                               read_bits(dev, 6, VP8_PROB_HALF);
> > > +                               read_bits(dev, 1, VP8_PROB_HALF);
> > > +                       }
> > > +
> > > +               for (i =3D 0; i < 4; i++)
> > > +                       if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                               read_bits(dev, 6, VP8_PROB_HALF);
> > > +                               read_bits(dev, 1, VP8_PROB_HALF);
> > > +                       }
> > > +       }
> > > +}
> > > +
> > > +static void process_ref_frame_info(struct cedrus_dev *dev)
> > > +{
> > > +       u8 refresh_golden_frame =3D read_bits(dev, 1, VP8_PROB_HALF);
> > > +       u8 refresh_alt_ref_frame =3D read_bits(dev, 1, VP8_PROB_HALF)=
;
> > > +
> > > +       if (!refresh_golden_frame)
> > > +               read_bits(dev, 2, VP8_PROB_HALF);
> > > +
> > > +       if (!refresh_alt_ref_frame)
> > > +               read_bits(dev, 2, VP8_PROB_HALF);
> > > +
> > > +       read_bits(dev, 1, VP8_PROB_HALF);
> > > +       read_bits(dev, 1, VP8_PROB_HALF);
> > > +}
> > > +
> > > +static void cedrus_read_header(struct cedrus_dev *dev,
> > > +                              const struct v4l2_ctrl_vp8_frame_heade=
r
> > > *slice) +{
> > > +       int i, j;
> > > +
> > > +       if (VP8_FRAME_IS_KEY_FRAME(slice)) {
> > > +               read_bits(dev, 1, VP8_PROB_HALF);
> > > +               read_bits(dev, 1, VP8_PROB_HALF);
> > > +       }
> > > +
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF))
> > > +               process_segmentation_info(dev);
> > > +
> > > +       read_bits(dev, 1, VP8_PROB_HALF);
> > > +       read_bits(dev, 6, VP8_PROB_HALF);
> > > +       read_bits(dev, 3, VP8_PROB_HALF);
> > > +
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF))
> > > +               process_ref_lf_delta_info(dev);
> > > +
> > > +       read_bits(dev, 2, VP8_PROB_HALF);

Answering below's question,
I would add a comment here:

/* y_ac_qi */

> > > +       read_bits(dev, 7, VP8_PROB_HALF);
> > > +
> > > +       get_delta_q(dev);
> > > +       get_delta_q(dev);
> > > +       get_delta_q(dev);
> > > +       get_delta_q(dev);
> > > +       get_delta_q(dev);
> > > +
> >
> > for loop?
>
> Ok but would be 5 some macro? If so, what should be it's name?
>

Well, perhaps QUANT_DELTA_COUNT ?

And maybe a small comment (together with the
one above) to clarify this is just parsing
y_dc_delta, y2_dc_delta, ... and so on.

> >
> > > +       if (!VP8_FRAME_IS_KEY_FRAME(slice))
> > > +               process_ref_frame_info(dev);
> > > +
> > > +       read_bits(dev, 1, VP8_PROB_HALF);
> > > +
> > > +       if (!VP8_FRAME_IS_KEY_FRAME(slice))
> > > +               read_bits(dev, 1, VP8_PROB_HALF);
> > > +
> > > +       cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> > > VE_H264_TRIGGER_TYPE_VP8_UPDATE_COEF); +       while (cedrus_read(dev=
,
> > > VE_H264_STATUS) & VE_H264_STATUS_VP8_UPPROB_BUSY) +               ;
> > > +
> > > +       cedrus_write(dev, VE_H264_STATUS, VE_H264_CTRL_INT_MASK);
> > > +
> >
> > This one looks like cedrus_vp8_irq_clear function, maybe just
> > call that instead.
>
> Ok.
>
> >
> > > +       if (read_bits(dev, 1, VP8_PROB_HALF))
> > > +               read_bits(dev, 8, VP8_PROB_HALF);
> > > +
> > > +       if (!VP8_FRAME_IS_KEY_FRAME(slice)) {
> > > +               read_bits(dev, 8, VP8_PROB_HALF);
> > > +               read_bits(dev, 8, VP8_PROB_HALF);
> > > +               read_bits(dev, 8, VP8_PROB_HALF);
> > > +
> > > +               if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +               }
> > > +
> > > +               if (read_bits(dev, 1, VP8_PROB_HALF)) {
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +                       read_bits(dev, 8, VP8_PROB_HALF);
> > > +               }
> > > +
> > > +               for (i =3D 0; i < 2; i++)
> > > +                       for (j =3D 0; j < 19; j++)
> > > +                               if (read_bits(dev, 1,
> > > vp8_mv_update_prob[i][j])) +
> > > read_bits(dev, 7, VP8_PROB_HALF); +       }
> > > +}
> > > +
> > > +static void cedrus_vp8_update_probs(const struct
> > > v4l2_ctrl_vp8_frame_header *slice, +                                 =
  u8
> > > *prob_table)
> > > +{
> > > +       int i, j, k;
> > > +
> > > +       memcpy(&prob_table[0x1008], slice->entropy_header.y_mode_prob=
s,
> > > 4);
> > > +       memcpy(&prob_table[0x1010], slice->entropy_header.uv_mode_pro=
bs,
> > > 3); +
> >
> > Use sizeof instead of hardcoding the size?
>
> Ok.
>
> >
> > > +       memcpy(&prob_table[0x1018], slice->segment_header.segment_pro=
bs,
> > > 3); +
> > > +       prob_table[0x101c] =3D slice->prob_skip_false;
> > > +       prob_table[0x101d] =3D slice->prob_intra;
> > > +       prob_table[0x101e] =3D slice->prob_last;
> > > +       prob_table[0x101f] =3D slice->prob_gf;
> > > +
> > > +       memcpy(&prob_table[0x1020], slice->entropy_header.mv_probs[0]=
,
> > > 19);
> > > +       memcpy(&prob_table[0x1040], slice->entropy_header.mv_probs[1]=
,
> > > 19);
> > > +
> > > +       for (i =3D 0; i < 4; ++i)
> > > +               for (j =3D 0; j < 8; ++j)
> > > +                       for (k =3D 0; k < 3; ++k)
> > > +                               memcpy(&prob_table[i * 512 + j * 64 +=
 k *
> > > 16], +
> > > slice->entropy_header.coeff_probs[i][j][k], 11); +}
> > > +
> > > +static enum cedrus_irq_status
> > > +cedrus_vp8_irq_status(struct cedrus_ctx *ctx)
> > > +{
> > > +       struct cedrus_dev *dev =3D ctx->dev;
> > > +       u32 reg =3D cedrus_read(dev, VE_H264_STATUS);
> > > +
> > > +       if (reg & (VE_H264_STATUS_DECODE_ERR_INT |
> > > +                  VE_H264_STATUS_VLD_DATA_REQ_INT))
> > > +               return CEDRUS_IRQ_ERROR;
> > > +
> > > +       if (reg & VE_H264_CTRL_SLICE_DECODE_INT)
> > > +               return CEDRUS_IRQ_OK;
> > > +
> > > +       return CEDRUS_IRQ_NONE;
> > > +}
> > > +
> > > +static void cedrus_vp8_irq_clear(struct cedrus_ctx *ctx)
> > > +{
> > > +       struct cedrus_dev *dev =3D ctx->dev;
> > > +
> > > +       cedrus_write(dev, VE_H264_STATUS,
> > > +                    VE_H264_STATUS_INT_MASK);
> > > +}
> > > +
> > > +static void cedrus_vp8_irq_disable(struct cedrus_ctx *ctx)
> > > +{
> > > +       struct cedrus_dev *dev =3D ctx->dev;
> > > +       u32 reg =3D cedrus_read(dev, VE_H264_CTRL);
> > > +
> > > +       cedrus_write(dev, VE_H264_CTRL,
> > > +                    reg & ~VE_H264_CTRL_INT_MASK);
> > > +}
> > > +
> > > +static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
> > > +                            struct cedrus_run *run)
> > > +{
> > > +       const struct v4l2_ctrl_vp8_frame_header *slice =3D
> > > run->vp8.slice_params; +       struct vb2_queue *cap_q =3D
> > > &ctx->fh.m2m_ctx->cap_q_ctx.q;
> > > +       struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
> > > +       struct cedrus_dev *dev =3D ctx->dev;
> > > +       dma_addr_t luma_addr, chroma_addr;
> > > +       dma_addr_t src_buf_addr;
> > > +       int header_size;
> > > +       int qindex;
> > > +       u32 reg;
> > > +
> > > +       cedrus_engine_enable(ctx, CEDRUS_CODEC_VP8);
> > > +
> > > +       cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
> > > +
> > > +       cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_b=
uf);
> > > +
> > > +       reg =3D slice->first_part_size * 8;
> > > +       cedrus_write(dev, VE_VP8_FIRST_DATA_PART_LEN, reg);
> > > +
> > > +       header_size =3D VP8_FRAME_IS_KEY_FRAME(slice) ? 10 : 3;
> > > +
> > > +       reg =3D slice->first_part_size + header_size;
> > > +       cedrus_write(dev, VE_VP8_PART_SIZE_OFFSET, reg);
> > > +
> > > +       reg =3D vb2_plane_size(src_buf, 0) * 8;
> > > +       cedrus_write(dev, VE_H264_VLD_LEN, reg);
> > > +
> > > +       /*
> > > +        * FIXME: There is a problem if frame header is skipped (addi=
ng
> > > +        * first_part_header_bits to offset). It seems that functions
> > > +        * for parsing bitstreams change internal state of VPU in som=
e
> > > +        * way that can't be otherwise set. Maybe this can be bypasse=
d
> > > +        * by somehow fixing probability table buffer?
> > > +        */
> > > +       reg =3D header_size * 8;
> > > +       cedrus_write(dev, VE_H264_VLD_OFFSET, reg);
> > > +
> > > +       src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > +       cedrus_write(dev, VE_H264_VLD_END,
> > > +                    src_buf_addr + vb2_get_plane_payload(src_buf, 0)=
);
> > > +       cedrus_write(dev, VE_H264_VLD_ADDR,
> > > +                    VE_H264_VLD_ADDR_VAL(src_buf_addr) |
> > > +                    VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID =
|
> > > +                    VE_H264_VLD_ADDR_LAST);
> > > +
> > > +       cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> > > +                    VE_H264_TRIGGER_TYPE_INIT_SWDEC);
> > > +
> > > +       cedrus_write(dev, VE_VP8_ENTROPY_PROBS_ADDR,
> > > +                    ctx->codec.vp8.entropy_probs_buf_dma);
> > > +
> > > +       reg =3D 0;
> > > +       switch (slice->version) {
> > > +       case 1:
> > > +               reg |=3D VE_VP8_PPS_FILTER_TYPE_SIMPLE;
> > > +               reg |=3D VE_VP8_PPS_BILINEAR_MC_FILTER;
> > > +               break;
> > > +       case 2:
> > > +               reg |=3D VE_VP8_PPS_LPF_DISABLE;
> > > +               reg |=3D VE_VP8_PPS_BILINEAR_MC_FILTER;
> > > +               break;
> > > +       case 3:
> > > +               reg |=3D VE_VP8_PPS_LPF_DISABLE;
> > > +               reg |=3D VE_VP8_PPS_FULL_PIXEL;
> > > +               break;
> > > +       }
> > > +       if (slice->segment_header.flags &
> > > V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP) +               reg |=3D
> > > VE_VP8_PPS_UPDATE_MB_SEGMENTATION_MAP;
> > > +       if (!(slice->segment_header.flags &
> > > V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE)) +               reg |=
=3D
> > > VE_VP8_PPS_MB_SEGMENT_ABS_DELTA;
> > > +       if (slice->segment_header.flags &
> > > V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED) +               reg |=3D
> > > VE_VP8_PPS_SEGMENTATION_ENABLE;
> > > +       if (ctx->codec.vp8.last_filter_type)
> > > +               reg |=3D VE_VP8_PPS_LAST_LOOP_FILTER_SIMPLE;
> > > +       reg |=3D
> > > VE_VP8_PPS_SHARPNESS_LEVEL(slice->lf_header.sharpness_level); +      =
 if
> > > (slice->lf_header.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE) +
> > > reg |=3D VE_VP8_PPS_LOOP_FILTER_SIMPLE;
> > > +       reg |=3D VE_VP8_PPS_LOOP_FILTER_LEVEL(slice->lf_header.level)=
;
> > > +       if (slice->lf_header.flags & V4L2_VP8_LF_HEADER_ADJ_ENABLE)
> > > +               reg |=3D VE_VP8_PPS_MODE_REF_LF_DELTA_ENABLE;
> > > +       if (slice->lf_header.flags & V4L2_VP8_LF_HEADER_DELTA_UPDATE)
> > > +               reg |=3D VE_VP8_PPS_MODE_REF_LF_DELTA_UPDATE;
> > > +       reg |=3D VE_VP8_PPS_TOKEN_PARTITION(ilog2(slice->num_dct_part=
s));
> > > +       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEF=
F)
> > > +               reg |=3D VE_VP8_PPS_MB_NO_COEFF_SKIP;
> > > +       reg |=3D VE_VP8_PPS_RELOAD_ENTROPY_PROBS;
> > > +       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDE=
N)
> > > +               reg |=3D VE_VP8_PPS_GOLDEN_SIGN_BIAS;
> > > +       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT)
> > > +               reg |=3D VE_VP8_PPS_ALTREF_SIGN_BIAS;
> > > +       if (ctx->codec.vp8.last_frame_p_type)
> > > +               reg |=3D VE_VP8_PPS_LAST_PIC_TYPE_P_FRAME;
> > > +       reg |=3D
> > > VE_VP8_PPS_LAST_SHARPNESS_LEVEL(ctx->codec.vp8.last_sharpness_level);=
 +
> > >     if (!(slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME)) +
> > >       reg |=3D VE_VP8_PPS_PIC_TYPE_P_FRAME;
> > > +       cedrus_write(dev, VE_VP8_PPS, reg);
> > > +
> > > +       cedrus_read_header(dev, slice);
> > > +
> > > +       /* reset registers changed by HW */
> > > +       cedrus_write(dev, VE_H264_CUR_MB_NUM, 0);
> > > +       cedrus_write(dev, VE_H264_MB_ADDR, 0);
> > > +       cedrus_write(dev, VE_H264_ERROR_CASE, 0);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D
> > > VE_VP8_QP_INDEX_DELTA_UVAC(slice->quant_header.uv_ac_delta);
> > > +       reg |=3D
> > > VE_VP8_QP_INDEX_DELTA_UVDC(slice->quant_header.uv_dc_delta);
> > > +       reg |=3D
> > > VE_VP8_QP_INDEX_DELTA_Y2AC(slice->quant_header.y2_ac_delta);
> > > +       reg |=3D
> > > VE_VP8_QP_INDEX_DELTA_Y2DC(slice->quant_header.y2_dc_delta);
> > > +       reg |=3D VE_VP8_QP_INDEX_DELTA_Y1DC(slice->quant_header.y_dc_=
delta);
> > > +       reg |=3D
> > > VE_VP8_QP_INDEX_DELTA_BASE_QINDEX(slice->quant_header.y_ac_qi); +
> > > cedrus_write(dev, VE_VP8_QP_INDEX_DELTA, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_FSIZE_WIDTH(slice->width);
> > > +       reg |=3D VE_VP8_FSIZE_HEIGHT(slice->height);
> > > +       cedrus_write(dev, VE_VP8_FSIZE, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_PICSIZE_WIDTH(slice->width);
> > > +       reg |=3D VE_VP8_PICSIZE_HEIGHT(slice->height);
> > > +       cedrus_write(dev, VE_VP8_PICSIZE, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_SEGMENT3(slice->segment_header.quant_update[3=
]);
> > > +       reg |=3D VE_VP8_SEGMENT2(slice->segment_header.quant_update[2=
]);
> > > +       reg |=3D VE_VP8_SEGMENT1(slice->segment_header.quant_update[1=
]);
> > > +       reg |=3D VE_VP8_SEGMENT0(slice->segment_header.quant_update[0=
]);
> > > +       cedrus_write(dev, VE_VP8_SEGMENT_FEAT_MB_LV0, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_SEGMENT3(slice->segment_header.lf_update[3]);
> > > +       reg |=3D VE_VP8_SEGMENT2(slice->segment_header.lf_update[2]);
> > > +       reg |=3D VE_VP8_SEGMENT1(slice->segment_header.lf_update[1]);
> > > +       reg |=3D VE_VP8_SEGMENT0(slice->segment_header.lf_update[0]);
> > > +       cedrus_write(dev, VE_VP8_SEGMENT_FEAT_MB_LV1, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_LF_DELTA3(slice->lf_header.ref_frm_delta[3]);
> > > +       reg |=3D VE_VP8_LF_DELTA2(slice->lf_header.ref_frm_delta[2]);
> > > +       reg |=3D VE_VP8_LF_DELTA1(slice->lf_header.ref_frm_delta[1]);
> > > +       reg |=3D VE_VP8_LF_DELTA0(slice->lf_header.ref_frm_delta[0]);
> > > +       cedrus_write(dev, VE_VP8_REF_LF_DELTA, reg);
> > > +
> > > +       reg =3D 0;
> > > +       reg |=3D VE_VP8_LF_DELTA3(slice->lf_header.mb_mode_delta[3]);
> > > +       reg |=3D VE_VP8_LF_DELTA2(slice->lf_header.mb_mode_delta[2]);
> > > +       reg |=3D VE_VP8_LF_DELTA1(slice->lf_header.mb_mode_delta[1]);
> > > +       reg |=3D VE_VP8_LF_DELTA0(slice->lf_header.mb_mode_delta[0]);
> > > +       cedrus_write(dev, VE_VP8_MODE_LF_DELTA, reg);
> > > +
> > > +       luma_addr =3D cedrus_dst_buf_addr(ctx, run->dst->vb2_buf.inde=
x, 0);
> > > +       chroma_addr =3D cedrus_dst_buf_addr(ctx, run->dst->vb2_buf.in=
dex,
> > > 1);
> > > +       cedrus_write(dev, VE_VP8_REC_LUMA, luma_addr);
> > > +       cedrus_write(dev, VE_VP8_REC_CHROMA, chroma_addr);
> > > +
> > > +       qindex =3D vb2_find_timestamp(cap_q, slice->last_frame_ts, 0)=
;
> > > +       if (qindex >=3D 0) {
> > > +               luma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 0);
> > > +               chroma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 1);
> > > +               cedrus_write(dev, VE_VP8_FWD_LUMA, luma_addr);
> > > +               cedrus_write(dev, VE_VP8_FWD_CHROMA, chroma_addr);
> > > +       } else {
> > > +               cedrus_write(dev, VE_VP8_FWD_LUMA, 0);
> > > +               cedrus_write(dev, VE_VP8_FWD_CHROMA, 0);
> > > +       }
> > > +
> > > +       qindex =3D vb2_find_timestamp(cap_q, slice->golden_frame_ts, =
0);
> > > +       if (qindex >=3D 0) {
> > > +               luma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 0);
> > > +               chroma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 1);
> > > +               cedrus_write(dev, VE_VP8_BWD_LUMA, luma_addr);
> > > +               cedrus_write(dev, VE_VP8_BWD_CHROMA, chroma_addr);
> > > +       } else {
> > > +               cedrus_write(dev, VE_VP8_BWD_LUMA, 0);
> > > +               cedrus_write(dev, VE_VP8_BWD_CHROMA, 0);
> > > +       }
> > > +
> > > +       qindex =3D vb2_find_timestamp(cap_q, slice->alt_frame_ts, 0);
> > > +       if (qindex >=3D 0) {
> > > +               luma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 0);
> > > +               chroma_addr =3D cedrus_dst_buf_addr(ctx, qindex, 1);
> > > +               cedrus_write(dev, VE_VP8_ALT_LUMA, luma_addr);
> > > +               cedrus_write(dev, VE_VP8_ALT_CHROMA, chroma_addr);
> > > +       } else {
> > > +               cedrus_write(dev, VE_VP8_ALT_LUMA, 0);
> > > +               cedrus_write(dev, VE_VP8_ALT_CHROMA, 0);
> > > +       }
> > > +
> > > +       cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8 |
> > > +                    VE_H264_CTRL_DECODE_ERR_INT |
> > > +                    VE_H264_CTRL_SLICE_DECODE_INT);
> > > +
> > > +       if (slice->lf_header.level) {
> > > +               ctx->codec.vp8.last_filter_type =3D
> > > +                       !!(slice->lf_header.flags &
> > > V4L2_VP8_LF_FILTER_TYPE_SIMPLE); +
> > > ctx->codec.vp8.last_frame_p_type =3D
> > > +                       !VP8_FRAME_IS_KEY_FRAME(slice);
> > > +               ctx->codec.vp8.last_sharpness_level =3D
> > > +                       slice->lf_header.sharpness_level;
> > > +       }
> > > +}
> > > +
> > > +static int cedrus_vp8_start(struct cedrus_ctx *ctx)
> > > +{
> > > +       struct cedrus_dev *dev =3D ctx->dev;
> > > +
> > > +       ctx->codec.vp8.entropy_probs_buf =3D
> > > +               dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZ=
E,
> > > +                                  &ctx->codec.vp8.entropy_probs_buf_=
dma,
> > > +                                  GFP_KERNEL);
> > > +       if (!ctx->codec.vp8.entropy_probs_buf)
> > > +               return -ENOMEM;
> > > +
> > > +       memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
> >
> > I think this 2048 offset, deserves a small comment, if possible.
>
> Not sure what to put into the comment, really. This part has no documenta=
tion
> and it was deduced from reverse engineered code. Except maybe "Load defau=
lt
> entropy probabilities"?
>

Well, even a small comment mentioning this comes from reverse
engineering and we have no documentation, would at least
clarify we are not being intentionally obscure.

> >
> > That's it. Looks mostly good!
>
> Thanks for review.
>

No problem.

Thanks,
Ezequiel

> Best regards,
> Jernej
>
> >
> > Thanks,
> > Ezequiel
>
>
>
>
