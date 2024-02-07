Return-Path: <linux-media+bounces-4833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1EB84CF12
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 17:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21667B260D5
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 16:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A209D823C1;
	Wed,  7 Feb 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8KbVzp4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE881AD3;
	Wed,  7 Feb 2024 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707323927; cv=none; b=NjkzqpIQUcVhFr4dS9TJo4JRLdDlLSp7CK/aZD/fzlHyyuMjp5Eq2BXDlbtIUawJ+UyZf56jTNDNEp36X+6v2fhgDAgK+/rmknz4MTriR8UkikmeEUBW9Qy99ey/TGCX4m8ir1DtGU8TweH8nSI8r/EfCE+yCBvgr/njJD8LeEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707323927; c=relaxed/simple;
	bh=vUH9fJdKzCR269rzrRn8hS7WOBjHzQJYZAxiWJSjbkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwFBVzReBavsCQ7S24Xb0O+lkaQtwearnqLKGoGnSuMGtxX1/H9hlVwStty9xRYH5UCS/RbWF84J19BiIb+pNHEoQ1oRCkWUdCqJz8nrHvMgPjR7r4Xj6pJg5MWCE6+zxJhLkdTyzG3n5ZPh2iqiDA2CWawCwjVq2DnNsEDgR48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U8KbVzp4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD36A975;
	Wed,  7 Feb 2024 17:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707323839;
	bh=vUH9fJdKzCR269rzrRn8hS7WOBjHzQJYZAxiWJSjbkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8KbVzp48PEmn0A/mFJ0tJeoKou6CA0OS2C2n47QibleYJMbJDKxcLk5sltbEaztQ
	 vjd/b3p6PiMeQj1XI5uW2itgnNYzKdfD96J/z9Q08UOa5HmALU/OxOAiXbJarTrNc4
	 5VEmyMdNXXNWZRL0fq9636SFjeBRpmemtpL5+F38=
Date: Wed, 7 Feb 2024 18:38:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/4] media: platform: rzg2l-cru: rzg2l-csi2:
 Switch to RUNTIME_PM_OPS()
Message-ID: <20240207163844.GA7331@pendragon.ideasonboard.com>
References: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
 <20240130164115.116613-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240130164115.116613-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jan 30, 2024 at 04:41:12PM +0000, Biju Das wrote:
> Replace the old SET_RUNTIME_PM_OPS() helpers with its modern alternative
> RUNTIME_PM_OPS(). The usage of pm_ptr and RUNTIME_PM_OPS() allows the
> compiler to see where it's used but still drop the dead code. After this
> we can get rid of the unnecessary '__maybe_unused' annotations on PM
> functions.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Updated commit description.
>  * Aligned RUNTIME_PM_OPS() macro.
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index d20f4eff93a4..e00d9379dd2c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -834,7 +834,7 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> -static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> +static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
>  {
>  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
>  
> @@ -843,7 +843,7 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
> +static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
>  {
>  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
>  
> @@ -851,7 +851,8 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
> -	SET_RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend, rzg2l_csi2_pm_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
> +		       rzg2l_csi2_pm_runtime_resume, NULL)
>  };
>  
>  static const struct of_device_id rzg2l_csi2_of_table[] = {
> @@ -865,7 +866,7 @@ static struct platform_driver rzg2l_csi2_pdrv = {
>  	.driver	= {
>  		.name = "rzg2l-csi2",
>  		.of_match_table = rzg2l_csi2_of_table,
> -		.pm = &rzg2l_csi2_pm_ops,
> +		.pm = pm_ptr(&rzg2l_csi2_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

