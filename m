Return-Path: <linux-media+bounces-15723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5528945FA1
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 16:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77A1B2194F
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 14:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8727C200114;
	Fri,  2 Aug 2024 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o+zTvCTh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2821F94C;
	Fri,  2 Aug 2024 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722610083; cv=none; b=WMnJv1sH3HW7zAj+yoOnB7FN3kLJG5N5UnQrj4ULBA2vvqpKNU9y54GUnLLofRdeiJuXvVn+wRILb5IY6xUs32UG4qLmyx8DLyGAsH+tTW7zeJnG9sv6cXCQRHwiFdi0gtCei+5nx8/JO3bftRH59XZWMKaKlkK+9emtZkS3uag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722610083; c=relaxed/simple;
	bh=U1tKOPpv7yFKP7b3rLh3eHz+X6tDcteyu+8BXPCE+xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvxQMiGXgvuDQLPUXV+R+NoYiKb8ohspQB2EyLkEWyzCtb0QVmCKVyaYmFC5ZgECA3by/1GAV0VxxTFMjlUP9ZhxuTsCDPUAO7c1IoEgaIEt3Q5rSXRZJIvX3DkalRFJmmKAI63WhqRqWWzxV+tcemn/19c4C0RpQEEo+vxvpYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o+zTvCTh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1865524;
	Fri,  2 Aug 2024 16:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722610031;
	bh=U1tKOPpv7yFKP7b3rLh3eHz+X6tDcteyu+8BXPCE+xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+zTvCThVQZ9Hi6GjKG+JasI+Ioh/FkQt6cFjjUmFtP6UhBcUU+CrNDiFMTgMV4Ac
	 ceLEmXj0zpsYoViHAkuqdDwxmGg5mYXniubTIXZ9yWeefHEgTwE7VAnZXiXDSbjtMI
	 xdamTL7SuwGXND27/h8m7gFvdNvx9uDz1nVjr+zg=
Date: Fri, 2 Aug 2024 17:47:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Message-ID: <20240802144739.GC25708@pendragon.ideasonboard.com>
References: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Wed, Jul 31, 2024 at 05:49:32PM +0100, Biju Das wrote:
> The rzg2l-csi2 driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
> 
> Fixes: 51e8415e39a9 ("media: platform: Add Renesas RZ/G2L MIPI CSI-2 receiver driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e68fcdaea207..c7fdee347ac8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -865,6 +865,7 @@ static const struct of_device_id rzg2l_csi2_of_table[] = {
>  	{ .compatible = "renesas,rzg2l-csi2", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
>  
>  static struct platform_driver rzg2l_csi2_pdrv = {
>  	.remove_new = rzg2l_csi2_remove,

-- 
Regards,

Laurent Pinchart

