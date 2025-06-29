Return-Path: <linux-media+bounces-36187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E121CAECEFB
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32DFD16E984
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3E622FE15;
	Sun, 29 Jun 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xl3lB2Ts"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A5192D68;
	Sun, 29 Jun 2025 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217539; cv=none; b=ri4k3RDANfiIvQr7Elb9qjnPdT0JSC/2bHyyKqSkSPdk+0WZDTSZHkuviygzfZ2cfSwL7A4ihNxVOl7IHOAqoK4e9ixlgkPfudpxX4fscXtlPRPffbVRB/svK8dFG/e4nVP33PXjEaZYAkhKTxsgmcTyYK4przkZL8ZeJn4sfbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217539; c=relaxed/simple;
	bh=pPfydVQaYOUGyWEsMCRTxGvoSGsrLwG7Wl9sSToezn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSrQ7yRPgfmd8DbfklI8ucRoAioZlAbx3/wcPdc+KGoz2Sh6ZshmmCor9rcGm98GLqy8fTnm8gmRdIQ42Y4fgDcl5+x8848/deSUCgS7D1+Fmy7fxqRZ/7h1astyvVr8dUKDRR7m8Z40IxVshMkHTTDes0WDbhNpx7GPIsBA2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xl3lB2Ts; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 033751128;
	Sun, 29 Jun 2025 19:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751217515;
	bh=pPfydVQaYOUGyWEsMCRTxGvoSGsrLwG7Wl9sSToezn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xl3lB2TszmCrlaxRMRSSjt1l2z9Z/dvTxiWKB5vf5yxk9ewZi3tZK/uB01qnYUqYh
	 6TSN98r+ZlFeO69PDJsLQUwq+RRaoALyO4jUVfbriv2ry7JiPqI15ut71cldPJNKF5
	 yf4lqe/j+zA6Y3DhWFLzc1BCifg8YYIeH696F2a8=
Date: Sun, 29 Jun 2025 20:18:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] media: i2c: imx214: Move imx214_pll_update to
 imx214_ctrls_init
Message-ID: <20250629171831.GL24912@pendragon.ideasonboard.com>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
 <20250629-imx214_fixes-v1-4-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629-imx214_fixes-v1-4-873eb94ad635@apitzsch.eu>

