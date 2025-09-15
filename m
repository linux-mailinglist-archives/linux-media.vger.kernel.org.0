Return-Path: <linux-media+bounces-42550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF10B578C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33A58205239
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ECC2F39AE;
	Mon, 15 Sep 2025 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ef/M7NtN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BA18A6CF;
	Mon, 15 Sep 2025 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757936655; cv=none; b=DsnyJmSo51YSNYjmPj7pCjEefsEOZKOaBcOipeWC1WY9jO4t9tsYKLjpv6AjDF1Rfh4DZRQnsMAHgLsHv1/51sDgtnExHL5slYr+7dZ6YobAwjqPsDlZBXgyJV3oLCzxNkvAwO9kGhFrZO+j/wYDbuDfLJtrQYHtGxmKQ53gzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757936655; c=relaxed/simple;
	bh=5O7PhGpBzohgFjiqINlpPQ8H2kq11x3ttRIqJkhP1+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR/lRstwmq2/ykAwv77u88TpPbFIHH1QjfXgzsPt8VgAUiw8FUgt3/YaY4B3JSx9lLgM6gXoPM8akf8vvYmIQVg1pw09nVZbjNqOeuqOQadRyWHFZOQxg7VyKMARxtj0Ta/PMAX/9FDjZs2w0nX0beYaj0wtRSoC2aDBf5UHOUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ef/M7NtN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757936653; x=1789472653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5O7PhGpBzohgFjiqINlpPQ8H2kq11x3ttRIqJkhP1+A=;
  b=ef/M7NtNrMHeAszxCkug9R7USaskzMN3n0RRFjfm+PzkToEpgeccU/Ni
   yYKLs6mCscuOzrp+NEexQtctwr3NIyu7RG8Acknyfo8LtvDsiSVDYlrQ0
   tiePJxddPxbJIznjuwUf7dp2rF4lYM17BQW1B7Pvc16d9Bu5f/TASBc6u
   3vHOFQHm+1ymx54PgqA9ATXmYaLHO31l6CYbXHwsM3rjop3jPIQcff/f7
   lh68gKNoU1nCUboijqAc6FW+PrxpTiCPm8ZCbX/RZJ1m9Nxdn86DHEam1
   jC9gM8oEahXuELCcSCTYxbjGgg/A1Rm59HYWWw5BNHYWeDg8ZHi/eZoXG
   g==;
X-CSE-ConnectionGUID: 9Q8IJg5MSlGFVqhHAgSgaw==
X-CSE-MsgGUID: exMNgiIETZusQ96TcDaIkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="47754102"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="47754102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 04:44:12 -0700
X-CSE-ConnectionGUID: UIMsDXfoQsyikjW9ShwuKQ==
X-CSE-MsgGUID: UOoWIbyTQ8S4BMBRswnWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="179773250"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.30])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 04:44:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 31FAA11FCCF;
	Mon, 15 Sep 2025 14:44:07 +0300 (EEST)
Date: Mon, 15 Sep 2025 14:44:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v3 2/8] media: imx335: Support vertical flip
Message-ID: <aMf8B4RpEFupM9Yn@kekkonen.localdomain>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
 <20250915-imx335_binning-v3-2-16ecabf2090d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-imx335_binning-v3-2-16ecabf2090d@ideasonboard.com>

Hi Jai,

