Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D705A5730E6
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 10:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbiGMIWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 04:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbiGMIWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 04:22:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09043E4769
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 01:19:00 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1oBXaD-0000Gm-Lj; Wed, 13 Jul 2022 10:18:57 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1oBXaC-0004Er-CS; Wed, 13 Jul 2022 10:18:56 +0200
Date:   Wed, 13 Jul 2022 10:18:56 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Message-ID: <20220713081856.GA14683@pengutronix.de>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Tue, May 31, 2022 at 03:19:55PM +0100, Biju Das wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v10->v11:
>  * To avoid lock-up on R-Car Gen2, added poll for reset status after deassert.

I didn't look at this earlier because of my preexisting R-b.
It looks to me like this should be moved into the reset driver.

[...]
> @@ -631,13 +634,33 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  	int ret;
>  
> +	ret = reset_control_deassert(vsp1->rstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * On R-Car Gen2, vsp1 register access after deassert can cause
> +	 * lock-up. Therefore, we need to poll the status of the reset to
> +	 * avoid lock-up.
> +	 */
> +	ret = read_poll_timeout_atomic(reset_control_status, ret, ret == 0, 1,
> +				       100, false, vsp1->rstc);

So the reset driver does not follow the reset API documentation ("After
calling this function, the reset is guaranteed to be deasserted." [1])?
If so, this status polling should be moved into the reset driver.

Also, why use the atomic poll variant here? As far as I can tell, this
driver doesn't call pm_runtime_irq_safe. The reset_control_deassert()
API does not guarantee that the driver implementation doesn't sleep,
either.

[1] https://docs.kernel.org/driver-api/reset.html?highlight=reset_control_deassert#c.reset_control_deassert

[...]
> @@ -825,6 +848,11 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> +	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(vsp1->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> +				     "failed to get reset control\n");
> +

What about the other consumers of this shared reset? Don't they need
the status poll you added here as well?

regards
Philipp
