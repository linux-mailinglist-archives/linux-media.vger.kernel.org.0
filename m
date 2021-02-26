Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA4B326074
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 10:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhBZJso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 04:48:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54444 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhBZJsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 04:48:42 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:297a:447b:deb4:3f5c] (unknown [IPv6:2a01:e0a:4cb:a870:297a:447b:deb4:3f5c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C37D51F40EAE;
        Fri, 26 Feb 2021 09:47:57 +0000 (GMT)
Subject: Re: [PATCH v3 5/9] media: hantro: Introduce G2/HEVC decoder
To:     Ezequiel Garcia <ezequiel@collabora.com>, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
 <20210222122406.41782-6-benjamin.gaignard@collabora.com>
 <4a432492dc3894bef6024c74140891acc2e17604.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <6f3c23a6-4b74-c7b4-f6b2-2fb983a8bbb8@collabora.com>
Date:   Fri, 26 Feb 2021 10:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a432492dc3894bef6024c74140891acc2e17604.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 25/02/2021 à 18:55, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> Thanks for the good work!
> I mostly have two concerns with this implementation,
> the tiled output and the allocation path.
>
> More below.
>
> On Mon, 2021-02-22 at 13:24 +0100, Benjamin Gaignard wrote:
>> Implement all the logic to get G2 hardware decoding HEVC frames.
>> It support up level 5.1 HEVC stream.
>> It doesn't support yet 10 bits formats or scaling feature.
>>
>> Add HANTRO HEVC dedicated control to skip some bits at the beginning
>> of the slice header. That is very specific to this hardware so can't
>> go into uapi structures. Compute the needed value is complex and require
>> information from the stream that only the userland knows so let it
>> provide the correct value to the driver.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 2:
>> - squash multiple commits in this one.
>> - fix the comments done by Ezequiel about dma_alloc_coherent usage
>> - fix Dan's comments about control copy, reverse the test logic
>> in tile_buffer_reallocate, rework some goto and return cases.
>>
>>   drivers/staging/media/hantro/Makefile         |   2 +
>>   drivers/staging/media/hantro/hantro.h         |  19 +
>>   drivers/staging/media/hantro/hantro_drv.c     |  42 ++
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
>>   drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
>>   drivers/staging/media/hantro/hantro_hevc.c    | 321 ++++++++++
>>   drivers/staging/media/hantro/hantro_hw.h      |  47 ++
>>   7 files changed, 1216 insertions(+)
>>   create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>>   create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>>   create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
>>
>>
> [snip]
>> +
>> +static void set_buffers(struct hantro_ctx *ctx)
>> +{
>> +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +       struct hantro_dev *vpu = ctx->dev;
>> +       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>> +       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>> +       size_t cr_offset = hantro_hevc_chroma_offset(sps);
>> +       dma_addr_t src_dma, dst_dma;
>> +       u32 src_len, src_buf_len;
>> +
>> +       src_buf = hantro_get_src_buf(ctx);
>> +       dst_buf = hantro_get_dst_buf(ctx);
>> +
>> +       /* Source (stream) buffer. */
>> +       src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>> +       src_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
>> +       src_buf_len = vb2_plane_size(&src_buf->vb2_buf, 0);
>> +
>> +       hantro_write_addr(vpu, HEVC_ADDR_STR, src_dma);
>> +       hantro_reg_write(vpu, hevc_stream_len, src_len);
>> +       hantro_reg_write(vpu, hevc_strm_buffer_len, src_buf_len);
>> +       hantro_reg_write(vpu, hevc_strm_start_offset, 0);
>> +       hantro_reg_write(vpu, hevc_write_mvs_e, 1);
>> +
>> +       /* Destination (decoded frame) buffer. */
>> +       dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
>> +
>> +       hantro_write_addr(vpu, HEVC_RASTER_SCAN, dst_dma);
>> +       hantro_write_addr(vpu, HEVC_RASTER_SCAN_CHR, dst_dma + cr_offset);
> The way this is done the raster-scan output is the only
> output, and the tiled ouput it kept entirely internal, in hantro_hevc_dec_hw_ctx.ref_bufs.
>
> This means there's no way to expose tiled NV12 in i.MX8M VPU tiled format
> to userspace, which could be desirable for some use cases.
>
> I'm not suggesting to actually expose tiled NV12 in this patch, but to prepare
> the driver to be able to support that easily in the future.
>
> It should be possible to consider this detiling as
> post-processing, adding some code in hantro_postproc.c
> leveraging the existing post-proc support.
>
> IOW, hantro_postproc_ctx.dec_q would hold the tiled output,
> hantro_postproc_enable() writes the raster-scan
> buffer destination address, and so on.

Well the G2 can't use the post-processor so I'm reluctant to do as if it was the case.

To support tiled NV12 for me the solution is to create a hantro_hevc_add_ref_buf() function
to add the destination buffer in hevc_dec->ref_bufs.
We can test destination format to set hevc_out_rs_e bit and HEVC_RASTER_SCAN register.

>
>> +       hantro_write_addr(vpu, HEVC_ADDR_TILE_SIZE, ctx->hevc_dec.tile_sizes.dma);
>> +       hantro_write_addr(vpu, HEVC_TILE_FILTER, ctx->hevc_dec.tile_filter.dma);
>> +       hantro_write_addr(vpu, HEVC_TILE_SAO, ctx->hevc_dec.tile_sao.dma);
>> +       hantro_write_addr(vpu, HEVC_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
>> +}
>> +
>> +void hantro_g2_check_idle(struct hantro_dev *vpu)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < 3; i++) {
>> +               u32 status;
>> +
>> +               /* Make sure the VPU is idle */
>> +               status = vdpu_read(vpu, HEVC_REG_INTERRUPT);
>> +               if (status & HEVC_REG_INTERRUPT_DEC_E) {
>> +                       pr_warn("%s: still enabled!!! resetting.\n", __func__);
>> +                       status |= HEVC_REG_INTERRUPT_DEC_ABORT_E | HEVC_REG_INTERRUPT_DEC_IRQ_DIS;
>> +                       vdpu_write(vpu, status, HEVC_REG_INTERRUPT);
>> +               }
>> +       }
>> +}
>> +
>> +void hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>> +{
>> +       struct hantro_dev *vpu = ctx->dev;
>> +
>> +       hantro_g2_check_idle(vpu);
>> +
>> +       /* Prepare HEVC decoder context. */
>> +       if (hantro_hevc_dec_prepare_run(ctx))
>> +               return;
>> +
>> +       /* Configure hardware registers. */
>> +       set_params(ctx);
>> +
>> +       /* set reference pictures */
>> +       if (set_ref(ctx))
>> +               /* something goes wrong */
>> +               hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
>> +
> I don't think we want to allow the _run() operation to fail like this.
> In other words, I would avoid allocating buffers in the _run() path,
> and doing all allocation at start() time.
>
> That's why hantro_start_streaming() calls hantro_postproc_alloc() if needed.

The error could also be that the reference picture isn't found in the list so
we can't perform the decode operation.
If we do the allocation at start time we will allocate all the reference frames
buffers even if we don't know if we will use them. That could increase a lot
memory usage. Note that buffers allocated once and re-used until the end of the
session.

>
>> +       set_buffers(ctx);
>> +       prepare_tile_info_buffer(ctx);
>> +
>> +       hantro_end_prepare_run(ctx);
>> +
>> +       hantro_reg_write(vpu, hevc_mode, HEVC_DEC_MODE);
>> +       hantro_reg_write(vpu, hevc_clk_gate_e, 1);
>> +
>> +       /* Don't disable output */
>> +       hantro_reg_write(vpu, hevc_out_dis, 0);
>> +
>> +       /* Don't compress buffers */
>> +       hantro_reg_write(vpu, hevc_ref_compress_bypass, 1);
>> +
>> +       /* use NV12 as output format */
>> +       hantro_reg_write(vpu, hevc_tile_e, 0);
> Unless I'm missing something, this ^
>
>> +       hantro_reg_write(vpu, hevc_out_rs_e, 1);
>> +       hantro_reg_write(vpu, hevc_num_tile_rows, 1);
>> +       hantro_reg_write(vpu, hevc_num_tile_cols, 1);
>> +
> and this ^ these shouldn't be here.
>
> HEVC tiles are handled already. See prepare_tile_info_buffer().

You are right, I will remove that, thanks.

Benjamin

> Note that HEVC "tiles" are not related to NV12 "tiled" format.
>
> Thanks!
> Ezequiel
>
>
