Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9161B2F4E2C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 16:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbhAMPKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 10:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhAMPKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 10:10:37 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA30C061786;
        Wed, 13 Jan 2021 07:09:56 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A3DF0C6378; Wed, 13 Jan 2021 15:09:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610550594; bh=vnBpzQjOx+cBmpfoVZKB5QgB9eUJOE6mIeUphxb+gS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPlHsRBP2IkKFSRIA8lDfHbV+q6nlASaPczF9f8wLdVYQ2DwO14XH9mQzsnDTDdGa
         N5nYLoSaBRCxluH09pYuG0sq6Z55+wLIDgqWGScOHDrTYxug0ocR1T5hThvhLt6WZm
         MlTL6bcZmtig2rOSFwl0On0arZKVnjlUd6SH92d4mQ0TZsLYRzuhF/1DYWCbYN0Cfr
         SB1xyPw8WMDO9g0tttyHUF8/JmDEsu/jQiYb1Z40OUKjKZ5N2FQ8MUw2QznStnx13E
         Zeqv0NaoZI8W5jcUi4tN/GT0ZW4XHO9Eesf4JrXo8oqiXeiXOWYBybszwa81ttxbXM
         Lpa7GBWWfrt1g==
Date:   Wed, 13 Jan 2021 15:09:54 +0000
From:   Sean Young <sean@mess.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/4] media: sunxi-cir: Factor out hardware initialization
Message-ID: <20210113150954.GA8867@gofer.mess.org>
References: <20210113045132.31430-1-samuel@sholland.org>
 <20210113045132.31430-4-samuel@sholland.org>
 <20210113143633.GB8430@gofer.mess.org>
 <ec69da79-4d96-0672-9610-5749ec881b4f@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec69da79-4d96-0672-9610-5749ec881b4f@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Samuel,

On Wed, Jan 13, 2021 at 09:00:20AM -0600, Samuel Holland wrote:
> On 1/13/21 8:36 AM, Sean Young wrote:
> > On Tue, Jan 12, 2021 at 10:51:31PM -0600, Samuel Holland wrote:
> >> In preparation for adding suspend/resume hooks, factor out the hardware
> >> initialization from the driver probe/remove functions.
> >>
> >> The timeout programmed during init is taken from the `struct rc_dev` so
> >> it is maintained across an exit/init cycle.
> >>
> >> This resolves some trivial issues with the probe function: throwing away
> >> the error from clk_prepare_enable and using the wrong type for the
> >> temporary register value.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>  drivers/media/rc/sunxi-cir.c | 128 ++++++++++++++++++++---------------
> >>  1 file changed, 74 insertions(+), 54 deletions(-)
> >>
> >> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> >> index 48be400421cd..ccb9d6b4225d 100644
> >> --- a/drivers/media/rc/sunxi-cir.c
> >> +++ b/drivers/media/rc/sunxi-cir.c
> >> @@ -169,10 +169,74 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
> >>  	return 0;
> >>  }
> >>  
> >> +static int sunxi_ir_hw_init(struct device *dev)
> >> +{
> >> +	struct sunxi_ir *ir = dev_get_drvdata(dev);
> >> +	u32 tmp;
> >> +	int ret;
> >> +
> >> +	ret = reset_control_deassert(ir->rst);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = clk_prepare_enable(ir->apb_clk);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable apb clk\n");
> >> +		goto exit_assert_reset;
> >> +	}
> >> +
> >> +	ret = clk_prepare_enable(ir->clk);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable ir clk\n");
> >> +		goto exit_disable_apb_clk;
> >> +	}
> >> +
> >> +	/* Enable CIR Mode */
> >> +	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
> >> +
> >> +	/* Set noise threshold and idle threshold */
> >> +	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
> 
> Initializing ir->rc->timeout in .probe is needed because of this line.
> As the changelog mentions, this reprograms the user-configured timeout
> after an exit/init (suspend/resume) cycle. It needs some default value
> the first time, when called from .probe.

Yes, you're completely right. Sorry about that.

