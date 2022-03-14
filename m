Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695134D8E8D
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 22:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245217AbiCNVMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 17:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235370AbiCNVMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 17:12:35 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51897FD28
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647292285; x=1678828285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H3a0aLd+4dD9Z06hu5MXcDCGl14Dp3xjuGfVwTx367o=;
  b=fxnV+O+l8Ap+UKr2GRY0xiBVLRg6+//9vWGZ7zBNmbkg39OoaS9B23Fk
   NW58tpmLhYPpzFKTHP1uRhaFcT2+NFTqR4ARc6mc2sKdQNyxCUW8gWlPX
   z+swJEy3FwP/oMwNJueCwxR2hjD40Y3IagDyf7MvbBzdlA+EqgWbf0sRw
   0dV5Yq2Y+xzRHvwdRwD3BRtWlzsE0zQww+ZUZR13jJervQJbrRIWWwlBd
   LL0mY3aYBBI6BwVOJUychTX5/gTQg4ps+GI4eerMzgM/Y8uF6s7GADBVC
   GlsJOuBiOApfSuT0ce1cfcWmHj54IEAs1S8VYOLma01Ei0ja9mMVM16VL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243595787"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="243595787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 14:11:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="556620131"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 14:11:20 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id CB54520676;
        Mon, 14 Mar 2022 23:11:18 +0200 (EET)
Date:   Mon, 14 Mar 2022 23:11:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <Yi+vdvMeXqb/BvKo@paasikivi.fi.intel.com>
References: <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
 <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
 <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
 <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com>
 <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
 <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
 <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Mar 14, 2022 at 10:05:37PM +0200, Laurent Pinchart wrote:
...
> > > Yes, after reading the version register (or doing any other harware
> > > access). Actually the full code would be
> > > 
> > > 
> > >  	pm_runtime_enable(dev);
> > >  	pm_runtime_resume_and_get(dev);
> > > 
> > > 	/* Hardware access */
> > > 
> > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > 	pm_runtime_use_autosuspend(dev);
> > > 	pm_runtime_put_autosuspend(dev);
> > > 
> > > (plus error handling).
> > > 
> > > If the probe function doesn't need to access the hardware, then
> > > the above becomes
> > > 
> > > 	pm_runtime_enable(dev);
> > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > 	pm_runtime_use_autosuspend(dev);
> > > 
> > > instead of having to power up the device just in case !PM.
> > > 
> > > > Also the latter only works on DT-based systems so it's not an option for
> > > > most of the drivers.
> > > 
> > > How so, what's wrong with the above for ACPI-based system ?
> > 
> > I²C devices are already powered on for probe on ACPI based systems.
> 
> Not through RPM I suppose ?

Runtime PM isn't involved, this takes place in the ACPI framework (via
dev_pm_domain_attach() called in i2c_device_probe()).

-- 
Regards,

Sakari Ailus
