Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AB746632A
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 13:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357665AbhLBMNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 07:13:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357738AbhLBML6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 07:11:58 -0500
Received: from [IPv6:2a01:e0a:120:3210:f817:8a6c:e399:d0b] (unknown [IPv6:2a01:e0a:120:3210:f817:8a6c:e399:d0b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C2431F464A8;
        Thu,  2 Dec 2021 12:08:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638446911; bh=yGg2w1LEJNfgJtRcDYSnRyripC1X0LIs/E2T8PD6qFY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=By3UELcY5/fXiDvKG1dMzGqcTt8EzqR6Z3HB0z41SyBjs2dbIbIwsKAm12ePCPtiq
         I7SdpkhzJi5XymxOXjrXETSJwtEk8sEilX5AlPL14TmQX5ZECI6zFBs5PuEhdkEw1Q
         Yrj9bgXsPbMnhLZyBCvcT+dAM+KEFe+EJzUMD5ZFBysX0240asW1xIHxWr4BcHDrCM
         i3tJL1F0ymteZZRVu5lZVfpLCJpGiJUsNVaVZImKt0Cca7Pvewc7xFZ+o3S4qDO8bt
         EZWpWvfu3ClDOEitJTgczr/9ucyHy7MAT0G1i2rBNrJbHAKVVR19pbIW6pocWRzufW
         vQwhjOHM03Xhw==
Subject: Re: [PATCH] media: hantro: Make G2/HEVC use hantro_postproc_ops
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20211202105549.276572-1-benjamin.gaignard@collabora.com>
 <CAAEAJfDQ7TnFwxhWDp3JAHg67MrCoOZm=D4V5o2sJ_9vT6K0sA@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <b3e3ef14-2e61-15cb-eb75-69b00bb90902@collabora.com>
Date:   Thu, 2 Dec 2021 13:08:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfDQ7TnFwxhWDp3JAHg67MrCoOZm=D4V5o2sJ_9vT6K0sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 02/12/2021 à 12:11, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> Almost there :-)
>
> On Thu, 2 Dec 2021 at 07:55, Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>> Use the postprocessor functions introduced by Hantro G2/VP9 codec series
>> and remove duplicated buffer management.
>> This allow Hantro G12/HEVC to produce NV12_4L4 and NV12.
>>
> s/G12/G2
>
>> fluster score is 77/147 which equal to previous score.
> s/fluster/Fluster
>
> Can you clarify if this is the HEVC score? While here, can you run VP9
> to confirm there are no regressions?

I haven't VP9 GStreamer decoder element ready so I can't do that now.
That said the patch doesn't touch any VP9 code.

Benjamin

>> Note that since NV12_4L2 is the first pixel format enumerated by the
>> driver fluster pipeline and it is well converted into I420 by
>> GStreamer's videoconvert.
>>
>> Beauty, Jockey and ShakeNDry bitstreams from UVG set have also been
>> tested.
>>
> Can you add a link to the UVG test suite, so it's clearer?
>
> Also, this patch is v2, so don't forget to prefix the next one as v3,
> and add a changelog to it.
>
> Thanks a lot,
> Ezequiel
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 25 +++---
>>   drivers/staging/media/hantro/hantro_hevc.c    | 79 +++----------------
>>   drivers/staging/media/hantro/hantro_hw.h      | 11 +++
>>   .../staging/media/hantro/hantro_postproc.c    |  3 +
>>   drivers/staging/media/hantro/hantro_v4l2.c    | 19 ++---
>>   5 files changed, 41 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> index b35f36109a6f..6ef5430b18eb 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> @@ -341,6 +341,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>          const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
>>          dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>>          struct hantro_dev *vpu = ctx->dev;
>> +       struct vb2_v4l2_buffer *vb2_dst;
>> +       struct hantro_decoded_buffer *dst;
>>          size_t cr_offset = hantro_hevc_chroma_offset(sps);
>>          size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
>>          u32 max_ref_frames;
>> @@ -426,10 +428,15 @@ static int set_ref(struct hantro_ctx *ctx)
>>                  hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
>>          }
>>
>> -       luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
>> +       vb2_dst = hantro_get_dst_buf(ctx);
>> +       dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
>> +       luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
>>          if (!luma_addr)
>>                  return -ENOMEM;
>>
>> +       if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val, luma_addr))
>> +               return -EINVAL;
>> +
>>          chroma_addr = luma_addr + cr_offset;
>>          mv_addr = luma_addr + mv_offset;
>>
>> @@ -456,16 +463,12 @@ static int set_ref(struct hantro_ctx *ctx)
>>
>>   static void set_buffers(struct hantro_ctx *ctx)
>>   {
>> -       struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +       struct vb2_v4l2_buffer *src_buf;
>>          struct hantro_dev *vpu = ctx->dev;
>> -       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>> -       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>> -       size_t cr_offset = hantro_hevc_chroma_offset(sps);
>> -       dma_addr_t src_dma, dst_dma;
>> +       dma_addr_t src_dma;
>>          u32 src_len, src_buf_len;
>>
>>          src_buf = hantro_get_src_buf(ctx);
>> -       dst_buf = hantro_get_dst_buf(ctx);
>>
>>          /* Source (stream) buffer. */
>>          src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>> @@ -478,11 +481,6 @@ static void set_buffers(struct hantro_ctx *ctx)
>>          hantro_reg_write(vpu, &g2_strm_start_offset, 0);
>>          hantro_reg_write(vpu, &g2_write_mvs_e, 1);
>>
>> -       /* Destination (decoded frame) buffer. */
>> -       dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
>> -
>> -       hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
>> -       hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + cr_offset);
>>          hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
>>          hantro_write_addr(vpu, G2_TILE_FILTER_ADDR, ctx->hevc_dec.tile_filter.dma);
>>          hantro_write_addr(vpu, G2_TILE_SAO_ADDR, ctx->hevc_dec.tile_sao.dma);
>> @@ -575,9 +573,6 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>>          /* Don't compress buffers */
>>          hantro_reg_write(vpu, &g2_ref_compress_bypass, 1);
>>
>> -       /* use NV12 as output format */
>> -       hantro_reg_write(vpu, &g2_out_rs_e, 1);
>> -
>>          /* Bus width and max burst */
>>          hantro_reg_write(vpu, &g2_buswidth, BUS_WIDTH_128);
>>          hantro_reg_write(vpu, &g2_max_burst, 16);
>> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
>> index ee03123e7704..b49a41d7ae91 100644
>> --- a/drivers/staging/media/hantro/hantro_hevc.c
>> +++ b/drivers/staging/media/hantro/hantro_hevc.c
>> @@ -44,47 +44,6 @@ size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps)
>>          return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
>>   }
>>
>> -static size_t hantro_hevc_mv_size(const struct v4l2_ctrl_hevc_sps *sps)
>> -{
>> -       u32 min_cb_log2_size_y = sps->log2_min_luma_coding_block_size_minus3 + 3;
>> -       u32 ctb_log2_size_y = min_cb_log2_size_y + sps->log2_diff_max_min_luma_coding_block_size;
>> -       u32 pic_width_in_ctbs_y = (sps->pic_width_in_luma_samples + (1 << ctb_log2_size_y) - 1)
>> -                                 >> ctb_log2_size_y;
>> -       u32 pic_height_in_ctbs_y = (sps->pic_height_in_luma_samples + (1 << ctb_log2_size_y) - 1)
>> -                                  >> ctb_log2_size_y;
>> -       size_t mv_size;
>> -
>> -       mv_size = pic_width_in_ctbs_y * pic_height_in_ctbs_y *
>> -                 (1 << (2 * (ctb_log2_size_y - 4))) * 16;
>> -
>> -       vpu_debug(4, "%dx%d (CTBs) %zu MV bytes\n",
>> -                 pic_width_in_ctbs_y, pic_height_in_ctbs_y, mv_size);
>> -
>> -       return mv_size;
>> -}
>> -
>> -static size_t hantro_hevc_ref_size(struct hantro_ctx *ctx)
>> -{
>> -       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>> -       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>> -
>> -       return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
>> -}
>> -
>> -static void hantro_hevc_ref_free(struct hantro_ctx *ctx)
>> -{
>> -       struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
>> -       struct hantro_dev *vpu = ctx->dev;
>> -       int i;
>> -
>> -       for (i = 0;  i < NUM_REF_PICTURES; i++) {
>> -               if (hevc_dec->ref_bufs[i].cpu)
>> -                       dma_free_coherent(vpu->dev, hevc_dec->ref_bufs[i].size,
>> -                                         hevc_dec->ref_bufs[i].cpu,
>> -                                         hevc_dec->ref_bufs[i].dma);
>> -       }
>> -}
>> -
>>   static void hantro_hevc_ref_init(struct hantro_ctx *ctx)
>>   {
>>          struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
>> @@ -108,37 +67,25 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
>>                  }
>>          }
>>
>> -       /* Allocate a new reference buffer */
>> +       return 0;
>> +}
>> +
>> +int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
>> +{
>> +       struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
>> +       int i;
>> +
>> +       /* Add a new reference buffer */
>>          for (i = 0; i < NUM_REF_PICTURES; i++) {
>>                  if (hevc_dec->ref_bufs_poc[i] == UNUSED_REF) {
>> -                       if (!hevc_dec->ref_bufs[i].cpu) {
>> -                               struct hantro_dev *vpu = ctx->dev;
>> -
>> -                               /*
>> -                                * Allocate the space needed for the raw data +
>> -                                * motion vector data. Optimizations could be to
>> -                                * allocate raw data in non coherent memory and only
>> -                                * clear the motion vector data.
>> -                                */
>> -                               hevc_dec->ref_bufs[i].cpu =
>> -                                       dma_alloc_coherent(vpu->dev,
>> -                                                          hantro_hevc_ref_size(ctx),
>> -                                                          &hevc_dec->ref_bufs[i].dma,
>> -                                                          GFP_KERNEL);
>> -                               if (!hevc_dec->ref_bufs[i].cpu)
>> -                                       return 0;
>> -
>> -                               hevc_dec->ref_bufs[i].size = hantro_hevc_ref_size(ctx);
>> -                       }
>>                          hevc_dec->ref_bufs_used |= 1 << i;
>> -                       memset(hevc_dec->ref_bufs[i].cpu, 0, hantro_hevc_ref_size(ctx));
>>                          hevc_dec->ref_bufs_poc[i] = poc;
>> -
>> -                       return hevc_dec->ref_bufs[i].dma;
>> +                       hevc_dec->ref_bufs[i].dma = addr;
>> +                       return 0;
>>                  }
>>          }
>>
>> -       return 0;
>> +       return -EINVAL;
>>   }
>>
>>   void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx)
>> @@ -314,8 +261,6 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
>>                                    hevc_dec->tile_bsd.cpu,
>>                                    hevc_dec->tile_bsd.dma);
>>          hevc_dec->tile_bsd.cpu = NULL;
>> -
>> -       hantro_hevc_ref_free(ctx);
>>   }
>>
>>   int hantro_hevc_dec_init(struct hantro_ctx *ctx)
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index dbe51303724b..7286404c32ab 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -345,6 +345,7 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
>>   int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
>>   int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
>>   dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
>> +int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
>>   void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
>>   size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
>>   size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps);
>> @@ -394,6 +395,16 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
>>          return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
>>   }
>>
>> +static inline size_t
>> +hantro_hevc_mv_size(unsigned int width, unsigned int height)
>> +{
>> +       /*
>> +        * A CTB can be 64x64, 32x32 or 16x16.
>> +        * Allocated memory for the "worse" case: 16x16
>> +        */
>> +       return width * height / 16;
>> +}
>> +
>>   int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
>>   int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
>>   void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
>> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
>> index a7774ad4c445..248abe5423f0 100644
>> --- a/drivers/staging/media/hantro/hantro_postproc.c
>> +++ b/drivers/staging/media/hantro/hantro_postproc.c
>> @@ -146,6 +146,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>>          else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
>>                  buf_size += hantro_vp9_mv_size(ctx->dst_fmt.width,
>>                                                 ctx->dst_fmt.height);
>> +       else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE)
>> +               buf_size += hantro_hevc_mv_size(ctx->dst_fmt.width,
>> +                                               ctx->dst_fmt.height);
>>
>>          for (i = 0; i < num_buffers; ++i) {
>>                  struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
>> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
>> index e4b0645ba6fc..e1fe37afe576 100644
>> --- a/drivers/staging/media/hantro/hantro_v4l2.c
>> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
>> @@ -150,20 +150,6 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>>          unsigned int num_fmts, i, j = 0;
>>          bool skip_mode_none;
>>
>> -       /*
>> -        * The HEVC decoder on the G2 core needs a little quirk to offer NV12
>> -        * only on the capture side. Once the post-processor logic is used,
>> -        * we will be able to expose NV12_4L4 and NV12 as the other cases,
>> -        * and therefore remove this quirk.
>> -        */
>> -       if (capture && ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
>> -               if (f->index == 0) {
>> -                       f->pixelformat = V4L2_PIX_FMT_NV12;
>> -                       return 0;
>> -               }
>> -               return -EINVAL;
>> -       }
>> -
>>          /*
>>           * When dealing with an encoder:
>>           *  - on the capture side we want to filter out all MODE_NONE formats.
>> @@ -304,6 +290,11 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
>>                          pix_mp->plane_fmt[0].sizeimage +=
>>                                  hantro_vp9_mv_size(pix_mp->width,
>>                                                     pix_mp->height);
>> +               else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
>> +                        !hantro_needs_postproc(ctx, fmt))
>> +                       pix_mp->plane_fmt[0].sizeimage +=
>> +                               hantro_hevc_mv_size(pix_mp->width,
>> +                                                   pix_mp->height);
>>          } else if (!pix_mp->plane_fmt[0].sizeimage) {
>>                  /*
>>                   * For coded formats the application can specify
>> --
>> 2.30.2
>>
