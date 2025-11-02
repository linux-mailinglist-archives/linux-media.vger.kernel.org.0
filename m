Return-Path: <linux-media+bounces-46137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C135DC28D51
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 410C93475D4
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1414626AAAB;
	Sun,  2 Nov 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XB1F/Yss"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86571B87C0;
	Sun,  2 Nov 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762079375; cv=none; b=gIUeIfmyMoEZjIqGdMcD1FT7lXozsgdBhMCuDAK2DK3XvXFwBJEaoloxPXSq5tjQIFMmSsYFai5aeOOufCGYG9hXXpvpYLioxRMDbtoJdeTBti3Q+Zdqv0Eg025rsT7b6OwEVNaSq7NqYkkGpbCZyVVQMMXlD+ZyfiHwt9nZkOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762079375; c=relaxed/simple;
	bh=+yk2oRXZTsQCvHpIa6nsPiTDnf7B5ZiLRORXFkdBQUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MK0dcoanECxqJ9pjGz72q/0LR/uEmydxcsBSQqlpyalKMicPVkGWP+32xB9ks0/1s0IIxZToTeOVv/Ab6QUT5jpbHwsY+4wu7iwo5sGYcxt4tvqPkx386ajWfkazhxaZAzas175sJXynN2hVo5q82DBAn0XnfrcH7cOWZu6IBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XB1F/Yss; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C27DB3;
	Sun,  2 Nov 2025 11:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762079259;
	bh=+yk2oRXZTsQCvHpIa6nsPiTDnf7B5ZiLRORXFkdBQUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XB1F/YssccMfXcs6phqzqMQ2H+IfZdsT3ixye18gI1aDaO5FdfB3gvQoDF98nVbPE
	 C77cR2mcJLf/MXQFSMBX0WsA1t2dJz1yHwyMBtyQ/OxTwo4S+GuJUdBcDzkhM24yG9
	 oeF1Xgk+42lXju+rVbRbrU+3fXiooLTNjWKL7Ho4=
Date: Sun, 2 Nov 2025 11:29:27 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 02/13] media: i2c: ov5647: Correct pixel array offset
Message-ID: <qoqzelkspgqg5nuwyklsukhxq56noa5hnecp3f6r4xu2y3tuhy@n2to2wxwldqp>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-2-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-2-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:13PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> The top offset in the pixel array is actually 6 (see page 3-1 of the
> OV5647 data sheet).
>
> Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

The patch is correct and match the datasheet, but I wonder what the
implications of having a wrong top were..

I see the full 2592x1944 mode declaring 1944 lines but, as the top row
was set to 16, it means the mode should read 10 lines past the end of
the sensor's pixel array..

Anyway, on the patch
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 985a8e81529d2f88cb38ccb8c94f8605026a28a9..4fed655f5a11c38e76d1ccc9ae9155cf945684ab 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -69,7 +69,7 @@
>  #define OV5647_NATIVE_HEIGHT		1956U
>
>  #define OV5647_PIXEL_ARRAY_LEFT		16U
> -#define OV5647_PIXEL_ARRAY_TOP		16U
> +#define OV5647_PIXEL_ARRAY_TOP		6U
>  #define OV5647_PIXEL_ARRAY_WIDTH	2592U
>  #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
>
>
> --
> 2.51.0
>
>

