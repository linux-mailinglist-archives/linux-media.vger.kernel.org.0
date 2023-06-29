Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3919742B16
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 19:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjF2RTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 13:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjF2RT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 13:19:28 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C943596
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688059167; x=1719595167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pfq0HxNEjP2diMh3jIGc3fn7ia43IXmcpiUdGPYgsac=;
  b=jVF3XPfbtP3vAHdP42HfZcWA+HYkjikcwMbiVerkiQCB26GsG7ClMGZD
   uNsOnKZlBXKKTO7Cldp62dM7k3/HS17W1+xQApWFM3PRAPx7bXCOgDfnZ
   nRGAWxWE4JUCGwni8/gA5dL9D1I9poFTAuLdMuoENeSkmUIvCt001xoCA
   UpkdqP6Fhft80GURZVsTHEE7OughJfBhQ9HTMVqSJe/+GFKqcFexPt0cK
   byMzmwQH+40PeR/7Mhl1E+9uPHitosRir9ux5DqBaB2KtBvR+rchWHEhe
   aW6FAaUN4SYXDr2wlWTs42R8fkKUWaDEifu1F6fBesMqf7vs8D+2hDYEy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="425858070"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="425858070"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 10:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891475443"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="891475443"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 10:19:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 766551206E6;
        Thu, 29 Jun 2023 20:19:22 +0300 (EEST)
Date:   Thu, 29 Jun 2023 17:19:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <ZJ29GtYlX0e3POgo@kekkonen.localdomain>
References: <20230629122648.924600-1-sakari.ailus@linux.intel.com>
 <20230629161829.GB12476@pendragon.ideasonboard.com>
 <20230629162330.GC12476@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629162330.GC12476@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 29, 2023 at 07:23:30PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 29, 2023 at 07:18:29PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Jun 29, 2023 at 03:26:48PM +0300, Sakari Ailus wrote:
> > > Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> > > also adds the options to drivers that don't specifically need them, these
> > > are still seldom used drivers using old APIs. The upside is that these
> > > should now all compile --- many drivers have had missing dependencies.
> > > 
> > > The "menu" is replaced by selectable "menuconfig" to select the needed
> > > V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> > > 
> > > Also select MEDIA_CONTROLLER which VIDEO_V4L2_SUBDEV_API effectively
> > > depends on.
> > > 
> > > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > since v1:
> > > 
> > > - Select MEDIA_CONTROLLER, don't depend on it.
> > > 
> > >  drivers/media/i2c/Kconfig | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 815c83135021c..c7ffaa79abeb9 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -25,8 +25,15 @@ config VIDEO_IR_I2C
> > >  # V4L2 I2C drivers that are related with Camera support
> > >  #
> > >  
> > > -menu "Camera sensor devices"
> > > -	visible if MEDIA_CAMERA_SUPPORT
> > > +menuconfig VIDEO_CAMERA_SENSOR
> > > +	bool "Camera sensor devices"
> > > +	depends on MEDIA_CAMERA_SUPPORT
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_FWNODE
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	default y
> > > +
> > > +if VIDEO_CAMERA_SENSOR
> > 
> > Shouldn't you then remove the MEDIA_CONTROLLER, V4L2_FWNODE and
> > VIDEO_V4L2_SUBDEV_API selection from individual drivers' Kconfig entries
> > ?
> 
> I've read your reply to Hans in v1. I'm fine doing it in a separate
> patch, but could it be bundled in the same series ?

Sure. I'll add cc to stable --- I have opes it applies to at least most
recent stable trees. As this hasn't been reported until now, I wouldn't
really worry the earlier ones.

-- 
Sakari Ailus
