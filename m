Return-Path: <linux-media+bounces-1843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1EB80899D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 14:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8B11F2142B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CAF40C18;
	Thu,  7 Dec 2023 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FkjPM1wr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0165510EF
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 05:55:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68257552;
	Thu,  7 Dec 2023 14:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701957292;
	bh=OFpJzwelwgBs/XgEh6SwRpEDvhXjJ+wofaBgDTj7akI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkjPM1wrVoT1eWhZROkheCiaHOTGg52RtGSeWhVEz+mqY/WfzPMmFyAsT8UysinlH
	 aXUm8iheXBz8APwZN3m7FEKil7xFad5STYx0KYmEEr6n0vXqo5FSGxyP8MyltTYUDo
	 Jnq1DdXXwR06he3Hhs7SpWoQsbrRozdnsSaU3Mxw=
Date: Thu, 7 Dec 2023 15:55:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] media: nxp: imx8-isi-debug: Add missing 36-Bit
 DMA registers to debugfs output
Message-ID: <20231207135539.GJ9675@pendragon.ideasonboard.com>
References: <20231207110918.1338524-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207110918.1338524-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thank you for the patch.

On Thu, Dec 07, 2023 at 12:09:18PM +0100, Alexander Stein wrote:
> The extended address registers are missing in the debug output register
> list. These are only available on 36-Bit DMA platforms. Due to the
> prolonged name, the output width has to be adjusted as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Split register set into regular and 36-Bit DMA only
> * Adjust output width to address longer register names
> 
> Currently only tested on TQMa8MPxL (imx8mp-tqma8mpql-mba8mpxl.dts)
> 
>  .../platform/nxp/imx8-isi/imx8-isi-debug.c    | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> index 6709ab7ea1f3..398864b5e506 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> @@ -22,10 +22,11 @@ static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
>  static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
>  {
>  #define MXC_ISI_DEBUG_REG(name)		{ name, #name }
> -	static const struct {
> +	struct debug_regs {
>  		u32 offset;
>  		const char * const name;
> -	} registers[] = {
> +	};
> +	static const struct debug_regs registers[] = {
>  		MXC_ISI_DEBUG_REG(CHNL_CTRL),
>  		MXC_ISI_DEBUG_REG(CHNL_IMG_CTRL),
>  		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF_CTRL),
> @@ -67,6 +68,16 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
>  		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
>  		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
>  	};
> +	/* There registers contain the upper 4Bits of 36-Bit DMA addresses */

s/There/These/

> +	static const struct debug_regs registers_36bit_dma[] = {
> +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
> +		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
> +	};
>  
>  	struct mxc_isi_pipe *pipe = m->private;
>  	unsigned int i;
> @@ -77,10 +88,21 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
>  	seq_printf(m, "--- ISI pipe %u registers ---\n", pipe->id);
>  
>  	for (i = 0; i < ARRAY_SIZE(registers); ++i)
> -		seq_printf(m, "%20s[0x%02x]: 0x%08x\n",
> +		seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
>  			   registers[i].name, registers[i].offset,
>  			   mxc_isi_read(pipe, registers[i].offset));
>  
> +	if (pipe->isi->pdata->has_36bit_dma) {
> +		for (i = 0; i < ARRAY_SIZE(registers_36bit_dma); ++i) {
> +			const struct debug_regs *reg = &registers_36bit_dma[i];
> +
> +			seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
> +				reg->name,
> +				reg->offset,
> +				mxc_isi_read(pipe, reg->offset));

Lines should be aligned under the "m" of the first line.

I'll fix these small issues when applying, no need to send a v3.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		}
> +	}
> +
>  	pm_runtime_put(pipe->isi->dev);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

