Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7747181E9D
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 18:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbgCKRFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 13:05:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60872 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbgCKRFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 13:05:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id E99D228F78D
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 2/5] media: coda: jpeg: add CODA960 JPEG decoder support
In-Reply-To: <e761816ff8744c1eb1f880b3c24f566ae3d36369.camel@collabora.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
 <20191113150538.9807-3-p.zabel@pengutronix.de>
 <CAJ+vNU1j7N8Z2kyOXYeiGa1HKV5cjBq_Bx9N_KYgZNMb9ySJJA@mail.gmail.com>
 <87r1y5jiz6.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
 <CAJ+vNU2YLRDWK=JJ=6JNeozFJcCWi7FZe4uOHLX5mRA_TemKQw@mail.gmail.com>
 <e761816ff8744c1eb1f880b3c24f566ae3d36369.camel@collabora.com>
Date:   Wed, 11 Mar 2020 19:06:00 +0200
Message-ID: <87ftee6cuf.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 07 Mar 2020, Ezequiel Garcia <ezequiel@collabora.com> 
wrote:
> On Fri, 2020-03-06 at 13:57 -0800, Tim Harvey wrote: 
>> On Fri, Mar 6, 2020 at 1:00 PM Adrian Ratiu 
>> <adrian.ratiu@collabora.com> wrote: 
>> > Hi  On Fri, 06 Mar 2020, Tim Harvey <tharvey@gateworks.com> 
>> > wrote: 
>> > > On Wed, Nov 13, 2019 at 7:06 AM Philipp Zabel 
>> > > <p.zabel@pengutronix.de> wrote: 
>> > > > This patch adds JPEG decoding support for CODA960, 
>> > > > handling the JPEG hardware directly. A separate JPEG 
>> > > > decoder video device is created due to the separate 
>> > > > hardware unit and different supported pixel formats. 
>> > > > While the hardware can not change subsampling on the fly, 
>> > > > it can decode 4:2:2 subsampled JPEG images into YUV422P. 
>> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de> 
>> > > > [m.felsch@pengutronix.de: fix qsequence counting by 
>> > > > explicitly 
>> > > >  checking for the !use_bit case] 
>> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de> --- 
>> > > >  drivers/media/platform/Kconfig            |   1 + 
>> > > >  drivers/media/platform/coda/coda-common.c | 124 ++++- 
>> > > >  drivers/media/platform/coda/coda-jpeg.c   | 551 
>> > > >  ++++++++++++++++++++++ 
>> > > >  drivers/media/platform/coda/coda.h |  11 +- 4 files 
>> > > >  changed, 683 insertions(+), 4 deletions(-) 
>> > > >  diff --git a/drivers/media/platform/Kconfig 
>> > > > b/drivers/media/platform/Kconfig index 
>> > > > e84f35d3a68e..c989a2a45c60 100644 --- 
>> > > > a/drivers/media/platform/Kconfig +++ 
>> > > > b/drivers/media/platform/Kconfig @@ -180,6 +180,7 @@ 
>> > > > config VIDEO_CODA 
>> > > >         select SRAM select VIDEOBUF2_DMA_CONTIG select 
>> > > >         VIDEOBUF2_VMALLOC 
>> > > > +       select V4L2_JPEG_HELPER 
>> > > >         select V4L2_MEM2MEM_DEV select GENERIC_ALLOCATOR 
>> > > >         help 
>> > > > diff --git a/drivers/media/platform/coda/coda-common.c 
>> > > > b/drivers/media/platform/coda/coda-common.c index 
>> > > > 9aa5aa837c4e..d8f988b207b1 100644 --- 
>> > > > a/drivers/media/platform/coda/coda-common.c +++ 
>> > > > b/drivers/media/platform/coda/coda-common.c @@ -159,6 
>> > > > +159,7 @@ static const struct coda_codec coda9_codecs[] = 
>> > > > { 
>> > > >         CODA_CODEC(CODA9_MODE_DECODE_H264, 
>> > > >         V4L2_PIX_FMT_H264, V4L2_PIX_FMT_YUV420, 1920, 
>> > > >         1088), CODA_CODEC(CODA9_MODE_DECODE_MP2, 
>> > > >         V4L2_PIX_FMT_MPEG2, V4L2_PIX_FMT_YUV420, 1920, 
>> > > >         1088), CODA_CODEC(CODA9_MODE_DECODE_MP4, 
>> > > >         V4L2_PIX_FMT_MPEG4, V4L2_PIX_FMT_YUV420, 1920, 
>> > > >         1088), 
>> > > > +       CODA_CODEC(CODA9_MODE_DECODE_MJPG, 
>> > > > V4L2_PIX_FMT_JPEG, V4L2_PIX_FMT_YUV420, 8192, 8192), 
>> > > >  }; 
>> > > >  
>> > > >  struct coda_video_device { 
>> > > > @@ -252,6 +253,22 @@ static const struct 
>> > > > coda_video_device coda9_jpeg_encoder = { 
>> > > >         }, 
>> > > >  }; 
>> > > >  +static const struct coda_video_device 
>> > > > coda9_jpeg_decoder = { + .name = "coda-jpeg-decoder", + 
>> > > > .type = CODA_INST_DECODER, +       .ops = 
>> > > > &coda9_jpeg_decode_ops, +       .direct = true, + 
>> > > > .src_formats = { +               V4L2_PIX_FMT_JPEG, + }, 
>> > > > +       .dst_formats = { + 
>> > > > V4L2_PIX_FMT_NV12, +               V4L2_PIX_FMT_YUV420, + 
>> > > > V4L2_PIX_FMT_YVU420, + 
>> > > > V4L2_PIX_FMT_YUV422P, + }, +}; + 
>> > > >  static const struct coda_video_device 
>> > > >  *codadx6_video_devices[] = { 
>> > > >         &coda_bit_encoder, 
>> > > >  }; 
>> > > > @@ -270,6 +287,7 @@ static const struct coda_video_device 
>> > > > *coda7_video_devices[] = {  
>> > > >  static const struct coda_video_device 
>> > > >  *coda9_video_devices[] = { 
>> > > >         &coda9_jpeg_encoder, 
>> > > > +       &coda9_jpeg_decoder, 
>> > > >         &coda_bit_encoder, &coda_bit_decoder, 
>> > > >  }; 
>> > > > @@ -411,6 +429,12 @@ static int coda_querycap(struct file 
>> > > > *file, void *priv, 
>> > > >         return 0; 
>> > > >  } 
>> > > >  +static const u32 coda_formats_420[CODA_MAX_FORMATS] = { 
>> > > > + V4L2_PIX_FMT_NV12, +               V4L2_PIX_FMT_YUV420, 
>> > > > + V4L2_PIX_FMT_YVU420, +}; + 
>> > > >  static int coda_enum_fmt(struct file *file, void *priv, 
>> > > >                          struct v4l2_fmtdesc *f) 
>> > > >  { 
>> > > > @@ -421,10 +445,31 @@ static int coda_enum_fmt(struct 
>> > > > file *file, void *priv,  
>> > > >         if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) 
>> > > >                 formats = cvd->src_formats; 
>> > > > -       else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) 
>> > > > + else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) { + 
>> > > > struct coda_q_data *q_data_src; +               struct 
>> > > > vb2_queue *src_vq; + 
>> > > >                 formats = cvd->dst_formats; 
>> > > > -       else + +               /* +                * If 
>> > > > the source format is already fixed, only allow the same + 
>> > > > * chroma subsampling.  +                */ + q_data_src = 
>> > > > get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT); + src_vq = 
>> > > > v4l2_m2m_get_vq(ctx->fh.m2m_ctx, + 
>> > > > V4L2_BUF_TYPE_VIDEO_OUTPUT); +               if 
>> > > > (q_data_src->fourcc == V4L2_PIX_FMT_JPEG && + 
>> > > > vb2_is_streaming(src_vq)) { +                       if 
>> > > > (ctx->params.jpeg_format == 0) { + formats = 
>> > > > coda_formats_420; +                       } else if 
>> > > > (ctx->params.jpeg_format == 1) { + f->pixelformat = 
>> > > > V4L2_PIX_FMT_YUV422P; + return f->index ? -EINVAL : 0; + 
>> > > > } + } +       } else { 
>> > > >                 return -EINVAL; 
>> > > > +       }  
>> > > >         if (f->index >= CODA_MAX_FORMATS || 
>> > > >         formats[f->index] == 0) 
>> > > >                 return -EINVAL; 
>> > > > @@ -614,12 +659,21 @@ static int 
>> > > > coda_try_fmt_vid_cap(struct file *file, void *priv,  
>> > > >         /* 
>> > > >          * If the source format is already fixed, only 
>> > > >          allow the same output 
>> > > > -        * resolution +        * resolution. When 
>> > > > decoding JPEG images, we also have to make sure to + 
>> > > > * use the same chroma subsampling. 
>> > > >          */ 
>> > > >         src_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, 
>> > > >         V4L2_BUF_TYPE_VIDEO_OUTPUT); if 
>> > > >         (vb2_is_streaming(src_vq)) { 
>> > > >                 f->fmt.pix.width = q_data_src->width; 
>> > > >                 f->fmt.pix.height = q_data_src->height; 
>> > > > + +               if (q_data_src->fourcc == 
>> > > > V4L2_PIX_FMT_JPEG) { +                       if 
>> > > > (ctx->params.jpeg_format == 0 && + f->fmt.pix.pixelformat 
>> > > > == V4L2_PIX_FMT_YUV422P) + f->fmt.pix.pixelformat = 
>> > > > V4L2_PIX_FMT_YUV420; + else if (ctx->params.jpeg_format 
>> > > > == 1) + f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV422P; + 
>> > > > } 
>> > > >         } 
>> > > >  
>> > > >         f->fmt.pix.colorspace = ctx->colorspace; 
>> > > > @@ -747,6 +801,7 @@ static int coda_s_fmt(struct coda_ctx 
>> > > > *ctx, struct v4l2_format *f, 
>> > > >                 /* else fall through */ 
>> > > >         case V4L2_PIX_FMT_YUV420: case 
>> > > >         V4L2_PIX_FMT_YVU420: 
>> > > > +       case V4L2_PIX_FMT_YUV422P: 
>> > > >                 ctx->tiled_map_type = 
>> > > >                 GDI_LINEAR_FRAME_MAP; break; 
>> > > >         default: 
>> > > > @@ -1894,6 +1949,45 @@ static int 
>> > > > coda_start_streaming(struct vb2_queue *q, unsigned int 
>> > > > count) 
>> > > >                         } 
>> > > >                 } 
>> > > >  +               /* +                * Check the first 
>> > > > input JPEG buffer to determine chroma +                * 
>> > > > subsampling.  +                */ +               if 
>> > > > (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) { + 
>> > > > buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx); + ret = 
>> > > > coda_jpeg_decode_header(ctx, &buf->vb2_buf); + if (ret < 
>> > > > 0) { + v4l2_err(v4l2_dev, + "failed to decode JPEG 
>> > > > header: %d\n", + ret); + 
>> > > > goto err; + } + +                       q_data_dst = 
>> > > > get_q_data(ctx, + V4L2_BUF_TYPE_VIDEO_CAPTURE); + 
>> > > > q_data_dst->width = round_up(q_data_src->width, 16); + 
>> > > > q_data_dst->bytesperline = q_data_dst->width; + if 
>> > > > (ctx->params.jpeg_format == 0) { + q_data_dst->height = + 
>> > > > round_up(q_data_src->height, 16); + q_data_dst->sizeimage 
>> > > > = + q_data_dst->bytesperline * + q_data_dst->height * 3 / 
>> > > > 2; +                               if (q_data_dst->fourcc 
>> > > > != V4L2_PIX_FMT_YUV420) + q_data_dst->fourcc = 
>> > > > V4L2_PIX_FMT_NV12; + } else { + 
>> > > > q_data_dst->height = + round_up(q_data_src->height, 8); + 
>> > > > q_data_dst->sizeimage = + q_data_dst->bytesperline * + 
>> > > > q_data_dst->height * 2; + q_data_dst->fourcc = 
>> > > > V4L2_PIX_FMT_YUV422P; + } + 
>> > > > q_data_dst->rect.left = 0; + q_data_dst->rect.top = 0; + 
>> > > > q_data_dst->rect.width = q_data_src->width; + 
>> > > > q_data_dst->rect.height = q_data_src->height; + 
>> > > > } 
>> > > >                 ctx->streamon_out = 1; 
>> > > >         } else { 
>> > > >                 ctx->streamon_cap = 1; 
>> > > > @@ -2132,6 +2226,30 @@ static int coda_s_ctrl(struct 
>> > > > v4l2_ctrl *ctrl) 
>> > > >         case V4L2_CID_JPEG_RESTART_INTERVAL: 
>> > > >                 ctx->params.jpeg_restart_interval = 
>> > > >                 ctrl->val; break; 
>> > > > +       case V4L2_CID_JPEG_CHROMA_SUBSAMPLING: + switch 
>> > > > (ctrl->val) { +               case 
>> > > > V4L2_JPEG_CHROMA_SUBSAMPLING_444: + 
>> > > > ctx->params.jpeg_chroma_subsampling[0] = 0x11; + 
>> > > > ctx->params.jpeg_chroma_subsampling[1] = 0x11; + 
>> > > > ctx->params.jpeg_chroma_subsampling[2] = 0x11; + break; + 
>> > > > case V4L2_JPEG_CHROMA_SUBSAMPLING_422: + 
>> > > > ctx->params.jpeg_chroma_subsampling[0] = 0x21; + 
>> > > > ctx->params.jpeg_chroma_subsampling[1] = 0x11; + 
>> > > > ctx->params.jpeg_chroma_subsampling[2] = 0x11; + break; + 
>> > > > case V4L2_JPEG_CHROMA_SUBSAMPLING_420: + 
>> > > > ctx->params.jpeg_chroma_subsampling[0] = 0x22; + 
>> > > > ctx->params.jpeg_chroma_subsampling[1] = 0x11; + 
>> > > > ctx->params.jpeg_chroma_subsampling[2] = 0x11; + break; + 
>> > > > case V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY: + 
>> > > > ctx->params.jpeg_chroma_subsampling[0] = 0x21; + 
>> > > > ctx->params.jpeg_chroma_subsampling[1] = 0x00; + 
>> > > > ctx->params.jpeg_chroma_subsampling[2] = 0x00; + break; + 
>> > > > } +               break; 
>> > > >         case V4L2_CID_MPEG_VIDEO_VBV_DELAY: 
>> > > >                 ctx->params.vbv_delay = ctrl->val; break; 
>> > > > diff --git a/drivers/media/platform/coda/coda-jpeg.c 
>> > > > b/drivers/media/platform/coda/coda-jpeg.c index 
>> > > > c5cfa985c829..3a6aa027c82b 100644 --- 
>> > > > a/drivers/media/platform/coda/coda-jpeg.c +++ 
>> > > > b/drivers/media/platform/coda/coda-jpeg.c @@ -15,6 +15,7 
>> > > > @@  
>> > > >  #include <media/v4l2-common.h> #include 
>> > > >  <media/v4l2-fh.h> 
>> > > > +#include <media/v4l2-jpeg.h> 
>> > > >  #include <media/v4l2-mem2mem.h> #include 
>> > > >  <media/videobuf2-core.h> #include 
>> > > >  <media/videobuf2-dma-contig.h> 
>> > > > @@ -37,6 +38,18 @@ enum { 
>> > > >         CODA9_JPEG_FORMAT_400, 
>> > > >  }; 
>> > > >  +struct coda_huff_tab { +       u8      dc_bits[2][16]; 
>> > > > + u8      dc_values[2][12 + 4]; /* padded to 32-bit */ + 
>> > > > u8 ac_bits[2][16]; +       u8      ac_values[2][162 + 2]; 
>> > > > /* padded to 32-bit */ + +       /* DC Luma, DC Chroma, 
>> > > > AC Luma, AC Chroma */ +       s16     min[4 * 16]; + 
>> > > > s16     max[4 * 16]; +       s8      ptr[4 * 16]; +}; + 
>> > > >  /* 
>> > > >   * Typical Huffman tables for 8-bit precision luminance 
>> > > >   and * chrominance from JPEG ITU-T.81 (ISO/IEC 10918-1) 
>> > > >   Annex K.3 
>> > > > @@ -245,6 +258,273 @@ bool coda_jpeg_check_buffer(struct 
>> > > > coda_ctx *ctx, struct vb2_buffer *vb) 
>> > > >         return false; 
>> > > >  } 
>> > > >  +static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx 
>> > > > *ctx, int tab_num); + +int coda_jpeg_decode_header(struct 
>> > > > coda_ctx *ctx, struct vb2_buffer *vb) +{ +       struct 
>> > > > coda_dev *dev = ctx->dev; +       u8 *buf = 
>> > > > vb2_plane_vaddr(vb, 0); + size_t len = 
>> > > > vb2_get_plane_payload(vb, 0); +       struct 
>> > > > v4l2_jpeg_scan_header scan_header; +       struct 
>> > > > v4l2_jpeg_reference quantization_tables[4] = { 0 }; + 
>> > > > struct v4l2_jpeg_reference huffman_tables[4] = { 0 }; + 
>> > > > struct v4l2_jpeg_header header = { +               .scan 
>> > > > = &scan_header, +               .quantization_tables = 
>> > > > quantization_tables, +               .huffman_tables = 
>> > > > huffman_tables, +       }; +       struct coda_q_data 
>> > > > *q_data_src; +       struct coda_huff_tab *huff_tab; + 
>> > > > int i, j, ret; + +       ret = 
>> > > > v4l2_jpeg_parse_header(buf, len, &header); +       if 
>> > > > (ret < 0) { + v4l2_err(&dev->v4l2_dev, "failed to parse 
>> > > > header\n"); + return ret; +       } + + 
>> > > > ctx->params.jpeg_restart_interval = 
>> > > > header.restart_interval; + +       /* check frame header 
>> > > > */ +       if (header.frame.height > ctx->codec->max_h || 
>> > > > + header.frame.width > ctx->codec->max_w) { + 
>> > > > v4l2_err(&dev->v4l2_dev, "invalid dimensions: %dx%d\n", + 
>> > > > header.frame.width, header.frame.height); + return 
>> > > > -EINVAL; +       } + +       q_data_src = get_q_data(ctx, 
>> > > > V4L2_BUF_TYPE_VIDEO_OUTPUT); +       if 
>> > > > (header.frame.height != q_data_src->height || + 
>> > > > header.frame.width != q_data_src->width) { + 
>> > > > v4l2_err(&dev->v4l2_dev, + 
>> > > > "dimensions don't match format: %dx%d\n", + 
>> > > > header.frame.width, header.frame.height); + return 
>> > > > -EINVAL; +       } + +       /* install quantization 
>> > > > tables */ +       if (quantization_tables[3].start) { + 
>> > > > v4l2_err(&dev->v4l2_dev, +                        "only 3 
>> > > > quantization tables supported\n"); +               return 
>> > > > -EINVAL; +       } +       for (i = 0; i < 3; i++) { + if 
>> > > > (!quantization_tables[i].start) + continue; + 
>> > > > if (!ctx->params.jpeg_qmat_tab[i]) + 
>> > > > ctx->params.jpeg_qmat_tab[i] = kmalloc(64, GFP_KERNEL); + 
>> > > > memcpy(ctx->params.jpeg_qmat_tab[i], + 
>> > > > quantization_tables[i].start, 64); +       } + +       /* 
>> > > > install Huffman tables */ +       for (i = 0; i < 4; i++) 
>> > > > { + if (!huffman_tables[i].start) { + 
>> > > > v4l2_err(&dev->v4l2_dev, "missing Huffman table\n"); + 
>> > > > return -EINVAL; +               } +               if 
>> > > > (huffman_tables[i].length != ((i & 2) ? 178 : 28)) { + 
>> > > > v4l2_err(&dev->v4l2_dev, + "invalid Huffman table %d 
>> > > > length: %zu\n", i, + huffman_tables[i].length); + 
>> > > > return -EINVAL; +               } +       } + 
>> > > > huff_tab = ctx->params.jpeg_huff_tab; +       if 
>> > > > (!huff_tab) { + huff_tab = kzalloc(sizeof(*huff_tab), 
>> > > > GFP_KERNEL); + if (!huff_tab) + 
>> > > > return -ENOMEM; + ctx->params.jpeg_huff_tab = huff_tab; + 
>> > > > } + memcpy(huff_tab->dc_bits[0], huffman_tables[0].start, 
>> > > > 16); + memcpy(huff_tab->dc_values[0], 
>> > > > huffman_tables[0].start + 16, 12); + 
>> > > > memcpy(huff_tab->dc_bits[1], huffman_tables[1].start, 
>> > > > 16); + memcpy(huff_tab->dc_values[1], 
>> > > > huffman_tables[1].start + 16, 12); + 
>> > > > memcpy(huff_tab->ac_bits[0], huffman_tables[2].start, 
>> > > > 16); + memcpy(huff_tab->ac_values[0], 
>> > > > huffman_tables[2].start + 16, 162); + 
>> > > > memcpy(huff_tab->ac_bits[1], huffman_tables[3].start, 
>> > > > 16); + memcpy(huff_tab->ac_values[1], 
>> > > > huffman_tables[3].start + 16, 162); + +       /* check 
>> > > > scan header */ +       for (i = 0; i < 
>> > > > scan_header.num_components; i++) { +               struct 
>> > > > v4l2_jpeg_scan_component_spec *scan_component; + + 
>> > > > scan_component = &scan_header.component[i]; + 
>> > > > for (j = 0; j < header.frame.num_components; j++) { + if 
>> > > > (header.frame.component[j].component_identifier == + 
>> > > > scan_component->component_selector) + break; + 
>> > > > } +               if (j == header.frame.num_components) + 
>> > > > continue; + + 
>> > > > ctx->params.jpeg_huff_dc_index[j] = + 
>> > > > scan_component->dc_entropy_coding_table_selector; + 
>> > > > ctx->params.jpeg_huff_ac_index[j] = + 
>> > > > scan_component->ac_entropy_coding_table_selector; + 
>> > > > } + + /* Generate Huffman table information */ + 
>> > > > for (i = 0; i < 4; i++) + 
>> > > > coda9_jpeg_gen_dec_huff_tab(ctx, i); + +       /* start 
>> > > > of entropy coded segment */ + ctx->jpeg_ecs_offset = 
>> > > > header.ecs_offset; + +       if (header.frame.subsampling 
>> > > > == V4L2_JPEG_CHROMA_SUBSAMPLING_422) + 
>> > > > ctx->params.jpeg_format = 1; + +       return 0; +} + 
>> > > > +static inline void coda9_jpeg_write_huff_values(struct 
>> > > > coda_dev *dev, u8 *bits, + s8 *values, int num_values) +{ 
>> > > > +       int huff_length, i; + + for (huff_length = 0, i = 
>> > > > 0; i < 16; i++) + huff_length += bits[i]; +       for (i 
>> > > > = huff_length; i < num_values; i++) + 
>> > > > values[i] = -1; +       for (i = 0; i < num_values; i++) 
>> > > > +               coda_write(dev, (s32)values[i], 
>> > > > CODA9_REG_JPEG_HUFF_DATA); +} + +static int 
>> > > > coda9_jpeg_dec_huff_setup(struct coda_ctx *ctx) +{ + 
>> > > > struct coda_huff_tab *huff_tab = 
>> > > > ctx->params.jpeg_huff_tab; + struct coda_dev *dev = 
>> > > > ctx->dev; +       s16 *huff_min = huff_tab->min; + 
>> > > > s16 *huff_max = huff_tab->max; + s8 *huff_ptr = 
>> > > > huff_tab->ptr; +       int i; + +       /* MIN Tables */ 
>> > > > +       coda_write(dev, 0x003, CODA9_REG_JPEG_HUFF_CTRL); 
>> > > > +       coda_write(dev, 0x000, CODA9_REG_JPEG_HUFF_ADDR); 
>> > > > +       for (i = 0; i < 4 * 16; i++) + 
>> > > > coda_write(dev, (s32)huff_min[i], 
>> > > > CODA9_REG_JPEG_HUFF_DATA); + +       /* MAX Tables */ + 
>> > > > coda_write(dev, 0x403, CODA9_REG_JPEG_HUFF_CTRL); + 
>> > > > coda_write(dev, 0x440, CODA9_REG_JPEG_HUFF_ADDR); + 
>> > > > for (i = 0; i < 4 * 16; i++) + 
>> > > > coda_write(dev, (s32)huff_max[i], 
>> > > > CODA9_REG_JPEG_HUFF_DATA); + +       /* PTR Tables */ + 
>> > > > coda_write(dev, 0x803, CODA9_REG_JPEG_HUFF_CTRL); + 
>> > > > coda_write(dev, 0x880, CODA9_REG_JPEG_HUFF_ADDR); + 
>> > > > for (i = 0; i < 4 * 16; i++) + 
>> > > > coda_write(dev, (s32)huff_ptr[i], 
>> > > > CODA9_REG_JPEG_HUFF_DATA); + +       /* VAL Tables: DC 
>> > > > Luma, DC Chroma, AC Luma, AC Chroma */ + 
>> > > > coda_write(dev, 0xc03, CODA9_REG_JPEG_HUFF_CTRL); + 
>> > > > coda9_jpeg_write_huff_values(dev, huff_tab->dc_bits[0], + 
>> > > > huff_tab->dc_values[0], 12); + 
>> > > > coda9_jpeg_write_huff_values(dev, huff_tab->dc_bits[1], + 
>> > > > huff_tab->dc_values[1], 12); + 
>> > > > coda9_jpeg_write_huff_values(dev, huff_tab->ac_bits[0], + 
>> > > > huff_tab->ac_values[0], 162); + 
>> > > > coda9_jpeg_write_huff_values(dev, huff_tab->ac_bits[1], + 
>> > > > huff_tab->ac_values[1], 162); +       coda_write(dev, 
>> > > > 0x000, CODA9_REG_JPEG_HUFF_CTRL); +       return 0; +} + 
>> > > > +static inline void coda9_jpeg_write_qmat_tab(struct 
>> > > > coda_dev *dev, + u8 *qmat, int index) +{ +       int i; + 
>> > > > + coda_write(dev, index | 0x3, CODA9_REG_JPEG_QMAT_CTRL); 
>> > > > + for (i = 0; i < 64; i++) + 
>> > > > coda_write(dev, qmat[i], CODA9_REG_JPEG_QMAT_DATA); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_QMAT_CTRL); +} + 
>> > > > +static void coda9_jpeg_qmat_setup(struct coda_ctx *ctx) 
>> > > > +{ +       struct coda_dev *dev = ctx->dev; +       int 
>> > > > *qmat_index = ctx->params.jpeg_qmat_index; +       u8 
>> > > > **qmat_tab = ctx->params.jpeg_qmat_tab; + + 
>> > > > coda9_jpeg_write_qmat_tab(dev, qmat_tab[qmat_index[0]], 
>> > > > 0x00); +       coda9_jpeg_write_qmat_tab(dev, 
>> > > > qmat_tab[qmat_index[1]], 0x40); + 
>> > > > coda9_jpeg_write_qmat_tab(dev, qmat_tab[qmat_index[2]], 
>> > > > 0x80); +} + +static void 
>> > > > coda9_jpeg_dec_bbc_gbu_setup(struct coda_ctx *ctx, + 
>> > > > struct vb2_buffer *buf, u32 ecs_offset) +{ +       struct 
>> > > > coda_dev *dev = ctx->dev; +       int page_ptr, word_ptr, 
>> > > > bit_ptr; +       u32 bbc_base_addr, end_addr; +       int 
>> > > > bbc_cur_pos; +       int ret, val; + + 
>> > > > bbc_base_addr = vb2_dma_contig_plane_dma_addr(buf, 0); + 
>> > > > end_addr = bbc_base_addr + vb2_get_plane_payload(buf, 0); 
>> > > > + + page_ptr = ecs_offset / 256; +       word_ptr = 
>> > > > (ecs_offset % 256) / 4; +       if (page_ptr & 1) + 
>> > > > word_ptr += 64; +       bit_ptr = (ecs_offset % 4) * 8; + 
>> > > > if (word_ptr & 1) +               bit_ptr += 32; + 
>> > > > word_ptr &= ~0x1; + +       coda_write(dev, end_addr, 
>> > > > CODA9_REG_JPEG_BBC_WR_PTR); +       coda_write(dev, 
>> > > > bbc_base_addr, CODA9_REG_JPEG_BBC_BAS_ADDR); + +       /* 
>> > > > Leave 3 256-byte page margin to avoid a BBC interrupt */ 
>> > > > + coda_write(dev, end_addr + 256 * 3 + 256, 
>> > > > CODA9_REG_JPEG_BBC_END_ADDR); +       val = 
>> > > > DIV_ROUND_UP(vb2_plane_size(buf, 0), 256) + 3; + 
>> > > > coda_write(dev, BIT(31) | val, 
>> > > > CODA9_REG_JPEG_BBC_STRM_CTRL); + +       bbc_cur_pos = 
>> > > > page_ptr; +       coda_write(dev, bbc_cur_pos, 
>> > > > CODA9_REG_JPEG_BBC_CUR_POS); + coda_write(dev, 
>> > > > bbc_base_addr + (bbc_cur_pos << 8), + 
>> > > > CODA9_REG_JPEG_BBC_EXT_ADDR); +       coda_write(dev, 
>> > > > (bbc_cur_pos & 1) << 6, CODA9_REG_JPEG_BBC_INT_ADDR); + 
>> > > > coda_write(dev, 64, CODA9_REG_JPEG_BBC_DATA_CNT); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_BBC_COMMAND); + 
>> > > > do { + ret = coda_read(dev, CODA9_REG_JPEG_BBC_BUSY); + 
>> > > > } while (ret == 1); + +       bbc_cur_pos++; + 
>> > > > coda_write(dev, bbc_cur_pos, CODA9_REG_JPEG_BBC_CUR_POS); 
>> > > > + coda_write(dev, bbc_base_addr + (bbc_cur_pos << 8), + 
>> > > > CODA9_REG_JPEG_BBC_EXT_ADDR); +       coda_write(dev, 
>> > > > (bbc_cur_pos & 1) << 6, CODA9_REG_JPEG_BBC_INT_ADDR); + 
>> > > > coda_write(dev, 64, CODA9_REG_JPEG_BBC_DATA_CNT); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_BBC_COMMAND); + 
>> > > > do { + ret = coda_read(dev, CODA9_REG_JPEG_BBC_BUSY); + 
>> > > > } while (ret == 1); + +       bbc_cur_pos++; + 
>> > > > coda_write(dev, bbc_cur_pos, CODA9_REG_JPEG_BBC_CUR_POS); 
>> > > > + coda_write(dev, 1, CODA9_REG_JPEG_BBC_CTRL); + + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_GBU_TT_CNT); + 
>> > > > coda_write(dev, word_ptr, CODA9_REG_JPEG_GBU_WD_PTR); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_GBU_BBSR); + 
>> > > > coda_write(dev, 127, CODA9_REG_JPEG_GBU_BBER); +       if 
>> > > > (page_ptr & 1) { +               coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_GBU_BBIR); +               coda_write(dev, 
>> > > > 0, CODA9_REG_JPEG_GBU_BBHR); +       } else { + 
>> > > > coda_write(dev, 64, CODA9_REG_JPEG_GBU_BBIR); + 
>> > > > coda_write(dev, 64, CODA9_REG_JPEG_GBU_BBHR); +       } + 
>> > > > coda_write(dev, 4, CODA9_REG_JPEG_GBU_CTRL); + 
>> > > > coda_write(dev, bit_ptr, CODA9_REG_JPEG_GBU_FF_RPTR); + 
>> > > > coda_write(dev, 3, CODA9_REG_JPEG_GBU_CTRL); +} + 
>> > > >  static const int bus_req_num[] = { 
>> > > >         [CODA9_JPEG_FORMAT_420] = 2, 
>> > > >         [CODA9_JPEG_FORMAT_422] = 3, 
>> > > > @@ -341,6 +621,71 @@ static int 
>> > > > coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int 
>> > > > tab_num, 
>> > > >  #define DC_TABLE_INDEX1                    2 #define 
>> > > >  AC_TABLE_INDEX1                    3 
>> > > >  +static u8 *coda9_jpeg_get_huff_bits(struct coda_ctx 
>> > > > *ctx, int tab_num) +{ +       struct coda_huff_tab 
>> > > > *huff_tab = ctx->params.jpeg_huff_tab; + +       if 
>> > > > (!huff_tab) + return NULL; + +       switch (tab_num) { + 
>> > > > case DC_TABLE_INDEX0: return huff_tab->dc_bits[0]; + 
>> > > > case AC_TABLE_INDEX0: return huff_tab->ac_bits[0]; + 
>> > > > case DC_TABLE_INDEX1: return huff_tab->dc_bits[1]; + 
>> > > > case AC_TABLE_INDEX1: return huff_tab->ac_bits[1]; + 
>> > > > } + + return NULL; +} + +static int 
>> > > > coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int 
>> > > > tab_num) +{ +       int ptr_cnt = 0, huff_code = 0, 
>> > > > zero_flag = 0, data_flag = 0; +       u8 *huff_bits; + 
>> > > > s16 *huff_max; + s16 *huff_min; +       s8 *huff_ptr; + 
>> > > > int ofs; + int i; + +       huff_bits = 
>> > > > coda9_jpeg_get_huff_bits(ctx, tab_num); +       if 
>> > > > (!huff_bits) +               return -EINVAL; + +       /* 
>> > > > DC/AC Luma, DC/AC Chroma -> DC Luma/Chroma, AC 
>> > > > Luma/Chroma */ +       ofs = ((tab_num & 1) << 1) | 
>> > > > ((tab_num >> 1) & 1); +       ofs *= 16; + + huff_ptr = 
>> > > > ctx->params.jpeg_huff_tab->ptr + ofs; + huff_max = 
>> > > > ctx->params.jpeg_huff_tab->max + ofs; + huff_min = 
>> > > > ctx->params.jpeg_huff_tab->min + ofs; + +       for (i = 
>> > > > 0; i < 16; i++) { +               if (huff_bits[i]) { + 
>> > > > huff_ptr[i] = ptr_cnt; +                       ptr_cnt += 
>> > > > huff_bits[i]; +                       huff_min[i] = 
>> > > > huff_code; +                       huff_max[i] = 
>> > > > huff_code + (huff_bits[i] - 1); + 
>> > > > data_flag = 1; + zero_flag = 0; +               } else { 
>> > > > + huff_ptr[i] = -1; +                       huff_min[i] = 
>> > > > -1; + huff_max[i] = -1; +                       zero_flag 
>> > > > = 1; + } + +               if (data_flag == 1) { + if 
>> > > > (zero_flag == 1) + 
>> > > > huff_code <<= 1; +                       else + huff_code 
>> > > > = (huff_max[i] + 1) << 1; +               } +       } + + 
>> > > > return 0; +} + 
>> > > >  static int coda9_jpeg_load_huff_tab(struct coda_ctx 
>> > > >  *ctx) { 
>> > > >         struct coda_dev *dev = ctx->dev; 
>> > > > @@ -401,6 +746,8 @@ static inline void 
>> > > > coda9_jpeg_write_qmat_quotients(struct coda_dev *dev, 
>> > > >         coda_write(dev, index, CODA9_REG_JPEG_QMAT_CTRL); 
>> > > >  } 
>> > > >  +static void coda_scale_quant_table(u8 *q_tab, int 
>> > > > scale); + 
>> > > >  static int coda9_jpeg_load_qmat_tab(struct coda_ctx 
>> > > >  *ctx) { 
>> > > >         struct coda_dev *dev = ctx->dev; 
>> > > > @@ -860,6 +1207,13 @@ static void 
>> > > > coda9_jpeg_finish_encode(struct coda_ctx *ctx) 
>> > > >         coda_dbg(1, ctx, "job finished: encoded frame 
>> > > >         (%u)%s\n", 
>> > > >                  dst_buf->sequence, (dst_buf->flags & 
>> > > >                  V4L2_BUF_FLAG_LAST) ? " (last)" : ""); 
>> > > > + +       /* +        * Reset JPEG processing unit after 
>> > > > each encode run to work +        * around hangups when 
>> > > > switching context between encoder and +        * decoder. 
>> > > > +        */ + coda_hw_reset(ctx); 
>> > > >  } 
>> > > >  
>> > > >  static void coda9_jpeg_release(struct coda_ctx *ctx) 
>> > > > @@ -872,6 +1226,7 @@ static void 
>> > > > coda9_jpeg_release(struct coda_ctx *ctx) 
>> > > >                 ctx->params.jpeg_qmat_tab[1] = NULL; 
>> > > >         for (i = 0; i < 3; i++) 
>> > > >                 kfree(ctx->params.jpeg_qmat_tab[i]); 
>> > > > +       kfree(ctx->params.jpeg_huff_tab); 
>> > > >  } 
>> > > >  
>> > > >  const struct coda_context_ops coda9_jpeg_encode_ops = { 
>> > > > @@ -882,6 +1237,202 @@ const struct coda_context_ops 
>> > > > coda9_jpeg_encode_ops = { 
>> > > >         .release = coda9_jpeg_release, 
>> > > >  }; 
>> > > >  +/* + * Decoder context operations + */ + +static int 
>> > > > coda9_jpeg_start_decoding(struct coda_ctx *ctx) +{ + 
>> > > > ctx->params.jpeg_qmat_index[0] = 0; + 
>> > > > ctx->params.jpeg_qmat_index[1] = 1; + 
>> > > > ctx->params.jpeg_qmat_index[2] = 1; + 
>> > > > ctx->params.jpeg_qmat_tab[0] = luma_q; + 
>> > > > ctx->params.jpeg_qmat_tab[1] = chroma_q; +       /* 
>> > > > nothing more to do here */ + +       /* TODO: we could 
>> > > > already scan the first header to get the chroma + 
>> > > > * format.  +        */ + +       return 0; +} + +static 
>> > > > int coda9_jpeg_prepare_decode(struct coda_ctx *ctx) +{ + 
>> > > > struct coda_dev *dev = ctx->dev; +       int 
>> > > > aligned_width, aligned_height; +       int chroma_format; 
>> > > > +       int ret; + u32 val, dst_fourcc; +       struct 
>> > > > coda_q_data *q_data_dst; + struct vb2_v4l2_buffer 
>> > > > *src_buf, *dst_buf; +       int chroma_interleave; + + 
>> > > > src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx); + 
>> > > > dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx); + 
>> > > > q_data_dst = get_q_data(ctx, 
>> > > > V4L2_BUF_TYPE_VIDEO_CAPTURE); + dst_fourcc = 
>> > > > q_data_dst->fourcc; + +       if 
>> > > > (vb2_get_plane_payload(&src_buf->vb2_buf, 0) == 0) + 
>> > > > vb2_set_plane_payload(&src_buf->vb2_buf, 0, + 
>> > > > vb2_plane_size(&src_buf->vb2_buf, 0)); + + 
>> > > > chroma_format = 
>> > > > coda9_jpeg_chroma_format(q_data_dst->fourcc); +       if 
>> > > > (chroma_format < 0) { + 
>> > > > v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx); 
>> > > > + return chroma_format; +       } + +       /* Round 
>> > > > image dimensions to multiple of MCU size */ + 
>> > > > aligned_width = round_up(q_data_dst->width, 
>> > > > width_align[chroma_format]); + aligned_height = 
>> > > > round_up(q_data_dst->height, + 
>> > > > height_align[chroma_format]); +       if (aligned_width 
>> > > > != q_data_dst->bytesperline) { + v4l2_err(&dev->v4l2_dev, 
>> > > > "stride mismatch: %d != %d\n", + aligned_width, 
>> > > > q_data_dst->bytesperline); +       } + + 
>> > > > coda_set_gdi_regs(ctx); + +       ret = 
>> > > > coda_jpeg_decode_header(ctx, &src_buf->vb2_buf); + 
>> > > > if (ret < 0) { +               v4l2_err(&dev->v4l2_dev, 
>> > > > "failed to decode JPEG header: %d\n", + 
>> > > > ret); + + src_buf = 
>> > > > v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx); + dst_buf = 
>> > > > v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx); + 
>> > > > v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE); + 
>> > > > v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE); + + 
>> > > > v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx); 
>> > > > + return ret; +       } + +       val = 
>> > > > ctx->params.jpeg_huff_ac_index[0] << 12 | + 
>> > > > ctx->params.jpeg_huff_ac_index[1] << 11 | + 
>> > > > ctx->params.jpeg_huff_ac_index[2] << 10 | + 
>> > > > ctx->params.jpeg_huff_dc_index[0] << 9 | + 
>> > > > ctx->params.jpeg_huff_dc_index[1] << 8 | + 
>> > > > ctx->params.jpeg_huff_dc_index[2] << 7; +       if 
>> > > > (ctx->params.jpeg_huff_tab) +               val |= 
>> > > > CODA9_JPEG_PIC_CTRL_USER_HUFFMAN_EN; + 
>> > > > coda_write(dev, val, CODA9_REG_JPEG_PIC_CTRL); + + 
>> > > > coda_write(dev, aligned_width << 16 | aligned_height, + 
>> > > > CODA9_REG_JPEG_PIC_SIZE); + +       chroma_interleave = 
>> > > > (dst_fourcc == V4L2_PIX_FMT_NV12); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_ROT_INFO); + 
>> > > > coda_write(dev, bus_req_num[chroma_format], 
>> > > > CODA9_REG_JPEG_OP_INFO); + coda_write(dev, 
>> > > > mcu_info[chroma_format], CODA9_REG_JPEG_MCU_INFO); + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_SCL_INFO); + 
>> > > > coda_write(dev, chroma_interleave, 
>> > > > CODA9_REG_JPEG_DPB_CONFIG); + coda_write(dev, 
>> > > > ctx->params.jpeg_restart_interval, + 
>> > > > CODA9_REG_JPEG_RST_INTVAL); + +       if 
>> > > > (ctx->params.jpeg_huff_tab) { +               ret = 
>> > > > coda9_jpeg_dec_huff_setup(ctx); +               if (ret < 
>> > > > 0) { +                       v4l2_err(&dev->v4l2_dev, + 
>> > > > "failed to set up Huffman tables: %d\n", ret); + 
>> > > > v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx); 
>> > > > + return ret; +               } +       } + + 
>> > > > coda9_jpeg_qmat_setup(ctx); + + 
>> > > > coda9_jpeg_dec_bbc_gbu_setup(ctx, &src_buf->vb2_buf, + 
>> > > > ctx->jpeg_ecs_offset); + +       coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_RST_INDEX); +       coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_RST_COUNT); + +       coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_DPCM_DIFF_Y); +       coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_DPCM_DIFF_CB); +       coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_DPCM_DIFF_CR); + +       coda_write(dev, 
>> > > > 0, CODA9_REG_JPEG_ROT_INFO); + +       coda_write(dev, 1, 
>> > > > CODA9_GDI_CONTROL); +       do { +               ret = 
>> > > > coda_read(dev, CODA9_GDI_STATUS); +       } while (!ret); 
>> > > > + + val = (chroma_format << 17) | (chroma_interleave << 
>> > > > 16) | + q_data_dst->bytesperline; +       if 
>> > > > (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) + 
>> > > > val |= 3 << 20; +       coda_write(dev, val, 
>> > > > CODA9_GDI_INFO_CONTROL); + + coda_write(dev, 
>> > > > aligned_width << 16 | aligned_height, + 
>> > > > CODA9_GDI_INFO_PIC_SIZE); + +       coda_write_base(ctx, 
>> > > > q_data_dst, dst_buf, CODA9_GDI_INFO_BASE_Y); + + 
>> > > > coda_write(dev, 0, CODA9_REG_JPEG_DPB_BASE00); + 
>> > > > coda_write(dev, 0, CODA9_GDI_CONTROL); + 
>> > > > coda_write(dev, 1, CODA9_GDI_PIC_INIT_HOST); + + 
>> > > > trace_coda_jpeg_run(ctx, src_buf); + + 
>> > > > coda_write(dev, 1, CODA9_REG_JPEG_PIC_START); + + 
>> > > > return 0; +} + +static void 
>> > > > coda9_jpeg_finish_decode(struct coda_ctx *ctx) +{ + 
>> > > > struct coda_dev *dev = ctx->dev; +       struct 
>> > > > vb2_v4l2_buffer *dst_buf, *src_buf; +       struct 
>> > > > coda_q_data *q_data_dst; + u32 err_mb; + +       err_mb = 
>> > > > coda_read(dev, CODA9_REG_JPEG_PIC_ERRMB); +       if 
>> > > > (err_mb) + v4l2_err(&dev->v4l2_dev, "ERRMB: 0x%x\n", 
>> > > > err_mb); + + coda_write(dev, 0, 
>> > > > CODA9_REG_JPEG_BBC_FLUSH_CMD); + + src_buf = 
>> > > > v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx); + dst_buf = 
>> > > > v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx); + 
>> > > > dst_buf->sequence = ctx->osequence++; + + 
>> > > > trace_coda_jpeg_done(ctx, dst_buf); + + 
>> > > > dst_buf->flags &= ~(V4L2_BUF_FLAG_PFRAME | 
>> > > > V4L2_BUF_FLAG_LAST); + dst_buf->flags |= 
>> > > > V4L2_BUF_FLAG_KEYFRAME; + dst_buf->flags |= 
>> > > > src_buf->flags & V4L2_BUF_FLAG_LAST; + + 
>> > > > v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false); + + 
>> > > > q_data_dst = get_q_data(ctx, 
>> > > > V4L2_BUF_TYPE_VIDEO_CAPTURE); + 
>> > > > vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 
>> > > > q_data_dst->sizeimage); + + 
>> > > > v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE); + 
>> > > > coda_m2m_buf_done(ctx, dst_buf, err_mb ? 
>> > > > VB2_BUF_STATE_ERROR : + VB2_BUF_STATE_DONE); + + 
>> > > > coda_dbg(1, ctx, "job finished: decoded frame (%u)%s\n", 
>> > > > +                dst_buf->sequence, + (dst_buf->flags & 
>> > > > V4L2_BUF_FLAG_LAST) ? " (last)" : ""); + + /* +        * 
>> > > > Reset JPEG processing unit after each decode run to work 
>> > > > +        * around hangups when switching context between 
>> > > > encoder and +        * decoder.  +        */ + 
>> > > > coda_hw_reset(ctx); +} + +const struct coda_context_ops 
>> > > > coda9_jpeg_decode_ops = { +       .queue_init = 
>> > > > coda_encoder_queue_init, /* non-bitstream operation */ + 
>> > > > .start_streaming = coda9_jpeg_start_decoding, + 
>> > > > .prepare_run = coda9_jpeg_prepare_decode, + 
>> > > > .finish_run = coda9_jpeg_finish_decode, +       .release 
>> > > > = coda9_jpeg_release, +}; + 
>> > > >  irqreturn_t coda9_jpeg_irq_handler(int irq, void *data) 
>> > > >  { 
>> > > >         struct coda_dev *dev = data; 
>> > > > diff --git a/drivers/media/platform/coda/coda.h 
>> > > > b/drivers/media/platform/coda/coda.h index 
>> > > > 98af53d11c1b..80a2cc1126bd 100644 --- 
>> > > > a/drivers/media/platform/coda/coda.h +++ 
>> > > > b/drivers/media/platform/coda/coda.h @@ -69,7 +69,7 @@ 
>> > > > struct coda_aux_buf {  
>> > > >  struct coda_dev { 
>> > > >         struct v4l2_device      v4l2_dev; 
>> > > > -       struct video_device     vfd[5]; +       struct 
>> > > > video_device     vfd[6]; 
>> > > >         struct device           *dev; const struct 
>> > > >         coda_devtype *devtype; int 
>> > > >         firmware; 
>> > > > @@ -123,9 +123,15 @@ struct coda_params { 
>> > > >         u8                      mpeg4_inter_qp; u8 
>> > > >         gop_size; int                     intra_refresh; 
>> > > > +       u8                      jpeg_format; 
>> > > >         u8                      jpeg_quality; u8 
>> > > >         jpeg_restart_interval; u8 *jpeg_qmat_tab[3]; 
>> > > > +       int                     jpeg_qmat_index[3]; + 
>> > > > int jpeg_huff_dc_index[3]; +       int 
>> > > > jpeg_huff_ac_index[3]; +       struct coda_huff_tab 
>> > > > *jpeg_huff_tab; +       u8 jpeg_chroma_subsampling[3]; 
>> > > >         int                     codec_mode; int 
>> > > >         codec_mode_aux; enum 
>> > > >         v4l2_mpeg_video_multi_slice_mode slice_mode; 
>> > > > @@ -237,6 +243,7 @@ struct coda_ctx { 
>> > > >         struct v4l2_fh                  fh; int 
>> > > >         gopcounter; int 
>> > > >         runcounter; 
>> > > > +       int                             jpeg_ecs_offset; 
>> > > >         char 
>> > > >         vpu_header[3][64]; int vpu_header_size[3]; struct 
>> > > >         kfifo bitstream_fifo; 
>> > > > @@ -361,12 +368,14 @@ void 
>> > > > coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 
>> > > > profile_idc, 
>> > > >                                      u8 level_idc); 
>> > > >  
>> > > >  bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct 
>> > > >  vb2_buffer *vb); 
>> > > > +int coda_jpeg_decode_header(struct coda_ctx *ctx, struct 
>> > > > vb2_buffer *vb); 
>> > > >  int coda_jpeg_write_tables(struct coda_ctx *ctx); void 
>> > > >  coda_set_jpeg_compression_quality(struct coda_ctx *ctx, 
>> > > >  int quality); 
>> > > >  
>> > > >  extern const struct coda_context_ops 
>> > > >  coda_bit_encode_ops; extern const struct 
>> > > >  coda_context_ops coda_bit_decode_ops; extern const 
>> > > >  struct coda_context_ops coda9_jpeg_encode_ops; 
>> > > > +extern const struct coda_context_ops 
>> > > > coda9_jpeg_decode_ops;  
>> > > >  irqreturn_t coda_irq_handler(int irq, void *data); 
>> > > >  irqreturn_t coda9_jpeg_irq_handler(int irq, void *data); 
>> > > > -- 2.20.1  
>> > >  Hi Philipp,  Thank you for the continuing improvements to 
>> > > the coda driver!   I've applied 'media: add v4l2 JPEG 
>> > > helpers' and this on top of 5.6-rc3 and it does decode but 
>> > > the colorspace looks all wrong (looks like a planar 
>> > > issue). I'm testing this on an IMX6Q board with 
>> > > 'gst-launch-1.0 videotestsrc ! jpegenc ! v4l2jpegdec ! 
>> > > autovideosink'.   Any ideas what could be happening here? 
>> > > Do you have plans to re-submit this and 'media: add v4l2 
>> > > JPEG helpers'? 
>> >  So from my testing the decoder patches work really well, 
>> > (thanks a lot Philipp, much appreciated!) but there is still 
>> > one bug you might be hitting which I also encountered.   I've 
>> > tested on an imx6dl.   Looks like v4l2jpegdec is chosing the 
>> > wrong format for some reason, the pipeline tries to use I420 
>> > but it defaults to NV12.   You can validate your pipeline 
>> > with the software decoder 'jpegdec' with something like this 
>> > (just an example of what I use):  gst-launch-1.0 -v filesrc 
>> > location=/test420.jpeg ! jpegparse !  jpegdec ! kmssink  You 
>> > can see, due to the -v arg, that the format is correctly 
>> > negotiated as I420. If you change to v4l2jpegdec you'll see 
>> > autonegotiation try to use NV12 which leads to a colorspace 
>> > conversion bug because the planes are swapped between 
>> > formats.   My workaround is to explicitely set the format in 
>> > the pipeline, like:  gst-launch-1.0 -v filesrc 
>> > location=/test420.jpeg ! jpegparse !  v4l2jpegdec ! 
>> > video/x-raw,format=I420 ! kmssink  Please tell me if this 
>> > helps, it would be good to have confirmation I'm not the only 
>> > one :)  
>>  Adrian,  Indeed this is the issue and the workaround works for 
>> me as well on IMX6Q on 5.6-rc3 with 'media: coda: jpeg: add 
>> CODA960 JPEG decoder support' and 'media: add v4l2 JPEG 
>> helpers' gst-launch-1.0 videotestsrc ! jpegenc ! jpegdec ! 
>> kmssink # works fine; jpegdec outputs I420 gst-launch-1.0 
>> videotestsrc ! jpegenc ! v4l2jpegdec ! kmssink # invalid image; 
>> v4l2jpegdec outputs NV12 gst-launch-1.0 videotestsrc ! jpegenc 
>> ! v4l2jpegdec !  video/x-raw,format=I420 ! kmssink # works 
>> fine; v4l2jpegdec outputs I420  
> 
> Hey guys, 
> 
> Note that the decoder seems to support NV12: 
> 
> +static const struct coda_video_device coda9_jpeg_decoder = { + 
> .name = "coda-jpeg-decoder", +       .type = CODA_INST_DECODER, 
> +       .ops = &coda9_jpeg_decode_ops, +       .direct = true, + 
> .src_formats = { +               V4L2_PIX_FMT_JPEG, +       }, + 
> .dst_formats = { +               V4L2_PIX_FMT_NV12, + 
> V4L2_PIX_FMT_YUV420, +               V4L2_PIX_FMT_YVU420, + 
> V4L2_PIX_FMT_YUV422P, +       }, +}; 
> 
> I don't think there is anything wrong with the negotiation.  The 
> jpegdec element supports I420 (see gst-inspect-1.0 jpegdec), so 
> naturally this pipeline negotiates I420: 
> 
> gst-launch-1.0 videotestsrc ! jpegenc ! jpegdec ! kmssink 
> 
> On the other hand, since the hardware decoder supports NV12 as 
> well as I420, gstreamer is free to negotiate to whatever it 
> prefers, so: 
> 
> gst-launch-1.0 videotestsrc ! jpegenc ! v4l2jpegdec ! kmssink 
> 
> will happily negotiate to NV12, unless you explicitly ask for a 
> format. 
> 
> So the bug would not be a wrong negotiation, but the driver 
> seemingly not producing correct NV12. 
> 
> Regards, Ezequiel 
>   

Hello Philipp,

Nicolas and Ezequiel helped root cause this bug to a much older 
unrelated
commit which caused a regression leading to the decoder 
misbehaviour above.

The commit is this: 6727d4fce955 ("[media] coda: make NV12 format 
default").

For a minimal reproducing example, the decoder in this pipeline 
produces I420 reported incorrectly as NV12:

gst-launch-1.0 videotestsrc ! jpegenc ! v4l2jpegdec ! kmssink

In the next pipeline, the decoder produces NV12 reported correctly 
as NV12:

gst-launch-1.0 videotestsrc ! jpegenc ! v4l2jpegdec ! 
video/x-raw,format=NV12 ! kmssink

It appears the default format is not set correctly in 
set_default_params(),
due to it being set to ctx->cvd->dst_formats[0] after commit 
6727d4fce955
(immediately after bytesperline/sizeimage are set using 
ctx->codec->src_fourcc)
which can be different from the codec format.

Partially reverting 6727d4fce955 using the following diff resolved 
the bug,
but I'm not sure what a proper solution would look like. Nicolas 
mentioned
maybe setting these in coda_try_fmt().

Any opinions / preferences?

Thank you,
Adrian

--- a/drivers/media/platform/coda/coda-common.c +++ 
b/drivers/media/platform/coda/coda-common.c @@ -1543,7 +1543,7 @@ 
static void set_default_params(struct coda_ctx *ctx) 
  
        /* Default formats for output and input queues */ 
        ctx->q_data[V4L2_M2M_SRC].fourcc = 
        ctx->cvd->src_formats[0]; 
-       ctx->q_data[V4L2_M2M_DST].fourcc = 
ctx->cvd->dst_formats[0]; +       ctx->q_data[V4L2_M2M_DST].fourcc 
= ctx->codec->dst_fourcc; 
        ctx->q_data[V4L2_M2M_SRC].width = max_w; 
        ctx->q_data[V4L2_M2M_SRC].height = max_h; 
        ctx->q_data[V4L2_M2M_DST].width = max_w;
