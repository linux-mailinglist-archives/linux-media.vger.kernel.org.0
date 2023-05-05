Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A886F7C75
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 07:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjEEFiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 01:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEEFh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 01:37:59 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7442411B76
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683265078; x=1714801078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jVZnykSRCjTw3ZkY47aWRHXYxYSJAsL6WhFZ4OTnre8=;
  b=FQLL5E86EYTo78XEVel3yZ8wpE2hXUGTahMCq54nTs3itCIs9WnccA6h
   bpknLAsRV4LXNP2uEb8zIX+6yHKAVbKST1rzNKhX5sxIojTRtcjEXxlK6
   Bz0/iw/GFExqoKPFBXyPwk5zDBjUYIIZqh7ozn4SzQQzEdvzdMiNeQTI+
   EB0I7Fq+vT3zwUe1McRhMIhGQ/l0C7GmALhZ6xQy4vrt8HVJRjLJdC8bF
   wOGuESPkSGRnlx17lKlIzf7NvW4Xdqa6r+OTWrFV6rBOwxgM5EwDCyeE3
   RhzdrRq6YC6CmYnctLnNHz7SklQopX/8a/GtNtIyWttD8g/tBm8XXdOWq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414666600"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="414666600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 22:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="809072461"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="809072461"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 22:37:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5A07A1205F7;
        Fri,  5 May 2023 08:37:53 +0300 (EEST)
Date:   Fri, 5 May 2023 08:37:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: ov5670: Fix conditions for clock access
Message-ID: <ZFSWMYjiUSo2YzLT@kekkonen.localdomain>
References: <20230502125150.720051-1-sakari.ailus@linux.intel.com>
 <wbs5vvxshzludcyopgwbsr6sj2m4wnkwa4jyseb7fgspoy636k@4sg4hv4h6c6c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wbs5vvxshzludcyopgwbsr6sj2m4wnkwa4jyseb7fgspoy636k@4sg4hv4h6c6c>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, May 03, 2023 at 09:25:37AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, May 02, 2023 at 03:51:50PM +0300, Sakari Ailus wrote:
> > Leftovers from the earlier fix. Fix also the conditions for reading the
> > clock-frequency property as well as accessing the clock.
> >
> > Fixes: 8df08ba4a331 ("media: ov5670: Fix probe on ACPI")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov5670.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index c5e783a06f06c..5437cf32a7b3a 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -2661,9 +2661,9 @@ static int ov5670_probe(struct i2c_client *client)
> >  	}
> >
> >  	ov5670->xvclk = devm_clk_get_optional(&client->dev, NULL);
> > -	if (!IS_ERR_OR_NULL(ov5670->xvclk))
> > +	if (!IS_ERR(ov5670->xvclk))
> 
> Can't clk_get_optional() return NULL in the case the clock source is not
> available ?
> 
> Also, if !CONFIG_HAVE_CLK devm_clk_get_optional() returns 0.

Correct. And in that case the clock-frequency property should be read
instead.

> 
> I would then keep the _OR_NULL() part
> 
> >  		input_clk = clk_get_rate(ov5670->xvclk);
> > -	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> > +	else if (!ov5670->xvclk)
> 
> While here it's probably correct, we only want to read
> "clock-frequency" if xvclk == NULL (when either the clock providere is
> not there, or !CONFIG_HAVE_CLK)
> 
> >  		device_property_read_u32(&client->dev, "clock-frequency",
> >  					 &input_clk);
> >  	else
> 
> Everything else is an error (in example, -EPROBE_DEFER)
> 

-- 
Regards,

Sakari Ailus
