Return-Path: <linux-media+bounces-46141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B650C28DCD
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 12:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1082D3B5233
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9FC268688;
	Sun,  2 Nov 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NRmcqafn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6E41E2858;
	Sun,  2 Nov 2025 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762081117; cv=none; b=l5RIcR5vivj5SgqQ/LHT3gNj8e4HHA12Hgegzc5HbSc+nyVHSisHRWiaJkTstiN1/59iZOGG2/YTk77Ujgw9oWbXUgsiGco98gU0ZPw3bJ5DIkIm35khBpCl9HdhePeaI+fsQbW7qc6B1d42qEnGSpYg1DLeSxnUcuR/+wdw3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762081117; c=relaxed/simple;
	bh=aew/h4VxOgs+yx33tXMMjIxjaK3UGZB4L/7TZnoTK10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XS2E/nxL6i5Qp5f0J89bBDVv61YH1K2I58VGo99mS262RG6oeiva2BB/IvuXozd8HssqXKfev3nhnNCN4t6RkDJDvI96tuq9VtrYTRO1iIZlz8eRPLIieSx6h3hjMvOZoCp3LjlzyV4wPMvPeJLxc339ykajL7zk8XYqN+IF/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NRmcqafn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE22BB3;
	Sun,  2 Nov 2025 11:56:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762081002;
	bh=aew/h4VxOgs+yx33tXMMjIxjaK3UGZB4L/7TZnoTK10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRmcqafnP0Gn+sVodLttrO6V0YW8XPT0aR630x3HiRNPg4MuQI5loklvhj/4osyBl
	 maCSealrJ7jnVm2J+9iZZmiqM8S1JYTmtviPqIi/fJwbYWOBu6lDP8yCSTcKPOZg3Y
	 w2tzrxKf2s/kSeSkURjVtfoHPAC8Bovbp5OpLhAI=
Date: Sun, 2 Nov 2025 11:58:30 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 08/13] media: i2c: ov5647: Use
 v4l2_async_register_subdev_sensor for lens binding
Message-ID: <go2qjnab52g77anasw27xwr734lz6mhsmxwlgaus652aptg5ei@zyvtaxtxitkz>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-8-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-8-098413454f5e@ideasonboard.com>

On Tue, Oct 28, 2025 at 12:57:19PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> v4l2_async_register_subdev doesn't bind in lens or flash drivers,
> but v4l2_async_register_subdev_sensor does.
> Switch to using v4l2_async_register_subdev_sensor.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 598764638d518a28c8ac61ea590b996f09ecd45c..3aad3dc9b5cd0c24c07a37e2567e3c61c52e4fc2 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1553,7 +1553,7 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto power_off;
>
> -	ret = v4l2_async_register_subdev(sd);
> +	ret = v4l2_async_register_subdev_sensor(sd);

We're really good at names :)

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	if (ret < 0)
>  		goto power_off;
>
>
> --
> 2.51.0
>

