Return-Path: <linux-media+bounces-17143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8FA964721
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C782826D3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6281AED38;
	Thu, 29 Aug 2024 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dsnGSW6V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF91AE84A;
	Thu, 29 Aug 2024 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939231; cv=none; b=WW+gxqPpJhrG30H/eTE1Ch+d3SCDKrKu4vfRBiR4MfmKvGRDI5yHdmVCKn7wa6e9otmRYzMV9JNTAF2PuDRKHSdCzehBj+FdYxFlQ8WhqavykeAoOj0lwKbUk3edVkiLoSXCOp39FnLEYE/fhqiddt7eHrl75Xp01OdEH3/M3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939231; c=relaxed/simple;
	bh=ch5qMAZTLPgkMPDePJgwDl6HhqaKKyod5hd9E53EcbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlQTi+OriL8dvkWr7HeRfFDogujYSv8aOhZjFRWJ0DkOM71zJxfCpAMI3FE0beQVpjIBg/2DtbqK8ZKEd2/x2W3ok/upQYWMgGPBRaIaI/a2lDgcdULOh6Gim8qjge3XyuzBlxxA1hrZ7CjWIuhSLlfFmopsk9nJuT5teqXsJoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dsnGSW6V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22E0F226;
	Thu, 29 Aug 2024 15:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724939160;
	bh=ch5qMAZTLPgkMPDePJgwDl6HhqaKKyod5hd9E53EcbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsnGSW6V0p9p/yRi0/42hHZhIRHjoOz5SRCVWCgcxTbB7SPW/oTm2GtnnMfnAj4oX
	 eE/c/j0ayKDEIBnd/KIQS8C1J7aZVPIAQpbJmMQWCTSG+zcLuHqJ3cv8IDdZA5jEp5
	 JwhKdAxV0CU77XxHLWztW5HdrvoLFP+KqUGLGH1Y=
Date: Thu, 29 Aug 2024 16:46:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sakari.ailus@linux.intel.com, jacopo@jmondi.org, mchehab@kernel.org,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH -next 2/2] media: i2c: mt9v111: Drop redundant comma
Message-ID: <20240829134638.GE12951@pendragon.ideasonboard.com>
References: <20240829125203.539977-1-liaochen4@huawei.com>
 <20240829125203.539977-3-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240829125203.539977-3-liaochen4@huawei.com>

Hi Liao,

Thank you for the patch.

On Thu, Aug 29, 2024 at 12:52:03PM +0000, Liao Chen wrote:
> Drop the redundant comma from mt9v111_of_match array to make the code
> clean.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9v111.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index b6a2623798c5..723fe138e7bc 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1263,7 +1263,7 @@ static void mt9v111_remove(struct i2c_client *client)
>  
>  static const struct of_device_id mt9v111_of_match[] = {
>  	{ .compatible = "aptina,mt9v111", },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>  

-- 
Regards,

Laurent Pinchart

