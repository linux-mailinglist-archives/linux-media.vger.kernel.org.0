Return-Path: <linux-media+bounces-51176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NW7AMszcGkSXAAAu9opvQ
	(envelope-from <linux-media+bounces-51176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:02:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8F4F74C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9344276A132
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC13628312F;
	Wed, 21 Jan 2026 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iZyf7JTS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AAD28312D;
	Wed, 21 Jan 2026 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960795; cv=none; b=dDU1C7M9mhHatrxF/w5mh7/Obt7tCr6airIVtsiKJLXpyvwWqA2kDxwwq2l8Kw9gfcs2lnuWA15Au6fxmdj5xquKrJimki5toNfTyTg9e4RumW6ei5ht/F8aFM1FvWvPB4icTjb1UcxPDfW07Z61cdFsbl6aTa9j0k4BEXLJPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960795; c=relaxed/simple;
	bh=8RN2xhdxYtlPZSFrrSkuAOlcpuA2PtIbQAvv62QfoHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgcrkZrPEtSLv6v56EULlBgy6E/mndwsqHW7HOJx3Tu9ISMRWBLAeC3sXj4s0vf4xEuysP/fVtx1NfJSbrBjTN8TlU6/wMKHe2aay9/faH1NFpPc9Yvd5M/Dit8lWKsPjP4/3Bh/McONOS3Bmmb6HHefuoahAPVbvGC27sVfHM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iZyf7JTS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A016C2D7;
	Wed, 21 Jan 2026 02:59:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960752;
	bh=8RN2xhdxYtlPZSFrrSkuAOlcpuA2PtIbQAvv62QfoHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZyf7JTSTiEfXJl65wDxP1MIaMVUy9yepFiJNIqmmD7FksZkm5JEwfySyl1PsEOMH
	 K4qZKq/xjNcWcBRmW3FHdfkXzDL1UTjVTI+cIFlYWJ3TJNPGHCCF+RAm5jvXkiUo2E
	 iOvHMfowcpWbvU5OFjDJYZTM5A7t1DK+bTpgw2u0=
Date: Wed, 21 Jan 2026 03:59:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/5] media: staging: media: imx6-mipi-csi2:
 replace spaces with tabs for alignment
Message-ID: <20260121015942.GE403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-1-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-1-a56e9cb25196@nxp.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51176-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,ideasonboard.com:email,ideasonboard.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,nxp.com:email]
X-Rspamd-Queue-Id: B3A8F4F74C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thank you for the patch.

