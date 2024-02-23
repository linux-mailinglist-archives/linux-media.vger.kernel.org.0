Return-Path: <linux-media+bounces-5792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE8861262
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45A71F243B5
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B747E792;
	Fri, 23 Feb 2024 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TUBGDKJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822327E579
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708694053; cv=none; b=XVA1anPEp+EDH8FnoNzlB+VJPXVLIfdiWYteh7YrSSEjPmPVJj7c3fP8qmfjA69DQPr/K4IRNyWJCtI9ZidNbTSQPB8uufBuoJOOie0kl9/vyA4+y7pmY0aEdeuf15KL7jhzAsEiAPzVtTDDF6QCxhx2KrZfskG5enNiWfqZh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708694053; c=relaxed/simple;
	bh=m/hv8vcMG2r1EtKCOAm2EFaNdy+x4BoZSwU9yEVrxBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjwZsehqI7SUozjJ1J2yCjBzxVdYCkVBrcX1LT9muqMObwVBhrllv3d3aZjdQ54G7vG5xq0M78Gx4LZXuPY9/8EMz31pbSaPq9bzGaxtCL2oWesGJlAg3hy96wysDrAJUS6FpY+gnaZs63cpJDy8xLsLC30bJ4EW8hu/WtrXMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TUBGDKJ4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C84832E7;
	Fri, 23 Feb 2024 14:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708694040;
	bh=m/hv8vcMG2r1EtKCOAm2EFaNdy+x4BoZSwU9yEVrxBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUBGDKJ4nfkayB/n8CA9XiPMK3KonhfoKcwKP5DcazCSDcBh+m8czu4KpXyNje8DP
	 eouDaYI+rKoAriJsZLWd29Xqlf2h94VSgXQdAfxZnSo5WHPHlY1uPqzFPW4sk3dfW0
	 ThcVfE4t6n+31C7aJ+JP/eyO0ZrftgKVm7pyVhHo=
Date: Fri, 23 Feb 2024 15:14:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/5] media: nxp: imx8-isi: Convert to platform remove
 callback returning void
Message-ID: <20240223131412.GW31348@pendragon.ideasonboard.com>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
 <2ccfcae7bab286651fcf6deff988e23c5113ac22.1708692946.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ccfcae7bab286651fcf6deff988e23c5113ac22.1708692946.git.u.kleine-koenig@pengutronix.de>

Hi Uwe,

Thank you for the patch.

On Fri, Feb 23, 2024 at 01:59:06PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index f73facb97dc5..c2013995049c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -506,7 +506,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int mxc_isi_remove(struct platform_device *pdev)
> +static void mxc_isi_remove(struct platform_device *pdev)
>  {
>  	struct mxc_isi_dev *isi = platform_get_drvdata(pdev);
>  	unsigned int i;
> @@ -523,8 +523,6 @@ static int mxc_isi_remove(struct platform_device *pdev)
>  	mxc_isi_v4l2_cleanup(isi);
>  
>  	pm_runtime_disable(isi->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {
> @@ -537,7 +535,7 @@ MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
>  
>  static struct platform_driver mxc_isi_driver = {
>  	.probe		= mxc_isi_probe,
> -	.remove		= mxc_isi_remove,
> +	.remove_new	= mxc_isi_remove,
>  	.driver = {
>  		.of_match_table = mxc_isi_of_match,
>  		.name		= MXC_ISI_DRIVER_NAME,

-- 
Regards,

Laurent Pinchart

