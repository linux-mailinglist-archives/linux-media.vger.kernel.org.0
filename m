Return-Path: <linux-media+bounces-37306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A2B0046E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F2C5B452C9
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361E614BFA2;
	Thu, 10 Jul 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eY8Zeq5c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D526A0E0;
	Thu, 10 Jul 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155489; cv=none; b=bNftFje0O7KSNO2xJIR5nWC0tk3w2KxMU9KrsR9dbENVLkSQL3r43XdLBcbpOHOXaMLqTsXs4nBakQYh2ob9rOim+5FACeSA2IgQKIShdXT3zMu/+wM/l8rGVT8ZpQ3nPFl5mGZPwulGUO/tSSnmj1wqCaXFCHGRIcISZq/VJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155489; c=relaxed/simple;
	bh=qZse0a+YyR5B1PVbpr4PbQvPVOQDJ2xKQ6ECwtFjmVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVo8p1xqIJ3ZceAZgpsvpq83EKxFYQ7IUfJwo//z6OY00zJK4+7G2WbyGS89IO47wICtyY6Bfabyq4zepJXp+W+OiPEUFqq30OL2HXfvNCIQTiJjG4tkRuPE8v1JVpxS/fZw3HpQwF5EfNnQ+7yd624kizyGom0axGQqTxcWU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eY8Zeq5c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DC987E4;
	Thu, 10 Jul 2025 15:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752155456;
	bh=qZse0a+YyR5B1PVbpr4PbQvPVOQDJ2xKQ6ECwtFjmVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eY8Zeq5c5oP4e8yP5IrEgsmyPVmgw3VsKIEjQrTLWYNBfqqVYFsxsvPY4iorMIxFA
	 1nxW2OlQC+7p4RFNz2YQrM/AUFi/CD20AoZA76M8mMKkot/QYQfeUJ3aT6th9TkOqj
	 LnsXFeAv034FoTTTOHefmhVjD5HtF2iUKZvtP71k=
Date: Thu, 10 Jul 2025 15:51:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] media: renesas: vsp1: Convert to
 SYSTEM_SLEEP/RUNTIME_PM_OPS()
Message-ID: <nywhwtskoumxkgrrzqv333ccgoqf3fcaqrz7wy4oultzhyyfkp@bitsrtxykav4>
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

Hi Geert

On Wed, Jul 09, 2025 at 09:16:11PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas VSP1 Video Processing Engine driver from
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() to
> SYSTEM_SLEEP_PM_OPS(), RUNTIME_PM_OPS(), and pm_ptr().  This lets us
> drop the __maybe_unused annotations from its various suspend and resume
> callbacks, and reduces kernel size in case CONFIG_PM is disabled.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.43.0
>

