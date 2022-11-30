Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED6163DA7A
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 17:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiK3QYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 11:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiK3QYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 11:24:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40A04C246;
        Wed, 30 Nov 2022 08:24:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 613AB55A;
        Wed, 30 Nov 2022 17:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669825441;
        bh=+kP8u20Rg8oQKWkgVocq5AOmfa8+E3ahK7OvCeQkgic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2cXRGAkhZPoW9t8gqabNUjjflNDNYHj8hG+VlqBSQWT0qXS6n91XHmMIP13cikEY
         3WQxDrAZRMWHxBrKHR81DD+Q/KSgGZ/t2/y+1DHgSUxUKXBCx5im+evNDNL+BZaoF2
         VROTKg7eaWcLuG6PIZuujl4wKweNssBvlr9PJRS0=
Date:   Wed, 30 Nov 2022 18:23:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4eDkTTBvxBSxkOn@pendragon.ideasonboard.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
 <Y4d/1xhtwrqgQzvi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4d/1xhtwrqgQzvi@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 06:07:51PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 05:20:11PM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 30, 2022 at 02:52:50PM +0000, Sakari Ailus wrote:
> > > On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
> 
> ...
> 
> > > The privacy LED is separate from sensor, including its power on/off
> > > sequences which suggests it could be at least as well be handled
> > > separately.
> > 
> > And if the privacy LED is controllable through a GPIO, I think it should
> > be turned on at stream on time, not at power on time. That would allow
> > things like reading the OTP data from the sensor without flashing the
> > privacy LED.
> 
> The malicious software may power up camera and drive it via user space /
> separate code flow in the kernel, no?

With correctly written drivers, there should be no way to power up the
camera from userspace through the V4L2 API without starting streaming.
Also, programming the camera sensor won't be enough to capture images,
you need to deal with all the other camera-related IP cores which are
controlled through V4L2, and doing so will start streaming in the camera
sensor driver through the normal API anyway.

> I would stick with power on as it's the most secure side. Even if we 100% know
> we are _not_ streaming this LED should indicate that it may be turned on at any
> time, no?

Ideally, the privacy LED should be controlled automatically by the
hardware without software intervention, and should be wired to a camera
streaming signal. In many cases it's wired to the power rails instead,
which is extremely annoying. I'd rather avoid this annoyance when the
LED is GPIO-controlled.

-- 
Regards,

Laurent Pinchart
