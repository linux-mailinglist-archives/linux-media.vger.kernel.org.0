Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C051689196
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjBCIGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjBCIFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:05:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEEA953ED
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675411454; x=1706947454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NFymI92XVF0cJnBhj3rtJPZ/2Kf8LE9ocBfFtRJwZAw=;
  b=Y3gRobXfNJrz0RMD+4wpBgOcifQZXsex53z5x4iJ7WTRb8YWDloTqgLC
   kv3+7IQ/7RTqzqvQjO/my0lI5DAQ7uUDfxmDXggsDoOEhb7X1KR8EBHwu
   DVodWEr5Qc79bLBPKhIDEsxI0fB/+R4VgNPvVTMYRkWJBCC0XZikI4b51
   ir/lv458aSVzMr3ZJCUZpIvqeAHdMXGalYlw+wxOnBW8nV68tZ8UeHZJ+
   9isBUE94XeVolq6IaMzZiFsxfU5rWbxcZDtmIWhZ9yra/Q1FFFSZjYO6Z
   YkplaQKG/Okb6vX5d4fsuDekVb8C7xIOWtQaCfMAU5Lghz1pXUFSRoja6
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28845988"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 09:04:12 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 09:04:12 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 09:04:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675411452; x=1706947452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NFymI92XVF0cJnBhj3rtJPZ/2Kf8LE9ocBfFtRJwZAw=;
  b=R0k2mJsPQlIhB06XTCi62BT+VZLD85ZR4mN8/RP2SMfLzG71PXKGRt96
   P7XZBzj1vuxrMLKUwJSrbHs2SUznSlrarATuCBTHLc+n42ZvbHXEJYqV1
   cGpzOP8DQTHWIy3gwkV1YsH9SpRFfzmlN1SmWh4WJ2fq00t4myWgIXV9f
   GjU9DAthpwzPLzuw0yoHJxZnD60mSZ4+c9I0c0MsDNqvaUX3hrMIDbZBn
   KyjPOF7271FraV05oraIEnU6R/qnLuJBsWGoUQF4pELN/IzKGSloO3ruS
   etK1IXKCaHd1IYio+TwLP15MdM1afBGs/KlgJGKDPt3Jaz9k3v57xH+kI
   g==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28845987"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 09:04:12 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C953E280056;
        Fri,  3 Feb 2023 09:04:11 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 06/11] media: i2c: imx290: Use CSI timings as per datasheet
Date:   Fri, 03 Feb 2023 09:04:11 +0100
Message-ID: <2743472.BEx9A2HvPv@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131192016.3476937-7-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <20230131192016.3476937-7-dave.stevenson@raspberrypi.com>
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

thanks for the patch.

Am Dienstag, 31. Januar 2023, 20:20:11 CET schrieb Dave Stevenson:
> Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> and pixel rate" added support for the increased link frequencies
> on 2 data lanes, but didn't update the CSI timing registers in
> accordance with the datasheet.
> 
> Use the specified settings.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
>  1 file changed, 106 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 6bcfa535872f..9ddd6382b127 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -174,6 +174,18 @@ struct imx290_mode {
>  	u32 data_size;
>  };
> 
> +struct imx290_csi_cfg {
> +	u16 repitition;
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
> @@ -273,16 +285,6 @@ static const struct imx290_regval
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
> @@ -298,16 +300,6 @@ static const struct imx290_regval
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
> @@ -328,6 +320,58 @@ static const struct imx290_regval
> imx290_12bit_settings[] = { { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
>  };
> 
> +static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
> +	/* 222.25MHz or 445.5Mbit/s per lane */

222.75MHz. This is also 891 MBit/s per lane, no? This link frequency is used 
for 4 lane setup only.

> +	.repitition = 0x10,
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
> +	.repitition = 0x00,
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

594 MBit/s per lane, no? This link freq is only used for 4 lanes

> +	.repitition = 0x10,

Ah, this is so confusing. This structure is used depending on the link_freq, 
but this value is defined on the data rate (for both 2 & 4 lanes separately).

Best regards,
Alexander

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
> +	.repitition = 0x00,
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
> @@ -536,6 +580,42 @@ static int imx290_set_black_level(struct imx290
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
> +	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repitition, &ret);
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
> @@ -748,6 +828,12 @@ static int imx290_start_streaming(struct imx290
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




