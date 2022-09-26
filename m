Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A2C5EAC9E
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 18:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiIZQeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 12:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiIZQdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 12:33:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9F411C14A
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 08:21:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 132B4107;
        Mon, 26 Sep 2022 17:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664205671;
        bh=mmdoqSWHRtOSBRTVVlMzfZ/cEVIDqhOXZ8M+vkFdFe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oq7Msn14L04AhVPCYIpdBPZ3rz55YiVUyuK524cOiC+cs4MKsFj15BDi5OzX2/R5v
         bigyeJEfv3VADDP+xXzTfR7NouU2346CbRXg0h1B2zmoJYEj1M45vYqx+yec6bEgdD
         qOF9KAFzb+GXy+a9GxdBct0Xr5ADGXpSd7I1UpVU=
Date:   Mon, 26 Sep 2022 18:20:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: RFC: Arducam 64 MP (Hawkeye)
Message-ID: <YzHDV49Hib+1WoZw@pendragon.ideasonboard.com>
References: <166392656967.56880.6892202016312600929@Monstersaurus>
 <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com>
 <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
 <166419478744.56880.10040121989379059431@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166419478744.56880.10040121989379059431@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Sep 26, 2022 at 01:19:47PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-09-23 14:42:52)
> > On Fri, Sep 23, 2022 at 10:03:19AM +0000, Sakari Ailus wrote:
> > > On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> > > > Hi Sakari, Laurent,
> > > > 
> > > > Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an RPi4,
> > > > and added the camera helper for the RaspberryPi IPA to libcamera, and
> > > > was able to use the camera directly with dtoverlay=arducam_64mp in the
> > > > Raspberry Pi /boot/config.txt using the latest release from Raspberry
> > > > Pi.
> > > > 
> > > > Raspberry Pi have already added the driver for this camera [1] to their
> > > > tree, and I have been given the tuning files from Arducam.
> > > > 
> > > > This has allowed me to capture an image with pretty good response to
> > > > changing lighting conditions, and colours. [2] ... The AF isn't yet
> > > > enabled, so that shot is out of focus a little. (That's for later).
> > > > 
> > > > Arducam do not wish to name the sensor used in the module, and have
> > > > called it the 'arducam_64mp'. But attempting to upstreaming this with
> > > > that name worries me.
> > > > 
> > > > Furthermore, we would like to maintain libcamera as supporting cameras
> > > > that have 'upstream' drivers (or drivers that are on their way
> > > > upstream), so I'm keen to identify how we can upstream the drivers to
> > > > create a better experience for users who are currently finding that they
> > > > need to run a fork of libcamera to operate the module.
> > > > 
> > > > So ultimately - my open question is ... Is it acceptable to have camera
> > > > drivers that are named by their 'module/integration' rather than their
> > > > sensor?
> > > 
> > > A lot of users (especially the existing ones) depend on the entity name
> > > currently. I don't think we could change it. For new ones I guess that
> > > would be possible.
> > > 
> > > Alternatively this could be a string control I think. That could be added
> > > to existing drivers as well.
> > 
> > The question here, as far as I understand, isn't about the entity name
> > exposed to userspace, but about the driver name. The entity name
> > certainly matters too.
> 
> Yes, it's "Can we support a module vendor abstracting an underlying
> device".
> 
> Ordinarily we'd expect this device to be supported through a compatible
> that directly references the component it supports.
> 
> Of course it's not the first time that vendors/ODM/OEM/SVs abstract a
> component to their own brand (There's plenty of in-silicon IP blocks
> with common bases, but separate implementations) but this case is a bit
> different because it's a direct integration of a sensor into a module.
> 
> A quick chat with Sakari tells me that we could potentially support this
> as a CCS/SMIA device. But that will probably just push the problem
> further into libcamera, as to how we directly identify which tuning file
> to use anyway! (So still an important part to consider, as matching on
> the sensor name for tuning data isn't sufficient in the first place).

Absolutely, and that's an issue that has been discussed already. We need
a way to identify camera modules in addition to camera sensors, with the
information provided in DT. Naming the module after Arducam, and
shipping a corresponding tuning file, is totally fine with me.

> > Camera sensor drivers we have in the mainline kernel are named after the
> > camera sensor model, and I think we should continue that. If this were a
> > custom silicon made by Arducam they could name it any way they want, but
> > if it's a sensor from a known sensor manufacturer, I don't think the
> > name should be hidden. I wouldn't be surprised if it would be possible
> > to identify the camera sensor relatively easily from the register set
> > anyway, which would render this whole game pointless.
> 
> We're already seeing Sony IMX drivers with support for more than one
> sensor, and multiple compatible strings. (Bryan O'Donoghue's recent work
> towards supporting IMX412, IMX577, and I think IMX477...)
> 
> I would like to see the sensor drivers becoming more generalised where
> possible, not more specific to individual modules. Of course there are
> differences between the different sensor models - but at the moment
> we're generating lots of drivers with huge distinct tables of register
> data...
> 
> The Sensor itself is common, and likely to be used in other products -
> so masking this as 'arducam_64mp' seems the wrong way forwards to me.
> 
> At some point we're going to want to support a mobile phone camera with
> the same sensor as this Arducam Module (which already exist) - and I
> don't think we want the phone to state it has an arducam module in those
> instances.
> 
> > One of the major advantages of upstreaming driver is the community
> > maintenance that you get from free, including improvements to the driver
> > from other developers who use the same camera sensor in a different
> > product. We don't want to have multiple drivers for the same hardware in
> > the mainline kernel, there are precedents for that due to historical
> > reasons (mostly people not realizing that the same IP core was used in
> > different SoCs), and there are efforts to fix that. I don't see a reason
> > to go the opposite way.
> > 
> > TL;DR: Unless there's a very compeling reason not to follow the usual
> > practice, I don't see why we should make an exception in this case.

-- 
Regards,

Laurent Pinchart
