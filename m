Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5A3A5770
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhFMJ4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 05:56:08 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:45671 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230255AbhFMJ4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 05:56:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sMoWlTz7BhqltsMoaliukF; Sun, 13 Jun 2021 11:54:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623578046; bh=SQyS+Y3p6UN65qWEUsJs2WXAkTNdt6/vcL+TKRR4/QI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NH2lLmGDRpDMHo5GbuZ2dRQ12B9au4vu16j+eqC4lKX7s6sM/rqXScRfwfrSs+2ZO
         y2G3ioxoRrjosfI6hmcEhbjkeH+DgxmjfI5kUTMw107Gi58My2J6eCBfgHQ0WDqwuM
         YfM/XARHYk/J0gQJBo+BoLnHYwp6/mwrpszej8cQl0eHG6l8PGOEnZ+EMDLd5JmNk3
         KzSmnjPwk3uSV6hxmC4+IEbrbVpm1GZa7/p+cAfb6IU3FXGTKuPKeh0eDDovzcdz6E
         eXFX+MkgSpzj6UFIfEmKOO1bKuIQWty/6msJPybwDmC0Bhx4buiiJs9jXJxSucWCQo
         ZoRSA9QeWRnpg==
Subject: Re: [PATCH 1/8] media: hantro: Trace hevc hw cycles performance
 register
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
 <20210604130619.491200-2-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dbf5f5e1-4989-c97d-3679-58af549b5082@xs4all.nl>
Date:   Sun, 13 Jun 2021 11:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604130619.491200-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC+qvsamcgTUEUyTEVHimnw2PMHl0XfEPb1n2rzUK/9wEqbYCo1bpuCq2E/jqEfXyTjejOZ1YLNH+WF3nx/PtNIKT4rrZzLYrtQOxrGrtvUtPd7sG2Aa
 qjiG1wFH6IO0pmH2R/L0xXwzoWLptRz+VYin8O+BGOMP+3Ox5+1jnR5cOnel2THG2kgzymNq8a3+gpv05HQHLzXo4Gwyi6aRoY8pbKfCFQYkvAr1y8ChzNxx
 Djt1CCb0B2pRfwFUefbhkjv42efzUogqSeUx5ox8nGXoIfGl/Ab0VTCg5KOSbATFXnB3UZ8uFI3mvc5AhcZzL9f7F72MdUnQziy0ORAbMr4DomY3ZqPJ95Qe
 vziPNG4mzChT8tAkosQNwDYQ2ILD0lhmYjsaqUyEFPiHBhUsDrZuKJYSEeCOivCEC2ZK7HZ3auwEdjxGOSGkQPT9kYp6Jtbvktb5WgEeuon/mYANfHFwIZG8
 x7ytrwSqgouOZBb6iVqyvxv1iL6cF78SCagtRtoP23vCy++xDWEmUVnPOxAgJRQfzOLHT8r0RCjVJ0ySjr6KhlF3I892je1kSehV/dkoKU5g3sbOolVORgw3
 0Ju0O5CVzo2UR8jo5OYRVPmFYq6g6t5Y+5V+eLC6ByXQvZPNPi2eo00IKL2RkvuwBTFEJ7ErkGNz2LIvcFRew2ZbY4tBV31QwPnX535j2I880Hgtp6mhJYRf
 YH1qcDjL92GS8JNk7rXDPNp0gcj24//GEfQpzB6o2GquY6wnq73/MG8QKm/ApbfNCpX5rw3PpcDyjTWTuviGNJcPUc/NBtmvslVdsb2DFb61jK/5OGgVjc7j
 dNjbShTto4ytcCpdoSpdzh1uH51r+0avBnMIuo0CgjMhYn0OpKXpBVHC101ylP7zneV5+kdrU2okqLw/IDDmePkVle9/jCDZ20DOPcW7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2021 15:06, Benjamin Gaignard wrote:
