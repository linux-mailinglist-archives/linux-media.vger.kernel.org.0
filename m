Return-Path: <linux-media+bounces-12761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2F9009BB
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 17:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F38287A78
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C4199EAC;
	Fri,  7 Jun 2024 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DkptC5or"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C031198E86;
	Fri,  7 Jun 2024 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717775848; cv=none; b=oWsOMCfGJ1a7Imx9kXMpaPHy8BmWWABG1VqB7Yp9NFnqxfvumRlWus5/GdRYA4BgZoVduqABGC7TCWb+LEAl4mrBm2xRpo4RUOeFmct/GxLj9eVJvmadk23NvVgA9tVk7JPrSTgP7tsDfVW3M8lCsOQEHRRKwCnze9fl6BQuKSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717775848; c=relaxed/simple;
	bh=XB/qC7jM5fZOLA6Lr3Z/5B9poMffcOVNytBHe974sqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmOqDV5P0FLJXs8wXim5OMKYIRhrgocVpPAUnu03aNEKDj56uUsfytfaPgx8TDHDfNjKx6y0n+fqbfu/p3yimX8tynYW3PvWT6Mt4c2JkURP0gjAbax8p68dO3zIDsoOP8sCsSbTQ1FCs4BVM313dh83+rxFuYzuRstlQetdNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DkptC5or; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12D56BD1;
	Fri,  7 Jun 2024 17:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717775834;
	bh=XB/qC7jM5fZOLA6Lr3Z/5B9poMffcOVNytBHe974sqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkptC5orh+htsaE+i5VvzbUkQR3RobnM/ZqqstB90vwAwJchFFUtAaeI27Zq0F+/1
	 9TDn52yumhZl0GJcSzegtL0kYsD/wOFpOClj+Nyhw/r+5a046RVf/JmYC07AsI39AQ
	 tq+++MqY6vh6Oe7seifFsiC6JxL7ylXrXYxVeBis=
Date: Fri, 7 Jun 2024 18:57:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: i2c: imx219: fix msr access command sequence
Message-ID: <20240607155704.GB1242@pendragon.ideasonboard.com>
References: <20240607-trimmer-pummel-b452ed15e103@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240607-trimmer-pummel-b452ed15e103@spud>

Hi Conor,

Thank you for the patch.

On Fri, Jun 07, 2024 at 04:50:23PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It was reported to me that the imx219 didn't work on one of our
> development kits partly because the access sequence is incorrect.
> The datasheet I could find [1] for this camera has the access sequence:
> Seq. No. Address (Hex) data
> 1        30EB          05
> 2        30EB          0C
> 3        300A          FF
> 4        300B          FF
> 5        30EB          05
> 6        30EB          09
> 
> but the driver swaps the first two elements. Laurent pointed out on IRC
> that the original code used the correct sequence for 1920x1080 but the
> current sequence for 3280x2464 and 1640x1232. During refactoring of the
> init sequence the current order was used for all formats.
> 
> Switch to using the documented sequence.
> 
> Link: https://www.opensourceinstruments.com/Electronics/Data/IMX219PQ.pdf [1]
> Fixes: 8508455961d5 ("media: i2c: imx219: Split common registers from mode tables")
> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

This looks reasonable, based on the above link.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Dave, could you check the impact on the Raspberry Pi kernel ? It seems
to be shipping the incorrect sequence unconditionally.

Any information about what the 12 undocumented MSRs that are programmed
by the driver do would be appreciated too ;-)

> ---
> I got the report of this third hand, I don't have a device and can't
> test this. I do wonder why the RPis get away with the sequence that
> seemingly doesn't work for the guy that reported this to me. My theory
> is either that they noticed the sequence was wrong while adding some
> other MSR access that is needed on this board while either cross
> checking the values written or because the other MSR accesses didn't
> take effect.
> 
> CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: Adam Ford <aford173@gmail.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Andrey Konovalov <andrey.konovalov@linaro.org>
> CC: linux-media@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 51ebf5453fce..e78a80b2bb2e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -162,8 +162,8 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>  	{ IMX219_REG_MODE_SELECT, 0x00 },	/* Mode Select */
>  
>  	/* To Access Addresses 3000-5fff, send the following commands */
> -	{ CCI_REG8(0x30eb), 0x0c },
>  	{ CCI_REG8(0x30eb), 0x05 },
> +	{ CCI_REG8(0x30eb), 0x0c },
>  	{ CCI_REG8(0x300a), 0xff },
>  	{ CCI_REG8(0x300b), 0xff },
>  	{ CCI_REG8(0x30eb), 0x05 },

-- 
Regards,

Laurent Pinchart

