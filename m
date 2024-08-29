Return-Path: <linux-media+bounces-17133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845296451D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D27928A9C5
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A251AD3E4;
	Thu, 29 Aug 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ANB8b3DX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E31922F6;
	Thu, 29 Aug 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935216; cv=none; b=KiL1GUfnBSc7XFdKhGMW1BIT3U09TsmvaJjcAdFHgCZ7pg5S/5/MGyl1/GrMkmD6mxfQieN681qrX5V/FY2YoCYs9QVkI5lP++BYL747MUr/RPWhlrJSSangpnnA+oL+O200C3fweBFbdRRdkSzO+EovtOCvg2og0WV1TyVhJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935216; c=relaxed/simple;
	bh=OxyNOWqYblzSsIhBilpGz1H4mBDUCbZxa1dHdXt7J5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVbRI7ZB3M4iSO6FKfKp9+b59jqDioEXHYeSfNZyF9TGHt4lI8XOh48E49AHUqXWJeGdfOZl2aAbHZg9nA2bPXlT6GBrHTlptDs64uzHqGkaL3aHGsBJLj5tzq05WQcsJFQPe2Mo2zztOb2rfBjZunFy9uN/CUx40YZ7SwfHXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ANB8b3DX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74C086AF;
	Thu, 29 Aug 2024 14:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724935144;
	bh=OxyNOWqYblzSsIhBilpGz1H4mBDUCbZxa1dHdXt7J5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANB8b3DXtpOz2L+6pW3HiwbKpsEgpBUHvyFJehxbg0a5AAo8pIdI5xnv9dY+LaevI
	 hlcxihjNXIvCaxOCe2J5cbbj+KVVbTeELz2wKO8oAy5KcTSvNTCv4QGC9Ps2bAu/FU
	 tgTzG1nS7rNWWe+DboMhO2Ty3cHa2jw/20ZtWnE4=
Date: Thu, 29 Aug 2024 15:39:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 2/2] media: i2c: imx290: Remove CHIP_ID reg definition
Message-ID: <20240829123942.GC12951@pendragon.ideasonboard.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-2-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-imx290-avail-v2-2-bd320ac8e8fa@skidata.com>

Hi Benjamin,

Thank you for the patch.

On Wed, Aug 28, 2024 at 08:13:08PM +0200, Benjamin Bara wrote:
> This register is not described in the public available imx290 datasheet.
> Additionally, a read returns '0x07d0' for an imx327lqr and also for an
> imx462, which means it cannot be used to distinguish between those two
> imx290 derivatives.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> introduced in v2
> ---
>  drivers/media/i2c/imx290.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 2a869576600c..48502ba19cdc 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -80,7 +80,6 @@
>  #define IMX290_ADBIT2					CCI_REG8(0x317c)
>  #define IMX290_ADBIT2_10BIT				0x12
>  #define IMX290_ADBIT2_12BIT				0x00
> -#define IMX290_CHIP_ID					CCI_REG16_LE(0x319a)
>  #define IMX290_ADBIT3					CCI_REG8(0x31ec)
>  #define IMX290_ADBIT3_10BIT				0x37
>  #define IMX290_ADBIT3_12BIT				0x0e
> 

-- 
Regards,

Laurent Pinchart

