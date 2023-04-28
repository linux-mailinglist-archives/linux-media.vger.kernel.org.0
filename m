Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA4D6F1681
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 13:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjD1LWt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 07:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjD1LWr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 07:22:47 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E270526B9
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682680963; x=1714216963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jk32Ht6AwXBynrexN/ktAra0uehu2lbTuWTXp3xZvPw=;
  b=Q7fbQvJU5z2f+sZaIoc9TdPXBBelwtU2HkiEuLu3TCF7qjgj5SbPxKwz
   hvZzQtSoqtgzEs6yt3lo8woYTZN6nrz2hgEXaTZdOR8+jLHIWmfy9HnXM
   vcPIk/RyEmncEC/jJe/sE7erUQd//VpPjdCC8zCPJ7an+F43gRnQEWa3q
   BNV/sHVLAjyJ61uOtl4oWMEdwYvrNdI0O7Y520uwSRn3FuDcg8Qlbk8qp
   EAJYUMy5GcHKdIh0vf0+4n3ng0OUR2/38NxOC5ZbKxNBAJR19G6m8tMRa
   MoCgR1m8Q9SM5nfcPximi0IiwCpRWpz93rB2/cYcpkqnuCKLJ+R1ToXHN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413107178"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="413107178"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="941065311"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="941065311"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:22:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6C63E11FCA0;
        Fri, 28 Apr 2023 14:22:38 +0300 (EEST)
Date:   Fri, 28 Apr 2023 14:22:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 11/18] media: marvell: cafe: Register V4L2 device earlier
Message-ID: <ZEusfiXTRRIG81jw@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-12-sakari.ailus@linux.intel.com>
 <20230425002711.GB4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425002711.GB4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 03:27:11AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 30, 2023 at 02:58:46PM +0300, Sakari Ailus wrote:
> > Register V4L2 device before the async notifier so the struct device will
> > be available for the notifier.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/marvell/cafe-driver.c | 12 ++++++++++--
> >  drivers/media/platform/marvell/mcam-core.c   |  6 ------
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
> > index dd1bba70bd79..4d8843623255 100644
> > --- a/drivers/media/platform/marvell/cafe-driver.c
> > +++ b/drivers/media/platform/marvell/cafe-driver.c
> > @@ -536,6 +536,11 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  	if (ret)
> >  		goto out_pdown;
> >  
> > +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> > +	if (ret)
> > +		goto out_smbus_shutdown;
> > +
> > +
> >  	v4l2_async_nf_init(&mcam->notifier);
> >  
> >  	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
> > @@ -544,12 +549,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
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
> > @@ -565,6 +570,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  
> >  out_mccic_shutdown:
> >  	mccic_shutdown(mcam);
> > +out_v4l2_device_unregister:
> > +	v4l2_device_unregister(&mcam->v4l2_dev);
> >  out_smbus_shutdown:
> >  	cafe_smbus_shutdown(cam);
> >  out_pdown:
> > @@ -587,6 +594,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
> >  static void cafe_shutdown(struct cafe_camera *cam)
> >  {
> >  	mccic_shutdown(&cam->mcam);
> > +	v4l2_device_unregister(&cam->mcam.v4l2_dev);
> >  	cafe_smbus_shutdown(cam);
> >  	free_irq(cam->pdev->irq, cam);
> >  	pci_iounmap(cam->pdev, cam->mcam.regs);
> > diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> > index b74a362ec075..2ecdcbcb37fd 100644
> > --- a/drivers/media/platform/marvell/mcam-core.c
> > +++ b/drivers/media/platform/marvell/mcam-core.c
> > @@ -1866,10 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
> >  	/*
> >  	 * Register with V4L
> >  	 */
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
> 
> Wouldn't the v4l2_async_nf_* calls be better placed in cafe-driver.c,
> given that v4l2_async_nf_init() is called there too ? Same below.

Probably yes, but I'd like to avoid making unnecessary changes to drivers I
can't test.

> 
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
> 

-- 
Regards,

Sakari Ailus
