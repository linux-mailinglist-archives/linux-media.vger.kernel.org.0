Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC6B63D925
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 16:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiK3PUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 10:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiK3PUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 10:20:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6137CA8E;
        Wed, 30 Nov 2022 07:20:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC192D8;
        Wed, 30 Nov 2022 16:20:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669821627;
        bh=hIOi8Sc38u7dB6vD6eJhqzXcrKP1cvsOXtQAVKEzmW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPMlUz/kwITYtWW+FomGWpGAEQrjeMwXtPLPaW/SckdDPPdxliY6CgyK5GYODOjFS
         4g6jcid8jOeQcsjqJXjSpIIaJebzg9Q7tCNkHv6CNRSvXlC0tlKREjfDU1DBExDicS
         RkjQbgKKv/4U33zVY1owTPFMIMQEocW71sp/hS7M=
Date:   Wed, 30 Nov 2022 17:20:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 02:52:50PM +0000, Sakari Ailus wrote:
> On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
> > On 11/30/22 14:41, Sakari Ailus wrote:
> > > On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
> > >> Add support for a privacy-led GPIO.
> > >>
> > >> Making the privacy LED to controlable from userspace, as using the LED
> > >> class subsystem would do, would make it too easy for spy-ware to disable
> > >> the LED.
> > >>
> > >> To avoid this have the sensor driver directly control the LED.
> > >>
> > >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > >> ---
> > >> Note an additional advantage of directly controlling the GPIO is that
> > >> GPIOs are tied directly to consumer devices. Where as with a LED class
> > >> device, there would need to be some mechanism to tie the right LED
> > >> (e.g front or back) to the right sensor.
> > > 
> > > Thanks for the patch.
> > > 
> > > This approach has the drawback that support needs to be added for each
> > > sensor separately. Any idea how many sensor drivers might need this?
> > 
> > Quite a few probably. But as discussed here I plan to write a generic
> > sensor_power helper library since many sensor drivers have a lot of
> > boilerplate code to get clks + regulators + enable/reset gpios. The plan
> > is to add support for a "privacy-led" to this library so that all sensors
> > which use this get support for free.
> 
> I'm not sure how well this could be generalised. While most sensors do
> something similar there are subtle differences. If those can be taken into
> account I guess it should be doable. But would it simplify things or reduce
> the number of lines of code as a whole?

While I think we need a camera sensor helper, I also doubt managing the
power sequence in the helper would help much. The privacy LED, however,
could be handled there.

> The privacy LED is separate from sensor, including its power on/off
> sequences which suggests it could be at least as well be handled
> separately.

And if the privacy LED is controllable through a GPIO, I think it should
be turned on at stream on time, not at power on time. That would allow
things like reading the OTP data from the sensor without flashing the
privacy LED.

> > Laurent pointed out that some sensors may have more complex power-up
> > sequence demands, which is true. But looking at existing drivers
> > then many follow a std simple pattern which can be supported in
> > a helper-library.
> > 
> > > Most implementations have privacy LED hard-wired to the sensor's power
> > > rails so it'll be lit whenever the sensor is powered on.
> > > 
> > > If there would be more than just a couple of these I'd instead create a LED
> > > class device and hook it up to the sensor in V4L2.
> > 
> > A LED cladd device will allow userspace to override the privacy-led
> > value which is considered bad from a privacy point of view. This
> > was actually already discussed here:
> > 
> > https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
> > 
> > See the part of the thread on the cover-letter with Dan, Laurent
> > and me participating.
> > 
> > And a LED class device also will be a challenge to bind to the right
> > sensor on devices with more then one sensor, where as mentioned
> > above using GPIO-mappings give us the binding to the right sensor
> > for free.
> 
> Whether the privacy LED is controlled via the LED framework or GPIO doesn't
> really matter from this PoV, it could be controlled via the V4L2 framework
> in both cases. It might not be very pretty but I think I'd prefer that than
> putting this in either drivers or some sensor power sequence helper
> library.

-- 
Regards,

Laurent Pinchart