> >> +
> >> +	/* Invert Input Signal */
> >> +	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
> >> +
> >> +	/* Clear All Rx Interrupt Status */
> >> +	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
> >> +
> >> +	/*
> >> +	 * Enable IRQ on overflow, packet end, FIFO available with trigger
> >> +	 * level
> >> +	 */
> >> +	writel(REG_RXINT_ROI_EN | REG_RXINT_RPEI_EN |
> >> +	       REG_RXINT_RAI_EN | REG_RXINT_RAL(ir->fifo_size / 2 - 1),
> >> +	       ir->base + SUNXI_IR_RXINT_REG);
> >> +
> >> +	/* Enable IR Module */
> >> +	tmp = readl(ir->base + SUNXI_IR_CTL_REG);
> >> +	writel(tmp | REG_CTL_GEN | REG_CTL_RXEN, ir->base + SUNXI_IR_CTL_REG);
> >> +
> >> +	return 0;
> >> +
> >> +exit_disable_apb_clk:
> >> +	clk_disable_unprepare(ir->apb_clk);
> >> +exit_assert_reset:
> >> +	reset_control_assert(ir->rst);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void sunxi_ir_hw_exit(struct device *dev)
> >> +{
> >> +	struct sunxi_ir *ir = dev_get_drvdata(dev);
> >> +
> >> +	clk_disable_unprepare(ir->clk);
> >> +	clk_disable_unprepare(ir->apb_clk);
> >> +	reset_control_assert(ir->rst);
> >> +}
> >> +
> >>  static int sunxi_ir_probe(struct platform_device *pdev)
> >>  {
> >>  	int ret = 0;
> >> -	unsigned long tmp = 0;
> >>  
> >>  	struct device *dev = &pdev->dev;
> >>  	struct device_node *dn = dev->of_node;
> >> @@ -213,43 +277,26 @@ static int sunxi_ir_probe(struct platform_device *pdev)
> >>  		ir->rst = devm_reset_control_get_exclusive(dev, NULL);
> >>  		if (IS_ERR(ir->rst))
> >>  			return PTR_ERR(ir->rst);
> >> -		ret = reset_control_deassert(ir->rst);
> >> -		if (ret)
> >> -			return ret;
> >>  	}
> >>  
> >>  	ret = clk_set_rate(ir->clk, b_clk_freq);
> >>  	if (ret) {
> >>  		dev_err(dev, "set ir base clock failed!\n");
> >> -		goto exit_reset_assert;
> >> +		return ret;
> >>  	}
> >>  	dev_dbg(dev, "set base clock frequency to %d Hz.\n", b_clk_freq);
> >>  
> >> -	if (clk_prepare_enable(ir->apb_clk)) {
> >> -		dev_err(dev, "try to enable apb_ir_clk failed\n");
> >> -		ret = -EINVAL;
> >> -		goto exit_reset_assert;
> >> -	}
> >> -
> >> -	if (clk_prepare_enable(ir->clk)) {
> >> -		dev_err(dev, "try to enable ir_clk failed\n");
> >> -		ret = -EINVAL;
> >> -		goto exit_clkdisable_apb_clk;
> >> -	}
> >> -
> >>  	/* IO */
> >>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>  	ir->base = devm_ioremap_resource(dev, res);
> >>  	if (IS_ERR(ir->base)) {
> >> -		ret = PTR_ERR(ir->base);
> >> -		goto exit_clkdisable_clk;
> >> +		return PTR_ERR(ir->base);
> >>  	}
> >>  
> >>  	ir->rc = rc_allocate_device(RC_DRIVER_IR_RAW);
> >>  	if (!ir->rc) {
> >>  		dev_err(dev, "failed to allocate device\n");
> >> -		ret = -ENOMEM;
> >> -		goto exit_clkdisable_clk;
> >> +		return -ENOMEM;
> >>  	}
> >>  
> >>  	ir->rc->priv = ir;
> >> @@ -265,6 +312,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
> >>  	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
> >>  	/* Frequency after IR internal divider with sample period in us */
> >>  	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
> >> +	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
> > 
> > Why? This is set from sunxi_ir_set_timeout().
> 
> Because it is also sent as an argument to sunxi_ir_set_timeout().

Indeed it is.

> >>  	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
> >>  	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
> >>  	ir->rc->s_timeout = sunxi_ir_set_timeout;
> >> @@ -291,41 +339,15 @@ static int sunxi_ir_probe(struct platform_device *pdev)
> >>  		goto exit_free_dev;
> >>  	}
> >>  
> >> -	/* Enable CIR Mode */
> >> -	writel(REG_CTL_MD, ir->base+SUNXI_IR_CTL_REG);
> >> -
> >> -	/* Set noise threshold and idle threshold */
> >> -	sunxi_ir_set_timeout(ir->rc, IR_DEFAULT_TIMEOUT);
> 
> This is where the default timeout was originally programmed.
> 
> >> -
> >> -	/* Invert Input Signal */
> >> -	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
> >> -
> >> -	/* Clear All Rx Interrupt Status */
> >> -	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
> >> -
> >> -	/*
> >> -	 * Enable IRQ on overflow, packet end, FIFO available with trigger
> >> -	 * level
> >> -	 */
> >> -	writel(REG_RXINT_ROI_EN | REG_RXINT_RPEI_EN |
> >> -	       REG_RXINT_RAI_EN | REG_RXINT_RAL(ir->fifo_size / 2 - 1),
> >> -	       ir->base + SUNXI_IR_RXINT_REG);
> >> -
> >> -	/* Enable IR Module */
> >> -	tmp = readl(ir->base + SUNXI_IR_CTL_REG);
> >> -	writel(tmp | REG_CTL_GEN | REG_CTL_RXEN, ir->base + SUNXI_IR_CTL_REG);
> >> +	ret = sunxi_ir_hw_init(dev);
> >> +	if (ret)
> >> +		goto exit_free_dev;
> >>  
> >>  	dev_info(dev, "initialized sunXi IR driver\n");
> >>  	return 0;
> >>  
> >>  exit_free_dev:
> >>  	rc_free_device(ir->rc);
> >> -exit_clkdisable_clk:
> >> -	clk_disable_unprepare(ir->clk);
> >> -exit_clkdisable_apb_clk:
> >> -	clk_disable_unprepare(ir->apb_clk);
> >> -exit_reset_assert:
> >> -	reset_control_assert(ir->rst);
> >>  
> >>  	return ret;
> >>  }
> >> @@ -334,11 +356,9 @@ static int sunxi_ir_remove(struct platform_device *pdev)
> >>  {
> >>  	struct sunxi_ir *ir = platform_get_drvdata(pdev);
> >>  
> >> -	clk_disable_unprepare(ir->clk);
> >> -	clk_disable_unprepare(ir->apb_clk);
> >> -	reset_control_assert(ir->rst);
> >> -
> >> +	sunxi_ir_hw_exit(&pdev->dev);
> >>  	rc_unregister_device(ir->rc);
> 
> I can swap these lines to fix your comment on patch 1.

Please do, and mention it in the commit message.

It might be harmless to write to SUNXI_IR_CIR_REG but it's not really the
right thing to do. It should be idiomatic to call rc_unregister_device()
first in the remove() function.

Thank you for that.

Sean

> 
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> -- 
> >> 2.26.2
