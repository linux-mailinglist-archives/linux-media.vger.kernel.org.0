Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 640E85EA804
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 16:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbiIZOJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 10:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbiIZOJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 10:09:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D9F6DF9A
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 05:19:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AACE415;
        Mon, 26 Sep 2022 14:19:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664194789;
        bh=WQy9uaj2hYnpWAf4oOEQpR32jAL2fWs0gz6pJh7LHlQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Oya9TcSkpPrBhPEBQdBIF1igcuG4hClg4a9lt2WUGEwP5c/MsOKIUpIr65zHfsjIC
         UAib1IUlDb5zKMtlPp1g4pLni/Ktz74krhCJ5TXVPwk5Z8TdoQ6cwZwCzA0c9rGywZ
         wxZUqbphcPDC5McBURtT6IQz2BJ0iFiTsVJnRLHI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
References: <166392656967.56880.6892202016312600929@Monstersaurus> <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com> <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
Subject: Re: RFC: Arducam 64 MP (Hawkeye)
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Mon, 26 Sep 2022 13:19:47 +0100
Message-ID: <166419478744.56880.10040121989379059431@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-09-23 14:42:52)
> Hello,
>=20
> On Fri, Sep 23, 2022 at 10:03:19AM +0000, Sakari Ailus wrote:
> > On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> > > Hi Sakari, Laurent,
> > >=20
> > > Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an RP=
i4,
> > > and added the camera helper for the RaspberryPi IPA to libcamera, and
> > > was able to use the camera directly with dtoverlay=3Darducam_64mp in =
the
> > > Raspberry Pi /boot/config.txt using the latest release from Raspberry
> > > Pi.
> > >=20
> > > Raspberry Pi have already added the driver for this camera [1] to the=
ir
> > > tree, and I have been given the tuning files from Arducam.
> > >=20
> > > This has allowed me to capture an image with pretty good response to
> > > changing lighting conditions, and colours. [2] ... The AF isn't yet
> > > enabled, so that shot is out of focus a little. (That's for later).
> > >=20
> > > Arducam do not wish to name the sensor used in the module, and have
> > > called it the 'arducam_64mp'. But attempting to upstreaming this with
> > > that name worries me.
> > >=20
> > > Furthermore, we would like to maintain libcamera as supporting cameras
> > > that have 'upstream' drivers (or drivers that are on their way
> > > upstream), so I'm keen to identify how we can upstream the drivers to
> > > create a better experience for users who are currently finding that t=
hey
> > > need to run a fork of libcamera to operate the module.
> > >=20
> > > So ultimately - my open question is ... Is it acceptable to have came=
ra
> > > drivers that are named by their 'module/integration' rather than their
> > > sensor?
> >=20
> > A lot of users (especially the existing ones) depend on the entity name
> > currently. I don't think we could change it. For new ones I guess that
> > would be possible.
> >=20
> > Alternatively this could be a string control I think. That could be add=
ed
> > to existing drivers as well.
>=20
> The question here, as far as I understand, isn't about the entity name
> exposed to userspace, but about the driver name. The entity name
> certainly matters too.

Yes, it's "Can we support a module vendor abstracting an underlying
device".

Ordinarily we'd expect this device to be supported through a compatible
that directly references the component it supports.

Of course it's not the first time that vendors/ODM/OEM/SVs abstract a
component to their own brand (There's plenty of in-silicon IP blocks
with common bases, but separate implementations) but this case is a bit
different because it's a direct integration of a sensor into a module.


A quick chat with Sakari tells me that we could potentially support this
as a CCS/SMIA device. But that will probably just push the problem
further into libcamera, as to how we directly identify which tuning file
to use anyway! (So still an important part to consider, as matching on
the sensor name for tuning data isn't sufficient in the first place).


> Camera sensor drivers we have in the mainline kernel are named after the
> camera sensor model, and I think we should continue that. If this were a
> custom silicon made by Arducam they could name it any way they want, but
> if it's a sensor from a known sensor manufacturer, I don't think the
> name should be hidden. I wouldn't be surprised if it would be possible
> to identify the camera sensor relatively easily from the register set
> anyway, which would render this whole game pointless.

We're already seeing Sony IMX drivers with support for more than one
sensor, and multiple compatible strings. (Bryan O'Donoghue's recent work
towards supporting IMX412, IMX577, and I think IMX477...)

I would like to see the sensor drivers becoming more generalised where
possible, not more specific to individual modules. Of course there are
differences between the different sensor models - but at the moment
we're generating lots of drivers with huge distinct tables of register
data...

The Sensor itself is common, and likely to be used in other products -
so masking this as 'arducam_64mp' seems the wrong way forwards to me.

At some point we're going to want to support a mobile phone camera with
the same sensor as this Arducam Module (which already exist) - and I
don't think we want the phone to state it has an arducam module in those
instances.


> One of the major advantages of upstreaming driver is the community
> maintenance that you get from free, including improvements to the driver
> from other developers who use the same camera sensor in a different
> product. We don't want to have multiple drivers for the same hardware in
> the mainline kernel, there are precedents for that due to historical
> reasons (mostly people not realizing that the same IP core was used in
> different SoCs), and there are efforts to fix that. I don't see a reason
> to go the opposite way.
>=20
> TL;DR: Unless there's a very compeling reason not to follow the usual
> practice, I don't see why we should make an exception in this case.
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
