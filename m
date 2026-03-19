Return-Path: <linux-media+bounces-56421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBECNeN8vGk1zQIAu9opvQ
	(envelope-from <linux-media+bounces-56421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:46:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1F2D3B09
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C123013727
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EC936EAA7;
	Thu, 19 Mar 2026 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wz5bGk2G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED22C11E8;
	Thu, 19 Mar 2026 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773960406; cv=none; b=qwc2za7cVhX7DzA4CCRLAxVlAH8GCYL309o4pWuiA8+W7wNnbLA0L+bowoyBdd4lkCF52idk/kO7vGcDR6rjpxYMyplBEPvXWBMog+cWfwqk1fOJDHuQQPRm82vJx0yEORfVZwsgxgEGMt0rUuTekcZ3qS+QA9WAVsun1eO4LDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773960406; c=relaxed/simple;
	bh=Xfywi3fgWbqBrWKuajaqSico7PqZr8JIWrVp/6bVJ0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2099c7d7mzgAnLhg32+vAa68wwfhTRUcj2OVzOqr2wGfKk0WertVONkIz8+NZhUcdWa3jw7wHPIK73uzj84NO1NXopaOf5LOY1v/c/HURskr3SJwRhDnL3lviammzHE4tpA7e6dgHnxct3tnrPHKvyJlG0PmXzyS8m/1zSIpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wz5bGk2G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D38B19A6;
	Thu, 19 Mar 2026 23:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773960329;
	bh=Xfywi3fgWbqBrWKuajaqSico7PqZr8JIWrVp/6bVJ0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wz5bGk2GWRbax6c0hubk86YRNQdfNZDVXHiKo6mYp5oV/DitSke9wvbFR5FJXO630
	 0tzJooGE5nYnuTMML4pbD5pUGMO0rl0qQppuaqq5tvgts7cQv/guQTKjPPpjxh1rkQ
	 kMTlQD453raIN0bPv/yNRvy7q3nYgw4R/MJIaIm0=
Date: Fri, 20 Mar 2026 00:46:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <20260319224641.GA962817@killaraus.ideasonboard.com>
References: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-56421-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3CF1F2D3B09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guoniu,

Thank you for the patch.

On Tue, Mar 10, 2026 at 02:53:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Add virtual channel support for ISI driver.

You can drop this line, it duplicates the subject line.

> The ISI supports different numbers of virtual channels depending on the
> platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
> virtual channels. They are used in multiple camera use cases, such as
> surround view. Other platforms (such as i.MX8MN/8MP/8ULP/93/91) don't
> support virtual channels, and the VC_ID bits are marked as read-only.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Add Rb tag from Frank Li
> - Fix typo in comment(s/support/supports/)
> - Update commit log to include more details about ISI virtual channel support
>   on different platform
> - Include bitfield.h file to fix following build error
>   drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
> - Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com
> 
> Changes in v1:
> - Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  4 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 43 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  6 +--
>  4 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..11a5e395792f11752c44d73818c825f2f175aa1d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -256,6 +256,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	/* Virtual channel ID for the ISI channel */
> +	u8				vc;
>  };
>  
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8e28fca9013f6864a094e08f2c570..2babb8573227de9e1aa36d9a39be41b286cf0c57 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -338,7 +338,9 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc);

You're not addressing the FIXME comment, so it should be kept (or
ideally addressed :-)).

> +		/* Platform like i.MX95, ISI supports 8 virtual channels */
> +		val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);

This should be done for i.MX95 only. You also need to clear the bit
above in the function just after reading CHNL_CTRL (for i.MX95 only as
well), otherwise switching between different virtual channels won't
work.

>  	}
>  
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..cc4348ea6006ee19243aae3abceb235d00beea4d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,45 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>  
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       xbar->num_sinks + pipe->id, &source_fd);

I don't see the xbar implementing get_frame_desc(). Am I missing a
dependency ?

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			xbar->num_sinks + pipe->id);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < source_fd.num_entries; i++) {
> +		if (source_fd.entry[i].stream == 0) {
> +			entry = &source_fd.entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EPIPE;
> +	}
> +
> +	if (entry->bus.csi2.vc >= pipe->isi->pdata->num_channels) {
> +		dev_err(dev, "Virtual channel(%d) out of range\n",
> +			entry->bus.csi2.vc);
> +		return -EINVAL;
> +	}
> +
> +	pipe->vc = entry->bus.csi2.vc;
> +	return 0;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -280,6 +319,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
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
> index 1b65eccdf0da4bbc3a77c91e06fccc35d6c7e022..a4036da72f0057265e991087f21bc079bd6c6573 100644
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
> @@ -19,9 +20,8 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)

I'm tempted to keep this, in case we'll need to set it later. We can add
a comment to indicate the field is only valid on i.MX8QM and i.MX8QXP:

#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)	/* i.MX8{QM,QXP} */

or

#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))	/* i.MX8{QM,QXP} */

> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

Please also add a comment to indicate the field is valid on i.MX95 only.

#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))	/* i.MX95 */

> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260309-isi_vc-285fd815140e
> prerequisite-patch-id: 6f139a1d54fa3e0632db9b8a736ae27037c5f45a

-- 
Regards,

Laurent Pinchart

