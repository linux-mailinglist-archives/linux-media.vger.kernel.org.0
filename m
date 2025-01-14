Return-Path: <linux-media+bounces-24738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B368A11253
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 21:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DC517A4BD3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D520AF7E;
	Tue, 14 Jan 2025 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qLE9R3XB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28A20AF65;
	Tue, 14 Jan 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887376; cv=none; b=h3p5CiRZ4GwIGIEnsL3FOwDtnT1Zy4ADgcx5nC1ohY1ccr1DHiEO+6JZ4XdtvN50+1Ec0otNKP+xfwfN2/Dyz/bokor35O7GLfQmfYbnv9Fa8PSAKbkVX/KdlwTCQmAU2yssq1itLv9RuV8HzBOQTMKDWdyZM94gPOFxQedp+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887376; c=relaxed/simple;
	bh=knBeCZ/Pci7DtGSYrR7+mjr63pCPMRaSNdrcKTEColk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1QYd56H8zDfKORnUy6Qz5X4mWtrr8+3X8OGTIdujHcX1mIjR/Ahh1GdA4exmly17eJZdnu3XTR1PIpxT9oiPCyk2n20hTRdPSDJJlJXFpo5o+XWQ8bwgS4v8Oq9SbuZpbu1q9d6q43Et7zuhoOygTBH/5iELMaHHoyUAUGtIVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qLE9R3XB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0290D7E9;
	Tue, 14 Jan 2025 21:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736887308;
	bh=knBeCZ/Pci7DtGSYrR7+mjr63pCPMRaSNdrcKTEColk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLE9R3XB//5n8s2o/+NAtuj/BCaLwlTKOZr71W2RApEOTyi6RgMg5gdQHgQKVOy2h
	 je2AlybY7MicqjenAr4rj+kbeF1V4H/9fyKzY/PINTQqnW2/eB2a3DtyrRHoLVYuaS
	 IPsYqMZmCcIzl921PBH2AvXZHUJAFDmSUwF2qVjU=
Date: Tue, 14 Jan 2025 22:42:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Sean Young <sean@mess.org>, Olli Salonen <olli.salonen@iki.fi>,
	Abylay Ospan <aospan@amazon.com>, Jemma Denson <jdenson@gmail.com>,
	Patrick Boettcher <patrick.boettcher@posteo.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Tim Harvey <tharvey@gateworks.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
Message-ID: <20250114204240.GA29414@pendragon.ideasonboard.com>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>

Hi Krzysztof,

Thank you for the patch.

On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.

It's more difficult to read for me.

> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.

I don't see why the linker can't de-dup string in the current code.