> After each hevc decoded frame trace the hardware performance.
> It provides the number of hw cycles spend per decoded macroblock.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c     |  3 ++
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 16 ++++++++
>  drivers/staging/media/hantro/hantro_g2_regs.h |  1 +
>  drivers/staging/media/hantro/hantro_hw.h      |  1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  1 +
>  drivers/staging/media/hantro/trace.h          | 40 +++++++++++++++++++

Can you rename this to hantro_trace.h? I prefer to have the driver prefix in the name.

Regards,

	Hans

>  6 files changed, 62 insertions(+)
>  create mode 100644 drivers/staging/media/hantro/trace.h
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index dbc69ee0b562..6053c86b1c3f 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -28,6 +28,9 @@
>  #include "hantro.h"
>  #include "hantro_hw.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> +
>  #define DRIVER_NAME "hantro-vpu"
>  
>  int hantro_debug;
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 340efb57fd18..89fac5146433 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -7,6 +7,7 @@
>  
>  #include "hantro_hw.h"
>  #include "hantro_g2_regs.h"
> +#include "trace.h"
>  
>  #define HEVC_DEC_MODE	0xC
>  
> @@ -22,6 +23,21 @@ static inline void hantro_write_addr(struct hantro_dev *vpu,
>  	vdpu_write(vpu, addr & 0xffffffff, offset);
>  }
>  
> +void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx)
> +{
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 hw_cycles = 0;
> +	u32 mbs = (sps->pic_width_in_luma_samples *
> +		   sps->pic_height_in_luma_samples) >> 8;
> +
> +	if (mbs)
> +		hw_cycles = vdpu_read(vpu, G2_HW_PERFORMANCE) / mbs;
> +
> +	trace_hantro_hevc_perf(ctx, hw_cycles);
> +}
> +
>  static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> index bb22fa921914..17d84ec9c5c2 100644
> --- a/drivers/staging/media/hantro/hantro_g2_regs.h
> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> @@ -177,6 +177,7 @@
>  #define G2_REG_CONFIG_DEC_CLK_GATE_E		BIT(16)
>  #define G2_REG_CONFIG_DEC_CLK_GATE_IDLE_E	BIT(17)
>  
> +#define G2_HW_PERFORMANCE	(G2_SWREG(63))
>  #define G2_ADDR_DST		(G2_SWREG(65))
>  #define G2_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
>  #define G2_ADDR_DST_CHR		(G2_SWREG(99))
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 5737a7707944..8fa0aacb61cd 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -240,6 +240,7 @@ void hantro_h264_dec_exit(struct hantro_ctx *ctx);
>  int hantro_hevc_dec_init(struct hantro_ctx *ctx);
>  void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
>  int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
> +void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx);
>  int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
>  dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
>  void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index ea919bfb9891..7e9e24bb5057 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -239,6 +239,7 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>  		.reset = imx8m_vpu_g2_reset,
>  		.init = hantro_hevc_dec_init,
>  		.exit = hantro_hevc_dec_exit,
> +		.done = hantro_g2_hevc_dec_done,
>  	},
>  };
>  
> diff --git a/drivers/staging/media/hantro/trace.h b/drivers/staging/media/hantro/trace.h
> new file mode 100644
> index 000000000000..8abe5ddb4814
> --- /dev/null
> +++ b/drivers/staging/media/hantro/trace.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM hantro
> +
> +#if !defined(__HANTRO_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __HANTRO_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "hantro.h"
> +
> +TRACE_EVENT(hantro_hevc_perf,
> +	TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
> +
> +	TP_ARGS(ctx, hw_cycles),
> +
> +	TP_STRUCT__entry(
> +		__field(int, minor)
> +		__field(u32, hw_cycles)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->minor = ctx->fh.vdev->minor;
> +		__entry->hw_cycles = hw_cycles;
> +	),
> +
> +	TP_printk("minor = %d, %8d cycles / mb",
> +		  __entry->minor, __entry->hw_cycles)
> +);
> +
> +#endif /* __HANTRO_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/staging/media/hantro
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> 

