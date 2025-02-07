Return-Path: <linux-media+bounces-25794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277BA2C08C
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43621188CE3E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 10:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42691DE3B6;
	Fri,  7 Feb 2025 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSKeuzDa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8741A76AE
	for <linux-media@vger.kernel.org>; Fri,  7 Feb 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923979; cv=none; b=GV2Gq9QWd15Gv+GMSlIfUuUkh2dvKMMQEILzaSHobfHWzb/3tTSnaDoCezZinFHMKS3WtQomP1/YxkqONu6g8jYrOcdGV/uW1ZgHOeZyRTbrryJyW6rH/XOxIWTUtzAx7V5M7kGBW36gIYEgl1Uu4pN0HcraSu/fEf2bWVLFMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923979; c=relaxed/simple;
	bh=1MzZ4jt3dRnsEViGPIkEprcxnNZMxDGu06muvP2qXZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxeJ/MmhYX4gWQl6/xE8hszrEWVu2VZyN6Yg+2R5qkGF6aTxBsCspbAhY1mQkd0DT7CZv1eziA3SJLEhVB2uuh/3x1mNac7o69EMNt5nm6QpaExT2Nv9EhxjXGQNtahBkVA4bM/ghoQC2g0Uab/rzPlMlXqqX/ucVuk/1bfDkMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSKeuzDa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738923977; x=1770459977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1MzZ4jt3dRnsEViGPIkEprcxnNZMxDGu06muvP2qXZw=;
  b=cSKeuzDaUvch2OMA/zncd1yZxinFodQc2OyUi94y36+4/PU2I6TNU2LG
   anO57w7LPm1cCFOiANbEY4TtkNh2jimNpfLPSlDHHkvD7za6wqqyok6af
   /KHntKx9+fz64BC8Doj7l1H5Xa0S1m06CpOxOgiKg0UMXFgkDKXzFP4RC
   l9qupVAMcj3TBZa2xesnqFgfN/1B/2LUMHWC4fXhGc8S04+QjWvzlLx5l
   v8DgqooPXx6I3arrN2Mir5onl6MO0afrpDNfW3dx0dNcY1txSAApmhJrn
   4+GgIw+4VsjVEFzNBHgGwVG2+I8gjynnSxWrTWeIYgQZZ5vzgHKbXpynC
   w==;
X-CSE-ConnectionGUID: T0HVTLlFRJq7ulwEK8ijZw==
X-CSE-MsgGUID: zl7sTco+RCW5fLGKRQiCww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39675499"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39675499"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:26:15 -0800
X-CSE-ConnectionGUID: LFn8MKRRRk2LUo/oyWXDPg==
X-CSE-MsgGUID: F/sYaS0KQuWqYr4hcDYl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116686680"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:26:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8820311F9C3;
	Fri,  7 Feb 2025 12:26:11 +0200 (EET)
Date: Fri, 7 Feb 2025 10:26:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dw9719: Add DW9761 support
Message-ID: <Z6Xfw7lI-d4-b7-R@kekkonen.localdomain>
References: <20241105203658.29737-1-hdegoede@redhat.com>
 <343f76201d60015bbf2ff4d2c9c6110796d63219.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <343f76201d60015bbf2ff4d2c9c6110796d63219.camel@apitzsch.eu>

Hi Adnré,

