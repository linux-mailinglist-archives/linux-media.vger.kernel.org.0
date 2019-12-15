Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB97C11F9DD
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLORqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:46:15 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:45218 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfLORqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 12:46:15 -0500
Received: by mail-pj1-f66.google.com with SMTP id r11so1949821pjp.12
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E0v8BsJYt4cJXe3rlwgSZiboiBQsoAsO6HkNzr+KGMs=;
        b=IiF1Q9f01EWMfmah72PemS4xhqWeS6mhP/Z6/UoCSOHpoiItwy//QR1eVMpTPP7xIw
         wnJ1hDanm8rig8mWoCAnUrkezM+9zlBi1/8HaUv9MLZRUsHKL2MGbLFLkyjKWWfzjBqi
         rtEnQ3A0dCZF8OFgisATogXORgvEKaswDmqided4Y72mJiniKvyEICN0Rf5RU2o3c3c2
         2zdN+z2mVDTel6OkveifdARpBEiyk88zSYFFBTY88JMIq2851eS05hox5ngYsssOk039
         seOO7NgogQBDHFy6xDhNP578zwOfDh2OZyMqSzhm7qHXwCequjKjuaiseFJRWeyyMGam
         5ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E0v8BsJYt4cJXe3rlwgSZiboiBQsoAsO6HkNzr+KGMs=;
        b=OVBg7KdFQslCFWNkZGBSoCjCLQhTBfoJ22iImJuW6ffbej95mk4X5aaFdVI4yzde6N
         btcIEmEOZ0xSmp39Azai49N2Up0IUGuAsIz3NbBaBy0q0EyOcmUCd4FIHnNV9omkTGaY
         WH4Usy55sb//Xd+JQEIUYuF8hFoBIyhXQBlyFRhMfaXqdg46k6qA/So0Q8+7teP0Jh6r
         1ovyW3GvMT1LqKwe2i2Dydhtw8pHWCUr27zhWuniyr1FJZCOP8Vi2yBy8zPzKA1ROt9s
         MacB8meUMxXIPVqO4dxABkeRPqP6H+EMmZOHmNOjR36q96Bhc1W3ZmJWlPIw3Fl04ov0
         kAeQ==
X-Gm-Message-State: APjAAAWs0/EDPDaDyJZuwozMpRBkyVE3b2XtNcEC+yA5oYdSoq6QW45j
        EjplSKdnWyvlwc0r/U+4/vOr
X-Google-Smtp-Source: APXvYqxBGgk0qogpfgu/D5jEao5hhISZ5aQbGx9LJNIKdnEsjX1FnOawcpTEMyrJB0DQ2q4N2JkOXw==
X-Received: by 2002:a17:90a:21a1:: with SMTP id q30mr13335510pjc.8.1576431974335;
        Sun, 15 Dec 2019 09:46:14 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:78f:3e30:ad66:df45:6a09:a260])
        by smtp.gmail.com with ESMTPSA id y197sm10426009pfc.79.2019.12.15.09.46.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:46:13 -0800 (PST)
Date:   Sun, 15 Dec 2019 23:16:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
Message-ID: <20191215174606.GC11427@Mani-XPS-13-9360>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
 <20191203085417.GB5282@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203085417.GB5282@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Dec 03, 2019 at 10:54:17AM +0200, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Sat, Nov 30, 2019 at 12:35:39AM +0530, Manivannan Sadhasivam wrote:
> > IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
> > 12 bit formats. Since the driver already supports RAW10 mode, let's add
> > the missing RAW12 mode as well.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/media/i2c/imx290.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index e218c959a729..d5bb3a59ac46 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -75,6 +75,7 @@ struct imx290 {
> >  	struct clk *xclk;
> >  	struct regmap *regmap;
> >  	int nlanes;
> > +	u8 bpp;
> >  
> >  	struct v4l2_subdev sd;
> >  	struct v4l2_fwnode_endpoint ep;
> > @@ -98,6 +99,7 @@ struct imx290_pixfmt {
> >  
> >  static const struct imx290_pixfmt imx290_formats[] = {
> >  	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
> > +	{ MEDIA_BUS_FMT_SRGGB12_1X12 },
> >  };
> >  
> >  static const struct regmap_config imx290_regmap_config = {
> > @@ -265,6 +267,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
> >  	{ 0x300b, 0x00},
> >  };
> >  
> > +static const struct imx290_regval imx290_12bit_settings[] = {
> > +	{ 0x3005, 0x01 },
> > +	{ 0x3046, 0x01 },
> > +	{ 0x3129, 0x00 },
> > +	{ 0x317c, 0x00 },
> > +	{ 0x31ec, 0x0e },
> > +	{ 0x3441, 0x0c },
> > +	{ 0x3442, 0x0c },
> > +	{ 0x300a, 0xf0 },
> > +	{ 0x300b, 0x00 },
> > +};
> > +
> >  /* supported link frequencies */
> >  static const s64 imx290_link_freq[] = {
> >  	IMX290_DEFAULT_LINK_FREQ,
> > @@ -550,6 +564,21 @@ static int imx290_write_current_format(struct imx290 *imx290,
> >  			dev_err(imx290->dev, "Could not set format registers\n");
> >  			return ret;
> >  		}
> > +
> > +		imx290->bpp = 10;
> > +
> > +		break;
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> > +						ARRAY_SIZE(
> > +							imx290_12bit_settings));
> > +		if (ret < 0) {
> > +			dev_err(imx290->dev, "Could not set format registers\n");
> > +			return ret;
> > +		}
> > +
> > +		imx290->bpp = 12;
> > +
> >  		break;
> >  	default:
> >  		dev_err(imx290->dev, "Unknown pixel format\n");
> > @@ -910,6 +939,9 @@ static int imx290_probe(struct i2c_client *client)
> >  		goto free_err;
> >  	}
> >  
> > +	/* Default bits per pixel value */
> > +	imx290->bpp = 10;
> 
> Where is the format being initialised at the moment? Nowhere?
> 
> If that is the case, I think it should be fixed before this patch.
> 

Sorry, I don't quite understand what you're suggesting here. The bpp
is initialised because that's the default bit value at power up and
this value is being used below in imx290_calc_pixel_rate(). I'm not sure
why we need to initialise the format before set_fmt!

Thanks,
Mani

> > +
> >  	mutex_init(&imx290->lock);
> >  
> >  	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
