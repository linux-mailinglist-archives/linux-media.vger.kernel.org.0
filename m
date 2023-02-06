Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB0D68B6B8
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 08:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjBFHtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 02:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjBFHtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 02:49:31 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA95218AA0
        for <linux-media@vger.kernel.org>; Sun,  5 Feb 2023 23:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675669742; x=1707205742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5XVXQ0IujG7v5Ops3ggYsBsEXObeyNpM9Hlxt3e3G8=;
  b=f/xnjpuxHnzG4g9CGKX8LLgC31rFJ7C4d0N0GYh0pUa23jxkn3qBVIwH
   lbBULRmWsk6XFpcISQhM2DjCO7Td14/MROhjFAHz5Jfd6mxCkv9qRKM/w
   W0OUOjHLju9nMddlvcm8IVYMdOGSaY+X/v2c/ON9yHUW0L9vo17abhh04
   YdMAGd91/OjrsUXFNh/1WTNSrKEv7x/FLF3E7ACodjtrEiaXEh9HmSPdX
   YkGOWSxk4C3Ja3mfwLTa7AqATROlBuoUponHrguwd6O+yLS6oQiVHIIkF
   hAWfeToUqqG5R+nHL/JOViRv6vXZg38dUrsAs60yYg2vvZ49x4FHRygIz
   w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28878171"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 08:49:00 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 08:49:00 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 08:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675669740; x=1707205740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5XVXQ0IujG7v5Ops3ggYsBsEXObeyNpM9Hlxt3e3G8=;
  b=XI4/GRak2Xo2wZ9IgP9Eoq7MGmH/ABUya4bJz3AO3Rn2nT7MsAkGbicf
   7se/s33OiF0XE6UAbn2uU991pORpFmAXNNTs2MjRa41+7mC10TDxYhiNy
   3tA27RXeppSDiV3PCMM1uKtW8ULhECsbgRMcaIbVYm816G9X4HhbXGh+i
   XiEroC6xRwkbf1SQ8MorbSyT7XPHWXrg/aAUuOzlYunihZjcHBgtlVNeg
   HNSE+WQPVFZIIT/3GhJY2benoR0HBkdGP4p1KFfy3wjwuoEO/2hJfdyCg
   W/R0l6TKsrq1s5AGl1jLpRD3+ClZdrIKhjbhJql3IFCwKMbFGwWZT3ZCz
   w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28878170"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 08:48:59 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7CCC3280056;
        Mon,  6 Feb 2023 08:48:59 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 06/13] media: i2c: imx290: Use CSI timings as per datasheet
Date:   Mon, 06 Feb 2023 08:48:57 +0100
Message-ID: <2669831.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230203191811.947697-7-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com> <20230203191811.947697-7-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

thanks for the updated patch.

