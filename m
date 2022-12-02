Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F47C640554
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 11:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiLBKzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 05:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiLBKyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 05:54:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C723D3A01;
        Fri,  2 Dec 2022 02:54:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A51A4151A;
        Fri,  2 Dec 2022 11:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669978451;
        bh=EfqXfJP7HVIkPjlZTn4wpJnkg64Ke7T+U4+BsZFz5dM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OwU9mlCY4piTEoBbDJSpjpxrhhq2SPE7hjE3TxaKFZ9EzSzFram2bYnjeHY06Xu57
         1S2SWF6E+gVljz9XMtVrjDqgw47GEM0yskc5swNUt695o4k7FJhP/PLa/W/SgqFzH6
         XvamWOLkmmxXCH5xIOTmIYkda9gHMHMClalKLHEQ=
Date:   Fri, 2 Dec 2022 12:54:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 30, 2022 at 05:34:55PM +0100, Hans de Goede wrote:
> On 11/30/22 15:52, Sakari Ailus wrote:
> > On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
> >> On 11/30/22 14:41, Sakari Ailus wrote:
> >>> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
> >>>> Add support for a privacy-led GPIO.
> >>>>
> >>>> Making the privacy LED to controlable from userspace, as using the LED
> >>>> class subsystem would do, would make it too easy for spy-ware to disable
> >>>> the LED.
> >>>>
> >>>> To avoid this have the sensor driver directly control the LED.
> >>>>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>> Note an additional advantage of directly controlling the GPIO is that
> >>>> GPIOs are tied directly to consumer devices. Where as with a LED class
> >>>> device, there would need to be some mechanism to tie the right LED
> >>>> (e.g front or back) to the right sensor.
> >>>
> >>> Thanks for the patch.
> >>>
> >>> This approach has the drawback that support needs to be added for each
> >>> sensor separately. Any idea how many sensor drivers might need this?
> >>
> >> Quite a few probably. But as discussed here I plan to write a generic
> >> sensor_power helper library since many sensor drivers have a lot of
> >> boilerplate code to get clks + regulators + enable/reset gpios. The plan
> >> is to add support for a "privacy-led" to this library so that all sensors
> >> which use this get support for free.
> > 
> > I'm not sure how well this could be generalised. While most sensors do
> > something similar there are subtle differences. If those can be taken into
> > account I guess it should be doable. But would it simplify things or reduce
> > the number of lines of code as a whole?
> > 
> > The privacy LED is separate from sensor, including its power on/off
> > sequences which suggests it could be at least as well be handled
> > separately.
> > 
> >> Laurent pointed out that some sensors may have more complex power-up
> >> sequence demands, which is true. But looking at existing drivers
> >> then many follow a std simple pattern which can be supported in
> >> a helper-library.
> >>
> >>> Most implementations have privacy LED hard-wired to the sensor's power
> >>> rails so it'll be lit whenever the sensor is powered on.
> >>>
> >>> If there would be more than just a couple of these I'd instead create a LED
> >>> class device and hook it up to the sensor in V4L2.
> >>
> >> A LED cladd device will allow userspace to override the privacy-led
> >> value which is considered bad from a privacy point of view. This
> >> was actually already discussed here:
> >>
> >> https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
> >>
> >> See the part of the thread on the cover-letter with Dan, Laurent
> >> and me participating.
> >>
> >> And a LED class device also will be a challenge to bind to the right
> >> sensor on devices with more then one sensor, where as mentioned
> >> above using GPIO-mappings give us the binding to the right sensor
> >> for free.
> > 
> > Whether the privacy LED is controlled via the LED framework or GPIO doesn't
> > really matter from this PoV, it could be controlled via the V4L2 framework
> > in both cases. It might not be very pretty but I think I'd prefer that than
> > putting this in either drivers or some sensor power sequence helper
> > library.
> 
> In sensors described in ACPI, esp. the straight forward described sensors
> on atomisp2 devices, the GPIO resources inluding the LED one are listed
> as resources of the i2c_client for the sensor.
> 
> And in a sense the same applies to later IPU3 / IPU6 devices where there
> is a separate INT3472 device describing all the GPIOS which is also
> tied to a specific sensor and we currently map all the GPIOs from
> the INT3472 device to the sensor.
> 
> So it looks like that at least for x86/ACPI windows devices if the
> LED has its own GPIO the hardware description clearly counts that
> as part of the sensor's GPIOs. So the sensor driver has direct
> access to this, where as any v4l2 framework driver would needed
> to start poking inside the fwnode of the sensor which really
> isn't pretty.

Let me try to understand it better. Looking at the platforms you mention
above, it seems that the way to retrieve the GPIO is platform-specific,
isn't it ? Can the atomisp2 (is that IPU2 ?), IPU3 and IPU6 expose the
GPIO in the same way, or would we need code that, for instance, acquires
the GPIO through different names (or even different APIs) for the same
sensor on different platforms ?

> Where as if you look at this patch set adding the privacy-LED GPIO
> from the INT3472 (IPU3 / IPU6) to the sensor fwnode is a 1 line change.
> 
> This really by far is the most KISS solution and we have so much
> other things which need work that I believe that over-engineering
> this is not doing ourselves any favours.

-- 
Regards,

Laurent Pinchart
