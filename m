Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2AE2861BC
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 17:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgJGPBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 11:01:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:40543 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728641AbgJGPBK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 11:01:10 -0400
IronPort-SDR: D2oOy5KlXrCgdLZ7jTVZgCThFoxS74g4B49l5+Shkph9m6nziUXh90khDxLViZo+MscIPqt1TK
 CIS3+xx76ghw==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="229108536"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="229108536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 08:01:08 -0700
IronPort-SDR: 5lzoFqA8tDRjbwfnjut63o9THxltmzbYOCM65Gza+NqOdXcjobyAPqWE5CP4LnD5JSTcbol8HV
 JHTtDS3eBMjQ==
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="297518512"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 08:01:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A59D1207B6; Wed,  7 Oct 2020 18:01:03 +0300 (EEST)
Date:   Wed, 7 Oct 2020 18:01:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] media: ov5640: fix MIPI power sequence
Message-ID: <20201007150103.GN26842@paasikivi.fi.intel.com>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
 <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Oct 07, 2020 at 04:43:18PM +0200, Hugues Fruchet wrote:
> fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")

Fixes: ...

And preferrably before Sob line.

> 
> Fix ov5640_write_reg()return value unchecked at power off.
> Reformat code to keep register access below the register description.

If there's an error, I wouldn't stop turning things off, but just proceed.
The caller will ignore the error in that case anyway. This changes with the
patch.

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> Change-Id: I12db67c416c3d63eadee400a3c89aaf48c5b1469

This was probably not intended to be here.

> ---
>  drivers/media/i2c/ov5640.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..f34e62e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  {
>  	int ret;
>  
> -	if (!on) {
> -		/* Reset MIPI bus settings to their default values. */
> -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> -		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
> -		return 0;
> -	}
> -
>  	/*
>  	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>  	 *
> @@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [3] = 0	: Power up MIPI LS Rx
>  	 * [2] = 0	: MIPI interface disabled
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> +			       on ? 0x40 : 0x58);
>  	if (ret)
>  		return ret;
>  
> @@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [5] = 1	: Gate clock when 'no packets'
>  	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
> +			       on ? 0x24 : 0x04);
>  	if (ret)
>  		return ret;
>  
> @@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
>  	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
> +			       on ? 0x70 : 0x00);
>  	if (ret)
>  		return ret;
>  

-- 
Kind regards,

Sakari Ailus