On Mon, Sep 15, 2025 at 12:09:08PM +0530, Jai Luthra wrote:
> From: Umang Jain <umang.jain@ideasonboard.com>
> 
> Support vertical flip by setting REG_VREVERSE.
> Additional registers also needs to be set per mode, according
> to the readout direction (normal/inverted) as mentioned in the
> data sheet.
> 
> Since the register IMX335_REG_AREA3_ST_ADR_1 is based on the
> flip (and is set via vflip related registers), it has been
> moved out of the 2592x1944 mode regs.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 71 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 213cfb7276611f522db0643186f25a8fef3c39db..27baf6c9b426a324632db7e393514463611a5ae7 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -56,6 +56,9 @@
>  #define IMX335_AGAIN_STEP		1
>  #define IMX335_AGAIN_DEFAULT		0
>  
> +/* Vertical flip */
> +#define IMX335_REG_VREVERSE		CCI_REG8(0x304f)
> +
>  #define IMX335_REG_TPG_TESTCLKEN	CCI_REG8(0x3148)
>  
>  #define IMX335_REG_INCLKSEL1		CCI_REG16_LE(0x314c)
> @@ -155,6 +158,8 @@ static const char * const imx335_supply_name[] = {
>   * @vblank_max: Maximum vertical blanking in lines
>   * @pclk: Sensor pixel clock
>   * @reg_list: Register list for sensor mode
> + * @vflip_normal: Register list vflip (normal readout)
> + * @vflip_inverted: Register list vflip (inverted readout)
>   */
>  struct imx335_mode {
>  	u32 width;
> @@ -166,6 +171,8 @@ struct imx335_mode {
>  	u32 vblank_max;
>  	u64 pclk;
>  	struct imx335_reg_list reg_list;
> +	struct imx335_reg_list vflip_normal;
> +	struct imx335_reg_list vflip_inverted;
>  };
>  
>  /**
> @@ -183,6 +190,7 @@ struct imx335_mode {
>   * @pclk_ctrl: Pointer to pixel clock control
>   * @hblank_ctrl: Pointer to horizontal blanking control
>   * @vblank_ctrl: Pointer to vertical blanking control
> + * @vflip: Pointer to vertical flip control
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
> @@ -207,6 +215,7 @@ struct imx335 {
>  	struct v4l2_ctrl *pclk_ctrl;
>  	struct v4l2_ctrl *hblank_ctrl;
>  	struct v4l2_ctrl *vblank_ctrl;
> +	struct v4l2_ctrl *vflip;
>  	struct {
>  		struct v4l2_ctrl *exp_ctrl;
>  		struct v4l2_ctrl *again_ctrl;
> @@ -259,7 +268,6 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
>  	{ IMX335_REG_HTRIMMING_START, 48 },
>  	{ IMX335_REG_HNUM, 2592 },
>  	{ IMX335_REG_Y_OUT_SIZE, 1944 },
> -	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
>  	{ IMX335_REG_AREA3_WIDTH_1, 3928 },
>  	{ IMX335_REG_OPB_SIZE_V, 0 },
>  	{ IMX335_REG_XVS_XHS_DRV, 0x00 },
> @@ -333,6 +341,26 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
>  	{ CCI_REG8(0x3a00), 0x00 },
>  };
>  
> +static const struct cci_reg_sequence mode_2592x1944_vflip_normal[] = {
> +	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
> +
> +	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
> +	{ CCI_REG8(0x3081), 0x02, },
> +	{ CCI_REG8(0x3083), 0x02, },
> +	{ CCI_REG16_LE(0x30b6), 0x00 },
> +	{ CCI_REG16_LE(0x3116), 0x08 },
> +};
> +
> +static const struct cci_reg_sequence mode_2592x1944_vflip_inverted[] = {
> +	{ IMX335_REG_AREA3_ST_ADR_1, 4112 },
> +
> +	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
> +	{ CCI_REG8(0x3081), 0xfe, },
> +	{ CCI_REG8(0x3083), 0xfe, },
> +	{ CCI_REG16_LE(0x30b6), 0x1fa },
> +	{ CCI_REG16_LE(0x3116), 0x002 },
> +};
> +
>  static const struct cci_reg_sequence raw10_framefmt_regs[] = {
>  	{ IMX335_REG_ADBIT, 0x00 },
>  	{ IMX335_REG_MDBIT, 0x00 },
> @@ -419,6 +447,14 @@ static const struct imx335_mode supported_mode = {
>  		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
>  		.regs = mode_2592x1944_regs,
>  	},
> +	.vflip_normal = {
> +		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_normal),
> +		.regs = mode_2592x1944_vflip_normal,
> +	},
> +	.vflip_inverted = {
> +		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_inverted),
> +		.regs = mode_2592x1944_vflip_inverted,
> +	},
>  };
>  
>  /**
> @@ -492,6 +528,26 @@ static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
>  	return ret;
>  }
>  
> +static int imx335_update_vertical_flip(struct imx335 *imx335, u32 vflip)
> +{
> +	int ret = 0;

You can do:

	const struct cci_reg_sequence * const vflip_regs =
		vflip ? imx335->cur_mode->vflip_inverted :
			imx335->cur_mode->vflip_normal;
	int ret = 0;

	cci_multi_reg_write(imx335->cci, vflip_regs->regs,
			    vflip_regs->num_of_regs, &ret);

	return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, ret);

> +
> +	if (vflip)
> +		cci_multi_reg_write(imx335->cci,
> +				    imx335->cur_mode->vflip_inverted.regs,
> +				    imx335->cur_mode->vflip_inverted.num_of_regs,
> +				    &ret);
> +	else
> +		cci_multi_reg_write(imx335->cci,
> +				    imx335->cur_mode->vflip_normal.regs,
> +				    imx335->cur_mode->vflip_normal.num_of_regs,
> +				    &ret);
> +	if (ret)
> +		return ret;
> +
> +	return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, NULL);
> +}
> +
>  static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
>  {
>  	int ret = 0;
> @@ -593,6 +649,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
>  
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret = imx335_update_vertical_flip(imx335, ctrl->val);
> +
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = imx335_update_test_pattern(imx335, ctrl->val);
> @@ -1175,7 +1235,7 @@ static int imx335_init_controls(struct imx335 *imx335)
>  		return ret;
>  
>  	/* v4l2_fwnode_device_properties can add two more controls */
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>  
> @@ -1210,6 +1270,13 @@ static int imx335_init_controls(struct imx335 *imx335)
>  
>  	v4l2_ctrl_cluster(2, &imx335->exp_ctrl);
>  
> +	imx335->vflip = v4l2_ctrl_new_std(ctrl_hdlr,
> +					  &imx335_ctrl_ops,
> +					  V4L2_CID_VFLIP,
> +					  0, 1, 1, 0);
> +	if (imx335->vflip)
> +		imx335->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>  	imx335->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
>  						&imx335_ctrl_ops,
>  						V4L2_CID_VBLANK,
> 

-- 
Regards,

Sakari Ailus

