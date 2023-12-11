Return-Path: <linux-media+bounces-2138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E070080D4E5
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 19:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97F182819A2
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1444F20F;
	Mon, 11 Dec 2023 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gztcOBGi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C90D0;
	Mon, 11 Dec 2023 10:01:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DCAF842;
	Mon, 11 Dec 2023 19:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702317652;
	bh=KfBFTuoez1m2Nh+nHRrGKhXBBSbuBYj7whGffhCDbqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gztcOBGiahkrIFqiqGi1mNTmo+IQKDR/6bd4WEURyXUW33Ik13FwE1sNl6hsNGU/S
	 umk+TG54fpvXvZNCc1syCE3TWBqX/8uEuKHaAlOwt/dKN0WECVMSgQpgPpxAF84Fth
	 J6dcC7H9ksBLqfliGgSpaZM/4Rk5SoO2HRS+dwsk=
Date: Mon, 11 Dec 2023 20:01:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 02/19] media: i2c: ov4689: Fix typo in a comment
Message-ID: <20231211180142.GA27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-3-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-3-mike.rudenko@gmail.com>

On Mon, Dec 11, 2023 at 08:50:05PM +0300, Mikhail Rudenko wrote:
> Fix a spelling error in a comment.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Starting with the easy one,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov4689.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index ff5213862974..53dcfc8685d4 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -692,7 +692,7 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	switch (ctrl->id) {
>  	case V4L2_CID_EXPOSURE:
> -		/* 4 least significant bits of expsoure are fractional part */
> +		/* 4 least significant bits of exposure are fractional part */
>  		ret = ov4689_write_reg(ov4689->client, OV4689_REG_EXPOSURE,
>  				       OV4689_REG_VALUE_24BIT, ctrl->val << 4);
>  		break;

-- 
Regards,

Laurent Pinchart

