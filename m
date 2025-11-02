Return-Path: <linux-media+bounces-46138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A94C28D5A
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10C01890A87
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B67C202F9C;
	Sun,  2 Nov 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A30COFrS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309BEEBA;
	Sun,  2 Nov 2025 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762079453; cv=none; b=jM4eNN/vDvjV4aO/Z9GqzwrKrZCGjgqPbvucjdg5Eyk+bRSOL9ZnIm40i5FfZtNWGLyo3f+6dOZKqEirC0vCizeFnmWgf5C65dnol/LNi5SoMuaqft0n01ZB50XgCW4F7O/qgUpLQF+N83cus3iUFRQahsMuBntfEQgAFMRV8sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762079453; c=relaxed/simple;
	bh=/eTUWNLEuW15TNhOpvTGamGJwqGMonDuLgwNQnPI66A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br6Aflf/5N/E1xYzx7zU9KaPr6lQKh/X/Bt1SOSvog12OM9SAw3Hrae8Um/xOYkVOVmDOhR937isNyGukrtPqPF9IjeHBzqkuQy9X5xUPT2bkPSJr7OJqSYCnK6Qvw5AP1BSvlUnQy7B4yG35Rx9f/1EfsNc/BlxbBMX6/KK+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A30COFrS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0F25B3;
	Sun,  2 Nov 2025 11:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762079337;
	bh=/eTUWNLEuW15TNhOpvTGamGJwqGMonDuLgwNQnPI66A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A30COFrSpocPoKE55eSER1Vs4wcXxJ/AcLKQwG4k9OvMPlYiiU3d+uzGdJa7v3PMN
	 XoSgLTxHXtODdhTxDJesS/V8mjZL+pbQT1AKxX/N2AaKcIUenRCDft56wsUxVelCoY
	 dRoqwEsRKINYa/uL2SpAsgHQeAT8nXfbpQUAgbas=
Date: Sun, 2 Nov 2025 11:30:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 03/13] media: i2c: ov5647: Correct minimum VBLANK value
Message-ID: <j455sc3wtbk36h6klwslvj4wtp5d2juf536a2wddsxi4vymmie@r2zuyksljmup>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-3-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-3-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:14PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> Trial and error reveals that the minimum vblank value appears to be 24

I can only trust your trial and errors here!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> (the OV5647 data sheet does not give any clues). This fixes streaming
> lock-ups in full resolution mode.
>
> Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 4fed655f5a11c38e76d1ccc9ae9155cf945684ab..dfe36116e6d3936aa0568f172c79ad4dad21f8c2 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -73,7 +73,7 @@
>  #define OV5647_PIXEL_ARRAY_WIDTH	2592U
>  #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
>
> -#define OV5647_VBLANK_MIN		4
> +#define OV5647_VBLANK_MIN		24
>  #define OV5647_VTS_MAX			32767
>
>  #define OV5647_EXPOSURE_MIN		4
>
> --
> 2.51.0
>
>

