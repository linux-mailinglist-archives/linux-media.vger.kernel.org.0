Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9A8490B7C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240498AbiAQPf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 10:35:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbiAQPf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 10:35:57 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 126D6596;
        Mon, 17 Jan 2022 16:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642433754;
        bh=+0sC118Sqxrcy8++YCDmlivVP0FzUG/Me5JWU6u3sNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=izVqudxOc8ezO89d2nkLQ0lNms5sLOIvwd3QCWDLFz2tdeebwEPySzsg+tYbfvAjo
         2Yb1ApJZx8N4Gz5CJvK3JUtp7S1W0g5MBo6j2GxS57B/qdRyi5YZ1lV4CBSpxOUQ1E
         Qg8/w8jbWR5XNMaCD0jQeUyelwK3o7UNUOgFDiq4=
Date:   Mon, 17 Jan 2022 17:35:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Message-ID: <YeWMzbq70ZDcWUB2@pendragon.ideasonboard.com>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
 <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
 <179e8c32-a5f5-48a5-8410-e4f0a8f73bd2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179e8c32-a5f5-48a5-8410-e4f0a8f73bd2@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

(CC'ing Sakari)

On Mon, Jan 17, 2022 at 10:26:54AM +0100, Hans de Goede wrote:
> On 1/16/22 23:20, Laurent Pinchart wrote:
> > On Sun, Jan 16, 2022 at 10:43:25PM +0100, Hans de Goede wrote:
> >> Hi All,
> >>
> >> IIRC there was some discussion about $subject a while ago,
> >> esp. being pushed by the ChromeOS folks (IIRC). If you know what
> >> I'm talking about, please add relevant folks to the Cc.
> >>
> >> While doing some work on atomisp support I noticed that the
> >> ACPI device fwnode-s describing the sensors have an ACPI _PLD
> >> method, which is a standardized ACPI method to retreive an
> >> package (ACPI for struct) describing the location of things
> >> like USB ports; and in this case of the camera sensors.
> >>
> >> And upon checking the Surface Go DSDT the sensors there seem to
> >> have the _PLD bits to. And in both cases at least the following
> >> PLD field (bits 67-69) seems to contain valid and relevant info,
> >> quoting from the ACPI spec 6.2 version, page 329:
> >>
> >> """
> >> Panel: Describes which panel surface of the system’s housing
> >> the device connection point resides on:
> >> 0 – Top
> >> 1 – Bottom
> >> 2 – Left
> >> 3 – Right
> >> 4 – Front
> >> 5 – Back
> >> 6 – Unknown
> >> """
> >>
> >> This seems to be consistently set to 4 or 5 for the _PLD method
> >> of the sensor ACPI nodes which I checked.
> >>
> >> So rather then defining a new devicetree property for this and
> >> embedding that inside the ACPI tables, IMHO it would be best if
> >> the ChromeOS devices would use the standardized _PLD ACPI method
> >> for this too.
> > 
> > I have no specific objection to this, given that the _PLD is
> > standardized. In your experience, is the rotation also populated
> > correctly ? That's important information too.
> 
> That is a good question, so I just checked what the IPU3 does and
> it uses a field in the SSDB ACPI package for this.
> 
> And I'm not sure that the _PLD is the right place for this, the _PLD
> is about how the ACPI object appears to the user, so that
> the operating-system can describe e.g. external connectors in
> a dialog box using this info. E.g. the _PLD also contains information
> about the color of the connector.
> 
> And an upside-down sensor, does not look upside-down to the user when
> looking at it from the outside of the device. So based on this reading
> of the spec I don't expect the rotation field to contain what we are
> looking for (as is shown by the IPU3 driver using a SSDB field for this).

Your interpretation of the _PLD makes sense, but that's also the problem
with ACPI: there are many interpretation that make sense (at least to
the OEMs), leading to lack of standardization in practice :-S I suppose
I'm a bit concerned that the _PLD rotation, defined in the spec, would
be interpreted by some OEMs as being the right place to expose this
information, while others would use a different mechanism. I don't care
much about where the information ends up being stored, but I care about
avoiding proliferation of different solutions as much as possible.

One think I do *not* want to see is all sensor drivers being poluted
with OEM-specific code because an OEM has decided to store data using a
custom representation.

One question here is if we should try to fix this at the ACPI level, to
avoid every vendor coming up with its own SSDB-like solution, or leave
it as-is. In the latter case, I wouldn't be surprised if some OEMs would
end up not populating the location correctly in the _PLD. 

> > It we go in that direction, we should try to push OEMs to also populate
> > the vertical offset and horizontal offset fields, as I expect it to
> > become useful when multiple cameras are present in the same location.
> 
> That is a good point.
> 
> Note that my main reason for advertising using _PLD for the front/back
> info is that that is what is already being used in Windows laptops
> ACPI tables, so we need support for it regardless.

Is the information available in the SSDB too, or only in the _PLD ? In
the latter case, what should we do for systems that don't populate the
_PLD correctly ?

> Actually your rotation question made me wonder what we are doing
> for IPU3 here and we already have code parsing the _PLD in
> drivers/media/pci/intel/ipu3/cio2-bridge.c to set
> V4L2_FWNODE_ORIENTATION_FRONT / V4L2_FWNODE_ORIENTATION_BACK :)
> 
> Since at least atomisp2 is going to need this to we probably need to
> factor this out into some shared helper.

I wonder if the atomisp2 driver will ever get out of staging. There's so
much work to be done there.

-- 
Regards,

Laurent Pinchart
