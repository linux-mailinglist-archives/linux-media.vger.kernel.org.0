Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78FC7316B3
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343858AbjFOLcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343882AbjFOLcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:32:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BC52729
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686828715; x=1718364715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5XabdGWRoStDFRdEF/cJEKpWRLTh1mtqg+z5Z5j6P3w=;
  b=J5q6IfmZ5ojz93OyGv8asGDNOK71fl0MCL22ui7dGajQjEpFm2F6qLHw
   OHBs2jONVfjDfoSc/XcnNs5YAhto4fgs3KEv1m9te8zmHdf3FcmYAGG1Y
   iuh2gNMEsZMgAZyqHKUY8YDJ4PtysrqRUA2uTJpjdLF9YhffWBnsVBqOy
   ZN9zX3L29iBqXtVB7BqfAhZ20YXXINDNLPh6T8bXSR5Sj3E0FDWaSCJPT
   AVA0pBcBcSrqxdttHW8TTuK6390cut0jMOQVoaCLUjJh3O6dz8CH7uzMG
   NuPzblIfAqqRQLVeDlL+o1JTt83XbktypQlmiOJaO6/fD8cx22wrMuEiL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424776344"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="424776344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689751156"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="689751156"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:31:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 676FF1202B5;
        Thu, 15 Jun 2023 14:31:49 +0300 (EEST)
Date:   Thu, 15 Jun 2023 11:31:49 +0000
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        hverkuil@xs4all.nl
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
Message-ID: <ZIr2pVlcWtFW0NQf@kekkonen.localdomain>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
 <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
 <813f8b84-4737-3898-24eb-30099ffb6043@redhat.com>
 <ZIojWLapfr/pBeQH@kekkonen.localdomain>
 <20230614212257.GB20723@pendragon.ideasonboard.com>
 <20230614212345.GC20723@pendragon.ideasonboard.com>
 <ZIrKW7WMv2rpwiCq@kekkonen.localdomain>
 <20230615091353.GD741@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615091353.GD741@pendragon.ideasonboard.com>
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

On Thu, Jun 15, 2023 at 12:13:53PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jun 15, 2023 at 08:22:51AM +0000, sakari.ailus@linux.intel.com wrote:
> > On Thu, Jun 15, 2023 at 12:23:45AM +0300, Laurent Pinchart wrote:
> > > On Thu, Jun 15, 2023 at 12:22:58AM +0300, Laurent Pinchart wrote:
> > > > On Wed, Jun 14, 2023 at 08:30:16PM +0000, sakari.ailus@linux.intel.com wrote:
> > > > > On Wed, Jun 14, 2023 at 06:50:14PM +0200, Hans de Goede wrote:
> > > > > > On 6/14/23 18:05, sakari.ailus@linux.intel.com wrote:
> > > > > > > On Wed, Jun 14, 2023 at 05:47:01PM +0200, Hans de Goede wrote:
> > > > > > >> Hi All,
> > > > > > >>
> > > > > > >> The ov5693 driver uses v4l2_subdev_get_try_crop() /
> > > > > > >> v4l2_subdev_get_try_format() both of which are
> > > > > > >> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
> > > > > > >>
> > > > > > >> Yet it does not do select VIDEO_V4L2_SUBDEV_API
> > > > > > >> in its Kconfig bits ?
> > > > > > >>
> > > > > > >> Note I've not seen any build errors because of this,
> > > > > > >> I guess we somehow end up getting away with this...
> > > > > > >>
> > > > > > >> But still I think the select should be added ?
> > > > > > > 
> > > > > > > I agree.
> > > > > > > 
> > > > > > > The reason there haven't been compile failures is that there's a vast
> > > > > > > number of sensor drivers that all select this so for a failure you'd need
> > > > > > > to select this one but none of the others.
> > > > > > > 
> > > > > > > I can send a fix.
> > > > > > 
> > > > > > Also see my follow-up email. If we're going to fix this
> > > > > > we really should fix it properly. As mentioned in
> > > > > > my folow-up email an intermediate Kconfig option
> > > > > > might be best.
> > > > > > 
> > > > > > E.g. doing:
> > > > > > 
> > > > > > grep -l v4l2_async_register_subdev drivers/media/i2c/*.c
> > > > > > 
> > > > > > And comparing that to Kconfig finds the following Kconfig
> > > > > > entries lacking a select V4L2_FWNODE / select V4l2_ASYNC
> > > > > > 
> > > > > > VIDEO_IMX208
> > > > > > VIDEO_IMX258
> > > > > > VIDEO_IMX274
> > > > > > VIDEO_IMX319
> > > > > > VIDEO_IMX355
> > > > > > VIDEO_OV6650
> > > > > > VIDEO_OV7740
> > > > > > VIDEO_OV9640
> > > > > > VIDEO_OV9650
> > > > > > 
> > > > > > and I stopped checking after the ov* drivers since I think
> > > > > > the above list makes my point.
> > > > > 
> > > > > Yeah, sometimes difficult to find errors get repeated. Luckily it's "just"
> > > > > a compilation problem.
> > > > > 
> > > > > Using V4L2 fwnode and V4L2 sub-device APIs are still unrelated as such
> > > > > although in practice they do often happen together. There are still quite a
> > > > > few sensor drivers that don't need both of them. Some can be compiled with
> > > > > VIDEO_V4L2_SUBDEV_API disabled, too, but I'm not sure how useful that
> > > > > really is. The rest are probably not usable outside a very specific scope,
> > > > > such as I²C async matching used by a handful of receiver drivers (none use
> > > > > MC, thus no sub-device API either).
> > > > > 
> > > > > Perhaps we could group these in two classes where the common class has
> > > > > V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API selected? I'm not sure having an
> > > > > intermediate, somewhat obscure, option would be helpful.
> > > > > 
> > > > > Also cc Hans and Laurent.
> > > > 
> > > > I'm all for simplifying the current state and removing the need to get
> > > > every Kconfig entry right by moving the dependencies to a common
> > > > location.
> > > 
> > > Also, if sensor drivers are encouraged to use new APIs, but not all of
> > > them have been converted, I'd be fine selecting the new APIs
> > > unconditionally even if no selected sensor driver uses them.
> > 
> > There are old drivers that do not need these features and there has been
> > discussion there may be a desire to disable features to make the kernel
> > smaller (for e.g. OpenWRT), however I suspect in this case it's more likely
> > drivers that are little used.
> 
> Just to be clear, I didn't mean selecting V4L2_FWNODE, V4L2_ASYNC and
> VIDEO_V4L2_SUBDEV_API unconditionally, but when any sensor driver is
> selected. If a device has a camera, memory requirements increase
> significantly and I don't think enabling the above options will make a
> real difference.

How about something like this:

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 256d55bb2b1da..8a6961aafef98 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -25,8 +25,14 @@ config VIDEO_IR_I2C
 # V4L2 I2C drivers that are related with Camera support
 #
 
-menu "Camera sensor devices"
-	visible if MEDIA_CAMERA_SUPPORT
+menuconfig VIDEO_CAMERA_SENSOR
+	bool "Camera sensor devices"
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default y
+
+if VIDEO_CAMERA_SENSOR
 
 config VIDEO_APTINA_PLL
 	tristate
@@ -797,7 +803,7 @@ config VIDEO_ST_VGXY61
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
 
-endmenu
+endif # VIDEO_CAMERA_SENSOR
 
 menu "Lens drivers"
 	visible if MEDIA_CAMERA_SUPPORT

-- 
Regards,

Sakari Ailus
