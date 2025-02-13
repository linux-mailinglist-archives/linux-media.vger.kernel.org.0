Return-Path: <linux-media+bounces-26119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCBA33C9E
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 11:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0A916912D
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 10:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0169E213E76;
	Thu, 13 Feb 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b4x4Wbeq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C13B212F98;
	Thu, 13 Feb 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441965; cv=none; b=mdEXIDaHloMoEwci4grjrU9bmgATSTnGNvU47tXCnZdZPqNdz0fFHvyB2pbmf0NJu4nrh2EZtRSO4fZYZaSdJpENNaOVU40UxDGTa+VkUGDEk/mA1BS6vQ9hH1/851cEZUXmJaX8jhlhzGIU5STK4Cv7ZQdq2YdWTR2o/sC8Xsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441965; c=relaxed/simple;
	bh=24IKPVvko7AYF/JdQjmDU6yGxxREmdCEYd1XuYo9HmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1Dzz3t8kc1b4XlTuB6+j6lXO8OlnwK/1q4OYKzGvTJPIar+onf260UYzV4Vd/r9jI3O2+VT5eZbGrz/n+wl0kEkGLu0UH7gEG35AxiwXnRPLYMsbbhYaCiqeWkBJVcluzwr/mNM36FiZE3FMr0Iv2VgGfS4iOiXhbCoS88LwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b4x4Wbeq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3024B6AF;
	Thu, 13 Feb 2025 11:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739441876;
	bh=24IKPVvko7AYF/JdQjmDU6yGxxREmdCEYd1XuYo9HmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4x4WbeqsNvXxNQyuRFhAU3Ed8ZwGP1OT+MWvlY7JpGqB4kloKWwzB07v7/KYld/M
	 xhgJYJKvH5epfyl0iH9cIVSUPBxVmB2dn+7uBvY+GVu8/+400FhuklOcNVwR8sBwVh
	 501sXqmw6+sS/O1SyCmfn3cavrs0GH0+UP06p6Ac=
Date: Thu, 13 Feb 2025 12:19:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
Message-ID: <20250213101903.GH5888@pendragon.ideasonboard.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-3-slavine@d3embedded.com>

Hi Sebastian,

Thank you for the patch.

I'll start with a partial review.

On Wed, Feb 12, 2025 at 02:56:54PM -0500, Sebastian LaVine wrote:
> Adds a driver for the Sony IMX728 image sensor.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  MAINTAINERS                  |    1 +
>  arch/arm64/configs/defconfig |    1 +
>  drivers/media/i2c/Kconfig    |   12 +
>  drivers/media/i2c/Makefile   |    1 +
>  drivers/media/i2c/imx728.c   | 9655 ++++++++++++++++++++++++++++++++++
>  5 files changed, 9670 insertions(+)
>  create mode 100644 drivers/media/i2c/imx728.c

[snip]

> diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> new file mode 100644
> index 000000000000..75120ca01ce6
> --- /dev/null
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,9655 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX728 CMOS Image Sensor Driver
> + *
> + * Copyright (c) 2024-2025 Define Design Deploy Corp
> + */

[snip]

> +static const struct cci_reg_sequence imx728_wdr_12bit_3856x2176[] = {

This table is way too big, with over 8000 entries. Some are even
duplicated, with identical or different values for the same register. It
will take more than a second at 400kHz to program this.

At the very least I would expect a way to compact the table and make use
of I2C register address auto-increment. Default power-up values should
also likely be just dropped.

I haven't checked in details, but doesn't this table also contain tuning
data for your specific camera ?

[snip]

> +};

[snip]

> +static int imx728_get_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *fi)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +
> +       fi->interval.numerator = 1;
> +       fi->interval.denominator = imx728->fps;
> +       return 0;
> +}
> +
> +static int imx728_set_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *fi)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       u32 req_fps;
> +
> +       mutex_lock(&imx728->lock);
> +
> +       if (fi->interval.numerator == 0 || fi->interval.denominator == 0) {
> +               fi->interval.denominator = IMX728_FRAMERATE_DEFAULT;
> +               fi->interval.numerator = 1;
> +       }
> +
> +       req_fps = clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominator,
> +                                             fi->interval.numerator),
> +                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX);
> +
> +       fi->interval.numerator = 1;
> +       fi->interval.denominator = req_fps;
> +
> +       imx728->fps = req_fps;
> +
> +       mutex_unlock(&imx728->lock);
> +       dev_dbg(imx728->dev, "%s frame rate = %d\n", __func__, imx728->fps);
> +
> +       return 0;
> +}

The frame rate on raw sensors is controlled through h/v blanking. You
can drop thse functions, especially given that imx728->fps isn't used
anywhere else.

-- 
Regards,

Laurent Pinchart

