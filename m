Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05590DCF20
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 21:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394833AbfJRTMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 15:12:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39673 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388065AbfJRTMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 15:12:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id y3so7291949ljj.6;
        Fri, 18 Oct 2019 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruqCqNBnsNum43HyB2OnTjtqaOgr+5y6aliLgOFBaak=;
        b=qE/iv/XuOJvgVBtMv5w93GcqREh9iAXEVUGCk9gHiaA1ocGMuNaphGSyuTY6tPFMyG
         zIy5NLsstNN+usLScCBOBiPkd7FPpoQNPBlTLkVUkZV99Ll6Q2EJjQT5FUPCOjkEdJyV
         mUVZL3VNDXXMmGyMqJaJs99rpZfKIUgGLYS4IgkC4fEYNecSObA57y16V0YB0kr67r5H
         m8j7uvIXF1HricCi5xP6SedrNoyImXoCKzuacmifeGNOgiMfIOkkM7RsCdFNrtpj0FtA
         wape1SF0O3Z/k74EqvDgHCHII3aUP2CgCo/x8BTqxNDpiv4tTYR9c6sfYjX9U5KkmBTZ
         +YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruqCqNBnsNum43HyB2OnTjtqaOgr+5y6aliLgOFBaak=;
        b=s3vea+EleN5B9DzvAVO/u9wtlHEFn7kO/MctHP26tkPYQzggZXzRCu/b+FEpaZq4mK
         FR2oIeMtIpAEnC7oPQJqi/dF9g3Itj8iZi9XnR2vl1+DTX4mGAbRsCFOkwlJHW6EDz1M
         c6oxtgvNI2qh4FNTLJpJrdm8k3Ko7EJ37xN021cAk1/iVFsu5/iEArb+Nw3fxcdqhqTY
         N/Zb936xKBvIpU5pd8jylgryGNZ8ocfenMmVDTY8dVDTmO850fM6w83L8ppyuyFja5we
         b9Gi+nz49au2K3Apl3XKNwOzMSCQQO3ddUvx3/59TZOHROtYx7EFARysbeqs3SCFJu6K
         2Ymw==
X-Gm-Message-State: APjAAAWvSYLFndynJOiNRAyp3NhNG9LnF0sHeQRXCOlttuZx+EC5l68t
        j8HN48HtM9aEb/ZdPQOOwVAlCELVTDc=
X-Google-Smtp-Source: APXvYqy/rX2Xx4xOaU8wIKgtzxtrlJitQCKuHfErMFZm6GOZm/x0hOv5z+NWFHuBJopVVZImIG267g==
X-Received: by 2002:a2e:964c:: with SMTP id z12mr7021213ljh.79.1571425922270;
        Fri, 18 Oct 2019 12:12:02 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id k13sm3093323ljc.96.2019.10.18.12.12.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 12:12:01 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] media: ov6650: Fix arbitrary selection of master clock rate