On Sun, Jun 29, 2025 at 04:49:23PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> It is more logical to call the PLL update in imx214_ctrls_init(). So
> let's move it there.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 219 +++++++++++++++++++++++----------------------
>  1 file changed, 110 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index b84197ee5177d609b1395e14e1404ffa5b9a6dbf..63cf30acdc241de2f9ab3db339590da4af3d5102 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -881,6 +881,109 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
>  	.s_ctrl = imx214_set_ctrl,
>  };
>  
> +static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
> +				unsigned int link_freq)
> +{
> +	struct ccs_pll_limits limits = {
> +		.min_ext_clk_freq_hz = 6000000,
> +		.max_ext_clk_freq_hz = 27000000,
> +
> +		.vt_fr = {
> +			.min_pre_pll_clk_div = 1,
> +			.max_pre_pll_clk_div = 15,
> +			/* Value is educated guess as we don't have a spec */
> +			.min_pll_ip_clk_freq_hz = 6000000,
> +			/* Value is educated guess as we don't have a spec */
> +			.max_pll_ip_clk_freq_hz = 12000000,
> +			.min_pll_multiplier = 12,
> +			.max_pll_multiplier = 1200,
> +			.min_pll_op_clk_freq_hz = 338000000,
> +			.max_pll_op_clk_freq_hz = 1200000000,
> +		},
> +		.vt_bk = {
> +			.min_sys_clk_div = 2,
> +			.max_sys_clk_div = 4,
> +			.min_pix_clk_div = 5,
> +			.max_pix_clk_div = 10,
> +			.min_pix_clk_freq_hz = 30000000,
> +			.max_pix_clk_freq_hz = 120000000,
> +		},
> +		.op_bk = {
> +			.min_sys_clk_div = 1,
> +			.max_sys_clk_div = 2,
> +			.min_pix_clk_div = 6,
> +			.max_pix_clk_div = 10,
> +			.min_pix_clk_freq_hz = 30000000,
> +			.max_pix_clk_freq_hz = 120000000,
> +		},
> +
> +		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
> +		.min_line_length_pck = IMX214_PPL_DEFAULT,
> +	};
> +	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +	/*
> +	 * There are no documented constraints on the sys clock frequency, for
> +	 * either branch. Recover them based on the PLL output clock frequency
> +	 * and sys_clk_div limits on one hand, and the pix clock frequency and
> +	 * the pix_clk_div limits on the other hand.
> +	 */
> +	limits.vt_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
> +		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
> +	limits.vt_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
> +		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
> +
> +	limits.op_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
> +		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
> +	limits.op_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
> +		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
> +
> +	memset(pll, 0, sizeof(*pll));
> +
> +	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +	pll->op_lanes = num_lanes;
> +	pll->vt_lanes = num_lanes;
> +	pll->csi2.lanes = num_lanes;
> +
> +	pll->binning_horizontal = 1;
> +	pll->binning_vertical = 1;
> +	pll->scale_m = 1;
> +	pll->scale_n = 1;
> +	pll->bits_per_pixel =
> +		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
> +	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
> +	pll->link_freq = link_freq;
> +	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
> +
> +	return ccs_pll_calculate(imx214->dev, &limits, pll);
> +}
> +
> +static int imx214_pll_update(struct imx214 *imx214)
> +{
> +	u64 link_freq;
> +	int ret;
> +
> +	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
> +	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
> +	if (ret) {
> +		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
> +				     imx214->pll.pixel_rate_pixel_array);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to set pixel rate\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx214_ctrls_init(struct imx214 *imx214)
>  {
>  	static const struct v4l2_area unit_size = {
> @@ -1003,6 +1106,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> +	ret = imx214_pll_update(imx214);
> +	if (ret < 0) {
> +		v4l2_ctrl_handler_free(ctrl_hdlr);
> +		dev_err(imx214->dev, "failed to update PLL\n");
> +		return ret;
> +	}
> +
>  	imx214->sd.ctrl_handler = ctrl_hdlr;
>  
>  	return 0;
> @@ -1115,109 +1225,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>  	return ret;
>  }
>  
> -static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
> -				unsigned int link_freq)
> -{
> -	struct ccs_pll_limits limits = {
> -		.min_ext_clk_freq_hz = 6000000,
> -		.max_ext_clk_freq_hz = 27000000,
> -
> -		.vt_fr = {
> -			.min_pre_pll_clk_div = 1,
> -			.max_pre_pll_clk_div = 15,
> -			/* Value is educated guess as we don't have a spec */
> -			.min_pll_ip_clk_freq_hz = 6000000,
> -			/* Value is educated guess as we don't have a spec */
> -			.max_pll_ip_clk_freq_hz = 12000000,
> -			.min_pll_multiplier = 12,
> -			.max_pll_multiplier = 1200,
> -			.min_pll_op_clk_freq_hz = 338000000,
> -			.max_pll_op_clk_freq_hz = 1200000000,
> -		},
> -		.vt_bk = {
> -			.min_sys_clk_div = 2,
> -			.max_sys_clk_div = 4,
> -			.min_pix_clk_div = 5,
> -			.max_pix_clk_div = 10,
> -			.min_pix_clk_freq_hz = 30000000,
> -			.max_pix_clk_freq_hz = 120000000,
> -		},
> -		.op_bk = {
> -			.min_sys_clk_div = 1,
> -			.max_sys_clk_div = 2,
> -			.min_pix_clk_div = 6,
> -			.max_pix_clk_div = 10,
> -			.min_pix_clk_freq_hz = 30000000,
> -			.max_pix_clk_freq_hz = 120000000,
> -		},
> -
> -		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
> -		.min_line_length_pck = IMX214_PPL_DEFAULT,
> -	};
> -	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
> -
> -	/*
> -	 * There are no documented constraints on the sys clock frequency, for
> -	 * either branch. Recover them based on the PLL output clock frequency
> -	 * and sys_clk_div limits on one hand, and the pix clock frequency and
> -	 * the pix_clk_div limits on the other hand.
> -	 */
> -	limits.vt_bk.min_sys_clk_freq_hz =
> -		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
> -		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
> -	limits.vt_bk.max_sys_clk_freq_hz =
> -		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
> -		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
> -
> -	limits.op_bk.min_sys_clk_freq_hz =
> -		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
> -		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
> -	limits.op_bk.max_sys_clk_freq_hz =
> -		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
> -		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
> -
> -	memset(pll, 0, sizeof(*pll));
> -
> -	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> -	pll->op_lanes = num_lanes;
> -	pll->vt_lanes = num_lanes;
> -	pll->csi2.lanes = num_lanes;
> -
> -	pll->binning_horizontal = 1;
> -	pll->binning_vertical = 1;
> -	pll->scale_m = 1;
> -	pll->scale_n = 1;
> -	pll->bits_per_pixel =
> -		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
> -	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
> -	pll->link_freq = link_freq;
> -	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
> -
> -	return ccs_pll_calculate(imx214->dev, &limits, pll);
> -}
> -
> -static int imx214_pll_update(struct imx214 *imx214)
> -{
> -	u64 link_freq;
> -	int ret;
> -
> -	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
> -	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
> -	if (ret) {
> -		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
> -				     imx214->pll.pixel_rate_pixel_array);
> -	if (ret) {
> -		dev_err(imx214->dev, "failed to set pixel rate\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
>  				     struct v4l2_subdev_state *sd_state,
>  				     struct v4l2_subdev_frame_interval *fival)
> @@ -1457,12 +1464,6 @@ static int imx214_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx214->dev);
>  	pm_runtime_enable(imx214->dev);
>  
> -	ret = imx214_pll_update(imx214);
> -	if (ret < 0) {
> -		dev_err_probe(dev, ret, "failed to update PLL\n");
> -		goto error_subdev_cleanup;
> -	}
> -
>  	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret,

-- 
Regards,

Laurent Pinchart

