Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273F572E6CC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 17:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240877AbjFMPNu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 11:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240619AbjFMPNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 11:13:48 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553C6CA
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686669227; x=1718205227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yhkMGBztrUbnU3mC6eESXQir1qgWkxESChcCkYaezcI=;
  b=bOSkUQ8ryrYtb8WDqRsMFvQbggt1Yf3aOv2gl8gBanOQmDfyrqaVwMhW
   28LXJn12Nygpf0CucVUQul3oqK2fRZD5N8RT6hX0QYqPMKrDQ5bhzC6xh
   wOlfKsFAdc2KlbQvOpOVptXqOHmGtPQc5YV8r9Vbp2cLFMslbftMrt6+e
   zfTOVIT42LyDUyZPPAXto2/vKbysLg1sbg5ILTgCEhn0wZ7FfzN3b4qm1
   O6tjIKCrb86dfnWexkH4ZLpGIAW8Up4Kn1Ta/5ABFFaavx7GeSyyydwpI
   6aWc+a9A4Y5Nj/hZZ6kNR9k7ars+DFwuMKcHSrJl6nxbtMX41bp6oQ6TV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="358359426"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="358359426"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 08:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="856132056"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="856132056"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 08:13:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 964FE11F9D2;
        Tue, 13 Jun 2023 18:08:08 +0300 (EEST)
Date:   Tue, 13 Jun 2023 15:08:08 +0000
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
Subject: Re: [RESEND PATCH v3 24/32] media: pxa_camera: Register V4L2 device
 early
Message-ID: <ZIiGWE5EowXaRuWW@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-25-sakari.ailus@linux.intel.com>
 <20230530045441.GO21633@pendragon.ideasonboard.com>
 <20230530045608.GP21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530045608.GP21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 07:56:08AM +0300, Laurent Pinchart wrote:
> On Tue, May 30, 2023 at 07:54:46AM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 25, 2023 at 12:16:07PM +0300, Sakari Ailus wrote:
> > > Register V4L2 device before initialising the notifier. This way the device
> > > is available to the notifier from the beginning which makes it possible to
> > > use it for debug prints.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/platform/intel/pxa_camera.c | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> > > index dad5e8d97683e..5df93fd4ff04b 100644
> > > --- a/drivers/media/platform/intel/pxa_camera.c
> > > +++ b/drivers/media/platform/intel/pxa_camera.c
> > > @@ -2307,6 +2307,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
> > >  		return err;
> > >  	}
> > >  
> > > +	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	v4l2_async_nf_init(&pcdev->notifier);
> > >  	pcdev->res = res;
> > >  	pcdev->pdata = pdev->dev.platform_data;
> > > @@ -2324,10 +2328,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
> > >  	} else if (pdev->dev.of_node) {
> > >  		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
> > >  	} else {
> > > -		return -ENODEV;
> > > +		err = -ENODEV;
> > >  	}
> > >  	if (err < 0)
> > > -		return err;
> > > +		goto exit_v4l2_device_unregister;
> > >  
> > >  	if (!(pcdev->platform_flags & (PXA_CAMERA_DATAWIDTH_8 |
> > >  			PXA_CAMERA_DATAWIDTH_9 | PXA_CAMERA_DATAWIDTH_10))) {
> > > @@ -2393,22 +2397,17 @@ static int pxa_camera_probe(struct platform_device *pdev)
> > >  	pxa_camera_activate(pcdev);
> > >  
> > >  	platform_set_drvdata(pdev, pcdev);
> > > -	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> > > -	if (err)
> > > -		goto exit_deactivate;
> > >  
> > >  	err = pxa_camera_init_videobuf2(pcdev);
> > >  	if (err)
> > > -		goto exit_v4l2_device_unregister;
> > > +		goto exit_deactivate;
> > >  
> > >  	pcdev->notifier.ops = &pxa_camera_sensor_ops;
> > >  	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
> > 
> > The v4l2_device isn't made available to the notifier before this call,
> > so why is it necessary to register it earlier ?
> 
> Ah, it's because of patch 31/32. Please record this in the commit
> message.

It's already in the commit message, as you requested in an earlier review.

-- 
Sakari Ailus
