Return-Path: <linux-media+bounces-1770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319A8079D0
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 21:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2595282478
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 20:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1A741868;
	Wed,  6 Dec 2023 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pt8MhQ3u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A413135;
	Wed,  6 Dec 2023 12:51:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7702720;
	Wed,  6 Dec 2023 21:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701895848;
	bh=l0ZcHpyWY6UMwv/hikDR8riOCq1MNunta8UDL42xOPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pt8MhQ3u2yXCm1EjjVxWv5Zv/bL8rSKARO3l7kpOwKjkmNtj9aOQmXDHNL8OJNuAC
	 ifKaRvsnm4BZC5RjcQr8zgm6YG8WPbEDJy7NpSPazH1u686mAPUNYdxIbyMdJftgFx
	 nhNkYYUVJnEvzrkcaMGYkmNQrmUkvzsPzG+54/ss=
Date: Wed, 6 Dec 2023 22:51:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com,
	aford173@gmail.com, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: rkisp1: Drop IRQF_SHARED
Message-ID: <20231206205135.GB29417@pendragon.ideasonboard.com>
References: <20231206-rkisp-irq-fix-v2-0-6ba4185eeb1f@ideasonboard.com>
 <20231206-rkisp-irq-fix-v2-1-6ba4185eeb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206-rkisp-irq-fix-v2-1-6ba4185eeb1f@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Dec 06, 2023 at 12:12:28PM +0200, Tomi Valkeinen wrote:
> In all known platforms the ISP has dedicated IRQ lines, but for some
> reason the driver uses IRQF_SHARED.
> 
> Supporting IRQF_SHARED properly requires handling interrupts even when
> our device is disabled, and the driver does not handle this. To avoid
> adding such code, and to be sure the driver won't accidentally be used
> in a platform with shared interrupts, let's drop the IRQF_SHARED flag.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 2b9886fd0800..d4950294b7b9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -573,7 +573,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  		if (irq < 0)
>  			return irq;
>  
> -		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
> +		ret = devm_request_irq(dev, irq, info->isrs[i].isr, 0,
>  				       dev_driver_string(dev), dev);
>  		if (ret) {
>  			dev_err(dev, "request irq failed: %d\n", ret);
> 

-- 
Regards,

Laurent Pinchart

