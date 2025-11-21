Return-Path: <linux-media+bounces-47541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1653AC770E1
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2DED235AD1B
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E6E2D5A13;
	Fri, 21 Nov 2025 02:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AF8fXvp9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71732D3A70;
	Fri, 21 Nov 2025 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693266; cv=none; b=fuCE1iHqRJ3IoQFu8Nns/h4E3S4mF6Ln7nb5NE+iRMZbtNhUzE4dg6/VsrMk1F0CyRmc0wDxTSquSG90eGI7llY5x0TTqIwEj9CVoT+gMOgz8Ff5qwCJbStepG5oyesRRi76c+9YR9u2L5QLQdaMgE05/+4RRlEdJEXBXdIUXhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693266; c=relaxed/simple;
	bh=w1odhknuO7vz9zYjbFhCb0Vw+S/VW4i0IMMUc3AehnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDiB+/+BkQg3RonIapVlMdpwY48RvAu6Lyin6nfJbl2nWM3FC9aL8+HWw24ctzAAsTClf4XPldV3LiyxO0pmiD2vjnHSlU3kMohDoTj2mketI65zrE8krlx16i0ag6rPcxIsjrfr97ZQLbjZLyKyXoYSea+yF4XWVuQehoa8XQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AF8fXvp9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EE00EEAE;
	Fri, 21 Nov 2025 03:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763693135;
	bh=w1odhknuO7vz9zYjbFhCb0Vw+S/VW4i0IMMUc3AehnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF8fXvp9Qa2F9S871Eg2tKGXruHTicUbKFuklpbRTrCwhepRs9WRnog+6jXeh9gKK
	 LQYBVaFm85cLybuOE+g4ja6WT13+OTDZX1fGWvFd0cQftezyNoJuJM/TSucjOZHHdB
	 jCvTujg2xOd9uHIUUqHs47SXs8N0ngQFAwbpSc98=
Date: Fri, 21 Nov 2025 11:47:14 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20251121024714.GD11519@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-2-5ecb081ce79b@nxp.com>
 <20251027001151.GN13023@pendragon.ideasonboard.com>
 <PAXPR04MB9089072A62500D6C01881A38FAD5A@PAXPR04MB9089.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9089072A62500D6C01881A38FAD5A@PAXPR04MB9089.eurprd04.prod.outlook.com>

