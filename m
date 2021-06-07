Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F439DD90
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 15:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFGN3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 09:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGN3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 09:29:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90030C061766;
        Mon,  7 Jun 2021 06:27:47 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d] (unknown [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 839271F42685;
        Mon,  7 Jun 2021 14:27:44 +0100 (BST)
Subject: Re: [PATCH 2/8] media: hantro: Add support of compressed reference
 buffers
To:     Ezequiel Garcia <ezequiel@collabora.com>, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
 <20210604130619.491200-3-benjamin.gaignard@collabora.com>
 <6c8a685e123ec0a9510f134a5d6a32ed66920700.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <9bb1910c-2a6e-49e6-e839-7b677974acf3@collabora.com>
Date:   Mon, 7 Jun 2021 15:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6c8a685e123ec0a9510f134a5d6a32ed66920700.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 04/06/2021 à 18:32, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> Thanks for the patches, they looks really nice!
>
> On Fri, 2021-06-04 at 15:06 +0200, Benjamin Gaignard wrote:
>> Reference frame compression is a feature added in G2 decoder to compress
>> frame buffers so that the bandwidth of storing/loading reference frames
>> can be reduced, especially when the resolution of decoded stream is of
>> high definition.
>>
> Can you do some tracing using the performance counters in patch 1,
> with and without this patch, while we are here, it would be interesting
> to run some experiments.
>
> If I understand correctly, the G2 HEVC engine is producing tiled buffers,
> which are then post-processed to NV12.
>
> So this compression feature is compressing the tiled buffers,
> the NV12 are still uncompressed. If this is the case, could add
> some comments somewhere about the different sets of buffers involved?

I will do that

>
> Also, I believe I mentioned this before, is there a plan
> to be able to expose the tiled buffers to userspace (i.e. without
> the NV12 linear post-processing)? I think the display controller
> can take compressed tiled-buffers.

Yes it could be possible to use vb2 buffers instead of internally
allocated buffers but that would means define a new format/modifier
before doing that.

>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 20 ++++++++++--
>>   drivers/staging/media/hantro/hantro_g2_regs.h |  4 +++
>>   drivers/staging/media/hantro/hantro_hevc.c    | 32 ++++++++++++++++++-
>>   drivers/staging/media/hantro/hantro_hw.h      |  2 ++
>>   4 files changed, 54 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> index 89fac5146433..9a715e803037 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> @@ -382,10 +382,12 @@ static int set_ref(struct hantro_ctx *ctx)
>>          const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
>>          const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
>>          const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
>> -       dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>> +       dma_addr_t luma_addr, chroma_addr, mv_addr, compress_luma_addr, compress_chroma_addr = 0;
>>          struct hantro_dev *vpu = ctx->dev;
>>          size_t cr_offset = hantro_hevc_chroma_offset(sps);
>>          size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
>> +       size_t compress_luma_offset = hantro_hevc_luma_compress_offset(sps);
>> +       size_t compress_chroma_offset = hantro_hevc_chroma_compress_offset(sps);
>>          u32 max_ref_frames;
>>          u16 dpb_longterm_e;
>>          static const struct hantro_reg cur_poc[] = {
>> @@ -460,6 +462,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>   
>>                  chroma_addr = luma_addr + cr_offset;
>>                  mv_addr = luma_addr + mv_offset;
>> +               compress_luma_addr = luma_addr + compress_luma_offset;
>> +               compress_chroma_addr = luma_addr + compress_chroma_offset;
>>   
>>                  if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>>                          dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>> @@ -467,6 +471,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>                  hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
>>                  hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
>>                  hantro_write_addr(vpu, G2_REG_DMV_REF(i), mv_addr);
>> +               hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), compress_luma_addr);
>> +               hantro_write_addr(vpu, G2_COMP_CHR_REF(i), compress_chroma_addr);
> I'm a bit confused here, you are seeing luma_addr and also compress_luma_addr
> for references??

Yes both are need to make this work. It also done like that in vendor stack.

>
> I'm not saying this is wrong, just would like some comments in the code
> so the intention is a bit more clear and I can understand what's going on.

I will add comments to clarify that point.

Benjamin

>
>>          }
>>   
>>          luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
>> @@ -475,7 +481,11 @@ static int set_ref(struct hantro_ctx *ctx)
>>   
>>          chroma_addr = luma_addr + cr_offset;
>>          mv_addr = luma_addr + mv_offset;
>> +       compress_luma_addr = luma_addr + compress_luma_offset;
>> +       compress_chroma_addr = luma_addr + compress_chroma_offset;
>>   
>> +       hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), compress_luma_addr);
>> +       hantro_write_addr(vpu, G2_COMP_CHR_REF(i), compress_chroma_addr);
>>          hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
>>          hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
>>          hantro_write_addr(vpu, G2_REG_DMV_REF(i++), mv_addr);
>> @@ -483,6 +493,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>          hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
>>          hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
>>          hantro_write_addr(vpu, G2_ADDR_DST_MV, mv_addr);
>> +       hantro_write_addr(vpu, G2_COMP_ADDR_DST, compress_luma_addr);
>> +       hantro_write_addr(vpu, G2_COMP_CHR, compress_chroma_addr);
>>   
>>          hantro_hevc_ref_remove_unused(ctx);
>>   
>> @@ -490,6 +502,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>                  hantro_write_addr(vpu, G2_REG_ADDR_REF(i), 0);
>>                  hantro_write_addr(vpu, G2_REG_CHR_REF(i), 0);
>>                  hantro_write_addr(vpu, G2_REG_DMV_REF(i), 0);
>> +               hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), 0);
>> +               hantro_write_addr(vpu, G2_COMP_CHR_REF(i), 0);
>>          }
>>   
>>          hantro_reg_write(vpu, &g2_refer_lterm_e, dpb_longterm_e);
>> @@ -580,8 +594,8 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>>          /* Don't disable output */
>>          hantro_reg_write(vpu, &g2_out_dis, 0);
>>   
>> -       /* Don't compress buffers */
>> -       hantro_reg_write(vpu, &g2_ref_compress_bypass, 1);
>> +       /* Compress buffers */
>> +       hantro_reg_write(vpu, &g2_ref_compress_bypass, 0);
>>   
>>          /* use NV12 as output format */
>>          hantro_reg_write(vpu, &g2_out_rs_e, 1);
>> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
>> index 17d84ec9c5c2..0414d92e3860 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_regs.h
>> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
>> @@ -192,6 +192,10 @@
>>   #define G2_TILE_FILTER         (G2_SWREG(179))
>>   #define G2_TILE_SAO            (G2_SWREG(181))
>>   #define G2_TILE_BSD            (G2_SWREG(183))
>> +#define G2_COMP_ADDR_DST       (G2_SWREG(190))
>> +#define G2_COMP_ADDR_REF(i)    (G2_SWREG(192) + ((i) * 0x8))
>> +#define G2_COMP_CHR            (G2_SWREG(224))
>> +#define G2_COMP_CHR_REF(i)     (G2_SWREG(226) + ((i) * 0x8))
>>   
>>   #define g2_strm_buffer_len     G2_DEC_REG(258, 0, 0xffffffff)
>>   #define g2_strm_start_offset   G2_DEC_REG(259, 0, 0xffffffff)
>> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
>> index 5347f5a41c2a..1b2da990fbf0 100644
>> --- a/drivers/staging/media/hantro/hantro_hevc.c
>> +++ b/drivers/staging/media/hantro/hantro_hevc.c
>> @@ -61,12 +61,42 @@ static size_t hantro_hevc_mv_size(const struct v4l2_ctrl_hevc_sps *sps)
>>          return mv_size;
>>   }
>>   
>> +size_t hantro_hevc_luma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps)
>> +{
>> +       return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
>> +}
>> +
>> +static size_t hantro_hevc_luma_compress_size(const struct v4l2_ctrl_hevc_sps *sps)
>> +{
>> +       u32 pic_width_in_cbsy =
>> +               round_up((sps->pic_width_in_luma_samples + 8 - 1) / 8, 16);
>> +       u32 pic_height_in_cbsy = (sps->pic_height_in_luma_samples + 8 - 1) / 8;
>> +
>> +       return round_up(pic_width_in_cbsy * pic_height_in_cbsy, 16);
>> +}
>> +
>> +size_t hantro_hevc_chroma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps)
>> +{
>> +       return hantro_hevc_luma_compress_offset(sps) + hantro_hevc_luma_compress_size(sps);
>> +}
>> +
>> +static size_t hantro_hevc_chroma_compress_size(const struct v4l2_ctrl_hevc_sps *sps)
>> +{
>> +       u32 pic_width_in_cbsc =
>> +               round_up((sps->pic_width_in_luma_samples + 16 - 1) / 16, 16);
>> +       u32 pic_height_in_cbsc = (sps->pic_height_in_luma_samples / 2 + 4 - 1) / 4;
>> +
> Can we get some #defines for these magic numbers?
>
>> +       return round_up(pic_width_in_cbsc * pic_height_in_cbsc, 16);
>> +}
>> +
>>   static size_t hantro_hevc_ref_size(struct hantro_ctx *ctx)
>>   {
>>          const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>>          const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>>   
>> -       return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
>> +       return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps) +
>> +              hantro_hevc_luma_compress_size(sps) +
>> +              hantro_hevc_chroma_compress_size(sps);
>>   }
>>   
>>   static void hantro_hevc_ref_free(struct hantro_ctx *ctx)
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index 8fa0aacb61cd..c5374cd74d66 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -246,6 +246,8 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
>>   void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
>>   size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
>>   size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps);
>> +size_t hantro_hevc_luma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps);
>> +size_t hantro_hevc_chroma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps);
>>   
>>   static inline size_t
>>   hantro_h264_mv_size(unsigned int width, unsigned int height)
> Thanks,
> Ezequiel
>
