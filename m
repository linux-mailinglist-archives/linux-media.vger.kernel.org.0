Return-Path: <linux-media+bounces-33366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEDAC3E24
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025061887A20
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0EC1F5838;
	Mon, 26 May 2025 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZOeC46C+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448C72601;
	Mon, 26 May 2025 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256720; cv=none; b=fJmggADiiohUWFNcxn4dH7SvjrNil/qzRcC4KJX5LmBk56qw1gvfh+y/A64U1YcJhgUj2iNfa+9MugI06KuUIZjDWjjGNqHhuq48ob17/XdCczu6+C1an4vnpwlcMl9PzwfI7fka09XBgLWv8ppJqdeLzatkCZ7jmY0dQQs7R6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256720; c=relaxed/simple;
	bh=4qDs5n0yaPmkG2mDudh7lP0FGsa0mxIJTg3dfDENfME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPa62Ah2bV0Wq44NQ83sy0mBx+XIqQxo3z1USMurAyzncLH7d+iH9c7AtrhV8bCHtDRXZ/8CMqdnEyGlwNlapJ/zPp+eeCkyiL/B5Szwcw1jAyA3/0XLmYo4YF9PKfvK8mpN+UP+dQLOvtw6eJtkPBImjkorNMuvOOjnQT05RJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZOeC46C+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C81BC7E6;
	Mon, 26 May 2025 12:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748256691;
	bh=4qDs5n0yaPmkG2mDudh7lP0FGsa0mxIJTg3dfDENfME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOeC46C+dwEXXCcE/Olj/n1J867MKvMHJXkaYZ8e4aSuNXGWKxATvyqqmtnRatGaG
	 I1Mc1Ov4EUx0A8kNRDBqmueUzHAo9HTJDzyViLrn4n5YVh0FTp8G06cMLRtcQ+I0K6
	 Ic5+QzByDyGvb69fGp1LuTHdfMBqFHMDvHHGs7go=
Date: Mon, 26 May 2025 12:51:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table
 struct
Message-ID: <20250526105150.GC17743@pendragon.ideasonboard.com>
References: <20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com>

On Mon, May 26, 2025 at 09:52:33AM +0200, Tommaso Merciai wrote:
> Correct the misnamed .data member for the RZ/G2L CRU. Rename
> `rzgl2_cru_info` to `rzg2l_cru_info` to match the intended
> naming convention.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index c2528cb3ba4f..a1ae662b2ec6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -421,7 +421,7 @@ static const u16 rzg2l_cru_regs[] = {
>  	[ICnDMR] = 0x26c,
>  };
>  
> -static const struct rzg2l_cru_info rzgl2_cru_info = {
> +static const struct rzg2l_cru_info rzg2l_cru_info = {
>  	.max_width = 2800,
>  	.max_height = 4095,
>  	.image_conv = ICnMC,
> @@ -440,7 +440,7 @@ static const struct of_device_id rzg2l_cru_of_id_table[] = {
>  	},
>  	{
>  		.compatible = "renesas,rzg2l-cru",
> -		.data = &rzgl2_cru_info,
> +		.data = &rzg2l_cru_info,
>  	},
>  	{ /* sentinel */ }
>  };

-- 
Regards,

Laurent Pinchart

