Return-Path: <linux-media+bounces-29183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CDA7861A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 03:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 753B37A42A0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 01:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A0134D4;
	Wed,  2 Apr 2025 01:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BntJT8/5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54253F513;
	Wed,  2 Apr 2025 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556881; cv=none; b=X0DJ+Npz5IOvTllY06zek90RG0zoXsk9/3HrpArEYh2+K15SoVwFBOYCfJIin8q2abUwUmKwDcme9BYU+MQE4SPNlan9mPwnRjgbjukJfS5fxHDwcIvhXRhg8Ui9r2HXy5i6msb1T6e/kOWj24q6n81Sq3KUmG/tLDjOYbYXbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556881; c=relaxed/simple;
	bh=iz3cR0H8QEEZp9dUtXXPGZHmNBQYWRr63NcGAxNQX/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXklZ1vLiqU550CmCApELEMzc9OKnMunBGtiIKdYX9NC7U+ytercXiP0XlOAVve+36rpS5nhLqAIH6hQQ11Tob53R5xVhA7M4JcDPndUeVX4/Prskf2eGomcx0LCtdaII7hxudI+vcq+UG34srgaHW1+VCExwY2qzDNb+XZ/fvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BntJT8/5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE3DE666;
	Wed,  2 Apr 2025 03:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743556764;
	bh=iz3cR0H8QEEZp9dUtXXPGZHmNBQYWRr63NcGAxNQX/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BntJT8/5mIcCYRCYn6q9X8MDHyOTs7wFi341MAkw+Osem+O8fDEEDx5HrQOVJtWc2
	 7vAeIWhI26+S5kHWe7tamc69jmwvyKgMe9vWlz1KoCopb0ICIH+ases16MfiMXuObs
	 XJc+4T/3ox+FjLGQ+vIwerG4jCnSyEEzo0nMN+nQ=
Date: Wed, 2 Apr 2025 04:20:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	dave.stevenson@raspberrypi.com, krzk@kernel.org,
	dan.carpenter@linaro.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
	grosikop@amd.com, king.li@amd.com, dantony@amd.com,
	Venkata Narendra Kumar Gutta <vengutta@amd.com>
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250402012052.GG4845@pendragon.ideasonboard.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>

On Mon, Mar 31, 2025 at 03:17:22PM -0400, Nirujogi, Pratap wrote:
> On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
> > On 28/03/2025 21:42, Pratap Nirujogi wrote:
> >> From: Bin Du <Bin.Du@amd.com>
> > 
> >> +static const struct i2c_device_id ov05c10_id[] = {
> >> +     {"ov05c10", 0 },
> >> +     { }
> >> +};
> > 
> > There's an IPU6/IPU7 version of this driver.
> > 
> > https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ 
> > ov05c10.c
> > 
> > Perhaps you could import the Intel ACPI name contained in there too.
> > 
> sure, will add Intel ACPI names too in V3. To be specific, I'm going to 
> add the below table in addition to the existing "struct i2c_device_id 
> ov05c10_id[]" table:
> 
> static const struct acpi_device_id ov05c10_acpi_ids[] = {
> 	{ "OVTI05C1" },
> 	{}
> };

You could drop the i2c_device_id table if you added an OF device ID
table, but you'll need DT bindings for that. Sakari, any best practice
rule in this area ?

> >> +
> >> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
> >> +
> >> +static struct i2c_driver ov05c10_i2c_driver = {
> >> +     .driver = {
> >> +             .name = DRV_NAME,
> >> +             .pm = pm_ptr(&ov05c10_pm_ops),
> >> +     },
> >> +     .id_table = ov05c10_id,
> >> +     .probe = ov05c10_probe,
> >> +     .remove = ov05c10_remove,
> >> +};
> >> +
> >> +module_i2c_driver(ov05c10_i2c_driver);
> >> +
> >> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> >> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> >> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> >> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
> >> +MODULE_LICENSE("GPL v2");
> > 
> > Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
> > is GPL not GPL v2.
> 
> sure, will replace "GPL v2" with "GPL" in V3.

-- 
Regards,

Laurent Pinchart