Date:   Fri, 18 Oct 2019 21:11:59 +0200
Message-ID: <1995941.OKZ89KhD3d@z50>
In-Reply-To: <20191018185419.GC3712@kekkonen.localdomain>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com> <20191013125050.4153-7-jmkrzyszt@gmail.com> <20191018185419.GC3712@kekkonen.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Friday, October 18, 2019 8:54:19 P.M. CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Sun, Oct 13, 2019 at 02:50:50PM +0200, Janusz Krzysztofik wrote:
> > A hardcoded 12 MHz master clock frequency has been assumed since
> > conversion of the driver from soc_camera sensor to a standalone V4L2
> > subdevice by commit 23a52386fabe ("media: ov6650: convert to standalone
> > v4l2 subdevice").  Fix it.
> > 
> > Define a static table of supported master clock rates (fix misnamed
> > symbol while being at it), then use v4l2_clk_get/set_rate() to obtain
> > a clock rate matching one of those supported.  On success, apply
> > respective master clock hardware divisor provided by the matching
> > element of the table.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  drivers/media/i2c/ov6650.c | 64 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 58 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > index f4723c0b5c70..13fd7c4699b2 100644
> > --- a/drivers/media/i2c/ov6650.c
> > +++ b/drivers/media/i2c/ov6650.c
> > @@ -124,7 +124,7 @@
> >  
> >  #define DEF_AECH		0x4D
> >  
> > -#define CLKRC_6MHz		0x00
> > +#define CLKRC_8MHz		0x00
> >  #define CLKRC_12MHz		0x40
> >  #define CLKRC_16MHz		0x80
> >  #define CLKRC_24MHz		0xc0
> > @@ -201,6 +201,29 @@ struct ov6650 {
> >  	u32 code;
> >  };
> >  
> > +struct ov6650_xclk {
> > +	unsigned long	rate;
> > +	u8		clkrc;
> > +};
> > +
> > +static const struct ov6650_xclk ov6650_xclk[] = {
> > +{
> > +	.rate	= 8000000,
> > +	.clkrc	= CLKRC_8MHz,
> > +},
> > +{
> > +	.rate	= 12000000,
> > +	.clkrc	= CLKRC_12MHz,
> > +},
> > +{
> > +	.rate	= 16000000,
> > +	.clkrc	= CLKRC_16MHz,
> > +},
> > +{
> > +	.rate	= 24000000,
> > +	.clkrc	= CLKRC_24MHz,
> > +},
> > +};
> >  
> >  static u32 ov6650_codes[] = {
> >  	MEDIA_BUS_FMT_YUYV8_2X8,
> > @@ -774,7 +797,7 @@ static int ov6650_reset(struct i2c_client *client)
> >  }
> >  
> >  /* program default register values */
> > -static int ov6650_prog_dflt(struct i2c_client *client)
> > +static int ov6650_prog_dflt(struct i2c_client *client, u8 clkrc)
> >  {
> >  	int ret;
> >  
> > @@ -782,7 +805,7 @@ static int ov6650_prog_dflt(struct i2c_client *client)
> >  
> >  	ret = ov6650_reg_write(client, REG_COMA, 0);	/* ~COMA_RESET */
> >  	if (!ret)
> > -		ret = ov6650_reg_write(client, REG_CLKRC, CLKRC_12MHz);
> > +		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
> >  	if (!ret)
> >  		ret = ov6650_reg_rmw(client, REG_COMB, 0, COMB_BAND_FILTER);
> >  
> > @@ -793,8 +816,10 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> >  	struct ov6650 *priv = to_ov6650(client);
> > -	u8		pidh, pidl, midh, midl;
> > -	int		ret;
> > +	const struct ov6650_xclk *xclk;
> > +	unsigned long rate;
> > +	u8 pidh, pidl, midh, midl;
> > +	int i, ret;
> >  
> >  	priv->clk = v4l2_clk_get(&client->dev, NULL);
> >  	if (IS_ERR(priv->clk)) {
> > @@ -803,6 +828,33 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
> >  		return ret;
> >  	}
> >  
> > +	rate = v4l2_clk_get_rate(priv->clk);
> > +	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
> > +		if (rate != ov6650_xclk[i].rate)
> > +			continue;
> > +
> > +		xclk = &ov6650_xclk[i];
> > +		dev_info(&client->dev, "using host default clock rate %lukHz\n",
> > +			 rate / 1000);
> > +		break;
> > +	}
> 
> xclk is undefined unless it was set in the previous loop. 

Indeed, sorry for that.

> Please initialise
> to to NULL. I can fix that, too, while applying the patch.

OK, please do if you can.

Thanks,
Janusz


> > +	for (i = 0; !xclk && i < ARRAY_SIZE(ov6650_xclk); i++) {
> > +		ret = v4l2_clk_set_rate(priv->clk, ov6650_xclk[i].rate);
> > +		if (ret || v4l2_clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
> > +			continue;
> > +
> > +		xclk = &ov6650_xclk[i];
> > +		dev_info(&client->dev, "using negotiated clock rate %lukHz\n",
> > +			 xclk->rate / 1000);
> > +		break;
> > +	}
> > +	if (!xclk) {
> > +		dev_err(&client->dev, "unable to get supported clock rate\n");
> > +		if (!ret)
> > +			ret = -EINVAL;
> > +		goto eclkput;
> > +	}
> > +
> >  	ret = ov6650_s_power(sd, 1);
> >  	if (ret < 0)
> >  		goto eclkput;
> > @@ -836,7 +888,7 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
> >  
> >  	ret = ov6650_reset(client);
> >  	if (!ret)
> > -		ret = ov6650_prog_dflt(client);
> > +		ret = ov6650_prog_dflt(client, xclk->clkrc);
> >  	if (!ret) {
> >  		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
> >  
> 
> 




