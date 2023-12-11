Return-Path: <linux-media+bounces-2146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221D80D528
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 19:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DD51F2111C
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0436051018;
	Mon, 11 Dec 2023 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gj4KLWx9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC049D;
	Mon, 11 Dec 2023 10:19:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47C22922;
	Mon, 11 Dec 2023 19:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702318747;
	bh=zoTHZxUmnwmdkG7z8JcGiL4cI1wP6xqkF6COSkVndx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gj4KLWx9dq3EHwfvB1+sKGhomOlOUXyYNynfHbkCJ+wVlbHkXsNiOCrAFVIDi0s6Z
	 kiahmqLlAeEhGsWslsmakYmTKljKrI711ITXGyxoSDptiFqG8GwpmOtWpuOCKdb7k0
	 R2B8WFS/hsW20fn/3GAeLUqqjpquSHCTgikIiuEo=
Date: Mon, 11 Dec 2023 20:19:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 09/19] media: i2c: ov4689: Remove max_fps field from
 struct ov4689_mode
Message-ID: <20231211181958.GH27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-10-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-10-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:12PM +0300, Mikhail Rudenko wrote:
> max_fps field of struct ov4689_mode is unused in this driver, so
> remove it.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov4689.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index ba33b0ced532..9fa06941a0e5 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -60,7 +60,6 @@ struct ov4689_mode {
>  	enum ov4689_mode_id id;
>  	u32 width;
>  	u32 height;
> -	u32 max_fps;
>  	u32 hts_def;
>  	u32 vts_def;
>  	u32 exp_def;
> @@ -237,7 +236,6 @@ static const struct ov4689_mode supported_modes[] = {
>  		.sensor_height = 1536,
>  		.crop_top = 8,
>  		.crop_left = 16,
> -		.max_fps = 30,
>  		.exp_def = 1536,
>  		.hts_def = 4 * 2574,
>  		.vts_def = 1554,

-- 
Regards,

Laurent Pinchart

