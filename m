Return-Path: <linux-media+bounces-32182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321BAB1F16
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B632A20DDC
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E743623E32D;
	Fri,  9 May 2025 21:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FbFg7oiv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045816D4E6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 21:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826347; cv=none; b=WIAi4nsQrp32/afKcGJvsTIW+bQRYDOSSPKKWkYKBmqpISjam3R3QRO+89ua94x5niPdnYwsnOlr2YmBAGjyckPnstIUXxLrxzS+jcae1J02utpo29X2FOec4TVC8gUqHgcYsiwYi8sDryDHrPYXMX0z+sgqZBpN5YJwdy9RWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826347; c=relaxed/simple;
	bh=6xJuV0M9WcHuZZYEQL17O8gCNpAB0DNVwIujl5gqzy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b38AxRg8CUKg+9YH6kGd02bHnPh0fS2BsM3Yu7CZ77p+tCgUEnFdMCedpcTc0jIZFbD2+hXT3F/fndmDZ4Bwm0H0E+RUKHJ1msuIIOTbgEhSlN5C7HD0U/AarDoD5F2zdtuyDfwonslTTN+ANpiGlGHQ59R4378JovSk30baqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FbFg7oiv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 361708DB;
	Fri,  9 May 2025 23:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746826331;
	bh=6xJuV0M9WcHuZZYEQL17O8gCNpAB0DNVwIujl5gqzy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbFg7oivtUe3I0EKio8N3zwdNjeiM0ferVBax+ubR2IgNNdDqXrcXL3pZialsscht
	 FFJvYIy2noX9xf013/kYLXpoe4FO251FoVuaZkfRz59VjJO6eikoMwJj7pI7K/lizL
	 8WwsuL5+Ra8d1SztZCARvcfMTZFFyeFLhjHOI3Xo=
Date: Fri, 9 May 2025 23:32:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 13/13] media: mt9m114: Add ACPI enumeration support
Message-ID: <20250509213215.GG19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-14-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-14-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:34PM +0200, Hans de Goede wrote:
> Add support for the mt9m114 sensor being enumerated through ACPI
> using the INT33F0 HID as found on the Asus T100TA.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9m114.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index eba8232444c9..08e4d7ebcbd1 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2556,11 +2556,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
>  
> +static const struct acpi_device_id mt9m114_acpi_ids[] = {
> +	{ "INT33F0" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
> +
>  static struct i2c_driver mt9m114_driver = {
>  	.driver = {
>  		.name	= "mt9m114",
>  		.pm	= &mt9m114_pm_ops,
>  		.of_match_table = mt9m114_of_ids,
> +		.acpi_match_table = mt9m114_acpi_ids,
>  	},
>  	.probe		= mt9m114_probe,
>  	.remove		= mt9m114_remove,

-- 
Regards,

Laurent Pinchart

