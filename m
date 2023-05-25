Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8EB37107C2
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 10:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbjEYIlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 04:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239928AbjEYIlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 04:41:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C8A194
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 01:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685004063; x=1716540063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r+E0uOmZ2oXUYp3z57pK1sgtVAHuSu42zmMc4A9SwxA=;
  b=XYODi7Nhryb9Ij8pDaXFnXuc+yjvYmNsju5bO2QvpWTpTJRpIKrKFe0B
   VC2+l4pYvi8kTkCLgN6OsVEm5gMtOq2MScOk+RspCDympj9g/3VCCv6fV
   phLmQugfqFHo7Jzk1i2oLiE4uQ/Y1enEGV/gEKiylwaNLXmFeTUHt0TGC
   9zAx1kD9aPShHT07ZX2sB2BREGlcbZEXd2HqTIThrUAyV1XV09J83EV3d
   hz5JjOo7ASdpZVsBhlQXlz2Uq7OBWJkRErBBuN0QNUlOFQaJzmC1XUdMc
   Sbe95NR4v0Y0Xu5B92D3qKsisy1CRO4QFn42YuUa+3LWannDxRAzCXnHV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356177625"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="356177625"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 01:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704719446"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="704719446"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 01:41:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 8631B120E86;
        Thu, 25 May 2023 11:40:57 +0300 (EEST)
Date:   Thu, 25 May 2023 08:40:57 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v3 00/32] Separate links and async sub-devices
Message-ID: <ZG8fGVGjuSFbSCaG@kekkonen.localdomain>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
 <edcc27d84e0bade5ccb40d4b677d54603d11aa65.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edcc27d84e0bade5ccb40d4b677d54603d11aa65.camel@pengutronix.de>
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

Hi Philipp,

On Wed, May 24, 2023 at 02:58:08PM +0200, Philipp Zabel wrote:
> Hi Sakari,
> 
> On Mi, 2023-05-24 at 14:23 +0300, Sakari Ailus wrote:
> > Hi all,
> > 
> > This set adds support for multiple downstream links in an async
> > sub-device, by separating the sub-device registration from the link
> > creation.
> > 
> > A new concept, V4L2 async connection is added. A connection later on
> > translates to an MC ancillary or data link. Generally async notifiers have
> > a number of connections but at that level there is no knowledge of how
> > many sub-devices they will connect to. The bound and unbound callbacks now
> > work on connections. For the existing drivers there's only one connection
> > so I do not expect regressions because of that.
> > 
> > Async sub-device fwnode matching will now take place between the device
> > (the dev field of struct v4l2_subdev) and a struct v4l2_async_connection
> > (an endpoint for devices that have endpoints or the device for those that
> > do not). This is because the graph data structure only describes
> > point-to-point connections so therefore defining one end of the connection
> > defines the entire connection.
> > 
> > This set is unlikely to address all needs people have related to the async
> > framework but I think that beyond what it does, it paves some way for
> > addressing more of those additional needs.
> > 
> > To be frank, I'd like to get rid of the entire V4L2 async framework, but
> > it would require allowing much more dynamic driver initialisation,
> > including sub-devices and device nodes popping up in the system in the
> > order and extent there is successfully probed hardware. Until that, and
> > this may well be the entire foreseeable future, we have at least some of
> > this complexity.
> > 
> > I didn't add the Tested-by: tags I got for v2 as there are significant
> > changes, albeit only for better I hope. :-) Niklas has also tested this on
> > rcar-vin + adv746x, it works now while on v2 it did not. So having also
> > this version validated on i.MX6 would be nice.
> 
> Still works on i.MX6QP with TC358743.
> 
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp

Thanks a lot for testing again!

-- 
Regards,

Sakari Ailus
