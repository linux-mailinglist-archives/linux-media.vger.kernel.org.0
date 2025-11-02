Return-Path: <linux-media+bounces-46144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142FC28DF8
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 12:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 089C44E4E3A
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 11:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9131029A300;
	Sun,  2 Nov 2025 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I9AhayFa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F72AF1D;
	Sun,  2 Nov 2025 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762082219; cv=none; b=POrrizO1hM7EOcLfJEG4tzqjSj7by0lgkOEKoadkMJKK78uEhmIGV69i3PoIwXTp0xzIkXDXDAUI+Tu/FNgSzA/+8mNa4cGC0HbeLoYMZ3qHmZm2ihTehKGSQYn7VhyTLigosG+4UmMlp8dndff1BqFkoq0rAY0atoeS1HT3cTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762082219; c=relaxed/simple;
	bh=YHmZcKeWBJQ1DVFENLeNqVFuWjkvn9t61exZ/sPUq6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EokF9vneoW8CLPNnJIVQuef4yEzJ2zhC6NBbs+3tX4BOnDwq2jPgR5f/47i7QuItjLOXhz9ompQSg7aXHu4UxgibsKOTzzAjKrXwn6KMDtrhSLno4mygrvVz/JRVl8AJpgVtrGdTUbI6uUNWqeiVVKSrTNwATnW35PyIkTlDmz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I9AhayFa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BB6C177B;
	Sun,  2 Nov 2025 12:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762082102;
	bh=YHmZcKeWBJQ1DVFENLeNqVFuWjkvn9t61exZ/sPUq6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9AhayFaikfgLI2bDvWDyEDqlJYvNLshAF4ABPIl/NMtRtyFBpifyHQB70Q1GXHra
	 lDvL68gXpZILIkR+zDGuT2MI4qMNOzI1EtRK3tn4ZpcNLZZApI0ml9CAxX3oW+MsoB
	 8ZwBoJ0B0rbeAIRCIIK7QqAzTudlkoDG5yqUecf0=
Date: Sun, 2 Nov 2025 12:16:51 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 12/13] media: i2c: ov5647: Use the same PLL config for
 full, 1080p, and binned modes
Message-ID: <l2a7xmbcjujgprlnyduxgbif7xfyez3kgsoqbg6mjk3bivlsro@p5rpiidtk7kj>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-12-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-12-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:23PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> In order to simplify the driver slightly, use the same PLL
> configuration, and hence pixel rate and link frequency (to be
> added) for the full, 1080p, and binned modes.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index a0aaf83759e089aea727c44b614c6a9f3237586c..be0b96c4372ae0c6d8fc57280b195d6069dd7019 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -252,7 +252,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  };
>
>  static struct regval_list ov5647_1080p30_10bpp[] = {
> -	{0x3036, 0x62},
> +	{0x3036, 0x69},
>  	{0x3821, 0x00},
>  	{0x3820, 0x00},
>  	{0x3612, 0x5b},
> @@ -288,7 +288,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>  };
>
>  static struct regval_list ov5647_2x2binned_10bpp[] = {
> -	{0x3036, 0x62},
> +	{0x3036, 0x69},
>  	{0x3821, 0x01},
>  	{0x3820, 0x41},
>  	{0x3612, 0x59},
> @@ -396,7 +396,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.width		= 1928,
>  			.height		= 1080,
>  		},
> -		.pixel_rate	= 81666700,
> +		.pixel_rate	= 87500000,

I get a value of 87499965, so I guess this is correct approximation

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  		.hts		= 2416,
>  		.vts		= 0x450,
>  		.reg_list	= ov5647_1080p30_10bpp,
> @@ -417,7 +417,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.width		= 2592,
>  			.height		= 1944,
>  		},
> -		.pixel_rate	= 81666700,
> +		.pixel_rate	= 87500000,
>  		.hts		= 1896,
>  		.vts		= 0x59b,
>  		.reg_list	= ov5647_2x2binned_10bpp,
>
> --
> 2.51.0
>

