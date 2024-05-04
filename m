Return-Path: <linux-media+bounces-10769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC208BBD16
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 18:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E837A28280F
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 16:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457AE5820E;
	Sat,  4 May 2024 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5pR3d7c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8D803;
	Sat,  4 May 2024 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840252; cv=none; b=uIbvLzm7Zhsg0bQLu11Jq89fHx9ryhst91rOCFHtP37vQ9pRBHffLk/VpEk9vxzIPX6E6DBpUIeo/ZRroSFsYvFbE7Sdk0xO2ODybNsS337I6nJnjoE+V7rgyeQM4NIc4fFDtBB4X8v5KKkjiHnLUhKENZiGr+IYH7ySOSbNCAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840252; c=relaxed/simple;
	bh=J6dA8WkpHs/Co2YXGSCUbunvLkMry4Z9wSltZtBtbpQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXjsbR8ZBhxyZp5+oCPqURQixYpUgJp0/adARNjfuUs7I05rZxrQdV6OgflSYvgVJrCbn8HgMep/ss+KcsWhXBroHt5fP4Ui1MOMqjkxWCgTPC5KmRm/7VSSKIwZawJeIHy2PJAhbCG+Wl8y9WEkR8G+6/Fpx4MT06OkdbKgJ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5pR3d7c; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f3761c96aso779924e87.3;
        Sat, 04 May 2024 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714840249; x=1715445049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RX4fi+rOn5Iqa6Of2S6mMpsMevJrG0V9bnt+UXzeNC8=;
        b=c5pR3d7ch0LvFtbWJc00zHcRWGHVyWNrrKTxJBJTfDJVHfwAdOCGO7/LFNBQfE2F8b
         8aAlZysDnfh76z+aF0sYddgvSsOKjlUHyFVaUPi5OqOG7X3b3f6syRD1cC6L7WSwGM6w
         0HhmNIFpC+fN36opGwRv6DGZzZjyGxeJRMuYUkMWnFw3XjA54AvbtJoJiQbOPJ9kZAQb
         z7y8729eJP9xsh9ob101m8WW63IpSffA4Z2FP6oAK7XjghD5dCbVul7bqBOUFSNcoWLl
         9lHPl7mjTx+VHOmYbdVWBH8SA8/UwgkSAM5qpza/QXJFLRwMre27Zu6fKRxGPDmn+jGA
         9tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714840249; x=1715445049;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RX4fi+rOn5Iqa6Of2S6mMpsMevJrG0V9bnt+UXzeNC8=;
        b=Cmw1jgISnVTU4iZQAOXdpIOvOYHIx4lZCnbu3ds+6EMtcJlkuT1Suu7HB1wtr7KpOu
         axOOe1OJoqp7lvC8uSblnyJXtzqFip2nvDXmlTywDBJ19Pq79qMobtVQuMqY4/z646PF
         1MWAbmOTxDRrwMeDN9bONBBg5NLljZ2d2I57Yuu9Zbe1KO/7/FehpnO7zYKbEY4IdTq6
         9vgOTbZAGBLZWu0Ox/J+HozhfbjkPXLDsDxGfWdhBp7Z0A1Jy/xLhaoewZIRcXvzm/cv
         QKNlE6WQnSkvrUZps+Dj046I5XtQU9i4f54cRWpbXWQ2qmp22DiAHlZpiS3E71yITI0g
         ZqbA==
X-Forwarded-Encrypted: i=1; AJvYcCXU9+5bv4TY1RO7dZip+7+dYX5LXXQaip5lWEUIObU/xVnLV0Wwo+LoLIrsnF5f1M5ZEP1A1IsHCw17ZFiUh3S7N+Sv02T4isqIamA+vKYsTTq1wu/q5r43d5UuGIy6TjICGCNpe2NtfVBqkGT11AkSk0IMYMBjUhVAWgHTTeFdQy67MTeW
X-Gm-Message-State: AOJu0Yw5lgJrmbiyLwaS8PPFpkfbk/Z1FGdPWdIi62QHjW+L4z2eUk2z
	2C+qaxUQ7un2ujFLzv3edZj0I9vsv+T4ln0XmE05kLqhdJpi7g479S54i9kv
X-Google-Smtp-Source: AGHT+IE495vJai2198vLGWjTelR5thIbMzbq9jB52jVLtblJGSXnRx3LpyRjwzHQwi9WHh+7jCh4Fg==
X-Received: by 2002:a19:914d:0:b0:51d:5ffd:efe4 with SMTP id y13-20020a19914d000000b0051d5ffdefe4mr4463354lfj.1.1714840248686;
        Sat, 04 May 2024 09:30:48 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512200f00b005194debc3e3sm936339lfb.212.2024.05.04.09.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 09:30:48 -0700 (PDT)
Date: Sat, 4 May 2024 19:30:47 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v2 2/2] media: gc2145: implement basic dvp bus support
Message-ID: <ZjZit7sDmXJXDg56@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240222062214.2627810-1-andrej.skvortzov@gmail.com>
 <20240222062214.2627810-3-andrej.skvortzov@gmail.com>
 <20240426163826.GA3095395@gnbcxd0016.gnb.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426163826.GA3095395@gnbcxd0016.gnb.st.com>

Hi Alain,

thanks for the review.