Am Freitag, 3. Februar 2023, 20:18:04 CET schrieb Dave Stevenson:
> Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> and pixel rate" added support for the increased link frequencies
> on 2 data lanes, but didn't update the CSI timing registers in
> accordance with the datasheet.
> 
> Use the specified settings.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
>  1 file changed, 106 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a5ea59353a4d..2abe4cdab819 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -190,6 +190,18 @@ struct imx290_mode {
>  	u32 data_size;
>  };
> 
> +struct imx290_csi_cfg {
> +	u16 repetition;
> +	u16 tclkpost;
> +	u16 thszero;
> +	u16 thsprepare;
> +	u16 tclktrail;
> +	u16 thstrail;
> +	u16 tclkzero;
> +	u16 tclkprepare;
> +	u16 tlpx;
> +};
> +
>  struct imx290 {
>  	struct device *dev;
>  	struct clk *xclk;
> @@ -289,16 +301,6 @@ static const struct imx290_regval
> imx290_1080p_settings[] = { { IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	/* data rate settings */
> -	{ IMX290_REPETITION, 0x10 },
> -	{ IMX290_TCLKPOST, 87 },
> -	{ IMX290_THSZERO, 55 },
> -	{ IMX290_THSPREPARE, 31 },
> -	{ IMX290_TCLKTRAIL, 31 },
> -	{ IMX290_THSTRAIL, 31 },
> -	{ IMX290_TCLKZERO, 119 },
> -	{ IMX290_TCLKPREPARE, 31 },
> -	{ IMX290_TLPX, 23 },
>  };
> 
>  static const struct imx290_regval imx290_720p_settings[] = {
> @@ -314,16 +316,6 @@ static const struct imx290_regval
> imx290_720p_settings[] = { { IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	/* data rate settings */
> -	{ IMX290_REPETITION, 0x10 },
> -	{ IMX290_TCLKPOST, 79 },
> -	{ IMX290_THSZERO, 47 },
> -	{ IMX290_THSPREPARE, 23 },
> -	{ IMX290_TCLKTRAIL, 23 },
> -	{ IMX290_THSTRAIL, 23 },
> -	{ IMX290_TCLKZERO, 87 },
> -	{ IMX290_TCLKPREPARE, 23 },
> -	{ IMX290_TLPX, 23 },
>  };
> 
>  static const struct imx290_regval imx290_10bit_settings[] = {
> @@ -344,6 +336,58 @@ static const struct imx290_regval
> imx290_12bit_settings[] = { { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
>  };
> 
> +static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
> +	/* 222.25MHz or 445.5Mbit/s per lane */

s/222.25/222.75/ ;-)

Despite that:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> +	.repetition = 0x10,
> +	.tclkpost = 87,
> +	.thszero = 55,
> +	.thsprepare = 31,
> +	.tclktrail = 31,
> +	.thstrail = 31,
> +	.tclkzero = 119,
> +	.tclkprepare = 31,
> +	.tlpx = 23,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_445_5mhz = {
> +	/* 445.5MHz or 891Mbit/s per lane */
> +	.repetition = 0x00,
> +	.tclkpost = 119,
> +	.thszero = 103,
> +	.thsprepare = 71,
> +	.tclktrail = 55,
> +	.thstrail = 63,
> +	.tclkzero = 255,
> +	.tclkprepare = 63,
> +	.tlpx = 55,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_148_5mhz = {
> +	/* 148.5MHz or 297Mbit/s per lane */
> +	.repetition = 0x10,
> +	.tclkpost = 79,
> +	.thszero = 47,
> +	.thsprepare = 23,
> +	.tclktrail = 23,
> +	.thstrail = 23,
> +	.tclkzero = 87,
> +	.tclkprepare = 23,
> +	.tlpx = 23,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_297mhz = {
> +	/* 297MHz or 594Mbit/s per lane */
> +	.repetition = 0x00,
> +	.tclkpost = 103,
> +	.thszero = 87,
> +	.thsprepare = 47,
> +	.tclktrail = 39,
> +	.thstrail = 47,
> +	.tclkzero = 191,
> +	.tclkprepare = 47,
> +	.tlpx = 39,
> +};
> +
>  /* supported link frequencies */
>  #define FREQ_INDEX_1080P	0
>  #define FREQ_INDEX_720P		1
> @@ -557,6 +601,42 @@ static int imx290_set_black_level(struct imx290
> *imx290, black_level >> (16 - bpp), err);
>  }
> 
> +static int imx290_set_csi_config(struct imx290 *imx290)
> +{
> +	const s64 *link_freqs = imx290_link_freqs_ptr(imx290);
> +	const struct imx290_csi_cfg *csi_cfg;
> +	int ret = 0;
> +
> +	switch (link_freqs[imx290->current_mode->link_freq_index]) {
> +	case 445500000:
> +		csi_cfg = &imx290_csi_445_5mhz;
> +		break;
> +	case 297000000:
> +		csi_cfg = &imx290_csi_297mhz;
> +		break;
> +	case 222750000:
> +		csi_cfg = &imx290_csi_222_75mhz;
> +		break;
> +	case 148500000:
> +		csi_cfg = &imx290_csi_148_5mhz;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repetition, &ret);
> +	imx290_write(imx290, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
> +	imx290_write(imx290, IMX290_THSZERO, csi_cfg->thszero, &ret);
> +	imx290_write(imx290, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
> +	imx290_write(imx290, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
> +	imx290_write(imx290, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
> +	imx290_write(imx290, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
> +	imx290_write(imx290, IMX290_TCLKPREPARE, csi_cfg->tclkprepare, 
&ret);
> +	imx290_write(imx290, IMX290_TLPX, csi_cfg->tlpx, &ret);
> +
> +	return ret;
> +}
> +
>  static int imx290_setup_format(struct imx290 *imx290,
>  			       const struct v4l2_mbus_framefmt *format)
>  {
> @@ -769,6 +849,12 @@ static int imx290_start_streaming(struct imx290
> *imx290, return ret;
>  	}
> 
> +	ret = imx290_set_csi_config(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set csi cfg\n");
> +		return ret;
> +	}
> +
>  	/* Apply the register values related to current frame format */
>  	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>  	ret = imx290_setup_format(imx290, format);




