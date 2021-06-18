Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830003AD26F
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 20:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhFRTBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 15:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhFRTBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 15:01:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389D0C061574;
        Fri, 18 Jun 2021 11:59:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C099B1F44BE3
Message-ID: <418311dac48d3a29b4fe9e363f7d4e82c360f586.camel@collabora.com>
Subject: Re: [PATCH v3 1/8] media: hantro: Trace hevc hw cycles performance
 register
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 18 Jun 2021 15:58:46 -0300
In-Reply-To: <20210618131526.566762-2-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-2-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> After each hevc decoded frame trace the hardware performance.
> It provides the number of hw cycles spend per decoded macroblock.
> 

Please add some documentation about how these are supposed
to be used. It will be easier to discuss after seeing
things in actiion.

A good place for the documentation would be:

https://www.kernel.org/doc/html/latest/admin-guide/media/v4l-drivers.html

[..]
> @@ -22,6 +23,21 @@ static inline void hantro_write_addr(struct hantro_dev *vpu,
>         vdpu_write(vpu, addr & 0xffffffff, offset);
>  }
>  
> +void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx)

I'm worried about the runtime cost this would have.

I see other drivers (i915, panfrost) seem to have an ioctl
to enable the perf counters.

Perhaps we don't need an ioctl, but a module param would be enough
for now.

> +{
> +       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +       struct hantro_dev *vpu = ctx->dev;
> +       u32 hw_cycles = 0;
> +       u32 mbs = (sps->pic_width_in_luma_samples *
> +                  sps->pic_height_in_luma_samples) >> 8;
> +
> +       if (mbs)
> +               hw_cycles = vdpu_read(vpu, G2_HW_PERFORMANCE) / mbs;
> +
> +       trace_hantro_hevc_perf(ctx, hw_cycles);
> +}
> +
> 
[..]
> +
> +TRACE_EVENT(hantro_hevc_perf,
> +       TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
> +
> +       TP_ARGS(ctx, hw_cycles),
> +
> +       TP_STRUCT__entry(
> +               __field(int, minor)
> +               __field(u32, hw_cycles)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->minor = ctx->fh.vdev->minor;

Tracking performance per minor doesn't seem useful,
we'd like to track per-fd (i.e. per context).

Thanks,
Ezequiel

