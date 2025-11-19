Return-Path: <linux-media+bounces-47346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E74C6CC0D
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4314535CC24
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AF43064A3;
	Wed, 19 Nov 2025 04:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pW8dqBlC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598EB3054D9;
	Wed, 19 Nov 2025 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526921; cv=none; b=PZgoKGalAn+XKzKceGYfXkcMcz/s8sqsyclz8dxBxVE1sezvqe50DgGYpx76KtKozvLMWhdU+VE9mFUGhtQy6Q+3s9A3RsEIB5GxKzmTsdFb6cXeRoxq8bmdhWJK54Wn8zAoYDUnHNt5KccLRzWIZkLjFwU0mmAHZ6JEPfWJVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526921; c=relaxed/simple;
	bh=J5moTwiTxXOfuPBOlB1FvexbUDCLvBsjPBhAeKd7XO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kqtb6kvl7Gy613/9VASO4DEbK80CgL+DME21CFb8uHJZTW0YfFooI/LtzZv7EXQzu3wsN/Qkv/R1VcqArdtM9ulDvKHnNcHMCSH5EVMdCb0Nz2uJQZbyVB/nwmVdBg5Y6BMOw0LRaSqSQeKfw6c/UxdSQFV/zuu/A56Wtf3IQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pW8dqBlC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14E9EB5;
	Wed, 19 Nov 2025 05:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526795;
	bh=J5moTwiTxXOfuPBOlB1FvexbUDCLvBsjPBhAeKd7XO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW8dqBlCRTLwl4+7oKJAJYj+vbmdRGOjWy04Ez/Slz/refbqx64HU/eMXuPicXxXG
	 ctz5wvrwy7IhkY5n7hLu6xd17HzAVkF9CcR0+y8U5SdGcbzC3COkAHuKjyt9uEzEK9
	 FzPc69GC9LL8IY+mXbldtyPu9oD2tcnhnHh8+sEQ=
Date: Wed, 19 Nov 2025 13:34:51 +0900
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
Subject: Re: [PATCH v2 1/5] media: staging: media: imx6-mipi-csi2: replace
 spaces with tabs for alignment
Message-ID: <20251119043451.GA11519@pendragon.ideasonboard.com>
References: <20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com>
 <20251111-stage-csi2-cleanup-v2-1-371bb951776f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111-stage-csi2-cleanup-v2-1-371bb951776f@nxp.com>

On Tue, Nov 11, 2025 at 04:42:13PM -0500, Frank Li wrote:
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

