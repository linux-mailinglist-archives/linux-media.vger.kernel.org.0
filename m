Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682C57A5F56
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 12:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjISKUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 06:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjISKUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 06:20:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F674F4
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695118825; x=1726654825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4po5FB6qxgI5tFf/ZzFcd7J+HQTIC1ZMvGICybIsSs=;
  b=HGGJzp0395Z6T59SaSro0yxv/qu5zPWswAqwAjrxnN9C/YvCuDQXgDgV
   ssQWK/v7bO9PZO8hEQvz3ms23AXBBYXmIcmTMlc94y8PQ7icCXaHCw+KV
   4F0/C3jZ5SdX434DhJ2+ukjYd5UEDTNOxQaWHhEtEiJOJ6vAbEPtlNsHd
   TJoC+qPxeSeDUW1o6o/vho87QJ/qqM1BOgtrRVnDtpDtBxDIdPnUTnCev
   CheExZDA9uWe0YWBQfYZV19fpRizyCd54wBa1QD8cPTvlv+Gy79cF/Seo
   PcINSi3KjqO1TjvWlW7DI9CFBL1IByDujus1x4ABVwi/nfQQFSWE6Nns1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378799674"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="378799674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695857163"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="695857163"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:20:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C88C6120BE5;
        Tue, 19 Sep 2023 13:11:02 +0300 (EEST)
Date:   Tue, 19 Sep 2023 10:11:02 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 09/12] media: ov2740: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <ZQlztieKQ4SrIjpC@kekkonen.localdomain>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-10-sakari.ailus@linux.intel.com>
 <20230918132455.GD28874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918132455.GD28874@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Sep 18, 2023 at 04:24:55PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Sep 18, 2023 at 03:51:35PM +0300, Sakari Ailus wrote:
> > With ipu bridge, endpoints may only be created when ipu bridge has
> > initialised. This may happen after the sensor driver has first probed.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov2740.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index 2c00e653ec47..ccbb15e730ae 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -976,7 +976,7 @@ static int ov2740_check_hwcfg(struct device *dev)
> >  
> >  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >  	if (!ep)
> > -		return -ENXIO;
> > +		return -EPROBE_DEFER;
> 
> This is fine as a quick fix, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> 
> but I'm thinking that we need better in the long run, for multiple
> reasons:
> 
> - All sensor drivers that support ACPI should do the same, as they
>   shouldn't be aware of platform-specific integration details. This
>   could be done by mass-patching them, with a documentation update to
>   clearly indicate what error code is appropriate. Another option could
>   be to return an error pointer from fwnode_graph_get_next_endpoint(),
>   with the appropriate error being set depending on the platform. Other
>   solutions may be possible too.

I'd like to see IPU bridge in the ACPI framework but that won't happen
overnight. Then this issue would disappear. The problem with the error is
that callers don't expect it and how do you tell if you're expecting
something you don't know about to appear.

> 
> - On OF systems, a DT error will result in probe deferral, which is
>   harder to debug than probe failures. It would be nice to avoid that.

Yes.

I change it for this sensor only as I was otherwise working on it.

-- 
Regards,

Sakari Ailus