On Fri, Feb 07, 2025 at 12:17:19AM +0100, André Apitzsch wrote:
> Hello Hans,
> 
> Am Dienstag, dem 05.11.2024 um 21:36 +0100 schrieb Hans de Goede:
> > Add support for the DW9761 VCM controller, which is very similar to
> > the DW9719.
> > 
> > The new support is based on
> > drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
> > from the Xiaomi kernel sources for the Mi Pad 2.
> > 
> > The DW9761 support has been tested on a Xiaomi Mi Pad 2 tablet and
> > DW9719 support has been tested (to avoid regressions) on a Microsoft
> > Surface Go tablet.
> > 
> > Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/media/i2c/dw9719.c | 113 +++++++++++++++++++++++------------
> > --
> >  1 file changed, 71 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> > index c626ed845928..032fbcb981f2 100644
> > --- a/drivers/media/i2c/dw9719.c
> > +++ b/drivers/media/i2c/dw9719.c
> > @@ -2,8 +2,10 @@
> >  // Copyright (c) 2012 Intel Corporation
> >  
> >  /*
> > - * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in
> > this repo:
> > - * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
> > + * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c
> > from:
> > + * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5 and
> > + * latte-l-
> > oss/drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
> > + * from: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
> >   */
> >  
> >  #include <linux/delay.h>
> > @@ -23,26 +25,45 @@
> >  
> >  #define DW9719_INFO			CCI_REG8(0)
> >  #define DW9719_ID			0xF1
> > +#define DW9761_ID			0xF4
> >  
> >  #define DW9719_CONTROL			CCI_REG8(2)
> > +#define DW9719_STANDBY			0x00
> > +#define DW9719_SHUTDOWN			0x01
> >  #define DW9719_ENABLE_RINGING		0x02
> >  
> >  #define DW9719_VCM_CURRENT		CCI_REG16(3)
> >  
> > +#define DW9719_STATUS			CCI_REG16(5)
> > +#define DW9719_STATUS_BUSY		BIT(0)
> > +
> >  #define DW9719_MODE			CCI_REG8(6)
> >  #define DW9719_MODE_SAC_SHIFT		4
> > -#define DW9719_MODE_SAC3		4
> > +#define DW9719_DEFAULT_SAC		4
> > +#define DW9761_DEFAULT_SAC		6
> >  
> >  #define DW9719_VCM_FREQ			CCI_REG8(7)
> >  #define DW9719_DEFAULT_VCM_FREQ		0x60
> > +#define DW9761_DEFAULT_VCM_FREQ		0x3E
> > +
> > +#define DW9761_VCM_PRELOAD		CCI_REG8(8)
> > +#define DW9761_DEFAULT_VCM_PRELOAD	0x73
> > +
> >  
> >  #define to_dw9719_device(x) container_of(x, struct dw9719_device,
> > sd)
> >  
> > +enum dw9719_model {
> > +	DW9719,
> > +	DW9761,
> > +};
> > +
> >  struct dw9719_device {
> >  	struct v4l2_subdev sd;
> >  	struct device *dev;
> >  	struct regmap *regmap;
> >  	struct regulator *regulator;
> > +	enum dw9719_model model;
> > +	u32 mode_low_bits;
> >  	u32 sac_mode;
> >  	u32 vcm_freq;
> >  
> > @@ -52,30 +73,14 @@ struct dw9719_device {
> >  	} ctrls;
> >  };
> >  
> > -static int dw9719_detect(struct dw9719_device *dw9719)
> > -{
> > -	int ret;
> > -	u64 val;
> > -
> > -	ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	if (val != DW9719_ID) {
> > -		dev_err(dw9719->dev, "Failed to detect correct
> > id\n");
> > -		return -ENXIO;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  static int dw9719_power_down(struct dw9719_device *dw9719)
> >  {
> >  	return regulator_disable(dw9719->regulator);
> >  }
> >  
> > -static int dw9719_power_up(struct dw9719_device *dw9719)
> > +static int dw9719_power_up(struct dw9719_device *dw9719, bool
> > detect)
> >  {
> > +	u64 val;
> >  	int ret;
> >  
> >  	ret = regulator_enable(dw9719->regulator);
> > @@ -83,16 +88,54 @@ static int dw9719_power_up(struct dw9719_device
> > *dw9719)
> >  		return ret;
> >  
> >  	/* Jiggle SCL pin to wake up device */
> > -	cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
> > -
> > +	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_SHUTDOWN,
> > &ret);
> > +	fsleep(100);
> > +	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_STANDBY,
> > &ret);
> >  	/* Need 100us to transit from SHUTDOWN to STANDBY */
> >  	fsleep(100);
> >  
> > +	if (detect) {
> > +		ret = cci_read(dw9719->regmap, DW9719_INFO, &val,
> > NULL);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		switch (val) {
> > +		case DW9719_ID:
> > +			dw9719->model = DW9719;
> > +			dw9719->mode_low_bits = 0x00;
> > +			dw9719->sac_mode = DW9719_DEFAULT_SAC;
> > +			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
> > +			break;
> > +		case DW9761_ID:
> > +			dw9719->model = DW9761;
> > +			dw9719->mode_low_bits = 0x01;
> > +			dw9719->sac_mode = DW9761_DEFAULT_SAC;
> > +			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
> > +			break;
> > +		default:
> > +			dev_err(dw9719->dev,
> > +				"Error unknown device id
> > 0x%02llx\n", val);
> > +			return -ENXIO;
> > +		}
> > +
> > +		/* Optional indication of SAC mode select */
> > +		device_property_read_u32(dw9719->dev, "dongwoon,sac-
> > mode",
> > +					 &dw9719->sac_mode);
> > +
> > +		/* Optional indication of VCM frequency */
> > +		device_property_read_u32(dw9719->dev, "dongwoon,vcm-
> > freq",
> > +					 &dw9719->vcm_freq);
> > +	}
> > +
> >  	cci_write(dw9719->regmap, DW9719_CONTROL,
> > DW9719_ENABLE_RINGING, &ret);
> > -	cci_write(dw9719->regmap, DW9719_MODE,
> > -		  dw9719->sac_mode << DW9719_MODE_SAC_SHIFT, &ret);
> > +	cci_write(dw9719->regmap, DW9719_MODE, dw9719->mode_low_bits
> > |
> > +			  (dw9719->sac_mode <<
> > DW9719_MODE_SAC_SHIFT), &ret);
> >  	cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq,
> > &ret);
> >  
> > +	if (dw9719->model == DW9761)
> > +		cci_write(dw9719->regmap, DW9761_VCM_PRELOAD,
> > +			  DW9761_DEFAULT_VCM_PRELOAD, &ret);
> > +
> >  	if (ret)
> >  		dw9719_power_down(dw9719);
> >  
> > @@ -159,7 +202,7 @@ static int dw9719_resume(struct device *dev)
> >  	int ret;
> >  	int val;
> >  
> > -	ret = dw9719_power_up(dw9719);
> > +	ret = dw9719_power_up(dw9719, false);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -237,16 +280,6 @@ static int dw9719_probe(struct i2c_client
> > *client)
> >  		return PTR_ERR(dw9719->regmap);
> >  
> >  	dw9719->dev = &client->dev;
> > -	dw9719->sac_mode = DW9719_MODE_SAC3;
> > -	dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
> > -
> > -	/* Optional indication of SAC mode select */
> > -	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
> > -				 &dw9719->sac_mode);
> > -
> > -	/* Optional indication of VCM frequency */
> > -	device_property_read_u32(&client->dev, "dongwoon,vcm-freq",
> > -				 &dw9719->vcm_freq);
> >  
> >  	dw9719->regulator = devm_regulator_get(&client->dev, "vdd");
> >  	if (IS_ERR(dw9719->regulator))
> > @@ -274,14 +307,10 @@ static int dw9719_probe(struct i2c_client
> > *client)
> >  	 * will work.
> >  	 */
> >  
> > -	ret = dw9719_power_up(dw9719);
> > +	ret = dw9719_power_up(dw9719, true);
> >  	if (ret)
> >  		goto err_cleanup_media;
> >  
> > -	ret = dw9719_detect(dw9719);
> > -	if (ret)
> > -		goto err_powerdown;
> > -
> >  	pm_runtime_set_active(&client->dev);
> >  	pm_runtime_get_noresume(&client->dev);
> >  	pm_runtime_enable(&client->dev);
> > @@ -299,7 +328,6 @@ static int dw9719_probe(struct i2c_client
> > *client)
> >  err_pm_runtime:
> >  	pm_runtime_disable(&client->dev);
> >  	pm_runtime_put_noidle(&client->dev);
> > -err_powerdown:
> >  	dw9719_power_down(dw9719);
> >  err_cleanup_media:
> >  	media_entity_cleanup(&dw9719->sd.entity);
> > @@ -327,6 +355,7 @@ static void dw9719_remove(struct i2c_client
> > *client)
> >  
> >  static const struct i2c_device_id dw9719_id_table[] = {
> >  	{ "dw9719" },
> > +	{ "dw9761" },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
> 
> Thanks for the patch.
> 
> Do you plan to resend this patch?
> If not, I can send it again, together with a patch that adds an
> of_match table, that was needed to test these changes on my device.

It'd be nice to have this done in a separate patch: it's unrelated.

I have picked this patch to my tree, too.

> 
> Tested-by: André Apitzsch <git@apitzsch.eu>

Thanks!

-- 
Regards,

Sakari Ailus