I'm sorry, I just don't see the point in doing this. I'd like to avoid
those changes in the Linux media subsystem, or at the very least in
drivers I maintain.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/amphion/venc.c              |  3 ++-
>  drivers/media/platform/amphion/vpu_dbg.c           |  3 ++-
>  drivers/media/platform/aspeed/aspeed-video.c       |  5 +++--
>  drivers/media/platform/chips-media/coda/coda-bit.c |  3 ++-
>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 ++-
>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  7 ++++---
>  drivers/media/platform/ti/cal/cal-camerarx.c       |  3 ++-
>  drivers/media/platform/ti/omap3isp/ispstat.c       |  3 ++-
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 19 ++++++++++---------
>  9 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
> index c5c1f1fbaa80366d5b18b8f24699eb9c3a18ef92..65b1665eece8cd6efc535281b3be593abaf9ba64 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -13,6 +13,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/ktime.h>
>  #include <linux/rational.h>
> +#include <linux/string_choices.h>
>  #include <linux/vmalloc.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -1215,7 +1216,7 @@ static int venc_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
>  		break;
>  	case 8:
>  		num = scnprintf(str, size, "rc: %s, mode = %d, bitrate = %d(%d), qp = %d\n",
> -				venc->params.rc_enable ? "enable" : "disable",
> +				str_enable_disable(venc->params.rc_enable),
>  				venc->params.rc_mode,
>  				venc->params.bitrate,
>  				venc->params.bitrate_max,
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index 940e5bda5fa391c47552c275bd1266f47d57f475..b726d884086d306cd4298dc46440a2235b311b86 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/string_choices.h>
>  #include <media/v4l2-device.h>
>  #include <linux/debugfs.h>
>  #include "vpu.h"
> @@ -256,7 +257,7 @@ static int vpu_dbg_core(struct seq_file *s, void *data)
>  		return 0;
>  
>  	num = scnprintf(str, sizeof(str), "power %s\n",
> -			vpu_iface_get_power_state(core) ? "on" : "off");
> +			str_on_off(vpu_iface_get_power_state(core)));
>  	if (seq_write(s, str, num))
>  		return 0;
>  	num = scnprintf(str, sizeof(str), "state = %d\n", core->state);
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 54cae0da9aca3fd74800b51f79136a261aec241a..d9cf12af05b75c76c506f6e7d72dfc41c9e05317 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -19,6 +19,7 @@
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/v4l2-controls.h>
>  #include <linux/videodev2.h>
>  #include <linux/wait.h>
> @@ -1227,7 +1228,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
>  		 video->jpeg_quality);
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
> -		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
> +		 str_on_off(video->hq_mode), video->jpeg_hq_quality);
>  
>  	if (video->format == VIDEO_FMT_ASPEED)
>  		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
> @@ -1939,7 +1940,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>  	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
>  	if (v->format == VIDEO_FMT_ASPEED) {
>  		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
> -			   v->hq_mode ? "on" : "off");
> +			   str_on_off(v->hq_mode));
>  		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
>  			   v->hq_mode ? v->jpeg_hq_quality : 0);
>  	}
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
> index 84ded154adfe37147218d60278a1c1fac88ecadc..2cb0c04003da750f7108578e274da31778c3f2d2 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -16,6 +16,7 @@
>  #include <linux/ratelimit.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/v4l2-common.h>
> @@ -1881,7 +1882,7 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
>  	lockdep_assert_held(&dev->coda_mutex);
>  
>  	coda_dbg(1, ctx, "Video Data Order Adapter: %s\n",
> -		 ctx->use_vdoa ? "Enabled" : "Disabled");
> +		 str_enabled_disabled(ctx->use_vdoa));
>  
>  	/* Start decoding */
>  	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> index c3561fcecb98c7d3cd741c28afcb2a3854eaa0e7..abdff181d417788460b7f6230ea54789b242d436 100644
> --- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
> +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include "imx-vdoa.h"
>  
> @@ -117,7 +118,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
>  	writel(val, vdoa->regs + VDOAIST);
>  	if (val & VDOAIST_TERR) {
>  		val = readl(vdoa->regs + VDOASR) & VDOASR_ERRW;
> -		dev_err(vdoa->dev, "AXI %s error\n", val ? "write" : "read");
> +		dev_err(vdoa->dev, "AXI %s error\n", str_write_read(val));
>  	} else if (!(val & VDOAIST_EOT)) {
>  		dev_warn(vdoa->dev, "Spurious interrupt\n");
>  	}
> diff --git a/drivers/media/platform/st/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
> index a86a07b6fbc792fc06db2dbbb3934694136a7813..1cb5bca44939606f39911a41e5f464be888848c2 100644
> --- a/drivers/media/platform/st/sti/hva/hva-debugfs.c
> +++ b/drivers/media/platform/st/sti/hva/hva-debugfs.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/string_choices.h>
>  
>  #include "hva.h"
>  #include "hva-hw.h"
> @@ -71,12 +72,12 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
>  			      "  | |- SEI frame packing type=%s\n",
>  			      v4l2_ctrl_get_menu(entropy)[ctrls->entropy_mode],
>  			      ctrls->cpb_size,
> -			      ctrls->dct8x8 ? "true" : "false",
> +			      str_true_false(ctrls->dct8x8),
>  			      ctrls->qpmin,
>  			      ctrls->qpmax,
> -			      ctrls->vui_sar ? "true" : "false",
> +			      str_true_false(ctrls->vui_sar),
>  			      v4l2_ctrl_get_menu(vui_sar)[ctrls->vui_sar_idc],
> -			      ctrls->sei_fp ? "true" : "false",
> +			      str_true_false(ctrls->sei_fp),
>  			      v4l2_ctrl_get_menu(sei_fp)[ctrls->sei_fp_type]);
>  	}
>  
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 42dfe08b765f6bbdb0ab8cca0f7d6d87f2ff18eb..a70814cbada82654e926b12bcde73300107aaa8a 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> @@ -191,7 +192,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
>  
>  	if (i == 10)
>  		phy_err(phy, "Failed to power %s complexio\n",
> -			enable ? "up" : "down");
> +			str_up_down(enable));
>  }
>  
>  static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
> diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
> index 359a846205b0ffe9e736c7ed37c22677991cc9f2..f1293d412415d3fe36a87e7aa93a60e7daf693d8 100644
> --- a/drivers/media/platform/ti/omap3isp/ispstat.c
> +++ b/drivers/media/platform/ti/omap3isp/ispstat.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/timekeeping.h>
>  #include <linux/uaccess.h>
>  
> @@ -768,7 +769,7 @@ int omap3isp_stat_enable(struct ispstat *stat, u8 enable)
>  	unsigned long irqflags;
>  
>  	dev_dbg(stat->isp->dev, "%s: user wants to %s module.\n",
> -		stat->subdev.name, enable ? "enable" : "disable");
> +		stat->subdev.name, str_enable_disable(enable));
>  
>  	/* Prevent enabling while configuring */
>  	mutex_lock(&stat->ioctl_lock);
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 146131b8f37e5a30b168164d4eaedc9641d6af31..a5074f05cee50e117256fdb8496b977332757e27 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include <linux/v4l2-subdev.h>
>  #include <media/media-entity.h>
>  #include <media/mipi-csi2.h>
> @@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  	dev_info(dev, "***** Core Status *****\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
>  	dev_info(dev, "Short Packet FIFO Full = %s\n",
> -		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
>  	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
> -		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFONE));
>  	dev_info(dev, "Stream line buffer full = %s\n",
> -		 data & XCSI_CSR_SLBF ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SLBF));
>  	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
> -		 data & XCSI_CSR_RIPCD ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_RIPCD));
>  
>  	/* Clk & Lane Info  */
>  	dev_info(dev, "******** Clock Lane Info *********\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
>  	dev_info(dev, "Clock Lane in Stop State = %s\n",
> -		 data & XCSI_CLKINFR_STOP ? "true" : "false");
> +		 str_true_false(data & XCSI_CLKINFR_STOP));
>  
>  	dev_info(dev, "******** Data Lane Info *********\n");
>  	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
> @@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  		data = xcsi2rxss_read(xcsi2rxss, reg);
>  
>  		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
> -			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_STOP ? "true" : "false");
> +			 str_true_false(data & XCSI_DLXINFR_SOTERR),
> +			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
> +			 str_true_false(data & XCSI_DLXINFR_STOP));
>  
>  		reg += XCSI_NEXTREG_OFFSET;
>  	}
> @@ -889,7 +890,7 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
>  	fwnode_handle_put(ep);
>  
>  	dev_dbg(dev, "vcx %s, %u data lanes (%s), data type 0x%02x\n",
> -		xcsi2rxss->en_vcx ? "enabled" : "disabled",
> +		str_enabled_disabled(xcsi2rxss->en_vcx),
>  		xcsi2rxss->max_num_lanes,
>  		xcsi2rxss->enable_active_lanes ? "dynamic" : "static",
>  		xcsi2rxss->datatype);

-- 
Regards,

Laurent Pinchart