On 24-04-26 18:38, Alain Volmat wrote:
> Hi Andrey,
> 
> > --- a/drivers/media/i2c/gc2145.c
> > +++ b/drivers/media/i2c/gc2145.c
> > @@ -39,6 +39,10 @@
> >  #define GC2145_REG_ANALOG_MODE1	CCI_REG8(0x17)
> >  #define GC2145_REG_OUTPUT_FMT	CCI_REG8(0x84)
> >  #define GC2145_REG_SYNC_MODE	CCI_REG8(0x86)
> > +#define GC2145_SYNC_MODE_VSYNC_POL	BIT(0)
> > +#define GC2145_SYNC_MODE_HSYNC_POL	BIT(1)
> > +#define GC2145_SYNC_MODE_OPCLK_POL	BIT(2)
> > +#define GC2145_SYNC_MODE_OPCLK_GATE	BIT(3)
> 
> OPCLK_GATE added but never used.
All near bits were described. I decided to put description for this bit
as well, so all bits 0-5 are described in source code.

> 
> >  #define GC2145_SYNC_MODE_COL_SWITCH	BIT(4)
> >  #define GC2145_SYNC_MODE_ROW_SWITCH	BIT(5)
> >  #define GC2145_REG_BYPASS_MODE	CCI_REG8(0x89)
> > @@ -53,6 +57,12 @@
> >  #define GC2145_REG_GLOBAL_GAIN	CCI_REG8(0xb0)
> >  #define GC2145_REG_CHIP_ID	CCI_REG16(0xf0)
> >  #define GC2145_REG_PAD_IO	CCI_REG8(0xf2)
> > +#define GC2145_REG_PLL_MODE1	CCI_REG8(0xf7)
> > +#define GC2145_REG_PLL_MODE2	CCI_REG8(0xf8)
> > +#define GC2145_REG_CM_MODE	CCI_REG8(0xf9)
> > +#define GC2145_REG_CLK_DIV_MODE	CCI_REG8(0xfa)
> > +#define GC2145_REG_ANALOG_PWC	CCI_REG8(0xfc)
> 
> All 5 define added but never used, those settings are part of the cci_sequences
> table. Maybe either keep the define and update the tables or drop the
> new define ?

> > +#define GC2145_REG_PAD_IO	CCI_REG8(0xf2)
> 
> Was already defined in the existing code, see above.
Thanks, I'll drop all unneeded defines in v3.


> > @@ -773,6 +784,38 @@ static int gc2145_set_pad_format(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > +static int gc2145_config_dvp_mode(struct gc2145 *gc2145,
> > +				   const struct gc2145_format *gc2145_format)
> 
> alignment ?
Thanks.

> > +{
> > +	int ret = 0;
> > +	u64 sync_mode;
> > +	int flags;
> > +
> > +	flags = gc2145->ep.bus.parallel.flags;
> 
> int flags = gc2145->ep.bus.parallel.flags;
> ?
Fix in v3.

> > @@ -1244,36 +1292,57 @@ static int gc2145_check_hwcfg(struct device *dev)
> >  		return -EINVAL;
> >  	}
> >  
> > -	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> > +
> 
> no new line here.
ok.

> > +	gc2145->ep.bus_type = V4L2_MBUS_CSI2_DPHY;
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
> > +	if (ret) {
> > +		gc2145->ep.bus_type = V4L2_MBUS_PARALLEL;
> > +		ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
> > +	}
> >  	fwnode_handle_put(endpoint);
> > -	if (ret)
> > +	if (ret) {
> > +		dev_err(dev, "could not parse endpoint\n");
> >  		return ret;
> > -
> > -	/* Check the number of MIPI CSI2 data lanes */
> > -	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> > -		dev_err(dev, "only 2 data lanes are currently supported\n");
> > -		ret = -EINVAL;
> > -		goto out;
> >  	}
> >  
> > -	/* Check the link frequency set in device tree */
> > -	if (!ep_cfg.nr_of_link_frequencies) {
> > -		dev_err(dev, "link-frequency property not found in DT\n");
> > +	switch (gc2145->ep.bus_type) {
> > +	case V4L2_MBUS_CSI2_DPHY:
> > +		/* Check the link frequency set in device tree */
> > +		if (!gc2145->ep.nr_of_link_frequencies) {
> > +			dev_err(dev, "link-frequencies property not found in DT\n");
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> 
> any reason for change of the if order ? before num_data_lanes was
> checked first, then nr_of_link_frequencies, then 3 link_frequencies.

No reason. I'll change order like it was before in v3.

> > +
> > +		/* Check the number of MIPI CSI2 data lanes */
> > +		if (gc2145->ep.bus.mipi_csi2.num_data_lanes != 2) {
> > +			dev_err(dev, "only 2 data lanes are currently supported\n");
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		if (gc2145->ep.nr_of_link_frequencies != 3 ||
> > +			gc2145->ep.link_frequencies[0] != GC2145_640_480_LINKFREQ ||
> > +			gc2145->ep.link_frequencies[1] != GC2145_1280_720_LINKFREQ ||
> > +			gc2145->ep.link_frequencies[2] != GC2145_1600_1200_LINKFREQ) {
> 
> alignment
Thanks.

> 
> > +			dev_err(dev, "Invalid link-frequencies provided\n");
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +		break;
> > +
> 
> no newline here
ok

-- 
Best regards,
Andrey Skvortsov

