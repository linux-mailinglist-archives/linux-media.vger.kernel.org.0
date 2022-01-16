Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B706D48FF71
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 23:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbiAPWUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 17:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236328AbiAPWUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 17:20:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7436C061574
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 14:20:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2897896;
        Sun, 16 Jan 2022 23:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642371618;
        bh=6zp8kU1N1uSB0W8GDBr+RBoe+ZsdTQKKm0CsujkIu40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eITCQa5rSOlQWKZWRpN5+NLMxKk1+Aq9ZfwYwnJZyxjan24CiZowCCNfWNK2eK9Gf
         3VCRtRSfblVW4OilDi0Wkkhe3UkwSW4eJq7BdgRc2RoPPbqP8U99GlGpiN5Tq8JMFY
         fuQHWAzIQ6lkqxmHacJ/hSR2C7DjThcMeNmBLhUU=
Date:   Mon, 17 Jan 2022 00:20:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Message-ID: <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sun, Jan 16, 2022 at 10:43:25PM +0100, Hans de Goede wrote:
> Hi All,
> 
> IIRC there was some discussion about $subject a while ago,
> esp. being pushed by the ChromeOS folks (IIRC). If you know what
> I'm talking about, please add relevant folks to the Cc.
> 
> While doing some work on atomisp support I noticed that the
> ACPI device fwnode-s describing the sensors have an ACPI _PLD
> method, which is a standardized ACPI method to retreive an
> package (ACPI for struct) describing the location of things
> like USB ports; and in this case of the camera sensors.
> 
> And upon checking the Surface Go DSDT the sensors there seem to
> have the _PLD bits to. And in both cases at least the following
> PLD field (bits 67-69) seems to contain valid and relevant info,
> quoting from the ACPI spec 6.2 version, page 329:
> 
> """
> Panel: Describes which panel surface of the system’s housing
> the device connection point resides on:
> 0 – Top
> 1 – Bottom
> 2 – Left
> 3 – Right
> 4 – Front
> 5 – Back
> 6 – Unknown
> """
> 
> This seems to be consistently set to 4 or 5 for the _PLD method
> of the sensor ACPI nodes which I checked.
> 
> So rather then defining a new devicetree property for this and
> embedding that inside the ACPI tables, IMHO it would be best if
> the ChromeOS devices would use the standardized _PLD ACPI method
> for this too.

I have no specific objection to this, given that the _PLD is
standardized. In your experience, is the rotation also populated
correctly ? That's important information too.

It we go in that direction, we should try to push OEMs to also populate
the vertical offset and horizontal offset fields, as I expect it to
become useful when multiple cameras are present in the same location.

-- 
Regards,

Laurent Pinchart
