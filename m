Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6E6B1584
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727748AbfILUnd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Sep 2019 16:43:33 -0400
Received: from mailoutvs8.siol.net ([185.57.226.199]:38372 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727702AbfILUnd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:43:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0CD5A522593;
        Thu, 12 Sep 2019 22:43:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5udkIJLPJE85; Thu, 12 Sep 2019 22:43:29 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 93F7C5225DB;
        Thu, 12 Sep 2019 22:43:29 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 20CB2522593;
        Thu, 12 Sep 2019 22:43:29 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date:   Thu, 12 Sep 2019 22:43:28 +0200
Message-ID: <4613446.95M5L3lKvs@jernej-laptop>
In-Reply-To: <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <20190912175132.411-6-jernej.skrabec@siol.net> <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> > +	dev->regmap = devm_regmap_init_mmio(dev->dev, dev->base,
> > +					    
&deinterlace_regmap_config);
> > +	if (IS_ERR(dev->regmap)) {
> > +		dev_err(dev->dev, "Couldn't create deinterlace 
regmap\n");
> > +
> > +		return PTR_ERR(dev->regmap);
> > +	}
> > +
> > +	ret = clk_prepare_enable(dev->bus_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable bus clock\n");
> > +
> > +		return ret;
> > +	}
> 
> Do you need to keep the bus clock enabled all the time? Usually, for
> the SoCs that have a reset line, you only need it to read / write to
> the registers, not to have the controller actually running.
> 
> If you don't, then regmap_init_mmio_clk will take care of that for
> you.

I'll test that.

> 
> > +	clk_set_rate(dev->mod_clk, 300000000);
> > +
> > +	ret = clk_prepare_enable(dev->mod_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable mod clock\n");
> > +
> > +		goto err_bus_clk;
> > +	}
> > +
> > +	ret = clk_prepare_enable(dev->ram_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable ram clock\n");
> > +
> > +		goto err_mod_clk;
> > +	}
> > +
> > +	ret = reset_control_reset(dev->rstc);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to apply reset\n");
> > +
> > +		goto err_ram_clk;
> > +	}
> 
> This could be moved to a runtime_pm hook, with get_sync called in the
> open. That way you won't leave the device powered on if it's unused.

Ok.

> 
> > +struct deinterlace_dev {
> > +	struct v4l2_device	v4l2_dev;
> > +	struct video_device	vfd;
> > +	struct device		*dev;
> > +	struct v4l2_m2m_dev	*m2m_dev;
> > +
> > +	/* Device file mutex */
> > +	struct mutex		dev_mutex;
> > +
> > +	void __iomem		*base;
> > +	struct regmap		*regmap;
> 
> Do you need to store the base address in that structure if you're
> using the regmap?

Probably not. I'll remove it in v2.

Best regards,
Jernej

> 
> Maxime




