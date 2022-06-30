Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5CE4560E4F
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 02:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiF3AvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 20:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbiF3AvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 20:51:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55BB40903
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 17:51:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 299FA59D;
        Thu, 30 Jun 2022 02:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656550275;
        bh=I+E677ZTEQSWmwn7f6B2xfiyOv/i5Ih4ZR08Oqq/GQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dveQDGkf5+Pw0su6nouy1jbA1TBFCviCOLBBTtH8WkTY4xxfLShOS/FZQHLSDAFEk
         jIKjC5snCSiIzvBwUZqmB//w6S0C5MhKA0eBm+mWjramFqEEfIba3Sf5qbQ21rKrLA
         owAM3yx4XSERMmTupkfEpM1zhAsDJQxxWYI9YIO8=
Date:   Thu, 30 Jun 2022 03:50:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
 <YrwRROJbH/P5lYi+@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrwRROJbH/P5lYi+@carbon.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On Wed, Jun 29, 2022 at 11:45:56AM +0300, Petko Manolov wrote:
> On 22-06-29 11:28:26, Laurent Pinchart wrote:
> > On Wed, Jun 29, 2022 at 10:55:43AM +0300, Petko Manolov wrote:
> > > 	Hi guys,
> > > 
> > > First, i'd like to apologize for the noise and sending this email directly.
> > 
> > Your support request is directed to the linux-media mailing list, CC'ing
> > appropriate developers is a good practice to make sure we notice, there's
> > nothing to apologize for.
> 
> Well, it could still be annoyance.
> 
> > > I am trying to hook Sony IMX492 sensor to v5.10 imx8m-mini based platform.
> > > The capture driver does not support Bayer GBRG 10 and 12bit pixel format, so
> > > i had to add these.  I also stumbled upon a bug in mx6s_capture.c which, i
> > > assume, is completely out of interest here as it's related to a vendor tree.
> > 
> > I'm surprised you stumbled upon one bug only :-) I always advise to stay away
> > from BSP code as much as possible.
> 
> I am certain there is a bunch of these, but this particular one was hard not to
> notice immediately, being NULL pointer dereference. :)
> 
> > > I got as far as sensor is registering with the capture mipi csi driver and,
> > > if HW is properly set up on both sides, should be streaming.  While my
> > > confidence is pretty high about the IMX492 setup i can't say the same about
> > > the recipient part.
> > > 
> > > So here is my question: how stable are NXP's MIPI CSI2 and CSI2 bridge
> > > drivers in v5.18?  Would it be better to switch to this version instead of
> > > hacking madly at the v5.10 vendor code?
> > 
> > I consider them more stable than the vendor code. If there are issues there,
> > we can help fixing them.
> 
> I might be mistaken, but at least in terms of media drivers code in NXP's 5.18
> seems either pretty close to mainline or maybe the same.  What's your advice,
> shall i use their (5.18.x+fslc) branch or take only the device-tree, if needed?

For an i.MX8MM I'd try running the mainline kernel directly. If that
doesn't work, I would backport the camera drivers from mainline to the
v5.15 NXP kernel. As far as I know, the v5.18 branch isn't an official
BSP release (I'm actually not sure what it's for).

> > > I've already published the code here.  Once the development is done the
> > > intent is to mainline Sony IMX492 sensor driver.
> > 
> > That's great ! I'm looking forward to that.
> 
> Sure, that's the goal here.

-- 
Regards,

Laurent Pinchart