On Fri, Nov 21, 2025 at 02:21:23AM +0000, G.N. Zhou (OSS) wrote:
> On Monday, October 27, 2025 8:12 AM, Laurent Pinchart wrote:
> > On Thu, Oct 23, 2025 at 05:19:43PM +0800, Guoniu Zhou wrote:
> > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > >
> > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > >
> > > No functional changes intended.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
> > >  1 file changed, 15 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > index d333ff43539f061b8b9cf88af2cda8c44b3ec2a9..fd202601d401145da8be23df4451f6af660642c5 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -71,21 +71,6 @@ enum {
> > >  	ST_SUSPENDED	= 4,
> > >  };
> > >
> > > -enum imx8mq_mipi_csi_clk {
> > > -	CSI2_CLK_CORE,
> > > -	CSI2_CLK_ESC,
> > > -	CSI2_CLK_UI,
> > > -	CSI2_NUM_CLKS,
> > > -};
> > > -
> > > -static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> > > -	[CSI2_CLK_CORE] = "core",
> > > -	[CSI2_CLK_ESC] = "esc",
> > > -	[CSI2_CLK_UI] = "ui",
> > > -};
> > > -
> > > -#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> > > -
> > >  struct imx8mq_plat_data {
> > >  	int (*enable)(struct csi_state *state, u32 hs_settle);
> > >  	void (*disable)(struct csi_state *state);
> > > @@ -111,7 +96,8 @@ struct csi_state {
> > >  	struct device *dev;
> > >  	const struct imx8mq_plat_data *pdata;
> > >  	void __iomem *regs;
> > > -	struct clk_bulk_data clks[CSI2_NUM_CLKS];
> > > +	struct clk_bulk_data *clks;
> > > +	int num_clks;
> > >  	struct reset_control *rst;
> > >  	struct regulator *mipi_phy_regulator;
> > >
> > > @@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
> > >  			      CSI2RX_SEND_LEVEL);
> > >  }
> > >
> > > -static int imx8mq_mipi_csi_clk_enable(struct csi_state *state) -{
> > > -	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
> > > -}
> > > -
> > > -static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
> > > +static struct clk *find_esc_clk(struct csi_state *state)
> > 
> > This is one of the reasons why I don't like devm_clk_bulk_get_all(). I won't
> > object to this patch, but I don't like it. At the very lest, you should look up the
> > clock at probe time and cache it in the imx8mq_plat_data structure, to avoid
> > looking it up multiple times at runtime.
> > 
> > >  {
> > > -	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
> > > -}
> > > -
> > > -static int imx8mq_mipi_csi_clk_get(struct csi_state *state) -{
> > > -	unsigned int i;
> > > +	int i;
> > >
> > > -	for (i = 0; i < CSI2_NUM_CLKS; i++)
> > > -		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
> > > +	for (i = 0; i < state->num_clks; i++) {
> > 
> > Make state->num_clks unsigned instead of making i signed.
> 
> I address the comment in v8(https://lore.kernel.org/all/20251113-csi2_imx8ulp-v8-0-2ebe378f7111@nxp.com/),
> but Media CI robot detected some issues as bellow.
> 
> # Test static:test-smatch
> drivers/media/platform/nxp/imx8mq-mipi-csi2.c:1006 imx8mq_mipi_csi_probe() warn: unsigned 'state->num_clks' is never less than zero.
> 
> # Test static:test-coccinelle
> ./platform/nxp/imx8mq-mipi-csi2.c:1006:5-20: WARNING: Unsigned expression compared with zero: state -> num_clks < 0
> 
> I checked the parameters type of all functions which will refer to
> num_clks, their type is int, so I plan to drop the changes in v8 and
> will send v9.

You can address the issue in the probe function as follows:

	ret = devm_clk_bulk_get_all(dev, &state->clks);
	if (ret < 0)
		return dev_err_probe(dev, ret, "Failed to get clocks\n");

	state->num_clks = ret;

> > > +		if (!strcmp(state->clks[i].id, "esc"))
> > > +			return state->clks[i].clk;
> > > +	}
> > >
> > > -	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
> > > +	return NULL;
> > 
> > This needs to become a probe error.
> > 
> > >  }
> > >
> > >  static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> > > @@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> > >  	 * documentation recommends picking a value away from the boundaries.
> > >  	 * Let's pick the average.
> > >  	 */
> > > -	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
> > > +	esc_clk_rate = clk_get_rate(find_esc_clk(state));
> > >  	if (!esc_clk_rate) {
> > >  		dev_err(state->dev, "Could not get esc clock rate.\n");
> > >  		return -EINVAL;
> > > @@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
> > >
> > >  	if (state->state & ST_POWERED) {
> > >  		imx8mq_mipi_csi_stop_stream(state);
> > > -		imx8mq_mipi_csi_clk_disable(state);
> > > +		clk_bulk_disable_unprepare(state->num_clks, state->clks);
> > >  		state->state &= ~ST_POWERED;
> > >  	}
> > >
> > > @@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device
> > > *dev)
> > >
> > >  	if (!(state->state & ST_POWERED)) {
> > >  		state->state |= ST_POWERED;
> > > -		ret = imx8mq_mipi_csi_clk_enable(state);
> > > +		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
> > >  	}
> > >  	if (state->state & ST_STREAMING) {
> > >  		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> > > @@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(state->regs))
> > >  		return PTR_ERR(state->regs);
> > >
> > > -	ret = imx8mq_mipi_csi_clk_get(state);
> > > -	if (ret < 0)
> > > -		return ret;
> > > +	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
> > > +	if (state->num_clks < 0)
> > > +		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
> > >
> > >  	platform_set_drvdata(pdev, &state->sd);
> > >

-- 
Regards,

Laurent Pinchart

