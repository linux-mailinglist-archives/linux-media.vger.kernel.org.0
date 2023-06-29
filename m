Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A49474228D
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 10:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbjF2IrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 04:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbjF2Ipg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 04:45:36 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D8C3C19
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688028289; x=1719564289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=74vD6Ubq8qEy/PAZkBZe3POD4ajzcvyVW1s+jZKt3C8=;
  b=RNPq5J3hEYbN41tLNe/Rcm2rdUATmoOv5ILOvXJKmo9lE6KZWRCEgw1I
   o80Prl2VAkYMEB3c1EdZDCpU/xWZT34aF5rTsEFmIJ/hfc53h+U8lY1Es
   2osj51lqK95NsKFHypVI/FKE7m+z2g84UYjWNLk09jb8WwE+H6Cws+rPi
   43uB3HsqCNBSqkBSN7Os9Jm53tIHBEihtR+t43G/fbcOs/l4OVlLsJpfu
   0+5Vbcki6dM5BCUh8aBTsJfA4M7P3Q68ZJlEYzRxlUKbzdJPeU8voyG74
   giFpivDYndevhilVIWUj/mROhf34s7DXms5bYhNGZAuYaxoqjbXac6Qgr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="428076408"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="428076408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="667428238"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="667428238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:44:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EF381209CA;
        Thu, 29 Jun 2023 11:44:38 +0300 (EEST)
Date:   Thu, 29 Jun 2023 08:44:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
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
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v4 35/38] media: davinci: Init async notifier after
 registering V4L2 device
Message-ID: <ZJ1EdsnaSEKKTC6x@kekkonen.localdomain>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
 <20230622114028.908825-36-sakari.ailus@linux.intel.com>
 <CA+V-a8tH3SzG6wr6oznap2Z3Y3H5i67W51Kpk5CbndTb7ARcPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tH3SzG6wr6oznap2Z3Y3H5i67W51Kpk5CbndTb7ARcPg@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Jun 26, 2023 at 04:36:12PM +0100, Lad, Prabhakar wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 22, 2023 at 12:41 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Initialise the V4L2 async notifier after registering the V4L2 device, just
> > before parsing DT for async sub-devices. This way the device can be made
> > available to the V4L2 async framework from the notifier init time onwards.
> > A subsequent patch will add struct v4l2_device as an argument to
> > v4l2_async_nf_init().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> > Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
> > Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
> > ---
> >  .../media/platform/ti/davinci/vpif_capture.c    | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> > index a63c9e51dac41..9b97e26be0892 100644
> > --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> > +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> > @@ -1608,18 +1608,12 @@ static __init int vpif_probe(struct platform_device *pdev)
> >         int res_idx = 0;
> >         int i, err;
> >
> > -       pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
> > -       if (!pdev->dev.platform_data) {
> > -               dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
> > -               return -EINVAL;
> > -       }
> > -
> >         vpif_dev = &pdev->dev;
> >
> >         err = initialize_vpif();
> >         if (err) {
> >                 v4l2_err(vpif_dev->driver, "Error initializing vpif\n");
> > -               goto cleanup;
> > +               return err;
> >         }
> >
> >         err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
> > @@ -1655,6 +1649,12 @@ static __init int vpif_probe(struct platform_device *pdev)
> >                 goto vpif_unregister;
> >         }
> >
> > +       pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
> Just a couple of lines above we reference pdev->dev.platform_data
> while assigning it to vpif_obj.config, so this has to be moved prior
> to assigning vpif_obj.config.

Thanks. I had missed this --- very seldom this is used for anything else in
probe than setting up the notifier.

> 
> > +       if (!pdev->dev.platform_data) {
> > +               dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
> unrelated to this patch maybe we can drop the extra space after data.  Giving..

I'll address this for v5.

-- 
Sakari Ailus
