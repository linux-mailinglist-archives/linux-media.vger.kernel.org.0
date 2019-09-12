Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6644FB1562
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfILU0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:26:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbfILU0u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:26:50 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32B6B20830;
        Thu, 12 Sep 2019 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568320009;
        bh=l19LbqpY2hBqQHafDv7Xu6iCTFH9k+VC+tpz3LtafOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UFCNoVjFPh+fpGv9CiYMm812hzIN/3Eq2qmnzyppi5hG+ugtGsgv+7JyIjswXrK/K
         OTVXqdwK/45z2tsbUccVxXYsfrro4cyZPCEyDrAR/4etecx1LIJxwma9vrAez5r8F/
         bfC4h1h8is+wJKo0dLp2mX6cXiPHg+BvtDwjZtXg=
Date:   Thu, 12 Sep 2019 22:26:47 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Message-ID: <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912175132.411-6-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> +	dev->regmap = devm_regmap_init_mmio(dev->dev, dev->base,
> +					    &deinterlace_regmap_config);
> +	if (IS_ERR(dev->regmap)) {
> +		dev_err(dev->dev, "Couldn't create deinterlace regmap\n");
> +
> +		return PTR_ERR(dev->regmap);
> +	}
> +
> +	ret = clk_prepare_enable(dev->bus_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable bus clock\n");
> +
> +		return ret;
> +	}

Do you need to keep the bus clock enabled all the time? Usually, for
the SoCs that have a reset line, you only need it to read / write to
the registers, not to have the controller actually running.

If you don't, then regmap_init_mmio_clk will take care of that for
you.

> +	clk_set_rate(dev->mod_clk, 300000000);
> +
> +	ret = clk_prepare_enable(dev->mod_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable mod clock\n");
> +
> +		goto err_bus_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dev->ram_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable ram clock\n");
> +
> +		goto err_mod_clk;
> +	}
> +
> +	ret = reset_control_reset(dev->rstc);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to apply reset\n");
> +
> +		goto err_ram_clk;
> +	}

This could be moved to a runtime_pm hook, with get_sync called in the
open. That way you won't leave the device powered on if it's unused.

> +struct deinterlace_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +	struct device		*dev;
> +	struct v4l2_m2m_dev	*m2m_dev;
> +
> +	/* Device file mutex */
> +	struct mutex		dev_mutex;
> +
> +	void __iomem		*base;
> +	struct regmap		*regmap;

Do you need to store the base address in that structure if you're
using the regmap?

Maxime
