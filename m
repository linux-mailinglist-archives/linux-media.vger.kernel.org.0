Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C0F3FD8B6
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243733AbhIAL2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238424AbhIAL2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:28:51 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A94C061575;
        Wed,  1 Sep 2021 04:27:53 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id LOPFmJkhu0e6wLOPGmQF42; Wed, 01 Sep 2021 13:27:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630495672; bh=7MjIq9DrLqf2feI45rNo8/0rkK8PmdE54UQ5xesuT1Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RcBymD3JlDdYh7JVdfp8f80cg20/EBQGZJaGM1srAA/+XHdY1+zhLrvOp3B1jba0r
         dDdIMDY/spgDEe3IhxUluXZkLhVMs/7ArxmwEWJOk0irs2gcYVE8RTefzUwSHAPcKa
         m2627W5CCGjxw/NvPcGgSqHuVXXFB2snd9X0nbvyW0SZbxZxtnIMiIDTntvXCH3RDd
         uE/EO/EZdTeraituJH+RWpPPekNHDzmp8DeVr6hB4dm3LON/lKo0DEc20H4WUaBobF
         vouitnTobqL4l59mDbY0xtXPqODy18Q21UnpIUjf75XkU08WRA8e+Py2+a0IpD7ZVp
         2fzotB1flTDFA==
Subject: Re: [PATCH] media: hantro: Trace hevc hw cycles performance register
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        Ezequiel Garcia <elezegarcia@gmail.com>
References: <20210823135606.633052-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f9edaa49-31cb-b98f-1c79-13b151513077@xs4all.nl>
Date:   Wed, 1 Sep 2021 13:27:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823135606.633052-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC4xkAZsoqg+9dmEoRPAO2iiF1UV7C3dEE2KqskEwbdc/GySvbVsjVzfDap+9vxAz2hGienCE7N+1dPgxs291LOUN5rxkd0M2M+3alEPmQC01WkkKJTV
 a2O337cJLuQAjAZGHFHCDHJvrbQMgtaqSUjDSS+wvnnbRzyfxDHDNKaFl3ai3QGn3aUyPLLpLC9j957fa/hskAYWeW86+KtUFBDtqV39c4fOsCMzRgCfRT+4
 sJRsn+rTBvA5f9hgzOVVh14MTN9IsrCok/UfgAhDoCpLfmpnlpqQPba02xnbu/scRm9zowUdik7O9voa1EzHSoJ1aNHO/SGX1O7Scb5yuHbViOhPm66rQsuH
 Wi3YNNTJ5XeH+AVk3xdbl8bBpw2486WAIuSvooe99XkpCmQu1fTKrnW5BPfIO5KVsh6HYEjZhhgP5ls1mZojrvhJZm2xAfzuAj18SoCPrR8f3N6kn6fkBVuw
 eHHYtkdf8+f5S8ccDZiB1hCAR+RAHN3q666LX31Owe9xSJu4CAspBPYQqjIYUl9igdE/ni/7du1zx2z/VoKAI0JijJhZug5DMDICgJMyHwn43vySU4gEJDxs
 aVEZ9V+Vgt/gNXRxm8+1zil2mOg1+3+W16krKuP31hlEw6crKuoiJry5NJoTd3oRiVdmMUJTOJvqqDfk3wuh8X/wPQ62NzDA2oAqPnftcV5WmiLEXrzlg+Xk
 vA+Au+KZv8IhVw6m6ox3ZFpaOIab4XdYQmf2XejMVB+RuVDEJjx0KxuT84hv24FB+u/yIZLe4QWqEMEGxv/jWbalWXo+G7inV40SXclHFyIMMNEt4D5FJvnH
 rnYgE8a+ZHaOHhhh4lC8oylj4s/64Soy7LsSEg9u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

I'm confused: this is also part of '[PATCH v4 0/9] Additional features for Hantro HEVC', so
do you want to merge this independently from that series? Are there differences between v4 1/9
and this patch, or are they identical?

In any case, I'd like to have a Reviewed-by or Acked-by from Ezequiel before merging this.

Regards,

	Hans

On 23/08/2021 15:56, Benjamin Gaignard wrote:
> After each hevc decoded frame trace the hardware performance.
> It provides the number of hw cycles spend per decoded macroblock.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  Documentation/admin-guide/media/hantro.rst    | 14 +++++++
>  .../admin-guide/media/v4l-drivers.rst         |  1 +
>  drivers/staging/media/hantro/hantro_drv.c     |  3 ++
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 16 ++++++++
>  drivers/staging/media/hantro/hantro_g2_regs.h |  1 +
>  drivers/staging/media/hantro/hantro_hw.h      |  1 +
>  drivers/staging/media/hantro/hantro_trace.h   | 41 +++++++++++++++++++
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  1 +
>  8 files changed, 78 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/hantro.rst
>  create mode 100644 drivers/staging/media/hantro/hantro_trace.h
> 
> diff --git a/Documentation/admin-guide/media/hantro.rst b/Documentation/admin-guide/media/hantro.rst
> new file mode 100644
> index 000000000000..6cb552a5dfcb
> --- /dev/null
> +++ b/Documentation/admin-guide/media/hantro.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================
> +The hantro driver
> +=================
> +
> +Trace
> +~~~~~
> +
> +You can trace the hardware decoding performances by using event tracing::
> +
> +    # echo hantro_hevc_perf >> /sys/kernel/debug/tracing/set_event
> +
> +That will keep a log of the number of hardware cycles spend per decoded macroblock
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index 9c7ebe2ca3bd..4f2f72a2b3b5 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -15,6 +15,7 @@ Video4Linux (V4L) driver-specific documentation
>  	cx88
>  	davinci-vpbe
>  	fimc
> +        hantro
>  	imx
>  	imx7
>  	ipu3
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 8a2edd67f2c6..236160c51e59 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -28,6 +28,9 @@
>  #include "hantro.h"
>  #include "hantro_hw.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "hantro_trace.h"
> +
>  #define DRIVER_NAME "hantro-vpu"
>  
>  int hantro_debug;
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 340efb57fd18..fef16d1724da 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -7,6 +7,7 @@
>  
>  #include "hantro_hw.h"
>  #include "hantro_g2_regs.h"
> +#include "hantro_trace.h"
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
> index df7b5e3a57b9..ab6f379354cc 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -250,6 +250,7 @@ void hantro_h264_dec_exit(struct hantro_ctx *ctx);
>  int hantro_hevc_dec_init(struct hantro_ctx *ctx);
>  void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
>  int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
> +void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx);
>  int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
>  dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
>  void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
> diff --git a/drivers/staging/media/hantro/hantro_trace.h b/drivers/staging/media/hantro/hantro_trace.h
> new file mode 100644
> index 000000000000..fa8fec26fa3c
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_trace.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(__HANTRO_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __HANTRO_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "hantro.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM hantro
> +#define TRACE_INCLUDE_FILE hantro_trace
> +
> +TRACE_EVENT(hantro_hevc_perf,
> +	TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
> +
> +	TP_ARGS(ctx, hw_cycles),
> +
> +	TP_STRUCT__entry(
> +		__field(int, minor)
> +		__field(struct v4l2_fh *, fh)
> +		__field(u32, hw_cycles)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->minor = ctx->fh.vdev->minor;
> +		__entry->fh = &ctx->fh;
> +		__entry->hw_cycles = hw_cycles;
> +	),
> +
> +	TP_printk("minor = %d, fh = %p, %8d cycles / mb",
> +		  __entry->minor, __entry->fh, __entry->hw_cycles)
> +);
> +
> +#endif /* __HANTRO_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/staging/media/hantro
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
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
> 

