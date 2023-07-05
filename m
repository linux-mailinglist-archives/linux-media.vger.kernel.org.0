Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6114074844B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 14:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjGEMgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 08:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjGEMge (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 08:36:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1EF113
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688560594; x=1720096594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HksEMew/E0k0rVOL5nTk+5RnrwX02PmRuJVLKNNoN3w=;
  b=GxHAo48VgWNwiexugw3sZsvMVme9BxRyxk0sInUbn2/2uLBkhXASrs51
   gNEwsi7h4gC+u4uq4g2Weq/MbmFjiVTK6sKoJ49Zjf6TVALU8n576d5ea
   AiumWOsDsRKYG0ufs7hKXko7TW1HoLktfiePuE5dyBEgfGq+jfw0QZoBt
   sJznJJ75FIBg3n3fSZfNCUqGo5C5MAZwuySibdsLDXluWyeWedB3vAwl8
   oFVyly4ElBwOcl0G89OQ+kf6T+jDhQBI/tvkiGVy206FO3VKwwB1ST6GY
   rItjHpyWOOPKKxJT9mhkMCJnJoECzxAQn9kDt+8QfO3b/ruw1KhXIV/Oy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366811287"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="366811287"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 05:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784523179"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="784523179"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 05:36:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3EF5511F931;
        Wed,  5 Jul 2023 15:36:29 +0300 (EEST)
Date:   Wed, 5 Jul 2023 12:36:29 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: Stop selecting common features for
 individual camera drivers
Message-ID: <ZKVjzagmYpc6wt/w@kekkonen.localdomain>
References: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
 <20230630140354.111404-3-sakari.ailus@linux.intel.com>
 <20230702150451.GB9285@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702150451.GB9285@pendragon.ideasonboard.com>
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

On Sun, Jul 02, 2023 at 06:04:51PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Jun 30, 2023 at 05:03:54PM +0300, Sakari Ailus wrote:
> > As selecting V4L2_FWNODE, MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API are
> > now selected by the top level menu, they can be dropped from the
> > individual drivers. Also dropped selectng V4L2_ASYNC for a single driver
> 
> s/selectng/selecting/

I'll fix this for v2.

> 
> > as this is already implied by V4L2_FWNODE.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/Kconfig        | 149 -------------------------------
> >  drivers/media/i2c/ccs/Kconfig    |   3 -
> >  drivers/media/i2c/et8ek8/Kconfig |   3 -
> >  3 files changed, 155 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c7ffaa79abeb..d8ea6be924c0 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -44,9 +44,6 @@ config VIDEO_CCS_PLL
> >  config VIDEO_AR0521
> >  	tristate "ON Semiconductor AR0521 sensor support"
> >  	depends on I2C && VIDEO_DEV
> 
> Should VIDEO_DEV also be moved to VIDEO_CAMERA_SENSOR ? Or, even better,
> be dropped ? The I2C drivers shouldn't require it.
> 
> And given that we're in the i2c/ directory, the I2C dependency should
> also be moved to VIDEO_CAMERA_SENSOR. I wonder if we should then rename
> it to VIDEO_I2C_CAMERA_SENSOR.

Makes sense.

CONFIG_RATIONAL is also needed by the ds90ub953 driver, I'll take this into
account for v3.

-- 
Regards,

Sakari Ailus
