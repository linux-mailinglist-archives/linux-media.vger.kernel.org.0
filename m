Return-Path: <linux-media+bounces-46143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55515C28DF1
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 12:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4C053AA9A7
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C3527281D;
	Sun,  2 Nov 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H2HBU0jG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D82727F3;
	Sun,  2 Nov 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762081996; cv=none; b=mRoHk9zbeAj7b6bJmW+L4VGaiFD4FXxZj9LiZgO0ziAZhgB3tP4j7FsbQ2yjmnes2COdJPYk9DcUN7dhwicER/Hbsq+hpHA/QbqnvCicrTkPB81DLc8BIHDtq1B/HfsctyLaA/ON4eGbgxmm+w/klxK9pVmgVvfBRJ+g6qJ6bsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762081996; c=relaxed/simple;
	bh=CTzZumIdt3Y2Z/TlJG+uGpWaRv+q3wKsvQqXSHC+Ns4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCdmE/dcjBw49Mouy3SPgXNzIYMnZnVBRUG8NredPhIH8gHnm6r+zGoAidlVuBhLGceLHpTwAZZNkZGzz+6SXQ48PIyt/ywS0qC+rVffd7YybqeBZLJtcdyzqqIG7o6UYPrpaeSpW85+c3OZpIxxiW4I/5eglsg8j1P0fKf13r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H2HBU0jG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4931AA98;
	Sun,  2 Nov 2025 12:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762081881;
	bh=CTzZumIdt3Y2Z/TlJG+uGpWaRv+q3wKsvQqXSHC+Ns4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2HBU0jGvIEH46avUViYqFWXoV9L0FP+sa3WhBWOOupp0b6wSb2d2ypZzN2qPDLWu
	 aX9hd8z9QMyiMYuEBFbyebQTkWW9kCxyE0Ao0ty1t+guBaIqtgcFQp8WJK7rJc/JnV
	 9CHwoC1s0VdO0/UV9cQ2Oc5oHxWfBfWc9jvUTI7c=
Date: Sun, 2 Nov 2025 12:13:10 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 10/13] media: i2c: ov5647: Tidy up mode registers to make
 the order common
Message-ID: <g2hffsvecnuogwfeouewmtudk6rt5vbi77kcr5wji4ketgiqji@ahpz3iqgsvqd>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-10-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-10-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:21PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> To make comparisons of the mode registers easier, put the registers
> for the binned and VGA modes in the same order as the others.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 59c21b91d09d79f073a54871221f197a0bcf3aa2..2c9f50fd20d99f2adce2a1fbe4289cf7aeea2ba4 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -343,6 +343,8 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x3036, 0x62},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> +	{0x3821, 0x01},
> +	{0x3820, 0x41},
>  	{0x3827, 0xec},
>  	{0x370c, 0x03},
>  	{0x3612, 0x59},
> @@ -415,8 +417,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x4837, 0x16},
>  	{0x4800, 0x24},
>  	{0x3503, 0x03},
> -	{0x3820, 0x41},
> -	{0x3821, 0x01},
>  	{0x350a, 0x00},
>  	{0x350b, 0x10},
>  	{0x3500, 0x00},
> @@ -429,20 +429,27 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
> -	{0x3035, 0x11},
> +	{0x3034, 0x1a},
> +	{0x3035, 0x21},

Why has the register value changed ?

>  	{0x3036, 0x46},
>  	{0x303c, 0x11},
> +	{0x3106, 0xf5},
>  	{0x3821, 0x01},
>  	{0x3820, 0x41},
> +	{0x3827, 0xec},
>  	{0x370c, 0x03},
>  	{0x3612, 0x59},
>  	{0x3618, 0x00},
>  	{0x5000, 0x06},
>  	{0x5003, 0x08},
>  	{0x5a00, 0x08},
> -	{0x3000, 0xff},
> -	{0x3001, 0xff},
> -	{0x3002, 0xff},
> +	{0x3000, 0x00},
> +	{0x3001, 0x00},
> +	{0x3002, 0x00},

Uh these ones changed as well, is it intentional ?

> +	{0x3016, 0x08},
> +	{0x3017, 0xe0},
> +	{0x3018, 0x44},
> +	{0x301c, 0xf8},
>  	{0x301d, 0xf0},
>  	{0x3a18, 0x00},
>  	{0x3a19, 0xf8},
> @@ -468,6 +475,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x3632, 0xe2},
>  	{0x3633, 0x23},
>  	{0x3634, 0x44},
> +	{0x3636, 0x06},
>  	{0x3620, 0x64},
>  	{0x3621, 0xe0},
>  	{0x3600, 0x37},
> @@ -496,19 +504,6 @@ static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x4001, 0x02},
>  	{0x4004, 0x02},
>  	{0x4000, 0x09},
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},

Ah, that's why!

> -	{0x3017, 0xe0},
> -	{0x301c, 0xfc},
> -	{0x3636, 0x06},
> -	{0x3016, 0x08},
> -	{0x3827, 0xec},
> -	{0x3018, 0x44},
> -	{0x3035, 0x21},
> -	{0x3106, 0xf5},
> -	{0x3034, 0x1a},
> -	{0x301c, 0xf8},

Nice tidy up
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	{0x4800, 0x34},
>  	{0x3503, 0x03},
>  	{0x0100, 0x01},
>
> --
> 2.51.0
>

