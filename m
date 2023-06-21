Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C55738A03
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 17:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjFUPoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 11:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbjFUPnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 11:43:46 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166551FD0
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687362200; x=1718898200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2hTPBRjWyycB+oBzlubA2AR2RefbqoPoO8L9IF0GG4=;
  b=bjCg6miOAREdRQLhZDbsSqo1Hn00d8NQiRFnkGgUz0k3IB6iMy6RWZ9z
   Xy395D7dWm10EF8ApZsoxpHDPax90PLBitUXo/btOrWDRCaSSNd8PIWf+
   BIOkk04fMitMp5VuCX7XLInye4hIVVHt7TH7X0E3wSlBUge4QCc7OtZR4
   CfA+nsi4nBOmaNaAoSIH0xjCfJ0WoE+c8GcqAcdaUrWu++8HrGx7OVfUE
   spL/3AYF+XMwcCHM8zjGFrTBIyRubXgsI3DW9Cij7ol+1Dpf5RWA8wUk3
   6DOIh15YggITtHC4UO6DNUO+PjAf97xVhe8MEe8iMdAUxSijJSjHyyg10
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339830988"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339830988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="859004860"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="859004860"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:43:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 731A611FA52;
        Wed, 21 Jun 2023 18:43:09 +0300 (EEST)
Date:   Wed, 21 Jun 2023 15:43:09 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 23/32] media: pxa_camera: Fix probe error
 handling
Message-ID: <ZJMaje9BH3D3g7wq@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-24-sakari.ailus@linux.intel.com>
 <20230530045125.GN21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530045125.GN21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Tue, May 30, 2023 at 07:51:25AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:16:06PM +0300, Sakari Ailus wrote:
> > Fix and simplify error handling in pxa_camera probe, by moving devm_*()
> > functions early in the probe function and then tearing down what was set
> > up on error patch.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/intel/pxa_camera.c | 48 ++++++++++++-----------
> >  1 file changed, 25 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> > index f0d316d5fe27c..dad5e8d97683e 100644
> > --- a/drivers/media/platform/intel/pxa_camera.c
> > +++ b/drivers/media/platform/intel/pxa_camera.c
> > @@ -2289,6 +2289,24 @@ static int pxa_camera_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pcdev->clk))
> >  		return PTR_ERR(pcdev->clk);
> >  
> > +	/*
> > +	 * Request the regions.
> > +	 */
> > +	base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	pcdev->irq = irq;
> > +	pcdev->base = base;
> > +
> > +	/* request irq */
> > +	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
> > +			       PXA_CAM_DRV_NAME, pcdev);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Camera interrupt register failed\n");
> > +		return err;
> > +	}
> > +
> 
> The IRQ should not be requested before the device is initialized, to
> avoid spurious IRQs at probe time. I don't think the driver currently
> handles this very well, but moving IRQ registration up is the wrong
> direction. As this particular change isn't needed to clean up the
> notifier, I would keep the devm_request_irq() call where it is.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Fair enough. I'll move this to just before registering the async
sub-device.

devm_request_irq() is also problematic as an IRQ may still happen once the
driver has executed much of its remove function. I this case this isn't
probably too much of an issue though.

-- 
Regards,

Sakari Ailus
