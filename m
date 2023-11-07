Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B987E3F46
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 13:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjKGMwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 07:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234621AbjKGMwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 07:52:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4AC45903
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 04:38:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8672A552;
        Tue,  7 Nov 2023 13:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699360673;
        bh=qGyrRNsx+Ar7l7XICMuNQueoESk81EWoFZ+G3rOQR6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QbV9jX/94Nszyys6nt47rXj50EVggLGXPgnQk4v/fu4uK5dCeIfS4516NEPPoUw/V
         39DexljXLFOR7Ji7wI44k8qGbOFYCvniK6ZDqpOXiAqLLHDsIm6057Y3FMYERaUunF
         dqcwIS3ij19sOTetuLCrq7l6ZD93U16vsX0rIOVY=
Date:   Tue, 7 Nov 2023 14:38:22 +0200
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
Message-ID: <20231107123822.GC3051@pendragon.ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
 <4a5f6ae3-2a1f-f708-d9e0-fad4f5b60a43@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a5f6ae3-2a1f-f708-d9e0-fad4f5b60a43@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 07, 2023 at 06:01:58PM +0530, Umang Jain wrote:
> On 11/7/23 5:55 PM, Laurent Pinchart wrote:
> > On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
> >> vchiq_add_connected_callback() logs using vchiq_log_error() macro,
> >> but passes NULL instead of a struct device pointer. Fix it.
> >>
> >> vchiq_add_connected_callback() is not used anywhere in the vc04_services
> >> as of now. It will be used when we add new drivers(VC shared memory and
> >> bcm2835-isp), hence it kept as it is for now.
> >>
> >> Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
> >> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >> ---
> >>   .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
> >>   .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
> >>   2 files changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> index b3928bd8c9c6..21f9fa1a1713 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> @@ -27,7 +27,7 @@ static void connected_init(void)
> >>    * be made immediately, otherwise it will be deferred until
> >>    * vchiq_call_connected_callbacks is called.
> >>    */
> >> -void vchiq_add_connected_callback(void (*callback)(void))
> >> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> >
> > You're changing the prototype of the function, but the patch doesn't
> > update any user. If the function is unused, it looks like you can drop
> > it instead. Looking at the rest of the vchiq_connected.c file, I think
> > you can actually drop the whole file.
> 
> I mentioned in the commit message of this patch. There will be users in 
> the near future.

Yes sorry I missed it, I should have read it more carefully. My fault.

> >>   {
> >>   	connected_init();
> >>   
> >> @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void))
> >>   		callback();
> >>   	} else {
> >>   		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> >> -			vchiq_log_error(NULL, VCHIQ_CORE,
> >> +			vchiq_log_error(&device->dev, VCHIQ_CORE,
> >>   					"There already %d callback registered - please increase MAX_CALLBACKS",
> >>   					g_num_deferred_callbacks);
> >>   		} else {
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> index 4caf5e30099d..e4ed56446f8a 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> @@ -1,10 +1,12 @@
> >>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> >>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> >>   
> >> +#include "vchiq_bus.h"
> >> +
> >>   #ifndef VCHIQ_CONNECTED_H
> >>   #define VCHIQ_CONNECTED_H
> >>   
> >> -void vchiq_add_connected_callback(void (*callback)(void));
> >> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> >>   void vchiq_call_connected_callbacks(void);
> >>   
> >>   #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