On Fri, Jan 16, 2026 at 11:17:56AM -0500, Frank Li wrote:
> Replace spaces with tabs to align register value definitions, making it
> easier to add new entries and maintain consistent formatting.
> 
> Also use a space between the type and field in struct csi2_dev.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> changes in v2
> - struct use one space between type and field name.
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 84 +++++++++++++++---------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..1113ea2a37f03753423164069b95c049968cc0af 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -23,65 +23,65 @@
>   * there must be 5 pads: 1 input pad from sensor, and
>   * the 4 virtual channel output pads
>   */
> -#define CSI2_SINK_PAD       0
> -#define CSI2_NUM_SINK_PADS  1
> -#define CSI2_NUM_SRC_PADS   4
> -#define CSI2_NUM_PADS       5
> +#define CSI2_SINK_PAD		0
> +#define CSI2_NUM_SINK_PADS	1
> +#define CSI2_NUM_SRC_PADS	4
> +#define CSI2_NUM_PADS		5
>  
>  /*
>   * The default maximum bit-rate per lane in Mbps, if the
>   * source subdev does not provide V4L2_CID_LINK_FREQ.
>   */
> -#define CSI2_DEFAULT_MAX_MBPS 849
> +#define CSI2_DEFAULT_MAX_MBPS	849
>  
>  struct csi2_dev {
> -	struct device          *dev;
> -	struct v4l2_subdev      sd;
> +	struct device *dev;
> +	struct v4l2_subdev sd;
>  	struct v4l2_async_notifier notifier;
> -	struct media_pad       pad[CSI2_NUM_PADS];
> -	struct clk             *dphy_clk;
> -	struct clk             *pllref_clk;
> -	struct clk             *pix_clk; /* what is this? */
> -	void __iomem           *base;
> +	struct media_pad pad[CSI2_NUM_PADS];
> +	struct clk *dphy_clk;
> +	struct clk *pllref_clk;
> +	struct clk *pix_clk; /* what is this? */
> +	void __iomem *base;
>  
> -	struct v4l2_subdev	*remote;
> -	unsigned int		remote_pad;
> -	unsigned short		data_lanes;
> +	struct v4l2_subdev *remote;
> +	unsigned int remote_pad;
> +	unsigned short data_lanes;
>  
>  	/* lock to protect all members below */
>  	struct mutex lock;
>  
>  	struct v4l2_mbus_framefmt format_mbus;
>  
> -	int                     stream_count;
> -	struct v4l2_subdev      *src_sd;
> -	bool                    sink_linked[CSI2_NUM_SRC_PADS];
> +	int stream_count;
> +	struct v4l2_subdev *src_sd;
> +	bool sink_linked[CSI2_NUM_SRC_PADS];
>  };
>  
>  #define DEVICE_NAME "imx6-mipi-csi2"
>  
>  /* Register offsets */
> -#define CSI2_VERSION            0x000
> -#define CSI2_N_LANES            0x004
> -#define CSI2_PHY_SHUTDOWNZ      0x008
> -#define CSI2_DPHY_RSTZ          0x00c
> -#define CSI2_RESETN             0x010
> -#define CSI2_PHY_STATE          0x014
> -#define PHY_STOPSTATEDATA_BIT   4
> -#define PHY_STOPSTATEDATA(n)    BIT(PHY_STOPSTATEDATA_BIT + (n))
> -#define PHY_RXCLKACTIVEHS       BIT(8)
> -#define PHY_RXULPSCLKNOT        BIT(9)
> -#define PHY_STOPSTATECLK        BIT(10)
> -#define CSI2_DATA_IDS_1         0x018
> -#define CSI2_DATA_IDS_2         0x01c
> -#define CSI2_ERR1               0x020
> -#define CSI2_ERR2               0x024
> -#define CSI2_MSK1               0x028
> -#define CSI2_MSK2               0x02c
> -#define CSI2_PHY_TST_CTRL0      0x030
> +#define CSI2_VERSION		0x000
> +#define CSI2_N_LANES		0x004
> +#define CSI2_PHY_SHUTDOWNZ	0x008
> +#define CSI2_DPHY_RSTZ		0x00c
> +#define CSI2_RESETN		0x010
> +#define CSI2_PHY_STATE		0x014
> +#define PHY_STOPSTATEDATA_BIT	4
> +#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
> +#define PHY_RXCLKACTIVEHS	BIT(8)
> +#define PHY_RXULPSCLKNOT	BIT(9)
> +#define PHY_STOPSTATECLK	BIT(10)
> +#define CSI2_DATA_IDS_1		0x018
> +#define CSI2_DATA_IDS_2		0x01c
> +#define CSI2_ERR1		0x020
> +#define CSI2_ERR2		0x024
> +#define CSI2_MSK1		0x028
> +#define CSI2_MSK2		0x02c
> +#define CSI2_PHY_TST_CTRL0	0x030
>  #define PHY_TESTCLR		BIT(0)
>  #define PHY_TESTCLK		BIT(1)
> -#define CSI2_PHY_TST_CTRL1      0x034
> +#define CSI2_PHY_TST_CTRL1	0x034
>  #define PHY_TESTEN		BIT(16)
>  /*
>   * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
> @@ -106,13 +106,13 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
>   * reference manual is as follows:
>   *
>   * 1. Deassert presetn signal (global reset).
> - *        It's not clear what this "global reset" signal is (maybe APB
> - *        global reset), but in any case this step would be probably
> - *        be carried out during driver load in csi2_probe().
> + *	It's not clear what this "global reset" signal is (maybe APB
> + *	global reset), but in any case this step would be probably
> + *	be carried out during driver load in csi2_probe().
>   *
>   * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
> - *        This must be carried out by the MIPI sensor's s_power(ON) subdev
> - *        op.
> + *	This must be carried out by the MIPI sensor's s_power(ON) subdev
> + *	op.
>   *
>   * 3. D-PHY initialization.
>   * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,

-- 
Regards,

Laurent Pinchart

