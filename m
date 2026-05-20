Return-Path: <linux-media+bounces-62352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH9kFpMwDmoK7wUAu9opvQ
	(envelope-from <linux-media+bounces-62352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:07:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C959BBF5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CC6E30430E6
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 21:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E6837B01C;
	Wed, 20 May 2026 21:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nc2UvtP5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB9374726;
	Wed, 20 May 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311396; cv=none; b=m41yLHhwZPE7FT1ACIQM6rFU1n2t5h6TInhZHicg1QYrgNMprt9s002oaSaPyOMIO7pr5EtYoKQSGmf9OxiKkJ7DDh2r9obtmQBh37it05B3UFFXz8lPa61N6lUSew3KsJwA2EYXxPTN9+qh2unDllOKEmJj7QtN4VJt+niJ0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311396; c=relaxed/simple;
	bh=M/vwP21jcgLC8DurVFWWxnYEAEIbfadUhNFk/hn/kaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVZN+NhcduTLc34VzQC77AJ6P2rXUoVjW8/5NR41JB5nH1bUtAF7waposiSxghn/3WUl79cxVH4PWe9aGnc74e3DWrvVXkI0FUyxJJYuEj8EPwqfc6F2WJDrIsy+z+2tPp4P7cSCxX3Wl8ZMJ/3vBvmJijaP6/uwa81shgmzZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nc2UvtP5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3989C42B;
	Wed, 20 May 2026 23:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779311379;
	bh=M/vwP21jcgLC8DurVFWWxnYEAEIbfadUhNFk/hn/kaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nc2UvtP58PfVDhFDxdslsowp2jOdItNhfBHHluVARF+YBl/+Q2w+XjIg3AcIkUGT7
	 ZRxO6R+ja0T9tj/xH7hQWOawoJs2ziCVZJCXmbTEQrbngaxcO3L9TLXYXIZwO8Mibe
	 iLWtT67DLIwsqfAubAiVLGAi8nTlAli/LtttYiOQ=
Date: Wed, 20 May 2026 23:09:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 1/2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <20260520210952.GB9017@killaraus.ideasonboard.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
 <20260508-isi_vc-v4-1-feee39c63939@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-isi_vc-v4-1-feee39c63939@oss.nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62352-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 578C959BBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Guoniu,

Thank you for the patch.

On Fri, May 08, 2026 at 11:05:40AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI supports different numbers of virtual channels depending on the
> platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
> virtual channels. They are used in multiple camera use cases, such as
> surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
> support virtual channels, and the VC_ID bits are marked as read-only.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v4:
> - Fix VC boundary check: use num_vc (virtual channels count) instead of
>   num_channels (ISI pipelines count)
> - Set VC to 0 when frame descriptor has no entries
> - Move platform-specific comments to block style to fix line length warnings
> 
> Changes in v3:
> - Add num_vc field to platform data to indicate VC support
> - Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
> - Set VC_ID_1 only on platforms with num_vc > 4
> - Improve mxc_isi_get_vc() error handling
> - Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 ++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 59 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 +++--
>  5 files changed, 88 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..837ac7046cf2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
> +	.num_vc			= 8,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 14d63ec36416..195c28dbd151 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
>  	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
> +	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
>  	unsigned int reg_offset;
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
> @@ -257,6 +258,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	/* Virtual channel ID for the ISI channel */
> +	u8				vc;

I try not to store such values in global structures, when the purpose is
to pass them between functions in a direct call stack. You can instead
return the vc value from mxc_isi_get_vc(), pass it to
mxc_isi_channel_config() and from there to
mxc_isi_channel_set_control().

>  };
>  
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8..ecd0c2ef28b6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -308,6 +308,11 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	mutex_lock(&pipe->lock);
>  
>  	val = mxc_isi_read(pipe, CHNL_CTRL);
> +
> +	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
> +	if (pipe->isi->pdata->num_vc > 4)
> +		val &= ~CHNL_CTRL_VC_ID_1_MASK;
> +

Please move this just after the next statement, we usually start with
generic statements followed by conditional ones.

>  	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
>  		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
>  		 CHNL_CTRL_SRC_INPUT_MASK);
> @@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc); /* FIXME: For CSI-2 only */
> +
> +		/*
> +		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
> +		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
> +		 */
> +		if (pipe->isi->pdata->num_vc > 4)
> +			val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
>  	}
>  
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..e6da254a9ef0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,61 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>  
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc fd = { };
> +	unsigned int source_pad = xbar->num_sinks + pipe->id;
> +	unsigned int max_vc;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       source_pad, &fd);
> +	if (ret == -ENOIOCTLCMD) {

Is this needed ? If we swap patches 1/2 and 2/2, the get_frame_desc
operation should always be available on the source. 

> +		/*
> +		 * If remote subdev doesn't implement get_frame_desc.
> +		 * Assume virtual channel 0.
> +		 */
> +		pipe->vc = 0;
> +		return 0;
> +	}
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			source_pad);
> +		return ret;
> +	}
> +
> +	if (!fd.num_entries) {
> +		pipe->vc = 0;
> +		return 0;
> +	}

Similarly, can this happen ?

> +
> +	/* Find stream 0 in the frame descriptor */
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream == 0)
> +			break;
> +	}
> +
> +	if (i == fd.num_entries) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EINVAL;

I think -EPIPE would be more appropriate, this indicates the pipeline
isn't correctly configured.

> +	}
> +
> +	max_vc = pipe->isi->pdata->num_vc ? : 1;
> +
> +	/* Check virtual channel range */
> +	if (fd.entry[i].bus.csi2.vc >= max_vc) {
> +		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
> +			fd.entry[i].bus.csi2.vc, max_vc - 1);
> +		return -EINVAL;

Same here.

> +	}
> +
> +	pipe->vc = fd.entry[i].bus.csi2.vc;
> +	return 0;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -280,6 +335,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  
>  	v4l2_subdev_unlock_state(state);
>  
> +	ret = mxc_isi_get_vc(pipe);
> +	if (ret)
> +		return ret;
> +
>  	/* Configure the ISI channel. */
>  	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
>  			       sink_info->encoding, src_info->encoding);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 1b65eccdf0da..e795f4daf3ff 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -6,6 +6,7 @@
>  #ifndef __IMX8_ISI_REGS_H__
>  #define __IMX8_ISI_REGS_H__
>  
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  
>  /* ISI Registers Define  */
> @@ -19,9 +20,14 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +/*
> + * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + */
> +#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
> +#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)
> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
Regards,

Laurent Pinchart

