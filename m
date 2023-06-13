Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AB872E483
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 15:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242474AbjFMNnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242492AbjFMNnt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 09:43:49 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25BD1730
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686663815; x=1718199815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUMNHIoCVIxk7OM6BFFeDhN4Kd5yVJjQeZqTCf9iF1E=;
  b=ZSKR//uIy8oter7lG9XJ4mGvBnsfjpQxzolmIMR6qaqdQ0bDl+57bzLI
   felR2aDVh6Drvk/uEB+RdOSM7UWR4IMiv+4HyV7b/V3MzSzW3a1MJKtqC
   +Y6VpVtlvJZxXLGHL191/txcbclLS+g93e5QTAmpY/RFQVlaED3VAxTZO
   wb+wZLM7rHeJon6tYSwzEXtpj1H7Z0IuLle7yInMS7+I9bH3BWdN0rBDo
   Xg5pFpCFfmr1PD5NqLzcgHJp4K6ykjBrEYNpKUZfDlo/EiV4Ul+O2OgwF
   /1b0sVGKJ/F4hvqpppaCnkiN5B38IJbcLWzelqowDnUEPloffKG73DJX3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444705174"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="444705174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705806166"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="705806166"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:43:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CC0AC11F9D2;
        Tue, 13 Jun 2023 16:43:24 +0300 (EEST)
Date:   Tue, 13 Jun 2023 13:43:24 +0000
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
Subject: Re: [RESEND PATCH v3 02/32] media: Documentation: v4l: Document
 missing async subdev function
Message-ID: <ZIhyfH5BCKouJ4mr@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-3-sakari.ailus@linux.intel.com>
 <20230530021443.GB21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530021443.GB21633@pendragon.ideasonboard.com>
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

On Tue, May 30, 2023 at 05:14:43AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:45PM +0300, Sakari Ailus wrote:
> > Also v4l2_async_nf_add_fwnode() may be used to add an async sub-device
> > descriptor to a notifier. Document this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/v4l2-subdev.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 602dadaa81d86..ce8e9d0a332bc 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -204,9 +204,9 @@ that the bridge device needs for its operation. Several functions are available
> >  to add subdevice descriptors to a notifier, depending on the type of device and
> >  the needs of the driver.
> >  
> > -:c:func:`v4l2_async_nf_add_fwnode_remote` and
> > -:c:func:`v4l2_async_nf_add_i2c` are for bridge and ISP drivers for
> > -registering their async sub-devices with the notifier.
> > +:c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
> > +:c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
> 
> The 'and' isn't in the right place. With this fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks. Same below. Joe's word wrap sometimes does little tricks...

> > +:c:with the notifier.
> >  
> >  :c:func:`v4l2_async_register_subdev_sensor` is a helper function for
> >  sensor drivers registering their own async sub-device, but it also registers a

-- 
Regards,

Sakari Ailus
