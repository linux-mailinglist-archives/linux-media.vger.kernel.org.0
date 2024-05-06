Return-Path: <linux-media+bounces-10917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9808BD448
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 20:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D51D1F24B1F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677DF158856;
	Mon,  6 May 2024 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q775u8SO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F815534E;
	Mon,  6 May 2024 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715018488; cv=none; b=Bw+/0MEmTfvkRHIfUIhgf6vrMsN4LGN5ESajQXnVWXv9G9fpV/2UiJwNEPJFroPzFTgooSKYgukfes4o5vrrvHulP/kowjbR3Bjm+C7S6nu36pjhb9W4lak6nOvDmQmSVZsymhMZ3tTOjT9YH93bg7TE8RiUJpWznqCACfCy2l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715018488; c=relaxed/simple;
	bh=fH7BBWiU0gyegoCGKrDec9mhUjeyWkX6bisz1Hls3Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT7TxENUKchTqjboJJ4rNIRKYaHUu1jC938rET0IT6DNHrMNxVezW8h9h6i25SYH2w0wXQ36UP17x5Prk5tzuN+7anIivHFmTvUrui0z4b9Ho0OEN3ZZxqyJOU3KdxtyKOLhrTMw55vSzQ2VRTJG4skfeimZVSNa0kQ9EGz/Iz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q775u8SO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F20C114D;
	Mon,  6 May 2024 20:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715018484;
	bh=fH7BBWiU0gyegoCGKrDec9mhUjeyWkX6bisz1Hls3Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q775u8SOOGsFUzxugK3stetnFZTtRMgBCwyF34dXPP0Ul+CpRMrc4eAOiL1VC22gI
	 bLxlxnl6b9fvcNOt6UHpqP5gGOd8lC3z0+EUnjt50PhTB4kmaoKbL1hMDXckQWuZ/2
	 ORYnT+cEZDucrovwsXS3+hDZYj4o5xY2ntykVi+A=
Date: Mon, 6 May 2024 21:01:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/3] media: bcm2835-unicam: Do not print error when irq
 not found
Message-ID: <20240506180118.GF29108@pendragon.ideasonboard.com>
References: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
 <20240430-fix-broad-v1-2-cf3b81bf97ff@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430-fix-broad-v1-2-cf3b81bf97ff@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 07:51:27AM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error for us.
> 
> Fixes cocci:
> drivers/media/platform/broadcom/bcm2835-unicam.c:2664:2-9: line 2664 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 2a3a27ac70ba..b2b23d24da19 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2661,7 +2661,6 @@ static int unicam_probe(struct platform_device *pdev)
>  
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "No IRQ resource\n");
>  		if (ret != -EPROBE_DEFER)
>  			ret = -EINVAL;
>  		goto err_unicam_put;

-- 
Regards,

Laurent Pinchart

