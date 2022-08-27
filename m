Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1C25A3979
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 20:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiH0S1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Aug 2022 14:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH0S1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Aug 2022 14:27:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD22D1E0E;
        Sat, 27 Aug 2022 11:27:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DC424A8;
        Sat, 27 Aug 2022 20:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661624824;
        bh=wDgPTIqj2xTF5/8Q5yzkJvHroiYOyEvKBKAXFt7Swj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tWF7uUdBws1OoM8Y/CV5M/59UcT4vK6E7d6CwcLSEzaQmBMrxHYG1eb3CLgHQa3X2
         oBXbr3XPOtv8JiZz9AL/SGNCvAQm8e1ASzWVkUwZ3djE/CKf7cRCt8u7AnmheKyTzB
         ryZ7zYZBrwt83jJtXKZG7uzG3SQ5g49+tTGqFHCM=
Date:   Sat, 27 Aug 2022 21:26:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Message-ID: <Ywph8PaQS1+LQLHK@pendragon.ideasonboard.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-3-biju.das.jz@bp.renesas.com>
 <YwlpH2kHv0aPwTx9@pendragon.ideasonboard.com>
 <OS0PR01MB5922E5A8E32F547787511F7C86749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E5A8E32F547787511F7C86749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Sat, Aug 27, 2022 at 04:07:56PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v13 2/5] media: renesas: vsp1: Add support to deassert/assert reset line
> > On Thu, Aug 25, 2022 at 02:21:41PM +0100, Biju Das wrote:
> > > As the resets DT property is mandatory, and is present in all .dtsi in
> > > mainline, add support to perform deassert/assert using reference
> > > counted reset handle.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v12->v13:
> > >  * Removed unused iopoll.h header file.
> > >  * Added Rb tag from Geert.
> > > v11->v12:
> > >  * Replaced read_poll_timeout_atomic-> udelay(1) as testing on RZ/G1N
> > >    shows this delay is sufficient to avoid lock-up.
> > >  * Removed Rb tags.
> > > v10->v11:
> > >  * To avoid lock-up on R-Car Gen2, added poll for reset status after deassert.
> > > v9->v10:
> > >  * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}
> > > v8->v9:
> > >  * No change
> > > v7->v8:
> > >  * No Change
> > > v6->v7:
> > >  * No change
> > > v5->v6:
> > >  * Rebased to media_staging and updated commit header
> > >  * Added Rb tag from Laurent
> > >  * Added forward declaration for struct reset_control
> > >  * Updated vsp1_device_get() with changes suggested by Laurent
> > >  * Updated error message for reset_control_get form ctrl->control.
> > > v4->v5:
> > >  * Added Rb tag from Geert
> > > v3->v4:
> > >  * Restored error check for pm_runtime_resume_and_get and calls
> > >    assert() in case of failure.
> > > v2->v3:
> > >  * Added Rb tag from Philipp
> > >  * If reset_control_deassert() failed, return ret directly.
> > > v1->v2:
> > >  * Used reference counted reset handle to perform deassert/assert
> > > RFC->v1:
> > >  * Added reset support as separate patch
> > >  * Moved rstc just after the bus_master field in struct vsp1_device
> > > RFC:
> > >  *
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1.h    |  2 ++
> > >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 28 +++++++++++++++++-
> > -
> > >  2 files changed, 28 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h
> > > b/drivers/media/platform/renesas/vsp1/vsp1.h
> > > index 37cf33c7e6ca..baf898d577ec 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> > > @@ -22,6 +22,7 @@
> > >  struct clk;
> > >  struct device;
> > >  struct rcar_fcp_device;
> > > +struct reset_control;
> > >
> > >  struct vsp1_drm;
> > >  struct vsp1_entity;
> > > @@ -79,6 +80,7 @@ struct vsp1_device {
> > >  	void __iomem *mmio;
> > >  	struct rcar_fcp_device *fcp;
> > >  	struct device *bus_master;
> > > +	struct reset_control *rstc;
> > >
> > >  	struct vsp1_brx *brs;
> > >  	struct vsp1_brx *bru;
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > index 1f73c48eb738..975e6851735e 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/videodev2.h>
> > >
> > >  #include <media/rcar-fcp.h>
> > > @@ -622,6 +623,7 @@ static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
> > >  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > >
> > >  	rcar_fcp_disable(vsp1->fcp);
> > > +	reset_control_assert(vsp1->rstc);
> > >
> > >  	return 0;
> > >  }
> > > @@ -631,13 +633,30 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
> > >  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > >  	int ret;
> > >
> > > +	ret = reset_control_deassert(vsp1->rstc);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * On R-Car Gen2, vsp1 register access after deassert can cause
> > > +	 * lock-up. It is a special case and needs some delay to avoid
> > > +	 * this lock-up.
> > 
> > You can reflow this to 80 columns:
> > 
> > 	 * On R-Car Gen2, vsp1 register access after deassert can cause lock-up.
> > 	 * It is a special case and needs some delay to avoid this lock-up.
> > 
> > > +	 */
> 
> OK, but after adding conditional check for Gen2, it will look like [1]
> 
> > > +	udelay(1);
> > 
> > Is it worth conditioning this on the VSP version to only add the delay
> > on Gen2 ?
> 
> Will fix this in next version like [1], if it is Ok to everyone.

Works for me.

> > With these two small issues addressed,
> 
> [1]
>         if (vsp1->info) {                                                        
>  70 +               /*                                                               
>  71 +                * On R-Car Gen2 and RZ/G1, vsp1 register access after deassert  
>  72 +                * can cause lock-up.                                            
>  73 +                * It is a special case and needs some delay to avoid this       
>  74 +                * lock-up.                                                      


As a general rule, flow the text with sentence following each others
without line breaks, all the way to 80 columns. You can break a comment
in paragraphs, and there should then be a blank line between paragraphs.
You can thus write

		 * On R-Car Gen2 and RZ/G1, vsp1 register access after deassert  
		 * can cause lock-up.                                            
		 *
		 * It is a special case and needs some delay to avoid this       
		 * lock-up.                                                      

or

		 * On R-Car Gen2 and RZ/G1, vsp1 register access after deassert
		 * can cause lock-up. It is a special case and needs some delay
		 * to avoid this lock-up.

but not

		 * On R-Car Gen2 and RZ/G1, vsp1 register access after deassert
		 * can cause lock-up.
		 * It is a special case and needs some delay to avoid this
		 * lock-up.

(I think the second option is better here)

>  75 +                */                                                              
>  76 +               if (vsp1->info->gen == 2)                                        
>  77 +                       udelay(1);
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > +
> > >  	if (vsp1->info) {
> > >  		ret = vsp1_device_init(vsp1);
> > >  		if (ret < 0)
> > > -			return ret;
> > > +			goto done;
> > >  	}
> > >
> > > -	return rcar_fcp_enable(vsp1->fcp);
> > > +	ret = rcar_fcp_enable(vsp1->fcp);
> > > +
> > > +done:
> > > +	if (ret < 0)
> > > +		reset_control_assert(vsp1->rstc);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  static const struct dev_pm_ops vsp1_pm_ops = { @@ -825,6 +844,11 @@
> > > static int vsp1_probe(struct platform_device *pdev)
> > >  	if (irq < 0)
> > >  		return irq;
> > >
> > > +	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> > > +	if (IS_ERR(vsp1->rstc))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > > +				     "failed to get reset control\n");
> > > +
> > >  	/* FCP (optional). */
> > >  	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
-- 
Regards,

Laurent Pinchart
