Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C240DCECF
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 20:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443156AbfJRS5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 14:57:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:1321 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2443133AbfJRS5p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 14:57:45 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 11:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="195545164"
Received: from wittejoe-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.3])
  by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2019 11:57:42 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 81E0121E76; Fri, 18 Oct 2019 21:54:19 +0300 (EEST)
Date:   Fri, 18 Oct 2019 21:54:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] media: ov6650: Fix arbitrary selection of master
 clock rate
Message-ID: <20191018185419.GC3712@kekkonen.localdomain>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com>
 <20191013125050.4153-7-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191013125050.4153-7-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Sun, Oct 13, 2019 at 02:50:50PM +0200, Janusz Krzysztofik wrote:
> A hardcoded 12 MHz master clock frequency has been assumed since
> conversion of the driver from soc_camera sensor to a standalone V4L2
> subdevice by commit 23a52386fabe ("media: ov6650: convert to standalone
> v4l2 subdevice").  Fix it.
> 
> Define a static table of supported master clock rates (fix misnamed
> symbol while being at it), then use v4l2_clk_get/set_rate() to obtain
> a clock rate matching one of those supported.  On success, apply
> respective master clock hardware divisor provided by the matching
> element of the table.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  drivers/media/i2c/ov6650.c | 64 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index f4723c0b5c70..13fd7c4699b2 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -124,7 +124,7 @@
>  
>  #define DEF_AECH		0x4D
>  
> -#define CLKRC_6MHz		0x00
> +#define CLKRC_8MHz		0x00
>  #define CLKRC_12MHz		0x40
>  #define CLKRC_16MHz		0x80
>  #define CLKRC_24MHz		0xc0
> @@ -201,6 +201,29 @@ struct ov6650 {
>  	u32 code;
>  };
>  
> +struct ov6650_xclk {
> +	unsigned long	rate;
> +	u8		clkrc;
> +};
> +
> +static const struct ov6650_xclk ov6650_xclk[] = {
> +{
> +	.rate	= 8000000,
> +	.clkrc	= CLKRC_8MHz,
> +},
> +{
> +	.rate	= 12000000,
> +	.clkrc	= CLKRC_12MHz,
> +},
> +{
> +	.rate	= 16000000,
> +	.clkrc	= CLKRC_16MHz,
> +},
> +{
> +	.rate	= 24000000,
> +	.clkrc	= CLKRC_24MHz,
> +},
> +};
>  
>  static u32 ov6650_codes[] = {
>  	MEDIA_BUS_FMT_YUYV8_2X8,
> @@ -774,7 +797,7 @@ static int ov6650_reset(struct i2c_client *client)
>  }
>  
>  /* program default register values */
> -static int ov6650_prog_dflt(struct i2c_client *client)
> +static int ov6650_prog_dflt(struct i2c_client *client, u8 clkrc)
>  {
>  	int ret;
>  
> @@ -782,7 +805,7 @@ static int ov6650_prog_dflt(struct i2c_client *client)
>  
>  	ret = ov6650_reg_write(client, REG_COMA, 0);	/* ~COMA_RESET */
>  	if (!ret)
> -		ret = ov6650_reg_write(client, REG_CLKRC, CLKRC_12MHz);
> +		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
>  	if (!ret)
>  		ret = ov6650_reg_rmw(client, REG_COMB, 0, COMB_BAND_FILTER);
>  
> @@ -793,8 +816,10 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov6650 *priv = to_ov6650(client);
> -	u8		pidh, pidl, midh, midl;
> -	int		ret;
> +	const struct ov6650_xclk *xclk;
> +	unsigned long rate;
> +	u8 pidh, pidl, midh, midl;
> +	int i, ret;
>  
>  	priv->clk = v4l2_clk_get(&client->dev, NULL);
>  	if (IS_ERR(priv->clk)) {
> @@ -803,6 +828,33 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  		return ret;
>  	}
>  
> +	rate = v4l2_clk_get_rate(priv->clk);
> +	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
> +		if (rate != ov6650_xclk[i].rate)
> +			continue;
> +
> +		xclk = &ov6650_xclk[i];
> +		dev_info(&client->dev, "using host default clock rate %lukHz\n",
> +			 rate / 1000);
> +		break;
> +	}

xclk is undefined unless it was set in the previous loop. Please initialise
to to NULL. I can fix that, too, while applying the patch.

> +	for (i = 0; !xclk && i < ARRAY_SIZE(ov6650_xclk); i++) {
> +		ret = v4l2_clk_set_rate(priv->clk, ov6650_xclk[i].rate);
> +		if (ret || v4l2_clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
> +			continue;
> +
> +		xclk = &ov6650_xclk[i];
> +		dev_info(&client->dev, "using negotiated clock rate %lukHz\n",
> +			 xclk->rate / 1000);
> +		break;
> +	}
> +	if (!xclk) {
> +		dev_err(&client->dev, "unable to get supported clock rate\n");
> +		if (!ret)
> +			ret = -EINVAL;
> +		goto eclkput;
> +	}
> +
>  	ret = ov6650_s_power(sd, 1);
>  	if (ret < 0)
>  		goto eclkput;
> @@ -836,7 +888,7 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  
>  	ret = ov6650_reset(client);
>  	if (!ret)
> -		ret = ov6650_prog_dflt(client);
> +		ret = ov6650_prog_dflt(client, xclk->clkrc);
>  	if (!ret) {
>  		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
>  

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
