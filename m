Return-Path: <linux-media+bounces-37442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89185B00F97
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566225479DE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3822F1994;
	Thu, 10 Jul 2025 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oBDHUfhC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A52DE202;
	Thu, 10 Jul 2025 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189779; cv=none; b=ZAgGuWSAsyvQQOmXtYdeRJthz2PJS0SQonJoyvR2zohMWDrj48DpVALqKUFFZwVniluVfTeAkV+4ZlXtcZAPA2DhBQepV5t03Snm41v56mr6m1DxaOsw8BOWvp1oVlM5w6AHj9pxiOJxB7CRMMfQTvxEEeYPVaOhbMFewHs6cDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189779; c=relaxed/simple;
	bh=CSZO+2j9vv6XeerJgOD1fAyZ5SS0WvDw92dn4Vxan94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kS4+9VFLrvxivOcjgYcgnlnt9ERyi6VALfDUPnvxLZl433gtOUk1UrYSSQri7Csq0ngBq1EC3kHKMmxti46VRFk/TGwS2r40TeEIZa8GQOw0HncHMvNZ50mf/M4O41YAHMqXig/Dxlce7qHTI9KzDoE3jMhkgXHztfz2mGIs3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oBDHUfhC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 387FB229;
	Fri, 11 Jul 2025 01:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752189747;
	bh=CSZO+2j9vv6XeerJgOD1fAyZ5SS0WvDw92dn4Vxan94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBDHUfhCKtq2dBjHGvKZrVx4Gf8rm8KUsn6jsrQndTZCIks58/MEwQpV0tkLdSk4U
	 2cQzloNv/qz27PTJUZvc/LPxVnp0g18ZBaK5uMaw8oxNy05gj1LInXRJHpGcizdm67
	 5D8t9+M+JqRVJAoKAZidZ1l+BQJKzXqARmU2vlEc=
Date: Fri, 11 Jul 2025 02:22:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] media: renesas: vsp1: Convert to
 SYSTEM_SLEEP/RUNTIME_PM_OPS()
Message-ID: <20250710232226.GE27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <7de021d90e524ef740d6d59a899fb9a34fbf5247.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7de021d90e524ef740d6d59a899fb9a34fbf5247.1752088108.git.geert+renesas@glider.be>

Hi Geert,

Thank you for the patch.

On Wed, Jul 09, 2025 at 09:16:11PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas VSP1 Video Processing Engine driver from
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() to
> SYSTEM_SLEEP_PM_OPS(), RUNTIME_PM_OPS(), and pm_ptr().  This lets us
> drop the __maybe_unused annotations from its various suspend and resume
> callbacks, and reduces kernel size in case CONFIG_PM is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index b8d06e88c4757317..6c64657fc4f3366f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -618,7 +618,7 @@ void vsp1_device_put(struct vsp1_device *vsp1)
>   * Power Management
>   */
>  
> -static int __maybe_unused vsp1_pm_suspend(struct device *dev)
> +static int vsp1_pm_suspend(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  
> @@ -634,7 +634,7 @@ static int __maybe_unused vsp1_pm_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused vsp1_pm_resume(struct device *dev)
> +static int vsp1_pm_resume(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  
> @@ -650,7 +650,7 @@ static int __maybe_unused vsp1_pm_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
> +static int vsp1_pm_runtime_suspend(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  
> @@ -660,7 +660,7 @@ static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
> +static int vsp1_pm_runtime_resume(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  	int ret;
> @@ -693,8 +693,8 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops vsp1_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> -	SET_RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> +	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1042,7 +1042,7 @@ static struct platform_driver vsp1_platform_driver = {
>  	.remove		= vsp1_remove,
>  	.driver		= {
>  		.name	= "vsp1",
> -		.pm	= &vsp1_pm_ops,
> +		.pm	= pm_ptr(&vsp1_pm_ops),
>  		.of_match_table = vsp1_of_match,
>  	},
>  };

-- 
Regards,

Laurent Pinchart

