Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83337736824
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 11:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjFTJoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 05:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjFTJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 05:43:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC5B1711
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687254230; x=1718790230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3y2pi302GROIML8d0LqejYXkTeP1LxVXagMHXpNrip8=;
  b=IDhSYBpbRDxnNaNNS2IGb7kth2XteX707hcWmNq46CDSuEU57usBtmxO
   lzUaGXvIOhAOqqsCSrYNTctiPU8R1tFNDRx/GgZeeTWr8Aoz6yjinDNfS
   r2m30TTgGuh2V8xp0LvPZnVvm7xP1EAaJbbFhoXY6p0SYaEE6580pDyGy
   t1fRBOjkzzEmn9g+fgIb3TU7BAYwF8uQ6Od4qc9eG2htNG3XSYMgbJ+Bx
   C27Nx5hVYrwyVGLp5wNlrU41PXvpeBFcQaqs3wpJhfvqcHlcGSKPOAqZV
   Glnauhy0iFMYPpC+S9EcUneDrMua5a+LOA4Kwkj+ixQStW1w7wP7Tn/Ez
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349546323"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="349546323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 02:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="888196068"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="888196068"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 02:43:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id AE2F111FC35;
        Tue, 20 Jun 2023 12:43:38 +0300 (EEST)
Date:   Tue, 20 Jun 2023 09:43:38 +0000
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
Subject: Re: [RESEND PATCH v3 25/32] media: marvell: cafe: Register V4L2
 device earlier
Message-ID: <ZJF0ypJT7PxIoHjN@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-26-sakari.ailus@linux.intel.com>
 <20230530050033.GQ21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530050033.GQ21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 08:00:33AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:16:08PM +0300, Sakari Ailus wrote:
> > Register V4L2 device before the async notifier so the struct device will
> > be available for the notifier which makes it possible to use it for debug
> > prints.
> 
> Please record in the commit message that this is to prepare for patch
> 31/32. Same comment for other patches in this series.

I've already added the text that tells the purpose is to make future debug
prints possible (with the device). Would you like to have the patch subject
here or something else?

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/marvell/cafe-driver.c | 11 +++++++++--
> >  drivers/media/platform/marvell/mcam-core.c   |  6 ------
> >  2 files changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
> > index dd1bba70bd791..fbfbb9f67ddfc 100644
> > --- a/drivers/media/platform/marvell/cafe-driver.c
> > +++ b/drivers/media/platform/marvell/cafe-driver.c
> > @@ -536,6 +536,10 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  	if (ret)
> >  		goto out_pdown;
> >  
> > +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> > +	if (ret)
> > +		goto out_smbus_shutdown;
> > +
> >  	v4l2_async_nf_init(&mcam->notifier);
> >  
> >  	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
> > @@ -544,12 +548,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  				    struct v4l2_async_connection);
> >  	if (IS_ERR(asd)) {
> >  		ret = PTR_ERR(asd);
> > -		goto out_smbus_shutdown;
> > +		goto out_v4l2_device_unregister;
> >  	}
> >  
> >  	ret = mccic_register(mcam);
> >  	if (ret)
> > -		goto out_smbus_shutdown;
> > +		goto out_v4l2_device_unregister;
> >  
> >  	clkdev_create(mcam->mclk, "xclk", "%d-%04x",
> >  		i2c_adapter_id(cam->i2c_adapter), ov7670_info.addr);
> > @@ -565,6 +569,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  
> >  out_mccic_shutdown:
> >  	mccic_shutdown(mcam);
> > +out_v4l2_device_unregister:
> > +	v4l2_device_unregister(&mcam->v4l2_dev);
> >  out_smbus_shutdown:
> >  	cafe_smbus_shutdown(cam);
> >  out_pdown:
> > @@ -587,6 +593,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  static void cafe_shutdown(struct cafe_camera *cam)
> >  {
> >  	mccic_shutdown(&cam->mcam);
> > +	v4l2_device_unregister(&cam->mcam.v4l2_dev);
> >  	cafe_smbus_shutdown(cam);
> >  	free_irq(cam->pdev->irq, cam);
> >  	pci_iounmap(cam->pdev, cam->mcam.regs);
> > diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> > index 3cee6d6b83fa9..bcfcecdb03ea2 100644
> > --- a/drivers/media/platform/marvell/mcam-core.c
> > +++ b/drivers/media/platform/marvell/mcam-core.c
> > @@ -1866,10 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
> >  	/*
> >  	 * Register with V4L
> >  	 */
> 
> The comment doesn't seem valid anymore.

I'll drop it from v4.

> 
> > -	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
> > -	if (ret)
> > -		goto out;
> > -
> >  	mutex_init(&cam->s_mutex);
> >  	cam->state = S_NOTREADY;
> >  	mcam_set_config_needed(cam, 1);
> > @@ -1915,7 +1911,6 @@ int mccic_register(struct mcam_camera *cam)
> >  
> >  out:
> >  	v4l2_async_nf_unregister(&cam->notifier);
> > -	v4l2_device_unregister(&cam->v4l2_dev);
> >  	v4l2_async_nf_cleanup(&cam->notifier);
> >  	return ret;
> >  }
> > @@ -1937,7 +1932,6 @@ void mccic_shutdown(struct mcam_camera *cam)
> >  		mcam_free_dma_bufs(cam);
> >  	v4l2_ctrl_handler_free(&cam->ctrl_handler);
> >  	v4l2_async_nf_unregister(&cam->notifier);
> > -	v4l2_device_unregister(&cam->v4l2_dev);
> >  	v4l2_async_nf_cleanup(&cam->notifier);
> >  }
> >  EXPORT_SYMBOL_GPL(mccic_shutdown);

-- 
Kind regards,

Sakari Ailus
