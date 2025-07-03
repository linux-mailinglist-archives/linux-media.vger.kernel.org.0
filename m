Return-Path: <linux-media+bounces-36737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D41AF83B5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968B27A2C4D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A202BF3F3;
	Thu,  3 Jul 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a7xY2Qrm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66225A333;
	Thu,  3 Jul 2025 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582637; cv=none; b=to7+ttmp1eS1McBl33v2CMurL75jqbdf7IUyx5uvTLelKufAMjV6BzilVG9ZaVcXhLYCp+jPm0izmNpxPMUsaUrPUhX4N3jLwj1bcmBqR/0Opmwz00LPA9IdMfLOpEI9dR0ppLIVZFPv/GU/BNVVmJKSbwj5+B5NDp0I5Ezjiko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582637; c=relaxed/simple;
	bh=BV6x0XhOE6q8lL8JVV7l23237J2COOxZMAhfaPHW4C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrpTiak3v5Aca5yvc8tSO4t84a6cXbgTzHCiYjLLrdXlSivdMhR11eQxKEcnZdkfeLg2YCfedBOWs/GnhbjJSO6jraIXwMobBE6n8CAUM1m4tjLe25zEXx/E33WyBGWmrqfTxotHNt59HP29duKC9OCQ5oVZFldh+ThMCQStSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a7xY2Qrm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3A39A667;
	Fri,  4 Jul 2025 00:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582609;
	bh=BV6x0XhOE6q8lL8JVV7l23237J2COOxZMAhfaPHW4C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7xY2QrmJzXS/niIYJ7fKpaJdy58HLSUiUIFpVVLBgZ6UB9/4aKCG+82UF0FKHNre
	 fKs7neLE4oBq+4Gg7jy2WZwSqSSCkJYpgLrP5tB3IbQk3uv+e46ssMwuY2GULlnMWc
	 o140uUWge3GYONkG64WiB9uIkmk3dg9FCyFBuUTg=
Date: Fri, 4 Jul 2025 01:43:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] media: adv7180: Add missing lock in suspend
 callback
Message-ID: <20250703224326.GD3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 03, 2025 at 10:52:14PM +0200, Niklas Söderlund wrote:
> The adv7180_set_power() utilizes adv7180_write() which in turn requires
> the state mutex to be held, take it before calling adv7180_set_power()
> to avoid tripping a lockdep_assert_held().
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/i2c/adv7180.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 2519bc53333c..0c5511a7667d 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1565,6 +1565,8 @@ static int adv7180_suspend(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct adv7180_state *state = to_state(sd);
>  
> +	guard(mutex)(&state->mutex);
> +
>  	return adv7180_set_power(state, false);

Doesn't adv7180_resume() suffer from the same issue ? And how about
adv7180_set_pad_format() ?

>  }
>  

-- 
Regards,

Laurent Pinchart

