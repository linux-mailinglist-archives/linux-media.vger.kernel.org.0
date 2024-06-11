Return-Path: <linux-media+bounces-12965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8190425D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 19:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953BB1C2322B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9D04D8BB;
	Tue, 11 Jun 2024 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2suFtL5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006147F5D;
	Tue, 11 Jun 2024 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718126765; cv=none; b=kfKeGubXX9dkkvYUewMu6qZW943Zv3HTcyf5Keap1xAx6oumHzdP8LcLCXUR6xe6oVtKhkSSjZ40YbeFVcuqzE/lmwx4Ayth8ESP04g0gXnaOgNhcsHAHjOONV9+OKFg7JHyzmKBb8CcKCGtWuVCjVZfXFr9kUz0WCCHrbhcr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718126765; c=relaxed/simple;
	bh=SQVKiWoMEQlGJzZl2xfryE32TSjR7fWPakYa+xG+jOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1dG7UpfJDzgAT01vG4M47RuSnTlUpkHxeYpayHXFxdfwUQxl4Sifji/1W8lafjk8PR5v9cJsMsaIXBpiTTjauhu1qdxNlUOWit9q8kDl96kc9VZAbFfBtNHIPbrQMABripC1omNPqmZazJIzBpJ39l+nsN53PDBX6fD2v//QO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2suFtL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECECC2BD10;
	Tue, 11 Jun 2024 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718126764;
	bh=SQVKiWoMEQlGJzZl2xfryE32TSjR7fWPakYa+xG+jOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2suFtL5Vem76e++QV+lrZeQ7MGiZxVNYh58xkSQi2PPsLfzgMS+DIViYpPHwQIIF
	 OQsYe+Y8zKrquo+xzNMcQu6lXzyiUATsppSouXRBdVURX2p/4tkeyTY8YA3VjNSpRq
	 F64+77bYB6rnQpQt6afrIzUOf6dOR6B4sXGhn7UVKtUTB8MLQAEFpwkuEtLMEi5GDu
	 HRy6oaJUJJdwjklzdWv+LgNpsX8DPiNzS9u2kLYOXfEPTvmV8CzRmlgvdhLcfUbiza
	 CAmlUqVumeZrj5/6o682Y84/8n7jfxQeLepnQGIcQ1Xm+1hE6nkCG3V6dye3Leykmi
	 1MBzCTM49UwkA==
Date: Tue, 11 Jun 2024 10:26:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 2/2] media: i2c: Add imx283 camera sensor driver
Message-ID: <20240611172602.GA2226028@thelio-3990X>
References: <20240402-kernel-name-extraversion-v4-0-fb776893e4ec@ideasonboard.com>
 <20240402-kernel-name-extraversion-v4-2-fb776893e4ec@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-kernel-name-extraversion-v4-2-fb776893e4ec@ideasonboard.com>

Hi Umang,

On Tue, Apr 02, 2024 at 03:37:51PM +0530, Umang Jain wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Add a v4l2 subdevice driver for the Sony IMX283 image sensor.
> 
> The IMX283 is a 20MP Diagonal 15.86 mm (Type 1) CMOS Image Sensor with
> Square Pixel for Color Cameras.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank/link freq control support
> - Test pattern support control
> - Arbitrary horizontal and vertical cropping
> - Supported resolution:
>   - 5472x3648 @ 20fps (SRGGB12)
>   - 5472x3648 @ 25fps (SRGGB10)
>   - 2736x1824 @ 50fps (SRGGB12)
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

This change is now in -next as commit ccb4eb4496fa ("media: i2c: Add
imx283 camera sensor driver").

> +++ b/drivers/media/i2c/imx283.c
...
> +/* IMX283 native and active pixel array size. */
> +static const struct v4l2_rect imx283_native_area = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 5592,
> +	.height = 3710,
> +};
> +
> +static const struct v4l2_rect imx283_active_area = {
> +	.top = 40,
> +	.left = 108,
> +	.width = 5472,
> +	.height = 3648,
> +};
...
> +#define CENTERED_RECTANGLE(rect, _width, _height)			\
> +	{								\
> +		.left = rect.left + ((rect.width - (_width)) / 2),	\
> +		.top = rect.top + ((rect.height - (_height)) / 2),	\
> +		.width = (_width),					\
> +		.height = (_height),					\
> +	}
...
> +		.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),

This construct does not work with GCC prior to 7 and Clang prior to 17
(where certain const structures and variables will be considered
constant expressions for the sake of initializers and such), resulting
in:

  drivers/media/i2c/imx283.c:443:30: error: initializer element is not constant
     .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                ^
  drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
     .left = rect.left + ((rect.width - (_width)) / 2), \
             ^~~~
  drivers/media/i2c/imx283.c:443:30: note: (near initialization for 'supported_modes_12bit[0].crop.left')
     .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                ^
  drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
     .left = rect.left + ((rect.width - (_width)) / 2), \
             ^~~~
  drivers/media/i2c/imx283.c:443:30: error: initializer element is not constant
     .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                ^
  drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
     .top = rect.top + ((rect.height - (_height)) / 2), \
            ^~~~
  drivers/media/i2c/imx283.c:443:30: note: (near initialization for 'supported_modes_12bit[0].crop.top')
     .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                ^
  drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
     .top = rect.top + ((rect.height - (_height)) / 2), \
            ^~~~

  drivers/media/i2c/imx283.c:443:30: error: initializer element is not a compile-time constant
                  .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                          ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/media/i2c/imx283.c:412:11: note: expanded from macro 'CENTERED_RECTANGLE'
                  .left = rect.left + ((rect.width - (_width)) / 2),      \
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/media/i2c/imx283.c:492:30: error: initializer element is not a compile-time constant
                  .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                          ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/media/i2c/imx283.c:412:11: note: expanded from macro 'CENTERED_RECTANGLE'
                  .left = rect.left + ((rect.width - (_width)) / 2),      \
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  2 errors generated.

with these compiler versions. Usually, the values are just refactored
with #define macros.

Cheers,
Nathan

