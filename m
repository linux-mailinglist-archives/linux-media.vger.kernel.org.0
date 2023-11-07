Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5535C7E3FC0
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 14:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjKGNKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 08:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbjKGNJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 08:09:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA93C23601
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 04:36:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03A23552;
        Tue,  7 Nov 2023 13:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699360559;
        bh=SyjPvo2nE0shK6MtumdB6CSufLxzNO9WpIPz3Ebrr2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGO/fU6AjYdWA14jyW57KA5oyE+xEWdddzWQHoXQfLABsAhRpo60LkOht0zcgovAH
         n/UV4euksNG28H33i1cfOeQ3vkfi6vYz/+AIdjkeqmI4nwbjuxFdsz/u/nIJ4SeZXy
         nKjWiKqHSgzASgoTnsfNGuHVI7xzw+jvNZqk4zVU=
Date:   Tue, 7 Nov 2023 14:36:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/9] staging: vc04_services: Do not pass NULL to
 vchiq_log_error()
Message-ID: <20231107123627.GB3051@pendragon.ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231107122551.GA3051@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 07, 2023 at 02:25:52PM +0200, Laurent Pinchart wrote:
> On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
> > vchiq_add_connected_callback() logs using vchiq_log_error() macro,
> > but passes NULL instead of a struct device pointer. Fix it.
> > 
> > vchiq_add_connected_callback() is not used anywhere in the vc04_services
> > as of now. It will be used when we add new drivers(VC shared memory and
> > bcm2835-isp), hence it kept as it is for now.
> > 
> > Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
> >  .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > index b3928bd8c9c6..21f9fa1a1713 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > @@ -27,7 +27,7 @@ static void connected_init(void)
> >   * be made immediately, otherwise it will be deferred until
> >   * vchiq_call_connected_callbacks is called.
> >   */
> > -void vchiq_add_connected_callback(void (*callback)(void))
> > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> 
> You're changing the prototype of the function, but the patch doesn't
> update any user. If the function is unused, it looks like you can drop
> it instead. Looking at the rest of the vchiq_connected.c file, I think
> you can actually drop the whole file.

Except that the vc-sm-cma driver will use it. I'm curious though, that
driver will have no way to acquire a pointer to a vchiq_device, so I
don't see how this will be usable. pr_err() may be a better pick here.

> >  {
> >  	connected_init();
> >  
> > @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void))
> >  		callback();
> >  	} else {
> >  		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> > -			vchiq_log_error(NULL, VCHIQ_CORE,
> > +			vchiq_log_error(&device->dev, VCHIQ_CORE,
> >  					"There already %d callback registered - please increase MAX_CALLBACKS",
> >  					g_num_deferred_callbacks);
> >  		} else {
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > index 4caf5e30099d..e4ed56446f8a 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > @@ -1,10 +1,12 @@
> >  /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> >  /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> >  
> > +#include "vchiq_bus.h"
> > +
> >  #ifndef VCHIQ_CONNECTED_H
> >  #define VCHIQ_CONNECTED_H
> >  
> > -void vchiq_add_connected_callback(void (*callback)(void));
> > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> >  void vchiq_call_connected_callbacks(void);
> >  
> >  #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
