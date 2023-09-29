Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57B297B32AC
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 14:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2Mhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 08:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjI2Mhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 08:37:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0073C1AB
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695991071; x=1727527071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+WhCeRqyDH33syhbPgRCoXHlPA+3RlSCemXlHn6xBCs=;
  b=cfnYVAZHdiukglWuzkYLpbLOqRAOsovVhPVevL7vj7rnOMbV0M+pJ/93
   9RqDIP5RXsYTOTLOlAkvjVm5mJFYl/Z/sb/QxM9NO31pXE6opyfVTiQXi
   fkbK4c0SdxeqdtSy8bTvD1VpbISov60xHn6Y3NnFIgtWnLnFf5ODP9Y3p
   YTUIfm2UKGMsc7we2akgEpxgeooiYjdcLjeRvT+3nPEzian3/75clRGkK
   wj1YWmhUtb4Yn0MTYxlJddnuds8sYyytuM7o9JVcorVzqeGC/AxqjCvbQ
   4BWSZnfjpQ/8CO6Ke7laiPCwM2OXHA0DqPRiZWvgxuXwuAcEu8AscQPOm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446446440"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="446446440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726581406"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="726581406"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:37:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4A9EC11FBCE;
        Fri, 29 Sep 2023 15:37:43 +0300 (EEST)
Date:   Fri, 29 Sep 2023 12:37:43 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, hdegoede@redhat.com
Subject: Re: [PATCH 7/7] media: ov2740: Return -EPROBE_DEFER if no endpoint
 is found
Message-ID: <ZRbFF3RujYCBnBI/@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-8-sakari.ailus@linux.intel.com>
 <20230915095027.GH14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915095027.GH14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 15, 2023 at 12:50:27PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 15, 2023 at 10:28:09AM +0300, Sakari Ailus wrote:
> > With ipu bridge, endpoints may only be created when ipu bridge has
> > initialised. This may happen after the sensor driver has first probed.
> 
> That's hard to understand for someone not familiar with the ipu-bridge
> driver. Could you please expand the commit message ?
> 
> Also, is there a way to avoid the ov2740 probing before the required
> initialization is complete ?

One possibility would be to move the ipu bridge functionality to the ACPI
framework itself. Then it'd be independent of probing any drivers. It
hasn't been discussed and I'm not sure what the result might be. In any
case I'd like to have DisCo for Imaging support there first.

Cc Hans.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov2740.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index de39a66b1b81..a132e8a283b4 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -976,7 +976,7 @@ static int ov2740_check_hwcfg(struct device *dev)
> >  
> >  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >  	if (!ep)
> > -		return -ENXIO;
> > +		return -EPROBE_DEFER;
> >  
> >  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> >  	fwnode_handle_put(ep);
> 

-- 
Regards,

Sakari Ailus
