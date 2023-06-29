Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381DD742A97
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 18:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjF2QXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjF2QXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 12:23:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF269359B
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 09:23:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-58-109.reb.o2.cz [85.160.58.109])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DE6E836;
        Thu, 29 Jun 2023 18:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688055769;
        bh=BXjyd9U9mTsPUBT7BwSQnM4leaJRSprhw4ymtKwH0nA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r4pUZ0DLJdmtUAwfV0l0h8DP+7sSRUeAiuL29EjHhrPdTw/CPeWYHHEJlJOUSMrPj
         NiVNrRJXT7iLmcCXbQ9owJDZJEoZs01vejIM9aae9RXpXxT7ausfxA836pqi0uB9VB
         a3EqP2YgjsGK1ROqnoY7x3b4paJ4NWJBSjIr7N9U=
Date:   Thu, 29 Jun 2023 19:23:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <20230629162330.GC12476@pendragon.ideasonboard.com>
References: <20230629122648.924600-1-sakari.ailus@linux.intel.com>
 <20230629161829.GB12476@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629161829.GB12476@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 29, 2023 at 07:18:29PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 29, 2023 at 03:26:48PM +0300, Sakari Ailus wrote:
> > Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> > also adds the options to drivers that don't specifically need them, these
> > are still seldom used drivers using old APIs. The upside is that these
> > should now all compile --- many drivers have had missing dependencies.
> > 
> > The "menu" is replaced by selectable "menuconfig" to select the needed
> > V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> > 
> > Also select MEDIA_CONTROLLER which VIDEO_V4L2_SUBDEV_API effectively
> > depends on.
> > 
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Select MEDIA_CONTROLLER, don't depend on it.
> > 
> >  drivers/media/i2c/Kconfig | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 815c83135021c..c7ffaa79abeb9 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -25,8 +25,15 @@ config VIDEO_IR_I2C
> >  # V4L2 I2C drivers that are related with Camera support
> >  #
> >  
> > -menu "Camera sensor devices"
> > -	visible if MEDIA_CAMERA_SUPPORT
> > +menuconfig VIDEO_CAMERA_SENSOR
> > +	bool "Camera sensor devices"
> > +	depends on MEDIA_CAMERA_SUPPORT
> > +	select MEDIA_CONTROLLER
> > +	select V4L2_FWNODE
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	default y
> > +
> > +if VIDEO_CAMERA_SENSOR
> 
> Shouldn't you then remove the MEDIA_CONTROLLER, V4L2_FWNODE and
> VIDEO_V4L2_SUBDEV_API selection from individual drivers' Kconfig entries
> ?

I've read your reply to Hans in v1. I'm fine doing it in a separate
patch, but could it be bundled in the same series ?

> >  config VIDEO_APTINA_PLL
> >  	tristate
> > @@ -810,7 +817,7 @@ config VIDEO_ST_VGXY61
> >  source "drivers/media/i2c/ccs/Kconfig"
> >  source "drivers/media/i2c/et8ek8/Kconfig"
> >  
> > -endmenu
> > +endif
> >  
> >  menu "Lens drivers"
> >  	visible if MEDIA_CAMERA_SUPPORT

-- 
Regards,

Laurent Pinchart
